<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
pf-cli-managed: yes
-->

<!-- textlint-disable terminology,common-misspellings -->

[English](../../README.md) · [Español](../es/README.md)

# B19 / Node

Дистрибуція Node.js з підтримкою спільноти, зібрана на основі B19/Ubuntu. Цей репозиторій містить лише пакування — Dockerfile, скрипти збирання та конфігурацію, усе під ліцензією MIT; вихідний код Node.js отримують під час збирання, і він зберігає власну ліцензію.

[![Stand with Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://damian-buho.github.io/support-ukraine/) [![Projectfile inside](https://badges.kiota.ch/static/v1?label=projectfile&message=inside&labelColor=0d0d0d&color=8c6723&style=flat-square)](https://projectfile.org) [![License](https://badges.kiota.ch/static/v1?label=license&message=MIT&color=1e5913&style=flat-square)](LICENSE)

![Project status](https://badges.kiota.ch/static/v1?label=status&message=maintained&color=1d63ed&style=flat-square) [![Last commit on kiota.ch](https://badges.kiota.ch/gitea/last-commit/b19/node?gitea_url=https://kiota.ch&label=last%20commit%20on%20kiota.ch&style=flat-square)](https://kiota.ch/b19/node)

[![Publish pipeline on kiota.ch](https://kiota.ch/b19/node/badges/workflows/published.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Vulnerability audit on kiota.ch](https://kiota.ch/b19/node/badges/workflows/audited.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Dependency freshness on kiota.ch](https://kiota.ch/b19/node/badges/workflows/check-outdated.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions) [![Analysis sweep on kiota.ch](https://kiota.ch/b19/node/badges/workflows/analyze.yaml/badge.svg?style=flat-square)](https://kiota.ch/b19/node/actions)

## Можливості

- Автоматична встановлення npm та збірка
- Зафіксовані менеджери пакетів

Див. [Можливості](FEATURES.md), щоб переглянути повний перелік.

## Що надає цей проєкт

- **Образ контейнера** `kiota.ch/b19/node:24`
- **Образ контейнера** `kiota.ch/b19/node:26`

## Підтримувані платформи

- `linux/amd64`

## Встановлення

Завантажте опублікований образ контейнера:

```sh
docker pull kiota.ch/b19/node:24
```

Серія: `24` | `26`

Стабільні випуски також публікують теґи `X.Y.Z`, `X.Y` і `X` — завантажте той рівень точності, який хочете зафіксувати.

## Використання

Побудуйте на основі цього образу:

```dockerfile
FROM kiota.ch/b19/node:24
```

Серія: `24` | `26`

Для рекомендованого багатоетапного шаблону та системи хуків збірки (build.d) створіть похідний проєкт за допомогою `b19/scripts/scaffold.sh` з [m6e/b19](https://kiota.ch/m6e/b19).

## Збирання

Зберіть образ контейнера локально:

```sh
make container-build
```

- [Довідник із Makefile](../how-to/MAKEFILE.md)

Виконайте `make` без аргументів для типової цілі; виконайте `make help`, щоб переглянути всі цілі.

Для локального циклу розробки `make dev-container` піднімає dev-container.

Точки входу конвеєра:

- `make analyze` — Запускає важкий аналіз (мутаційне тестування, бенчмарки)
- `make audited` — Повторно сканує закріплені залежності й опубліковані артефакти на нові вразливості
- `make check-outdated` — Звітує про кожну закріплену залежність, що відстає від upstream
- `make ready-to-publish` — Запускає псевдо-CI локально — збирає, тестує й сканує без публікації

## Політики

- [Як зробити внесок](CONTRIBUTING.md)
- [Політика безпеки](SECURITY.md)
- [Як отримати підтримку](SUPPORT.md)
- [Кодекс поведінки](CODE_OF_CONDUCT.md)
- [Політика щодо ШІ та LLM](AI_POLICY.md)

## Посилання

- [Специфікація Projectfile](https://projectfile.org)

## Ліцензія

Цей проєкт ліцензовано на умовах MIT — див. файл [LICENSE](LICENSE) для подробиць.

<!-- textlint-enable -->
