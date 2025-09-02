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

echo "3. Removing packages"

pkgs_remove=(
  nvidia-gpu-firmware
  akonadi-server-mysql
  mariadb-server orca
  mariadb-gssapi-server
  mariadb-cracklib-password-check
  mariadb-backup
)

if [[ "${VARIANT}" == "julia" ]]; then
  pkgs_remove+=(
    amd-gpu-firmware
  )
fi

rpm-ostree uninstall "${pkgs_remove[@]}"
