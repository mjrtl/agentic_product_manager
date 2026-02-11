# Delivery metrics

DORA metric snapshots and delivery performance tracking for this initiative.

## Files to create

### DORA snapshots
- `dora-[YYYY-MM-DD].md` - Deployment frequency, lead time, change failure rate, MTTR
- Use `/delivery-metrics --type dora` to generate structured snapshots

### Adoption snapshots
- Adoption metrics go in `product-analytics/adoption-[YYYY-MM-DD].md`

## DORA metrics tracked

| Metric | What it measures |
|--------|-----------------|
| Deployment frequency | How often code deploys to production |
| Lead time for changes | Time from commit to production |
| Change failure rate | Percentage of deployments causing failures |
| Mean time to recovery | Time to restore service after failure |

## Measurement cadence

- Capture DORA snapshots weekly or bi-weekly during active development
- Compare against previous snapshots to track trends
- Use benchmarks (elite/high/medium/low) to assess performance

---
*Use `/delivery-metrics --type dora` to generate structured DORA snapshots.*
