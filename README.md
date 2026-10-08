<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
pf-cli-managed: yes
-->

[Español](docs/es/README.md) · [Українська](docs/uk/README.md)

# B19 / Node

Community-maintained distribution of Node.js built on B19/Ubuntu. This repository holds only the packaging — Dockerfile, build scripts, and configuration, all MIT-licensed; the upstream Node.js is fetched at build time and retains its own licensing.

[![Stand with Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://damian-buho.github.io/support-ukraine/) [![Projectfile inside](https://badges.kiota.ch/static/v1?label=projectfile&message=inside&labelColor=0d0d0d&color=8c6723&style=flat-square)](https://projectfile.org) [![License](https://badges.kiota.ch/static/v1?label=license&message=MIT&color=1e5913&style=flat-square)](LICENSE) [![Cosign](https://badges.kiota.ch/static/v1?label=cosign&message=enabled&color=1e5913&style=flat-square)](https://docs.sigstore.dev/cosign/verifying/verify/)

![Project status](https://badges.kiota.ch/static/v1?label=status&message=maintained&color=1d63ed&style=flat-square) [![Last commit on kiota.ch](https://badges.kiota.ch/gitea/last-commit/b19/node?gitea_url=https://kiota.ch&label=last%20commit%20on%20kiota.ch&style=flat-square)](https://kiota.ch/b19/node)

[![Publish pipeline on kiota.ch](https://kiota.ch/b19/node/badges/workflows/published.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Vulnerability audit on kiota.ch](https://kiota.ch/b19/node/badges/workflows/audited.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Dependency freshness on kiota.ch](https://kiota.ch/b19/node/badges/workflows/check-outdated.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Analysis sweep on kiota.ch](https://kiota.ch/b19/node/badges/workflows/analyzed.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions)

## Features

- Automatic npm install and build
- Pinned package managers

See [Features](docs/FEATURES.md) for the full list.

## What this provides

- **Container image** `kiota.ch/b19/node:n24`
- **Container image** `kiota.ch/b19/node:n26`

## Supported platforms

- `linux/amd64`

## Installation

Pull the published container image:

```sh
docker pull kiota.ch/b19/node:n24
```

Series: `n24` | `n26`

Stable releases also publish `X.Y.Z`, `X.Y` and `X` tags — pull the precision you want to pin.

## Usage

Build on top of this image:

```dockerfile
FROM kiota.ch/b19/node:n24
```

Series: `n24` | `n26`

For the recommended multi-stage pattern and the build-hook system (build.d), scaffold a derivative with `b19/scripts/scaffold.sh` from [m6e/b19](https://kiota.ch/m6e/b19).

## Building

Build the container image locally:

```sh
make container-build
```

- [Makefile reference](docs/how-to/MAKEFILE.md)

Run `make` with no arguments for the default target; run `make help` to list every target.

For the local dev loop, `make dev-container` brings up the dev-container.

Pipeline entry points:

- `make analyzed` — Run the heavy analysis sweep (mutation testing, benchmarks)
- `make audited` — Re-scan the pinned dependencies and published artifacts for new vulnerabilities
- `make check-outdated` — Report every pinned dependency that lags upstream
- `make ready-to-publish` — Run the pseudo-CI pipeline locally — build, test and scan, without publishing

## Policies

- [How to contribute](CONTRIBUTING.md)
- [Security policy](SECURITY.md)
- [Getting support](SUPPORT.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [AI and LLM Policy](AI_POLICY.md)

## Links

- [Projectfile Specification](https://projectfile.org)

## License

This project is licensed under MIT — see the [LICENSE](LICENSE) file for details.
