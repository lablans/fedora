#!/bin/bash

set -euo pipefail

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

# Intel GPU
if [ "${VARIANT}" == "julia" ]; then
  pkgs+=(
    intel-media-driver
  )
fi

# Full Drive Encryption (luks)
# see other shell script

# Seafile client (would be available as flatpak as well)
if [ "${VARIANT}" == "julia" ]; then
  pkgs+=(
    seafile-client
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
