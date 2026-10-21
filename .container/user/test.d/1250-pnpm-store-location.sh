#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

set -eou pipefail

# pnpm must keep its store under the npm cache, never inside the shipped tree.
[ "${pnpm_config_store_dir:-}" = "${B19_NODE_NPM_CACHE}/pnpm-store" ] || {
  echo "FATAL: pnpm_config_store_dir is ${pnpm_config_store_dir:-}" >&2
  exit 1
}

grep -q "^store-dir=\${B19_NODE_NPM_CACHE}/pnpm-store$" "${XDG_CONFIG_HOME}/pnpm/rc" || {
  echo "FATAL: pnpm rc does not point store-dir at the npm cache" >&2
  exit 1
}
