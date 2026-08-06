<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Known caveats

## sccache + configure assembler probe

Node’s `./configure` runs one-shot capability probes (assembler, compiler).
Under `B19_COMPILE_CACHE=sccache` with a remote backend (Redis), a cold probe
forces an sccache miss→persist into the BuildKit `--mount=type=cache`, which
can `EBUSY`-fail (os error 16) and crash the probe — surfacing as:

```text
ERROR: Did not find a new enough assembler, install one or build with
       --openssl-no-asm.
```

The fix is local to this project: `500-build-node.sh` drops the compile-cache
shims from `PATH` for `./configure` only (a probe is never worth caching); the
real `make` / `make install` still run under sccache.

A second-layer guard lives in `b19/gcc`’s `setup-build`: with a remote backend,
`SCCACHE_DIR` points at tmpfs instead of the cache mount, so the miss→store
write can’t `EBUSY` for `make` either. See [b19/gcc caveats](../gcc/docs/caveats.md).
