#!/bin/bash

set -euo pipefail

# mkdir -p /etc/ssh/authorized_keys.d/root
# curl https://github.com/lablans.keys >> /etc/ssh/authorized_keys.d/root

systemctl enable sshd.service