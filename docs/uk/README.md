<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
pf-cli-managed: yes
-->

<!-- textlint-disable terminology,common-misspellings -->

[English](../../README.md) · [Español](../es/README.md)

# B19/Node

Дистрибуція Node.js з підтримкою спільноти на основі B19/Ubuntu

[![Stand with Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://damian-buho.github.io/support-ukraine/) [![License](https://img.shields.io/static/v1?label=license&message=MIT&color=4c1&style=flat-square)](LICENSE) ![Commit style](https://img.shields.io/static/v1?label=commits&message=conventional&color=blue&style=flat-square) ![Workflow](https://img.shields.io/static/v1?label=workflow&message=git-flow&color=blue&style=flat-square) ![Versioning](https://img.shields.io/static/v1?label=versioning&message=semantic&color=blue&style=flat-square) [![PRs welcome](https://img.shields.io/static/v1?label=PRs&message=welcome&color=4c1&style=flat-square)](CONTRIBUTING.md) [![Citation](https://img.shields.io/static/v1?label=citation&message=cff&color=blue&style=flat-square)](CITATION.cff) [![REUSE compliance](https://api.reuse.software/badge/codeberg.org/b19/node)](https://api.reuse.software/info/codeberg.org/b19/node)

![Project status](https://img.shields.io/static/v1?label=status&message=maintained&color=1d63ed&style=flat-square) [![Last commit](https://img.shields.io/gitea/last-commit/b19/node?gitea_url=https://codeberg.org&style=flat-square)](https://codeberg.org/b19/node)

[![Build status on kiota.ch](https://kiota.ch/b19/node/badges/workflows/published.yaml/badge.svg)](https://kiota.ch/b19/node/actions)

## Можливості

- Автоматичні npm install і build
- Зафіксовані менеджери пакетів (npm, pnpm, corepack)

Див. [FEATURES.md](FEATURES.md), щоб переглянути повний перелік.

## Що надає цей проєкт

- **Образ контейнера** `ghcr.io/damian-buho/b19/node-24:latest`
- **Образ контейнера** `ghcr.io/damian-buho/b19/node-26:latest`
- **Образ контейнера** `docker.io/damianbuho/b19-node-24:latest`
- **Образ контейнера** `docker.io/damianbuho/b19-node-26:latest`

## Встановлення

Завантажте опублікований образ контейнера:

```sh
docker pull ghcr.io/damian-buho/b19/node-24:latest
```

Доступні варіанти: B19_NODE_SERIES: 24, 26

```sh
docker pull ghcr.io/damian-buho/b19/node-26:latest
docker pull docker.io/damianbuho/b19-node-24:latest
docker pull docker.io/damianbuho/b19-node-26:latest
```

Якщо наведені вище реєстри недоступні, завантажте з джерела:

```sh
docker pull kiota.ch/b19/node-24:latest
```

Доступні варіанти: B19_NODE_SERIES: 24, 26

```sh
docker pull kiota.ch/b19/node-26:latest
```

## Використання

Побудуйте на основі цього образу:

```dockerfile
FROM ghcr.io/damian-buho/b19/node-24:latest
```

Доступні варіанти: B19_NODE_SERIES: 24, 26

```dockerfile
FROM ghcr.io/damian-buho/b19/node-26:latest
FROM docker.io/damianbuho/b19-node-24:latest
FROM docker.io/damianbuho/b19-node-26:latest
```

Для рекомендованого багатоетапного шаблону та системи хуків збірки (build.d) створіть похідний проєкт за допомогою `b19/scripts/scaffold.sh` з [m6e/b19](https://kiota.ch/m6e/b19).

## Збирання

- [Довідник із Makefile](../MAKEFILE.md)

Точки входу конвеєра:

- `make analyze` — Run the heavy analysis sweep (mutation testing, benchmarks)
- `make audited` — Re-scan the pinned dependencies and published artifacts for new vulnerabilities
- `make check-outdated` — Report every pinned dependency that lags upstream
- `make ready-to-publish` — Run the pseudo-CI pipeline locally — build, test and scan, without publishing

Виконайте `make` без аргументів для типової цілі; виконайте `make help`, щоб переглянути всі цілі.

Для локального циклу розробки `make dev-container` піднімає dev-container.

## Документація

- [Known caveats](../caveats.md)

## Політики

- [Як зробити внесок](CONTRIBUTING.md)
- [Політика безпеки](SECURITY.md)
- [Як отримати підтримку](SUPPORT.md)
- [Кодекс поведінки](CODE_OF_CONDUCT.md)

## Посилання

### Проєкт

- [Специфікація Projectfile](https://projectfile.org)
- [B19/Node на Codeberg](https://codeberg.org/b19/node)
- [B19/Node на GitHub](https://github.com/damian-buho/b19-node)
- [B19/Node на kiota.ch](https://kiota.ch/b19/node)
- [Issues на Codeberg](https://codeberg.org/b19/node/issues)
- [Issues на GitHub](https://github.com/damian-buho/b19-node/issues)
- [Packages on npm](https://www.npmjs.com/package/node)

### Інше

- [Від автора](https://dbuho.me)

## Ліцензія

Цей проєкт ліцензовано на умовах MIT — див. файл [LICENSE](LICENSE) для подробиць.

*Згенеровано з projectfile ([дізнатися як](https://projectfile.org/how-to/readme))*
<!-- textlint-enable -->
