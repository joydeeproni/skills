---
name: this-doesnt-look-good
version: 1.0.0
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

Present these as a focused interview. Don't dump all questions at once — pick the 3-4 most relevant based on the user's complaint, and ask them using the `AskUserQuestion` tool or as direct questions.

### The Seven Lenses

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

**6. How it looks**
Does this look crafted or thrown together? Is the typography easy to read or slightly off? Are colors working together or fighting? Is there a clear visual hierarchy, or does everything compete for attention?

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

## Step 2: Reframe the Problem

Before jumping to fixes, challenge the framing. The user's complaint points at a symptom — the real problem might be structural. Use these two techniques to explore the solution space before narrowing.

### Add or Remove a Constraint

Temporarily ignore a real constraint to find ideas you can adapt back to reality:

- "What if this didn't need to be a screen at all?"
- "What if this happened automatically, with no UI?"
- "What if the user only had one hand?"
- "What if there was no loading state because the data was always there?"
- "What if this had to work on a 4-inch screen? On a TV?"

The point isn't to ship the unconstrained version — it's to discover shapes you'd never find inside the current box. Once you find something interesting, bring the constraints back one at a time and see what survives.

### Invert the Problem

Flip the problem statement and see if the opposite reveals a better approach:

- Instead of helping users **find** what they want → help them **eliminate** what they don't want
- Instead of **showing more** information → **hide everything** except the one thing that matters right now
- Instead of **guiding** the user through steps → let them **skip to the end** and work backwards
- Instead of **preventing** errors → make errors **trivially reversible**
- Instead of asking "how do we make this easier?" → ask "what if this step didn't exist?"

Inversion often reveals that the best design isn't a better version of the current thing — it's removing the need for it entirely.

### When to Use Each

| Situation | Technique |
|---|---|
| The UI feels overloaded / too complex | Remove a constraint ("what if this was one button?") |
| The flow has too many steps | Invert ("what if the user started at the end?") |
| The design feels generic / uninspired | Add a constraint ("what if it had to be beautiful on a watch?") |
| Users keep getting lost | Invert ("instead of wayfinding, what if there were no wrong turns?") |
| The feature feels bolted on | Remove a constraint ("what if this was the entire product?") |

Present 1-2 reframes to the user as thought experiments: "Before I fix the surface, let me ask — what if [reframe]? Does that change what you'd want here?"

## Step 3: Synthesize Into Actionable Findings

After getting answers (and exploring reframes), translate into concrete design problems:

```
Based on your feedback, here's what I'm hearing:

1. [Problem]: [specific design issue]
   → Fix: [concrete change]

2. [Problem]: [specific design issue]
   → Fix: [concrete change]

Does this match what you're seeing? Anything I'm missing?
```

## Step 4: Confirm Before Changing

Present the proposed fixes and get a "go" before writing any code. Group fixes by risk:

- **Safe** — spacing, alignment, color token swaps (no layout shift)
- **Medium** — typography scale changes, component swaps (may shift layout)
- **High** — structural changes, new components, interaction changes

## Step 5: Implement

Now go implement. Use the `/designsystem` skill if working in a Tactile codebase. After each round of changes, ask: "Does this address what you were seeing, or is there more to refine?"

## Why This Matters

Jumping straight to code on vague feedback leads to:
- Multiple round-trips ("no, not that... no, try something else")
- Fixing symptoms instead of the actual problem
- Missing the real issue entirely (user says "colors" but means "hierarchy")

Three good questions up front save five revision cycles.
