# Create Design Brief - Reference

## Goal

Generate **consistent design briefs** from requester input, outputting both **machine-readable specifications (JSON)** for direct reference in **Figma/Make and other prototyping tools**, plus **stakeholder-friendly summaries (Markdown)**.
Leverage the project's **design system** (components and color/typography/spacing/radius/elevation/motion tokens) to ensure **reusability** across advertising, prototyping, external branding, and social media.

## Output

### Storage Location

- **Per Initiative**: `initiatives/[initiative-name]/design/`
- **File Naming Convention**: `design-brief-[feature-name].[json|md]`

### A) Machine-Readable JSON (Figma/variables & components friendly)

Required root keys: `meta`, `purpose`, `audience`, `tone`, `brand_voice`, `variables`, `components`, `patterns`, `channels`, `deliverables`, `a11y`, `naming`, `file_structure`, `metrics`, `assets`.

**Schema Overview**

```json
{
  "meta": {
    "version": "1.0",
    "date": "YYYY-MM-DD",
    "locale": "en-US",
    "brand": "YourBrand",
    "design_system": {
      "source": "internal",
      "path": "design-system/",
      "tokens_path": "tokens/design-tokens.json",
      "components_path": "components/component-library.json"
    },
    "sources": ["research/study", "benchmark/competitor-analysis"]
  },
  "purpose": "<Campaign/Product objective>",
  "audience": {
    "primary": "<Primary target>",
    "secondary": "<Secondary target>",
    "personas": ["<Persona 1>", "<Persona 2>"],
    "context": "<Usage context>"
  },
  "tone": "<Tone and manner>",
  "brand_voice": {
    "keywords": ["trustworthy", "modern", "accessible"],
    "dos": ["Use clear, action-oriented language"],
    "donts": ["Use jargon or technical terms"]
  },
  "variables": {
    "collections": {
      "color": { "semantic": {}, "neutral": {} },
      "typography": { "font_family": {}, "sizes": {}, "weights": {} },
      "spacing": { "scale": {} },
      "radius": {},
      "elevation": {},
      "motion": { "duration": {}, "easing": {} }
    }
  },
  "components": [],
  "patterns": [],
  "channels": { "ads": {}, "branding": {}, "social": {}, "prototype": {} },
  "deliverables": [],
  "a11y": {
    "contrast": "WCAG 2.2 AA",
    "min_touch": 44,
    "focus_visible": true,
    "rtl": true,
    "screen_reader": true,
    "keyboard_navigation": true
  },
  "naming": {
    "components": "PascalCase",
    "variants": "kebab-case",
    "slash": "Component/Variant=Value",
    "tokens": "dot.case",
    "files": "kebab-case"
  },
  "file_structure": { "pages": [], "libraries": [] },
  "metrics": { "primary": "", "secondary": [], "success_criteria": "" },
  "assets": { "illustration_style": "", "photo": "", "icon_set": "" }
}
```

### B) Stakeholder Markdown Summary

Generate these sections with clear headings:

* Purpose & Audience
* Tone & Brand Voice (including Do/Don't guidelines)
* Design Variables (Tokens/Variables) Summary
* Component Library Mapping & Variant Table
* Patterns & Flows
* Channel-Specific Guidelines (Ads/Branding/Social/Prototype)
* Accessibility & Internationalization
* Naming Conventions & File Structure
* Success Metrics & Experiment Plan
* Asset Guidelines

## Process

1. **Brief Intake**: Collect product/campaign objectives, constraints, deadlines, and key stakeholders.
2. **Design System Reference**: Reference tokens and components from the project's design system folder.
3. **Library Mapping**: Prioritize existing components/patterns (minimize new creation).
4. **Token First**: Define color, typography, spacing variables first, then inject into components.
5. **Channel Consistency**: Ensure Ads/Branding/Social/Prototype share the same variables and copy principles.
6. **Accessibility Gate**: Check WCAG 2.2 AA, minimum 44px touch, RTL/multilingual support.
7. **Output Dual-Track**: Generate JSON (tool input) + Markdown (review) simultaneously.
8. **File Storage**: Save to `initiatives/[initiative-name]/design/` folder.

## Generation Rules

* **Design System**: Use the project's design system folder as the foundation.
* **Library References**: Use `"Button/Primary"` format for component references, mark as `"proposed"` if not available.
* **Token References**: Use `"color.semantic.primary.500"` format for token references.
* **Data Binding Examples**: Specify type/unit/format in `data_bindings`.
* **Interactions**: Detail event/action/animation (type/duration/easing) specifications.
* **Token Naming**: Use `dot.case` for tokens, **Slash-Naming** for components.
* **Success Metrics**: Include measurable success criteria and experiment hypotheses.
* **Sources**: Attach research/benchmark sources in `meta.sources[]` for sensitive claims.
* **Responsive Design**: Include breakpoint specifications and mobile-first approach.
* **Performance**: Consider loading states, skeleton screens, and progressive enhancement.
