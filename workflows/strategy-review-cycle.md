# Strategy review cycle

This document describes a recurring strategy review workflow for product leaders.

## Strategy workspace

All strategy artifacts live in `strategy/[name]/`. Use `/setup-strategy` to scaffold a new workspace with folders for vision, OKRs, PRISM reviews, team structure, and evidence. Strategy workspaces must exist before creating initiatives; each initiative links back to its parent strategy.

## Overview

The strategy review cycle is a quarterly rhythm that helps product leaders validate and improve their strategy documents, OKRs, and team structure. It combines multiple review skills into a structured cadence.

## Quarterly cycle

```
Week 1-2: Prepare    Week 3: Review    Week 4: Act
  |                    |                  |
[Gather Evidence]  [Run Reviews]    [Improve & Plan]
```

## Phase 1: Prepare (weeks 1-2)

### Gather evidence

Before running any review, gather the evidence needed to score well:

1. **Last-180-day signals**: Collect founder/customer notes, conversation summaries, tickets/reviews, competitor moves (minimum 3)
2. **Riskiest assumptions**: Tag at least 2 assumptions in your strategy document
3. **Success criteria**: Define your OMTM or qualitative heuristic
4. **Discovery plan**: Prepare a 1-2 week discovery plan or OKR draft
5. **Evidence hub**: Create or update a versioned evidence location

### Organize inputs

Ensure these are accessible:
- Strategy document (current version)
- Product vision document
- OKR drafts for the upcoming quarter
- Team structure documentation
- Initiative status reports

## Phase 2: Review (week 3)

Run the review skills in this order:

### 1. Vision review

**Skill:** `/vision-review`

Start with the highest-level artifact. Score your product vision against 4 criteria:
- Lofty & Inspiring
- Realistic & Attainable
- Constraint-Free
- Grounded in User Problem

**Decision gate:** If score < 3 on any criterion, revise the vision before proceeding.

### 2. PRISM strategy review

**Skill:** `/prism-review`

Run the full PRISM review on your strategy document:
- Evidence gate (auto): needs >= 4 core items to proceed
- Score 5 dimensions: Problem, Reframe, Intentional Bets, Systemized Execution, Momentum
- Identify priority improvements with owners and dates

**Decision gate:** Overall score < 2.5 = Revise & Resubmit. Score >= 3.5 = Approve.

### 3. OKR sparring

**Skill:** `/okr-coach`

Submit your OKR drafts for structured criticism:
- Objective clarity and strategic alignment
- Key Results outcome-centricity
- Common pitfall detection
- Revised OKR examples

**Decision gate:** Revise OKRs based on feedback before finalizing.

### 4. Team structure check

**Skill:** `/team-structure`

Review whether your team structure supports your strategy:
- Does the current structure enable the strategic bets?
- Are roles and responsibilities clear?
- Is there a strategy-structure misalignment?

**Decision gate:** Only restructure if there is a strategy-organization misalignment.

## Phase 3: Act (week 4)

### Create improvement plan

From each review, collect:
1. Priority improvements (with owners and due dates)
2. Assumptions to validate (with test methods and thresholds)
3. Evidence gaps to fill

### Update documents

Save all outputs into the strategy workspace:
- Revise strategy document based on PRISM feedback -> `strategy/[name]/prism-reviews/`
- Update vision if needed -> `strategy/[name]/vision/`
- Finalize OKRs with sparring partner improvements -> `strategy/[name]/okrs/`
- Document team structure decisions -> `strategy/[name]/team-structure/`
- Update the review log -> `strategy/[name]/review-log.md`

### Set next cycle date

Schedule the next quarterly review. Add calendar reminders for:
- Week 1: Start evidence gathering
- Week 3: Review day
- Week 4: Improvement deadline

## ICE scoring integration

At any point during the quarter, use `/ice-score` to prioritize new ideas against your strategy. ICE scores should reference:
- Strategy alignment (Directional Fit evidence)
- OKR contribution (Impact mapping)
- Team capacity (Ease mapping)

## Tracking progress

Maintain a simple review log:

```markdown
# Strategy Review Log

## Q1 2025 Review
**Date:** 2025-01-15
**Vision Score:** 4.0 / 5.0
**PRISM Score:** 3.4 / 5.0
**Decision:** Provisionally Approved
**Key improvements:**
- [ ] Strengthen Problem Diagnosis with user research (Owner: PM, Due: 2025-02-01)
- [ ] Add leading indicators to Systemized Execution (Owner: Data, Due: 2025-01-31)

## Q4 2024 Review
...
```

## Cadence summary

| Activity | Frequency | Skill |
|----------|-----------|-------|
| Vision review | Quarterly | `/vision-review` |
| Strategy review (PRISM) | Quarterly | `/prism-review` |
| OKR sparring | Quarterly (at OKR setting) | `/okr-coach` |
| Team structure check | Quarterly or at strategy change | `/team-structure` |
| Idea scoring | Ongoing | `/ice-score` |
| Discovery pipeline | Continuous | `/discovery-workflow` |
