---
name: PR-FAQ
description: >
  Create an Amazon-style Press Release and FAQ document. Acts as the root
  document for a product or feature. Use after validating opportunities and
  assumptions, before writing a detailed PRD.
argument-hint: "[initiative-name-or-feature]"
---

# PR-FAQ

Create an Amazon-style Press Release and Frequently Asked Questions document that defines a product or feature from the customer's perspective.

## When to use

- After validating opportunities and testing key assumptions
- Before writing a detailed PRD (PR-FAQ acts as the root document)
- When you need stakeholder alignment on the "what" and "why" before the "how"
- When defining a new product, major feature, or significant initiative

## Input

- Validated opportunity from `discovery/opportunities/`
- Tested assumptions from `discovery/assumptions/`
- Solution concepts from `discovery/solutions/`
- Strategy context from `strategy/` (vision, OKRs)

## Process

1. **Clarifying questions**: Gather key details about the product/feature, target customer, and desired outcome
2. **Draft press release**: Write the customer-facing announcement narrative
3. **Draft external FAQs**: 5-8 questions a customer would ask
4. **Draft internal FAQs**: 5-8 questions from stakeholders and engineering
5. **Strategy traceability**: Link to vision, OKR, and source opportunity
6. **User review**: Present draft for feedback and iterate

## Output

- **Format:** Markdown (`.md`)
- **Location:** `definition/prd/pr-faq-[feature-name].md`
- **Naming:** PR-FAQs live alongside PRDs in the `definition/prd/` folder with the `pr-faq-` prefix

## Guardrails

- Write from the customer's perspective, not the company's
- No internal jargon in the press release or external FAQs
- Every claim must trace to validated evidence (opportunity, assumption test result)
- The press release should fit on one page (250-400 words)
- Internal FAQs must address feasibility, cost, and timeline honestly

For the full template, writing guidance, and FAQ examples, see `references/create-pr-faq.md`.

Follow the writing standards in `_shared/writing-standards.md` for all outputs.
