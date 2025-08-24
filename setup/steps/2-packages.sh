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

# Desktop Enhancements / Tools
# pkgs+=(
#   kbackup
# )

# Intel GPU
if [ "${VARIANT}" == "julia" ]; then
  pkgs+=(
    intel-media-driver
  )
fi

# AMD GPU
if [ "${VARIANT}" == "opa" ]; then
  pkgs+=(
    mesa-va-drivers-freeworld
  )
fi

echo "2. Installing packages for Variant \"${VARIANT}\": ${pkgs[*]}"

rpm-ostree install "${pkgs[@]}"
