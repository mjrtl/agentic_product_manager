---
name: Design Brief
description: >
  Generate consistent design briefs with machine-readable JSON for Figma/Make
  and stakeholder-friendly Markdown summaries, integrated with your design system.
argument-hint: "[feature-name-or-initiative]"
---

# Create Design Brief

Generate consistent design briefs outputting both machine-readable JSON and stakeholder-friendly Markdown.

## When to use

- When starting design work on a feature or campaign
- When you need to align design, product, and engineering
- Before creating Figma prototypes

## Output

- **Location:** `initiatives/[initiative-name]/definition/design/`
- **Files:** `design-brief-[feature-name].json` and `design-brief-[feature-name].md`

## Process

1. **Brief intake**: Collect objectives, constraints, deadlines, and stakeholders
2. **Design system reference**: Reference tokens and components from the project's design system
3. **Library mapping**: Prioritize existing components/patterns
4. **Token first**: Define color, typography, spacing variables first
5. **Channel consistency**: Ensure Ads/Branding/Social/Prototype share the same variables
6. **Accessibility gate**: Check WCAG 2.2 AA, minimum 44px touch, RTL/multilingual support
7. **Output dual-track**: Generate JSON + Markdown simultaneously
8. **File storage**: Save to initiative design folder

For the full JSON schema, Markdown template, and generation rules, see `references/create-design-brief.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
