<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Зафіксовані менеджери пакетів (npm, pnpm, corepack)

- npm, pnpm і corepack попередньо встановлені та зафіксовані за версіями за допомогою декларативних текстових файлів (`global.npm.deps`).
- Corepack увімкнено — він дає доступ до Yarn і pnpm за потребою, без окремого встановлення.
- Версії менеджерів пакетів не залежать від релізу Node.js, тож їх можна оновлювати, не змінюючи середовище виконання.
- Кеш npm зберігається як кеш-монтування BuildKit для повторного використання між збираннями.

<!-- textlint-enable -->
