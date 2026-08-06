<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Node.js compiled from source

- Node.js is built from upstream source using the `b19/gcc` toolchain, not installed from distribution packages.
- Python (from `b19/python`) is extracted into the builder stage for Node’s build tool -- only `python3*` binaries and stdlib are copied, not the full Python image.
- Build parallelism is throttled (`B19_BUILD_PROC_RATIO=0.5`) because the V8 compiler is memory-intensive.
- Multiple series available (24, 26; optional 22), selectable at build time via `B19_NODE_SERIES`.
- Builds for amd64 only.
