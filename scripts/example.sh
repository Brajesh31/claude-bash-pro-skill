#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  printf 'Usage: %s <message>\n' "$0" >&2
  exit 2
fi

printf '%s\n' "$1"
