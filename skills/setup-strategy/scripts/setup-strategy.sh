#!/usr/bin/env bash
set -euo pipefail

# Setup Strategy Script
# Creates a new strategy workspace with standardized structure and templates.
#
# Usage:
#   ./setup-strategy.sh <strategy-name> "<Owner Name>" "<Focus Area>"
#
# Example:
#   ./setup-strategy.sh marketplace-growth "Sarah Kim" "Grow the marketplace to 10x GMV"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

if [ $# -lt 3 ]; then
  echo "Usage: $(basename "$0") <strategy-name> \"<Owner Name>\" \"<Focus Area>\""
  echo ""
  echo "Arguments:"
  echo "  strategy-name    Kebab-case name (e.g., marketplace-growth)"
  echo "  Owner Name       Strategy owner or product leader"
  echo "  Focus Area       Brief description of the strategic focus area"
  exit 1
fi

STRATEGY_NAME="$1"
OWNER="$2"
FOCUS_AREA="$3"

# Convert kebab-case to Title Case for display
DISPLAY_NAME=$(echo "$STRATEGY_NAME" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

# Determine target directory (look for strategy/ in current directory or parent)
if [ -d "strategy" ]; then
  TARGET_DIR="strategy/$STRATEGY_NAME"
elif [ -d "../strategy" ]; then
  TARGET_DIR="../strategy/$STRATEGY_NAME"
else
  TARGET_DIR="strategy/$STRATEGY_NAME"
  mkdir -p "strategy"
fi

if [ -d "$TARGET_DIR" ]; then
  echo "Error: Strategy '$STRATEGY_NAME' already exists at $TARGET_DIR"
  exit 1
fi

echo "Creating strategy workspace: $DISPLAY_NAME"
echo "  Owner: $OWNER"
echo "  Focus: $FOCUS_AREA"
echo "  Location: $TARGET_DIR"
echo ""

# Create folder structure
mkdir -p "$TARGET_DIR"/{vision,okrs,prism-reviews,team-structure,evidence}

# Copy and customize templates
copy_template() {
  local src="$1"
  local dest="$2"

  if [ -f "$src" ]; then
    sed \
      -e "s/\[Strategy Name\]/$DISPLAY_NAME/g" \
      -e "s/\[Strategy Owner\]/$OWNER/g" \
      -e "s/\[strategy-name\]/$STRATEGY_NAME/g" \
      -e "s/\[Focus area description\]/$FOCUS_AREA/g" \
      "$src" > "$dest"
  fi
}

# Copy main README
copy_template "$TEMPLATE_DIR/README.md" "$TARGET_DIR/README.md"

# Copy review log
copy_template "$TEMPLATE_DIR/review-log.md" "$TARGET_DIR/review-log.md"

# Copy subfolder READMEs
for folder in vision okrs prism-reviews team-structure evidence; do
  if [ -f "$TEMPLATE_DIR/$folder/README.md" ]; then
    copy_template "$TEMPLATE_DIR/$folder/README.md" "$TARGET_DIR/$folder/README.md"
  fi
done

echo "Strategy workspace created successfully!"
echo ""
echo "Folder structure:"
echo "  $TARGET_DIR/"
echo "  ├── README.md"
echo "  ├── review-log.md"
echo "  ├── vision/"
echo "  │   └── README.md"
echo "  ├── okrs/"
echo "  │   └── README.md"
echo "  ├── prism-reviews/"
echo "  │   └── README.md"
echo "  ├── team-structure/"
echo "  │   └── README.md"
echo "  └── evidence/"
echo "      └── README.md"
echo ""
echo "Next steps:"
echo "  1. Run /vision-review to score your product vision"
echo "  2. Run /prism-review to evaluate your strategy document"
echo "  3. Run /okr-coach to sharpen your OKRs"
echo "  4. Run /team-structure to check org alignment"
echo "  5. Use /setup-initiative to create initiatives linked to this strategy"
