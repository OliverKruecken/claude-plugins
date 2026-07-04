# ktlint-formatter

A Claude Code plugin that auto-formats Kotlin files with [ktlint](https://github.com/pinterest/ktlint) after every edit.

## How it works

A `PostToolUse` hook fires whenever Claude edits or writes a `.kt` file. The ktlint binary is downloaded automatically on first use — no manual installation required.

## Installation

```
/plugin marketplace add OliverKruecken/ktlint-formatter
/plugin install ktlint-formatter@ktlint-formatter
```

Then register the hook in your project once:

```
/ktlint-formatter:setup-ktlint-hook
```

## ktlint version

The pinned version is in [`VERSION`](./VERSION). To upgrade, update that file and delete `bin/ktlint` — it will be re-downloaded on the next edit.

## License

This plugin is released under the MIT License.

It downloads and invokes [ktlint](https://github.com/pinterest/ktlint) by Pinterest,
also released under the [MIT License](https://github.com/pinterest/ktlint/blob/master/LICENSE).
