#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  # shellcheck source=/dev/null
  . b19-i18n

  TESTDIR=$(mktemp -d)

  NODE_VERSION=$(node --version)

  echo 'console.log("ok");' > "${TESTDIR}/test.js"
  node "${TESTDIR}/test.js"

  node -e "console.log('ok')"

  b19-log good "NODE" "$(_p "node-%s runtime test passed" "${NODE_VERSION}")"

  rm -rf "${TESTDIR}"
