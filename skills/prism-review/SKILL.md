---
name: PRISM Review
description: >
  Run an evidence-based PRISM strategy review. Scores your strategy document
  across 5 dimensions (Problem, Reframe, Intentional Bets, Systemized Execution,
  Momentum) with detailed rubrics and citation requirements.
argument-hint: "[path-to-strategy-doc]"
---

# PRISM Strategy Review

Run a full evidence-based self-review of a product strategy document using the PRISM framework.

## When to use

- Before a strategy review meeting
- After drafting or updating a product strategy
- When you need structured feedback on strategic quality

## Process

1. Provide your strategy document (file path or paste content)
2. The review runs an Evidence Readiness auto-gate first
3. If status = Hold, you'll get a 1-Day Evidence Sprint proposal
4. If status = Proceed, each PRISM dimension is scored 0-5

## PRISM dimensions (0-5 each)

- **P** - Problem Diagnosis
- **R** - Reframe Opportunity
- **I** - Intentional Bets
- **S** - Systemized Execution
- **M** - Momentum & Meta-Reflection

Overall Score = average (equal weighting).

## Outputs

- `review.md` (human-readable, <= 900 words)
- `review.json` (machine-readable)

## Citation standard

All evidence must use: `[[ev-id|path#line-range|YYYY-MM-DD]]`

Missing citations result in a 1-step deduction per dimension.

For full scoring rubrics, evidence gate details, and output templates, see `references/prism-strategy-review.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
