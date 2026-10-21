<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# b19/node

Docker image built on [b19/python](../python/AGENTS.md), [b19/gcc](../gcc/AGENTS.md), and [b19/Ubuntu](../ubuntu/AGENTS.md)

Node.js runtime compiled from source.

## Key facts

- Builder stages: `b19/python:{series}` (Python for Node’s build tool) + `b19/gcc:{series}`
- Final base: `b19/ubuntu:${B19_UBUNTU_SERIES}`
- Series: 24, 26 (optional: 22)
- Image name: `b19/node:{series}`
- Arch: amd64 only
- Configured with `--openssl-use-def-ca-store`: TLS verifies against the system store, so the b19 distrust cut reaches Node; `NODE_EXTRA_CA_CERTS` only adds to the compiled-in Mozilla copy and cannot remove a root. `test.d/1400-check-ca-store.sh` pins it offline

## ENV

- `B19_BUILD_PROC_RATIO=0.5` (lowest ratio — V8 compile is memory-hungry)
- `B19_NPM_AUTOINSTALL=Y` — auto-runs `npm install` if `package.json` detected
- `B19_NPM_BUILD_ENABLED=Y` — auto-runs `npm run build` if script exists
- `B19_NPM_INSTALL_DEVELOPMENT=Y` — include devDependencies in the install; the `APP_ENV=development` dev plane gets them regardless
- `PATH="${PATH}:${B19_HOME}/node_modules/.bin"`

## npm 12 blocks dependency install scripts

The image ships npm 12 (`npm 12.0.2` on node-24), which runs a dependency install
script only when the project approves it (`allowScripts`; config `allow-scripts-*`,
`dangerously-allow-all-scripts`). `ignore-scripts` stays `false` — the gate is the
allowlist, not that flag — so an install SUCCEEDS while silently skipping the script.

Any dependency that materializes a binary through its install script (`elm`,
`elm-format`, …) therefore leaves its **placeholder shim** in `node_modules`.
A shim that re-execs its own path turns every call into an unbounded self-spawn
(the o9s/alertmanager elm case: `pids.max` filled in ~1 minute, cgroup OOM, frozen
host). The install reports success, so nothing points at it.

Consuming projects list the packages to approve, one per line, in
`.container/user/deps/allow-scripts.npm.deps` (copied to `/deps/allow-scripts.npm.deps`).
`150-npm-allow-scripts.i.sh` writes them to the user `.npmrc` as `allow-scripts`
before any install, so `npm ci` runs those scripts itself. npm refuses
`--allow-scripts` and `npm_config_allow_scripts` in a project install
(`EALLOWSCRIPTS`), so `.npmrc` is the only place besides `package.json` `allowScripts`.
An absent file keeps every script blocked. Name packages one by one:
`--dangerously-allow-all-scripts` arms the whole tree. The same file drives
[b19/bun](../bun/AGENTS.md).

## npm `--os` / `--cpu` / `--libc`

`always/pre/100-npm-platform.i.sh` exports `npm_config_os=linux`,
`npm_config_cpu` (from `TARGETARCH`, else `process.arch`) and
`npm_config_libc=glibc` before every stage, so each npm call installs for the
image platform. Environment, not `.npmrc`: no project config changes. They pin
what is installed, not what is resolved — a tree still fetches every platform’s
manifest (`esbuild`: 16 foreign manifests either way). The win32/darwin lines in
build logs come from `--verbose`, which `install-npm-from-deps` passes only at
`B19_VERBOSITY=debug`.

## pnpm store and corepack cache

pnpm’s default store is `$XDG_DATA_HOME/pnpm/store`, inside `B19_HOME` and the data
volume, so a pnpm install would ship its store in the image. `pnpm_config_store_dir`
(pnpm 11+) and `/app/.config/pnpm/rc` (pnpm 10 and older, which ignore the variable)
both point it at `${B19_NODE_NPM_CACHE}/pnpm-store`, the BuildKit cache mount.
`npm_config_store_dir` is avoided: npm warns on the unknown key. `COREPACK_HOME` moves
corepack’s downloaded package managers there too, so none of it reaches an export.

## Private npm registry auth

Handled via BuildKit secrets at build time — not baked into the image.

## Includes

Makefile includes `python/versions.mk` in addition to `gcc` and `node` extensions.

## Documentation

- [Available make targets](@docs/MAKEFILE.md)
- [Known caveats and limitations](@docs/caveats.md)
- [Completed features](@docs/done.md)
- [Project fit and alignment](@docs/fit.md)
- [Project goals](@docs/goal.md)
- [Future roadmap](@docs/roadmap.md)
