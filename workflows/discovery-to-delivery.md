# Discovery to delivery workflow

This document describes the full Continuous Discovery Habits (CDH) pipeline from user research through implementation.

## Overview

The discovery-to-delivery workflow transforms raw user research into validated, implemented product features. It follows the CDH methodology by Teresa Torres, enhanced with structured document outputs at each stage.

## Pipeline

```
Setup -> Interviews -> Snapshots -> Synthesis -> Opportunities -> Solutions -> Assumptions -> PRD -> Tasks -> Delivery
```

## Stages

### 1. Setup initiative

**Skill:** `/setup-initiative`
**Output:** `initiatives/[name]/` folder structure

Create the standardized folder structure for a new initiative. This establishes the workspace where all subsequent artifacts will be stored.

**Entry criteria:** Initiative name, owner, and goal defined
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

Extract opportunities from research using the Opportunity Solution Tree framework.

**Entry criteria:** Interview snapshots or synthesis documents
**Exit criteria:** Prioritized opportunity list with proposed target opportunity

**Key principles:**
- Problem-focused statements: "I want to ~ but ~ makes it difficult"
- No feature suggestions or solution language
- Two user review checkpoints (after extraction, after assessment)
- Compare siblings through 4 lenses (sizing, market, company, customer)

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

### 7. Create PRD

**Skill:** `/prd` or `/one-pager`
**Output:** `prd/prd-[feature].md` or `prd/1-pager-[initiative].md`

Create a Product Requirements Document or decision-focused 1-Pager.

**Entry criteria:** Validated opportunity, tested assumptions, selected solution
**Exit criteria:** Approved PRD with clear requirements

**Key principles:**
- Always ask clarifying questions first
- Target audience: junior developer
- Include success metrics and open questions

### 8. Generate and process tasks

**Skills:** `/generate-tasks` then `/process-tasks`
**Output:** `tasks/tasks-[feature].md`

Break the PRD into implementation tasks, then work through them systematically.

**Entry criteria:** Approved PRD
**Exit criteria:** All tasks completed with conventional commits

**Key principles:**
- Generate parent tasks first, get approval, then sub-tasks
- One sub-task at a time
- Test-before-commit protocol
- Conventional commit format

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
