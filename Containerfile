ARG FEDORA_MAJOR_VERSION=42

FROM scratch AS setup

COPY /setup /

FROM quay.io/fedora-ostree-desktops/kinoite:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /

RUN --mount=type=bind,from=setup,src=/,dst=/setup \
    cd /setup && ./setup.sh
