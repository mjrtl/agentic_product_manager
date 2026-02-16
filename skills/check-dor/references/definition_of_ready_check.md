# Definition of Ready — check logic

This document defines the exact checks used by the `/check-dor` skill so they stay aligned with [references/keyrock_product_process/definition_of_ready.md](../../../references/keyrock_product_process/definition_of_ready.md).

## Paths (numbered layout)

- ODD: `0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md`
- User Story Map: `2-definition/2.3-user-story-map/` (content = any file other than README.md or .gitkeep; or README contains a clear link to Notion/Miro)
- Definition exec summary: `2-definition/00-exec-summary.md`

## Paths (legacy layout)

- ODD: `discovery/opportunity-discovery-doc.md`
- Definition exec summary: `definition/00-exec-summary.md`
- User Story Map: optional file in `definition/` (e.g. `user-story-map.md`) or link in a README; if missing, criterion "2.3 has content" fails unless ODD contains user stories.

## Checklist (minimum bar)

| # | Criterion | How to check |
|---|-----------|--------------|
| 1 | ODD exists and is updated | File exists; key sections (Opportunity statement, Target users, Product behaviours or User stories) are not empty placeholders. |
| 2 | At least 2–3 user stories with AC | In ODD "User stories (definition)" section and/or in 2.3 folder. Each story: behaviour-led (To/As a… I want… So that) and has Given/When/Then or equivalent. |
| 3 | 2.3 has content or link | Numbered: 2.3 folder has at least one file beyond README/.gitkeep, or README clearly links to Notion/Miro. Legacy: definition has USM file or link. |
| 4 | Definition exec summary updated | File exists; contains scope, decision, and/or success criteria (non-empty). |

**Pass:** All four criteria satisfied.  
**Fail:** One or more criteria missing; report which and suggest next steps.
