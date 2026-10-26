# About this fork

This repository is the Claude Code build of pstack by Lauren Tan, copied from [`cursor/plugins`](https://github.com/cursor/plugins) at `harness/pstack/claude-code`. It is MIT licensed, and `LICENSE` keeps the original copyright. The upstream commit it matches is in `UPSTREAM`.

## Differences from upstream

- Model defaults that named a non-Claude model read `inherit-parent`. The Claude Code adapter already mapped them to the session model, so behaviour in Claude Code is unchanged. Run `/pstack:setup-pstack` to choose real models per role.
- The bot UI skill and the links to it are removed, because it only serves a bot product this fork does not use.
- `scripts/check-banned-terms.sh` fails when the tree names an excluded model or product. CI runs it on every push and pull request.

## Taking upstream changes

Upstream changes come in only as a reviewed pull request:

1. On a new branch, run `scripts/pull-upstream.sh <upstream-sha>`. It applies the upstream diff since the commit in `UPSTREAM` with a three-way merge, skips the removed skill, updates `UPSTREAM` and runs the check.
2. Resolve conflicts and scrub any line the check reports.
3. Open a pull request that names both upstream commits.
