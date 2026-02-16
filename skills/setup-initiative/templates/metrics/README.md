# Definition-phase metrics (optional)

Use this folder when **PR-FAQ/PRD success criteria** depend on quantitative baselines or custom ops/product metrics. If you only need standard delivery metrics (DORA, QA, adoption), use `3-delivery/3.3-delivery-metrics/` and `3-delivery/3.4-product-analytics/` instead.

## When to use

- Success criteria are “from → to” (e.g. “reduce approval time from X to Y”).
- You need a **metric definitions** list (what we measure, how we measure) for ops or stakeholders.
- You need a **metrics infra plan** (APIs, exports, time tracking) before you can capture a baseline.
- Definition should **gate** on “baseline metrics capturable” before PR-FAQ/PRD.

## Suggested artifacts

| Artifact | Purpose |
|----------|---------|
| `metrics-ops-confirmation.md` (or similar) | Metric definitions and sign-off (time, volume, audit, etc.). |
| `metrics-next-steps.md` (or similar) | Infra needed (e.g. Shortcut API, HubSpot, time tracking), baseline capture plan, order of operations. |
| Baseline snapshot | First run of key metrics; move to `3-delivery/3.4-product-analytics/baseline-metrics.md` once captured. |

## Gate

Definition can proceed to PR-FAQ/PRD once baseline metrics are capturable (infra in place + first baseline run). Use the baseline in PR-FAQ and PRD for success criteria.

---
*See stage map: 2.4 Metrics (optional). Folder: `2-definition/2.4-metrics/`.*
