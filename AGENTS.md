<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# b19/node

Docker image built on [b19/python](../python/AGENTS.md), [b19/gcc](../gcc/AGENTS.md), and [b19/Ubuntu](../ubuntu/AGENTS.md)

Node.js runtime compiled from source.

## Key facts

- Builder stages: `b19/python-{series}` (Python for Node’s build tool) + `b19/gcc-{series}`
- Final base: `b19/ubuntu/${B19_UBUNTU_SERIES}`
- Series: 24, 26 (optional: 22)
- Image name: `b19/node-{series}`
- Arch: amd64 only

## ENV

- `B19_BUILD_PROC_RATIO=0.5` (lowest ratio — V8 compile is memory-hungry)
- `B19_NPM_AUTOINSTALL=Y` — auto-runs `npm install` if `package.json` detected
- `B19_NPM_BUILD_ENABLED=Y` — auto-runs `npm run build` if script exists
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

Consuming projects MUST approve per package, after `npm ci` (approval needs the
package installed), then rebuild it — and assert the result:

```sh
npm ci && npm install-scripts approve <pkg> && npm rebuild <pkg>
```

Approve one package at a time. `--dangerously-allow-all-scripts` arms the whole tree.

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
