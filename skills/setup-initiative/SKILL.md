---
name: Setup Initiative
description: >
  Scaffold a new initiative folder with standardized structure and
  customized templates for PM workflows.
argument-hint: "<initiative-name>"
---

# Setup Initiative

Create a new initiative folder with standardized structure and populate with customized templates.

## When to use

- When starting a new product initiative
- When you need a consistent folder structure for PM workflows

## Process

1. **Gather initiative details**
   - Initiative name (kebab-case: e.g., `mobile-app-redesign`)
   - Owner/Product Manager name
   - Brief description of the initiative goal
   - Target timeline (optional)
   - Key stakeholders (optional)

2. **Create initiative folder structure**
   - Create `initiatives/[initiative-name]/` folder
   - Copy structure from templates
   - Preserve all subfolders and README files

3. **Customize README.md**
   - Replace placeholders with actual initiative details
   - Keep all other template content intact

4. **Initialize placeholder files**
   - Create `.gitkeep` files in empty folders
   - Ensure all subfolder README files are properly copied

## Methods

### Method A: Shell script (recommended)

```bash
./scripts/setup-initiative.sh <initiative-name> "<Owner Name>" "<Goal description>"
```

### Method B: Manual creation (for agents without shell access)

Create the folder structure manually:

```
initiatives/[initiative-name]/
├── README.md
│
│   ## Discovery
├── user-interviews/
│   ├── README.md
│   ├── snapshots/
│   ├── synthesis/
│   └── transcripts/
├── opportunities/
│   └── README.md
├── assumptions/
│   └── README.md
├── solutions/
│   └── README.md
│
│   ## Definition
├── prd/
│   └── README.md          (PRDs, 1-pagers, and PR-FAQs)
├── design/
│   └── README.md
│
│   ## Delivery
├── tasks/
│   └── README.md
├── qa/
│   └── README.md
├── delivery-metrics/
│   └── README.md
├── product-analytics/
│   └── README.md
└── launch/
    └── README.md
```

## Integration points

After creation, the user can use these skills in the initiative:

| Skill | Location | Phase |
|-------|----------|-------|
| `/interview-snapshot` | `user-interviews/snapshots/` | Discovery |
| `/synthesize-interviews` | `user-interviews/synthesis/` | Discovery |
| `/create-opportunities` | `opportunities/` | Discovery |
| `/generate-solutions` | `solutions/` | Discovery |
| `/test-assumptions` | `assumptions/` | Discovery |
| `/pr-faq` | `prd/` | Definition |
| `/prd` | `prd/` | Definition |
| `/design-brief` | `design/` | Definition |
| `/figma-prompt` | `design/` | Definition |
| `/generate-tasks` | `tasks/` | Delivery |
| `/process-tasks` | `tasks/` | Delivery |
| `/delivery-metrics` | `qa/`, `delivery-metrics/`, `product-analytics/` | Delivery |

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
