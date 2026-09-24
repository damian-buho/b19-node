#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  ALLOW_SCRIPTS_DEPS="/deps/allow-scripts.npm.deps"

  if [ -f "${ALLOW_SCRIPTS_DEPS}" ]
  then
    mapfile -t ALLOW_SCRIPTS < <(decomment < "${ALLOW_SCRIPTS_DEPS}")
    ALLOW_SCRIPTS_LIST="$(IFS=,; printf '%s' "${ALLOW_SCRIPTS[*]}")"

    if [ -n "${ALLOW_SCRIPTS_LIST}" ]
    then
      # User npmrc: npm refuses --allow-scripts on the command line for project installs
      b19-run "NPM" "$(_p "Allow install scripts of %s" "${ALLOW_SCRIPTS_LIST}")" --     \
        npm config set --location=user "allow-scripts=${ALLOW_SCRIPTS_LIST}"
    else
      b19-log warn "NPM" "$(_p "%s lists no package, install scripts stay blocked" "${ALLOW_SCRIPTS_DEPS}")"
    fi
  else
    b19-log info "NPM" "$(_p "%s not found, install scripts stay blocked" "${ALLOW_SCRIPTS_DEPS}")"
  fi
