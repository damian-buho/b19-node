#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  # shellcheck source=/dev/null
  . b19-i18n

  TESTDIR="$(mktemp --directory)"
  trap 'rm --recursive --force "${TESTDIR}"' EXIT

  openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -nodes -days 1 -subj /CN=127.0.0.1 \
    -addext subjectAltName=IP:127.0.0.1 -keyout "${TESTDIR}/key.pem" -out "${TESTDIR}/cert.pem" 2>/dev/null

  # Serves one HTTPS request with the throwaway certificate and fetches it back
  cat > "${TESTDIR}/probe.js" <<'JS'
const fs = require("fs"), https = require("https"), dir = process.argv[2];
const server = https.createServer({ key: fs.readFileSync(`${dir}/key.pem`), cert: fs.readFileSync(`${dir}/cert.pem`) }, (_, res) => res.end("ok"));
server.listen(0, "127.0.0.1", () => {
  https.get(`https://127.0.0.1:${server.address().port}/`, (res) => { console.log("TRUSTED"); server.close(); res.resume(); })
    .on("error", (err) => { console.log(`REJECTED ${err.code}`); server.close(); });
});
JS

  RESULT="$(env --unset=NODE_EXTRA_CA_CERTS --unset=NODE_OPTIONS SSL_CERT_FILE="${TESTDIR}/cert.pem" node "${TESTDIR}/probe.js" "${TESTDIR}")"
  b19-assert equals "NODE" "TRUSTED" "${RESULT}"
  b19-log good "NODE" "$(_p "Default CA store is the system store (%s)" "${RESULT}")"
