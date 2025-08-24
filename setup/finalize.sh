#!/bin/bash
set -euo pipefail

rpm-ostree cleanup -m && ostree container commit