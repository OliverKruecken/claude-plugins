---
name: setup-ktlint-hook
description: Register the ktlint PostToolUse hook in this project's .claude/settings.json. The hook self-installs the ktlint binary on first use — no manual install required.
---

The base directory for this skill is shown at the top of this invocation (e.g.
`/root/.claude/plugins/cache/oliver-plugins/ktlint-formatter/1.0.0/skills/setup-ktlint-hook`).

Derive the hook script path by navigating two directories up from that base directory to
reach the plugin root, then appending `hooks/ktlint-format.sh`. For example:
`/root/.claude/plugins/cache/oliver-plugins/ktlint-formatter/1.0.0/hooks/ktlint-format.sh`

Use that absolute path as the hook command (no `~` expansion — use the full path).

Merge the following into `.claude/settings.json` in the current project, preserving any
existing content, substituting the correct absolute hook script path:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "<absolute-path-to-ktlint-format.sh>"
          }
        ]
      }
    ]
  },
  "permissions": {
    "allow": [
      "Bash(<absolute-path-to-ktlint-format.sh>)"
    ]
  }
}
```

The hook self-installs ktlint into the plugin's `bin/` directory on first use using the
version in the plugin's `VERSION` file — no manual binary installation needed.

After writing, confirm the hook is active and tell the user that ktlint will be downloaded
automatically on the next `.kt` file edit.
