# Think with V — Skills

Agent skills from my AI OS. Straight from the vault.

Small, composable, model-agnostic skills I actually use. My Obsidian vault is the source of truth; this repo is the published, installable slice of it. Built in public.

## Skills

- **[fable-prompt-builder](./skills/fable-prompt-builder/SKILL.md)** — Turn a rough task description into one goal-focused, ready-to-paste prompt for Claude Fable 5. It collects the right context and boundaries and assembles the prompt, resisting the over-instruction that degrades a more capable model's output.

## Install

**Claude Code** — clone the repo and drop a skill folder into your skills directory:

```bash
git clone https://github.com/vanessachang-dev/thinkwithv-skills
cp -r thinkwithv-skills/skills/fable-prompt-builder ~/.claude/skills/
```

**claude.ai** — zip a skill folder and upload it under **Settings → Capabilities → Skills**.

This repo ships a `.claude-plugin/plugin.json`, so it also works as a Claude Code plugin.

Once installed, just describe your task — the skill assembles the Fable-ready prompt for you.

## License

MIT © Vanessa Chang

---

by **Vanessa Chang** · [@thinkwithv](https://thinkwithv.beehiiv.com) · [vanessachang.com](https://vanessachang.com)
