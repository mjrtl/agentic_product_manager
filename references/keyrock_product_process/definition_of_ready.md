# Definition of Ready (DoR)

Work must not move to **Delivery** (e.g. generate tasks, build) until Definition of Ready is met. This keeps initiatives aligned with Keyrock’s product process and ensures build-ready specifications.

## Minimum bar (checklist)

All of the following must be true before handoff to delivery:

1. **ODD as root document**
   - Initiative has an Opportunity Discovery Document at `0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md` (or legacy `discovery/opportunity-discovery-doc.md`).
   - ODD has been updated through discovery and definition. Keyrock is moving to ODDs as the primary definition artefact (not PR-FAQ).

2. **User stories with acceptance criteria**
   - At least 2–3 behaviour-led user stories, either in the ODD (e.g. “User stories (definition)” section) or in `2-definition/2.3-user-story-map/`.
   - Format: *To [outcome], a user needs [state change/effect]* or *As a [role], I want [action], So that [benefit]*.
   - Each story has acceptance criteria (Given/When/Then or equivalent testable scenarios).

3. **User Story Map or Epic list**
   - `2-definition/2.3-user-story-map/` contains either a USM summary or epic list in the repo, or a clear link to Notion/Miro where the USM lives.

4. **Definition exec summary**
   - `2-definition/00-exec-summary.md` (or legacy `definition/00-exec-summary.md`) is updated with scope, decision, and success criteria.

## How to check

Run the DoR check skill:

```
/check-dor <initiative-name>
```

It reads the ODD, 2.3 folder, and definition exec summary and reports pass/fail and any missing criteria.

## Notion alignment

- **AI & Automation Work** (and similar product DBs) should treat **Definition** as a distinct gate: work should not move to **Delivery** until DoR is met.
- Suggested implementation in Notion (apply manually; no automated writes from this repo):
  - A **Status** value such as “Definition” between “Discovery” and “Planned”/“Delivery”, and/or
  - A **Definition complete** (checkbox) or **Definition date** property; use views/filters so “Delivery” only when Definition complete.

This keeps the repo DoR checklist and the Notion DB in sync conceptually.
