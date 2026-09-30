<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

[English](../FEATURES.md) · [Українська](../uk/FEATURES.md)

# Características

## Características del proyecto

### Instalación automática de npm y build

- Las dependencias se instalan automáticamente cuando hay un `package.json` en el momento de la compilación — sin necesidad de configuración en el Dockerfile.
- La autenticación de registros privados se maneja mediante secretos de BuildKit, nunca incorporada a la imagen.
- Si existe un script `build`, se ejecuta automáticamente después de la instalación — las imágenes de producción salen listas.
- El modo de desarrollo incluye dependencias de desarrollo; el modo de producción las excluye.

### Gestores de paquetes fijados

- npm, pnpm y corepack están preinstalados y con versiones fijadas, de modo que las compilaciones son reproducibles.
- Corepack proporciona acceso bajo demanda a Yarn y pnpm sin instalación separada.
- Las versiones de los gestores de paquetes son independientes de la versión de Node.js, lo que permite actualizaciones sin cambiar el runtime.
<!-- textlint-enable -->
