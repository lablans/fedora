#!/bin/bash

set -euo pipefail

if [ "${VARIANT}" == "julia" ]; then
  pkgs+=(
    clevis
    clevis-dracut
    clevis-luks
    clevis-systemd
    clevis-udisks2
  )
# The following is not necessary as the vendor-shipped initrd already contains the req'd module.
#  echo 'add_dracutmodules+=" systemd-pcrphase "' \
#    > /etc/dracut.conf.d/15-systemd-pcrphase.conf
fi
