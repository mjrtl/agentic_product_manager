# Opportunity ROI assessment

## Overview

An optional step after opportunity assessment and target selection. Provides a structured framework for estimating the return on investment of pursuing a target opportunity.

## When to use

- After selecting a target opportunity
- When stakeholders need a business case before committing resources
- When comparing multiple target opportunities across initiatives

## Value sizing

### Revenue impact

| Category | Estimate | Confidence | Notes |
|----------|----------|------------|-------|
| New revenue (monthly) | $[amount] | [high/medium/low] | [basis for estimate] |
| Expansion revenue | $[amount] | [high/medium/low] | [basis] |
| Retained revenue (churn prevention) | $[amount] | [high/medium/low] | [basis] |
| **Total monthly value** | **$[sum]** | | |

### Cost savings

| Category | Estimate | Confidence | Notes |
|----------|----------|------------|-------|
| Support cost reduction | $[amount]/mo | [high/medium/low] | [basis] |
| Operational efficiency | $[amount]/mo | [high/medium/low] | [basis] |
| Infrastructure savings | $[amount]/mo | [high/medium/low] | [basis] |
| **Total monthly savings** | **$[sum]** | | |

### Efficiency gains

| Category | Estimate | Confidence | Notes |
|----------|----------|------------|-------|
| Time saved per user | [hours]/[period] | [high/medium/low] | [basis] |
| Affected users | [number] | [high/medium/low] | [basis] |
| Process steps eliminated | [number] | [high/medium/low] | [basis] |

## Cost estimation

### Development cost

| Category | Estimate | Confidence | Notes |
|----------|----------|------------|-------|
| Engineering (person-weeks) | [number] | [high/medium/low] | [basis] |
| Design (person-weeks) | [number] | [high/medium/low] | [basis] |
| QA (person-weeks) | [number] | [high/medium/low] | [basis] |
| PM (person-weeks) | [number] | [high/medium/low] | [basis] |
| **Total person-weeks** | **[sum]** | | |
| **Estimated cost** | **$[total]** | | [rate x weeks] |

### Ongoing costs

| Category | Monthly cost | Confidence | Notes |
|----------|-------------|------------|-------|
| Infrastructure | $[amount] | [high/medium/low] | [basis] |
| Maintenance (eng hours) | [hours] ($[amount]) | [high/medium/low] | [basis] |
| Support | $[amount] | [high/medium/low] | [basis] |
| **Total monthly ongoing** | **$[sum]** | | |

## ROI calculation

```
Monthly net value = (Total monthly value + Total monthly savings) - Total monthly ongoing costs
Development cost = Total person-weeks x average weekly cost
Payback period = Development cost / Monthly net value
Annual ROI = ((Monthly net value x 12) - Development cost) / Development cost x 100%
```

| Metric | Value |
|--------|-------|
| Monthly net value | $[calculated] |
| Development cost | $[calculated] |
| Payback period | [N] months |
| Year 1 ROI | [N]% |

## Confidence rating

Rate the overall confidence of this ROI assessment:

- **High**: Based on historical data, direct customer commitments, or proven benchmarks
- **Medium**: Based on reasonable estimates with some data support
- **Low**: Based on assumptions that need validation

**Overall confidence:** [high/medium/low]

**Key assumptions to validate:**
1. [Assumption that most affects the estimate]
2. [Second most impactful assumption]
3. [Third assumption]

## Output

- **Format:** Markdown (`.md`)
- **Location:** `discovery/opportunities/[topic]/roi-[topic]-v[N].md`
- **Version management:** Check existing files, auto-increment version, never overwrite

## Process

1. Start with the target opportunity from the opportunity assessment
2. Walk through value sizing categories, asking for estimates and confidence levels
3. Walk through cost estimation, asking for development and ongoing cost estimates
4. Calculate ROI metrics
5. Identify the top 3 assumptions that most affect the estimate
6. Present the complete assessment for review
