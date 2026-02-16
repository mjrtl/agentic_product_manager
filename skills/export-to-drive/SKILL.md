---
name: Export to Drive
description: >
  Export initiative documents to Google Drive as native Google Docs, Sheets, and Slides.
  Mirrors initiative folder structure, classifies files by format, and outputs shareable links.
argument-hint: "<initiative-name> [--phase 0|1|2|3] [--file <filename>] [--folder <drive-folder-id>]"
---

# Export to Drive

Push initiative documents to Google Drive so stakeholders can view them without repo access.

## When to use

- When stakeholders need to review initiative outputs (ODDs, PRDs, exec summaries, metrics)
- Before a steering committee or review meeting where attendees need pre-reads
- After completing a discovery or definition phase to share progress
- When someone asks for a "shareable link" to a PM document

## Input

- **Initiative name** (required): the kebab-case folder name under `initiatives/`
- **--phase** (optional): restrict export to a single phase (0 = intake, 1 = discovery, 2 = definition, 3 = delivery)
- **--file** (optional): export a single file by relative path within the initiative
- **--folder** (optional): Google Drive folder ID to use as the parent for this initiative's exports. Overrides the project-level default. Get the ID from the folder's URL: `https://drive.google.com/drive/folders/<THIS-IS-THE-ID>`

## Output

- Google Docs, Sheets, and/or Slides created in a mirrored folder structure on Google Drive
- A summary table with document name, Google format, and shareable link for each exported file
- Updated `.drive-export-registry.json` in the initiative folder (gitignored)

## Process

1. **Validate initiative**: Confirm the initiative folder exists. Determine scope: full initiative, single phase (`--phase`), or single file (`--file`)
2. **Load registry**: Read `.drive-export-registry.json` from the initiative folder if it exists, otherwise initialize a new one
3. **Resolve target folder**: Determine where to create the initiative folder on Google Drive, using this priority order:
   - `--folder` flag (if provided)
   - `driveParentFolderId` from an existing registry (from a previous export)
   - `defaultDriveFolder` from `.export-config.json` in the project root (project-level default)
   - My Drive root (fallback)
4. **Create Drive folders**: Create a root folder for the initiative inside the resolved target folder (if not already in registry), then create sub-folders mirroring the phase/section structure using the MCP `createFolder` tool
5. **Classify files**: For each file in scope, apply the format classification rules from `references/export-to-drive-guide.md` to determine whether to create a Google Doc, Sheet, Slides, or skip
6. **Export files**: For each classified file:
   - If the file already exists in the registry, update the existing Google file (same ID, same URL)
   - If it's new, create a new Google Doc/Sheet/Slides via the appropriate MCP tool
   - Convert markdown content to the target format (tables become Sheet rows, sections become Slides)
7. **Construct links**: Build shareable URLs from Drive file IDs. Instruct the user to share the root folder with "Anyone with the link → Viewer" if this is the first export
8. **Update registry and summarize**: Write the updated registry file. Display a summary table with columns: File, Format, Link, Status (created/updated)

## Prerequisites

This skill requires the `google-drive` MCP server to be running. See `.mcp.json` in the project root. First-time setup requires:
1. Google Cloud project with Drive, Docs, Sheets, and Slides APIs enabled
2. OAuth 2.0 Desktop credentials stored in 1Password (vault: Private, item: Google Drive MCP)
3. `op` (1Password CLI) installed and signed in

For format classification rules, registry schema, and detailed conversion guidance, see `references/export-to-drive-guide.md`.
