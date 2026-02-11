---
name: PRD
description: >
  Create a detailed Product Requirements Document in Markdown, suitable for
  a junior developer to understand and build from.
argument-hint: "[feature-name-or-description]"
---

# Create PRD

Create a detailed Product Requirements Document (PRD) in Markdown format.

## When to use

- When starting a new feature or initiative
- When you need to document requirements for development
- Before task generation

## Process

1. **Receive initial prompt**: Brief description of the feature
2. **Ask clarifying questions**: 3-5 essential questions with lettered options (A, B, C, D)
3. **Generate PRD**: Based on prompt and answers
4. **Save PRD**: As `prd-[feature-name].md` in the `definition/prd/` directory

## PRD sections

1. Introduction/Overview
2. Goals
3. User Stories
4. Functional Requirements (numbered)
5. Non-Goals (Out of Scope)
6. Design Considerations (optional)
7. Technical Considerations (optional)
8. Success Metrics
9. Open Questions

## Rules

- Do NOT start implementing the PRD
- Always ask clarifying questions first
- Take the user's answers and improve the PRD
- Target audience: junior developer (explicit, unambiguous requirements)

For the full process, question guidelines, and structure details, see `references/create-prd.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
