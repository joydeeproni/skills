---
name: lena-kul-case-study
version: 1.2.0
description: >
  MUST trigger when writing, rewriting, reviewing, or structuring a product design
  or UX research case study, portfolio project, or application-stage write-up.
  Trigger phrases: "write a case study", "portfolio case study", "UX case study",
  "product design case study", "research case study", "Lena Kul", "Lena Cook",
  "case study skeleton", "application case study", "portfolio deep dive",
  "I'm not getting interviews", "fix my case study", "help me present this project".
  Also trigger when the user drops screenshots, Figma links, or a vague project
  idea and wants a case study from it. Interview with native multiple-choice
  (AskUserQuestion / AskQuestion / ask_user_question / CLI A–D), ONE question per
  turn; propose probable write-up after each beat. NEVER dump an essay questionnaire.
  Do NOT trigger for the repo's commit-to-Notion ux-case-study workflow, or for
  generic UI polish with no case-study intent.
---

# Lena Kul Case Study Framework

## Credits and attribution (required)

This skill encodes **Lena Kul’s** case-study skeleton. It is not an original methodology.
The nine-part structure, the application vs deep-dive split, ownership-not-deliverables,
direction-before-screens, impact signals, outcomes vs impact, and growth-mindset reflection
are hers. This repo only operationalizes them for an agent.

