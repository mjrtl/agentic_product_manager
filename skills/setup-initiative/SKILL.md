---
name: Setup Initiative
description: >
  Entry point for all new initiatives. CPO interrogation, Opportunity Discovery
  Document generation, scoping decision, and folder scaffolding.
argument-hint: ""
---

# Setup initiative

The starting point for every new initiative. An agent acting as a Chief Product Officer interrogates the user about their initiative idea, produces an Opportunity Discovery Document (ODD), determines whether scoping work is needed, scaffolds the initiative folder, and sets up a discovery plan.

## When to use

- When a user has a new initiative idea — even a vague one
- When starting any new product initiative
- Before any discovery, definition, or delivery work begins

## Process

### Continuation detection

On entry, check for an existing ODD.

- **Preferred (numbered layout):** `0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md`
- **Legacy layout (supported):** `discovery/opportunity-discovery-doc.md`

- **No ODD** → start from Phase 1, step 1.
- **ODD exists** → read metadata:
  - `Phase completed: 0` → resume at Phase 1 (interrogation). Use existing ODD
    content as context; skip questions already answered.
  - `Phase completed: 1` → resume at Phase 2 (scoping decision).
  - `Phase completed: 2` → resume at Phase 3 (scaffold).
  - `Phase completed: 3` → resume at Phase 4 (discovery plan).
  - `Sections reviewed` → during section review, skip accepted sections.
  - `Gate verdict: proceed` → skip to Phase 3.

### State updates

After each phase, update the ODD metadata:
- After Phase 1 complete → `Phase completed: 1`, list accepted sections, set gate verdict
- After Phase 2 complete → `Phase completed: 2`, `Gate verdict: proceed`
- After Phase 3 complete → `Phase completed: 3`
- After Phase 4 complete → `Phase completed: 4`, `Status: Complete`

### Phase 1 — CPO interrogation and ODD generation

1. **Adopt the CPO persona.** Load `agents/pm-cpo.md` for the persona, traits, and questioning principles. Load `references/cpo-interrogation.md` for the structured questioning flow.
2. **Walk through the structured questioning flow** (5 phases, ~10-12 questions total):
   - Opportunity and problem
   - Current state and evidence
   - Desired outcome and strategy
   - Behavioural definition
   - Assumptions and risk
3. Follow the guardrails in the agent file and reference: probe deeper, redirect feature-talk to outcome-talk, summarise as you go.
4. **Generate a complete ODD** using the template at `templates/opportunity-discovery-doc.md`. Populate every section from the conversation. Where information is missing, note the gap explicitly.
5. **Present the ODD to the user** for review and correction.
6. **Section-by-section review.** Walk through each ODD section with the user.
   For each section, present the content and offer:
   - **[E] Explore deeper** — run a facilitation technique from `/scope-problem`
     on this section (Multiple-Cause Analysis, Boundary Examination, Boot-Lace
     Analysis, or Multiple-Questioning). Invoke inline, update the section with
     refined content, then continue.
   - **[R] Revise** — user edits the section directly.
   - **[OK] Accept** — move to next section.

   Sections to review in order:
   1. Opportunity statement
   2. Target users
   3. Current state
   4. Desired outcome
   5. Strategic alignment
   6. Product behaviours (hypothesis)
   7. Key assumptions
   8. Evidence and knowledge gaps
   9. Initial opportunity sizing

   Once all sections are accepted, proceed to the gate check.

7. **Run the gate check.** Complete the gate check table in the ODD. For each
   criterion, assess whether the conversation produced enough information. Set
   verdict to PROCEED or REFINE. If REFINE, identify which sections need work.

### Phase 2 — Scoping decision

8. **Scoping decision.** If the gate verdict is REFINE, or the user indicates
   scope is unclear, ask: "Do you need help scoping this, or are you happy the
   scope is known?"
   - **Scoping needed** → invoke `/scope-problem` inline. Run the facilitation
     technique (Multiple-Cause Analysis by default). Update the ODD with refined
     content, re-run the gate check, and resume at phase 3.
   - **Scope is known** → proceed to phase 3.

### Phase 3 — Finalise ODD and scaffold

9. **Extract initiative details from the conversation** — initiative name (kebab-case), owner, goal. Do not re-ask for information already provided.
10. **Run the setup script** to create the folder structure:

```bash
./scripts/setup-initiative.sh <initiative-name> "<Owner Name>" "<Goal description>"
```

