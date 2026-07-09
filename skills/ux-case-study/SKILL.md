---
name: ux-case-study
description: Use when a commit lands in a repo set up for case-study capture, when a commit-capture hook reports pending commits, or when asked to write up or extend a product's UX/design case study from its commit history.
---

# UX Case Study

## Overview

This skill grows a single long-form, editorial **UX case study** in Notion from a product's
commit history. As the product's UX is redesigned commit-by-commit, the skill extends one
evolving narrative — the story of taking a rough, inconsistent tool and making it feel
considered, fast, and consistent.

**The case study is the artifact.** Treat it like a published piece, not a changelog.

The skill is project-agnostic: the Notion target, product name, and watched paths come from a
per-repo config file (see Configuration). It is installed once per repo (see Setup).

## Configuration

Read the target from `.claude/casestudy/config.json` in the repo. Never hardcode a page ID.

| Field | Meaning |
|-------|---------|
| `product` | Product/tool name used in prose ("Concept Art"). |
| `notionPageId` | Notion page the case study is appended to. |
| `notionWorkspace` | Account/workspace label, so you write to the right one. |
| `watchPaths` | Globs whose diffs are UX-relevant (`src/`, `*.css`, `index.html`). |
| `author` | Who to ask for design rationale (name/handle). |

If `config.json` is missing, the repo isn't set up — run **Setup** instead of guessing.

Write with `mcp__claude_ai_Notion__notion-update-page` (`command: "insert_content"`,
`position: {"type":"end"}`). Read the page first with `notion-fetch` so you don't repeat a
section or contradict the established voice. If unsure of Notion markdown, read the MCP
resource `notion://docs/enhanced-markdown-spec`.

## Setup (first run in a new repo)

1. Create `.claude/casestudy/` with empty `pending-commits.txt` and `processed-commits.txt`.
2. Copy `config.example.json` → `.claude/casestudy/config.json` and fill it in.
3. Install `setup/git-post-commit.sh` as `.git/hooks/post-commit` (chmod +x). It records every
   commit hash to `pending-commits.txt` — even commits made outside a Claude Code session.
4. (Optional) Wire the Claude Code nudge and cut permission prompts: copy
   `setup/claude-post-tool-commit.sh` into `.claude/hooks/`, then from
   `setup/settings.snippet.json` merge the `hooks` block into `.claude/settings.json` (reminds
   the assistant after each `git commit`) and the `permissions.allow` block into
   `.claude/settings.local.json` (stops the skill prompting on its routine, safe operations —
   read-only git, the two Notion calls, and the deterministic bookkeeping in step 7). The
   bookkeeping commands are fixed strings, so allow-listing them once holds forever.
5. Create or choose the Notion page and put its ID in `config.json`.

## The Workflow (each time this skill is invoked)

1. **Find what's new.** Read `.claude/casestudy/pending-commits.txt` (one full hash per line).
   If empty, compare recent `git log` against `processed-commits.txt`.
2. **Understand each commit.** For each hash: `git show --stat <hash>`, then read the diff of
   files matching `watchPaths`. Look for what a *user would feel*: layout, flow, controls,
   motion, copy, color, spacing, defaults.
3. **Judge relevance.** UX/design-relevant → story. Pure backend/infra/deps with no
   user-facing effect → record as processed, don't fabricate a section. Group related commits
   into one coherent section.
4. **Check the *why* before writing — ask if it's unclear.** See "Asking for design
   rationale" below. Do this BEFORE composing, so answers shape the section.
5. **Write the section.** Compose in the established voice and `insert_content` at the end of
   the page. Reference before/after and the design reasoning.
6. **Note visuals.** Where a change has a visible before/after, leave an inline placeholder
   `> 📸 *Screenshot: <what to capture> — to add*` and, in your reply, tell the user exactly
   which screen to grab. Capture it yourself if a dev server / screenshot path is available.
