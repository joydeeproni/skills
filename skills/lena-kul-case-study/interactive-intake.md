# Interactive intake — one tap at a time

Users must **not** write essays. You interview with **native multiple-choice UI**,
**one question per turn**, then you **propose the probable write-up** for that skeleton
slot and let them tap to keep or refine it.

The case study **grows in public**. After each confirmed beat, rewrite the running draft
(and earlier beats if the new answer contradicts them). That is how this skill
**refines itself** in-session — not by dumping a questionnaire.

Read this file whenever you intake. `SKILL.md` is the skeleton and voice; this file is
the conversation protocol.

---

## Hard rules for asking

1. **Never** paste a bullet list of open questions and wait for a long reply.
2. **One question per turn.** Do not batch 2–4 skeleton beats in one picker call
   (even if the host allows up to 4). Batching makes people skim and skip.
3. **Always try the native picker first.** Plain chat is a fallback, not the default.
4. **Options are inferred**, not a generic quiz. Ground labels in *their* product,
   screenshots, and last answer. Put your **best guess first** and mark it
   `(Recommended)` when you are >50% sure.
5. **2–4 options.** Do not add an "Other" option on Claude Code — the host adds it.
   On Codex / Cursor / CLI, include **Something else** as the last option.
6. After they pick, **immediately propose 2–4 lines of case-study copy** for that
   slot, then a **second** one-question picker: keep / shorter / more senior / rewrite.
7. **Stop talking** after the picker. No extra essay of your own except:
   - one line of why this beat matters (Lena’s job for that part)
   - the proposed write-up (when confirming copy)
   - the running draft, only after a copy confirm (compact, growing)
8. Skip any beat they already answered clearly. Do not re-ask to be thorough.
9. Never invent metrics or ownership in a recommended option. If you must guess
   direction, label it as a **hypothesis** in the option description.

---

## Detect the host and call the right tool

Pick **one** path. Try native UI; if the tool is missing this session, use the CLI
fallback in the same turn — still one question, still 2–4 choices.

### Claude Code

Tool: **`AskUserQuestion`**

```json
{
  "questions": [
    {
      "header": "Why now",
      "question": "Why did this problem matter *now* — not in general?",
      "multiSelect": false,
      "options": [
        {
          "label": "Retailers tightened anti-bot (Recommended)",
          "description": "Drops got harder; your users were losing more than last season."
        },
        {
          "label": "Competitors shipped first",
          "description": "A rival tool ate share; you had to differentiate or die."
        },
        {
          "label": "You were losing money/users",
          "description": "Churn, failed checkouts, or support load made the status quo expensive."
        }
      ]
    }
  ]
}
```

- `header`: max **12 characters** (chip). Examples: `Version`, `Discipline`, `Why now`,
  `Tension`, `User prob`, `Biz prob`, `Wrong bet`, `Role`, `Direction`, `Impact`,
  `Keep copy`, `Screenshot`.
- `options`: **2–4**. No `Other` row.
- `multiSelect`: **false** unless the beat is truly “pick every constraint that applied”
  (then `true`, and phrase “Which of these applied?”).
- **Exactly one** object in `questions` per call.

### Cursor (Agent or Plan)

Tool: **`AskQuestion`** (workspace multiple-choice menu). **Do not ask as plain text
if this tool exists.**

Typical shape (adapt to the schema the host injected — field names may be `title` /
`questions` / `options` / `allow_multiple`):

```json
{
  "title": "Case study — why now",
  "questions": [
    {
      "id": "why_now",
      "prompt": "Why did this problem matter *now* — not in general?",
      "allow_multiple": false,
      "options": [
        { "id": "anti_bot", "label": "Retailers tightened anti-bot (Recommended)" },
        { "id": "competitor", "label": "Competitors shipped first" },
        { "id": "loss", "label": "You were losing money or users" },
        { "id": "else", "label": "Something else" }
      ]
    }
  ]
}
```

If `AskQuestion` is **not** in your tool list this session: say so in one short line,
then use the **CLI fallback** below (lettered options). Do not stall asking them to
switch modes unless they already live in Plan mode.

### Codex CLI / Codex app

Tool: **`ask_user_question`** when it exists (often Plan / structured-input sessions).

- Single-select only if the host has no multi-select — never fake multi-select by
  stopping at two picks if they might want more; ask “Add another constraint?” as
  the *next* one-question turn instead.
- More than 4 options is OK on Codex if the schema allows; still prefer **3–4**.
- If the tool is missing: CLI fallback.

### Any CLI / chat without a picker (including Pi)

Use this exact pattern so they can reply `2` or `B`:

```markdown
**Why now** — Why did this matter *now*, not in general?

A. Retailers tightened anti-bot (Recommended) — drops got harder this season
B. Competitors shipped first — you had to differentiate or die
C. You were losing money or users — churn / failed checkouts / support load
D. Something else — reply with a phrase

Tap/reply with A–D only.
```

Do not add a fifth paragraph of context under the list.

---

## The beat loop (this is the skill refining itself)

Keep a silent structure (you may show a 5-line “so far” after copy confirms):

```text
version: unset | application | deep-dive
discipline: unset | product-design | research | hybrid
slots: { 1..9 → { status: empty|hypothesized|confirmed, prose, confidence } }
next_beat: id
```

**Each turn:**

