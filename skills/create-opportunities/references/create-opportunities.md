# Create Opportunities - Reference

## Goal

Extract opportunities from interview snapshots and synthesis results based on customer **needs, pain points, and desires**, organize, review, and prioritize them according to the **Opportunity Solution Tree** structure, and propose target opportunities for exploration.

## When to Use

- After completing interview snapshots
- After synthesizing multiple snapshots
- When you need to identify and prioritize customer problems worth solving
- Before generating solutions

## Input

- **Primary Source**: Interview snapshots from `user-interviews/snapshots/`
- **Secondary Source**: Synthesis documents from `user-interviews/synthesis/`
- **Context Source**: Strategic materials from `company-level-context/`
- **Minimum Requirements**: At least 3-5 interview snapshots or 1 synthesis document

## Output

**Format:** Markdown (`.md`)
**Location:** `opportunities/[topic]/`
**Filename:** `opportunities-[topic]-v[version].md`

Version management: Check existing files, auto-increment version, never overwrite.

## Opportunity Extraction Guidelines

- Focus on customer **needs, pain points, desires** (Teresa Torres' Opportunity Solution Tree)
- Use **problem-focused statement** format: "I want to ~ but ~ makes it difficult"
- Avoid solution language; reconstruct feature suggestions as **underlying needs**
- Identify root causes, not surface-level complaints
- Preserve customer language and exact quotes
- Link each opportunity to specific evidence

### Correct Opportunity Statement Format

- **Need-based**: "I want [desired outcome] but [barrier/problem] makes it difficult"
- **Pain point-based**: "I feel frustrated in [situation] because of [specific problem]"
- **Desire-based**: "I wish I could [desired experience] but [current constraint] makes it impossible"

### Incorrect (Avoid These)

- Feature suggestions: "Highlight/VOD instant recommendation feature"
- Solution requests: "We need chapter functionality"
- Technical solutions: "Automatic handoff functionality"

### Correct Examples

- "I can't find content worth watching"
- "I've run out of episodes of my favorite show"
- "I don't know how to search for specific programs"

## Process

### 0) File Management (MANDATORY)

1. Extract topic from interview data or synthesis
2. Check existing files with pattern `opportunities-[topic]-v*.md`
3. Auto-increment version number
4. Never overwrite existing files

### 0.5) Context Source Analysis (MANDATORY)

1. Scan strategic materials in `company-level-context/`
2. Extract key strategic elements: vision, goals, priorities, constraints
3. Set opportunity evaluation criteria based on strategic context

### 1. Extract Opportunities

1. Extract customer stories, needs, pain points, and desires from snapshots and synthesis
2. Organize as Opportunities using problem-focused statements
3. Link evidence to each opportunity
4. Exclude feature suggestions; focus on actual customer problems

### 2. Map Opportunities

1. Place in Opportunity Solution Tree structure (Outcome -> Parent -> Child -> Leaf)
2. Use parent-child and sibling relationships
3. Verify alignment with customer experience map
4. Merge duplicates and reframe disguised solutions

### 3. User Review #1

Present opportunity candidate table: `ID | Parent | Opportunity Statement | EvidenceCount | Quotes`

Ask: "Are there any opportunities to merge/split/delete?" and "Would you like to modify names?"

**PAUSE** and incorporate feedback.

### 4. Assess Opportunities

Evaluate by comparing sibling sets through four lenses:
1. **Opportunity Sizing**: How many customers and how frequently?
2. **Market Factors**: Competitive importance (table stakes vs differentiator)?
3. **Company Factors**: Strategic alignment, resource availability?
4. **Customer Factors**: How important to customers? Satisfaction with alternatives?

Do not use scoring. Record subjective and data-driven discussions after comparison.

### 5. User Review #2

Provide priority comparison summary table. Ask for confirmation or adjustments.

**PAUSE** and incorporate feedback.

### 6. Propose Target Opportunity

Mark one leaf node as Target Opportunity (Proposal). This is a reversible candidate for exploration, not a final decision.

## Output Structure

```markdown
# Opportunities -- [Topic Name]

**Topic:** [Extracted topic name]
**Version:** [v1, v2, v3...]
**Source Documents:** [List of snapshots/synthesis used]
**Context Sources:** [Company-level-context files referenced]
**Total Opportunities Identified:** [Number]

---

## Opportunity Solution Tree (Snapshot)
- Outcome: [Desired Outcome]
  - Parent Opportunity A
    - Child 1
    - Child 2 (Proposed Target Opportunity)

---

## Candidate Opportunities (Pre-Review)
| ID | Parent | Opportunity Statement | Evidence Count | Supporting Quotes | Notes |
|----|--------|----------------------|----------------|-------------------|-------|

---

## Assessment (Sibling Comparisons)
### [Sibling Set A]
- Candidates, Factors Considered, Discussion, Tentative Winner

---

## Proposed Target Opportunity
**[ID] -- [Opportunity Statement]**
Why, Supporting Evidence, Next Steps
```

## Guardrails

- Opportunities must be in **customer language** (no internal company language)
- Feature suggestions are not Opportunities; reconstruct as underlying needs
- Emotions alone are not Opportunities; reconstruct as underlying opportunity
- Must use problem-focused statement format
- All decisions are hypothetical and reversible

## Related Frameworks

- Create Interview Snapshots (`references/create-interview-snapshots.md`)
- Synthesize Interview Snapshots (`references/synthesize-interview-snapshots.md`)
- Generate Solutions (`references/generate-solutions.md`)
