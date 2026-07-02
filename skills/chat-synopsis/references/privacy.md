# Privacy

What this skill does, what it doesn't, and what to consider before saving conversations about sensitive topics.

---

## What gets auto-redacted

Before rendering, the skill pattern-matches and replaces these with `[REDACTED]`:

- **API keys** — `sk-…`, `ghp_…`, `xoxb-…`, `xoxp-…`, `AKIA…` (AWS), `AIza…` (GCP).
- **JWTs** — three base64-segments separated by dots, where the first segment decodes to JSON containing `"alg"`.
- **Labeled secret lines** — anything matching `password|secret|api_key|token|access_key|private_key` followed by `:` or `=` and a string value.

This is **best-effort, not security-grade.** Custom secret formats, obfuscated tokens, or secrets pasted as part of larger prose may slip through. The mandatory preview before save is the user's last line of defense — review it.

If the skill misses a secret you care about, paste a known-failing example into the issue tracker so the patterns can be improved.

---

## What does NOT get auto-redacted

Intentionally not auto-handled (a thoughtful user is better positioned to decide than a regex):

- **Names of third parties** — if the conversation discussed Person X, the synopsis may name them. The user decides whether to anonymize before sharing the artifact.
- **Personally identifying information** — emails, phone numbers, addresses. These are sometimes the entire point of a conversation (e.g. drafting a contact response).
- **Topic content** — medical, financial, relationship, legal, professional details. The skill does not reason about what topic is "sensitive."
- **Emotional content** — tone, distress, self-disclosure. Captured if substantive, attributed to the user, never inflated.

If you need stricter handling for a specific conversation, edit the rendered preview before saving.

---

## Where the artifact goes

The synopsis is saved to a destination *you configured* — your Obsidian vault, your Notion database, your Drive folder. It does not get sent to Anthropic, the skill author, or any third party. The skill writes one file (or one Notion page, or one Drive doc) and reports the location.

The skill itself runs locally (Claude Code) or inside your Claude.ai session. It has access to whatever Claude has access to — nothing more.

---

## When you might not want to save this

A short checklist worth running before approving the preview:

- **Did the conversation contain a credential I haven't rotated?** Rotate it first; the synopsis lives forever once saved.
- **Does the synopsis name third parties in a context they wouldn't recognize as fair?** Anonymize before saving, or save to a private destination.
- **Is the destination shared with people who shouldn't see the content?** A team Notion is not a personal Notion. The skill writes wherever you point it; pointing matters.
- **Does the artifact describe a still-private decision?** Sometimes thinking is durable but the *record* of the thinking should not be. Save locally; don't push to a shared system.
- **Do I want a record of this conversation existing at all?** Some conversations are better forgotten. The skill defaults to "yes, save" — you can always cancel the preview.

The mandatory preview exists for exactly these moments. Use it.

---

## A note on intentional engagement

This skill is built for users who treat conversations with AI as a thinking practice — not as throwaway interactions. Privacy considerations are part of that practice. The artifact you save is a record of how you thought, who you named, and what you committed to remember. That deserves the same intentionality you bring to the conversation itself.
