---
name: this-doesnt-look-good
version: 1.1.0
description: >
  MUST trigger on any vague design/UX complaint without specific fix instructions.
  Trigger phrases: "this doesn't look good", "this is shit", "this is bad", "this
  looks terrible", "make this better", "improve this", "make it look prettier",
  "make this nicer", "polish this", "make this ux better", "improve the ux",
  "improve the design", "this looks cheap", "this feels off", "this doesn't feel
  right", "clean this up", "fix the design", "this ui sucks", "not happy with how
  this looks", "can you make this look professional". Trigger on ANY short prompt
  about design/UX/visuals that lacks specific direction on what exactly to change.
  Do NOT trigger when the user gives a concrete fix ("change font to 14px",
  "add 8px padding", "swap this color to primary").
---

# This Doesn't Look Good — Understand Before You Touch

**STOP.** Do not change any code yet.

When someone asks to improve how something looks or feels, the instinct is to start tweaking colors and spacing. Resist it. Vague feedback produces vague fixes. The questions below turn "this looks off" into "the type hierarchy is flat and nothing guides my eye."

## When This Triggers

**The rule:** if the user's prompt is about design, UX, or visuals and does NOT contain a specific instruction for what to change — this skill fires. The shorter and vaguer the prompt, the more important it is to ask questions first.

Examples that MUST trigger this skill:
- "this doesn't look good" / "this looks bad" / "this is shit" / "this is ugly"
- "make this look nice / good / prettier / polished / professional"
- "improve the design / UI / UX / look and feel"
- "improve this" / "make this better" (when about a visual thing)
- "this doesn't feel right" / "something's off" / "this feels wrong"
- "clean this up" / "polish this" / "fix the design"
- "make the ux better" / "improve the ux of this screen/product"
- "not happy with how this looks" / "I don't like how this turned out"
- Any screenshot or screen reference + a negative reaction without specifics

**Skip this skill** when the user gives a concrete, actionable fix:
- "change the font size to 14" — specific, just do it
- "add 8px padding to the card" — specific, just do it
- "use the primary color for the heading" — specific, just do it
- "swap this button to outlined variant" — specific, just do it
- "the spacing between X and Y should be 16px" — specific, just do it

## Step 1: Ask the Right Questions

### First, classify the complaint

Before picking questions, name which *kind* of problem you're likely dealing with — it decides which lenses matter and, later, which principles justify the fix:

- **Filtering** — too much competes for attention ("busy", "cluttered", "noisy", "overwhelming"). → looks + missing lenses. *Ask: is this genuinely complex, or just not simplified yet? Most clutter is un-simplified, not complex — the fix is subtraction (surface the 20% that matters, hide the rest).*
- **Efficiency** — too slow or laborious ("clunky", "too many steps", "annoying"). → feels + expectations lenses.
- **Sense-making** — can't tell what relates to what, or what it means ("confusing", "lost", "weird flow"). → expectations + assumptions lenses.
- **Recall** — the UI makes the user remember what it should surface ("where did X go?"). → missing lens.

### The Seven Lenses

Present these as a focused interview. Don't dump all questions at once — pick the 3-4 most relevant based on the user's complaint, and ask them using the `AskUserQuestion` tool or as direct questions.

**1. Moments of hesitation**
What caused you to pause? Was it uncertainty about what would happen next, a lack of trust in the UI, or something else? Where exactly did you hesitate?

**2. Expectation gaps**
Where did your mental model break? What did you assume would happen? What would have met your expectation instead?

**3. Emotional shifts**
What was the moment you went from "this is fine" to "this bothers me"? What triggered it? Was it a specific screen, interaction, or element?

**4. What's missing**
What were you looking for that you couldn't find? Is something absent that should be there? Does it matter to the task, or is it a nice-to-have?

**5. What's being assumed**
What is this interface assuming about the user? What's being hidden vs. surfaced? Are those the right choices?
*Challenge the assumptions, don't just list them: run Five Whys to the root cause; take "beginner's mind" (what would a first-timer expect here with no preconceptions?); and actively look for evidence that contradicts your read of what's wrong.*

**6. How it looks**
Does this look crafted or thrown together? Is the typography easy to read or slightly off? Are colors working together or fighting? Is there a clear visual hierarchy, or does everything compete for attention?
*Quick test: would this still read if it were greyscale? If the hierarchy collapses without color, the hierarchy is the problem — not the palette.*

