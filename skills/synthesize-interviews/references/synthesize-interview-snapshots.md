# Synthesize Interview Snapshots - Reference

## Overview

This framework guides you through analyzing multiple interview snapshots to identify common patterns, integrate individual experience maps, and create comprehensive insights that reveal shared user needs and opportunities.

## When to Use

- After completing multiple interviews on the same topic or user journey
- When you need to identify shared patterns across different user segments
- Before creating opportunities or generating solutions
- When sharing research findings with stakeholders
- When you have conflicting or unclear insights from individual interviews

## Output

**Format:** Markdown (`.md`)
**Location (preferred):** `1-discovery/1.2-user-interviews/synthesis/`  
**Location (legacy):** `discovery/user-interviews/synthesis/`
**Filename:** `synthesis-[initiative-name]-v[version].md`

**Semantic Naming Guidelines:**
- initiative-name: kebab-case initiative name from current initiative folder
- version: auto-incrementing version number (v1, v2, v3...)
- Example: synthesis-live-sports-vod-conversion-v1.md

**Version Management:**
- Check existing files with same initiative pattern before creating new synthesis
- Auto-increment version number (v1 -> v2 -> v3...)
- Never overwrite existing synthesis files
- Preserve all synthesis versions for comparison

## Input Validation

**Prerequisites:**
- [ ] Minimum 3-5 interview snapshots completed
- [ ] All snapshots follow consistent format and structure
- [ ] Snapshots cover similar topics or user journeys
- [ ] Quality check passed for all individual snapshots

## Instructions for Synthesis

### Incremental Synthesis Process

- **Check for Existing Synthesis**: Look for previous synthesis files in the same initiative area
- **Identify New Snapshots**: Compare current snapshots with those already processed
- **Process Only New Data**: If existing synthesis found, analyze only new snapshots and merge with existing patterns
- **Update Existing Synthesis**: Enhance previous synthesis with new insights rather than starting from scratch
- **Full Synthesis Only When**: No existing synthesis found, or significant topic shift detected

### Pattern Recognition Guidelines

- **Focus on Behavioral Patterns**: Look for concrete actions, not opinions
- **Identify Emotional Journeys**: Map frustration, delight, confusion patterns
- **Document Workarounds**: Note how users currently solve problems
- **Preserve Context**: Maintain when/where/why details from individual stories

## Framework Structure

### 1. Data Preparation

- Gather all relevant interview snapshots
- Check for existing synthesis files
- Identify which snapshots are new vs. previously processed
- Standardize format and verify quality

### 2. Pattern Analysis

- Extract common elements (recurring themes, behaviors, pain points)
- Review each snapshot's experience map
- Find overlaps where individual stories intersect
- Identify variations across different segments

### 3. Pattern Integration

- Group similar patterns and cluster related insights
- Merge individual journey stages into shared stages
- Preserve important segment-specific details
- Create shared narrative representing all users

### 4. Insight Development

- Common patterns across interviews
- Distinct user segments with different needs
- Pain point clusters by frequency
- Consistent behavior patterns

## Synthesis Template

```markdown
# What We Learned: [Research Topic] Discovery Research

**Date Range:** [Start Date] - [End Date]
**Total Participants:** [Number]
**Research Goal:** [Clear statement]
**Desired Outcome:** [Expected results]
**Synthesis Type:** [Initial/Incremental/Full Re-synthesis]
**Initiative:** [Initiative name]
**Version:** [v1, v2, v3...]
**Processed Snapshots:** [List of all snapshots included]

## Executive Summary
[3-5 key findings with immediate recommendations]

## Participant Overview
| Segment | Count | Key Characteristics |
|---------|-------|-------------------|
| [Segment Name] | [Count] | [Description] |

## Top Opportunities

### 1. [Opportunity Title]
**Frequency:** [X] out of [Y] participants
**Evidence Strength:** [Strong/Moderate/Weak]
**Impact:** [High/Medium/Low]

**Opportunity:**
[User need/pain point/desire as "I want to... but... because..."]

**Supporting Evidence:**
- **[User Name (Segment):]** "[Direct quote]" - [Context/Impact]

**Common Story Pattern:**
[Step-by-step narrative of how users experience this problem]

**Business Impact:**
[How this affects user retention, satisfaction, or growth]

## Key Insights

### 1. [Insight 1]
**What:** [Clear statement]
**Evidence:** [Supporting quotes and observations]
**Implications:** [What this means for our product]

## Integrated Experience Map

### Experience Overview
**Scope:** [Start and end points]
**Goal:** [Desired outcome users are trying to achieve]

### Shared Experience Stages

#### Stage 1: [Stage Title]
**Common Actions:** [Specific behaviors across participants]
**Shared Thoughts:** [Mental models and expectations]
**Emotional Journey:** [Frustration, delight, confusion patterns]
**Pain Points:** [Frequently mentioned challenges]
**Workarounds:** [Current problem-solving approaches]
**Segment Variations:** [How different users behave]
**Supporting Evidence:** [Quotes from multiple participants]

## Research Gaps
- [Unanswered question 1]
- [Areas needing more research]

## Next Steps
- [ ] [Next research action]
- [ ] [Product action]
```

## Efficiency Guidelines

- **1-2 New Snapshots**: Process immediately with incremental synthesis
- **3-5 New Snapshots**: Consider batch processing
- **5+ New Snapshots**: Evaluate if full re-synthesis is needed
- **Topic Shift**: Always perform full synthesis when research focus changes

## Quality Assurance Checklist

- [ ] Patterns emerge from multiple participants (not single stories)
- [ ] Integrated experience map preserves individual context
- [ ] Segment variations are clearly documented
- [ ] Evidence supports each insight and opportunity
- [ ] Research gaps are identified for future investigation
- [ ] Used initiative folder name for filename
- [ ] Version number correctly auto-incremented

## Related Frameworks

- Create Interview Snapshots (`references/create-interview-snapshots.md`)
- Create Opportunities (`references/create-opportunities.md`)
- Generate Solutions (`references/generate-solutions.md`)
