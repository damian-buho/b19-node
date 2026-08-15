<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

[English](../../FEATURES.md) · [Español](../es/FEATURES.md)

# Можливості

## Можливості проєкту

### Автоматичні npm install і build

- Якщо під час збирання присутній `package.json`, залежності встановлюються автоматично — `npm clean-install` за наявності lockfile, інакше `npm install`.
- Автентифікація в приватних npm-реєстрах виконується через секрети BuildKit під час збирання й ніколи не запікається в образ.
- Якщо в `package.json` є скрипт `build`, після встановлення автоматично запускається `npm run build`.
- Режим розробки (`APP_ENV=development`) включає dev-залежності; робочий режим їх виключає.
- Локальний `node_modules/.bin` додається до PATH, тож встановлені проєктом інструменти командного рядка одразу доступні.
- Поведінку встановлення можна налаштувати: режим force (`B19_NPM_INSTALL_FORCE`), legacy peer deps (`B19_NPM_INSTALL_LEGACY_PEER_DEPS`) і перемикач автовстановлення (`B19_NPM_AUTOINSTALL`).

### Зафіксовані менеджери пакетів (npm, pnpm, corepack)

- npm, pnpm і corepack попередньо встановлені та зафіксовані за версіями за допомогою декларативних текстових файлів (`global.npm.deps`).
- Corepack увімкнено — він дає доступ до Yarn і pnpm за потребою, без окремого встановлення.
- Версії менеджерів пакетів не залежать від релізу Node.js, тож їх можна оновлювати, не змінюючи середовище виконання.
- Кеш npm зберігається як кеш-монтування BuildKit для повторного використання між збираннями.
<!-- textlint-enable -->
