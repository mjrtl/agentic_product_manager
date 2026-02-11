# Delivery metrics guide

## Overview

This guide covers three delivery metric categories: DORA metrics for deployment performance, QA KPIs for quality assurance, and adoption metrics for product usage. Each section includes definitions, measurement guidance, benchmarks, and a snapshot template.

---

## DORA metrics

The four key metrics from the DORA (DevOps Research and Assessment) program that predict software delivery performance.

### Definitions

| Metric | Definition | How to measure |
|--------|-----------|----------------|
| Deployment frequency | How often code deploys to production | Count deploys per time period from CI/CD pipeline |
| Lead time for changes | Time from commit to production | Measure from merge to main branch to production deploy |
| Change failure rate | Percentage of deployments causing failures | Failed deploys / total deploys over the period |
| Mean time to recovery | Time to restore service after a failure | Average time from incident detection to resolution |

### Performance benchmarks

| Metric | Elite | High | Medium | Low |
|--------|-------|------|--------|-----|
| Deployment frequency | On-demand (multiple per day) | Weekly to monthly | Monthly to semi-annually | Semi-annually or less |
| Lead time | Less than 1 hour | 1 day to 1 week | 1 week to 1 month | 1 month to 6 months |
| Change failure rate | 0-5% | 5-10% | 10-15% | 16-30% |
| MTTR | Less than 1 hour | Less than 1 day | Less than 1 week | More than 1 week |

### DORA snapshot template

```markdown
# DORA metrics snapshot

**Date:** [YYYY-MM-DD]
**Initiative:** [initiative-name]
**Period:** [start-date] to [end-date]

## Metrics

| Metric | Value | Benchmark | Trend |
|--------|-------|-----------|-------|
| Deployment frequency | [value] | [elite/high/medium/low] | [up/down/stable vs last period] |
| Lead time for changes | [value] | [elite/high/medium/low] | [up/down/stable] |
| Change failure rate | [value]% | [elite/high/medium/low] | [up/down/stable] |
| Mean time to recovery | [value] | [elite/high/medium/low] | [up/down/stable] |

## Context

[Notable events this period: releases, incidents, team changes, etc.]

## Actions

- [ ] [Action item based on metrics]
- [ ] [Action item based on metrics]

## Previous snapshots

| Date | Deploy freq | Lead time | Failure rate | MTTR |
|------|------------|-----------|-------------|------|
| [previous date] | [value] | [value] | [value] | [value] |
```

---

## QA KPIs

Quality assurance metrics that track testing effectiveness and defect management.

### Definitions

| Metric | Definition | How to measure |
|--------|-----------|----------------|
| Defect density | Defects per unit of code | Bugs found / KLOC (thousands of lines of code) or per feature |
| Test coverage | Percentage of code exercised by tests | Lines or branches covered / total lines or branches |
| Escape rate | Bugs that reach production | Production bugs / total bugs found (in period) |
| Mean time to detect | Average time to find a defect | Time from introduction to discovery |

### QA benchmarks

| Metric | Good | Acceptable | Needs improvement |
|--------|------|------------|-------------------|
| Defect density | < 1 per KLOC | 1-5 per KLOC | > 5 per KLOC |
| Test coverage | > 80% | 60-80% | < 60% |
| Escape rate | < 5% | 5-15% | > 15% |
| Mean time to detect | < 1 day | 1-7 days | > 7 days |

### QA snapshot template

```markdown
# QA KPIs snapshot

**Date:** [YYYY-MM-DD]
**Initiative:** [initiative-name]
**Period:** [start-date] to [end-date]

## Metrics

| Metric | Value | Benchmark | Trend |
|--------|-------|-----------|-------|
| Defect density | [value] per KLOC | [good/acceptable/needs improvement] | [trend] |
| Test coverage | [value]% | [good/acceptable/needs improvement] | [trend] |
| Escape rate | [value]% | [good/acceptable/needs improvement] | [trend] |
| Mean time to detect | [value] | [good/acceptable/needs improvement] | [trend] |

## Test summary

- **Total tests:** [number]
- **Passing:** [number] ([percentage]%)
- **Failing:** [number]
- **Skipped:** [number]

## Open defects

| ID | Severity | Summary | Age |
|----|----------|---------|-----|
| [id] | [critical/high/medium/low] | [summary] | [days open] |

## Actions

- [ ] [Action item based on metrics]
- [ ] [Action item based on metrics]
```

---

## Adoption metrics

Product usage metrics that track whether customers adopt and retain the feature or product.

### Definitions

| Metric | Definition | How to measure |
|--------|-----------|----------------|
| Activation rate | Percentage of new users completing key action | Users completing activation / total new users |
| DAU/WAU/MAU | Daily, weekly, monthly active users | Unique users performing a core action in period |
| Feature adoption rate | Users of a feature vs total active users | Feature users / total active users |
| Retention (D1/D7/D30) | Users returning after N days | Users active on day N / users from cohort |
| NPS | Net Promoter Score | (Promoters - Detractors) / Total respondents x 100 |
| CSAT | Customer Satisfaction Score | Satisfied responses / total responses |

### Adoption benchmarks

| Metric | Strong | Average | Weak |
|--------|--------|---------|------|
| Activation rate | > 40% | 20-40% | < 20% |
| DAU/MAU ratio | > 25% | 10-25% | < 10% |
| Feature adoption | > 30% | 10-30% | < 10% |
| D1 retention | > 40% | 20-40% | < 20% |
| D7 retention | > 20% | 10-20% | < 10% |
| D30 retention | > 10% | 5-10% | < 5% |
| NPS | > 50 | 0-50 | < 0 |

### Adoption snapshot template

```markdown
# Adoption metrics snapshot

**Date:** [YYYY-MM-DD]
**Initiative:** [initiative-name]
**Period:** [start-date] to [end-date]

## Usage metrics

| Metric | Value | Benchmark | Trend |
|--------|-------|-----------|-------|
| DAU | [value] | - | [trend] |
| WAU | [value] | - | [trend] |
| MAU | [value] | - | [trend] |
| DAU/MAU ratio | [value]% | [strong/average/weak] | [trend] |

## Activation and adoption

| Metric | Value | Benchmark | Trend |
|--------|-------|-----------|-------|
| Activation rate | [value]% | [strong/average/weak] | [trend] |
| Feature adoption rate | [value]% | [strong/average/weak] | [trend] |

## Retention cohort

| Cohort | D1 | D7 | D30 |
|--------|-----|-----|------|
| [date range] | [value]% | [value]% | [value]% |
| [previous cohort] | [value]% | [value]% | [value]% |

## Satisfaction

| Metric | Value | Benchmark |
|--------|-------|-----------|
| NPS | [value] | [strong/average/weak] |
| CSAT | [value]% | - |

## Key observations

[Notable patterns, anomalies, or insights from the data]

## Actions

- [ ] [Action item based on metrics]
- [ ] [Action item based on metrics]
```

---

## Trend analysis guidance

When comparing snapshots over time:

1. **Identify direction**: Is each metric improving, declining, or stable?
2. **Contextualize changes**: Correlate metric changes with events (releases, incidents, campaigns)
3. **Flag regressions**: Call out metrics that dropped below acceptable benchmarks
4. **Celebrate wins**: Highlight metrics that improved to a higher benchmark tier
5. **Set targets**: Based on current performance, set realistic targets for the next period

When generating a new snapshot, always load the most recent previous snapshot of the same type to enable trend comparison.