11. **Write the finalised ODD** to `initiatives/[initiative-name]/0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md` (legacy: `initiatives/[initiative-name]/discovery/opportunity-discovery-doc.md`).
12. **Write a stage map** to `initiatives/[initiative-name]/00-stage-map.md` and seed exec summary placeholders:
    - `0-intake-and-scoping/0.3-exec-summary.md`
    - `1-discovery/00-exec-summary.md`
    - `2-definition/00-exec-summary.md`
    - `3-delivery/00-exec-summary.md`

### Phase 4 — Stage gate: discovery plan

12. **Summarise what discovery will involve** based on what the ODD revealed:
    - **Who to interview** — which user segments, stakeholders, or internal teams (from ODD target users)
    - **Core JTBD to validate** — job-to-be-done statements to test (from ODD product behaviours)
    - **Key assumptions to test** — from the ODD assumptions table
    - **Evidence to gather** — data, user signals, or research needed to fill knowledge gaps
    - **Recommended discovery skill sequence:**
      1. `/interview-snapshot` — conduct and capture user interviews
      2. `/synthesize-interviews` — find patterns across interviews
      3. `/create-opportunities` — extract and prioritise opportunities (OST)
      4. `/generate-solutions` — explore solution space
      5. `/test-assumptions` — validate riskiest assumptions
13. **Update the discovery context** with this discovery plan:
    - Preferred: `1-discovery/1.1-discovery-context-and-plan/discovery_context.md`
    - Legacy: `discovery/discovery_context.md`
14. User proceeds into discovery via `/discovery-workflow`.

## Folder structure created

```
initiatives/[initiative-name]/
├── README.md
├── 00-stage-map.md                     Numbered navigation (what happens next)
├── 0-intake-and-scoping/               (0. Intake and scoping)
│   ├── 0.1-odd/opportunity-discovery-doc.md
│   ├── 0.2-scoping-artifacts/
│   └── 0.3-exec-summary.md
├── 1-discovery/                        (1. Discovery)
│   ├── 00-exec-summary.md
│   ├── 1.1-discovery-context-and-plan/discovery_context.md
│   ├── 1.2-user-interviews/            (snapshots/, synthesis/, transcripts/)
│   ├── 1.3-opportunities/
│   ├── 1.4-solutions/
│   ├── 1.5-assumptions-and-tests/
│   └── 1.6-evidence/
├── 2-definition/                       (2. Definition)
│   ├── 00-exec-summary.md
│   ├── 2.1-prd/                         (PRDs, 1-pagers, PR-FAQs)
│   ├── 2.2-design/
│   ├── 2.3-user-story-map/              (required for DoR; summary or link to Notion/Miro)
│   └── 2.4-metrics/                     (optional; metric definitions, infra, baseline)
└── 3-delivery/                         (3. Delivery)
    ├── 00-exec-summary.md
    ├── 3.1-tasks/
    ├── 3.2-qa/
    ├── 3.3-delivery-metrics/
    ├── 3.4-product-analytics/
    └── 3.5-launch/
```

## Integration points

After creation, the user can use these skills in the initiative:

| Skill | Location | Phase |
|-------|----------|-------|
| `/scope-problem` | Updates `0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md` | 0. Scoping |
| `/interview-snapshot` | `1-discovery/1.2-user-interviews/snapshots/` | 1. Discovery |
| `/synthesize-interviews` | `1-discovery/1.2-user-interviews/synthesis/` | 1. Discovery |
| `/create-opportunities` | `1-discovery/1.3-opportunities/` | 1. Discovery |
| `/generate-solutions` | `1-discovery/1.4-solutions/` | 1. Discovery |
| `/test-assumptions` | `1-discovery/1.5-assumptions-and-tests/` | 1. Discovery |
| `/pr-faq` | `2-definition/2.1-prd/` | 2. Definition |
| `/prd` | `2-definition/2.1-prd/` | 2. Definition |
| `/design-brief` | `2-definition/2.2-design/` | 2. Definition |
| `/figma-prompt` | `2-definition/2.2-design/` | 2. Definition |
| `/check-dor` | Reads ODD, 2.3, exec summary; verifies DoR before delivery | 2. Definition |
| *(metrics)* | `2-definition/2.4-metrics/` (optional; definitions, infra, baseline) | 2. Definition |
| `/generate-tasks` | `3-delivery/3.1-tasks/` | 3. Delivery |
| `/process-tasks` | `3-delivery/3.1-tasks/` | 3. Delivery |
| `/delivery-metrics` | `3-delivery/3.2-qa/`, `3-delivery/3.3-delivery-metrics/`, `3-delivery/3.4-product-analytics/` | 3. Delivery |

For the CPO persona, see `agents/pm-cpo.md`. For the questioning flow and ODD generation process, see `references/cpo-interrogation.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
