# Discovery to delivery workflow (overview)

This is the **top-level overview** of the full pipeline from strategy through delivery.

Detailed workflows:
- **Product discovery:** `workflows/product-discovery.md`
- **Product definition:** `workflows/product-definition.md`
- **Product delivery:** `workflows/product-delivery.md`
- **Strategy review cadence:** `workflows/strategy-review-cycle.md`

## Overview

The discovery-to-delivery workflow transforms strategy and raw user research into validated, implemented, and launched product features. It follows the Continuous Discovery Habits (CDH) methodology by Teresa Torres, enhanced with a strategy layer, definition phase (PR-FAQ), and delivery tracking.

## Pipeline

```
Strategy → Setup → Interviews → Snapshots → Synthesis → Opportunities →
Solutions → Assumptions → PR-FAQ → PRD → Tasks → QA → Metrics → Launch
```

## Phase 0: Strategy (prerequisite)

Strategy provides the "why" for initiatives. Create a strategy workspace before starting initiatives.

**Skill:** `/setup-strategy`
**Output:** `strategy/[name]/` folder structure

### Strategy review cycle

Run these skills quarterly (see `workflows/strategy-review-cycle.md`):

| Skill | Output |
|-------|--------|
| `/vision-review` | `strategy/[name]/vision/` |
| `/prism-review` | `strategy/[name]/prism-reviews/` |
| `/okr-coach` | `strategy/[name]/okrs/` |
| `/team-structure` | `strategy/[name]/team-structure/` |

**Entry criteria:** Strategic theme or product area identified
**Exit criteria:** Vision reviewed, OKRs set, PRISM review completed

---

## Phases (high level)

- **Discovery:** see `workflows/product-discovery.md`
- **Definition:** see `workflows/product-definition.md`
- **Delivery:** see `workflows/product-delivery.md`

## Supporting skills

These skills can be used at any point during the workflow:

| Skill | When to use |
|-------|------------|
| `/ice-score` | When you need to quickly prioritize ideas in the backlog |
| `/prism-review` | Before or after drafting strategy documents |
| `/vision-review` | When evaluating product vision quality |
| `/okr-coach` | When drafting or revising OKRs |
| `/team-structure` | When considering org design changes |
| `/design-brief` | When starting design work on a feature |
| `/figma-prompt` | When creating Figma prototypes |
| `/meeting-notes` | During 1:1 meetings |

## Automation

Use `/discovery-workflow [initiative-name]` to have the system automatically detect your current stage and guide you to the next step. The workflow is entirely file-system based; no database needed.
