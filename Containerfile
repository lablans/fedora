ARG UPSTREAM_IMAGE
FROM scratch AS setup

COPY /setup /

FROM ${UPSTREAM_IMAGE} AS base
ENV VARIANT=base

COPY rootfs/ /

FROM base AS opa
ENV VARIANT=opa

RUN --mount=type=bind,from=setup,src=/,dst=/setup \
    cd /setup && VARIANT=${VARIANT} ./setup.sh

FROM base AS julia
ENV VARIANT=julia

RUN --mount=type=bind,from=setup,src=/,dst=/setup \
    cd /setup && VARIANT=${VARIANT} ./setup.sh
