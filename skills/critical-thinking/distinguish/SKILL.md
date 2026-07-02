---
name: distinguish
description: Disambiguation primitive for conceptual analysis — when V is using two (or more) concepts as if they were one, or two as if they were different when they're not, distinguish surfaces the operations each concept performs and shows where the conflation produces harm. Triggers — "are these the same?", "I keep using X and Y interchangeably", "what's the difference between X and Y?", "I think X is just Y", or when V's argument depends on a distinction she hasn't drawn. Output is a structured disambiguation, not a question. NOT for definition lookup (use a dictionary), NOT for taxonomic categorization (use taxonomy-test, future), NOT for value-laden "which is better" questions. Callable standalone or by Fry / thinking-partner.
tags: [ai-os, skills, conceptual-analysis, fry, thinking]
---

# Distinguish

A transform, not a conversation. Input: two or more concepts V is using imprecisely. Output: a structured disambiguation showing what each *does* (the operations each performs, not just definitions), where the conflation harms, and whether the distinction is load-bearing or cosmetic.

Anchored in philosophical conceptual analysis (Frege via Ryle's *The Concept of Mind*, the ordinary-language tradition, Wittgenstein's "language goes on holiday"). The move is *exact*: take a word that's doing too much work and split it into the *several* things it's actually pointing at.

## When this fires

**Explicit triggers:**
- "Are X and Y the same thing?"
- "What's the difference between X and Y?"
- "I keep using X and Y interchangeably"
- "I think X is just Y, or am I missing something?"
- "Help me distinguish [concepts]"
- "Is this one thing or two?"

**Contextual:**
- V's argument hinges on a distinction she hasn't drawn (Fry detects this and offers `distinguish` rather than letting the argument continue with the conflation).
- V uses two terms as synonyms in a context where the literature treats them as distinct (or vice versa).
- V is constructing a framework whose load-bearing claim is "X is not just Y" — but the *not-just* hasn't been made precise.

**Offer once, don't push:** "There are two things blurring here — want me to distinguish them, or is the conflation actually doing work for you?"

## When this stays dormant

