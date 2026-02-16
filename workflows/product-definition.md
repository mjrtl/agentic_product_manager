# Product definition workflow

This workflow covers **product definition**: turning validated discovery into decisions, a customer-value narrative, and build-ready specifications.

## Where this lives

- **Initiative workspace:** `initiatives/[name]/`
- **Definition outputs:** `initiatives/[name]/2-definition/`

## Definition of Ready (DoR)

Work must not move to Delivery (e.g. generate tasks) until **Definition of Ready** is met. Run `/check-dor <initiative-name>` to verify.

**Minimum bar:** ODD as root document (updated through discovery/definition); at least 2–3 behaviour-led user stories with acceptance criteria (in ODD or `2-definition/2.3-user-story-map/`); User Story Map or epic list in 2.3 (content or link to Notion/Miro); definition exec summary updated. See [references/keyrock_product_process/definition_of_ready.md](references/keyrock_product_process/definition_of_ready.md).

## Definition pipeline (pragmatic sequence)

```
ODD (evolved) → [optional: PR-FAQ / PRD] → User Story Map & Epics (2.3) → DoR check → Tasks (handoff to delivery)
```

ODD is the primary definition artefact (Keyrock is moving away from PR-FAQ); PR-FAQ/PRD are optional addenda.

## Optional: Metrics (definition gate)

**When:** Success criteria in PR-FAQ/PRD need “from → to” numbers or custom ops/product metrics.

**Location:** `2-definition/2.4-metrics/`

**Artifacts:** Metric definitions (what we measure, how we measure), metrics infra plan (APIs, exports, time tracking), and baseline capture. Definition can proceed once baseline metrics are capturable. See initiative stage map **2.4 Metrics (optional)** and `2-definition/2.4-metrics/README.md` for guidance.

**Skip when:** Standard delivery metrics (DORA, QA, adoption) are enough; use `3-delivery/3.3-delivery-metrics/` and `3-delivery/3.4-product-analytics/` only.

## Stage 1: Create PR-FAQ (root narrative)

**Skill:** `/pr-faq`  
**Output:** `2-definition/2.1-prd/pr-faq-[feature-name].md`

**Entry criteria:** Validated opportunity, tested assumptions (or explicit gaps acknowledged)  
**Exit criteria:** PR-FAQ approved with clear value proposition and internal feasibility FAQs

**Best-practice guardrails (keep it simple):**
- Write from the beneficiary’s perspective (internal user, control function, ops).
- Every major claim should trace back to discovery evidence (or be marked as an assumption).
- Keep the press release tight (one page).

## Stage 2: Create PRD or 1-pager (decision + spec)

**Skill:** `/prd` or `/one-pager`  
**Outputs:**
- `2-definition/2.1-prd/prd-[feature].md` **or**
- `2-definition/2.1-prd/1-pager-[initiative].md`

**Entry criteria:** PR-FAQ approved (preferred) or a clear validated opportunity with constraints  
**Exit criteria:** Requirements/spec approved with success metrics, open questions, and constraints

**Best-practice guardrails:**
- Write so a junior developer can implement without telepathy.
- Separate: **requirements**, **non-goals**, **open questions**, **measurement plan**.

## Stage 3: Generate tasks (handoff to delivery)

**Skill:** `/generate-tasks`  
**Output:** `3-delivery/3.1-tasks/tasks-[feature].md`

**Entry criteria:** Definition of Ready met (run `/check-dor <initiative-name>`); approved PRD/1-pager or ODD with user stories.  
**Exit criteria:** Task list with acceptance criteria (parents first, then sub-tasks)

## Exec checkpoint (recommended)

Maintain:

- `2-definition/00-exec-summary.md` (decision needed, scope, success criteria, risks)
- Links back to discovery artifacts (ODD, synthesis, OST, assumption tests)
- Definition of Ready checklist satisfied before generating tasks (see [definition_of_ready.md](references/keyrock_product_process/definition_of_ready.md))

