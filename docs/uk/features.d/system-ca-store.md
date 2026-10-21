<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Довіра до сертифікатів слідує за системним сховищем

- Node зібрано так, щоб перевіряти TLS за системним сховищем довіри, а не за копією Mozilla, вбудованою в офіційний бінарний файл.
- Кореневий сертифікат, вилучений із системного сховища Ubuntu або списком недовіри b19, одразу втрачає довіру, без очікування нового випуску Node.
- Сертифікати, додані до системного сховища, отримують довіру без налаштування `NODE_EXTRA_CA_CERTS`.
- `NODE_OPTIONS=--use-bundled-ca` повертає вбудовану копію.

<!-- textlint-enable -->
