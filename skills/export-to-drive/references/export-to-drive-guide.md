# Export to Drive guide

## Overview

This guide defines how initiative files are classified into Google Drive formats, the structure of the export registry, and conversion rules for each format.

---

## Format classification rules

Each file in an initiative folder maps to a Google Drive format based on its filename pattern. Files are matched top-to-bottom; the first matching rule wins.

### Google Doc

Long-form narrative documents. Markdown headings, paragraphs, and inline formatting translate directly.

| Pattern | Typical content |
|---------|----------------|
| `**/opportunity-discovery-doc.md` | Opportunity Discovery Document (ODD) |
| `**/pr-faq-*.md` | Amazon-style PR-FAQ |
| `**/prd-*.md` | Product Requirements Document |
| `**/1-pager-*.md` | Decision-focused 1-Pager |
| `**/snapshot-*.md` | Interview snapshot |
| `**/synthesis-*.md` | Interview synthesis |
| `**/solutions-*.md` | Solution ideation output |
| `**/launch-plan-*.md` | Launch plan |
| `**/retro-*.md` | Retrospective |
| `**/discovery_context.md` | Discovery context and plan |
| `**/design-brief-*.md` | Design brief (markdown version) |
| `**/test-plan-*.md` | Test plan |
| `**/test-results-*.md` | Test results |

### Google Sheet

Tabular or metric-heavy documents. Extract markdown tables and convert each to a Sheet tab.

| Pattern | Typical content |
|---------|----------------|
| `**/assumptions-*.md` | Assumptions and test cards |
| `**/ice-*.md` | ICE prioritization scores |
| `**/dora-*.md` | DORA metric snapshot |
| `**/qa-kpis-*.md` | QA KPI snapshot |
| `**/adoption-*.md` | Adoption metric snapshot |
| `**/tasks-*.md` | Task list |
| `**/readiness-*.md` | Launch readiness checklist |
| `**/opportunities-*.md` | Opportunity list with scores |

### Google Slides

Executive-facing summaries. Each H2 section becomes a separate slide.

| Pattern | Typical content |
|---------|----------------|
| `**/00-exec-summary.md` | Phase exec summary (discovery, definition, delivery) |
| `**/0.3-exec-summary.md` | Intake phase exec summary |

### Skip (do not export)

| Pattern | Reason |
|---------|--------|
| `**/README.md` | Navigation file, not a deliverable |
| `**/00-stage-map.md` | Internal progress tracker |
| `**/*.json` | Data files (including registry itself) |
| `**/design-brief-*.json` | Machine-readable design brief |
| `**/figma-make-prompt-*.json` | Figma prompt (not useful in Drive) |

---

## Conversion guidance

### Markdown to Google Doc

1. Parse markdown headings (H1-H4) into Google Doc heading styles
2. Preserve bold, italic, and inline code formatting
3. Convert markdown tables to Google Doc tables
4. Convert bullet/numbered lists to native Doc lists
5. Preserve blockquotes as indented text

### Markdown to Google Sheet

1. Identify all markdown tables in the file
2. For each table, create a named Sheet tab using the nearest preceding heading as the tab name
3. Parse the header row as column headers
4. Parse data rows into cells
5. Non-table content (context paragraphs, headings) goes into a "Summary" tab as plain text

### Markdown to Google Slides

1. Use H1 as the presentation title (first slide)
2. Each H2 becomes a new slide title
3. Content under each H2 becomes slide body text
4. Tables within a section become simple table shapes on the slide
5. Keep slides concise — if a section exceeds ~200 words, split across slides

---

## Export registry schema

Each initiative maintains a `.drive-export-registry.json` file (gitignored) that tracks what has been exported and where.

```json
{
  "initiative": "initiative-name",
  "driveRootFolderId": "google-drive-folder-id",
  "driveRootFolderUrl": "https://drive.google.com/drive/folders/...",
  "folders": {
    "0-intake-and-scoping": "folder-id",
    "0-intake-and-scoping/0.1-odd": "folder-id",
    "1-discovery": "folder-id"
  },
  "exports": [
    {
      "localPath": "0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md",
      "driveFileId": "google-file-id",
      "format": "doc",
      "driveUrl": "https://docs.google.com/document/d/.../edit",
      "lastExported": "2026-02-16T10:30:00Z"
    }
  ]
}
```

### Registry fields

| Field | Type | Description |
|-------|------|-------------|
| `initiative` | string | Initiative folder name (kebab-case) |
| `driveRootFolderId` | string | Google Drive folder ID for the initiative root |
| `driveRootFolderUrl` | string | Shareable URL for the root folder |
| `folders` | object | Map of relative folder paths to Drive folder IDs |
| `exports` | array | One entry per exported file |
| `exports[].localPath` | string | Path relative to initiative root |
| `exports[].driveFileId` | string | Google Drive file ID |
| `exports[].format` | string | `doc`, `sheet`, or `slides` |
| `exports[].driveUrl` | string | Direct link to the Google file |
| `exports[].lastExported` | string | ISO 8601 timestamp of last export |

### Registry behavior

- **First export**: Create a new registry with empty `folders` and `exports`
- **Subsequent exports**: Look up existing entries by `localPath`. If found, update the existing Google file (preserving the same `driveFileId` and `driveUrl`). If not found, create a new entry
- **Deleted local files**: Registry entries for files that no longer exist locally are left in place (the Google Drive copy remains accessible)

---

## Sharing (v1)

The MCP server does not support programmatic permission changes. After the first export:

1. The skill outputs the root folder URL
2. Instruct the user: "Open this folder in Google Drive, click Share, set to 'Anyone with the link → Viewer'"
3. This permission cascades to all files and sub-folders — it only needs to be done once per initiative

---

## Summary table format

After export completes, display a table like this:

```
| File | Format | Status | Link |
|------|--------|--------|------|
| opportunity-discovery-doc.md | Doc | Created | https://docs.google.com/document/d/.../edit |
| dora-2026-02-16.md | Sheet | Updated | https://docs.google.com/spreadsheets/d/.../edit |
| 00-exec-summary.md | Slides | Created | https://docs.google.com/presentation/d/.../edit |
| README.md | - | Skipped | - |
```

Include a count at the bottom: "Exported X files (Y created, Z updated, W skipped)"
