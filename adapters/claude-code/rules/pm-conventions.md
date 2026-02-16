# PM conventions

Rules that apply when working with files inside `strategy/` and `initiatives/` directories.

## Strategy path rules

### strategy/**/*.md
- Must follow writing standards from `_shared/writing-standards.md`
- Vision reviews: `strategy/[name]/vision/vision-review-[YYYY-MM-DD].md`
- OKR documents: `strategy/[name]/okrs/okrs-[period]-v[N].md`
- PRISM reviews: `strategy/[name]/prism-reviews/prism-review-[YYYY-MM-DD].[md|json]`
- Team structure: `strategy/[name]/team-structure/team-structure-[YYYY-MM-DD].md`
- Evidence: `strategy/[name]/evidence/evidence-[topic]-[YYYY-MM-DD].md`

## Initiative path rules

## Path-specific rules

### initiatives/**/1-discovery/1.2-user-interviews/snapshots/*.md (legacy: initiatives/**/discovery/user-interviews/snapshots/*.md)
- Must follow the interview snapshot template from `skills/interview-snapshot/references/create-interview-snapshots.md`
- Filename format: `snapshot-[participant-name]-[date].md`
- Must include: Quick Facts, Memorable Quote, Story Summary, Experience Map, Opportunities, Insights

### initiatives/**/1-discovery/1.2-user-interviews/synthesis/*.md (legacy: initiatives/**/discovery/user-interviews/synthesis/*.md)
- Must follow synthesis template from `skills/synthesize-interviews/references/synthesize-interview-snapshots.md`
- Filename format: `synthesis-[initiative-name]-v[version].md`
- Check for existing synthesis files before creating new ones
- Auto-increment version numbers

### initiatives/**/1-discovery/1.3-opportunities/**/*.md (legacy: initiatives/**/discovery/opportunities/**/*.md)
- Must use problem-focused statement format: "I want to ~ but ~ makes it difficult"
- No feature suggestions or solution language
- Must include Opportunity Solution Tree structure
- Filename format: `opportunities-[topic]-v[version].md`

### initiatives/**/1-discovery/1.4-solutions/**/*.md (legacy: initiatives/**/discovery/solutions/**/*.md)
- Must enforce mandatory individual ideation step (user generates 3+ ideas first)
- Filename format: `solutions-[topic]-v[version].md`

### initiatives/**/1-discovery/1.5-assumptions-and-tests/**/*.md (legacy: initiatives/**/discovery/assumptions/**/*.md)
- Must use binary classification for evidence and importance
- Maximum 3 Leap of Faith assumptions per document
- Must include test cards for each LoFA
- Filename format: `assumptions-[opportunity-name]-v[version].md`

### initiatives/**/2-definition/2.1-prd/pr-faq-*.md (legacy: initiatives/**/definition/prd/pr-faq-*.md)
- Must follow PR-FAQ template from `skills/pr-faq/references/create-pr-faq.md`
- Filename format: `pr-faq-[feature-name].md`
- Must include: Press Release, External FAQs (5-8), Internal FAQs (5-8), Strategy Traceability

### initiatives/**/2-definition/2.1-prd/*.md (legacy: initiatives/**/definition/prd/*.md)
- Must follow PRD structure (9 sections)
- Always ask clarifying questions before generating
- Filename format: `prd-[feature-name].md` or `1-pager-[initiative-name].md`

### initiatives/**/2-definition/2.2-design/* (legacy: initiatives/**/definition/design/*)
- Design briefs output both JSON and Markdown
- Figma Make prompts must stay under 5000 characters
- Filename formats: `design-brief-[name].[json|md]`, `figma-make-prompt-[name].json`

### initiatives/**/3-delivery/3.1-tasks/*.md (legacy: initiatives/**/delivery/tasks/*.md)
- Must follow task list format with checkboxes
- One sub-task at a time execution
- Conventional commit messages on parent task completion

### initiatives/**/3-delivery/3.2-qa/*.md (legacy: initiatives/**/delivery/qa/*.md)
- Test plans: `test-plan-[feature-name].md`
- Test results: `test-results-[feature-name]-[YYYY-MM-DD].md`
- QA KPI snapshots: `qa-kpis-[YYYY-MM-DD].md` (use `/delivery-metrics --type qa`)

### initiatives/**/3-delivery/3.3-delivery-metrics/*.md (legacy: initiatives/**/delivery/delivery-metrics/*.md)
- DORA snapshots: `dora-[YYYY-MM-DD].md` (use `/delivery-metrics --type dora`)
- Must include benchmark comparison (elite/high/medium/low)

### initiatives/**/3-delivery/3.5-launch/*.md (legacy: initiatives/**/delivery/launch/*.md)
- Launch plans: `launch-plan-[feature-name].md`
- Readiness checklists: `readiness-[feature-name].md`
- Retrospectives: `retro-[feature-name]-[YYYY-MM-DD].md`

## Version management

All versioned files in initiative directories:
1. Check for existing files with same pattern before creating
2. Auto-increment version number (v1 -> v2 -> v3)
3. Never overwrite existing files
4. Preserve all versions for comparison

## Writing standards

All Markdown files in initiative directories must follow `_shared/writing-standards.md`.
Run the banned words/phrases check before finalizing any document.

## Credential management

All secrets and credentials (API keys, OAuth client IDs/secrets, tokens) must be managed through 1Password:
- Use `op://` secret references in configuration files (`.mcp.json`, `.env`, etc.)
- Use `op run` to inject credentials at runtime — never store credentials as local files
- Never hardcode secrets in source files, scripts, or environment configs
- `.mcp.json` files must use `op` as the command wrapper for any MCP server requiring authentication
- Configuration files containing only `op://` references (not actual secrets) are safe to commit
