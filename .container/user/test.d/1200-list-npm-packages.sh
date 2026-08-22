#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  npm list --location=global
  # A yarn/pnpm-managed or partially-installed tree is inconsistent by npm's
  # reckoning, so this inventory reports it rather than failing on it.
  npm list --location=project || true
