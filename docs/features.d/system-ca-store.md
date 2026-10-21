<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Certificate trust follows the system store

- Node is built to verify TLS against the system trust store, not the Mozilla copy compiled into the official binary.
- A root removed from the system store, by Ubuntu or by the b19 distrust list, stops being trusted at once, without waiting for a Node release.
- Certificates added to the system store are trusted with no `NODE_EXTRA_CA_CERTS` setup.
- `NODE_OPTIONS=--use-bundled-ca` returns to the compiled-in copy.
