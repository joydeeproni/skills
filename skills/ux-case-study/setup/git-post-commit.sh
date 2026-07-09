#!/bin/sh
# UX case-study capture. Install as .git/hooks/post-commit (chmod +x).
# Records every commit hash so the ux-case-study skill can write it up,
# even for commits made outside a Claude Code session.
root="$(git rev-parse --show-toplevel)"
dir="$root/.claude/casestudy"
mkdir -p "$dir"
git rev-parse HEAD >> "$dir/pending-commits.txt"
exit 0
