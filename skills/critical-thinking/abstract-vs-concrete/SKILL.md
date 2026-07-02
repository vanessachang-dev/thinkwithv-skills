---
name: abstract-vs-concrete
description: Ladder-climbing primitive — given a claim at one rung of the abstraction ladder, propose the paired move at the other rung. When V's high (frameworks, positioning, theoretical claims), abstract-vs-concrete demands one paragraph of concrete instantiation. When V's low (specific tasks, examples, single cases), it asks for the framework-level statement. Triggers — "is this too abstract?", "ground this for me", "what's the example?", "what's the principle?", "lift this", "drop this". Tightly paired with distill but operates on the vertical axis (rung-climbing) where distill is horizontal (convergence). NOT a generic "give me an example" tool — the discipline is *paired moves* between rungs, not infinite expansion. Callable by Fry / thinking-partner / V directly.
tags: [ai-os, skills, conceptual-analysis, fry, thinking, abstraction-ladder]
---

# Abstract vs Concrete

A transform, not a conversation. Input: a claim at one rung of the abstraction ladder. Output: the paired move at the other rung — a concrete instantiation if V's high; a framework-level statement if V's low.

The abstraction ladder is from S.I. Hayakawa via the General Semantics tradition (also used by Bret Victor, Tim Urban, and clear-thinking writers generally). The discipline: high-rung claims need one concrete case to ground them; low-rung cases need one framework-level statement to locate them. Rung-climbing is the test that V's claim *works at multiple rungs* — if it doesn't, that's diagnostic.

## When this fires

**Explicit triggers:**
- "Is this too abstract?"
- "Ground this for me"
- "What's the example?"
- "What's the principle here?"
- "Lift this" (low → high)
- "Drop this" (high → low)
- "Climb the ladder"

**Contextual (Fry detects):**
- V's claim is high-rung framework with no concrete instantiation in 5+ minutes of conversation. (Frameworks without instances are floating.)
- V's claim is low-rung specific case but the implicit pattern hasn't been named. (Specifics without principles are anecdotes.)
- V's *moving* between rungs without realizing it — switching mid-argument from high to low or vice versa, hiding a category error.
- V's stuck on the abstract claim and a concrete case would unstick — or stuck on the concrete and the abstract would.

**Offer once:** "Want to drop this to a concrete case?" or "Want to lift this to the framework-level statement?"

## When this stays dormant

- V is intentionally working at one rung — the ladder-climb would derail.
- The claim is identity-claim and neither rung is testable (per `identity-vs-empirical.md`).
- V already has both rungs and is just naming both for clarity.
- The "concrete" version would be a personal anecdote that distracts from the analytical work.

## Inputs

**Required:**
- A claim at one rung — high (framework, principle, theoretical) or low (specific case, example, single instance)

**Optional:**
- Direction (V can specify "lift" for low→high or "drop" for high→low; skill detects if not specified)
- Domain context (some ladders are domain-specific — what's high in cognitive science is different from what's high in branding)

## The core move

1. **Detect the rung.** Read the input claim. Is it high (framework, principle, abstraction) or low (instance, case, example)? If unclear, surface the ambiguity — the claim may be middle-rung and need ladder-clarification first.
2. **Pick the direction.** If high, drop. If low, lift. (V can override.)
3. **Make the paired move.**
   - HIGH → LOW (drop): Produce ONE concrete case where the high-rung claim shows up. Specific. With detail.
   - LOW → HIGH (lift): Produce ONE framework-level statement that this case is an instance of. The principle, named.
4. **Test the pairing.** Does the high claim *survive* the concrete case? Does the concrete case *fit* the framework cleanly? If either answer is no, that's diagnostic — the claim doesn't work at multiple rungs, and the diagnosis is the value.

## Output format (canonical contract)

