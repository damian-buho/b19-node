<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

<!-- pf-cli-managed: yes -->
# B19/Node

Node.js runtime compiled from source

[![License](https://img.shields.io/badge/license-MIT-4c1?style=flat-square)](LICENSE) [![PRs welcome](https://img.shields.io/badge/PRs-welcome-4c1?style=flat-square)](CONTRIBUTING.md) [![REUSE compliance](https://api.reuse.software/badge/codeberg.org/b19/node)](https://api.reuse.software/info/codeberg.org/b19/node)

![Project status](https://img.shields.io/badge/status-maintained-1d63ed?style=flat-square) [![Last commit](https://img.shields.io/gitea/last-commit/b19/node?gitea_url=https://codeberg.org&style=flat-square)](https://codeberg.org/b19/node)

[![Build status on kiota.ch](https://kiota.ch/b19/node/badges/workflows/published.yaml/badge.svg)](https://kiota.ch/b19/node/actions)

## Features

- Node.js compiled from source
- Automatic npm install and build
- Pinned package managers (npm, pnpm, corepack)
- Three-series Node.js family on a shared gcc + python toolchain

See [Features](FEATURES.md) for the full list.

## What this provides

- **Container image** `kiota.ch/b19/node-{B19_NODE_SERIES}:latest`

## Installation

Pull the published container image:

```sh
docker pull kiota.ch/b19/node-{B19_NODE_SERIES}:latest
```

## Usage

Build on top of this image:

```dockerfile
FROM kiota.ch/b19/node-{B19_NODE_SERIES}:latest
```

## Building

- [Makefile reference](docs/MAKEFILE.md)

Pipeline entry points:

- `make analyze` — Run the heavy analysis sweep (mutation testing, benchmarks)
- `make audited` — Re-scan the pinned dependencies and published artifacts for new vulnerabilities
- `make check-outdated` — Report every pinned dependency that lags upstream
- `make published` — Build, test, scan and publish the release artifacts

## Documentation

- [Known caveats](docs/caveats.md)

## Policies

- [How to contribute](CONTRIBUTING.md)
- [Security policy](SECURITY.md)
- [Getting support](SUPPORT.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)

## Links

### Project

- [B19/Node on Codeberg](https://codeberg.org/b19/node)
- [B19/Node on GitHub](https://github.com/damian-buho/b19-node)
- [B19/Node on kiota.ch](https://kiota.ch/b19/node)
- [Issues on Codeberg](https://codeberg.org/b19/node/issues)
- [Issues on GitHub](https://github.com/damian-buho/b19-node/issues)
- [Packages on npm](https://www.npmjs.com/package/node)

## License

This project is licensed under MIT — see the [LICENSE](LICENSE) file for details.
