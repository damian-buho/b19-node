#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  # NPM Doctor is dumb, workaround

  b19-run "SECURITY" "$(_p "Set owner %s:%s %s" "${B19_USER}" "${B19_GROUP}" "${B19_HOME}/.npm/")" --     \
    chown -R "${B19_USER}:${B19_GROUP}" "${B19_HOME}/.npm/"
