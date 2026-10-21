<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# La confianza en certificados sigue al almacén del sistema

- Node se compila para verificar TLS contra el almacén de confianza del sistema, no contra la copia de Mozilla integrada en el binario oficial.
- Una raíz eliminada del almacén del sistema, por Ubuntu o por la lista de desconfianza de b19, deja de ser de confianza al instante, sin esperar a una versión de Node.
- Los certificados añadidos al almacén del sistema son de confianza sin configurar `NODE_EXTRA_CA_CERTS`.
- `NODE_OPTIONS=--use-bundled-ca` vuelve a la copia integrada.

<!-- textlint-enable -->
