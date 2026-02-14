# Create PRD - Reference

## Goal

Create a detailed Product Requirements Document (PRD) in Markdown format based on an initial user prompt. The PRD should be clear, actionable, and suitable for a junior developer to understand and implement the feature.

## Process

1. **Receive Initial Prompt:** The user provides a brief description or request for a new feature or functionality.
2. **Ask Clarifying Questions:** Before writing the PRD, ask only the most essential 3-5 clarifying questions needed to write a clear PRD. The goal is to understand the "what" and "why" of the feature, not necessarily the "how". Provide options in letter/number lists so the user can respond easily with their selections.
3. **Generate PRD:** Based on the initial prompt and the user's answers, generate a PRD using the structure below.
4. **Save PRD:** Save the generated document as `prd-[feature-name].md` inside `2-definition/2.1-prd/` (legacy: `definition/prd/`).

## Clarifying Questions (Guidelines)

Ask only the most critical questions needed. Focus on areas where the initial prompt is ambiguous or missing essential context:

* **Problem/Goal:** If unclear, "What problem does this feature solve for the user?"
* **Core Functionality:** If vague, "What are the key actions a user should be able to perform?"
* **Scope/Boundaries:** If broad, "Are there any specific things this feature *should not* do?"
* **Success Criteria:** If unstated, "How will we know when this feature is successfully implemented?"

Only ask questions when the answer isn't reasonably inferable from the initial prompt.

### Formatting Requirements

- Number all questions (1, 2, 3, etc.)
- List options for each question as A, B, C, D for easy reference
- Make it simple for the user to respond with selections like "1A, 2C, 3B"

### Example Format

```
1. What is the primary goal of this feature?
   A. Improve user onboarding experience
   B. Increase user retention
   C. Reduce support burden
   D. Generate additional revenue

2. Who is the target user for this feature?
   A. New users only
   B. Existing users only
   C. All users
   D. Admin users only
```

## PRD Structure

1. **Introduction/Overview:** Briefly describe the feature and the problem it solves. State the goal.
2. **Goals:** List the specific, measurable objectives for this feature.
3. **User Stories:** Detail the user narratives describing feature usage and benefits.
4. **Functional Requirements:** List the specific functionalities the feature must have. Use clear, concise language. Number these requirements.
5. **Non-Goals (Out of Scope):** Clearly state what this feature will *not* include.
6. **Design Considerations (Optional):** Link to mockups, describe UI/UX requirements.
7. **Technical Considerations (Optional):** Mention known technical constraints, dependencies, or suggestions.
8. **Success Metrics:** How will the success of this feature be measured?
9. **Open Questions:** List any remaining questions or areas needing further clarification.

## Target Audience

Assume the primary reader of the PRD is a **junior developer**. Requirements should be explicit, unambiguous, and avoid jargon where possible.

## Output

* **Format:** Markdown (`.md`)
* **Location (preferred):** `2-definition/2.1-prd/`  
* **Location (legacy):** `definition/prd/`
* **Filename:** `prd-[feature-name].md`

## Final instructions

1. Do NOT start implementing the PRD
2. Always ask the user clarifying questions first
3. Take the user's answers to the clarifying questions and improve the PRD
