---
name: Synthesize Interviews
description: >
  Analyze multiple interview snapshots to identify patterns and create
  comprehensive synthesis with integrated experience maps.
argument-hint: "[initiative-name]"
---

# Synthesize Interview Snapshots

Analyze multiple interview snapshots to identify common patterns, integrate experience maps, and create comprehensive insights.

## When to use

- After completing 3-5+ interviews on the same topic
- Before creating opportunities or generating solutions
- When sharing research findings with stakeholders

## Input

- Minimum 3-5 interview snapshots (from `1-discovery/1.2-user-interviews/snapshots/`; legacy: `discovery/user-interviews/snapshots/`)
- All snapshots should follow consistent format and cover similar topics

## Output

- **Format:** Markdown (`.md`)
- **Location:** `1-discovery/1.2-user-interviews/synthesis/` (legacy: `discovery/user-interviews/synthesis/`)
- **Filename:** `synthesis-[initiative-name]-v[version].md`

## Key features

- **Incremental synthesis**: Process only new snapshots when updating existing synthesis
- **Version management**: Auto-increment version numbers, never overwrite
- **Pattern recognition**: Behavioral patterns, emotional journeys, workarounds

## Process

1. Gather all relevant interview snapshots
2. Check for existing synthesis files
3. Identify new vs. previously processed snapshots
4. Extract common patterns (recurring themes, behaviors, pain points)
5. Integrate experience maps across participants
6. Develop insights and identify research gaps
7. Create synthesis document with version management

For the full framework and synthesis template, see `references/synthesize-interview-snapshots.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
