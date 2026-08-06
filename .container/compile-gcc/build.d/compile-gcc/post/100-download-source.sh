#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  cd "${B19_TEMP_PATH}" || exit

  M6E_SERIES="${B19_NODE_SERIES}"
  export M6E_SERIES
  eval "$(b19-resolve-dep node)"

  b19-fetch "NODE" "${M6E_UPSTREAM__URL}" "${M6E_UPSTREAM__FILE}" "${M6E_UPSTREAM__HASH}"

  b19-run "NODE" "$(_p "Extract %s" "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}")" --     \
    tar --extract                                                                     \
        --file "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}"                               \
        --use-compress-program pixz

