---
name: Discovery Workflow
description: >
  Full Continuous Discovery Habits pipeline orchestrator. Walks through all stages
  from initiative setup through assumptions testing, picking up where you left off.
argument-hint: "<initiative-name>"
---

# Discovery Workflow

Orchestrate the full Continuous Discovery Habits pipeline for an initiative. This meta-skill walks through all stages in order, checking your initiative folder state to pick up where you left off.

## Pipeline stages

```
1. Setup Initiative
2. Conduct Interviews -> Create Snapshots
3. Synthesize Patterns
4. Create Opportunities
5. Generate Solutions
6. Identify & Test Assumptions
7. Create PRD
8. Generate Tasks
```

## How it works

When invoked with an initiative name, this workflow:

1. **Checks initiative state**: Looks for `initiatives/[name]/` folder
   - If it doesn't exist, runs `/setup-initiative` first
2. **Scans each stage folder** to determine progress:
   - `user-interviews/snapshots/` - Any snapshot files?
   - `user-interviews/synthesis/` - Any synthesis files?
   - `opportunities/` - Any opportunity files?
   - `solutions/` - Any solution files?
   - `assumptions/` - Any assumption files?
   - `prd/` - Any PRD files?
   - `tasks/` - Any task files?
3. **Identifies the next stage** and tells you what to do next
4. **Invokes the appropriate skill** for the current stage

## Stage detection logic

| Stage | Condition to advance | Next skill |
|-------|---------------------|------------|
| 1. Setup | `initiatives/[name]/` exists | `/interview-snapshot` |
| 2. Snapshots | >= 3 snapshot files | `/synthesize-interviews` |
| 3. Synthesis | >= 1 synthesis file | `/create-opportunities` |
| 4. Opportunities | >= 1 opportunities file | `/generate-solutions` |
| 5. Solutions | >= 1 solutions file | `/test-assumptions` |
| 6. Assumptions | >= 1 assumptions file with test results | `/prd` |
| 7. PRD | >= 1 PRD file | `/generate-tasks` |
| 8. Tasks | Task list exists | `/process-tasks` |

## Usage

```
/discovery-workflow mobile-app-redesign
```

The workflow will:
- Check if `initiatives/mobile-app-redesign/` exists
- Scan all stage folders
- Report current progress
- Suggest and run the next step

## Resumability

This workflow is entirely file-system based. No database or state file needed. You can:
- Stop at any point and resume later
- Skip stages if you've done work outside this workflow
- Re-run any stage to iterate

## Progress report format

```markdown
## Discovery Progress: [Initiative Name]

| Stage | Status | Files |
|-------|--------|-------|
| Setup | Done | README.md |
| Snapshots | Done (4 files) | snapshot-*.md |
| Synthesis | Done (1 file) | synthesis-v1.md |
| Opportunities | In Progress | - |
| Solutions | Not Started | - |
| Assumptions | Not Started | - |
| PRD | Not Started | - |
| Tasks | Not Started | - |

**Next step:** Create opportunities from your synthesis.
Run `/create-opportunities [initiative-name]` to continue.
```

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
