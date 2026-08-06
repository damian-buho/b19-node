#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  npm --location=global   outdated || true
  npm --location=user     outdated || true
  npm --location=project  outdated || true
