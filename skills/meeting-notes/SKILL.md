---
name: Meeting Notes
description: >
  Capture 1:1 meeting notes in a structured format with discussion points
  and action items. Auto-appends to per-person note files.
argument-hint: "[person-name]"
---

# Meeting Notes

Capture and organize 1:1 meeting notes following a consistent format.

## When to use

- During or after a 1:1 meeting
- When you need to document discussion points and action items

## Process

1. Save notes in a Markdown file named after the person (e.g., `JohnDoe.md`) inside a `1-1-notes/` folder
2. If the file already exists, append the new meeting notes **at the top of the file** (most recent first)
3. Use this format for each meeting:

```markdown
## [YYYY-MM-DD]
### Notes
- Key discussion points here
### Action Items
- [ ] Task 1 (assigned to me)
- [ ] Task 2 (assigned to me)
```

## Rules

- Do **not** add action items that belong to others
- Most recent meeting always goes at the top of the file
- Use the person's name as the filename (PascalCase)

## People I work with

(The user should customize this section with their team members)

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
