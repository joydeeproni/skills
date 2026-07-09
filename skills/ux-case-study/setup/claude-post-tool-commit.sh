#!/bin/sh
# Claude Code PostToolUse hook (matcher: Bash). Install in .claude/hooks/ and
# reference it from .claude/settings.json (see settings.snippet.json).
# When a `git commit` runs, nudge the assistant to update the UX case study.
input="$(cat)"
cmd="$(printf '%s' "$input" | python3 -c 'import json,sys
try:
    d = json.load(sys.stdin)
    print(d.get("tool_input", {}).get("command", ""))
except Exception:
    print("")' 2>/dev/null)"

case "$cmd" in
  *"git commit"*)
    msg="A commit just landed. Invoke the ux-case-study skill to read the pending commit(s) and extend the UX case study in Notion."
    printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":%s}}' \
      "$(printf '%s' "$msg" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))')"
    ;;
  *) : ;;
esac
exit 0
