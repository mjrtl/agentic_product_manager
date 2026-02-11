# Generate Figma Make Prompt - Reference

## Goal

Generate **Figma Make-ready prompts** based on design briefs and design systems. The prompt follows a `tool`, `setup`, `pages` structure that reflects brand identity and design tokens to enable consistent automated design generation.

**Critical Constraint**: Figma Make prompts are limited to **maximum 5000 characters**, requiring efficient resolution through structural constraints and balanced readability.

## Output

### Storage Location

- **Per Initiative**: `initiatives/[initiative-name]/definition/design/`
- **File Naming Convention**: `figma-make-prompt-[feature-name].json`

### JSON Schema

```json
{
  "tool": "Figma Make",
  "setup": {
    "theme": "<50 chars max theme description>",
    "grid": "<core grid settings>",
    "typography": "<3 sizes only>",
    "colors": ["<7 essential colors only>"],
    "brand": {
      "name": "<Brand Name>",
      "primary": "<Primary Color>",
      "bg": "<Background Color>",
      "text": "<Text Color>"
    }
  },
  "pages": [
    {
      "name": "<page name>",
      "layout": "<200 chars max layout description>",
      "components": [
        {
          "name": "<component name>",
          "variant": "<variant name>",
          "props": {"<prop_name>": "<prop_value>"},
          "position": {"x": 0, "y": 0, "w": 100, "h": 50}
        }
      ],
      "copy": [
        {"key": "<text key>", "text": "<actual text>", "component": "<component name>"}
      ]
    }
  ]
}
```

## Process

1. **Design Brief Intake**: Collect objectives, target audience, key components, and design patterns from existing design brief JSON
2. **Design System Reference**: Reference tokens and components from the project's design system
3. **Structural Constraint Application**: Apply maximum limits (2 pages, 6 components/page, 8 copy items/page)
4. **Token Mapping**: Map design system tokens to Figma Make format with abbreviations
5. **Component Optimization**: Select core variants and limit props to essential properties
6. **Balanced Formatting**: Apply optimal balance between readability and compression
7. **JSON Optimization**: Remove unnecessary whitespace while maintaining structure
8. **Character Validation**: Ensure compliance with 5000 character limit
9. **File Storage**: Save to `initiatives/[initiative-name]/definition/design/` folder

## Generation Rules

### Structural Constraints (5000 character limit)

- **Pages**: Maximum 2 pages
- **Components**: Maximum 6 per page
- **Copy Items**: Maximum 8 per page
- **Layout Description**: 200 characters max
- **Component Description**: 50 characters max

### Setup Section Optimization

- **Theme**: 50 characters max, focus on key visual characteristics
- **Grid**: Core breakpoints only (desktop/mobile)
- **Typography**: 3 sizes only (large/medium/small)
- **Colors**: 7 essential colors (primary, secondary, background, text, accent, success, neutral)
- **Brand**: 4 core properties (name, primary, background, text)

### Component Optimization

- **Naming**: Use component name + variant only
- **Props**: Limit to 3 core properties (bg, color, borderRadius)
- **Position**: Abbreviated format (x, y, w, h)
- **Copy**: Key + text + component reference only

### Formatting Rules

- **Indentation**: 2-space indentation throughout
- **Compression**: Props and position on single line
- **Arrays**: Copy arrays on single line
- **Whitespace**: Minimize unnecessary line breaks and spaces

### Auto-compression Rules

- **Structure**: Maintain core JSON structure while removing whitespace
- **Duplicates**: Consolidate repeated props
- **Descriptions**: Minimize all descriptive text
- **Abbreviations**: Use standard abbreviations (backgroundColor -> bg, textColor -> color)

## Quality Validation

### Character Count Validation

- **Target**: Under 5000 characters
- **Check**: Validate total JSON length before output
- **Fallback**: Further compress if over limit

### Design System Consistency

- **Token Mapping**: Verify design system tokens are correctly mapped
- **Component References**: Ensure component names match design system
- **Brand Alignment**: Confirm brand values and identity are consistent

## Common Abbreviations

- `backgroundColor` -> `bg`
- `textColor` -> `color`
- `borderRadius` -> `borderRadius`
- `width` -> `w`
- `height` -> `h`

## Quick Reference Character Limits

- **Total**: 5000 characters max
- **Pages**: 2 max
- **Components per page**: 6 max
- **Copy per page**: 8 max
- **Layout description**: 200 chars max
- **Theme description**: 50 chars max
