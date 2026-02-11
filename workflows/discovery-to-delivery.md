# Discovery to delivery workflow

This document describes the full product development pipeline from strategy through delivery.

## Overview

The discovery-to-delivery workflow transforms strategy and raw user research into validated, implemented, and launched product features. It follows the Continuous Discovery Habits (CDH) methodology by Teresa Torres, enhanced with a strategy layer, definition phase (PR-FAQ), and delivery tracking.

## Pipeline

```
Strategy → Setup → Interviews → Snapshots → Synthesis → Opportunities →
Solutions → Assumptions → PR-FAQ → PRD → Tasks → QA → Metrics → Launch
```

## Phase 0: Strategy (prerequisite)

Strategy provides the "why" for initiatives. Create a strategy workspace before starting initiatives.

**Skill:** `/setup-strategy`
**Output:** `strategy/[name]/` folder structure

### Strategy review cycle

Run these skills quarterly (see `workflows/strategy-review-cycle.md`):

| Skill | Output |
|-------|--------|
| `/vision-review` | `strategy/[name]/vision/` |
| `/prism-review` | `strategy/[name]/prism-reviews/` |
| `/okr-coach` | `strategy/[name]/okrs/` |
| `/team-structure` | `strategy/[name]/team-structure/` |

**Entry criteria:** Strategic theme or product area identified
**Exit criteria:** Vision reviewed, OKRs set, PRISM review completed

---

## Phase 1: Discovery (stages 1-6)

### 1. Setup initiative

**Skill:** `/setup-initiative`
**Output:** `initiatives/[name]/` folder structure

Create the standardized folder structure for a new initiative. This establishes the workspace where all subsequent artifacts will be stored. Link the initiative to a strategy workspace.

**Entry criteria:** Initiative name, owner, and goal defined; strategy workspace exists
**Exit criteria:** Folder structure created with all README templates

### 2. Conduct interviews and create snapshots

**Skill:** `/interview-snapshot`
**Output:** `user-interviews/snapshots/snapshot-[participant]-[date].md`

Conduct qualitative interviews or user test sessions, then extract structured insights into interview snapshots.

**Entry criteria:** Research goals defined, participants recruited
**Exit criteria:** 3-5+ interview snapshots completed

**Key principles:**
- Focus on concrete behaviors over opinions
- Extract specific stories, not generalizations
- Capture emotional moments and workarounds
- Preserve customer language and exact quotes

### 3. Synthesize patterns

**Skill:** `/synthesize-interviews`
**Output:** `user-interviews/synthesis/synthesis-[initiative]-v[N].md`

Analyze multiple snapshots to identify shared patterns, integrate experience maps, and create comprehensive insights.

**Entry criteria:** Minimum 3-5 interview snapshots
**Exit criteria:** Synthesis document with patterns, integrated experience map, and research gaps

**Key principles:**
- Incremental synthesis (process only new snapshots when updating)
- Version management (auto-increment, never overwrite)
- Focus on behavioral patterns, not opinions

### 4. Create opportunities

**Skill:** `/create-opportunities`
**Output:** `opportunities/[topic]/opportunities-[topic]-v[N].md`

Extract opportunities from research using the Opportunity Solution Tree framework. Optionally assess ROI for the target opportunity.

**Entry criteria:** Interview snapshots or synthesis documents
**Exit criteria:** Prioritized opportunity list with proposed target opportunity

**Key principles:**
- Problem-focused statements: "I want to ~ but ~ makes it difficult"
- No feature suggestions or solution language
- Two user review checkpoints (after extraction, after assessment)
- Compare siblings through 4 lenses (sizing, market, company, customer)
- Optional ROI assessment for business case

### 5. Generate solutions

**Skill:** `/generate-solutions`
**Output:** `solutions/[topic]/solutions-[topic]-v[N].md`

Generate multiple potential solutions through AI-human collaborative ideation.

**Entry criteria:** Clear target opportunity with supporting evidence
**Exit criteria:** Top 3 selected solutions with rationale

**Key principles:**
- MANDATORY: User generates at least 3 ideas before AI contributes
- Target 15-20 total ideas through collaborative ideation
- Seek diversity over quantity of similar ideas
- Select top 3 through collaborative evaluation

