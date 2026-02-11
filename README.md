# Agentic Product Manager

A complete product management toolkit with 23 skills, 3 agents, hooks, and workflows. Works across Claude Code, Cursor, OpenCode, and 15+ other agents via [skills.sh](https://skills.sh/).

Built on the [Continuous Discovery Habits](https://www.producttalk.org/) methodology by Teresa Torres, the [PRISM strategy review framework](https://github.com/jinjin1/Cursor-for-Product-Managers), and proven PM practices.

## Install

### One-line install via skills.sh

The fastest way to get started. Works with Claude Code, Cursor, GitHub Copilot, Cline, Windsurf, and [18+ other agents](https://skills.sh/).

```bash
npx skills add https://github.com/mjrtl/agentic_product_manager
```

This installs all 23 skills directly into your agent's skill directory.

### Platform-specific install

Clone the repo and run the installer for your platform:

```bash
git clone https://github.com/mjrtl/agentic_product_manager.git
cd agentic_product_manager
```

**Claude Code** (project-scoped):
```bash
./install.sh --claude-code --project /path/to/your/project
```

**Claude Code** (global, available in all projects):
```bash
./install.sh --claude-code --global
```

**Cursor**:
```bash
./install.sh --cursor --project /path/to/your/project
```

**Syncing to Keyrock AI workspace** (after updating this repo):
```bash
./sync-to-keyrock-workspace.sh
```
Updates `keyrock_ai_workspace` with the latest skills, agents, `_shared`, and workflows. Override the target with `KEYROCK_AI_WORKSPACE=/path ./sync-to-keyrock-workspace.sh`. Does not modify `initiatives/` or `strategy/`.

**OpenCode**:
```bash
./install.sh --opencode --project /path/to/your/project
```

## Recommended companion skills

These skills ship with the toolkit. To update them or add new ones, use `import-skill.sh`:

```bash
./import-skill.sh <repo-url> [--skill <name>] [--yes]
```

This downloads via `npx skills add`, copies the skill into `skills/` as a real directory, then cleans up all temporary files. Skills imported this way work with the existing `install.sh` pipeline.

### Find skills

Discover and install skills from the open ecosystem. When you need a capability that isn't built in, ask your agent to find one.

```bash
./import-skill.sh https://github.com/vercel-labs/skills --skill find-skills
```

Then ask your agent: "find a skill for X" or run `npx skills find [query]` directly.

[View on skills.sh](https://skills.sh/vercel-labs/skills/find-skills)

### Skill creator

Build your own skills to extend this toolkit or share with your team. The skill creator guides you through the full development process: plan, initialize, edit, package, and iterate.

```bash
./import-skill.sh https://github.com/anthropics/skills --skill skill-creator
```

Then ask your agent: "/skill-creator" to start building a new skill.

[View on skills.sh](https://skills.sh/anthropics/skills/skill-creator)

## Usage

### Set up a strategy workspace

Create a strategy workspace before starting initiatives:

```
/setup-strategy marketplace-growth
```

This creates `strategy/marketplace-growth/` with folders for vision, OKRs, PRISM reviews, team structure, and evidence.

### Start an initiative

Scaffold a workspace with structured folders for the full discovery-to-delivery pipeline:

```
/setup-initiative mobile-app-redesign
```

This creates:

```
initiatives/mobile-app-redesign/
├── README.md
├── discovery/
│   ├── user-interviews/{snapshots,synthesis,transcripts}/
│   ├── opportunities/
│   ├── assumptions/
│   └── solutions/
├── definition/
│   ├── prd/                (PRDs, 1-pagers, and PR-FAQs)
│   └── design/
└── delivery/
    ├── tasks/
    ├── qa/
    ├── delivery-metrics/
    ├── product-analytics/
    └── launch/
```

Every skill saves its output to the appropriate folder under discovery, definition, or delivery. The workflow orchestrator scans this structure to track progress.

### Run the discovery workflow

The `/discovery-workflow` command detects where you are in the pipeline and suggests the next step:

```
/discovery-workflow mobile-app-redesign
```

The full pipeline:

```
Strategy → Setup → Interviews → Synthesis → Opportunities →
Solutions → Assumptions → PR-FAQ → PRD → Tasks → QA → Metrics → Launch
```

You can also run each step individually using the skill commands below.

### Run a strategy review

Use these quarterly to evaluate and refine your product strategy:

```
/vision-review
/prism-review
/okr-coach
/team-structure
```

See `workflows/strategy-review-cycle.md` for the full review cadence.

## Skills (23)

### Strategy and review

| Command | Description |
|---------|-------------|
| `/setup-strategy` | Scaffold strategy workspace (vision, OKRs, PRISM, team structure) |
| `/prism-review` | PRISM strategy review; scores 5 dimensions (0-5) with evidence gates |
| `/vision-review` | Product vision scoring against 4 criteria |
| `/okr-coach` | OKR sparring partner; sharp, practical criticism |
| `/team-structure` | Org design models and restructuring guidance |

### Continuous discovery

| Command | Description |
|---------|-------------|
| `/interview-snapshot` | Create structured interview snapshots from raw notes |
| `/synthesize-interviews` | Synthesize patterns across multiple snapshots |
| `/create-opportunities` | Extract and prioritize opportunities using Opportunity Solution Trees |
| `/generate-solutions` | AI-human collaborative ideation (user ideates first) |
| `/test-assumptions` | Identify leap-of-faith assumptions and design test cards |

### Documents

| Command | Description |
|---------|-------------|
| `/pr-faq` | Amazon-style Press Release and FAQ (root document for products) |
| `/prd` | Product Requirements Document |
| `/one-pager` | Decision-focused 1-Pager (Amazon-style narrative) |
| `/design-brief` | Design brief with JSON (Figma/Make) + Markdown outputs |
| `/figma-prompt` | Figma Make prompt (optimized for 5000-char limit) |

### Scoring

| Command | Description |
|---------|-------------|
| `/ice-score` | ICE prioritization (Impact x Confidence x Ease) |

### Execution

| Command | Description |
|---------|-------------|
| `/generate-tasks` | Create task list from PRD or requirements |
| `/process-tasks` | Work through tasks one by one with commit protocol |
| `/setup-initiative` | Scaffold initiative folder with templates |
| `/delivery-metrics` | DORA, QA KPI, and adoption metric snapshots |
| `/meeting-notes` | Capture 1:1 meeting notes |

### Workflows

| Command | Description |
|---------|-------------|
| `/discovery-workflow` | Full CDH pipeline orchestrator; picks up where you left off |

### Auto-loaded

| Skill | Description |
|-------|-------------|
| PM Copilot | Expert product coach; loads automatically when PM work is detected |

## Agents (Claude Code)

Three specialized agents handle different types of work:

| Agent | Role |
|-------|------|
| **pm-researcher** | Read-only context gatherer; scans initiative folders, finds evidence |
| **pm-writer** | Document creator; enforces writing standards on all outputs |
| **pm-analyst** | Scoring and evaluation specialist; runs ICE, PRISM, vision reviews |

## Workflows

Two documented workflow patterns in the `workflows/` directory:

- **Discovery to delivery** (`discovery-to-delivery.md`): Full CDH pipeline from setup through task execution, with entry/exit criteria for each stage
- **Strategy review cycle** (`strategy-review-cycle.md`): Quarterly strategy review cadence using PRISM, vision, OKR, and team structure skills

## Hooks (Claude Code)

- **session-start**: Reports active initiative status when you open a session
- **writing-standards-check**: Validates writing standards when saving `.md` files in initiative directories

## Writing standards

All outputs follow the standards in `_shared/writing-standards.md`:

- Active voice, direct tone
- 50+ banned words checked automatically (no "leverage," "utilize," "robust," etc.)
- No LLM patterns (no em dashes, no "Let's dive in")
- Sentence-case headings, Oxford commas
- Specificity over superlatives

## Project structure

```
agentic-product-manager/
├── README.md
├── LICENSE (MIT)
├── metadata.json
├── install.sh
├── import-skill.sh
├── _shared/
│   ├── writing-standards.md
│   └── meeting-notes-guide.md
├── skills/                         # 23 portable SKILL.md files
│   ├── pm-copilot/
│   ├── setup-strategy/            # NEW: strategy workspace scaffolding
│   ├── prism-review/
│   ├── vision-review/
│   ├── okr-coach/
│   ├── team-structure/
│   ├── interview-snapshot/
│   ├── synthesize-interviews/
│   ├── create-opportunities/      # updated: optional ROI assessment
│   ├── generate-solutions/
│   ├── test-assumptions/
│   ├── ice-score/
│   ├── pr-faq/                    # NEW: Amazon-style PR-FAQ
│   ├── prd/
│   ├── one-pager/
│   ├── design-brief/
│   ├── figma-prompt/
│   ├── generate-tasks/
│   ├── process-tasks/
│   ├── delivery-metrics/          # NEW: DORA, QA, adoption metrics
│   ├── setup-initiative/
│   ├── meeting-notes/
│   ├── discovery-workflow/
│   ├── find-skills/              # companion (via import-skill.sh)
│   └── skill-creator/            # companion (via import-skill.sh)
├── agents/
│   ├── pm-researcher.md
│   ├── pm-writer.md
│   └── pm-analyst.md
├── hooks/
│   ├── session-start.sh
│   └── writing-standards-check.sh
├── workflows/
│   ├── discovery-to-delivery.md
│   └── strategy-review-cycle.md
└── adapters/
    ├── claude-code/
    │   ├── CLAUDE.md
    │   ├── settings.json
    │   └── rules/pm-conventions.md
    ├── cursor/
    │   └── convert.sh
    └── opencode/
        └── convert.sh
```

## Creating your own skills

Want to extend this toolkit or build skills for your team? The [skill-creator](https://skills.sh/anthropics/skills/skill-creator) ships with this toolkit and guides you through the full development process. Run `/skill-creator` to get started.

Published skills can be shared on [skills.sh](https://skills.sh/) and installed by anyone with `./import-skill.sh` or `npx skills add`.

## Origins

This project builds on:
- [Cursor-for-Product-Managers](https://github.com/jinjin1/Cursor-for-Product-Managers) (15 .mdc rules for Cursor)
- [pm-agent-skills](https://github.com/mjrtl/pm-agent-skills) (7 SKILL.md portable skills)

The original prompt content has been preserved and expanded into 20 skills with agents, hooks, workflows, and multi-platform support.

## License

MIT
