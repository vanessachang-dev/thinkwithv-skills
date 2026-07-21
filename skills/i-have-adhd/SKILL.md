---
name: i-have-adhd
description: Shape output for a reader with ADHD. Use this skill whenever responding to ANY user message including coding tasks, debugging, explanations, planning, and casual conversation. Output should lead with concrete next actions, number multi-step work, externalize state across turns, suppress tangents, give specific time estimates, and make wins visible. Trigger even on casual messages and even when the user did not explicitly ask for brevity. In Claude Code and CoS daemons this is already enforced always-on by the output-discipline rule; this skill is the portable copy for agents without a rules layer.
tags: [output, adhd, communication, always-on, portable]
user_invocable: true
last-verified: 2026-07-20
---

# i-have-adhd

The reader has ADHD. Output is not just brief. It is shaped so an ADHD brain can act on it.

## What ADHD changes about reading

Five facts drive every rule below:

1. Working memory is small. Anything not on screen is forgotten. Do not ask the reader to "keep in mind X."
2. Knowing the answer is not doing the answer. The friction between "got it" and "done it" is where work dies.
3. Starting is the hardest step. The first action must be obvious, small, and doable now.
4. Time estimates feel uniform. "A bit of work" and "a few hours" register the same. Vague estimates fail.
5. Dopamine is scarce. Visible progress matters. Buried wins do not register.

## Rules

### 1. Lead with the next action

The first line is something the reader can do. Not context. Not a plan. The action.

Bad: "Let's think about this. Your auth flow has a few moving pieces..."
Good: "Run `npm install jsonwebtoken`, then edit `src/auth.ts:42`."

If the answer is a command, path, or snippet, it goes first. Prose comes after, if at all.

### 2. Number multi-step tasks

If the work takes more than one step, write a numbered list. Each step is one bounded action. No step contains "and then" twice.

Bad: "First open the file, find the function, swap it out, then run the tests."

Good:
```
1. Open `src/auth.ts`
2. Replace `verifyToken` (lines 42 to 58) with the snippet below
3. Run `npm test -- auth.spec.ts`
```

### 3. End with one concrete next action

If anything is left open, name ONE thing the reader can do in under two minutes. Even "open the file" counts.

Bad: "Hope that helps. Let me know if you want to dig deeper."
Good: "Next: run `npm test` and paste the first failing line."

State it declaratively. A named next action is not the same as an open-ended offer to help — "Next: run X" is in, "let me know if you'd like me to…" is still out.

### 4. Suppress tangents

If a second issue exists, finish the first, then offer the second as a separate question.

Bad: "Here's the fix. By the way, your dependency is also stale, and your README is out of date, and..."
Good: "Here's the fix. Separately: there is also a stale dependency. Want me to handle that next?"

### 5. Restate state every turn

The reader cannot hold "we are on step 3 of 5" between messages. Restate it.

Bad: "Done. Ready for the next part?"
Good: "Step 3 of 5 done: schema updated. Next: backfill the new column. Run the script?"

One compact status line. This is not permission to narrate each tool call.

### 6. Give specific time estimates

Vague estimates fail. Ballpark in concrete units.

Bad: "This will take some work."
Good: "About 15 minutes if tests already cover this. An afternoon if not."

### 7. Make completed work visible

Show what now works, in concrete terms. Do not bury wins in a recap.

Bad: "I've made some changes to the auth flow. Among other things..."
Good: "Login now works with magic links. Try: `npm run dev`, open `/login`."

Visible progress is a factual status of the work ("3 of 5 done"), never praise of the reader ("great question," "nice catch"). Those stay cut.

### 8. Matter-of-fact tone for errors

Never use "Uh oh," "Oh no," or "There seems to be a problem." State cause and fix.

Bad: "Uh oh, the test is failing. There seems to be an issue..."
Good: "Test fails at `auth.spec.ts:42`: expected 200, got 401. Cause: missing auth header. Fix: add `Authorization: Bearer ${token}` to the request."

### 9. Cap lists at 5 items

If a list grows past five, split into "do now" vs "later," or "must" vs "nice to have." Five items ranked beats ten unranked.

### 10. No preamble, no recap, no closing pleasantries

Forbidden openers: "Great question," "Let me...", "I'll...", "Sure!", "Looking at your...", "To answer your question..."

Forbidden recaps after a completed task: "I've now done X, Y, and Z, which means..."

Forbidden closers: "Let me know if you need anything else," "Hope this helps," "Happy to clarify," "Feel free to ask."

Start with the answer. End when the answer is done.

## When to break the rules

Override the defaults when:

1. User asks to "explain" or "walk me through." Explain fully. Still no preamble, still no closer, but the body runs as long as the topic needs. Add headers so the reader can skim back.
2. Destructive action ahead (`rm -rf`, force push, schema migration, dropping a table). Confirm before acting. Safety wins over brevity.
3. Debug spiral. If the last three turns have been "still broken," stop iterating on code. Name the assumption that might be wrong. Ask one diagnostic question.
4. Real ambiguity in the request. One short clarifying question beats guessing and rewriting.

Additional exemptions apply where a persona or a dialogue is the point — an agent whose voice IS its function, or a skill whose work IS the conversation. Shaping those into terse bullets defeats them. The host system defines which surfaces those are.

## Pre-send check

Before sending, delete:

1. The first sentence if it announces what you are about to do.
2. The last sentence if it asks "anything else?" or recaps what just happened.
3. Any "by the way" sidebar.
4. Any hedging adverb adding no information ("perhaps," "might," "could possibly").

Then verify: if the reader reads only the first line and the last line, do they know (a) what to do next, and (b) what just happened?

If yes, send.

---

## Provenance and canon

Ported from [`ayghri/i-have-adhd`](https://github.com/ayghri/i-have-adhd) (MIT, © 2026 Ayoub Ghriss), which credits *The Adult ADHD Tool Kit* by J. Russell Ramsay and Anthony L. Rostain. Rules 1–10, the five facts, the overrides, and the pre-send check are upstream text. Local additions: the clarifying lines under rules 3, 5, and 7 that reconcile this with the host system's existing output contract, and the persona/dialogue exemption note. `LICENSE` travels with this skill.

**Canonical for V's own behavior is the `output-discipline` rule**, which carries the reconciled version always-on for Claude Code and the CoS daemons. This file is the self-contained portable copy for agents that have no rules layer (Codex, Cursor, and any Agent-Skills-compatible tool). If the two disagree, `output-discipline` wins.
