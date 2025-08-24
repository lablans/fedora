#!/bin/bash

set -euo pipefail

for stepfile in steps/*.sh; do
  echo "Running step: $stepfile"
  source "$stepfile"
done

source finalize.sh
