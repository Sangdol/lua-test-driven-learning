#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ -z "${1:-}" ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

eval "$(luarocks path --bin)"

for file in "$@"; do
  echo "Testing $file..."
  lua "$file"
done
