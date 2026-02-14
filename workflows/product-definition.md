# Product definition workflow

This workflow covers **product definition**: turning validated discovery into decisions, a customer-value narrative, and build-ready specifications.

## Where this lives

- **Initiative workspace:** `initiatives/[name]/`
- **Definition outputs:** `initiatives/[name]/2-definition/`

## Definition pipeline (pragmatic sequence)

```
PR-FAQ → PRD / 1-pager → Tasks (handoff to delivery)
```

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

**Entry criteria:** Approved PRD/1-pager  
**Exit criteria:** Task list with acceptance criteria (parents first, then sub-tasks)

## Exec checkpoint (recommended)

Maintain:

- `2-definition/00-exec-summary.md` (decision needed, scope, success criteria, risks)
- Links back to discovery artifacts (ODD, synthesis, OST, assumption tests)

