---
name: silent-assumption
description: Surface 1-3 unstated assumptions a claim or argument depends on, then test each. Triggers — "what am I assuming?", "what's the assumption underneath this?", "where am I taking something for granted?", or contextually when V's argument depends on something she hasn't said. Output is a structured list of assumptions plus what would happen if each were false. NOT for explicit critique (use critical-thinking dialectical mode), NOT for falsifying the claim itself (use falsify), NOT for dictionary-style premise unpacking (this finds *load-bearing* unstated dependencies, not surface premises). Callable by Fry / thinking-partner / V directly.
tags: [ai-os, skills, conceptual-analysis, fry, thinking]
last-verified: 2026-07-20
---

# Silent Assumption

A transform, not a conversation. Input: a claim or argument. Output: 1-3 named assumptions the argument depends on, the test each fails, and which assumptions are load-bearing vs incidental.

Extracts a focused sub-move from `critical-thinking`'s ANALYTICAL mode (Paul-Elder argument mapping; Toulmin warrant-extraction). The discipline: don't critique what V said — surface the *load-bearing things she didn't say* and ask whether they hold.

## When this fires

**Explicit triggers:**
- "What am I assuming here?"
- "What's the assumption underneath this?"
- "Where am I taking something for granted?"
- "What's invisible in my reasoning?"
- "Help me find the silent premise"
- "Surface assumptions"

**Contextual (Fry detects):**
- V's argument moves from premise to conclusion via a step that requires an unstated bridge.
- V's claim depends on something obvious-to-her but not-yet-said. (Often the obvious-to-her piece is the one that wouldn't survive scrutiny.)
- V uses "of course" / "obviously" / "everyone knows" — those are silent-assumption flags.
- V's reasoning seems airtight but the conclusion still feels off. Often the assumption is hiding.

**Offer once:** "Your argument hangs on something you haven't said. Want me to name it?"

## When this stays dormant

