---
description: Capture this conversation as a durable markdown artifact in your configured thinking system (Obsidian, Notion, Drive, or local file).
---

Trigger the `chat-synopsis` skill on the current conversation. Follow the procedure in `~/.claude/skills/chat-synopsis/SKILL.md`:

1. Surface detection
2. First-run wizard if no destination is configured
3. Salience check (anchor enumeration)
4. Privacy redaction pass
5. Render under Arc / Attribution / Artifact discipline
6. Mandatory preview, then save to the configured destination

If the user appended a per-run override (e.g. `/synopsis → clipboard`), route to that destination for this run only without modifying the configured default.
