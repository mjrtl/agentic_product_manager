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
├── discovery/
│   ├── user-interviews/   (README.md, snapshots/, synthesis/, transcripts/)
│   ├── opportunities/
│   ├── assumptions/
│   └── solutions/
├── definition/
│   ├── prd/               (PRDs, 1-pagers, and PR-FAQs)
│   └── design/
└── delivery/
    ├── tasks/
    ├── qa/
    ├── delivery-metrics/
    ├── product-analytics/
    └── launch/
```

## Integration points

After creation, the user can use these skills in the initiative. Paths are relative to the initiative folder:

| Skill | Location | Phase |
|-------|----------|-------|
| `/interview-snapshot` | `discovery/user-interviews/snapshots/` | Discovery |
| `/synthesize-interviews` | `discovery/user-interviews/synthesis/` | Discovery |
| `/create-opportunities` | `discovery/opportunities/` | Discovery |
| `/generate-solutions` | `discovery/solutions/` | Discovery |
| `/test-assumptions` | `discovery/assumptions/` | Discovery |
| `/pr-faq` | `definition/prd/` | Definition |
| `/prd` | `definition/prd/` | Definition |
| `/design-brief` | `definition/design/` | Definition |
| `/figma-prompt` | `definition/design/` | Definition |
| `/generate-tasks` | `delivery/tasks/` | Delivery |
| `/process-tasks` | `delivery/tasks/` | Delivery |
| `/delivery-metrics` | `delivery/qa/`, `delivery/delivery-metrics/`, `delivery/product-analytics/` | Delivery |

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
