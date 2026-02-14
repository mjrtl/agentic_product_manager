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

# Create numbered folder structure (pragmatic, obvious ordering)
# Keep legacy layout compatibility in other skills/hooks by detecting both,
# but default scaffold is numbered.
mkdir -p "$TARGET_DIR"/0-intake-and-scoping/{0.1-odd,0.2-scoping-artifacts}
mkdir -p "$TARGET_DIR"/1-discovery/{1.1-discovery-context-and-plan,1.2-user-interviews/{snapshots,synthesis,transcripts},1.3-opportunities,1.4-solutions,1.5-assumptions-and-tests,1.6-evidence}
mkdir -p "$TARGET_DIR"/2-definition/{2.1-prd,2.2-design}
mkdir -p "$TARGET_DIR"/3-delivery/{3.1-tasks,3.2-qa,3.3-delivery-metrics,3.4-product-analytics,3.5-launch}

# Create .gitkeep files in empty directories
for dir in "$TARGET_DIR"/1-discovery/1.2-user-interviews/{snapshots,synthesis,transcripts}; do
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

# Copy stage map to initiative root (numbered navigation)
if [ -f "$TEMPLATE_DIR/stage-map.md" ]; then
  copy_template "$TEMPLATE_DIR/stage-map.md" "$TARGET_DIR/00-stage-map.md"
fi

# Copy discovery context (Keyrock process links, JTBD, problem)
if [ -f "$TEMPLATE_DIR/discovery_context.md" ]; then
  copy_template "$TEMPLATE_DIR/discovery_context.md" "$TARGET_DIR/1-discovery/1.1-discovery-context-and-plan/discovery_context.md"
fi

# Copy ODD template into intake/scoping
if [ -f "$TEMPLATE_DIR/opportunity-discovery-doc.md" ]; then
  copy_template "$TEMPLATE_DIR/opportunity-discovery-doc.md" "$TARGET_DIR/0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md"
fi

# Copy exec summary templates (seeded at key stages)
if [ -f "$TEMPLATE_DIR/intake_exec_summary.md" ]; then
  copy_template "$TEMPLATE_DIR/intake_exec_summary.md" "$TARGET_DIR/0-intake-and-scoping/0.3-exec-summary.md"
fi
if [ -f "$TEMPLATE_DIR/discovery_exec_summary.md" ]; then
  copy_template "$TEMPLATE_DIR/discovery_exec_summary.md" "$TARGET_DIR/1-discovery/00-exec-summary.md"
fi
if [ -f "$TEMPLATE_DIR/definition_exec_summary.md" ]; then
  copy_template "$TEMPLATE_DIR/definition_exec_summary.md" "$TARGET_DIR/2-definition/00-exec-summary.md"
fi
if [ -f "$TEMPLATE_DIR/delivery_exec_summary.md" ]; then
  copy_template "$TEMPLATE_DIR/delivery_exec_summary.md" "$TARGET_DIR/3-delivery/00-exec-summary.md"
fi

# Copy subfolder READMEs into phase subdirs
if [ -f "$TEMPLATE_DIR/user-interviews/README.md" ]; then
  copy_template "$TEMPLATE_DIR/user-interviews/README.md" "$TARGET_DIR/1-discovery/1.2-user-interviews/README.md"
fi
if [ -f "$TEMPLATE_DIR/opportunities/README.md" ]; then
  copy_template "$TEMPLATE_DIR/opportunities/README.md" "$TARGET_DIR/1-discovery/1.3-opportunities/README.md"
fi
if [ -f "$TEMPLATE_DIR/solutions/README.md" ]; then
  copy_template "$TEMPLATE_DIR/solutions/README.md" "$TARGET_DIR/1-discovery/1.4-solutions/README.md"
fi
if [ -f "$TEMPLATE_DIR/assumptions/README.md" ]; then
  copy_template "$TEMPLATE_DIR/assumptions/README.md" "$TARGET_DIR/1-discovery/1.5-assumptions-and-tests/README.md"
fi
if [ -f "$TEMPLATE_DIR/evidence/README.md" ]; then
  copy_template "$TEMPLATE_DIR/evidence/README.md" "$TARGET_DIR/1-discovery/1.6-evidence/README.md"
fi
if [ -f "$TEMPLATE_DIR/prd/README.md" ]; then
  copy_template "$TEMPLATE_DIR/prd/README.md" "$TARGET_DIR/2-definition/2.1-prd/README.md"
fi
if [ -f "$TEMPLATE_DIR/design/README.md" ]; then
  copy_template "$TEMPLATE_DIR/design/README.md" "$TARGET_DIR/2-definition/2.2-design/README.md"
fi
if [ -f "$TEMPLATE_DIR/tasks/README.md" ]; then
  copy_template "$TEMPLATE_DIR/tasks/README.md" "$TARGET_DIR/3-delivery/3.1-tasks/README.md"
fi
if [ -f "$TEMPLATE_DIR/qa/README.md" ]; then
  copy_template "$TEMPLATE_DIR/qa/README.md" "$TARGET_DIR/3-delivery/3.2-qa/README.md"
fi
if [ -f "$TEMPLATE_DIR/delivery-metrics/README.md" ]; then
  copy_template "$TEMPLATE_DIR/delivery-metrics/README.md" "$TARGET_DIR/3-delivery/3.3-delivery-metrics/README.md"
fi
if [ -f "$TEMPLATE_DIR/product-analytics/README.md" ]; then
  copy_template "$TEMPLATE_DIR/product-analytics/README.md" "$TARGET_DIR/3-delivery/3.4-product-analytics/README.md"
fi
if [ -f "$TEMPLATE_DIR/launch/README.md" ]; then
  copy_template "$TEMPLATE_DIR/launch/README.md" "$TARGET_DIR/3-delivery/3.5-launch/README.md"
fi

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
echo "  ├── 00-stage-map.md             (Numbered navigation)"
echo "  ├── 0-intake-and-scoping/         (0. Intake and scoping)"
echo "  │   ├── 0.1-odd/opportunity-discovery-doc.md"
echo "  │   ├── 0.2-scoping-artifacts/"
echo "  │   └── 0.3-exec-summary.md"
echo "  ├── 1-discovery/                  (1. Discovery)"
echo "  │   ├── 00-exec-summary.md"
echo "  │   ├── 1.1-discovery-context-and-plan/discovery_context.md"
echo "  │   ├── 1.2-user-interviews/      (snapshots/, synthesis/, transcripts/)"
echo "  │   ├── 1.3-opportunities/"
echo "  │   ├── 1.4-solutions/"
echo "  │   ├── 1.5-assumptions-and-tests/"
echo "  │   └── 1.6-evidence/"
echo "  ├── 2-definition/                 (2. Definition)"
echo "  │   ├── 00-exec-summary.md"
echo "  │   ├── 2.1-prd/"
echo "  │   └── 2.2-design/"
echo "  └── 3-delivery/                  (3. Delivery)"
echo "      ├── 00-exec-summary.md"
echo "      ├── 3.1-tasks/"
echo "      ├── 3.2-qa/"
echo "      ├── 3.3-delivery-metrics/"
echo "      ├── 3.4-product-analytics/"
echo "      └── 3.5-launch/"
echo ""
echo "Next steps:"
echo "  1. Complete the ODD: 0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md"
echo "  2. If scope unclear, run: /scope-problem"
echo "  3. Start discovery: /discovery-workflow"
