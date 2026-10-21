#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  cd "${B19_TEMP_PATH}/node-v${M6E_UPSTREAM_VERSION}" || exit

  # Configure is a one-shot probe (assembler, compiler, …), not a repeatable
  # compile worth caching. Its cold probe forces an sccache miss→persist into
  # the BuildKit cache mount, which EBUSY-fails (os error 16) and crashes the
  # probe → "Did not find a new enough assembler". Drop the compile-cache
  # shims from PATH for configure only; the real build below stays cached.
  (
    PRISTINE_PATH="$(echo "${PATH}" | tr ':' '\n' | grep -v '/usr/local/lib/compile-cache' | paste -sd ':' -)"
    b19-log warn "NODE" "$(_p "configure probe with compile-cache off (was %s)" "${B19_COMPILE_CACHE:-<unset>}")"
    PATH="${PRISTINE_PATH}" b19-run "NODE" "$(_ "Configure")" --  ./configure --openssl-use-def-ca-store
  )
  b19-run "NODE" "$(_ "Build")" --      make
  b19-run "NODE" "$(_ "Install")" --    make install

  b19-run "NODE" "$(_p "Remove %s" "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}")" --      \
    rm "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}"