7. **Mark processed.** Move the pending commits into the processed log with these two *exact*
   commands — never type individual hashes (a per-hash command is a new string every run, so it
   forces a fresh permission prompt each time and bloats the allowlist):
   ```
   cat .claude/casestudy/pending-commits.txt >> .claude/casestudy/processed-commits.txt
   : > .claude/casestudy/pending-commits.txt
   ```
   This records every pending commit as processed (UX-relevant or not) and clears the queue.
   Never process the same commit into two sections.
8. **Report.** Tell the user what section you added and link the page.

## Asking for design rationale

A commit shows you *what* changed. The case study is about *why*. When the why is not
recoverable from the diff + commit message, **ask the author — do not guess and do not
fabricate.**

**Ask when** the change is visible but its motivation is ambiguous:
- a control was moved, reordered, or its default changed
- copy was reworded, or a feature was removed / hidden
- layout, spacing, or color changed in a way that could be taste, a bug fix, or a deliberate
  hierarchy decision
- two plausible approaches existed and the tradeoff isn't obvious from the code

**Don't ask when** the why is self-evident (added a loading state → feedback; fixed a clearly
labelled bug; renamed for clarity). Asking about the obvious is noise.

**How to ask:**
- **Batch.** Collect every ambiguous item across all pending commits and ask in ONE round.
  Never interrupt commit-by-commit.
- **Ground each question in the specific change** and **offer your best hypothesis**, so the
  author can confirm or correct in one line: *"You moved the aspect-ratio control above the
  prompt box in `a1b2c3d` — was that to make framing a first-class decision before writing the
  prompt, or something else?"*
- Prefer `AskUserQuestion` when a few discrete options capture it; otherwise ask in prose.
- Keep it to ~1 question per item; cap the round at ~4. Ask what problem it solved or what felt
  wrong before — the tension, not just the fact.

**Use the answers:** weave the rationale into the narrative in the established voice — this *is*
the material the case study exists for. A sharp sentence from the author makes a good pull
quote. Don't paste the raw answer; write it.

**If the author is unavailable or skips:** write the observable change factually and mark the
motivation as pending — `> 🗣️ *Rationale: to confirm with {author}*` — or hold the section.
Never invent motivation to fill the gap.

## Voice & Structure (non-negotiable)

Write like an **Apple product page** or a **NYT long-form feature** — NOT release notes.

- **Narrative, not bullets.** A reader who knows nothing about the repo should understand the
  *problem*, the *decision*, and *why it's better*.
- **Lead with the why.** Open each section with the user/design problem, then the change, then
  the result. "Artists kept drifting back to Midjourney because…" beats "Refactored controls."
- **Show the tension.** Name what was wrong. Good case studies have a before and an after.
- **Before → After** where a concrete UI change happened (small table or side-by-side).
- **Pull quotes / callouts** for the one line that captures a section — sparingly, one per
  section at most. Author rationale (above) is a natural source.
- **Section headers** that read like article subheads ("Making generation feel instant", not
  "Loading states"), with commit hash(es) in italics at the end for traceability —
  *`a1b2c3d` · 2026-06-29*.
- **Design-engineering lens.** If an `emil-design-eng`-style skill is available, apply its
  principles when judging motion, component feel, and polish (easing, durations,
  scale-on-press, origin-aware popovers) and cite the reasoning.

Keep the whole thing **cohesive** — one evolving essay in past tense, reflective voice. New
commits extend the story; they don't reset it.

## Rules / Common Mistakes

- **Don't write a changelog.** If your output reads like `git log`, rewrite it as a story.
- **Don't fabricate the why.** If it's unclear, ask (above). Honesty keeps the study credible.
- **Don't duplicate sections.** Always `notion-fetch` the page first and check what's covered.
- **Don't reset the narrative.** One growing essay, consistent voice and tense.
- **Don't hardcode the target.** Read `config.json` every time.
- **Watch design-system consistency.** Call out consistency wins and regressions as they land.
