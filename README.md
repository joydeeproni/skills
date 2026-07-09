# skills

Personal [agent skills](https://agentskills.io) for Claude Code, installable with the
[`skills`](https://www.npmjs.com/package/skills) CLI.

## Install

```sh
npx skills add joydeeproni/skills
```

or a single skill:

```sh
npx skills add joydeeproni/skills/ux-case-study
```

## Skills

### `ux-case-study`

Grows a single long-form, editorial **UX case study** in Notion from a repo's commit history.
As the product's UX is redesigned commit-by-commit, it extends one evolving narrative rather
than a changelog — and when a change's *why* isn't clear from the diff, it asks the author for
the design rationale before writing it up.

Project-agnostic: the Notion target, product name, and watched paths come from a per-repo
`.claude/casestudy/config.json`. See the skill's **Setup** section (and `skills/ux-case-study/setup/`)
for the one-time install of the commit-capture git hook and the optional Claude Code nudge hook.
