#!/usr/bin/env bash
set -euo pipefail
[ $# -eq 1 ] || { echo "usage: $0 <upstream-sha>" >&2; exit 2; }
cd "$(dirname "$0")/.."
old=$(cat UPSTREAM)
new=$1
git fetch -q --depth=1 https://github.com/cursor/plugins.git "$old" "$new"
git diff --binary "$old" "$new" -- harness/pstack/claude-code \
  | git apply --3way -p4 --exclude='skills/make-bot-ui/*' || true
git rev-parse "$new^{commit}" > UPSTREAM
scripts/check-banned-terms.sh || echo "Scrub the lines above by hand." >&2
git status --short
