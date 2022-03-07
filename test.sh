#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

eval "$(luarocks path --bin)"

for file in "$@"; do
  lua "$file"
done
