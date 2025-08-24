#!/bin/bash

set -euo pipefail

pkgs=()
# Codec support
pkgs+=(
  libavcodec-freeworld
  heif-pixbuf-loader
  libheif-freeworld
  libheif-tools
)

# Bluetooth aptx support
pkgs+=(
  pipewire-codec-aptx
)

# Seadrive is not available as flatpak
pkgs+=(
  seadrive-gui
)

if [ "${VARIANT}" == "julia" ]; then
  pkgs+=(
    intel-media-driver
  )
fi

echo "2. Installing packages for Variant \"${VARIANT}\": ${pkgs[*]}"

rpm-ostree install "${pkgs[@]}"