| | |
|---|---|
| **Author** | [Lena Kul](https://www.youtube.com/@LenaKul) |
| **Source** | *[Why Your Portfolio Fails \| For Product Design and UXR](https://www.youtube.com/watch?v=vffNnpoWaeA)* |
| **Watch** | https://www.youtube.com/watch?v=vffNnpoWaeA |
| **Subscribe** | [youtube.com/@LenaKul](https://www.youtube.com/@LenaKul) · same video: https://www.youtube.com/watch?v=vffNnpoWaeA |

Full credit block: `CREDITS.md` in this skill folder.

**When you use this skill:** in the *conversation* with the user (not inside their
portfolio write-up — that would look like a job-application CTA), name Lena Kul, link
the video, and invite them to [subscribe to her channel](https://www.youtube.com/@LenaKul).
Do this on first use in a session. Do not imply the case study text is Lena’s writing
about *their* project.

---

**STOP. Do not assemble a full case study yet.** Interview with native pickers
(`interactive-intake.md`). You *will* propose short write-ups beat by beat.

Hiring teams scan. They do not reconstruct your thinking from pretty screens.

Hiring teams scan. They do not reconstruct your thinking from pretty screens.
This skill writes case studies as a **hiring narrative** — stage, problem, ownership,
direction, impact — not as a process dump, a Dribbble carousel, or a "I made wireframes" list.

Mix and match Lena’s skeleton; keep what serves the story you are trying to land with a
recruiter or hiring manager.

## When this triggers

Use this skill when the user wants a **case study** for job applications or interview
deep dives — including a one-liner, a dump of screenshots, a Figma file, or a messy
existing write-up.

**Skip** when:
- they want the commit-history Notion essay (`ux-case-study` skill)
- they want UI polish with no portfolio narrative (`this-doesnt-look-good`)
- they already gave a complete brief *and* asked only for copy-edit of existing text
  that already follows this skeleton (then edit in place; still flag missing impact/role)

## Two versions (pick one first)

Ask which artifact they need **with the native one-question picker** (see
`interactive-intake.md`). Default to **application** if they are applying or
"not getting callbacks." Default to **deep dive** if they have an interview or
portfolio walkthrough.

| Version | Who reads it | Length | Skeleton |
|---|---|---|---|
| **Application** | Recruiter / hiring manager scanning | Short, scrollable, one screen of story | Parts **1–5** only |
| **Deep dive** | Hiring manager in a portfolio interview | Expandable; you will *present* it | Parts **1–9** |

Never bury the application version under research plans, 15 screens, or a full
double-diamond recap. Scan-first. Deep dive is where approach, solution detail,
outcomes, and reflection live.

---

## The skeleton

Nine parts. Application = 1–5. Deep dive = all nine.

### 1. Stage setting

What was the company? **Why the problem mattered now.** What threats existed if it
wasn't solved. The **tension between user and business**. This proves you understand
business context — not a Wikipedia blurb about the company.

Write so a stranger gets stakes in a few sentences.

### 2. Problem

Business problem **and** user problem. Initial assumptions. Knowledge gaps. **What
turned out to be wrong.** The plot is the correction, not the brief you were handed.

### 3. Role

Not "I did prototypes and wireframes."

- What did you **own**?
- What was the **scope**?
- What was your **influence**?
- Did you **initiate** any of it?

This is seniority. It shows you can scope work without waiting to be assigned.

### 4. Direction

Show the **decision**, in overview, *before* final screens. Not why, not how — the
bet you took. Prevents "here's the polished UI" from arriving before the reader
knows what you chose.

### 5. Impact

Companies hire for value in little time. **No impact is a massive miss** — it reads
as not thinking about the business.

If nobody tracked metrics, still show **signals**:
- What changed for **users**?
- What changed for **business**?
- What changed for **you** (craft, judgment)?
- What changed in **process / collaboration**?
- Which **hypothesis** about the problem did you change?
- Did you **avoid a risk** or open an **unmeasured opportunity** you can argue is a win?

Thinking about impact *is* the win when numbers are thin. Never leave this blank.

### 6. Approach and rationale *(deep dive)*

How you think: hypotheses, **trade-offs**, failed concepts, stakeholders with you
or against you, **key research insights** (not the research plan), **constraints**.

Constraints create tension: not enough time, people, access to users, ability to
scale. Then: how you went around it. Flexibility and adaptability.

### 7. Final solution *(deep dive)*

**Product design:** visual — animated prototype, working product, or a **couple** of
screens. Highlight **what actually changed** and explain what/how. Never 15 unexplained
screens.

**Research:** the "solution" may be a prototype, a shipped feature you informed, a
**new research question**, or a **change of product direction**. Visualize the
decision, not a 40-page report.

### 8. Outcomes *(deep dive)*

What came out of the work. Distinct from impact:

> **Outcome** = what your effort produced (the thing that exists now).
> **Impact** = the needle that moved because of that outcome.

Example: you redesigned onboarding.
- Outcome: more users completed the flow.
- Impact: more cash / activation / retained accounts.

Keep it simple. Don't make the user invent a metrics science project.

### 9. Reflection *(deep dive)*

Seniority and **growth mindset** (it is on scorecards). How you led. What you
learned. What you would do differently. Optional next steps.

---

## Hard rules

1. **Help them write — don't make them write an essay.** Intake is **one native
   multiple-choice question per turn**, then a **probable write-up** they tap to
   keep or refine. Follow `interactive-intake.md`. Never dump 5–12 open questions.
2. **Use the workspace / CLI picker.** Claude Code: `AskUserQuestion`. Cursor:
   `AskQuestion`. Codex: `ask_user_question`. If the tool is missing: lettered
   A–D in chat. Never prefer a wall of prose over a picker that exists.
3. **Refine in public.** After each confirmed beat, update the running draft and
   rewrite earlier slots if new answers contradict them. Change the *next*
   question when they reject your guesses — don't reshuffle the same three options.
4. **Never fabricate** metrics, quotes, insights, stakeholders, or "I owned X."
   Mark gaps; ask; or write "unmeasured — signal was…"
5. **Role ≠ deliverables.** Ban "I created wireframes / user flows / a design system"
   as the role section unless ownership and influence sit next to them.
6. **Impact ≠ outcomes.** If they collapse the two, separate them.
7. **Direction before decoration.** Do not lead with final UI.
8. **Few screens, annotated.** Suggest shots via picker; refuse a gallery dump.
9. **Insights, not plans.** No full research protocol in the study.
10. **Mix and match.** Drop a part only if the narrative still lands; never drop
    **role** or **impact** (or impact *signals*).
11. **Write for a stranger.** Assume the reader has never seen the product.

---

## Workflow

### Step 0 — Classify the ask (one picker each, skip if known)

1. **Discipline:** product design vs research vs hybrid (changes part 7).
2. **Version:** application (1–5) vs deep dive (1–9).
3. **Input quality:** complete story / partial / screenshots only / existing weak study.

If they pasted an old case study, diagnose against the skeleton in one short
scorecard (what’s missing), then picker only the holes — never a full form.

### Step 1 — Interactive intake (mandatory)

**Read and follow `interactive-intake.md`.** That file is the interview.

Do **not** ask them to reply with an essay. Sequence:

1. Native picker — **one** skeleton beat (options inferred from what they already said).
2. You write the **probable copy** for that beat (2–5 sentences, hiring voice).
3. Native picker — keep / shorter / more senior / facts are wrong.
4. Merge into the running draft; rewrite earlier beats if needed; next beat.

Beat order and host tools (Claude `AskUserQuestion`, Cursor `AskQuestion`,
Codex `ask_user_question`, CLI A–D) live in `interactive-intake.md`.

The lists below are **what each beat must eventually contain**, not a form to paste
into chat.

If they only dropped images: first picker is what the pictures appear to be; then
stakes, ownership, impact — pictures never contain those.

#### Application beats (parts 1–5) — fill via pickers, not a questionnaire

**Stage:** company in recruiter English; why it mattered *now*; threat if unsolved;
user vs business tension.

**Problem:** user problem and business problem separately; assumption; knowledge gap;
what turned out to be wrong.

**Role:** owned vs contributed; influence; scope; initiation — not a tool list.

**Direction:** the bet vs the obvious alternative; what you did not do.

**Impact:** users / business / you / process / unlearned / risk or opportunity;
number or honest unmeasured signal.

#### Deep-dive beats (parts 6–9) — only after 1–5 are confirmed in the running draft

**Approach:** hypotheses, trade-offs, failed concepts, stakeholders, key insight
(not the research plan), constraints and workaround.

**Solution:** shipped UI / prototype / research decision; 2–4 annotated moments.

**Outcomes vs impact:** what exists now vs the needle that moved.

**Reflection:** how you led; learned; would do differently; next step.

### Step 2 — Gate: do not assemble the full piece until the minimum is present

Probable copy per beat is allowed. A polished end-to-end case study is not, until:

| Must-have before drafting | Application | Deep dive |
|---|---|---|
| Stage (why it mattered now + tension) | ✓ | ✓ |
| Problem (user + business; at least one wrong assumption or gap) | ✓ | ✓ |
| Role (own / scope / influence — not a tool list) | ✓ | ✓ |
| Direction (the bet, one sentence) | ✓ | ✓ |
| Impact or explicit **signals** | ✓ | ✓ |
| Approach: insight + one trade-off + one constraint | | ✓ |
| Solution: what changed, few moments | | ✓ |
| Outcome vs impact, distinguished | | ✓ |
| Reflection: learn / differently / lead | | ✓ |

If the user refuses impact entirely: write the rest, put a hard placeholder, and
tell them hiring managers will bounce here. Do not invent a 23% lift.

If they don't know their role: keep the role picker going with sharper forks. A case
study with no ownership is a team brochure.

### Step 3 — Artifacts (picker, not a shopping list)

After a beat is confirmed, if a visual would prove it, **one** screenshot picker
with 2–3 specific frames + “none yet.” Request files, not vibes. Be specific about
**what the frame should contain**.

Always useful:
- One-line product / company context if not public
- Constraint list (deadline, stack, team size)
- Any metric screenshot, dashboard, quote, support ticket theme, launch note

**Product design — suggest these shots** (max ~4–6 in the piece):

| Shot | Put it in | Capture |
|---|---|---|
| Stakes / before | 1–2 | The broken flow or old UI; crop to the failure |
| Direction | 4 | One diagram, principle, or "we go this way" artifact — not high-fidelity |
| Hero after | 7 | The new core moment, one screen or short prototype loop |
| Annotated change | 7 | Same screen with 2–3 callouts: what changed and why |
| Contrast pair | 7 or 8 | Before / after of **one** decision, aligned |
| Impact evidence | 5 / 8 | Chart, quote, ticket volume, clip of behavior change — even messy |

**Research — suggest these artifacts:**

| Artifact | Put it in | Notes |
|---|---|---|
| Evidence of the tension | 1–2 | Quote, clip, or behavioral snippet — not a 20-quote wall |
| Insight card | 6 | One finding that changed the bet |
| Decision artifact | 7 | Opportunity map, revised problem, prototype you informed, roadmap shift |
| What you killed | 6 | Failed hypothesis or study you didn't run and why |
| Outcome trail | 8 | What product/research did next because of you |

Tell them what **not** to add: moodboards, 15 similar screens, full personas, full
journey maps unless one crop proves a single point, raw FigJam boards, research plans.

If they have a working prototype or prod URL, prefer a **short recording** of the
changed path over a PNG dump.

### Step 4 — Write (assemble, don’t surprise them)

You have been writing all along (running draft). This step is **assemble + tighten**
using **Voice** and the version template — not the first time they see prose.

Follow **Voice** and the version template below. After the draft, list:
- skeleton parts filled vs still thin
- screenshots still needed (exact frame + caption)
- one line on what a hiring manager should remember

### Step 5 — Tighten for the version

**Application:** if it isn't scannable in a short scroll, cut approach, extra screens,
and reflection. Keep 1–5 sharp.

**Deep dive:** keep 1–5 as the "scan layer" at the top so a manager who only skims
still gets the story; expand 6–9 below.

---

## Voice

You are writing for a hiring team that has never seen this work.

- **Narrative, not a UX-process checklist.** Double diamond / "empathize, define…"
  is not a structure.
- **Stakes first.** Why it mattered now, then what you did.
- **Tension on the page.** User vs business, constraint vs ambition, failed bet vs
  chosen direction.
- **Ownership in first person, scoped honestly.** "I owned X; with Y I influenced Z."
  No "we" fog unless it was truly collective — then say who did what.
- **Specifics over adjectives.** "Cut the step that asked for a card before value"
  beats "made onboarding delightful."
- **Impact in plain language.** Outcome then needle. No fake precision.
- **Few, annotated visuals.** Each image has a caption: what to look at, what changed.

Banned patterns:
- "I was responsible for UX / UI / research" with no scope
- "We conducted user interviews and created personas" as the story
- Hero image of the final UI as paragraph one
- 15 screens "the design"
- Metric theater ("increased engagement") with no definition
- Lesson-free happy ending

---

## Output templates

Use headings a stranger can skim. Rename to the project's language, but keep the
job of each part.

### Application (parts 1–5)

```markdown
# {Project} — {one-line bet}

**Role:** {owned / scope / initiated} · **When:** {year or duration} · **Company:** {what they do in 5 words}

## Why this mattered
{Company in one breath.} {Why now.} {Threat if unsolved.} {User vs business tension.}

## The problem
**Users:** …
**Business:** …
**We assumed …** **We didn't know …** **What was wrong …**

## What I owned
{Ownership, influence, initiation — not a tool stack.}

## Direction
{The bet. What you did not do. No final mockups required here.}

## Impact
{Users / business / you / process / hypothesis change / risk or opportunity.}
{If unmeasured, say so and give the strongest signal.}
```

Then: `> 📸 Screenshot: …` placeholders from Step 3.

### Deep dive (all nine)

Start with the application block (scan layer), then:

```markdown
## How we got there
{Hypotheses. Trade-offs. Who fought it. Key insight — not the plan. Constraints and the workaround. What you killed.}

## What shipped (or what the research changed)
{2–4 annotated moments. Research: the decision or new question, visualized.}

## Outcomes, then impact
**Outcome:** {what exists / what people did}
**Impact:** {needle, or honest signal}

## What I'd do next
{How I led. What I learned. What I'd do differently. Next step.}
```

---

## Screenshot caption formula

Every image:

`[Before | After | Prototype | Insight] — {the one thing to notice}. {What it proves in the skeleton}.`

If the user didn't provide the asset yet, keep the placeholder and the capture brief
(device, account state, which tap, crop).

---

## If the user is stuck

Still use **one picker**, with options that name the fork. Do not lecture and wait.

| They say | You do |
|---|---|
| "I just have screens" | Picker: what the pictures are. Do not caption pretty UI as impact. |
| "We didn't track anything" | Picker of *signal types*: qualitative change, risk not taken, cycle time, decision you unblocked, what you unlearned. |
| "It was a group project" | Picker: owned vs influenced vs initiated. Hiring is about *their* slice. |
| "It was a class / concept" | Stage = real-world analogue; impact picker = proved / unlearned / would instrument — don't fake revenue. |
| "I'm a researcher, nothing shipped" | Part 7 picker: decision, new question, or direction change. |
| Existing study is visual-first | Rebuild via pickers in order: stage → problem → role → direction → impact. |

---

## Done looks like

- Intake used native one-question pickers (or A–D fallback), not an essay form
- Each skeleton slot was offered as probable copy and confirmed or refined
- Running draft was updated as they tapped — later answers rewrote earlier slots when needed
- Version chosen (application vs deep dive)
- No invented facts
- Role is ownership, not tools
- Impact (or named signals) is present
- Direction appears before the beauty shots
- Explicit list of artifacts still to capture
- A hiring manager can retell the story without opening Figma
- Session reply credits **Lena Kul**, the source video, and her channel (see Credits)

---

## Credits (repeat)

**Lena Kul Case Study Framework** — created by [Lena Kul](https://www.youtube.com/@LenaKul).

Source video: [Why Your Portfolio Fails | For Product Design and UXR](https://www.youtube.com/watch?v=vffNnpoWaeA)

Watch: https://www.youtube.com/watch?v=vffNnpoWaeA

Subscribe: https://www.youtube.com/@LenaKul · https://www.youtube.com/watch?v=vffNnpoWaeA

This skill is an independent adaptation for agent use. All teaching credit belongs to Lena Kul.
