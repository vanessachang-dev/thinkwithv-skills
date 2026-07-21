---
name: grant-then-test
description: Dialectical concession move — given an argument V is fighting on what may be a side-issue, stipulate the contested claim is true and test whether V's actual position survives. Often dissolves disagreements by revealing the contested point isn't load-bearing for V's main position. Triggers — "let's assume X is true", "grant me X", "even if you're right about Y", "set aside whether...", or when V is defending a flank that may not matter to her core position. NOT for genuine empirical disputes where the contested claim IS the main thing (use falsify instead). Callable by Fry / thinking-partner / V directly.
tags: [ai-os, skills, conceptual-analysis, fry, thinking, dialectic]
last-verified: 2026-07-20
---

# Grant Then Test

A transform, not a conversation. Input: an argument V is fighting on a contested claim, plus the position V actually cares about. Output: a stipulated grant of the contested claim followed by a downstream test of whether V's main position survives the grant.

The dialectical concession move. From classical dialectic (Socratic *epagoge*; Aristotelian *dialektikē*; Hegel's negation): the most efficient way to resolve a stuck argument is often *not* to litigate the contested point but to grant it for argument's sake and follow the implications to V's actual position. Most disputes dissolve here — V was defending a flank; the main position survives the concession.

## When this fires

**Explicit triggers:**
- "Let's assume X is true"
- "Grant me X for a moment"
- "Even if you're right about Y..."
- "Set aside whether Z..."
- "Suppose X — then what?"
- "Grant-then-test on this"

**Contextual (Fry detects):**
- V is litigating a flank claim while her core position has been clear from the start.
- The contested claim is empirical/factual but V's main position is strategic — they may not be coupled.
- The argument has been on the same point for 3+ exchanges without convergence.
- V says "the real thing here is..." while still arguing the side-issue.
- Two parties are disputing X but their actual disagreement is about Y; the X-dispute is decorative.

**Offer once:** "Let's grant [the contested point]. Does your actual position still hold?"

## When this stays dormant

- The contested claim IS the main position. (V's actual position is about the contested point — granting it is granting everything; use a different tool.)
- V is still gathering material; not ready for synthesis yet.
- The dispute is identity-claim level, not strategic — granting an identity-claim is incoherent.
- V is in pure exploration mode and the litigation is intentionally generative.
- The main position hasn't been named yet — name it first (use distill), then grant-then-test.

## Inputs

**Required:**
- The contested claim (what's being fought over) — one sentence
- V's actual position (what V cares about defending) — one sentence

**Optional:**
- Why the dispute matters to V (helps assess whether the grant is safe)
- The opposing party's position (when there's an external dispute, not just internal)

## The core move

1. **Name the grant.** State the contested claim flat: "Stipulating [contested claim] for the purposes of this analysis."
2. **Trace the implications of the grant.** What follows from the contested claim being true? One or two steps, no more.
3. **Test V's main position against those implications.** Does V's main position survive? Is it weakened? Untouched? Strengthened?
4. **Verdict on the dispute.**
   - SIDE-ISSUE — V's main position survives; the contested claim was a flank
   - LOAD-BEARING — V's main position fails when contested claim granted; the dispute is real
   - REFRAMED — V's main position needs restating in light of the grant; the dispute revealed a hidden coupling
   - GROUNDED — V's main position becomes *stronger* under the grant (an unusual case but worth surfacing)

The output of this skill should be SHORT — usually under 200 words. The work is geometric (clean up the argument's shape), not exhaustive.

## Output format (canonical contract)

```
## Grant-then-test on [contested claim]

**Grant:** Stipulating [contested claim] is true.

**Implications of the grant:**
[One or two steps that follow from the grant. No more — too many = manufacturing a chain.]

**V's main position under the grant:**
[V's actual position, restated in light of the grant.]

**Verdict:** SIDE-ISSUE | LOAD-BEARING | REFRAMED | GROUNDED
- SIDE-ISSUE: V's main position survives the grant. The contested claim doesn't matter for V's core argument. *Drop the dispute.*
- LOAD-BEARING: V's main position fails when contested claim granted. The dispute is real and central. *Continue litigating.*
- REFRAMED: V's main position needs restating to accommodate the grant. *The dispute revealed a coupling V hadn't seen.*
- GROUNDED: V's main position is *strengthened* under the grant. *Use this; the grant accidentally bolstered V.*

**Recommended next move:**
[ONE sentence — what V does given the verdict.]
```

**Strict rules:**
- Implications: 1-2 steps maximum. Long chains = the skill is reaching, not testing.
- The grant is unconditional — once stipulated, it's true for the analysis. No "but maybe X" qualifications.
- Verdict is one of four options, no hedges.
- Total output under ~200 words. The skill's value is in geometric cleanup, not exhaustive trace.

## Agent-callable mode

When called by Fry or another agent, skip scaffolding. Begin with `## Grant-then-test on [contested claim]`. End after `**Recommended next move:**`. The bundle is the entire output.

## Anti-patterns

- ❌ **Granting and then re-litigating.** Once the grant is made, treat it as true. If the analysis keeps disputing the granted claim, the skill failed.
- ❌ **Long implication chains.** 5-step chains where each step is "and therefore..." — that's not testing, that's manufacturing. Cap at 2 steps.
- ❌ **Granting the actual main position.** If the contested claim IS V's main position, the skill collapses. Detect this upfront and refuse: "The contested claim is your position; granting it is granting everything. Use falsify or distinguish instead."
- ❌ **Verdict-by-paragraph.** "Well, it depends on..." Cut. The verdict is one of four options; the dispute either dissolves or it doesn't.
- ❌ **Identity-claim grants.** Granting "you're not really a founder" is incoherent — identity claims aren't testable propositions. Out of scope per `identity-vs-empirical.md`.
- ❌ **Strawmanning before granting.** Grant the *strongest* version of the contested claim, not a weak version. Steelman in, then test.

## Relationship to other skills

| Skill | Shape | Relationship |
|---|---|---|
| `steelman` (via critical-thinking Mode 2) | Strongest counter-argument | steelman finds the best version of the contested claim; grant-then-test stipulates it true and traces consequences — sequential pair |
| `falsify` (via critical-thinking Mode 4) | What would prove the claim wrong? | falsify litigates the contested claim directly; grant-then-test sidesteps it. Use falsify when the contested claim IS the dispute; grant-then-test when it's a flank |
| `silent-assumption` | Surface unstated dependencies | silent-assumption may *reveal* that the contested claim isn't load-bearing — making grant-then-test the right next move |
| `negative-claim` | Commitment trace | negative-claim of V's main position may show the contested claim is or isn't required — informs whether to grant-then-test |
| `distinguish` | Disambiguate concepts | If the contested claim hinges on a conflation, distinguish it first, then grant the cleanly-distinguished version |

## What this does NOT do

- Resolve genuine empirical disputes (use falsify)
- Settle which party in an external dispute is "right" (the skill works on argument geometry, not adjudication)
- Manufacture concession to "be polite" — the grant must be honest stipulation
- Run iteratively on the same dispute (one call produces the verdict; if reframed, V re-runs with the new framing)

## Real V examples (V to fill in 1-2 from her actual work)

**Example 1 (placeholder):** [V — fill in a real case where you were litigating a flank claim that turned out to be SIDE-ISSUE — granting it dissolved the dispute and revealed your main position survived. What was the contested claim? What was your main position?]

**Example 2 (placeholder):** [V — a case where grant-then-test produced REFRAMED — the grant revealed a coupling you hadn't seen, and your main position needed restating. The skill is best demonstrated here, since SIDE-ISSUE is the easy case.]
