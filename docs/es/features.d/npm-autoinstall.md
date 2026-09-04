<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Instalación automática de npm y build

- Las dependencias se instalan automáticamente cuando hay un `package.json` en el momento de la compilación — sin necesidad de configuración en el Dockerfile.
- La autenticación de registros privados se maneja mediante secretos de BuildKit, nunca incorporada a la imagen.
- Si existe un script `build`, se ejecuta automáticamente después de la instalación — las imágenes de producción salen listas.
- El modo de desarrollo incluye dependencias de desarrollo; el modo de producción las excluye.

<!-- textlint-enable -->
