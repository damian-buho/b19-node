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

### La confianza en certificados sigue al almacén del sistema

- Node se compila para verificar TLS contra el almacén de confianza del sistema, no contra la copia de Mozilla integrada en el binario oficial.
- Una raíz eliminada del almacén del sistema, por Ubuntu o por la lista de desconfianza de b19, deja de ser de confianza al instante, sin esperar a una versión de Node.
- Los certificados añadidos al almacén del sistema son de confianza sin configurar `NODE_EXTRA_CA_CERTS`.
- `NODE_OPTIONS=--use-bundled-ca` vuelve a la copia integrada.
<!-- textlint-enable -->
