<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
pf-cli-managed: yes
-->

<!-- textlint-disable terminology,common-misspellings -->

[English](../../README.md) · [Українська](../uk/README.md)

# B19 / Node

Distribución de Node.js mantenida por la comunidad, construida sobre B19/Ubuntu. Este repositorio contiene únicamente el empaquetado — Dockerfile, scripts de compilación y configuración, todo con licencia MIT; el código original de Node.js se obtiene en tiempo de compilación y conserva su propia licencia.

[![Stand with Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://damian-buho.github.io/support-ukraine/) [![Projectfile inside](https://badges.kiota.ch/static/v1?label=projectfile&message=inside&labelColor=0d0d0d&color=8c6723&style=flat-square)](https://projectfile.org) [![License](https://badges.kiota.ch/static/v1?label=license&message=MIT&color=1e5913&style=flat-square)](LICENSE)

![Project status](https://badges.kiota.ch/static/v1?label=status&message=maintained&color=1d63ed&style=flat-square) [![Last commit on kiota.ch](https://badges.kiota.ch/gitea/last-commit/b19/node?gitea_url=https://kiota.ch&label=last%20commit%20on%20kiota.ch&style=flat-square)](https://kiota.ch/b19/node)

[![Publish pipeline on kiota.ch](https://kiota.ch/b19/node/badges/workflows/published.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Vulnerability audit on kiota.ch](https://kiota.ch/b19/node/badges/workflows/audited.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Dependency freshness on kiota.ch](https://kiota.ch/b19/node/badges/workflows/check-outdated.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Analysis sweep on kiota.ch](https://kiota.ch/b19/node/badges/workflows/analyze.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions)

## Características

- Instalación automática de npm y build
- Gestores de paquetes fijados

Consulta [Características](FEATURES.md) para ver la lista completa.

## Qué entrega este proyecto

- **Imagen de contenedor** `kiota.ch/b19/node-24:latest`
- **Imagen de contenedor** `kiota.ch/b19/node-26:latest`

## Plataformas admitidas

- `linux/amd64`

## Instalación

Descarga la imagen de contenedor publicada:

```sh
docker pull kiota.ch/b19/node-24:latest
```

Serie: `24` | `26`

Las versiones estables también publican las etiquetas `X.Y.Z`, `X.Y` y `X`: descarga el nivel de precisión que quieras fijar.

## Uso

Construye sobre esta imagen:

```dockerfile
FROM kiota.ch/b19/node-24:latest
```

Serie: `24` | `26`

Para el patrón multietapa recomendado y el sistema de hooks de compilación (build.d), genera un derivado con `b19/scripts/scaffold.sh` de [m6e/b19](https://kiota.ch/m6e/b19).

## Compilación

Construye la imagen de contenedor en local:

```sh
make container-build
```

- [Referencia del Makefile](../how-to/MAKEFILE.md)

Ejecuta `make` sin argumentos para el destino predeterminado; ejecuta `make help` para listar todos los destinos.

Para el bucle de desarrollo local, `make dev-container` levanta el dev-container.

Puntos de entrada de la canalización:

- `make analyze` — Ejecuta el análisis pesado (pruebas de mutación, benchmarks)
- `make audited` — Vuelve a escanear las dependencias fijadas y los artefactos publicados en busca de vulnerabilidades nuevas
- `make check-outdated` — Informa de cada dependencia fijada que va por detrás de su versión upstream
- `make ready-to-publish` — Ejecuta localmente el pipeline pseudo-CI — compila, prueba y escanea, sin publicar

## Políticas

- [Cómo contribuir](CONTRIBUTING.md)
- [Política de seguridad](SECURITY.md)
- [Cómo obtener ayuda](SUPPORT.md)
- [Código de conducta](CODE_OF_CONDUCT.md)
- [Política sobre IA y LLM](AI_POLICY.md)

## Enlaces

- [Especificación de Projectfile](https://projectfile.org)

## Licencia

Este proyecto se publica bajo la licencia MIT — consulta el archivo [LICENSE](LICENSE) para más detalles.

<!-- textlint-enable -->