```text
1. Choose the single weakest empty/hypothesized beat (order below).
2. Generate 2–4 options from current slots + user artifacts.
3. Native picker (question only). STOP.
4. On answer:
   a. Write a probable 2–5 sentence slot (Voice in SKILL.md).
   b. Native picker: keep this copy / shorter / more senior / facts are wrong.
5. On copy confirm:
   a. Mark slot confirmed.
   b. If the new fact breaks an earlier slot, rewrite that slot and say what changed
      in one line — then picker: keep the rewrite / revert.
   c. Show the growing draft (application: parts 1–5 only until deep dive starts).
   d. Next turn → next weakest beat.
```

**Self-refine rules**

- If they pick **Something else** or **facts are wrong** twice on the same beat,
  **change the question**, don’t reshuffle the same three guesses. Ask a narrower
  fork (e.g. “Was the customer a reseller group or a consumer?”).
- If they keep picking **shorter**, default future write-ups to 2 sentences.
- If they keep picking **more senior**, default to ownership, trade-offs, and
  initiation — drop tutorial tone.
- Recommended option = your current best hypothesis. After a reject, the next
  recommended option must not be a rephrase of the rejected one.
- When application slots 1–5 are confirmed, picker: **Assemble the scan-layer
  case study** vs **Keep refining one slot**. Only then write the full template
  in `SKILL.md`. Deep dive (6–9) starts with the same loop, never a new essay form.

---

## Beat order (skip if already known)

Ask **Version** first unless they already said application vs interview deep dive.

Then **Discipline** if unclear (product design vs research vs both).

Then holes in Lena’s order:

| # | Beat id | Header | Question job | What the write-up must contain |
|---|---|---|---|---|
| 1 | `stage_company` | `Company` | What the org/product is in recruiter English | Not Wikipedia. What they sell / who pays |
| 2 | `stage_now` | `Why now` | Timing + threat if unsolved | Stakes *now* |
| 3 | `stage_tension` | `Tension` | User need vs business need | Both poles in the paragraph |
| 4 | `prob_user` | `User prob` | User problem only | No solution yet |
| 5 | `prob_biz` | `Biz prob` | Business problem only | Revenue, risk, cost, trust, share |
| 6 | `prob_wrong` | `Wrong bet` | Assumption that died | The plot twist |
| 7 | `role` | `Role` | Own / scope / influence / initiate | Not tools |
| 8 | `direction` | `Direction` | The bet, not the mockups | What you did *not* do |
| 9 | `impact` | `Impact` | Needle or honest signal | Users, business, you, process, unlearned, risk avoided |
| 10 | `artifact` | `Screenshot` | Which capture next | Specific frame, not “add visuals” |

Deep dive, after 1–5 are confirmed:

| # | Beat id | Header | Question job |
|---|---|---|---|
| 11 | `approach` | `Approach` | Insight + trade-off + constraint + what you killed |
| 12 | `solution` | `Solution` | 2–4 moments that changed (or research decision) |
| 13 | `outcome` | `Outcome` | What exists now vs the needle (split in copy) |
| 14 | `reflect` | `Reflect` | Led / learned / differently / next |

---

## Copy-confirm picker (every beat)

After you show the probable write-up, ask **one** question:

**Header:** `Keep copy`  
**Question:** Keep this as the {beat} section?

Options (adapt wording; keep four max):

1. **Keep this (Recommended)** — lock it and move on  
2. **Shorter** — same facts, half the words  
3. **More senior** — more ownership, tension, and trade-offs  
4. **Facts are wrong** — you’ll ask a *different* question next, not “write it yourself”

Then STOP. Do not also ask them to paste a rewrite unless they picked 4 and the
native **Other** / Something else path is how they type a correction.

When they pick 2 or 3, regenerate copy **immediately** and confirm again with the
same picker (max two refine cycles, then lock the best version and move on so
the interview doesn’t stall).

---

## Generating options from a messy draft

Worked method (example: a niche checkout/automation tool explained as hype culture):

- Pull nouns they already used (product name, user, market).
- For **Why now**, fork *timing* (platform change vs competition vs money), not
  “is hype real?”
- For **Role**, fork *ownership* (solo builder vs designer on a team vs hired gun).
- For **Impact**, fork *signal type* (speed, money, reliability, users, unlearned)
  before asking for a fake %.
- Always include one option that says the **business** side, not only the user story.

Bad option: “Make it nicer.”  
Good option: “Shikari existed; the miss was proving you owned checkout reliability
when retailers changed their flow mid-drop.”

---

## Probable write-up quality bar

Each proposed slot should already sound like the case study, not like meeting notes.

- Stage: company + why now + threat + tension, ~4 sentences max  
- Problem: **Users:** / **Business:** / **We assumed** / **What was wrong**  
- Role: I owned / I influenced / I initiated — one paragraph  
- Direction: one bet + one thing you refused  
- Impact: named signal; if unmeasured, say “unmeasured” in the sentence  

Mark guesses with *hypothesis* only inside the picker **description**, not in the
locked case study unless they confirmed.

---

## Artifacts (also a picker)

When a slot is confirmed and a visual would prove it, one question:

**Header:** `Screenshot`  
**Question:** Which capture should we add for this part?

Three specific frames inferred from the product + **None yet**.

Example descriptions: “Failed manual checkout on Nike SNKRS, cropped to the queue
death” not “a screenshot of the app.”

---

## Done with intake

Application: beats 1–9 confirmed (or impact explicitly “signals only”).  
Then assemble using **Output templates** in `SKILL.md`.  
List remaining screenshots as placeholders.  
Do not reopen the essay questionnaire.
