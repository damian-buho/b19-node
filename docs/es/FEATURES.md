<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

[English](../../FEATURES.md) · [Українська](../uk/FEATURES.md)

# Características

## Características del proyecto

### npm install y build automáticos

- Si hay un `package.json` en tiempo de compilación, las dependencias se instalan automáticamente: `npm clean-install` si existe un lockfile, `npm install` en caso contrario.
- La autenticación contra registros npm privados se gestiona mediante secretos de BuildKit en tiempo de compilación, nunca se hornea en la imagen.
- Si existe un script `build` en `package.json`, `npm run build` se ejecuta automáticamente tras la instalación.
- El modo desarrollo (`APP_ENV=development`) incluye las dependencias de desarrollo; el modo producción las excluye.
- El `node_modules/.bin` local se añade al PATH, así que las herramientas de línea de comandos instaladas por el proyecto quedan disponibles de inmediato.
- El comportamiento de instalación es configurable: modo force (`B19_NPM_INSTALL_FORCE`), legacy peer deps (`B19_NPM_INSTALL_LEGACY_PEER_DEPS`) y conmutador de autoinstalación (`B19_NPM_AUTOINSTALL`).

### Gestores de paquetes fijados (npm, pnpm, corepack)

- npm, pnpm y corepack vienen preinstalados y con la versión fijada mediante archivos de texto declarativos (`global.npm.deps`).
- Corepack está activado, lo que da acceso bajo demanda a Yarn y pnpm sin instalación aparte.
- Las versiones de los gestores de paquetes son independientes del release de Node.js, lo que permite actualizarlas sin cambiar el runtime.
- La caché de npm se persiste como montaje de caché de BuildKit para reutilizarla entre compilaciones.
<!-- textlint-enable -->
