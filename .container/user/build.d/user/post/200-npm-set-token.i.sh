#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  # Load secrets into env vars (npm.registry_host -> NPM_REGISTRY_HOST)
  # shellcheck source=/dev/null
  . b19-load-secrets

  NPM_HOST="${NPM_REGISTRY_HOST:-}"
  NPM_USER="${NPM_REGISTRY_USERNAME:-}"
  NPM_PASS="${NPM_REGISTRY_PASSWORD:-}"

  if [ -n "${NPM_USER}" ] &&      \
     [ -n "${NPM_PASS}" ] &&      \
     [ -n "${NPM_HOST}" ]
  then
    TOKEN=$(printf '%s' "${NPM_USER}:${NPM_PASS}" | base64)
    if npm config set --location user "//${NPM_HOST}/:_auth=${TOKEN}" &&      \
       chmod 600 "$(npm config get userconfig)"
    then
      b19-log good "NPM" "$(_p "Authenticated on %s with %s" "${NPM_HOST}" "${NPM_USER}")"
      b19-run "NPM" "$(_p "Set registry as %s" "${NPM_HOST}")" --     \
        npm config set registry "https://${NPM_HOST}"
    else
      b19-log bad  "NPM" "$(_p "Can't authenticate on %s with %s" "${NPM_HOST}" "${NPM_USER}")"
    fi
  else
    b19-log info "NPM" "$(_ "NPM registry credentials not provided")"
  fi
