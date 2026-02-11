#!/usr/bin/env bash
# Session Start Hook
# Reports active initiative status when a Claude Code session begins.
#
# Scans the initiatives/ directory for active initiatives and reports
# their current discovery stage progress.

set -euo pipefail

INITIATIVES_DIR="initiatives"

if [ ! -d "$INITIATIVES_DIR" ]; then
  echo "No initiatives directory found. Use /setup-initiative to create your first initiative."
  exit 0
fi

# Count initiatives
initiative_count=$(find "$INITIATIVES_DIR" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')

if [ "$initiative_count" -eq 0 ]; then
  echo "No active initiatives. Use /setup-initiative to create one."
  exit 0
fi

echo "## Active initiatives ($initiative_count)"
echo ""

for init_dir in "$INITIATIVES_DIR"/*/; do
  [ -d "$init_dir" ] || continue
  name=$(basename "$init_dir")
  display_name=$(echo "$name" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

  # Count files in each stage folder
  snapshots=$(find "$init_dir/user-interviews/snapshots" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
  synthesis=$(find "$init_dir/user-interviews/synthesis" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
  opportunities=$(find "$init_dir/opportunities" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
  solutions=$(find "$init_dir/solutions" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
  assumptions=$(find "$init_dir/assumptions" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
  prds=$(find "$init_dir/prd" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
  tasks=$(find "$init_dir/tasks" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')

  # Determine current stage
  if [ "$tasks" -gt 0 ]; then
    stage="Tasks"
  elif [ "$prds" -gt 0 ]; then
    stage="PRD Complete"
  elif [ "$assumptions" -gt 0 ]; then
    stage="Testing Assumptions"
  elif [ "$solutions" -gt 0 ]; then
    stage="Solutions"
  elif [ "$opportunities" -gt 0 ]; then
    stage="Opportunities"
  elif [ "$synthesis" -gt 0 ]; then
    stage="Synthesis"
  elif [ "$snapshots" -gt 0 ]; then
    stage="Snapshots ($snapshots)"
  else
    stage="Setup"
  fi

  echo "- **$display_name** [$stage]"
done

echo ""
echo "Use \`/discovery-workflow <name>\` to continue where you left off."
