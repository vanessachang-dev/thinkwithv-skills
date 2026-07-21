# AGENTS.md — thinkwithv-skills

Cross-agent instructions for this repo. Read before changing anything here.

## What this repo is

The published, installable slice of a private Obsidian vault's skill library. It is **both** a plain skills collection and a Claude Code plugin marketplace.

**The vault is the source of truth, not this repo.** Most skills here are generated copies.

## The publish boundary

`skills-manifest.json` decides what ships. Nothing else does.

- `source: vault` — canonical in the private vault. **Do not hand-edit these under `skills/`**; your change will be overwritten by the next sync. Edit in the vault, then re-run the sync.
- `source: repo` — canonical here. Edit directly.

Regenerate vault-sourced skills:

```bash
export TWV_VAULT_SKILLS="<path to the vault's AI OS/Skills directory>"
bash scripts/sync-from-vault.sh
git status
```

The vault path comes from the environment, never hardcoded — this repo is public.

## Adding a skill

1. Add an entry to `skills-manifest.json` (`name`, `category`, `source`).
2. Add the path to `skills[]` in `.claude-plugin/plugin.json` and bump `version`.
3. Run the sync (for `source: vault`).
4. Update the README skill list.
5. Third-party skill? Carry its upstream `LICENSE` in the skill folder, add a provenance note to its `SKILL.md`, and list it under README § Third-party skills.

Keep `skills-manifest.json` and `plugin.json` in agreement — a skill in one and not the other is a bug.

## Skill format

Plain [Agent Skills](https://code.claude.com/docs/en/skills): one `SKILL.md`, YAML frontmatter (`name` + `description` required), markdown body.

- **`name` must match the folder name.**
- **`description` is the routing primitive.** Be specific about when it fires, its scope, and what it is *not* for.
- **No Claude-Code-only frontmatter** (`context: fork`, `allowed-tools`) — it breaks portability to Codex, Cursor, and other Agent-Skills tools. If a new skill genuinely needs it, say so in its `description`.
- **No absolute paths, tool-specific syntax, or vault wikilinks in the body.** Skills must be self-contained and readable by any agent.

## Conventions

- Branch `vanessa/<feature-name>` off updated `main`. Never commit to `main`.
- Stage files by name. No `git add .`.
- Open a PR only when the work is merge-ready.
- This repo is **public** — no private paths, no secrets, no client or personal detail in skill bodies.
