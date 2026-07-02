---
name: chat-synopsis
description: Capture a Claude conversation as a durable markdown artifact. Triggered by "synopsis this chat," "capture this conversation," "preserve this thinking," or similar. Preserves the arc of how the conversation unfolded, honest attribution of who contributed what, and a self-contained artifact that lives in the user's own thinking system. Not a transcript tool — a salience filter for the moments worth keeping.
version: 0.1.0
---

# Chat Synopsis

Capture a Claude conversation as a durable markdown artifact in the user's own thinking system. Three things get preserved:

1. **Arc** — how the conversation unfolded: where it started, where it shifted, where it landed. Not a chronological list of events.
2. **Attribution** — who contributed what. The user's contributions and Claude's contributions are named, not collapsed into "we."
3. **Artifact** — a self-contained markdown file that stands alone, routed to the user's already-configured thinking system (Obsidian, Notion, Drive).

This is a salience filter, not a transcript. Capture the moments that produced new thinking — reframes, decisions, insights — not every exchange.

---

## Triggers

Activate only on these natural-language phrases (or a per-run override of the form `<trigger> → <destination>`):

- "synopsis this chat" / "synopsis this conversation"
- "capture this conversation"
- "preserve this thinking" / "preserve what we figured out"
- "save what we just figured out"

In Claude Code, `/synopsis` (defined in `commands/synopsis.md`) also activates the skill.

**Do not activate without an explicit trigger.**

---

## Procedure

### Step 1 — Surface detection

Detect the runtime environment to know which destinations are reachable:

- If the filesystem is writable and shell tools work (Claude Code) → **Code mode**. Available destinations: Obsidian (filesystem write), local file, Notion (via Notion MCP if installed), Drive (via Drive MCP if installed), clipboard.
- Otherwise (Claude.ai chat or Cowork) → **Chat mode**. Available destinations: Notion (via connector if enabled), Drive (via connector if enabled), downloadable artifact-panel markdown, copy-paste.

Surface awareness only affects which destinations are *offered*. The artifact format (markdown) is the same on every surface.

### Step 2 — First-run wizard (if no destination configured)

Read `references/destinations.md`. If the **Configured Defaults** section at the top is empty or still has placeholder values, run the setup wizard inline before continuing:

> "Looks like this is your first time running chat-synopsis. Where should your synopses live? You'll only set this once.
>
> 1. **Obsidian** — paste the absolute path to the folder in your vault where synopses go (e.g. `/Users/you/Documents/Obsidian/MyVault/Synopses`).
> 2. **Notion** — paste a Notion database URL or share-link; I'll extract the database ID.
> 3. **Google Drive** — paste a folder URL or ID.
> 4. **Local file** — synopses save to `~/chat-synopses/`.
> 5. **Skip for now** — I'll use the local-file fallback this run; you can configure later by editing `references/destinations.md`."

When the user picks a destination, write the configured defaults into `references/destinations.md`'s **Configured Defaults** section (path / database ID / folder ID, plus chosen destination type). Confirm in one sentence: *"Saved your default to Obsidian at `~/Documents/Obsidian/MyVault/Synopses/`. You can change this anytime by editing `references/destinations.md`."*

Then continue with Step 3.

### Step 3 — Salience check

Before generating the synopsis, scan the conversation for **anchors** — specific moments worth preserving:

