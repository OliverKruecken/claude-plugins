---
name: setup-ktlint-hook
description: Register the ktlint PostToolUse hook in this project's .claude/settings.json. The hook self-installs the ktlint binary on first use — no manual install required.
---

Add a PostToolUse hook to `.claude/settings.json` in the current project that runs
`~/.claude/plugins/ktlint-formatter/hooks/ktlint-format.sh` after every Edit or Write.
Also add the Bash permission `Bash(./gradlew :backend:ktlintFormat --quiet)` to the
permissions.allow list so the hook fires without a prompt.

The hook self-installs ktlint into `~/.claude/plugins/ktlint-formatter/bin/ktlint` on
first use using the version in `~/.claude/plugins/ktlint-formatter/VERSION` — no manual
binary installation needed.

Merge this into `.claude/settings.json` (do not overwrite existing content):
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/plugins/ktlint-formatter/hooks/ktlint-format.sh"
          }
        ]
      }
    ]
  },
  "permissions": {
    "allow": [
      "Bash(bash ~/.claude/plugins/ktlint-formatter/hooks/ktlint-format.sh)"
    ]
  }
}
```

After writing, confirm the hook is active and tell the user that ktlint will be downloaded
automatically on the next `.kt` file edit.