**7. How it feels**
Does this feel responsive or sluggish? Does it respond the way you expect? Does it feel solid and durable, or fragile?

### How to Pick Questions

| User says... | Start with lenses... |
|---|---|
| "looks bad/cheap/ugly" | 6 (looks), then 3 (emotion) |
| "doesn't feel right" | 7 (feels), then 1 (hesitation) |
| "confusing / I got lost" | 2 (expectations), then 4 (missing) |
| "something's off" | 1 (hesitation), then 6 (looks) |
| "make it nicer" (no specifics) | 6 (looks), then 7 (feels), then 3 (emotion) |
| "the flow is weird" | 2 (expectations), then 5 (assumptions) |

## Naming the Problem: a Visual Diagnostic Map

"Looks bad" is almost never superficial — it's a *nameable* hierarchy/spacing/contrast/depth problem with a known fix. When the answers point at visuals, translate the vague word into a specific diagnosis:

| The complaint / what they see | Usually means | Concrete fix |
|---|---|---|
| "Busy / cluttered / noisy / nothing stands out" | Flat visual hierarchy — everything competes | De-emphasize secondary & tertiary content (softer grey, lighter weight); let one thing win |
| "Shouty" — huge headings, tiny labels | Hierarchy carried by font-*size* alone | Hold size moderate; use weight (600/700) + color to signal importance (2–3 text colors, 2 weights) |
| "Sloppy / inconsistent" | No system — arbitrary sizes/colors/spacing | Limit choices: a spacing & type scale (steps ≥25% apart), a fixed color set |
| "Can't tell what to click / which button matters" | No action pyramid | One primary (solid), a few secondary (outline), tertiary (link); demote destructive unless it's the main action |
| "Cramped / crammed in" | Whitespace added to the minimum, not designed | Start with too much whitespace, remove; put more space *around* a group than *within* it |
| "Washed-out / dull / looks disabled" (text on a color) | Grey / low-opacity text on a colored background | Hand-pick a color at the *same hue*; drop contrast via saturation/lightness, not opacity |
| "Flat / lifeless / cheap" | No depth cues | Light-from-above edges; shadow size = elevation; lighter = closer, darker = further |
| "Heavy / boxy — lines everywhere" | Too many borders | Replace borders with spacing, a box-shadow, or a different background color |
| "Boring / bland but technically 'correct'" | No finishing flair | Accent border; supercharge defaults (icon bullets, custom controls); decorate the background |
| "Hard to read paragraphs" | Line length too long | 45–75 characters per line (~20–35em) |
| "Text feels airy in places, tight in others" | Uniform line-height everywhere | Line-height inversely proportional to size (taller for body, ~1 for big headings) |
| "Colors look muddy at light/dark shades" | Lightness is killing saturation | Raise saturation toward the extremes; rotate hue slightly |
| "Greys feel cold / clinical / dead" | True 0%-saturation greys | Tint the greys — blue for cool, yellow/orange for warm |
| "Data screen is a wall of `label: value`" | Naive label:value, no hierarchy | Drop or merge labels (let format imply them); de-emphasize the label |

## Step 2: Reframe the Problem

Before jumping to fixes, challenge the framing. The user's complaint points at a symptom — the real problem might be structural. Explore the solution space before narrowing.

### Restate it as the job (JTBD)

Name the user's job before touching the surface: *"When [situation], I want to [motivation], so I can [outcome]."* Often a screen "looks bad" because it's failing the job, not because of styling. Fix the job first.

### Add or Remove a Constraint

Temporarily ignore a real constraint to find ideas you can adapt back to reality:

- "What if this didn't need to be a screen at all?"
- "What if this happened automatically, with no UI?"
- "What if the user only had one hand?"
- "What if this had to work on a 4-inch screen? On a TV?"

The point isn't to ship the unconstrained version — it's to discover shapes you'd never find inside the current box. Then bring the constraints back one at a time and see what survives.

### Invert the Problem

Flip the problem statement and see if the opposite reveals a better approach:

- Instead of helping users **find** what they want → help them **eliminate** what they don't want
- Instead of **showing more** information → **hide everything** except the one thing that matters right now
- Instead of **guiding** the user through steps → let them **skip to the end** and work backwards
- Instead of **preventing** errors → make errors **trivially reversible**

