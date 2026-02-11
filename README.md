# Agentic Product Manager

A complete product management toolkit with 20 skills, 3 agents, hooks, and workflows. Works across Claude Code, Cursor, and OpenCode.

Built on the [Continuous Discovery Habits](https://www.producttalk.org/) methodology by Teresa Torres, the [PRISM strategy review framework](https://github.com/jinjin1/Cursor-for-Product-Managers), and proven PM practices.

## Quick start

### Claude Code

```bash
git clone https://github.com/your-org/agentic-product-manager.git
cd agentic-product-manager
./install.sh --claude-code --project /path/to/your/project
```

Then open Claude Code in your project and use any command:

```
/setup-initiative mobile-app-redesign
/prd checkout-flow
/ice-score recommendation-engine
/discovery-workflow mobile-app-redesign
```

### Cursor

```bash
./install.sh --cursor --project /path/to/your/project
```

Skills are converted to `.mdc` rules in `.cursor/rules/`.

### OpenCode

```bash
./install.sh --opencode --project /path/to/your/project
```

Skills are copied to `.opencode/skills/` and an `AGENTS.md` is generated.

## Skills (20)

### Strategy and review

| Command | Description |
|---------|-------------|
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

| Agent | Role |
|-------|------|
| **pm-researcher** | Read-only context gatherer; scans initiative folders, finds evidence |
| **pm-writer** | Document creator; enforces writing standards on all outputs |
| **pm-analyst** | Scoring and evaluation specialist; runs ICE, PRISM, vision reviews |

## Workflows

Two documented workflow patterns:

- **Discovery to delivery** (`workflows/discovery-to-delivery.md`): Full CDH pipeline from setup through task execution
- **Strategy review cycle** (`workflows/strategy-review-cycle.md`): Quarterly strategy review cadence using PRISM, vision, OKR, and team structure skills

## Hooks (Claude Code)

- **session-start**: Reports active initiative status when you open a session
- **writing-standards-check**: Checks for banned words/phrases when writing `.md` files in initiative directories

## Project structure

```
agentic-product-manager/
├── README.md
├── LICENSE (MIT)
├── metadata.json
├── install.sh
├── _shared/
│   ├── writing-standards.md
│   └── meeting-notes-guide.md
├── skills/                         # 20 portable SKILL.md files
│   ├── pm-copilot/
│   ├── prism-review/
│   ├── vision-review/
│   ├── okr-coach/
│   ├── team-structure/
│   ├── interview-snapshot/
│   ├── synthesize-interviews/
│   ├── create-opportunities/
│   ├── generate-solutions/
│   ├── test-assumptions/
│   ├── ice-score/
│   ├── prd/
│   ├── one-pager/
│   ├── design-brief/
│   ├── figma-prompt/
│   ├── generate-tasks/
│   ├── process-tasks/
│   ├── setup-initiative/
│   ├── meeting-notes/
│   └── discovery-workflow/
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
├── claude/
│   ├── CLAUDE.md
│   ├── settings.json
│   └── rules/
│       └── pm-conventions.md
└── adapters/
    ├── cursor/
    │   └── convert.sh
    └── opencode/
        └── convert.sh
```

## Initiative workspace

When you run `/setup-initiative`, it creates a standardized folder structure:

```
initiatives/[name]/
├── README.md
├── user-interviews/
│   ├── snapshots/
│   ├── synthesis/
│   └── transcripts/
├── opportunities/
├── assumptions/
├── solutions/
├── design/
├── product-analytics/
├── prd/
└── tasks/
```

Each skill saves its output to the appropriate folder. The `/discovery-workflow` skill scans this structure to determine progress and suggest the next step.

## Writing standards

All outputs follow the writing standards in `_shared/writing-standards.md`:

- Active voice, direct tone
- Banned words checked (no "leverage," "utilize," "robust," etc.)
- No LLM patterns (no em dashes, no "Let's dive in")
- Sentence-case headings
- Oxford commas

## Origins

This project builds on:
- [Cursor-for-Product-Managers](https://github.com/jinjin1/Cursor-for-Product-Managers) (15 .mdc rules for Cursor)
- [pm-agent-skills](https://github.com/mjrtl/pm-agent-skills) (7 SKILL.md portable skills)

The original prompt content has been preserved and expanded into 20 individual skills with agents, hooks, workflows, and multi-platform support.

## License

MIT
