---
name: Process Tasks
description: >
  Work through a task list one sub-task at a time with completion tracking,
  test-before-commit protocol, and conventional commit messages.
argument-hint: "[task-list-path]"
---

# Process Task List

Manage and work through task lists with completion tracking and commit protocols.

## When to use

- After generating a task list
- When working through implementation tasks systematically
- When you need structured task-by-task execution

## Task implementation rules

- **One sub-task at a time**: Do NOT start the next sub-task until the user says "yes" or "y"
- **Completion protocol**:
  1. Finish sub-task, mark as completed (`[x]`)
  2. If all subtasks under a parent are `[x]`:
     - Run the full test suite
     - Only if tests pass: stage changes
     - Clean up temporary files and code
     - Commit with conventional commit format (`feat:`, `fix:`, `refactor:`, etc.)
  3. Mark parent task as completed
- Stop after each sub-task and wait for user's go-ahead

## Task list maintenance

1. Mark tasks and subtasks as completed per protocol
2. Add new tasks as they emerge
3. Keep "Relevant Files" section accurate and up to date

For the full implementation protocol and maintenance rules, see `references/process-task-list.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
