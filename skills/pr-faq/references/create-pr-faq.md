# Create PR-FAQ - Reference

## Goal

Create an Amazon-style Press Release and FAQ document that serves as the root document for a product or feature. The PR-FAQ forces clear thinking about customer value before detailed requirements.

## When to use

- After validating opportunities and testing assumptions
- Before writing a PRD or detailed specification
- When aligning stakeholders on product direction

## Input requirements

- **Required**: At least one validated opportunity with supporting evidence
- **Recommended**: Tested assumptions with results, solution concepts, strategy context (vision, OKRs)
- **Optional**: Customer quotes, market data, competitive analysis

## Process

### 0) File management (mandatory)

1. Determine feature or product name from context
2. Check existing files with pattern `2-definition/2.1-prd/pr-faq-*.md` (legacy: `definition/prd/pr-faq-*.md`)
3. Use filename: `pr-faq-[feature-name].md`
4. Never overwrite existing PR-FAQ files

### 1) Clarifying questions

Before drafting, gather answers to:

1. Who is the target customer? (specific segment, not "everyone")
2. What problem does this solve? (link to validated opportunity)
3. What is the key benefit in one sentence?
4. What does success look like? (measurable outcome)
5. What is the expected timeline?

**PAUSE** and collect answers before proceeding.

### 2) Draft press release

Write the press release following this structure:

```markdown
## Press release

### [Headline]
One sentence that captures the product and customer benefit. Write as a news headline.

### [Subheadline]
One sentence describing who the customer is and what they gain.

### Problem
One paragraph describing the customer problem. Use customer language and reference validated research. No internal jargon.

### Solution
One paragraph describing how the product solves the problem. Focus on customer experience, not technical implementation.

### Customer quote
A fictional quote from a target customer expressing how the product changes their life or work. Make it specific and grounded.

### How it works
2-3 short paragraphs or a numbered list describing the customer experience. Walk through the key steps from the customer's perspective.

### Leader quote
A fictional quote from a company leader explaining why this matters and how it fits the company's mission.

### Call to action
One sentence telling the reader what to do next (sign up, learn more, request access).
```

### 3) Draft external FAQs

Write 5-8 questions a customer would ask after reading the press release:

- What does it cost?
- How is this different from [competitor/alternative]?
- When will this be available?
- What do I need to get started?
- Does it work with [common integration/platform]?
- What happens to my existing [data/workflow/setup]?
- Who is this for? (and who is it not for?)
- How do I get help if something goes wrong?

Answer each question honestly in 2-4 sentences. Do not use marketing language.

### 4) Draft internal FAQs

Write 5-8 questions stakeholders and engineering would ask:

- How big is the addressable market?
- What is the estimated development cost (person-weeks)?
- What are the key technical risks?
- How does this affect our existing product/architecture?
- What assumptions are we making? (link to tested assumptions)
- What is the go-to-market plan?
- How will we measure success? (specific metrics and targets)
- What is the opportunity cost of building this?

Answer each question with data where available. Flag unknowns explicitly.

### 5) Strategy traceability

Add a traceability section linking back to strategy:

```markdown
## Strategy traceability

- **Vision:** [Link to vision document or quote the relevant vision statement]
- **OKR:** [Which OKR does this contribute to?]
- **Opportunity:** [Link to the source opportunity document]
- **Assumptions tested:** [Links to assumption test results]
- **Solution concept:** [Link to solution document]
```

### 6) User review

Present the complete PR-FAQ for review. Ask:
- Does the press release accurately capture the customer value?
- Are there missing customer FAQs?
- Are the internal FAQ answers honest about risks and costs?

**PAUSE** and incorporate feedback.

## Output structure

```markdown
# PR-FAQ: [Product/Feature Name]

**Date:** [YYYY-MM-DD]
**Author:** [Name]
**Status:** Draft / Under Review / Approved
**Initiative:** [Link to initiative]

---

## Press release

### [Headline]
[Subheadline]

### Problem
[Problem paragraph]

### Solution
[Solution paragraph]

### Customer quote
> "[Quote]" - [Customer Name], [Role]

### How it works
[2-3 paragraphs]

### Leader quote
> "[Quote]" - [Leader Name], [Title]

### Call to action
[CTA sentence]

---

## External FAQs

### Q: [Question 1]
[Answer]

### Q: [Question 2]
[Answer]

[... 5-8 questions total]

---

## Internal FAQs

### Q: [Question 1]
[Answer]

### Q: [Question 2]
[Answer]

[... 5-8 questions total]

---

## Strategy traceability

- **Vision:** [Reference]
- **OKR:** [Reference]
- **Opportunity:** [Reference]
- **Assumptions tested:** [References]
- **Solution concept:** [Reference]
```

## Writing guidance

- **Press release**: Write as if announcing to real customers. No corporate speak.
- **External FAQs**: Answer as a customer support rep would. Direct and helpful.
- **Internal FAQs**: Answer as a PM presenting to leadership. Data-driven and honest about unknowns.
- **Length**: Press release should be 250-400 words. Each FAQ answer should be 2-4 sentences.
- **Tone**: Confident but not hyperbolic. Specific over vague.

## Guardrails

- Every claim in the press release must trace to validated evidence
- Do not promise specific dates unless confirmed with engineering
- Internal FAQs must not hide risks or unknowns
- The customer quote must reflect real research findings, not aspirational fiction
- No banned words or phrases (see `_shared/writing-standards.md`)
