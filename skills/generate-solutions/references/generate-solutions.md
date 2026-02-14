# Generate Solutions - Reference

## Goal

Generate multiple potential solutions for identified opportunities using the Continuous Discovery Habits framework, then systematically evaluate and select the most promising approaches through structured AI-human collaboration.

## When to Use

- After identifying clear opportunities
- When you have a well-defined target opportunity to solve
- Before committing to a single solution approach
- When you need to explore different solution directions

## Input

### Primary Input Sources (Choose One)
- **Option A**: Prioritized opportunities from `1-discovery/1.3-opportunities/` directory (legacy: `discovery/opportunities/`)
- **Option B**: Direct opportunity input from user
- **Option C**: Mixed approach (file-based + direct input)

### Requirements
- At least 1 target opportunity with supporting evidence
- Ideal: 3-5 opportunities for comparison

## Output

**Format:** Markdown (`.md`)
**Location (preferred):** `1-discovery/1.4-solutions/[topic]/`  
**Location (legacy):** `discovery/solutions/[topic]/`
**Filename:** `solutions-[topic]-v[version].md`

Version management: Check existing files, auto-increment version, never overwrite.

## MANDATORY PROCESS ENFORCEMENT

**CRITICAL: The agent MUST NOT SKIP STEP 2 (Individual Ideation)**

If the user requests solutions without completing Step 2:
- STOP immediately
- Explain: "Please generate at least 3 individual ideas first (recommended: 10-15 ideas)"
- Wait for the user's ideas before proceeding
- Do NOT generate solutions until Step 2 is completed

## Process

### 0) File Management (MANDATORY)

1. Extract topic from opportunity document
2. Check existing files with pattern `solutions-[topic]-v*.md`
3. Auto-increment version number
4. Never overwrite existing files

### 1. Review Your Target Opportunity

1. Ensure both AI and human understand the opportunity and context
2. Confirm this is an appropriately sized leaf-node opportunity
3. Review supporting evidence and user research
4. Define what success looks like

### 2. Individual Ideation (Human) - MANDATORY

1. Solo brainstorming: human generates initial ideas individually
2. Overcome blocks: take a break and try again if stuck
3. Seek inspiration from competitors or similar products
4. Think broadly across industries
5. Aim for maximum quantity without judgment
6. **Target**: Minimum 3 ideas, recommended 10-15

**The agent MUST WAIT for human ideas before proceeding.**

### 3. AI-Human Collaborative Ideation

1. Human presents their ideas
2. AI builds on human ideas and generates variations
3. AI suggests different approaches and categories
4. AI asks probing questions to explore new angles
5. Multiple rounds of collaborative ideation

### 4. Repeat and Expand

1. Continue individual and collaborative ideation
2. Cross-pollinate ideas
3. Target 15-20 total ideas
4. Embrace diversity over quantity of similar ideas

### 5. Evaluate and Select

1. Initial filter: "Does this idea address the target opportunity?"
2. Remove irrelevant ideas
3. Collaborative evaluation
4. Select top 3 through discussion
5. Document rationale

## Solution Template

```markdown
# Solutions for [Opportunity Name]

**Topic:** [Extracted topic name]
**Version:** [v1, v2, v3...]
**Target Opportunity:** [Opportunity statement]
**Source Documents:** [List of documents used]
**Total Ideas Generated:** [Number] (Target: 15-20)
**Final Solutions Selected:** 3

---

## Problem Definition
### Target Opportunity Statement
[Clear problem statement]

### Opportunity Context
- **Who:** [User segments affected]
- **When:** [Context and timing]
- **Current Solutions:** [What exists now and why it fails]
- **Impact:** [How this affects users and business]

### Success Criteria
- [Measurable outcome 1]
- [Measurable outcome 2]

---

## Ideation Process
### Individual Ideation Sessions
[Human sessions documented]

### AI-Human Collaborative Sessions
[Collaborative sessions documented]

---

## Selected Solutions

### Solution 1: [Solution Name]
**Type:** [Feature/Process/Interface/Business Model]
**Description:** [Detailed explanation]
**Key Features:** [List]
**User Experience:** [How users interact]
**Why Selected:** [Rationale]
**Implementation Considerations:** [Feasibility, value, risks]

### Solution 2: [Solution Name]
[Same structure]

### Solution 3: [Solution Name]
[Same structure]

---

## Next Steps
- [ ] [Development actions]
- [ ] [Research actions]
```

## Common Antipatterns

1. **Not including diverse perspectives** - AI should challenge assumptions
2. **Too many variations of the same idea** - Seek categorically different approaches
3. **Limiting ideation to one session** - Allow ideas to incubate
4. **Selecting off-target ideas** - Maintain focus on the target opportunity

## Solution Categories

- **Feature-Based**: New features, improvements, removal of complexity
- **Process**: Workflow changes, automation, integration
- **Interface**: UI/UX improvements, accessibility, responsive design
- **Business Model**: Pricing, distribution, partnerships

## Related Frameworks

- Create Interview Snapshots (`references/create-interview-snapshots.md`)
- Synthesize Interview Snapshots (`references/synthesize-interview-snapshots.md`)
- Create Opportunities (`references/create-opportunities.md`)
