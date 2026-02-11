#!/usr/bin/env bash
set -euo pipefail

# Setup Initiative Script
# Creates a new initiative folder with standardized structure and templates.
#
# Usage:
#   ./setup-initiative.sh <initiative-name> "<Owner Name>" "<Goal description>" [timeline] [stakeholders]
#
# Example:
#   ./setup-initiative.sh mobile-app-redesign "Sarah Kim" "Redesign the mobile app for better engagement"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

if [ $# -lt 3 ]; then
  echo "Usage: $(basename "$0") <initiative-name> \"<Owner Name>\" \"<Goal description>\" [timeline] [stakeholders]"
  echo ""
  echo "Arguments:"
  echo "  initiative-name    Kebab-case name (e.g., mobile-app-redesign)"
  echo "  Owner Name         Product Manager or initiative owner"
  echo "  Goal description   Brief description of the initiative goal"
  echo "  timeline           Optional: e.g., '2025-Q1 - 2025-Q2'"
  echo "  stakeholders       Optional: e.g., 'Engineering, Design, Marketing'"
  exit 1
fi

INITIATIVE_NAME="$1"
OWNER="$2"
GOAL="$3"
TIMELINE="${4:-TBD}"
STAKEHOLDERS="${5:-TBD}"

# Convert kebab-case to Title Case for display
DISPLAY_NAME=$(echo "$INITIATIVE_NAME" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

# Determine target directory (look for initiatives/ in current directory or parent)
if [ -d "initiatives" ]; then
  TARGET_DIR="initiatives/$INITIATIVE_NAME"
elif [ -d "../initiatives" ]; then
  TARGET_DIR="../initiatives/$INITIATIVE_NAME"
else
  TARGET_DIR="initiatives/$INITIATIVE_NAME"
  mkdir -p "initiatives"
fi

if [ -d "$TARGET_DIR" ]; then
  echo "Error: Initiative '$INITIATIVE_NAME' already exists at $TARGET_DIR"
  exit 1
fi

echo "Creating initiative: $DISPLAY_NAME"
echo "  Owner: $OWNER"
echo "  Goal: $GOAL"
echo "  Location: $TARGET_DIR"
echo ""

# Create folder structure
mkdir -p "$TARGET_DIR"/{user-interviews/{snapshots,synthesis,transcripts},opportunities,assumptions,solutions,design,product-analytics,prd,tasks,qa,delivery-metrics,launch}

# Create .gitkeep files in empty directories
for dir in "$TARGET_DIR"/user-interviews/{snapshots,synthesis,transcripts}; do
  touch "$dir/.gitkeep"
done

# Copy and customize templates
copy_template() {
  local src="$1"
  local dest="$2"

  if [ -f "$src" ]; then
    sed \
      -e "s/\[Initiative Name\]/$DISPLAY_NAME/g" \
      -e "s/\[Product Manager Name\]/$OWNER/g" \
      -e "s/\[initiative-name\]/$INITIATIVE_NAME/g" \
      "$src" > "$dest"
  fi
}

# Copy main README
copy_template "$TEMPLATE_DIR/README.md" "$TARGET_DIR/README.md"

# Copy subfolder READMEs
for folder in assumptions design opportunities prd product-analytics solutions tasks user-interviews qa delivery-metrics launch; do
  if [ -f "$TEMPLATE_DIR/$folder/README.md" ]; then
    copy_template "$TEMPLATE_DIR/$folder/README.md" "$TARGET_DIR/$folder/README.md"
  fi
done

# Update main README with goal, timeline, and stakeholders
if [ -f "$TARGET_DIR/README.md" ]; then
  sed -i.bak \
    -e "s|\[Clear, concise description of what we're trying to achieve and why it matters\]|$GOAL|g" \
    -e "s|\[Start Date\] - \[Target End Date\]|$TIMELINE|g" \
    -e "s|\[Key stakeholders and their roles\]|$STAKEHOLDERS|g" \
    "$TARGET_DIR/README.md"
  rm -f "$TARGET_DIR/README.md.bak"
fi

echo "Initiative created successfully!"
echo ""
echo "Folder structure:"
echo "  $TARGET_DIR/"
echo "  ├── README.md"
echo "  │"
echo "  │   ## Discovery"
echo "  ├── user-interviews/"
echo "  │   ├── README.md, snapshots/, synthesis/, transcripts/"
echo "  ├── opportunities/        └── README.md"
echo "  ├── assumptions/           └── README.md"
echo "  ├── solutions/             └── README.md"
echo "  │"
echo "  │   ## Definition"
echo "  ├── prd/                   └── README.md"
echo "  ├── design/                └── README.md"
echo "  │"
echo "  │   ## Delivery"
echo "  ├── tasks/                 └── README.md"
echo "  ├── qa/                    └── README.md"
echo "  ├── delivery-metrics/      └── README.md"
echo "  ├── product-analytics/     └── README.md"
echo "  └── launch/                └── README.md"
echo ""
echo "Next steps (Discovery):"
echo "  1. Start user research: /interview-snapshot"
echo "  2. Synthesize findings: /synthesize-interviews"
echo "  3. Identify opportunities: /create-opportunities"
echo "  4. Test assumptions: /test-assumptions"
echo ""
echo "Next steps (Definition):"
echo "  5. Write PR-FAQ: /pr-faq"
echo "  6. Create PRD: /prd"
echo "  7. Generate tasks: /generate-tasks"
echo ""
echo "Next steps (Delivery):"
echo "  8. Process tasks: /process-tasks"
echo "  9. Track metrics: /delivery-metrics"
