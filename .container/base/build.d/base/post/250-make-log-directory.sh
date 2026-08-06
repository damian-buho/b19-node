#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  b19-run "NODE" "$(_p "Make %s directory" "${B19_HOME}/.npm/_logs")" --      \
    mkdir -p "${B19_HOME}/.npm/_logs"

  b19-run "NODE" "$(_p "Chown %s directory" "${B19_HOME}/.npm")" --     \
    chown -R "${B19_UID}:${B19_GID}" "${B19_HOME}/.npm"

