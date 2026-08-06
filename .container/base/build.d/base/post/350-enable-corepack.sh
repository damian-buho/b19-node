#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

b19-run "NPM" "$(_ "Enable corepack for yarn and pnpm")" --     \
  corepack enable
