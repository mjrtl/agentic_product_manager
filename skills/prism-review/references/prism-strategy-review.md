# PRISM Strategy Review

## Intent

Head of Product/CPO conducts **evidence-based** self-review of their strategy document to validate:
(1) Core Thesis, (2) Strategic Options comparison, (3) Capital Allocation decisions,
(4) Pre-mortem/Kill-Switch + Adaptation definition, (5) **Mission/Vision alignment** and **Stakeholder alignment**.

Outputs: **Markdown (human-readable)** + **JSON (machine-readable)** simultaneously generated.

## Inputs (required)

- doc_link (string, required) - strategy document to review
- evidence_hub_link (string, required) - consolidated evidence location
- product_or_area (string, required)
- owner (string, required)
- review_window_start (YYYY-MM-DD, required)
- review_window_end (YYYY-MM-DD, required)
- riskiest_assumptions (string[], minItems=2, required)
- baseline_metric (string|number, optional)
- north_star (string, optional) - NSM
- capacity_window (object, optional) - {fte:number, budget:number}
- runway_months (number, optional)

If missing, return MissingInputs list with 1-Day Evidence Sprint proposal only (no scoring).

## Citation Standard (required)

All evidence must use this format:
- [[ev-id|path#line-range|YYYY-MM-DD]]

Example: [[ev-12|initiatives/kbo/analysis.md#L42-L77|2025-09-10]]

Missing citations result in **1-step deduction** per dimension.

## Modes - Self-Review Flow

### Mode 0 - Principle Alignment (Mission/Vision/Principles Coherence)

- Mission/Vision Coherence: How does this strategy connect to company Mission/Vision/Principles?
- Vision Narrative (1-3y): One paragraph Narrative of success 1-3 years from now.
- Value Thesis (one sentence): Value mechanism of "Why Us, Why Now".

### Mode 1 - Socratic Checklist (Core Questions)

- Thesis (core claim in one sentence)
- Outcome (Leading vs Lagging distinction, customer/business)
- Opportunity (ICP/Segment/Use-case, TAM/SAM/SOM evidence)
- Causality (Why Now? Change factors: market/technology/user behavior/regulation)
- Alternatives (>=3: Do Nothing / Focused Bet / Portfolio Bet)
- Trade-off & Non-goals (what we intentionally won't do)
- Unit Economics (LTV/CAC/Payback/GMs/CMs) key assumptions
- Disconfirming Evidence (counterexamples) and rejection reasons

### Mode 2 - Bias Guardrails (Bias Prevention)

Must address each of these 6 in one line each, otherwise Proceed prohibited (=HOLD):
- Confirmation / Availability / Sunk Cost / Survivorship / Overconfidence / Anchoring

### Mode 3 - Options & Capital Allocation (Comparison Table)

For each option:
- Assumptions (Top-3) + Confidence (0-1)
- Investment: FTE, CapEx, Opex, Time-to-Impact (weeks)
- Impact: NSM/OKR expected range (delta)
- Risks (Top-3) + Mitigation
- Non-goals (out of scope)
- Decision Rule (selection threshold/condition; e.g., Payback <= 9m then Go)

### Mode 4 - Scenario(3) & Runway (Sensitivity/Constraints)

- Base/Upside/Downside: ROI/Payback sensitivity
- Runway/Capacity constraints reflected in Sequencing by Quarter (Q-by-Q start order/parallel limits)

### Mode 5 - Pre-mortem, Kill-Switch & Adaptability (Extended)

- Pre-mortem: Top-5 failure causes
- Leading Indicators (3): metrics/queries/logs + measurement frequency
- Kill-Switch Criteria: metric + period(window) + Action (Pause/Pivot/Stop)
- Pivot Triggers: transition conditions
- Market Triggers: external signals (competitor launch/policy/platform change/cost curve/ecosystem events)
- Adaptation Plan: discussion and priority reallocation rules (Playbook) when signals detected

### Mode 6 - Stakeholder Lens (Extended)

- Investor/Board Lens: North Star/OKR/Unit Economics vs IR Narrative fit, Volatility/Seasonality risks
- Engineering Lens: Technical Debt/platform constraints, team autonomy/motivation
- GTM Lens: Sales/Marketing Narrative Fit, channel/sales motion alignment
- Customer Support Lens: expected issue volume/type, Help Center/Macro/Tooling preparation

## Evidence Gate (Auto)

Core (>=4 required for Proceed):
1. Last-180d Signals >= 3 (founder/customer notes, 3-5 conv. summaries, tickets/reviews, competitor moves)
2. "Riskiest" assumptions >= 2 (tagged/listed)
3. Success criterion (OMTM or qualitative heuristic) exists
4. 1-2 week Discovery Plan or OKR draft
5. Versioned Evidence Hub link 1+

Advanced (bonus points):
- Baseline metric
- NSM/Metric tree or Funnel
- Experiment plan/results (hypothesis-method-outcome)
- TAM/SAM/SOM/ICP estimates

Auto-decision:
- HOLD: Core <= 3 -> Return 1-Day Evidence Sprint proposal
- PROCEED: Core >= 4 (must include #2, #3)
- AUTO-ESCALATE: PROCEED + Advanced >= 2
- PROVISIONAL: major blocker conditional (missing condition/deadline -> error)

## Scoring (0-5) & Anchors

General Anchors:
0=no evidence, 1=memo level, 2=fragmentary/early, 3=solid/recent, 4=strong (metrics/experiment connected), 5=exemplary (reproducible)

### P - Problem Diagnosis

What good looks like:
- Identifies core challenge, distinguishes causes vs. symptoms, evidence-based.
- Articulates what's changing (market/tech/user behavior) and which assumptions broke.
- Ties user Jobs-To-Be-Done and unmet needs to business context.

Ask:
- What's changing in market, technology, or user behavior?
- Which assumptions are no longer holding true?
- What are users really trying to get done, and what blocks them?

Evidence to cite:
- Market/tech trend brief, user research synthesis, JTBD statements, opportunity map, analytics showing friction.

Red flags:
- Problem framed as feature gap, not causal diagnosis
- No user or market evidence; dated insights
- Confusing symptom metrics with root cause

Rubric (0-5):
- 0-1: Vague or opinion-only problem; no causal chain
- 2: Some evidence; symptoms and causes mixed
- 3: Clear causal story with recent evidence; scope reasonable
- 4: Strong causal model, validated with multiple sources and segmentation
- 5: Robust problem thesis with leading/lagging indicators and falsification paths

### R - Reframe Opportunity

What good looks like:
- Converts problem into compelling strategic opportunity with timing rationale.
- Clarifies what would shift for users/business if solved well; beyond incrementalism.

Ask:
- Why is now the right time?
- If solved, what materially changes for users and the business?
- What makes this more than incremental?

Evidence to cite:
- TAM/SAM/SOM or value pool, competitive whitespace, timing catalysts, user willingness signals.

Red flags:
- Jumps to features; lacks clear opportunity thesis
- No timing rationale; ignores competitive dynamics

Rubric (0-5):
- 0-1: No opportunity framing
- 2: Opportunity stated but generic; weak timing
- 3: Clear opportunity thesis with timing and scope
- 4: Differentiated framing with credible mechanism of advantage
- 5: Compelling, time-sensitive opportunity with defensibility and user/business shift defined

### I - Intentional Bets

What good looks like:
- Bold, testable strategic choices with explicit trade-offs and non-goals.
- Crisp Where-to-Play / How-to-Win statements linked to measurable hypotheses.

Ask:
- What are the few big bets? What are we not doing?
- How are bets testable within timeframe with clear success thresholds?
- How do bets connect to hypotheses and upside?

Evidence to cite:
- Bet statements, non-goals, hypotheses with metrics, decision logs, alternative paths considered.

Red flags:
- Feature lists disguised as strategy; no trade-offs
- No hypotheses or thresholds; can't be falsified

Rubric (0-5):
- 0-1: No real choices; themes only
- 2: Choices exist but lack trade-offs or tests
- 3: Defined bets with non-goals and baseline hypotheses
- 4: Testable, time-bound bets with success/failure thresholds and resourcing
- 5: Coherent portfolio of bets with staged options and kill/sustain criteria

### S - Systemized Execution

What good looks like:
- Strategy translates into OKRs, North Star/inputs, and discovery loops.
- Bets shape backlog, governance, and learning checkpoints.

Ask:
- Do OKRs reflect the bets vs. BAU metrics?
- Are discovery/validation loops defined with leading indicators?
- Are check-ins and operating rhythms in place?

Evidence to cite:
- OKRs, North Star metric tree, discovery plan, experiment backlog, rituals calendar, resource plan.

Red flags:
- OKRs disconnected from bets; vanity or lag-only metrics
- No discovery cadence; roadmap-first planning

Rubric (0-5):
- 0-1: No bridge to execution
- 2: Some metrics or OKRs, weak alignment
- 3: OKRs and discovery plan map to bets
- 4: Robust metric tree, clear owners, and learning cadence
- 5: Tight strategy-to-execution system with adaptive re-planning and leading-to-lagging linkage

### M - Momentum & Meta-Reflection

What good looks like:
- Built-in reflection to avoid strategic drift; deliberate learning objectives.
- Regularly says no; challenges assumptions; documents learning.

Ask:
- What did we learn this quarter? What changed?
- Where did we say yes when we should've said no?
- What are we not challenging enough?

Evidence to cite:
- Quarterly retro, decision reviews, stopped work examples, updated assumptions log.

Red flags:
- No retros; strategy as static doc
- Accretion of scope; no stopped initiatives

Rubric (0-5):
- 0-1: No reflection mechanisms
- 2: Ad-hoc reflection; little impact on choices
- 3: Quarterly reviews with documented learning and some course-correction
- 4: Systematic reflection tied to decisions and resource shifts
- 5: Strong learning culture with explicit un-learning and portfolio rebalancing

## Output Template

```md
Title: PRISM Strategy Review - <Product/Area> - <YYYY-MM-DD>

Eligibility (auto-gate): Proceed / Hold / Auto-escalated
Doc: <link>
Evidence Hub: <link>
Owner: @name
Window: YYYY-MM-DD ~ YYYY-MM-DD

Executive Summary (3-5 bullets)
- Key call: Approve / Provisionally Approve (with conditions) / Revise & Resubmit
- Top strengths
- Top risks/assumptions to resolve

Scores (0-5)
- P - Problem Diagnosis: <score> - evidence: <links>
- R - Reframe Opportunity: <score> - evidence: <links>
- I - Intentional Bets: <score> - evidence: <links>
- S - Systemized Execution: <score> - evidence: <links>
- M - Momentum & Meta-Reflection: <score> - evidence: <links>
- Overall Score: <avg>

Findings & Rationale
- P: <summary of diagnosis quality>
- R: <summary of opportunity framing>
- I: <summary of bets and trade-offs>
- S: <summary of strategy-to-execution alignment>
- M: <summary of reflection mechanisms>

Priority Improvements (numbered, with owners & dates)
1) [P/R/I/S/M] <improvement>, Owner: <name>, Due: <date>, Success: <measure>

Risks & Assumptions to Validate
- Assumption: <text> - Test: <method> - Threshold: <value> - By: <date>

Decision & Next Steps
- Decision: <approve status>
- Immediate actions: <bullets>
- Next review date: <date>
```

## JSON Output Schema

```json
{
  "title": "PRISM Strategy Review - <Area> - <YYYY-MM-DD>",
  "eligibility": "PROCEED|HOLD|AUTO-ESCALATE|PROVISIONAL",
  "window": {"start":"YYYY-MM-DD","end":"YYYY-MM-DD"},
  "doc": "<link>", "evidenceHub": "<link>", "owner": "@name",
  "principle_alignment": {
    "mission_vision_coherence": "...",
    "vision_narrative_1_3y": "...",
    "value_thesis": "..."
  },
  "scores": {"P":4,"R":3,"I":4,"S":3,"M":4,"overall":3.6},
  "options": [{"name":"Do Nothing","assumptions":[],"investment":{},"impact":{},"risks":[],"non_goals":[],"decision_rule":"..."}],
  "capital_allocation": {"total_fte":"...","budget":"..."},
  "scenarios": {"base":{},"upside":{},"downside":{}},
  "assumptions_tests": [],
  "leading_indicators": [],
  "kill_switch": [],
  "market_triggers": [],
  "stakeholder_lens": {},
  "next_steps": {"immediate":[],"nextReviewDate":"YYYY-MM-DD"},
  "citations": []
}
```

## Operational Rules

- Missing required input -> HOLD + 1-Day Evidence Sprint (specify required items)
- Never hallucinate evidence; only cite materials within inputs
- Generation order: review.json -> review.md
- Token/length: md <= 900 words; Exec Summary 3-5 bullets

## Common Anti-patterns (Quick Reference)

- Strategy as feature list; no explicit trade-offs or non-goals
- Lagging metrics only; no leading indicators for discovery
- Untested assumptions presented as facts; no falsification plan
- Over-expansive scope; unclear target segment or use case
- Reflection is performative; no stopped work or resource reallocation
