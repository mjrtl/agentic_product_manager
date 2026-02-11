---
name: Create Opportunities
description: >
  Extract and prioritize opportunities from interview snapshots and synthesis
  using the Opportunity Solution Tree framework.
argument-hint: "[initiative-name]"
---

# Create Opportunities

Extract opportunities from research and organize them using the Opportunity Solution Tree.

## When to use

- After completing interview snapshots or synthesis
- When identifying customer problems worth solving
- Before generating solutions

## Input

- Interview snapshots from `user-interviews/snapshots/`
- Synthesis documents from `user-interviews/synthesis/`
- Strategic materials from `company-level-context/`

## Output

- **Format:** Markdown (`.md`)
- **Location:** `opportunities/[topic]/`
- **Filename:** `opportunities-[topic]-v[version].md`

## Key principles

- Focus on customer **needs, pain points, and desires** (not feature requests)
- Use problem-focused statement format: "I want to ~ but ~ makes it difficult"
- Organize using Opportunity Solution Tree structure
- Pause for user review at two checkpoints

## Process

1. **Context Analysis**: Scan strategic materials for evaluation criteria
2. **Extract Opportunities**: From snapshots and synthesis, using problem-focused statements
3. **Map Opportunities**: Place in Opportunity Solution Tree (Outcome -> Parent -> Child -> Leaf)
4. **User Review #1**: Present candidates, incorporate feedback
5. **Assess Opportunities**: Compare siblings through 4 lenses (sizing, market, company, customer)
6. **User Review #2**: Present priority comparison, incorporate feedback
7. **Propose Target**: Mark one leaf node as Target Opportunity (reversible)

## ROI assessment (optional)

After selecting a target opportunity, optionally run an ROI assessment to build a business case:

- Value sizing (revenue impact, cost savings, efficiency gains)
- Cost estimation (development person-weeks, ongoing costs)
- ROI calculation with payback period
- Confidence rating per estimate

See `references/opportunity-roi.md` for the full ROI framework and templates.
Output: `opportunities/[topic]/roi-[topic]-v[N].md`

For the full process, output structure, and guardrails, see `references/create-opportunities.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
