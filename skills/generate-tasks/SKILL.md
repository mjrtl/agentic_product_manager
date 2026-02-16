---
name: Generate Tasks
description: >
  Create a detailed, step-by-step task list from requirements or a PRD.
  Generates parent tasks first for review, then breaks down into sub-tasks.
argument-hint: "[prd-path-or-requirements]"
---

# Generate Tasks

Create a detailed task list in Markdown format from user requirements or a PRD.

## When to use

- After Definition of Ready is met (run `/check-dor <initiative-name>` if unsure; do not generate tasks if DoR fails)
- After a PRD (or ODD with user stories) is approved
- When you have feature requirements ready for implementation
- Before starting development work

## Output

- **Format:** Markdown (`.md`)
- **Location:** `3-delivery/3.1-tasks/` (legacy: `delivery/tasks/`)
- **Filename:** `tasks-[feature-name].md`

## Process

1. **Receive requirements**: Feature request, task description, or existing documentation
2. **Analyze requirements**: Functional requirements, user needs, implementation scope
3. **Phase 1 - Generate parent tasks**: Create high-level tasks (always include task 0.0 "Create feature branch"). Present to user and wait for "Go"
4. **Wait for confirmation**: Pause for user approval
5. **Phase 2 - Generate sub-tasks**: Break down each parent task into actionable sub-tasks
6. **Identify relevant files**: List files that will need to be created or modified
7. **Generate final output**: Combine into final Markdown structure
8. **Save task list**: Save to `3-delivery/3.1-tasks/` (legacy: `delivery/tasks/`)

## Target audience

Assume the primary reader is a **junior developer**. Requirements should be explicit and unambiguous.

For the full output format and interaction model, see `references/generate-tasks.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
