# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

ARG B19_GCC_BASE_IMAGE=registry.invalid/b19/gcc-${B19_GCC_SERIES}:latest
ARG B19_NODE_SERIES=24
ARG B19_UBUNTU_SERIES=resolute
ARG B19_PYTHON_SERIES=3.14
ARG B19_PYTHON_BASE_IMAGE=registry.invalid/b19/python-${B19_PYTHON_SERIES}:latest
ARG B19_UBUNTU_BASE_IMAGE=registry.invalid/b19/ubuntu/${B19_UBUNTU_SERIES}:latest

FROM ${B19_PYTHON_BASE_IMAGE} AS b19-python-source
FROM ${B19_GCC_BASE_IMAGE} AS b19-node-builder

ARG B19_COMPILE_CACHE
ARG B19_NODE_SERIES
ARG B19_PYTHON_SERIES
ARG B19_COLOR
ARG B19_FETCH_DOCKER_CACHE
ARG B19_FETCH_LOCAL_CACHE
ARG B19_OFFGRID_MODE
ARG B19_VERBOSITY
ARG CCACHE_REMOTE_STORAGE
ARG LANG=""
ARG M6E_AI=N
ARG M6E_APT_CACHE_HOST=""
ARG M6E_APT_CACHE_PORT=""
ARG M6E_NAMESPACE
ARG M6E_NEAR_CACHE_HOST=""
ARG M6E_PROJECT
ARG NODE_ENV=production
ARG SCCACHE_REDIS_ENDPOINT
ARG TARGETARCH

# NodeJS build notoriously memory hungry
ENV B19_BUILD_PROC_RATIO=0.5

USER 0

WORKDIR ${B19_HOME}

# Copy dependencies, entrypoint, healthcheck and build scripts
COPY --chown=${B19_UID}:${B19_GID} .container/compile-gcc/       /

COPY --from=b19-python-source /usr/local/bin/python3*                              /opt/python/bin/
COPY --from=b19-python-source /usr/local/lib/python${B19_PYTHON_SERIES}/           /opt/python/lib/python${B19_PYTHON_SERIES}/

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                             \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}     \
    --mount=type=cache,target=${B19_COMPILE_CACHE_PATH},sharing=shared                              \
    --mount=type=cache,id=apt-cache-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/cache/apt,sharing=shared       \
    --mount=type=cache,id=apt-lists-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/lib/apt,sharing=shared         \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                      \
    build-stage compile-gcc

# hadolint ignore=DL3066 # B19_UID comes from the root
USER ${B19_UID}

FROM ${B19_UBUNTU_BASE_IMAGE} AS final

ARG B19_NODE_SERIES
ARG B19_COLOR
ARG B19_FETCH_DOCKER_CACHE
ARG B19_FETCH_LOCAL_CACHE
ARG B19_OFFGRID_MODE
ARG B19_VERBOSITY
ARG LANG=""
ARG M6E_AI=N
ARG M6E_APT_CACHE_HOST=""
ARG M6E_APT_CACHE_PORT=""
ARG M6E_NAMESPACE
ARG M6E_NEAR_CACHE_HOST=""
ARG M6E_PROJECT
ARG M6E_VERSION
ARG TARGETARCH

ENV APP_ENV=production                              \
    B19_NODE_DIST_PATH=${B19_HOME}/dist             \
    B19_NODE_SERIES="${B19_NODE_SERIES}"            \
    B19_NODE_NPM_CACHE="${XDG_CACHE_HOME}/npm"      \
    B19_NPM_AUTOINSTALL=Y                           \
    B19_NPM_BUILD_ENABLED=Y                         \
    B19_NPM_INSTALL_FORCE=N                         \
    B19_NPM_INSTALL_LEGACY_PEER_DEPS=N              \
    NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt \
    PATH="${PATH}:${B19_HOME}/node_modules/.bin"

COPY --from=b19-node-builder            /usr/local              /usr/local
COPY --from=b19-node-builder            /export/deps/           /deps/
COPY --chown=${B19_UID}:${B19_GID}      .container/base/                /

USER 0

WORKDIR ${B19_HOME}

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                               \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}       \
    --mount=type=cache,target=${B19_NODE_NPM_CACHE},sharing=locked,uid=${B19_UID},gid=${B19_GID}      \
    --mount=type=cache,id=apt-cache-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/cache/apt,sharing=shared         \
    --mount=type=cache,id=apt-lists-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/lib/apt,sharing=shared           \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                        \
    build-stage base

# hadolint ignore=DL3066 # B19_UID comes from the root
USER ${B19_UID}

COPY --chown=${B19_UID}:${B19_GID} .container/user/ /

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                               \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}       \
    --mount=type=cache,target=${B19_NODE_NPM_CACHE},sharing=locked,uid=${B19_UID},gid=${B19_GID}      \
    --mount=type=secret,id=npm.registry.host,uid=${B19_UID},gid=${B19_GID}                            \
    --mount=type=secret,id=npm.registry.password,uid=${B19_UID},gid=${B19_GID}                        \
    --mount=type=secret,id=npm.registry.username,uid=${B19_UID},gid=${B19_GID}                        \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                        \
    build-stage user


# ENTRYPOINT ["entrypoint.d"] is inherited
# HEALTHCHECK CMD ["healthcheck.d"] is inherited
# Don't use CMD ["sleep", "infinity"] here
