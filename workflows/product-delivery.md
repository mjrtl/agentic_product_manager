# Product delivery workflow

This workflow covers **product delivery**: executing tasks, maintaining quality, capturing delivery metrics, and shipping with adoption measurement.

## Where this lives

- **Initiative workspace:** `initiatives/[name]/`
- **Delivery outputs:** `initiatives/[name]/3-delivery/`

## Delivery pipeline (pragmatic sequence)

```
Tasks → QA → Delivery metrics (DORA) → Launch → Adoption measurement
```

## Stage 1: Process tasks and QA

**Skills:** `/process-tasks`, `/delivery-metrics --type qa`  
**Outputs:**
- `3-delivery/3.1-tasks/` (completed tasks, changes, notes)
- `3-delivery/3.2-qa/` (test plans/results + QA KPI snapshots)

**Entry criteria:** Definition of Ready met (see [product-definition.md](product-definition.md) and [definition_of_ready.md](references/keyrock_product_process/definition_of_ready.md)); approved task list from `/generate-tasks`.  
**Exit criteria:** Tasks completed with working software; QA results captured

**Best-practice guardrails (keep it pragmatic):**
- One sub-task at a time; avoid parallel WIP unless necessary.
- Always record how to validate (test steps / checks), not just what changed.

## Stage 2: Delivery metrics (DORA)

**Skill:** `/delivery-metrics --type dora`  
**Output:** `3-delivery/3.3-delivery-metrics/dora-[YYYY-MM-DD].md`

**Entry criteria:** Active development with CI/CD (or at least deploy events)  
**Exit criteria:** DORA snapshot captured + trend discussed

## Stage 3: Launch

**Skill:** `/delivery-metrics --type adoption`  
**Outputs:**
- `3-delivery/3.5-launch/` (launch plan, readiness checklist, comms, retro)
- `3-delivery/3.4-product-analytics/adoption-[YYYY-MM-DD].md` (adoption metrics snapshot)

**Entry criteria:** QA complete; launch plan ready  
**Exit criteria:** Launch executed; adoption measured; follow-ups tracked

## Exec checkpoint (recommended)

Maintain:

- `3-delivery/00-exec-summary.md` (what shipped, impact, quality, what’s next)
- A consistent cadence for metric snapshots (weekly during active delivery)

