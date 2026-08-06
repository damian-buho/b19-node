#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  # Load secrets into env vars (npm.registry_host -> NPM_REGISTRY_HOST)
  # shellcheck source=/dev/null
  . b19-load-secrets

  # Use secret-derived var, fall back to legacy
  B19_NPM_REGISTRY_HOST="${NPM_REGISTRY_HOST:-${B19_NPM_REGISTRY_HOST:-}}"

  if [ "${B19_NPM_AUTOINSTALL:-Y}" == "N" ]; then
    b19-log info "NPM" "$(_ "B19_NPM_AUTOINSTALL=N, skipping npm install")"
    return 0
  fi

  if [ -f package-lock.json ]
  then
    NPM_COMMAND="clean-install"
  else
    NPM_COMMAND="install"
  fi

  if [ -f package.json ]
  then
    NPM_OPTS=(--audit=false --fund=false --no-progress --prefer-dedupe)

    if [ "${APP_ENV:-}" == "development" ]
    then
      NPM_OPTS+=(--include=dev)
      b19-log info "NPM" "$(_ "Development dependencies enabled")"
    fi

    if [ "${B19_NPM_INSTALL_FORCE:-}" == "Y" ]
    then
      NPM_OPTS+=(--force)
      b19-log info "NPM" "$(_ "Force mode enabled")"
    fi

    if [ "${B19_NPM_INSTALL_LEGACY_PEER_DEPS:-}" == "Y" ]
    then
      NPM_OPTS+=(--legacy-peer-deps)
      b19-log info "NPM" "$(_ "Legacy peer deps enabled")"
    fi

    b19-log info "NPM" "$(_p "NPM options: %s" "${NPM_OPTS[*]}")"

    if [ -n "${B19_NPM_REGISTRY_HOST}" ]
    then
      b19-run "NPM" "$(_p "Install dependencies from %s" "${B19_NPM_REGISTRY_HOST}")" --      \
        npm "${NPM_COMMAND}" "${NPM_OPTS[@]}" --registry "https://${B19_NPM_REGISTRY_HOST}"
    else
      b19-run "NPM" "$(_ "Install dependencies from global repositories")" --     \
        npm "${NPM_COMMAND}" "${NPM_OPTS[@]}"
    fi
  else
    b19-log warn "NPM" "$(_p "package.json not found in %s, skipping install" "${B19_HOME}")"
  fi