**The canonical inversion for aesthetics — emphasize by de-emphasizing:** when the element you want to pop *won't* pop, stop adding emphasis to it. Remove emphasis from everything competing with it (drop the sidebar's background, soften the neighbours). The target rises because the noise drops.

### Dissolve the False Either-Or

When the complaint pits two goods against each other ("clean *but* powerful", "simple *but* complete"), don't pick a side — find the synthesis. Two contradictory truths can both hold. Reframe the either/or into "what makes *both* true?" — hybrids (familiar structure + novel interaction), progressive disclosure, or a phased rollout.

### When to Use Each

| Situation | Technique |
|---|---|
| The UI feels overloaded / too complex | Remove a constraint ("what if this was one button?") |
| The flow has too many steps | Invert ("what if the user started at the end?") |
| The design feels generic / uninspired | Add a constraint ("what if it had to be beautiful on a watch?") |
| One element refuses to stand out | Emphasize by de-emphasizing (soften its competitors) |
| The ask feels like a tradeoff ("X vs Y") | Dissolve the either-or (find the "both" solution) |
| The feature feels bolted on | Remove a constraint ("what if this was the entire product?") |

Present 1-2 reframes to the user as thought experiments: "Before I fix the surface, let me ask — what if [reframe]? Does that change what you'd want here?"

## Step 3: Synthesize Into Actionable Findings

After getting answers (and exploring reframes), translate into concrete design problems — and **justify each fix**:

```
Based on your feedback, here's what I'm hearing:

1. [Problem]: [specific named issue — use the diagnostic map]
   → Fix: [concrete change]
   → Why: [what backs it — see the chain of command below]

2. [Problem]: [specific named issue]
   → Fix: [concrete change]
   → Why: [...]

Does this match what you're seeing? Anything I'm missing?
```

### Justify every fix — the chain of command

Rank your justification by source. A fix you can't get past "I think it looks better" is low-confidence — flag it as such.

1. **Convention / usability law** — an established principle backs it. *Name it.*
2. **User familiarity (Jakob's Law)** — it matches what users already know from the tools they use all day. Familiarity can legitimately *override* a "more correct" pattern.
3. **Data / research** — if you actually have it, it wins over the above.

**Named-law cheat-sheet** (say *which* law, grouped by the four problem kinds):
- **Filtering:** Hick's Law · Cognitive Load · Von Restorff (isolation) · Fitts's Law · Law of Proximity · Progressive Disclosure
- **Efficiency:** Doherty Threshold · Default Bias · Goal-Gradient
- **Sense-making:** Jakob's Law · Gestalt (proximity / similarity / common region) · Occam's Razor
- **Recall:** Miller's Law (~7 items) · Serial Position · Peak-End Rule

## Step 4: Confirm Before Changing

Present the proposed fixes and get a "go" before writing any code. Group fixes by risk:

- **Safe** — spacing, alignment, color token swaps (no layout shift)
- **Medium** — typography scale changes, component swaps (may shift layout)
- **High** — structural changes, new components, interaction changes

**Calibrate how hard to push by reversibility, not just risk:**
- **Reversible + low-risk** (spacing, color tokens, type tweaks) → just ship it, don't over-deliberate. When you're wrong about a UI pattern, it won't kill the product — you'll change it back.
- **Irreversible / high-risk** (data loss, destructive flows, structural rewrites, anything users must relearn) → slow down, confirm explicitly, gather more input first.

Don't overthink Pareto-trivial, reversible calls — reserve the rigor for the ~20% of decisions that carry ~80% of the impact.

## Step 5: Implement

Now go implement. Use the `/designsystem` skill if working in a Tactile codebase (or your project's own design-system skill). After each round of changes, ask: "Does this address what you were seeing, or is there more to refine?"

## Why This Matters

Jumping straight to code on vague feedback leads to:
- Multiple round-trips ("no, not that... no, try something else")
- Fixing symptoms instead of the actual problem
- Missing the real issue entirely (user says "colors" but means "hierarchy")

Three good questions up front save five revision cycles.

---
*Diagnostic vocabulary and reasoning frameworks distilled from* Refactoring UI *(Adam Wathan & Steve Schoger) and* Making UX Decisions *(Tommy Geoco).*
