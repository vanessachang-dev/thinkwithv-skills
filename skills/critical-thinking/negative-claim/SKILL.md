---
name: negative-claim
description: Contrapositive of falsify — given a position, surface what V would have to *deny* to hold it, and the cost of denying each thing. Useful for value-laden claims where falsifiability is awkward (you can't falsify "I value craft over speed" but you can name what holding that position commits V to denying). Triggers — "what would I have to give up?", "what does this commit me to?", "what's the cost of holding this?", or when V is staking out a position whose downstream commitments she hasn't traced. NOT a generic counterargument generator (use steelman via critical-thinking Mode 2), NOT for testing claims with empirical content (use falsify). Callable by Fry / thinking-partner / V directly.
tags: [ai-os, skills, conceptual-analysis, fry, thinking, position-clarification]
---

# Negative Claim

A transform, not a conversation. Input: a position V is taking (or considering). Output: 1-3 things V is committed to denying if she holds this position, plus the cost of each denial.

The contrapositive of falsify. Where falsify asks *"what would prove this wrong?"* and works on empirical claims, negative-claim asks *"what am I committed to rejecting if I hold this?"* and works on value-laden claims, identity claims, strategic positions, and any case where falsifiability is awkward but the position still has implications.

## When this fires

**Explicit triggers:**
- "What does this position commit me to?"
- "What would I have to give up?"
- "What's the cost of holding this?"
- "What would I have to deny?"
- "What does this rule out?"
- "Negative claim on this"

**Contextual (Fry detects):**
- V is staking out a position (brand, value, strategy, framework) without tracing what it commits her to.
- V holds two positions whose negative-claims contradict — she's about to deny something on track A that she's affirming on track B.
- V's claim is value-laden ("integrity over scale," "depth over breadth") and the implications haven't been named.
- V's making a positive claim about her own work or identity ("Think with V is *not* X") — the *not* is doing the work; surface what's denied.

**Offer once:** "If you hold this, here's what you're committed to denying. Want to see the costs first?"

## When this stays dormant

- V's position is purely empirical and falsifiable — use `falsify` (via critical-thinking Mode 4) instead.
- V is mid-brainstorm, not staking positions yet.
- V already knows the negative claims and has accepted the costs.
- The position is mid-sentence and not yet committed-to — wait until V has named it before tracing implications.

## Inputs

**Required:**
- A position V is holding or considering (one sentence)

**Optional:**
- The context (brand work, strategic decision, framework construction, value commitment)
- What V's *afraid* the cost might be (helps target which negative claim is load-bearing)

## The core move

For each negative claim:

1. **State what V must deny.** Declarative sentence: "Holding [position] requires denying [X]." Not "you might have to deny" — flat statement of commitment.
2. **Locate the implication.** Why does the position require this denial? One sentence — the logical step.
3. **Name the cost.** What does V lose if she denies [X]? Specific — what work does the denied thing do that V would no longer have? If the denial costs nothing, the negative-claim isn't load-bearing.
4. **Rate it.** ACCEPTABLE = V can deny [X] without losing what she values; PAINFUL = V can deny [X] but loses something real; PROHIBITIVE = denying [X] contradicts something else V holds.

Stop at 3. More than 3 load-bearing negative-claims = the position is more entangled than it appears, and that's the verdict.

## Output format (canonical contract)

```
## Negative claims of [V's position, one line]

**Negative claim 1: [Holding [position] requires denying [X]]**
- Why: [logical step — one sentence]
- Cost of denying [X]: [what V loses — specific]
- Verdict: ACCEPTABLE | PAINFUL | PROHIBITIVE

**Negative claim 2: [Holding [position] requires denying [Y]]**
- Why: [...]
- Cost of denying [Y]: [...]
- Verdict: ACCEPTABLE | PAINFUL | PROHIBITIVE

**Negative claim 3: [...]** *(only if a third is genuinely load-bearing)*
- Why: [...]
- Cost of denying [...]: [...]
- Verdict: ACCEPTABLE | PAINFUL | PROHIBITIVE

**Position's standing:**
[ONE of:]
- HOLD — all costs are acceptable; the position is sustainable
- HOLD-WITH-COSTS — at least one painful denial; V holds with eyes open
- RECONSIDER — at least one prohibitive denial; the position contradicts something else V holds
- INDETERMINATE — costs depend on context V hasn't named; surface the missing context
```

**Strict rules:**
- Each negative claim is a declarative sentence. "Holding [position] requires denying [X]." Flat.
- "Cost of denying" must be specific — what work does the denied thing do that V would lose? Generic "you'd be wrong about X" is not a cost.
- "Verdict" is one of three options. PROHIBITIVE specifically means contradicts something else V holds, not "I don't like this."
- "Position's standing" is the synthesis verdict, exactly one of four options.
- Cap at 3 negative claims. More = the position is entangled (an outcome worth surfacing, not papering over).

## Agent-callable mode

When called by Fry or another agent, skip scaffolding. Begin with `## Negative claims of [position]`. End after `**Position's standing:**`. The bundle is the entire output.

## Anti-patterns

- ❌ **Generic counterargument generation.** "You should also consider X" is not a negative claim. The form is *"holding this requires denying X"* — a commitment trace, not a critique.
- ❌ **Identity-claim policing.** Per `identity-vs-empirical.md`: V's identity claims are sealed. Negative-claim works on *strategic* and *positional* claims (which have implications), not identity claims (which are self-defining).
- ❌ **Strawmanning the position.** Steelman first, then trace negatives. If you're tracing implications of a weak version of V's position, the negative-claims are about the weak version, not the actual one.
- ❌ **Manufacturing prohibitive verdicts.** If denying X has a real but acceptable cost, that's PAINFUL. PROHIBITIVE is reserved for actual contradictions — V holding A and B where A's negative-claim is one of B's affirmations.
- ❌ **Cost-listing without "Why."** Skipping the logical step makes the trace look mystical. Always show how the position requires the denial.
- ❌ **More than 3.** If you find 5 load-bearing negative-claims, the position is entangled — return INDETERMINATE or surface the entanglement as the verdict, don't list all 5.

## Relationship to other skills

| Skill | Shape | Relationship |
|---|---|---|
| `falsify` (via critical-thinking Mode 4) | What would prove this wrong? | falsify works on empirical claims; negative-claim works on value-laden / strategic claims — sibling tools |
| `silent-assumption` | Surface unstated dependencies | silent-assumption + negative-claim: assumptions are upstream (what V depends on); negative-claims are downstream (what V is committed to) |
| `steelman` (via critical-thinking Mode 2) | Strongest counter-argument | steelman finds the best opposing case; negative-claim finds what V's own position is committed to denying — different operations |
| `grant-then-test` | Concession move | After negative-claim, grant-then-test the painful denials: assume V holds the position, see if the denials are sustainable |
| `distill` | Convergence on a claim | distill produces the position; negative-claim traces its commitments |

## What this does NOT do

- Generate counterarguments (use steelman via critical-thinking Mode 2)
- Falsify empirical claims (use falsify)
- Police identity claims (out of scope per `identity-vs-empirical.md`)
- Recommend whether V should hold the position (that's V's call; negative-claim only surfaces the commitments)
- Manufacture prohibitive verdicts to seem rigorous

## Real V examples (V to fill in 1-2 from her actual work)

**Example 1 (placeholder):** [V — fill in a real case where holding a brand/strategic/value position committed you to denying something you hadn't realized. What was the position? What was the negative claim? What was the cost?]

**Example 2 (placeholder):** [V — a case where two positions you held had contradictory negative-claims (you were affirming on one track what you were denying on another). How was it resolved?]
