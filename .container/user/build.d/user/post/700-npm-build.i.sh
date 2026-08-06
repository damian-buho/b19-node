#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  # Missing package.json is already reported by 500-npm-install.i.sh;
  # nothing to build here, so we silently skip.
  if [ -f package.json ]
  then
    if [ "${B19_NPM_BUILD_ENABLED:-Y}" == "Y" ]
    then
      if jq -e '.scripts.build' < package.json >/dev/null 2>&1;
      then
        b19-run "NPM" "$(_ "Build NPM project")" --  npm run build
      fi
    else
      b19-log warn "NPM" "$(_ "B19_NPM_BUILD_ENABLED is not Y, skipping build")"
    fi
  fi
