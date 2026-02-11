#!/usr/bin/env bash
set -euo pipefail

# Sync Agentic Product Manager into Keyrock AI workspace.
# Run this from the agentic_product_manager repo root after making changes
# so that keyrock_ai_workspace gets the latest skills, agents, _shared, and workflows.
#
# Usage:
#   ./sync-to-keyrock-workspace.sh
#   KEYROCK_AI_WORKSPACE=/other/path ./sync-to-keyrock-workspace.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KEYROCK_AI_WORKSPACE="${KEYROCK_AI_WORKSPACE:-/Users/mark.lawson/Projects/keyrock/keyrock_ai_workspace}"

if [ ! -d "$KEYROCK_AI_WORKSPACE" ]; then
  echo "Error: Keyrock AI workspace not found at: $KEYROCK_AI_WORKSPACE"
  echo "Set KEYROCK_AI_WORKSPACE to override."
  exit 1
fi

echo "Syncing Agentic Product Manager → Keyrock AI workspace"
echo "  Source: $SCRIPT_DIR"
echo "  Target: $KEYROCK_AI_WORKSPACE"
echo ""

"$SCRIPT_DIR/install.sh" --cursor --project "$KEYROCK_AI_WORKSPACE"

echo ""
echo "Sync complete. initiatives/ and strategy/ in the workspace were not modified."
