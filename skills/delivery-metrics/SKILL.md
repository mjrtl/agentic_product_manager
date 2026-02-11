---
name: Delivery Metrics
description: >
  Capture delivery performance snapshots. Supports three metric types:
  DORA (deployment frequency, lead time, change failure rate, MTTR),
  QA KPIs (defect density, coverage, escape rate), and adoption/usage metrics.
argument-hint: "<initiative-name> [--type dora|qa|adoption]"
---

# Delivery Metrics

Capture and track delivery performance through structured metric snapshots.

## When to use

- After tasks are generated and development begins (DORA metrics)
- During QA and testing phases (QA KPIs)
- After launch to track product adoption (adoption metrics)
- At regular intervals to monitor delivery health

## Metric types

### DORA metrics (`--type dora`)
- Deployment frequency
- Lead time for changes
- Change failure rate
- Mean time to recovery (MTTR)

### QA KPIs (`--type qa`)
- Defect density
- Test coverage
- Escape rate (bugs reaching production)
- Mean time to detect

### Adoption metrics (`--type adoption`)
- Activation rate
- DAU/WAU/MAU
- Feature adoption rate
- Retention (D1, D7, D30)
- NPS/CSAT

## Input

- Current metric values (from CI/CD, testing tools, or analytics platforms)
- Previous snapshots for trend comparison (auto-detected from folder)

## Process

1. **Detect type**: Determine metric type from `--type` flag or ask
2. **Load previous**: Scan for prior snapshots to enable trend analysis
3. **Guided data collection**: Walk through each metric with definitions and measurement guidance
4. **Generate snapshot**: Create timestamped snapshot with values, benchmarks, and trends

## Output

- **DORA:** `delivery/delivery-metrics/dora-[YYYY-MM-DD].md`
- **QA:** `delivery/qa/qa-kpis-[YYYY-MM-DD].md`
- **Adoption:** `delivery/product-analytics/adoption-[YYYY-MM-DD].md`

For full metric definitions, benchmarks, and snapshot templates, see `references/delivery-metrics-guide.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
