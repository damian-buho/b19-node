#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  # Docker TARGETARCH names to Node process.arch names
  case "${TARGETARCH:-}" in
    amd64)   npm_config_cpu=x64 ;;
    ppc64le) npm_config_cpu=ppc64 ;;
    "")      npm_config_cpu="$(node --print process.arch)" ;;
    *)       npm_config_cpu="${TARGETARCH}" ;;
  esac

  # Environment, not .npmrc: every npm call in the stage installs for this platform only
  export npm_config_os=linux npm_config_cpu npm_config_libc=glibc

  b19-log info "NPM" "$(_p "Install platform: os=%s cpu=%s libc=%s" "${npm_config_os}" "${npm_config_cpu}" "${npm_config_libc}")"
