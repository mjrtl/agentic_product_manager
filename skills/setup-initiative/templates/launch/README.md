# Launch

Launch planning, readiness checklists, and post-launch retrospectives for this initiative.

## Files to create

### Launch plan
- `launch-plan-[feature-name].md` - Full launch plan with timeline, channels, and owners
- Include: launch date, rollout strategy (% rollout, beta, GA), communication plan

### Readiness checklist
- `readiness-[feature-name].md` - Pre-launch verification checklist
- Include: QA sign-off, performance validation, documentation, monitoring, rollback plan

### Retrospective
- `retro-[feature-name]-[YYYY-MM-DD].md` - Post-launch retrospective
- Include: what went well, what could improve, action items, metrics vs targets

## Launch workflow

1. Create launch plan with rollout strategy
2. Complete readiness checklist before launch
3. Execute launch with monitoring
4. Capture post-launch adoption metrics with `/delivery-metrics --type adoption`
5. Run retrospective 1-2 weeks after launch

---
*Track post-launch adoption with `/delivery-metrics --type adoption`.*
