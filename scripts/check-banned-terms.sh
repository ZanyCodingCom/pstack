#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
if git grep --untracked -nIiE 'grok|xai|composer' -- . ':!scripts/check-banned-terms.sh'; then
  echo "Banned terms found. Remove them before merging. See FORK.md." >&2
  exit 1
fi
