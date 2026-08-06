<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Three-series Node.js family on a shared gcc + python toolchain

- Three Node.js series are available — 22, 24, 26 — each compiled from source on the `b19/gcc` toolchain.
- Series is selected at build time via `B19_NODE_SERIES` (default `24`); each value publishes its own image tag `b19/node-{series}`.
- The CI build grid is declared as code in `projectfile.yaml` (`org.projectfile.ci.matrix.axes`): 24 and 26 are on the default sweep; 22 is buildable but off the default grid.
- Builder-stage lineage is constant across the whole family: `b19/python-{series}` supplies Node\\u2019s build tool, `b19/gcc-{series}` compiles, `b19/ubuntu` is the runtime base.
- `undici` is version-pinned per image in `global.npm.deps`, and a documented CVE suppression is recorded against that pin in `projectfile.yaml`.
- Builds target amd64 only — V8's memory footprint makes a multi-arch compile impractical in CI.
