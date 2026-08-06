<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Pinned package managers (npm, pnpm, corepack)

- npm, pnpm, and corepack are preinstalled and version-pinned via declarative text files (`global.npm.deps`).
- Corepack is enabled, providing on-demand access to Yarn and pnpm without separate installation.
- Package manager versions are independent of the Node.js release, allowing updates without changing the runtime.
- npm cache is persisted as a BuildKit cache mount for reuse across builds.