```
## Abstract-vs-concrete on [V's input claim, one line]

**Detected rung:** HIGH | LOW | MIDDLE-AMBIGUOUS

**Direction:** DROP (high → low) | LIFT (low → high)

**Paired move:**
[For DROP: one concrete case. Specific, with detail. ~50-150 words.]
[For LIFT: one framework-level statement. The principle, named, located in tradition where possible. ~30-80 words.]

**Pairing test:**
- Does the high claim survive the concrete case? YES | NO | PARTIAL
- Does the concrete case fit the framework cleanly? YES | NO | PARTIAL

**Verdict:**
[ONE of:]
- LADDER-INTACT — the claim works at both rungs; V can move between them freely
- HIGH-FLOATS — the framework doesn't survive concrete instantiation; V needs to refine the framework or honestly call it gestural
- LOW-DOESN'T-FIT — the case doesn't fit the framework V tried to lift it to; V needs a different framework or to recognize it's sui generis
- MIDDLE-AMBIGUOUS — V's claim is at an indeterminate rung; clarify rung before continuing

**Recommended next move:**
[ONE sentence — what V does given the verdict.]
```

**Strict rules:**
- Detected rung: one of three options. If MIDDLE-AMBIGUOUS, the skill ends there with the diagnostic — clarify rung, then re-run.
- Paired move: ONE concrete case OR ONE framework statement. Not 3 examples. Not a list. The discipline is *one paired move*, not exhaustive expansion.
- Pairing test: explicit YES/NO/PARTIAL on both questions.
- Verdict: one of four options.
- Cap output at ~250 words. Brevity is the point — the ladder-climb is a quick diagnostic, not an essay.

## Agent-callable mode

When called by Fry or another agent, skip scaffolding. Begin with `## Abstract-vs-concrete on [claim]`. End after `**Recommended next move:**`. The bundle is the entire output.

## Anti-patterns

- ❌ **Multi-example expansion.** "Here are three concrete cases..." — cut to one. The discipline is paired-move, not list-of-examples.
- ❌ **Anecdote drift.** When dropping high-to-low, the concrete case must be analytically clean — not "here's a story from my life." Personal cases are fine if they're load-bearing for the analysis; not fine if they're decorative.
- ❌ **Ladder-skipping.** If V's claim is at rung 3 and you drop to rung 5 (skipping rung 4), the move doesn't test the framework — it bypasses the rungs that matter. Drop one rung at a time.
- ❌ **Framework inflation.** When lifting low-to-high, don't reach for grand-theory if a mid-rung framework fits. "This is an instance of [niche pattern]" beats "this is an instance of how reality works."
- ❌ **Pairing-test hedging.** "Sort of works..." — pick YES, NO, or PARTIAL. Hedging defeats the diagnostic.
- ❌ **Pairing-test optimism.** Don't manufacture YES verdicts. If the framework doesn't survive the concrete case, the verdict is HIGH-FLOATS — that's the *useful* finding.

## Relationship to other skills

| Skill | Shape | Relationship |
|---|---|---|
| `distill` | Horizontal convergence (many threads → one claim) | abstract-vs-concrete is the *vertical* counterpart — operates on rungs, not threads. Often paired: distill produces the claim; abstract-vs-concrete tests it works at multiple rungs |
| `distinguish` | Disambiguate concepts (horizontal at same rung) | distinguish operates within a rung; abstract-vs-concrete moves between rungs — orthogonal |
| `silent-assumption` | Surface unstated dependencies | abstract-vs-concrete may reveal a silent assumption (the framework assumed an instance type that doesn't exist) — hand off |
| `negative-claim` | Commitment trace | negative-claims at one rung may not hold at another — useful pairing |
| `falsify` (via critical-thinking Mode 4) | What would prove this wrong? | abstract-vs-concrete is upstream: ground the claim at both rungs, then falsify the appropriate-rung version |

**Common pipeline:** distill → abstract-vs-concrete → falsify or silent-assumption. distill produces the claim; abstract-vs-concrete grounds it at multiple rungs; the appropriate-rung version is then testable.

## What this does NOT do

- Generate multiple examples or instances (one paired move only)
- Settle "is this true at the abstract level" (use falsify)
- Run V's framework through every possible concrete case (one drop, then stop)
- Climb arbitrary rungs (one rung at a time; skipping defeats the diagnostic)
- Manufacture LADDER-INTACT verdicts when the claim genuinely doesn't survive

