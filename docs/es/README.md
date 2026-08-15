<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
pf-cli-managed: yes
-->

<!-- textlint-disable terminology -->

[English](../../README.md) · [Українська](../uk/README.md)

# B19/Node

Node.js runtime compiled from source

[![Stand with Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://damian-buho.github.io/support-ukraine/) [![License](https://img.shields.io/static/v1?label=license&message=MIT&color=4c1&style=flat-square)](LICENSE) ![Commit style](https://img.shields.io/static/v1?label=commits&message=conventional&color=blue&style=flat-square) ![Workflow](https://img.shields.io/static/v1?label=workflow&message=git-flow&color=blue&style=flat-square) ![Versioning](https://img.shields.io/static/v1?label=versioning&message=semantic&color=blue&style=flat-square) [![PRs welcome](https://img.shields.io/static/v1?label=PRs&message=welcome&color=4c1&style=flat-square)](CONTRIBUTING.md) [![Citation](https://img.shields.io/static/v1?label=citation&message=cff&color=blue&style=flat-square)](CITATION.cff) [![REUSE compliance](https://api.reuse.software/badge/codeberg.org/b19/node)](https://api.reuse.software/info/codeberg.org/b19/node)

![Project status](https://img.shields.io/static/v1?label=status&message=maintained&color=1d63ed&style=flat-square) [![Last commit](https://img.shields.io/gitea/last-commit/b19/node?gitea_url=https://codeberg.org&style=flat-square)](https://codeberg.org/b19/node)

[![Build status on kiota.ch](https://kiota.ch/b19/node/badges/workflows/published.yaml/badge.svg)](https://kiota.ch/b19/node/actions)

## Características

- Automatic npm install and build
- Pinned package managers (npm, pnpm, corepack)

Consulta [FEATURES.md](../../FEATURES.md) para ver la lista completa.

## Qué entrega este proyecto

- **Imagen de contenedor** `ghcr.io/damian-buho/b19/node-24:latest`
- **Imagen de contenedor** `ghcr.io/damian-buho/b19/node-26:latest`
- **Imagen de contenedor** `docker.io/damianbuho/b19-node-24:latest`
- **Imagen de contenedor** `docker.io/damianbuho/b19-node-26:latest`

## Instalación

Descarga la imagen de contenedor publicada:

```sh
docker pull ghcr.io/damian-buho/b19/node-24:latest
```

Variantes disponibles: B19_NODE_SERIES: 24, 26

```sh
docker pull ghcr.io/damian-buho/b19/node-26:latest
docker pull docker.io/damianbuho/b19-node-24:latest
docker pull docker.io/damianbuho/b19-node-26:latest
```

Si los registros anteriores no están disponibles, descarga desde el origen:

```sh
docker pull kiota.ch/b19/node-24:latest
```

Variantes disponibles: B19_NODE_SERIES: 24, 26

```sh
docker pull kiota.ch/b19/node-26:latest
```

## Uso

Construye sobre esta imagen:

```dockerfile
FROM ghcr.io/damian-buho/b19/node-24:latest
```

Variantes disponibles: B19_NODE_SERIES: 24, 26

```dockerfile
FROM ghcr.io/damian-buho/b19/node-26:latest
FROM docker.io/damianbuho/b19-node-24:latest
FROM docker.io/damianbuho/b19-node-26:latest
```

Para el patrón multietapa recomendado y el sistema de hooks de compilación (build.d), genera un derivado con `b19/scripts/scaffold.sh` de [m6e/b19](https://kiota.ch/m6e/b19).

## Compilación

- [Referencia del Makefile](../MAKEFILE.md)

Puntos de entrada de la canalización:

- `make analyze` — Run the heavy analysis sweep (mutation testing, benchmarks)
- `make audited` — Re-scan the pinned dependencies and published artifacts for new vulnerabilities
- `make check-outdated` — Report every pinned dependency that lags upstream
- `make ready-to-publish` — Run the pseudo-CI pipeline locally — build, test and scan, without publishing

Ejecuta `make` sin argumentos para el destino predeterminado; ejecuta `make help` para listar todos los destinos.

Para el bucle de desarrollo local, `make dev-container` levanta el dev-container.

## Documentación

- [Known caveats](../caveats.md)

## Políticas

- [Cómo contribuir](CONTRIBUTING.md)
- [Política de seguridad](SECURITY.md)
- [Cómo obtener ayuda](SUPPORT.md)
- [Código de conducta](CODE_OF_CONDUCT.md)

## Enlaces

- [Especificación de Projectfile](https://projectfile.org)
- [B19/Node on Codeberg](https://codeberg.org/b19/node)
- [B19/Node on GitHub](https://github.com/damian-buho/b19-node)
- [B19/Node on kiota.ch](https://kiota.ch/b19/node)
- [Issues on Codeberg](https://codeberg.org/b19/node/issues)
- [Issues on GitHub](https://github.com/damian-buho/b19-node/issues)
- [Packages on npm](https://www.npmjs.com/package/node)

## Licencia

Este proyecto se publica bajo la licencia MIT — consulta el archivo [LICENSE](LICENSE) para más detalles.

*Generado desde projectfile ([saber cómo](https://projectfile.org/how-to/readme))*
<!-- textlint-enable -->
