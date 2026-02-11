---
name: Setup Strategy
description: >
  Scaffold a strategy workspace with standardized structure for vision,
  OKRs, PRISM reviews, and team structure. Strategy must exist before
  initiatives; initiatives trace back to strategy artefacts.
argument-hint: "<strategy-name>"
---

# Setup Strategy

Create a strategy workspace with standardized structure for organizing vision documents, OKRs, PRISM reviews, team structure analyses, and supporting evidence.

## When to use

- Before creating initiatives (strategy provides the "why" for each initiative)
- When starting a new product area, business unit, or strategic theme
- When you need a central location for quarterly strategy review outputs

## Process

1. **Gather strategy details**
   - Strategy name (kebab-case: e.g., `marketplace-growth`)
   - Owner (product leader or strategy owner)
   - Focus area or theme description

2. **Create strategy folder structure**
   - Create `strategy/[strategy-name]/` folder
   - Copy templates for each subfolder
   - Initialize review log

3. **Customize templates**
   - Replace placeholders with actual strategy details
   - Keep all other template content intact

## Methods

### Method A: Shell script (recommended)

```bash
./scripts/setup-strategy.sh <strategy-name> "<Owner Name>" "<Focus Area>"
```

### Method B: Manual creation (for agents without shell access)

Create the folder structure manually:

```
strategy/[strategy-name]/
├── README.md
├── review-log.md
├── vision/
│   └── README.md
├── okrs/
│   └── README.md
├── prism-reviews/
│   └── README.md
├── team-structure/
│   └── README.md
└── evidence/
    └── README.md
```

## Integration points

After creation, use these skills to populate the strategy workspace:

| Skill | Output location |
|-------|----------------|
| `/vision-review` | `strategy/[name]/vision/` |
| `/okr-coach` | `strategy/[name]/okrs/` |
| `/prism-review` | `strategy/[name]/prism-reviews/` |
| `/team-structure` | `strategy/[name]/team-structure/` |

Initiatives link back to strategy via the `**Strategy:**` field in their README.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
