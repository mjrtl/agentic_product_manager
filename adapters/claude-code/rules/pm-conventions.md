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

### initiatives/**/user-interviews/snapshots/*.md
- Must follow the interview snapshot template from `skills/interview-snapshot/references/create-interview-snapshots.md`
- Filename format: `snapshot-[participant-name]-[date].md`
- Must include: Quick Facts, Memorable Quote, Story Summary, Experience Map, Opportunities, Insights

### initiatives/**/user-interviews/synthesis/*.md
- Must follow synthesis template from `skills/synthesize-interviews/references/synthesize-interview-snapshots.md`
- Filename format: `synthesis-[initiative-name]-v[version].md`
- Check for existing synthesis files before creating new ones
- Auto-increment version numbers

### initiatives/**/opportunities/**/*.md
- Must use problem-focused statement format: "I want to ~ but ~ makes it difficult"
- No feature suggestions or solution language
- Must include Opportunity Solution Tree structure
- Filename format: `opportunities-[topic]-v[version].md`

### initiatives/**/solutions/**/*.md
- Must enforce mandatory individual ideation step (user generates 3+ ideas first)
- Filename format: `solutions-[topic]-v[version].md`

### initiatives/**/assumptions/**/*.md
- Must use binary classification for evidence and importance
- Maximum 3 Leap of Faith assumptions per document
- Must include test cards for each LoFA
- Filename format: `assumptions-[opportunity-name]-v[version].md`

### initiatives/**/prd/pr-faq-*.md
- Must follow PR-FAQ template from `skills/pr-faq/references/create-pr-faq.md`
- Filename format: `pr-faq-[feature-name].md`
- Must include: Press Release, External FAQs (5-8), Internal FAQs (5-8), Strategy Traceability

### initiatives/**/prd/*.md
- Must follow PRD structure (9 sections)
- Always ask clarifying questions before generating
- Filename format: `prd-[feature-name].md` or `1-pager-[initiative-name].md`

### initiatives/**/design/*
- Design briefs output both JSON and Markdown
- Figma Make prompts must stay under 5000 characters
- Filename formats: `design-brief-[name].[json|md]`, `figma-make-prompt-[name].json`

### initiatives/**/tasks/*.md
- Must follow task list format with checkboxes
- One sub-task at a time execution
- Conventional commit messages on parent task completion

### initiatives/**/qa/*.md
- Test plans: `test-plan-[feature-name].md`
- Test results: `test-results-[feature-name]-[YYYY-MM-DD].md`
- QA KPI snapshots: `qa-kpis-[YYYY-MM-DD].md` (use `/delivery-metrics --type qa`)

### initiatives/**/delivery-metrics/*.md
- DORA snapshots: `dora-[YYYY-MM-DD].md` (use `/delivery-metrics --type dora`)
- Must include benchmark comparison (elite/high/medium/low)

### initiatives/**/launch/*.md
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
