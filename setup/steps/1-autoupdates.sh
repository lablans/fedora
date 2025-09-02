#!/bin/bash

set -euo pipefail

systemctl enable rpm-ostreed-automatic.timer report-updates.timer

sed -i 's/^.*AutomaticUpdatePolicy=.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
