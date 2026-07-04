#!/bin/bash
PLUGIN_DIR="$(cd "$(dirname "$(readlink -f "$0")")/.." && pwd)"
KTLINT_VERSION="$(cat "$PLUGIN_DIR/VERSION")"
KTLINT_BIN="$PLUGIN_DIR/bin/ktlint"

if [[ ! -x "$KTLINT_BIN" ]]; then
  mkdir -p "$PLUGIN_DIR/bin"
  curl -sSLo "$KTLINT_BIN" \
    "https://github.com/pinterest/ktlint/releases/download/${KTLINT_VERSION}/ktlint"
  chmod +x "$KTLINT_BIN"
fi

file=$(jq -r '.tool_input.file_path // ""')
[[ "$file" == *.kt ]] && "$KTLINT_BIN" --format "$file" || true
