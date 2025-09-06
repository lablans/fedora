#!/bin/bash

set -euo pipefail

echo "1. Installing RPM Fusion repositories..."

TRY=0
MAX_TRIES=100

while [[ $TRY -le $MAX_TRIES ]]; do
  ((TRY+=1))
  echo "Installing RPM Fusion (try $TRY / $MAX_TRIES)"
  if rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm; then
      break
  fi
done

# rpm-ostree update \
#     --uninstall $(rpm -q rpmfusion-free-release) \
#     --uninstall $(rpm -q rpmfusion-nonfree-release) \
#     --install rpmfusion-free-release \
#     --install rpmfusion-nonfree-release
