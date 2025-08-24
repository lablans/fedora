#!/bin/bash
set -euo pipefail

echo "Finalizing..."

rpm-ostree cleanup -m && ostree container commit