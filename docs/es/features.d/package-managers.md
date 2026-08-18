<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Gestores de paquetes fijados (npm, pnpm, corepack)

- npm, pnpm y corepack vienen preinstalados y con la versión fijada mediante archivos de texto declarativos (`global.npm.deps`).
- Corepack está activado, lo que da acceso bajo demanda a Yarn y pnpm sin instalación aparte.
- Las versiones de los gestores de paquetes son independientes del release de Node.js, lo que permite actualizarlas sin cambiar el runtime.
- La caché de npm se persiste como montaje de caché de BuildKit para reutilizarla entre compilaciones.

<!-- textlint-enable -->
