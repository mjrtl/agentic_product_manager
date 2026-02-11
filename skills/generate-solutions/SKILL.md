---
name: Generate Solutions
description: >
  Generate multiple solutions for identified opportunities through structured
  AI-human collaborative ideation, then evaluate and select the top 3.
argument-hint: "[opportunity-name-or-path]"
---

# Generate Solutions

Generate multiple potential solutions through structured AI-human collaborative ideation.

## When to use

- After identifying a clear target opportunity
- Before committing to a single solution approach

## Input

- Prioritized opportunities with supporting evidence
- Direct opportunity input from user

## Output

- **Format:** Markdown (`.md`)
- **Location:** `solutions/[topic]/`
- **Filename:** `solutions-[topic]-v[version].md`

## Critical rule

**MANDATORY: The user must generate at least 3 individual ideas before the agent generates any solutions.** If the user requests solutions without individual ideation, stop and explain the requirement.

## Process

1. Review target opportunity
2. **Individual ideation (human)** - MANDATORY: User generates at least 3 ideas
3. AI-human collaborative ideation
4. Repeat and expand (target 15-20 ideas)
5. Evaluate and select top 3

For the full process, solution template, and anti-patterns, see `references/generate-solutions.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