### 6. Identify and test assumptions

**Skill:** `/test-assumptions`
**Output:** `assumptions/[topic]/assumptions-[opportunity]-v[N].md`

Extract assumptions, prioritize "leap of faith" assumptions, and design lightweight tests.

**Entry criteria:** Prioritized opportunities and solution sketches
**Exit criteria:** Maximum 3 LoFA identified with test cards, test results recorded

**Key principles:**
- Five categories: Desirability, Usability, Feasibility, Viability, Ethical
- Binary classification for evidence and importance
- Maximum 3 Leap of Faith assumptions (weak evidence + more important)
- Smallest viable simulation with clear success criteria

---

## Phase 2: Definition (stages 7-9)

### 7. Create PR-FAQ

**Skill:** `/pr-faq`
**Output:** `prd/pr-faq-[feature-name].md`

Create an Amazon-style Press Release and FAQ document. Acts as the root document for a product or feature, forcing clear thinking about customer value.

**Entry criteria:** Validated opportunity, tested assumptions, solution concepts
**Exit criteria:** Approved PR-FAQ with press release, external FAQs, internal FAQs, and strategy traceability

**Key principles:**
- Write from the customer's perspective
- Every claim traces to validated evidence
- Internal FAQs address feasibility, cost, and timeline honestly
- Press release fits on one page (250-400 words)

### 8. Create PRD

**Skill:** `/prd` or `/one-pager`
**Output:** `prd/prd-[feature].md` or `prd/1-pager-[initiative].md`

Create a Product Requirements Document or decision-focused 1-Pager based on the PR-FAQ.

**Entry criteria:** Approved PR-FAQ (or validated opportunity with tested assumptions)
**Exit criteria:** Approved PRD with clear requirements

**Key principles:**
- Always ask clarifying questions first
- Target audience: junior developer
- Include success metrics and open questions

### 9. Generate tasks

**Skill:** `/generate-tasks`
**Output:** `tasks/tasks-[feature].md`

Break the PRD into implementation tasks.

**Entry criteria:** Approved PRD
**Exit criteria:** Task list with parent tasks and sub-tasks approved

**Key principles:**
- Generate parent tasks first, get approval, then sub-tasks
- Clear acceptance criteria for each task

---

## Phase 3: Delivery (stages 10-12)

### 10. Process tasks and QA

**Skills:** `/process-tasks`, `/delivery-metrics --type qa`
**Output:** `tasks/` (completed tasks), `qa/` (test plans and results)

Work through tasks systematically. Track quality through QA KPIs.

**Entry criteria:** Approved task list
**Exit criteria:** All tasks completed with conventional commits, QA KPIs captured

**Key principles:**
- One sub-task at a time
- Test-before-commit protocol
- Conventional commit format
- Track defect density, test coverage, and escape rate

### 11. Delivery metrics

**Skill:** `/delivery-metrics --type dora`
**Output:** `delivery-metrics/dora-[YYYY-MM-DD].md`

Capture DORA metrics during active development to track deployment health.

**Entry criteria:** Active development with CI/CD pipeline
**Exit criteria:** DORA snapshot captured with benchmark comparison

### 12. Launch

**Skill:** `/delivery-metrics --type adoption`
**Output:** `launch/` (plans and checklists), `product-analytics/adoption-[YYYY-MM-DD].md`

Execute launch plan and track adoption metrics post-launch.

**Entry criteria:** All tasks complete, QA signed off, launch plan ready
**Exit criteria:** Feature launched, adoption metrics captured, retrospective completed

---

## Supporting skills

These skills can be used at any point during the workflow:

| Skill | When to use |
|-------|------------|
| `/ice-score` | When you need to quickly prioritize ideas in the backlog |
| `/prism-review` | Before or after drafting strategy documents |
| `/vision-review` | When evaluating product vision quality |
| `/okr-coach` | When drafting or revising OKRs |
| `/team-structure` | When considering org design changes |
| `/design-brief` | When starting design work on a feature |
| `/figma-prompt` | When creating Figma prototypes |
| `/meeting-notes` | During 1:1 meetings |

## Automation

Use `/discovery-workflow [initiative-name]` to have the system automatically detect your current stage and guide you to the next step. The workflow is entirely file-system based; no database needed.