- A reframe ("I was thinking about this wrong; the real question is X")
- A decision (a choice made between alternatives)
- An insight (something the user articulated that wasn't visible at the start)
- A breakthrough (a stuck point that resolved)
- A useful artifact (something concrete that came out of the work — code shipped, plan written, document drafted)
- A notable framing shift (the topic itself changed shape)

List the anchors found, briefly, before rendering. If **at least one** anchor exists, proceed. The skill is biased toward preserving thinking — a single anchor in a 30-message conversation is enough to justify a (proportionally short) artifact preserving that anchor under full discipline.

If **zero** anchors exist (e.g. a single-topic lookup, "how do I install foo?", pure stenographic chat), say so honestly and ask before proceeding:

> "This looks like a [single-topic lookup / debugging recap / no-pivot Q&A] — I didn't find a reframe, decision, or insight that would otherwise be lost. A synopsis here would mostly restate what's already visible in the chat. Want me to run it anyway?"

Only generate after explicit confirmation in the zero-anchor case.

### Step 4 — Privacy pass

Before rendering, scan the conversation content for high-risk patterns and replace matches with `[REDACTED]` in the synopsis output:

- API keys: strings matching `sk-[A-Za-z0-9]{20,}`, `ghp_[A-Za-z0-9]{20,}`, `xoxb-…`, `xoxp-…`, AWS-style `AKIA[A-Z0-9]{16}`, GCP-style `AIza[A-Za-z0-9_-]{35}`.
- JWTs: three base64-segments separated by dots, where the first segment decodes to JSON containing `"alg"`.
- Lines whose left-hand label matches `password|secret|api_key|token|access_key|private_key` followed by `:` or `=` and a string value.

This is best-effort, not security-grade. Document the limitation in `references/privacy.md`. Mandatory preview (Step 6) is the user's last line of defense.

### Step 5 — Render under AAA discipline

Apply Arc / Attribution / Artifact discipline. See `references/examples.md` for worked positive/negative pairs spanning conversation types — examples are load-bearing.

**Arc discipline.** When writing What Happened, trace the through-line: where the conversation started, where it shifted, where it landed. Do not produce a chronological event list. If the conversation didn't have an arc, say so explicitly ("Single-topic execution session, no significant pivots") rather than inflating one.

**Attribution discipline.** Every sentence describing action names the actor. Use verbs in the appropriate register:

- **User verbs:** *directed, asked, decided, caught, reframed, pushed back, named, surfaced, clarified, refined, chose, rejected, noticed, vetoed, recognized, distinguished.*
- **Assistant verbs:** *drafted, proposed, scaffolded, explained, generated, suggested, summarized, restated, investigated, recommended.*
- **Forbidden:** "we" for one-party action; passive voice that hides the actor ("X was decided"); narrating Claude's work as the user's accomplishment.
- **Joint-credit pattern** (when both contributed): "user proposed X; assistant refined it into Y; user chose Y."

**Artifact discipline.** The output must read coherently to someone who wasn't in the conversation. No references to "earlier in this chat" or "as I said." The artifact stands alone.

### Output structure

Use the section shape below. **Omit any section without meaningful content** — empty sections do not appear. Section names may adapt to conversation type (e.g. "Decisions Made" → "Insights" or "Reframes" for non-engineering conversations) — the names below are good defaults, not mandates. Smart brevity throughout: every line earns its place.

```markdown
---
title: "[Primary Topic]"
date: YYYY-MM-DD
source: Claude Code | Claude.ai
project: [if applicable]
tags:
  - chat-synopsis
  - [topic-tags]
---

## Synopsis
[2–4 sentences. What this conversation was about and what it produced.]

## What Happened
[Arc-traced narrative of how the conversation unfolded. Through-line, not event list. Attribution-disciplined throughout.]

## Decisions Made / Insights / Reframes
- [Anchor]: [Context — what was decided, what was seen, what shifted]

## Quotable Moments
> "[Verbatim user language when they coined a phrase, named a constraint, or articulated something precisely]"

## Open Threads
- [What's unresolved or wants future attention]

## Next Steps
- [ ] [Concrete follow-up if any]
```

### Step 6 — Mandatory preview, then save

Show the rendered markdown to the user. Wait for one of:

- **Accept** — proceed to save at the configured destination.
- **Edit** — apply user-suggested changes, re-preview.
- **Cancel** — discard and end.
- **Per-run override** — if the trigger included `→ <destination>` (e.g. `synopsis this chat → clipboard`), route to that destination *for this run only*; the configured default in `destinations.md` does not change.

After save, confirm in one sentence what was written and where. Example: *"Saved to Obsidian at `~/Documents/Obsidian/MyVault/Synopses/2026-05-07-cosmic-seal-discussion.md`."*

---

## Filename convention

`YYYY-MM-DD-{kebab-case-of-primary-topic}.md`. Truncate slug to ~60 characters. Numeric suffix (`-2`, `-3`) on collision rather than overwriting.

---

## What this skill does NOT do

- Activate without an explicit trigger.
- Save without preview.
- Inflate or flatter — specific and grounded.
- Transcribe every exchange — capture salience.
- Match against a hardcoded framework list — infer from the conversation.
- Treat "create a transcript" as a trigger (intentionally excluded — this is not a transcript tool).