- V is in generative/divergent mode and assumptions are deliberate scaffolding.
- The claim is identity-claim (per `identity-vs-empirical.md` — don't critique).
- V already knows the assumption and is bracketing it intentionally for the current argument.
- The unstated piece is genuinely a definition or a domain convention, not an assumption — saying so is pedantic, not generative.

## Inputs

**Required:**
- A claim, argument, or chunk of V's writing/speaking where the reasoning depends on something unstated

**Optional:**
- The conclusion V is reaching for (helps target which assumption is load-bearing)
- Domain context (some assumptions are domain-specific — what's silent in cognitive science differs from what's silent in marketing)

## The core move

For each assumption:

1. **Name it as a declarative statement.** Not "you might be assuming..." — state the assumption as a sentence the argument needs to be true.
2. **Locate it in the argument.** Which step of V's reasoning requires this assumption? Be precise — "between premise 2 and conclusion" — not vague.
3. **Test it.** Construct one concrete case where the assumption is false. If the assumption is false, what happens to V's argument?
4. **Rate it load-bearing or incidental.** Load-bearing = if this assumption fails, the conclusion fails. Incidental = if this assumption fails, the conclusion still survives via other paths.

Stop at 3 assumptions. More than 3 = paralysis, not analysis.

## Output format (canonical contract)

```
## Silent assumptions in [V's claim or argument, restated in one line]

**Assumption 1: [Statement]**
- Location: [where in the argument it lives — "between X and Y" or "implicit in claim Z"]
- Test: [one concrete case where this assumption is false]
- If false: [what happens to V's argument]
- Verdict: LOAD-BEARING | INCIDENTAL

**Assumption 2: [Statement]**
- Location: [...]
- Test: [...]
- If false: [...]
- Verdict: LOAD-BEARING | INCIDENTAL

**Assumption 3: [Statement]** *(only if there's a third genuinely load-bearing one)*
- Location: [...]
- Test: [...]
- If false: [...]
- Verdict: LOAD-BEARING | INCIDENTAL

**Recommended next move:**
[ONE of:]
- INTERROGATE [Assumption N] — name it, ask V if it holds, decide before continuing
- DEFEND [Assumption N] — state the case for why this assumption is reasonable, and proceed
- BRACKET [Assumption N] — note the assumption, mark the argument as conditional on it
- ARGUMENT-FRAGILE — too many load-bearing assumptions; the argument needs more grounding before continuing
```

**Strict rules:**
- Each assumption is a declarative SENTENCE. Not "Maybe you assume X" — "[X is the case]" stated flat.
- "Test" must be concrete — a specific case, not a category.
- "Verdict" is binary: LOAD-BEARING or INCIDENTAL. No hedges.
- "Recommended next move" is exactly one of the four options.
- If 0 load-bearing assumptions exist (rare), say so: "No load-bearing silent assumptions found — argument's premises are all stated."
- Cap at 3 assumptions. If more genuinely exist, the argument is fragile and that's the verdict.

## Agent-callable mode

When called by Fry or another agent, skip conversational scaffolding. Begin with `## Silent assumptions in [claim restated]`. End after `**Recommended next move:**`. The bundle is the entire output.

In standalone mode (V invokes), Fry/Claude can frame the output in voice ("Your argument depends on a thing you haven't said: ..."). The bundle stays canonical underneath.

## Anti-patterns

- ❌ **Pedantic premise-listing.** "You're assuming language exists, that words have meanings, that you exist..." Cut. Silent-assumption finds *load-bearing* dependencies, not philosophical bedrock.
- ❌ **Surface premise repetition.** If V said "X because Y," "Y" is a premise, not a silent assumption. Silent = unstated.
- ❌ **Critique as assumption.** "You're assuming you're right" is not an assumption, it's a snipe. Cut.
- ❌ **More than 3.** If you find 5 load-bearing assumptions, the argument is fragile — return ARGUMENT-FRAGILE verdict, don't list all 5.
- ❌ **Mind-reading.** "You're assuming [emotional state]" — out of scope. Silent-assumption is propositional, not psychological.
- ❌ **Identity-claim assumption surfacing.** Per `identity-vs-empirical.md`: V's identity claims are sealed. Surface assumptions in empirical claims, not identity ones.

## Relationship to other skills

| Skill | Shape | Relationship |
|---|---|---|
| `distill` | Convergence on a claim | distill produces the claim; silent-assumption tests its hidden dependencies |
| `distinguish` | Disambiguate conflated concepts | distinguish often *reveals* a silent assumption (the conflation was the assumption) |
| `falsify` (via critical-thinking Mode 4) | What would prove the claim wrong? | silent-assumption is upstream — surface assumptions, then falsify the load-bearing one |
| `negative-claim` | What would I have to deny? | After silent-assumption, negative-claim sharpens (denying a load-bearing assumption commits V to a specific position) |
| `grant-then-test` | Concession move | If a silent assumption is in dispute, grant-then-test it: assume it's true, see if conclusion holds |

**Pipeline pattern:** distill → silent-assumption → negative-claim or falsify. Each surfaces a different kind of structure in V's reasoning.

## What this does NOT do

- Critique V's claim directly (use critical-thinking dialectical mode for that)
- Falsify the claim (use falsify — operates on the claim itself, not the unstated dependencies)
- Surface emotional/psychological assumptions (out of scope)
- Run iteratively — one call surfaces 1-3 assumptions; if V wants deeper, she calls again
- Fabricate assumptions when none are load-bearing (rare but say so)

## Real V examples (V to fill in 1-2 from her actual work)

**Example 1 (placeholder):** [V — fill in a real case where you made a claim that depended on a load-bearing silent assumption you hadn't seen. What was the assumption? What happened when it surfaced?]

**Example 2 (placeholder):** [V — a case where surface-premise-listing would have produced 6 things, but only 1-2 were actually load-bearing. Helps the skill learn the discrimination.]