- Definition lookup. ("What does *epistemic* mean?" — that's a dictionary, not distinguish.)
- Taxonomic categorization. (Where does X sit in a category hierarchy? — that's taxonomy-test territory, future.)
- Value-laden "which is better" questions. ("Should I use X or Y for my project?" — that's strategic, not analytical.)
- V is intentionally using a term loosely for poetic/brand reasons — distinguish kills the resonance. Honor the choice.
- The two concepts genuinely *are* distinct and V already knows it; she's just naming both for reference.
- The two concepts genuinely *are* the same and the apparent difference is surface — say so plainly, don't manufacture a distinction.

## Inputs

**Required:**
- Two or more named concepts (string each), AND/OR
- A passage of V's writing or speaking where the conflation appears

**Optional:**
- The context V is working in (intellectual, brand, technical, etc.)
- A sentence of why V thinks they might be the same (or different) — helps target the disambiguation

## The core move

For each concept:

1. **Name the operation it performs.** What does this concept *do* in a sentence? Not its definition — its *work*. Concepts do work; definitions describe.
2. **Locate it in tradition** (when known). Where does this concept come from? What discipline owns it? This grounds the disambiguation against drift.
3. **Identify what it picks out that the other concept does NOT.** Find the case where the two come apart — the example where treating them as one fails. If you can't find a case, the distinction may not be load-bearing.
4. **Surface the cost of conflation.** What goes wrong if V continues using them interchangeably? Be specific — generic "you'll be imprecise" is not enough.
5. **Or — say they're the same.** If after the analysis the two concepts genuinely don't come apart, say so. Manufacturing distinctions is anti-conceptual-analysis.

## Output format (canonical contract)

This is the **canonical output format** for `distinguish`. Both invocation modes (standalone, agent-called) produce this exact structure. Downstream consumers key off these field names — do not deviate.

```
## Distinguishing [Concept A] from [Concept B] (and [Concept C] if 3+)

**[Concept A]:**
- Operation: [what it does — one sentence]
- Tradition: [where it comes from — one phrase, or "informal" if not from a named tradition]
- Picks out: [the case where this concept lands and the other doesn't — one sentence]

**[Concept B]:**
- Operation: [what it does]
- Tradition: [...]
- Picks out: [the case where this concept lands and the other doesn't]

**The case where they come apart:**
[One concrete example — a situation where treating them as one would fail. Specific. If you can't construct this example, the distinction isn't load-bearing — say so explicitly in the verdict instead.]

**Cost of conflation:**
[What goes wrong if V keeps using them interchangeably. Be specific — generic "you'll be imprecise" is not enough. Tie it to V's actual work where possible.]

**Verdict:** [one of:]
- LOAD-BEARING — the distinction is real and matters; preserve both terms
- COSMETIC — the difference exists but doesn't change anything for V's purposes; pick one
- COLLAPSE — the two concepts genuinely do not come apart; treat them as the same thing
- ASYMMETRIC — A subsumes B (or vice versa); B is a special case of A
```

**Strict rules:**
- Use exactly these field labels. Do not rename, reorder, or merge.
- "Operation" and "Picks out" are required for every concept; no skipping.
- "The case where they come apart" must be a CONCRETE example, not a category. Bad: "in cases where intentionality matters." Good: "When you say 'I read the book' and 'I read the room' — both 'read' but the second isn't decoding symbols."
- "Verdict" is one of the four options above — not a hedge, not a paragraph.
- If the inputs don't have enough material to disambiguate, return: `INSUFFICIENT — [what would help]` and stop. Don't fabricate.

## Agent-callable mode

When called by Fry or another agent, skip conversational scaffolding. Read the input, produce the canonical output bundle, return. Begin with `## Distinguishing [A] from [B]`. End after `**Verdict:**`.

When in standalone mode (V invokes), Fry/Claude can wrap the output in his voice ("Right — there's two things going on here that look like one"). The bundle stays canonical underneath.

## Anti-patterns

- ❌ **Manufactured distinctions.** If A and B genuinely don't come apart, say COLLAPSE. Don't invent a fake difference to justify the call to distinguish.
- ❌ **Definition recitation.** "X means [dictionary definition], Y means [dictionary definition]." That's lookup, not analysis. The Operation field is what each concept *does*, not what it *means*.
- ❌ **Pedantic correctness.** "Technically, in formal philosophy, X is..." — V's not building a philosophy paper. The disambiguation serves V's actual work; tradition-locating is for grounding, not credentialing.
- ❌ **Multi-question expansion.** Distinguish produces *one* output. "Should we also look at how X relates to Z?" — no, that's a separate distinguish call.
- ❌ **The infinite-regress trap.** If splitting A and B reveals a *new* conflation in V's framework, name it, but don't recursively distinguish all the way down. Surface it as a "Parked: distinguish C from D next" line if useful.

## Relationship to other skills

| Skill | Shape | Handoff to/from |
|---|---|---|
| `distill` | Convergence — many threads → one claim | distinguish often *follows* distill (V landed a claim; now disambiguate the terms it uses) |
| `silent-assumption` | Surface unstated dependencies | distinguish often *reveals* a silent assumption (the conflation was the assumption) — hand off |
| `falsify` (via critical-thinking Mode 4) | Test what would disprove a claim | After distinguishing, V's claim usually becomes more falsifiable — hand off |
| `abstract-vs-concrete` | Ladder-climbing | distinguish operates *horizontally* (sibling concepts at same rung); abstract-vs-concrete moves *vertically* — orthogonal |
| `negative-claim` | What would I have to deny? | After distinguish, the negative-claim of A vs B sharpens — hand off if useful |

## What this does NOT do

- Define terms (use a dictionary or domain-specific reference)
- Categorize concepts in a hierarchy (use taxonomy-test, future)
- Recommend which concept V should adopt (that's a strategic choice; distinguish only clarifies)
- Settle a "which is true" debate between two concepts
- Run iteratively — one distinguish call produces one bundle; new conflation = new call
- Fabricate distinctions to justify being called

