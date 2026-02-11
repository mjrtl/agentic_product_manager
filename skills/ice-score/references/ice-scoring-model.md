# ICE Scoring Model

## Impact Mapping

| Target Metric Change (%) | Impact |
|---|---|
| > 50% | 10 |
| 35-49.9% | 9 |
| 25-34.9% | 8 |
| 18-24.9% | 7 |
| 12-17.9% | 6 |
| 7-11.9% | 5 |
| 4-6.9% | 4 |
| 2-3.9% | 3 |
| 0.5-1.9% | 2 |
| 0.1-0.4% | 1 |
| <= 0% | 0 |

- Automatic fallback: If no explicit percentage is provided, assume a default +1.5% improvement -> Impact 2.

## Ease Mapping (Estimated Effort: person-weeks)

| Duration | Ease |
|---|---|
| < 1 week | 10 |
| 1-2 weeks | 9 |
| 3-4 weeks | 8 |
| 5-6 weeks | 7 |
| 6-7 weeks | 6 |
| 8-9 weeks | 5 |
| 10-12 weeks | 4 |
| 13-16 weeks | 3 |
| 17-25 weeks | 2 |
| >= 26 weeks | 1 |

## Evidence Types (Count only evidence directly tied to Impact)

| Evidence Type | Description |
|---|---|
| Test Results | A/B tests, longitudinal user studies, beta experiments, large MVPs with quantitative validation |
| User-based Evidence | Product usage data, 20+ user interviews, usability studies, MVP results/feedback |
| Market Data | Surveys, smoke tests, "table stakes" in the competitive set |
| Empirical Evidence | Few data points, sales requests, 1-3 interested customers, one competitor has the feature |
| Estimates & Plans | Internal model-based estimates, feasibility review with Eng/Design, schedule/business model analysis |
| Opinions of Others | Executives/colleagues/experts/investors opinions |
| Directional Fit | Alignment with company vision/strategy, tech/market trends, external research, macro trends |
| Self-belief | Personal intuition/gut feel/experience |

### Classification rules

- Use only explicitly stated evidence in the input. No inference.
- Statements like "intuitively", "personally I think", "my gut says" -> classify as Self-belief.
- Without explicit quantitative backing, do not accept as Market Data or Estimates & Plans.

## Confidence Calculation

- Principle: Include only evidence that directly supports Impact.
- Per-type contribution = MIN(Weight x count, Max)
- Group caps (sum upper bounds):
  - Self-belief + Directional Fit <= 0.1
  - Opinions of Others + Estimates & Plans <= 0.5
  - Market Data + User-based Evidence <= 3.0

| Evidence Type | Weight | Max |
|---|---:|---:|
| Self-belief | 0.01 | 0.1 |
| Directional Fit | 0.05 | 0.1 |
| Opinions of Others | 0.10 | 0.5 |
| Estimates & Plans | 0.30 | 0.5 |
| Empirical Evidence | 0.50 | 1.0 |
| Market Data | 1.0 | 3.0 |
| User-based Evidence | 2.0 | 3.0 |
| Test Results | 3.0 | 5.0 |

- Keyword hints (examples): "test/experiment/AB", "user request/behavioral data", "market/competitor/table stakes", "estimate/modeling", "intuition/gut/personally".

## ICE Score and Priority Interpretation

- Formula: ICE = Impact x Confidence x Ease
- Interpretation:
  - >= 250: Consider immediate execution (high expected ROI)
  - 150-249: Promising; recommend additional precision testing
  - 100-149: Proceed with mitigations or phase-two testing
  - < 100: On hold or needs strengthening

## Example

- Idea: "AI-based revenue anomaly detection dashboard"
- Expected change: 26% -> Impact 8
- Effort: 5 weeks -> Ease 7
- Confidence input:
  - User-based Evidence (3) -> 2.0 x 3 = 6.0 -> Group C cap (<= 3.0) -> 3.0
  - Estimates & Plans (2) -> 0.3 x 2 = 0.6 -> Group B cap (<= 0.5) -> 0.5
  - Total: 3.0 + 0.5 = 3.5 -> Final C = 3.5
- ICE = 8 x 3.5 x 7 = 196 -> "Promising; recommend additional precision testing"

## Confidence Report Format

```markdown
- Details:
  - Self-belief: 0.01 x [n] -> [x] (max 0.1, Group A <= 0.1)
  - Directional Fit: 0.05 x [n] -> [x]
  - Opinions of Others: 0.10 x [n] -> [x] (Group B <= 0.5)
  - Estimates & Plans: 0.30 x [n] -> [x]
  - Empirical Evidence: 0.50 x [n] -> [x] (max 1.0)
  - Market Data: 1.0 x [n] -> [x] (Group C <= 3.0)
  - User-based Evidence: 2.0 x [n] -> [x]
  - Test Results: 3.0 x [n] -> [x] (max 5.0)
- Group caps applied:
  - Group A (Self-belief + Directional Fit): [sum] -> [capped]
  - Group B (Opinions + Estimates): [sum] -> [capped]
  - Group C (Market + User): [sum] -> [capped]
- **Final Confidence:** [C]
```
