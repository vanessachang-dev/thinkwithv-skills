# AAA Discipline — Worked Examples

This file shows the Arc / Attribution / Artifact disciplines from `SKILL.md` applied to real conversation types. The examples are load-bearing: instructions alone do not reliably hold the discipline. When in doubt, match the register of these positive examples.

The four conversation types below cover most cases. The verbs and patterns transfer.

---

## Engineering session (task execution)

### What Happened — Arc discipline

❌ **Event-listed (avoid):**
> User asked about adding auth to /api/users. Claude proposed JWT. User asked about session timeout. Claude explained options. User picked sliding sessions. Claude scaffolded the middleware. User reviewed and caught a missing CSRF check.

✓ **Arc-traced:**
> The session started as a request to add authentication to a single endpoint, but the question of session-timeout behavior reframed it into a broader policy decision: the user chose sliding sessions for UX over hard-timeouts for security, accepting the trade-off explicitly. The middleware then scaffolded straightforwardly; the substantive moment came on review when the user caught a missing CSRF check that the initial scaffolding had not surfaced.

### Decisions Made — Attribution discipline

❌ **"We" collapses contribution:**
> - Decided to use sliding sessions: better UX.
> - Added CSRF protection: standard practice.

✓ **Actor-named:**
> - **Sliding sessions over hard timeouts** — user weighed UX against security and chose sliding, accepting the trade-off explicitly. Assistant had proposed both with neutral framing.
> - **CSRF protection** — user caught the gap during review of the assistant's initial scaffolding; assistant added the middleware on direction.

---

## Values / thinking conversation

### What Happened — Arc discipline

❌ **Restated, not traced:**
> User talked about wanting a more meaningful career. Claude offered some frameworks. User reflected. Claude summarized.

✓ **Arc-traced:**
> The conversation began as a question about whether to take a higher-paying role at a less mission-aligned company, but the user reframed mid-thread when she noticed she was treating "meaningful" as a fixed property of the company rather than a property of the relationship she had to her work. The conversation landed on a different question: what kind of agency she wanted to feel inside any role, regardless of mission framing.

### Quotable Moments — Attribution discipline

❌ **Co-authored language:**
> We figured out that meaning isn't a property of the company.

✓ **First-person, attributed:**
> The user, in her own words: *"I think I've been treating 'meaningful work' like a thing I can pick up off a shelf. But it's not a property of the job — it's a property of how I show up to it."* Assistant offered the term *agency-meaning vs. mission-meaning* as a possible distinction; user adopted the framing for the rest of the conversation.

---

## Decision conversation

### Decisions Made — Attribution discipline

❌ **"Came to" hides the move:**
> We came to the conclusion that Option B was right.

✓ **Named contributions:**
> User listed three options with associated trade-offs; assistant proposed an additional consideration (compounding maintenance cost over 12 months) that user had not foregrounded. User then rejected Option A, weighed B against C, and chose B — citing the maintenance-cost framing as the deciding factor.

### Open Threads — Artifact discipline

❌ **References the conversation context:**
> The thing we mentioned earlier about reversibility is still unresolved.

✓ **Self-contained:**
> Whether Option B is reversible inside one quarter (vs locking the team in for ~2 quarters) was raised but not resolved. Worth confirming with engineering before commitment.

---

## Debugging session

### Synopsis — Salience and Arc

❌ **Inflates a low-anchor session:**
> Synopsis: A deep exploration of build configuration that produced significant insights about TypeScript's compiler options.

(The conversation was actually: "my build is broken" → "looks like your tsconfig has `moduleResolution: node` but Node 18 wants `node16`" → "fixed, thanks.")

✓ **Honest about salience:**
> Synopsis: Build was failing because `tsconfig.json` had `moduleResolution: node` while the project runs on Node 18+, which expects `node16`. Single-fix session, no larger pivots.

### What Happened — Arc discipline (when there's no real arc)

❌ **Inflates a flat session:**
> The work began with a build failure but evolved into a broader investigation...

✓ **Honest about flat-arc:**
> Single-topic execution: user reported the build error, assistant identified the `moduleResolution` mismatch, user applied the fix and confirmed. No significant pivots.

---

## Pattern reference (verbs)

The verbs below are the register, not a closed list. New verbs that match the register are fine. Verbs that obscure the actor (e.g. "we figured out", "it was decided", "the issue surfaced") are not.

**User verbs (the user does these):**
*directed, asked, decided, caught, reframed, pushed back, named, surfaced, clarified, refined, chose, rejected, noticed, vetoed, recognized, distinguished, articulated, weighed, raised, confirmed.*

**Assistant verbs (Claude does these):**
*drafted, proposed, scaffolded, explained, generated, suggested, summarized, restated, investigated, recommended, offered, identified, surfaced (a possibility, not a conclusion), framed.*

**Forbidden patterns:**
- "we" + action verb when only one party did the thing
- passive voice that hides the actor ("X was decided", "the issue was identified")
- narrating assistant work as user accomplishment ("user implemented X" when the assistant wrote the code on direction)
- inflating salience ("a deep exploration of…" when the conversation was a 5-message lookup)
