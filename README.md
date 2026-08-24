# skills

Personal [agent skills](https://agentskills.io) for Claude Code, installable with the
[`skills`](https://www.npmjs.com/package/skills) CLI.

## Install

```sh
npx skills add joydeeproni/skills
```

or a single skill:

```sh
npx skills add joydeeproni/skills --skill this-doesnt-look-good
```

Add `--global` to install at user level (available in every project) instead of just the
current one. `npx skills add joydeeproni/skills --list` shows what's in the repo without
installing.

## Skills

### `lena-kul-case-study`

Writes product-design and UX-research **portfolio case studies** using the **Lena Kul
Case Study Framework** — created by [Lena Kul](https://www.youtube.com/@LenaKul).
Source: *[Why Your Portfolio Fails | For Product Design and UXR](https://www.youtube.com/watch?v=vffNnpoWaeA)*.
[Subscribe on YouTube](https://www.youtube.com/@LenaKul) (same video:
https://www.youtube.com/watch?v=vffNnpoWaeA). Full credits:
`skills/lena-kul-case-study/CREDITS.md`.

Stops on vague ideas or screenshot dumps. Interviews **one native multiple-choice
question at a time** (Claude `AskUserQuestion`, Cursor `AskQuestion`, Codex
`ask_user_question`, or CLI A–D), then proposes a probable write-up for that skeleton
slot and lets the user tap keep / shorter / more senior / wrong. The draft refines
itself as answers land. Application is parts 1–5; deep dive adds approach, annotated
solution, outcomes-vs-impact, and reflection. Asks for a few specific screenshots —
not a gallery. Use this for hiring narratives; use `ux-case-study` for the
commit-to-Notion product essay. Protocol: `skills/lena-kul-case-study/interactive-intake.md`.

### `this-doesnt-look-good`

Turns vague design/UX feedback into actionable direction. Triggers on any non-specific
complaint — *"this looks bad"*, *"make it prettier"*, *"improve the ux"* — and **stops before
touching code** to interrogate the feedback through seven lenses (hesitation, expectation gaps,
emotion, what's missing, what's assumed, how it looks, how it feels), reframe the problem
(add/remove a constraint, invert it), synthesize concrete problem→fix pairs, and confirm before
implementing. Skips itself when the instruction is already specific (*"change font to 14px"*).

### `ux-case-study`

Grows a single long-form, editorial **UX case study** in Notion from a repo's commit history.
As the product's UX is redesigned commit-by-commit, it extends one evolving narrative rather
than a changelog — and when a change's *why* isn't clear from the diff, it asks the author for
the design rationale before writing it up.

Project-agnostic: the Notion target, product name, and watched paths come from a per-repo
`.claude/casestudy/config.json`. See the skill's **Setup** section (and `skills/ux-case-study/setup/`)
for the one-time install of the commit-capture git hook and the optional Claude Code nudge hook.
