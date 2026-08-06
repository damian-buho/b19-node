<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

# Features

## Project Features

### Node.js compiled from source

- Node.js is built from upstream source using the `b19/gcc` toolchain, not installed from distribution packages.
- Python (from `b19/python`) is extracted into the builder stage for Node’s build tool -- only `python3*` binaries and stdlib are copied, not the full Python image.
- Build parallelism is throttled (`B19_BUILD_PROC_RATIO=0.5`) because the V8 compiler is memory-intensive.
- Multiple series available (24, 26; optional 22), selectable at build time via `B19_NODE_SERIES`.
- Builds for amd64 only.

### Automatic npm install and build

- If a `package.json` is present at build time, dependencies are automatically installed -- `npm clean-install` when a lockfile exists, `npm install` otherwise.
- Private npm registry authentication is handled via BuildKit secrets at build time, never baked into the image.
- If a `build` script exists in `package.json`, `npm run build` runs automatically after install.
- Development mode (`APP_ENV=development`) includes dev dependencies; production mode excludes them.
- Local `node_modules/.bin` is added to PATH, so project-installed command-line tools are immediately available.
- Install behavior is tunable: force mode (`B19_NPM_INSTALL_FORCE`), legacy peer deps (`B19_NPM_INSTALL_LEGACY_PEER_DEPS`), and auto-install toggle (`B19_NPM_AUTOINSTALL`).

### Pinned package managers (npm, pnpm, corepack)

- npm, pnpm, and corepack are preinstalled and version-pinned via declarative text files (`global.npm.deps`).
- Corepack is enabled, providing on-demand access to Yarn and pnpm without separate installation.
- Package manager versions are independent of the Node.js release, allowing updates without changing the runtime.
- npm cache is persisted as a BuildKit cache mount for reuse across builds.

### Three-series Node.js family on a shared gcc + python toolchain

- Three Node.js series are available — 22, 24, 26 — each compiled from source on the `b19/gcc` toolchain.
- Series is selected at build time via `B19_NODE_SERIES` (default `24`); each value publishes its own image tag `b19/node-{series}`.
- The CI build grid is declared as code in `projectfile.yaml` (`org.projectfile.ci.matrix.axes`): 24 and 26 are on the default sweep; 22 is buildable but off the default grid.
- Builder-stage lineage is constant across the whole family: `b19/python-{series}` supplies Node\\u2019s build tool, `b19/gcc-{series}` compiles, `b19/ubuntu` is the runtime base.
- `undici` is version-pinned per image in `global.npm.deps`, and a documented CVE suppression is recorded against that pin in `projectfile.yaml`.
- Builds target amd64 only — V8's memory footprint makes a multi-arch compile impractical in CI.
