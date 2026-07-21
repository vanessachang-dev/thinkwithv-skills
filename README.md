# Think with V — Skills

Agent skills from my AI OS. Straight from the vault.

Small, composable, model-agnostic skills I actually use. My Obsidian vault is the source of truth; this repo is the published, installable slice of it. Built in public.

## Skills

### Prompting
- **[fable-prompt-builder](./skills/fable-prompt-builder/SKILL.md)** — Turn a rough task description into one goal-focused, ready-to-paste prompt for Claude Fable 5.

### Critical thinking
Small reasoning primitives — each surfaces or tests one move.
- **[silent-assumption](./skills/critical-thinking/silent-assumption/SKILL.md)** — Surface 1–3 unstated assumptions a claim depends on, then test each.
- **[distinguish](./skills/critical-thinking/distinguish/SKILL.md)** — Pull apart two concepts being used as one (or split two that are really one).
- **[grant-then-test](./skills/critical-thinking/grant-then-test/SKILL.md)** — Stipulate the contested claim is true, then test whether the argument still stands.
- **[negative-claim](./skills/critical-thinking/negative-claim/SKILL.md)** — Surface what you'd have to deny to hold a position, and the cost of each denial.
- **[abstract-vs-concrete](./skills/critical-thinking/abstract-vs-concrete/SKILL.md)** — Given a claim at one rung of the abstraction ladder, propose the paired move at the other.

### Documentation
- **[chat-synopsis](./skills/chat-synopsis/SKILL.md)** — Capture a Claude conversation as a durable markdown artifact in your own thinking system.

### Communication
- **[i-have-adhd](./skills/i-have-adhd/SKILL.md)** — Shape output so an ADHD brain can act on it: lead with the action, number the steps, restate state, concrete time estimates, visible wins, no preamble. Ported from [ayghri/i-have-adhd](https://github.com/ayghri/i-have-adhd) (MIT) — see [Third-party skills](#third-party-skills).

## Install

**Claude Code** — clone the repo and drop a skill folder into your skills directory:

```bash
git clone https://github.com/vanessachang-dev/thinkwithv-skills
cp -r thinkwithv-skills/skills/<skill-name> ~/.claude/skills/
```

**claude.ai** — zip a skill folder and upload it under **Settings → Capabilities → Skills**.

**As a Claude Code plugin** — this repo is also a plugin marketplace:

```
/plugin marketplace add vanessachang-dev/thinkwithv-skills
/plugin install thinkwithv-skills@thinkwithv-skills
```

## Portability

These are plain [Agent Skills](https://code.claude.com/docs/en/skills) — one `SKILL.md` per skill, YAML frontmatter (`name` + `description`) plus a markdown body. None of them use Claude-Code-only features (`context: fork`, `allowed-tools`), so they read cleanly in any tool that honors the Agent Skills format. For guaranteed cross-agent use (e.g. Codex), pair a skill with an `AGENTS.md` at the project level — that's the layer every agent reads.

_New skills that rely on Claude-Code-only frontmatter should state the constraint in their `description`._

## Maintainer

`skills-manifest.json` is the publish boundary — only skills listed there ship. `scripts/sync-from-vault.sh` regenerates the `source: vault` skills from the private vault (`TWV_VAULT_SKILLS`); `source: repo` skills are canonical here. Run the sync, then `git status` to see drift.

## Third-party skills

Most skills here are mine. Where one isn't, it says so, its upstream `LICENSE` travels in the skill folder, and the `SKILL.md` carries a provenance note naming what's upstream text and what I changed.

- **i-have-adhd** — ported from [ayghri/i-have-adhd](https://github.com/ayghri/i-have-adhd), MIT © 2026 Ayoub Ghriss, which credits *The Adult ADHD Tool Kit* by J. Russell Ramsay and Anthony L. Rostain. Rules and structure are upstream; my additions reconcile it with my own always-on output rules.

## License

MIT © Vanessa Chang, except third-party skills noted above, which retain their upstream MIT license and copyright.

---

by **Vanessa Chang** · [@thinkwithv](https://thinkwithv.beehiiv.com) · [vanessachang.com](https://vanessachang.com)
