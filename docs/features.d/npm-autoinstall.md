<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Automatic npm install and build

- Dependencies install automatically when a `package.json` is present at build time — no Dockerfile plumbing needed.
- Private registry authentication is handled via BuildKit secrets, never baked into the image.
- If a `build` script exists, it runs automatically after install — production images come out ready.
- Development mode includes dev dependencies; production mode excludes them.
