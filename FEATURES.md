<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

[Español](docs/es/FEATURES.md) · [Українська](docs/uk/FEATURES.md)

# Features

## Project Features

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
