---
name: setup-ktlint-hook
description: Register the ktlint PostToolUse hook in this project's .claude/settings.json. Creates a stable symlink so the hook path never needs to change when the plugin updates.
---

The base directory for this skill is shown at the top of this invocation (e.g.
`/root/.claude/plugins/cache/oliver-plugins/ktlint-formatter/1.0.1/skills/setup-ktlint-hook`).

**Step 1 — Derive the versioned hook script path**

Navigate two directories up from the base directory to reach the plugin root, then append
`hooks/ktlint-format.sh`. For example:
`/root/.claude/plugins/cache/oliver-plugins/ktlint-formatter/1.0.1/hooks/ktlint-format.sh`

**Step 2 — Create a stable symlink**

Run the following, substituting the derived path from Step 1:

```bash
mkdir -p "$HOME/.local/bin"
ln -sf <absolute-path-to-ktlint-format.sh> "$HOME/.local/bin/ktlint-format.sh"
```

This creates a fixed, version-independent path at `$HOME/.local/bin/ktlint-format.sh`.
Re-running after a plugin update simply updates the symlink target — `settings.json`
never needs to change again.

**Step 3 — Register the hook in `.claude/settings.json`**

Merge the following into `.claude/settings.json` in the current project, preserving any
existing content. Expand `$HOME` to its actual value (e.g. `/root`):

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "/root/.local/bin/ktlint-format.sh"
          }
        ]
      }
    ]
  },
  "permissions": {
    "allow": [
      "Bash(/root/.local/bin/ktlint-format.sh)"
    ]
  }
}
```

After writing, confirm the hook is active. The symlink means this path stays stable
across all future plugin version updates — only the symlink target needs updating,
which this skill handles automatically.
