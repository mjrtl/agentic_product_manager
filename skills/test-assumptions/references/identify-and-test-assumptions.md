# Identify and Test Assumptions - Reference

## Goal

Extract explicit assumptions from insights and opportunities, categorize and prioritize them to identify "leap-of-faith" assumptions, and design a lightweight, iteratively-scaled testing plan that reduces risk across desirability, usability, feasibility, viability, and ethical dimensions.

## When to Use

- After creating opportunities
- After synthesizing interviews
- When preparing to generate or downselect solutions
- Whenever a new idea is proposed and you need to surface and derisk its underlying assumptions

## Input

- **Primary Sources**: Prioritized opportunities, early solution sketches, interview snapshots, synthesis documents
- **Optional Sources**: Product analytics or behavioral data
- **Minimum Requirements**: 1 target opportunity with supporting evidence, and 2-3 candidate solution ideas OR a single idea with key user journeys

## Output

**Format:** Markdown (`.md`)
**Location:** `assumptions/[topic]/`
**Filename:** `assumptions-[opportunity-name]-v[version].md`

Version management: Check existing files, auto-increment version, never overwrite.

## Assumption Generation Guidelines

- **Use Five Categories:** Desirability, Usability, Feasibility, Viability, Ethical
- **Phrase Positively and Specifically:** State what must be true, in concrete, testable language
- **Tie to Behavior:** Prefer assumptions about what users will do over what they say
- **Attach Evidence:** Link each assumption to quotes, behaviors, or data when available
- **Normalize Granularity:** Split vague, compound assumptions into specific, testable statements

## Evidence Classification (Binary)

- **Strong Evidence:** Direct user quotes/behaviors, quantitative data from multiple sources, previous successful tests
- **Weak Evidence:** No direct evidence, single source or anecdotal, theoretical only

## Importance Evaluation (Binary)

- **More Important:** Core value proposition depends on it, failure would kill the solution, blocking other critical assumptions
- **Less Important:** Nice-to-have features, minor impact, non-blocking

## Prioritization (Assumption Mapping)

Place each assumption on a 2D grid:
- X-axis: Evidence known (left = strong, right = weak)
- Y-axis: Importance (bottom = less important, top = more important)

**Leap of Faith (LoFA):** Select ONLY assumptions in the top-right quadrant:
- Weak Evidence + More Important
- **Maximum 3 LoFA** per assumption document

## Process

### 0) File Management (MANDATORY)

Extract topic, check existing files, auto-increment version, never overwrite.

### 1) Prepare Context and Actors

Confirm target opportunity and desired outcome(s). Identify key actors.

### 2) Story Map Candidate Ideas

Assume the solution exists; map what users do to get value. Sequence steps by actor; highlight critical moments.

### 3) Generate Assumptions (Five Categories)

For each pivotal step, enumerate assumptions across: Desirability, Usability, Feasibility, Viability, Ethical.

### 4) Pre-Mortem (Prospective Hindsight)

"It's six months later; launch failed. What went wrong?" Convert reasons into specific assumptions.

### 5) Walk OST Lines (Outcome <-> Opportunity <-> Solution)

Write why the solution addresses the opportunity and drives the outcome. Extract each inference as a testable assumption.

### 6) Normalize, Deduplicate, and Attach Evidence

Rewrite assumptions to be positive, specific, and single-concept. Link supporting evidence.

### 7) Map and Prioritize

Plot all assumptions on 2D grid. Identify top-right quadrant. Select maximum 3 LoFA. If more than 3: prioritize by impact, test complexity, dependencies.

### 8) Define Test Cards for LoFA

For each LoFA, design the smallest simulation with clear success criteria.

### 9) Run Tests -> Record Results -> Update the Map

Move assumptions leftward as evidence grows; iterate or move to next riskiest item.

### 10) Decide and Proceed

Use accumulated evidence to evolve the idea, change the opportunity focus, or scale the solution test.

## Output Structure

```markdown
# Assumptions -- [Opportunity Name]

**Topic:** [Extracted topic name]
**Version:** [v1, v2, v3...]
**Target Opportunity:** [Opportunity statement]
**Related Documents:** [Snapshots/Synthesis/Opportunities/Solutions]

---

## Story Map Snapshot
- **Actors:** [End-user types, systems, partners]
- **Key Steps:**
  1. [Actor] -- [Step]
  2. [Actor] -- [Step]

---

## Assumption Log
| ID | Category | Assumption (positive, specific) | Evidence (link/quote/data) | Importance | Evidence Known | LoFA |
|----|----------|----------------------------------|-----------------------------|------------|----------------|------|
| A-01 | Desirability | [What must be true] | [Quote/analytics/ref] | More/Less | Strong/Weak | Yes/No |

---

## Assumption Map (Summary)
- **Top-right (LoFA):** [A-01, A-07, A-12] - Maximum 3
- **Notable clusters:** [e.g., viability assumptions lacking data]

---

## Test Cards (LoFA)

### Test Card: [A-01] -- [Short name]
- **Assumption:** [Statement]
- **Simulation:** [Prototype/mock experience/data query/concept test]
- **Method:** [Unmoderated test | Survey | Customer letter | Data Analysis | Concierge | Wizard of Oz | Usability Test | Fake door | Landing Page | etc.]
- **Audience:** [Screening criteria; segment]
- **Sample Size & Window:** [e.g., n=10 over 2 days]
- **Success Criteria:** [e.g., >= 3/10 do X]
- **Risks & Biases:** [Key concerns and mitigations]
- **Next Step if Pass/Fail:** [Scale test / iterate / experiment / pivot]

*(Repeat per LoFA)*

---

## Results and Decisions
- **Outcomes:** [Observed behaviors vs. criteria]
- **Map Update:** [Assumptions moved left; new LoFA]
- **Decisions:** [Proceed/iterate/stop]

---

## Next Steps
- [ ] Run next LoFA test
- [ ] Evolve idea based on findings
- [ ] Share summary with stakeholders
```

## Templates

### Assumption Statement Pattern

Actor + Action + Context + Outcome expected.
Example: "Prospective subscribers will select a live game from our home screen when browsing evening entertainment options."

### Pre-Mortem Prompt

"It's six months after launch and this failed. What happened?"
Capture each reason and rewrite as a positive, specific assumption.

### Assumption Mapping Grid

```
                    Evidence Known
                Strong              Weak
More     [A-01]  [A-03]    [A-02]  [A-04] <- LoFA (max 3)
Important

Less     [A-15]  [A-14]    [A-18]  [A-17]
Important
```

### Success Criteria Pattern

Define n participants and success threshold as an absolute number (not %).
Example: ">= 4 of 10 choose sports content on the prototype home screen."

## Common Anti-Patterns

- **Too many LoFA** -> Select maximum 3 from top-right quadrant only
- **Inconsistent classification** -> Use binary classification
- **Not enough assumptions** -> Use story map + pre-mortem + OST lines
- **Negative phrasing** -> Rewrite as what must be true
- **Not specific enough** -> Add actor, context, behavior, and outcome
- **Favoring one category** -> Cover all five categories
- **Overly complex simulations** -> Design smallest viable simulation first
- **Using percentages** -> Use absolute counts (e.g., 3 of 10)
- **Wrong audience** -> Screen for the target opportunity
- **Testing pessimistically** -> Start where passing is most likely

## Related Frameworks

- Create Interview Snapshots (`references/create-interview-snapshots.md`)
- Synthesize Interview Snapshots (`references/synthesize-interview-snapshots.md`)
- Create Opportunities (`references/create-opportunities.md`)
- Generate Solutions (`references/generate-solutions.md`)
