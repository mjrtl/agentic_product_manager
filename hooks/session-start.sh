#!/usr/bin/env bash
# Session Start Hook
# Reports active strategy and initiative status when a Claude Code session begins.
#
# Scans the strategy/ and initiatives/ directories and reports
# their current stage progress.

set -euo pipefail

STRATEGY_DIR="strategy"
INITIATIVES_DIR="initiatives"

# --- Strategy scanning ---
if [ -d "$STRATEGY_DIR" ]; then
  strategy_count=$(find "$STRATEGY_DIR" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')

  if [ "$strategy_count" -gt 0 ]; then
    echo "## Strategy workspaces ($strategy_count)"
    echo ""

    for strat_dir in "$STRATEGY_DIR"/*/; do
      [ -d "$strat_dir" ] || continue
      name=$(basename "$strat_dir")
      display_name=$(echo "$name" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

      # Count files in each strategy folder
      vision=$(find "$strat_dir/vision" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
      okrs=$(find "$strat_dir/okrs" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
      prism=$(find "$strat_dir/prism-reviews" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
      team=$(find "$strat_dir/team-structure" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')

      echo "- **$display_name** [vision:$vision okrs:$okrs prism:$prism team:$team]"
    done
    echo ""
  fi
fi

# --- Initiative scanning ---
if [ ! -d "$INITIATIVES_DIR" ]; then
  if [ ! -d "$STRATEGY_DIR" ]; then
    echo "No strategy or initiatives directory found. Use /setup-strategy or /setup-initiative to get started."
  else
    echo "No initiatives directory found. Use /setup-initiative to create your first initiative."
  fi
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

  # Count files in each stage folder.
  # Support both layouts:
  # - Numbered: 1-discovery/, 2-definition/, 3-delivery/
  # - Legacy: discovery/, definition/, delivery/
  if [ -d "$init_dir/1-discovery" ]; then
    snapshots=$(find "$init_dir/1-discovery/1.2-user-interviews/snapshots" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    synthesis=$(find "$init_dir/1-discovery/1.2-user-interviews/synthesis" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    opportunities=$(find "$init_dir/1-discovery/1.3-opportunities" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    solutions=$(find "$init_dir/1-discovery/1.4-solutions" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    assumptions=$(find "$init_dir/1-discovery/1.5-assumptions-and-tests" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    prfaqs=$(find "$init_dir/2-definition/2.1-prd" -name "pr-faq-*.md" 2>/dev/null | wc -l | tr -d ' ')
    prds=$(find "$init_dir/2-definition/2.1-prd" -name "*.md" -not -name "README.md" -not -name "pr-faq-*.md" 2>/dev/null | wc -l | tr -d ' ')
    usm=$(find "$init_dir/2-definition/2.3-user-story-map" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    tasks=$(find "$init_dir/3-delivery/3.1-tasks" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    qa=$(find "$init_dir/3-delivery/3.2-qa" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    dora=$(find "$init_dir/3-delivery/3.3-delivery-metrics" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    launch=$(find "$init_dir/3-delivery/3.5-launch" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
  else
    snapshots=$(find "$init_dir/discovery/user-interviews/snapshots" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    synthesis=$(find "$init_dir/discovery/user-interviews/synthesis" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    opportunities=$(find "$init_dir/discovery/opportunities" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    solutions=$(find "$init_dir/discovery/solutions" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    assumptions=$(find "$init_dir/discovery/assumptions" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    prfaqs=$(find "$init_dir/definition/prd" -name "pr-faq-*.md" 2>/dev/null | wc -l | tr -d ' ')
    prds=$(find "$init_dir/definition/prd" -name "*.md" -not -name "README.md" -not -name "pr-faq-*.md" 2>/dev/null | wc -l | tr -d ' ')
    usm=0
    tasks=$(find "$init_dir/delivery/tasks" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    qa=$(find "$init_dir/delivery/qa" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    dora=$(find "$init_dir/delivery/delivery-metrics" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
    launch=$(find "$init_dir/delivery/launch" -name "*.md" -not -name "README.md" 2>/dev/null | wc -l | tr -d ' ')
  fi

  # Determine current stage (reverse order: latest stage wins)
  if [ "$launch" -gt 0 ]; then
    stage="Launch"
  elif [ "$dora" -gt 0 ]; then
    stage="Delivery Metrics"
  elif [ "$qa" -gt 0 ]; then
    stage="QA"
  elif [ "$tasks" -gt 0 ]; then
    stage="Tasks"
  elif [ "$prds" -gt 0 ]; then
    stage="PRD Complete"
  elif [ "$prfaqs" -gt 0 ]; then
    stage="PR-FAQ Complete"
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
  # Remind to complete 2.3 and DoR before generating tasks when in Definition phase
  if [ "${tasks:-0}" -eq 0 ] && { [ "${prfaqs:-0}" -gt 0 ] || [ "${prds:-0}" -gt 0 ]; }; then
    if [ "${usm:-0}" -eq 0 ]; then
      echo "  → Complete 2.3 User Story Map and run \`/check-dor $name\` before \`/generate-tasks\`."
    else
      echo "  → Run \`/check-dor $name\` before \`/generate-tasks\`."
    fi
  fi
done

echo ""
echo "Use \`/discovery-workflow <name>\` to continue where you left off."
