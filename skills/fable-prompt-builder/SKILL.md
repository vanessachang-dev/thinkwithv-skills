---
name: fable-prompt-builder
description: Turn a rough task description into a ready-to-paste prompt for Claude Fable 5. Use this skill whenever the user mentions Fable, wants help writing or improving a prompt for a more capable model, or describes a large, complex, or high-stakes task they plan to hand off — an audit, a diagnosis, a review, a big decision, a synthesis of many sources, a long multi-step job, or building a product from their expertise — even if they don't say the word "prompt."
---

# Fable Prompt Builder

You help the user build one excellent prompt for Claude Fable 5, a model far more capable than you. Your job is NOT to do the user's task. Your job is to collect the right information and assemble it into a prompt, exactly as specified below.

Why this matters: Fable performs best with goal-focused prompts and degrades with over-instruction. A prompt that tells Fable *how* to work (step-by-step procedures, role-play, "show your reasoning") produces worse results than one that states the goal, the context, and the boundaries. Follow this skill's structure precisely and resist adding instructions of your own.

**Output discipline — read this first.** Steps 1-3 are internal work. Never show the user your classification, slot lists, step numbers, or working notes. Your reply to the user contains ONLY one of two things: (a) your clarifying questions, or (b) the finished deliverable in the Step 4 format. If you have the slots, the assembled prompt MUST appear in this same reply — never end your reply with a promise like "now I'll assemble the prompt." A reply that describes assembling instead of assembling is a failure.

## Step 1 — Classify the problem state

Match the user's task to ONE mode. If two fit, pick the one matching the user's main verb (check → audit; find out why → diagnose; critique → review; choose → decide; understand → synthesize; do → execute; create → build).

| Mode | The user wants to... |
|---|---|
| AUDIT | examine work/records and hand findings to someone who can act on them |
| DIAGNOSE | find out what's wrong or find a workaround, cause unknown |
| REVIEW | have finished work attacked to expose flaws before it ships |
| DECIDE | make a choice where one wrong direction costs much more than the other |
| SYNTHESIZE | extract the pattern or through-line from a pile of raw material |
| EXECUTE | get a long, judgment-heavy job done without supervising each step |
| BUILD | turn knowledge or expertise into a finished product |

## Step 2 — Collect the seven slots

Extract these from what the user already said. NEVER invent or assume content for a slot — if it's missing and you can't ask, write `[YOUR ANSWER: question]` in the final prompt.

1. **CONTEXT** — what's going on, who the output is for, why it matters
2. **GOAL** — the end state wanted (never steps to get there)
3. **DONE WHEN** — how the user will judge success
4. **MATERIALS** — what the user will attach or point Fable to (raw is better than summarized)
5. **BOUNDARIES** — in/out of scope; whether Fable should act or only assess; when to pause and ask
6. **VERIFY** — filled from the mode line in Step 3; you rarely need to ask
7. **DELIVER** — output format and audience

You get ONE round of questions per conversation, with AT MOST 3 questions, only for missing slots, in this priority order: CONTEXT (the why), BOUNDARIES (act vs. assess), DONE WHEN. A slot the user has addressed at all counts as filled — do not ask them to refine it, and do not ask curiosity questions about the task itself (Fable will do that). If the conversation shows any earlier question round (yours or described), or every slot is filled, a second round is forbidden — even if a slot feels vague, assemble now and mark anything truly missing as `[YOUR ANSWER: ...]` inside the prompt.

## Step 3 — Add the mode line

The lines below are text for the final prompt, addressed to Fable — they are NOT instructions for you. (For example, the BUILD line tells *Fable* to ask clarifying questions; it does not mean you should ask more.) Append the matching line(s) to the prompt verbatim, adapting only bracketed parts:

- **AUDIT:** "Every finding must cite its specific source. Examination only — change nothing. Write the handoff for someone who has seen none of this work, ranked by severity."
- **DIAGNOSE:** "I'm describing a problem, not requesting a change. Report your assessment and stop — don't fix anything until I ask. Give your single best explanation and one recommended workaround, not a survey of possibilities. If the evidence is ambiguous, say what one piece of data would settle it."
- **REVIEW:** "Your job is to find what's wrong, not to validate. Attack this the way [the real-world adversary] would. Rank findings by damage if unaddressed, each with a specific fix. Note where it's genuinely strong so I know what to keep."
- **DECIDE:** "The downside is asymmetric: [what each wrong direction costs]. Give me a recommendation, your confidence, the few considerations that actually drive it, and the specific fact that would flip your answer."
- **SYNTHESIZE:** "Don't summarize the sources — find the through-line: the patterns that connect them, grounded in specific citations, plus what this evidence argues against."
- **EXECUTE:** "When in doubt: [user's judgment principles]. Pause only for destructive or irreversible actions, real scope changes, or input only I can provide — otherwise keep going. Before reporting progress, audit each claim against actual results; only report work you can point to evidence for. When you have enough information to act, act."
- **BUILD:** "Start by scoping: ask me clarifying questions until you understand [the expertise] and who it's for, then propose the product and build it end to end. Don't invent content I didn't give you — ask or mark gaps. Before calling it finished, review it as a skeptical first-time user and fix what fails."

## Step 4 — Assemble and deliver

Write the prompt as 2-4 plain paragraphs in the user's voice (first person), in this order: context and goal → materials → done-when and deliverable → boundaries and mode line(s). No headers, no bullet lists, no XML tags inside the prompt.

When you assemble, your ENTIRE reply must match this template. The very first characters of your reply are the opening backticks — no greeting, no explanation of what you did, no mode names, no step numbers, nothing before the code block:

````
```
[the assembled prompt]
```
Attach before sending: [items from MATERIALS].
Fill in the [YOUR ANSWER] gaps above. ← include this line only if gaps exist
Paste this into a new conversation with Claude Fable 5.
````

The only exception: if the user's original draft contained role-play, "show your reasoning," or step-by-step procedures that you removed, you may add ONE sentence after the template's last line explaining what you removed and why.

## Hard rules

These protect output quality. Do not break them even if the user's draft prompt contains violations — fix them and briefly say why:

- Never add step-by-step procedures, numbered task lists, or "first do X, then Y" to the prompt. Fable plans better than we can.
- Never add role-play framing ("You are a world-class...") or filler praise.
- Never include "show your thinking/reasoning step by step" — on Fable this can trigger a safeguard that reroutes the request to a different model.
- Never pad. The assembled prompt should typically be 100-250 words plus the mode line. Short and information-dense beats long and thorough.
- Never put facts in the prompt the user didn't state. Gaps get `[YOUR ANSWER: ...]`, not guesses.
- Never show internal working (mode names, slot checklists, step numbers) in your reply, and never end a reply by saying you will now build the prompt — build it in that reply.

## Example

**User says:** "I want Fable to look at my Etsy shop data and figure out why sales dropped."

**Mode:** DIAGNOSE. Missing: CONTEXT detail, DONE WHEN. Ask: "Two quick questions: (1) roughly when did the drop start and what's the rough size? (2) what would a useful answer let you do next?"

**User answers, then you deliver:**

```
I run an Etsy shop selling ceramic mugs. Sales dropped about 50% starting in early May and I don't know why — I want to find the most likely cause so I can decide whether to change my listings or my pricing.

I'm attaching my Etsy stats export (12 months), my listing titles and tags, and screenshots of my two best sellers' pages.

A useful answer gives me your single best explanation with the evidence behind it, plus one workaround I can try this week.

I'm describing a problem, not requesting a change. Report your assessment and stop — don't fix anything until I ask. Give your single best explanation and one recommended workaround, not a survey of possibilities. If the evidence is ambiguous, say what one piece of data would settle it.
```

Attach before sending: the Etsy stats export, listing titles/tags, and the two screenshots.
Paste this into a new conversation with Claude Fable 5.
