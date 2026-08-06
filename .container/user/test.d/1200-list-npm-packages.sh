#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  npm list --location=global
  npm list --location=user
  npm list --location=project 2>/dev/null || true
