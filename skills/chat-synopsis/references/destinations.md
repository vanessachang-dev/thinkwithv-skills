# Save Destinations

This file is **read by the skill on every run** and **written by the first-run wizard**. The Configured Defaults section at the top tells the skill where to silently save the artifact. The recipes below tell the skill *how* to execute each destination type.

---

## Configured Defaults

> Edit this section directly to change your default destination, or let the first-run wizard write it for you.

```yaml
default_destination: unconfigured   # one of: obsidian | notion | drive | local_file | unconfigured
obsidian_folder: null               # absolute path, e.g. /Users/you/Documents/Obsidian/MyVault/Synopses
notion_database_id: null            # 32-char ID parsed from a Notion DB URL
drive_folder_id: null               # ID parsed from a Drive folder URL
local_file_folder: ~/chat-synopses  # used as fallback when default_destination is unconfigured
filename_pattern: YYYY-MM-DD-slug   # YYYY-MM-DD prefix + kebab slug, truncated to ~60 chars
```

When `default_destination` is `unconfigured`, the skill runs the first-run wizard before generating.

---

## Per-run override

If the user appends `→ <destination>` to the trigger phrase (e.g. `synopsis this chat → clipboard`), route to that destination *for this run only* — do not modify the Configured Defaults.

Recognized override targets: `obsidian`, `notion`, `drive`, `file` / `local`, `clipboard`, `download`.

---

## Destination recipes

### Obsidian (filesystem write — Code mode only)

Available when running in Claude Code with filesystem access.

1. Resolve the target folder: `obsidian_folder` from Configured Defaults, or ask once if not set.
2. Build the filename: `{YYYY-MM-DD}-{kebab-slug}.md`.
3. Write the full synopsis (frontmatter + body) using the `Write` tool.
4. Confirm: *"Saved to Obsidian at `<absolute-path>`."*

If the path doesn't exist, ask before creating it.

### Notion (Code mode via Notion MCP, or Chat/Cowork via connector)

Available when a Notion connector or `notion` MCP is reachable.

1. Resolve `notion_database_id` from Configured Defaults, or ask once if not set. Accept a database URL and extract the 32-char ID via regex (`[a-f0-9]{32}` after the workspace slug).
2. Create a new page in that database. Title = the synopsis's `title` frontmatter value. Body = the synopsis markdown converted to Notion blocks (let the API/connector handle conversion).
3. If the synopsis has a `Next Steps` section with checkboxes and the user has a tasks database configured, **ask before** creating those as separate task entries. Do not auto-create.
4. Confirm: *"Saved to Notion as `<page-title>` (URL: `<page-url>`)."*

### Google Drive (Code mode via Drive MCP, or Chat/Cowork via connector)

Available when a Drive connector or `gdrive` MCP is reachable.

1. Resolve `drive_folder_id` from Configured Defaults, or ask once if not set.
2. Create a new file in that folder. Filename = the synopsis's filename. MIME type: `text/markdown` (Drive will preview as plain text) — alternatively offer to convert to a Google Doc.
3. Confirm with the Drive URL.

### Local file (always available in Code mode; fallback)

1. Target folder: `local_file_folder` from Configured Defaults (default: `~/chat-synopses/`).
2. Create the folder if it doesn't exist.
3. Build filename: `{YYYY-MM-DD}-{kebab-slug}.md`.
4. Write with the `Write` tool. On filename collision, append `-2`, `-3`, etc.; do not overwrite.
5. Confirm with the absolute path.

### Downloadable artifact (Chat/Cowork — fallback when no connectors are configured)

1. Render the synopsis as a downloadable markdown artifact in the conversation.
2. Tell the user: *"Your synopsis is ready as a downloadable file. Save it to wherever you keep notes."*

### Copy-paste (always available)

Output the full synopsis in a fenced code block prefixed with:

> "Here's the copy-ready markdown. Paste into wherever you keep notes:"

---

## Customization (for power users)

Edit the Configured Defaults section directly to change destination, switch databases, change filename pattern, etc. The skill reads this file every run, so changes take effect immediately on the next trigger.

To disable the first-run wizard entirely (for example, if you want to manage destinations.md by hand from day one), set `default_destination` to anything other than `unconfigured` in the YAML block above.
