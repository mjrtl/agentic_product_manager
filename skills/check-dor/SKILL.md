---
name: Check Definition of Ready
description: >
  Verify that an initiative meets Definition of Ready (DoR) before handoff to delivery.
  Reads ODD, 2.3 user story map, and definition exec summary; reports pass/fail and missing criteria.
argument-hint: "<initiative-name>"
---

# Check Definition of Ready (DoR)

Verify that an initiative satisfies the minimum bar for Definition of Ready. **Read-only**; no file writes.

## When to use

- Before running `/generate-tasks` (DoR must be met first).
- When the discovery-workflow would advance to "Generate tasks".
- After updating the ODD, 2.3 folder, or definition exec summary.

## Input

- **Initiative name** (required): kebab-case, e.g. `mobile-app-redesign`.
- Initiative root is `initiatives/` in the current or parent directory (same as other skills).

## Process

1. **Resolve initiative path**: `initiatives/<name>/` (from cwd or parent).
2. **Support both layouts**: Numbered (`0-intake-and-scoping/`, `2-definition/2.3-user-story-map/`) and legacy (`discovery/`, `definition/`). For legacy, check `definition/` for exec summary; treat "user story map" as any substantive content in definition or a linked doc.
3. **Read artefacts**:
   - ODD: `0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md` or `discovery/opportunity-discovery-doc.md`.
   - User Story Map / Epics: `2-definition/2.3-user-story-map/` (any file other than README or .gitkeep) or a clear link in README to Notion/Miro.
   - Definition exec summary: `2-definition/00-exec-summary.md` or `definition/00-exec-summary.md`.
4. **Apply checklist** (see [definition_of_ready.md](../../references/keyrock_product_process/definition_of_ready.md) and [definition_of_ready_check.md](references/definition_of_ready_check.md)):
   - ODD exists and is updated (not empty placeholder).
   - At least 2–3 behaviour-led user stories with acceptance criteria (in ODD "User stories (definition)" section or in 2.3).
   - 2.3 has content (summary, epic list, or link to Notion/Miro).
   - Definition exec summary exists and has scope/decision/success criteria (not empty).
5. **Output**: Report **Pass** or **Fail**; list which criteria are satisfied and which are missing; if fail, suggest concrete next steps and "Re-run `/check-dor <name>` after updates."

## Output format

- **Pass**: "Definition of Ready: **Pass**. All criteria met. You can run `/generate-tasks`."
- **Fail**: "Definition of Ready: **Fail**." Then a table or list: criterion | status (OK / Missing). Then "Next steps: …" and "Re-run `/check-dor <name>` after updates."

## Backward compatibility

- Initiatives with only legacy layout (`discovery/`, `definition/`, `delivery/`) are supported: ODD in discovery, exec summary in definition; "2.3" equivalent is optional content in definition (e.g. a `user-story-map.md` or link).
- Initiatives with older 2.3-metrics (no 2.3-user-story-map) should be treated as missing 2.3 for DoR until the folder is added or content is present.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
