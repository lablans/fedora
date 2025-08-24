#!/bin/bash

set -euo pipefail

for stepfile in steps/*.sh; do
  echo "Running step: $stepfile"
  bash "$stepfile"
done

echo "Finalizing..."

source finalize.sh
