<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

[Español](es/FEATURES.md) · [Українська](uk/FEATURES.md)

# Features

## Project Features

### Automatic npm install and build

- Dependencies install automatically when a `package.json` is present at build time — no Dockerfile plumbing needed.
- Private registry authentication is handled via BuildKit secrets, never baked into the image.
- If a `build` script exists, it runs automatically after install — production images come out ready.
- Development mode includes dev dependencies; production mode excludes them.

### Pinned package managers

- npm, pnpm, and corepack are preinstalled and version-pinned, so builds are reproducible across runs.
- Corepack provides on-demand access to Yarn and pnpm without separate installation.
- Package manager versions are independent of the Node.js release, allowing updates without changing the runtime.

### Certificate trust follows the system store

- Node is built to verify TLS against the system trust store, not the Mozilla copy compiled into the official binary.
- A root removed from the system store, by Ubuntu or by the b19 distrust list, stops being trusted at once, without waiting for a Node release.
- Certificates added to the system store are trusted with no `NODE_EXTRA_CA_CERTS` setup.
- `NODE_OPTIONS=--use-bundled-ca` returns to the compiled-in copy.
