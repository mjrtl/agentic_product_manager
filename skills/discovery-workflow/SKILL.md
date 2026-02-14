---
name: Discovery Workflow
description: >
  Full Continuous Discovery Habits pipeline orchestrator. Walks through all stages
  from initiative setup through delivery, picking up where you left off.
argument-hint: "<initiative-name>"
---

# Discovery Workflow

Orchestrate the full product development pipeline for an initiative. This meta-skill walks through all stages in order, checking your initiative folder state to pick up where you left off.

## Pipeline stages

```
Discovery:
  1. Setup Initiative
  2. Conduct Interviews -> Create Snapshots
  3. Synthesize Patterns
  4. Create Opportunities
  5. Generate Solutions
  6. Identify & Test Assumptions

Definition:
  7. Create PR-FAQ
  8. Create PRD
  9. Generate Tasks

Delivery:
  10. Process Tasks & QA
  11. Delivery Metrics
  12. Launch
```

## How it works

When invoked with an initiative name, this workflow:

1. **Checks initiative state**: Looks for `initiatives/[name]/` folder
   - If it doesn't exist, runs `/setup-initiative` first
2. **Scans each stage folder** to determine progress (paths relative to initiative folder):
   - Numbered layout (preferred):
     - `1-discovery/1.2-user-interviews/snapshots/` - Any snapshot files?
     - `1-discovery/1.2-user-interviews/synthesis/` - Any synthesis files?
     - `1-discovery/1.3-opportunities/` - Any opportunity files?
     - `1-discovery/1.4-solutions/` - Any solution files?
     - `1-discovery/1.5-assumptions-and-tests/` - Any assumption files?
     - `2-definition/2.1-prd/` - Any PR-FAQ files? Any PRD files?
     - `3-delivery/3.1-tasks/` - Any task files?
     - `3-delivery/3.2-qa/` - Any QA files?
     - `3-delivery/3.3-delivery-metrics/` - Any DORA snapshots?
     - `3-delivery/3.5-launch/` - Any launch plans or retros?

   - Legacy layout (supported):
     - `discovery/user-interviews/snapshots/`
     - `discovery/user-interviews/synthesis/`
     - `discovery/opportunities/`
     - `discovery/solutions/`
     - `discovery/assumptions/`
     - `definition/prd/`
     - `delivery/tasks/`
     - `delivery/qa/`
     - `delivery/delivery-metrics/`
     - `delivery/launch/`
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
| 6. Assumptions | >= 1 assumptions file with test results | `/pr-faq` |
| 7. PR-FAQ | >= 1 `pr-faq-*.md` file in definition folder | `/prd` |
| 8. PRD | >= 1 PRD file (non pr-faq) in definition folder | `/generate-tasks` |
| 9. Tasks | Task list exists in delivery tasks folder | `/process-tasks` |
| 10. QA | >= 1 file in delivery QA folder | `/delivery-metrics` |
| 11. Delivery Metrics | >= 1 file in delivery metrics folder | Launch planning |
| 12. Launch | >= 1 file in launch folder | Complete |

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
## Discovery progress: [Initiative Name]

| Phase | Stage | Status | Files |
|-------|-------|--------|-------|
| Discovery | Setup | Done | README.md |
| Discovery | Snapshots | Done (4 files) | snapshot-*.md |
| Discovery | Synthesis | Done (1 file) | synthesis-v1.md |
| Discovery | Opportunities | In Progress | - |
| Discovery | Solutions | Not Started | - |
| Discovery | Assumptions | Not Started | - |
| Definition | PR-FAQ | Not Started | - |
| Definition | PRD | Not Started | - |
| Definition | Tasks | Not Started | - |
| Delivery | QA | Not Started | - |
| Delivery | Metrics | Not Started | - |
| Delivery | Launch | Not Started | - |

**Next step:** Create opportunities from your synthesis.
Run `/create-opportunities [initiative-name]` to continue.
```

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
