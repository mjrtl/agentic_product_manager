# QA

Test plans, test results, and QA KPI snapshots for this initiative.

## Files to create

### Test plans
- `test-plan-[feature-name].md` - Test strategy and test cases for a feature
- Include: scope, test types (unit, integration, e2e), acceptance criteria, environments

### Test results
- `test-results-[feature-name]-[YYYY-MM-DD].md` - Test execution results
- Include: pass/fail counts, defects found, coverage metrics

### QA KPI snapshots
- `qa-kpis-[YYYY-MM-DD].md` - Periodic quality metrics
- Use `/delivery-metrics --type qa` to generate structured snapshots

## QA workflow

1. Write test plan based on PRD acceptance criteria
2. Execute tests and record results
3. Track defects and resolution
4. Capture QA KPIs periodically with `/delivery-metrics`

---
*Use `/delivery-metrics --type qa` to generate structured QA snapshots.*
