#!/usr/bin/env bash
set -euo pipefail

# Agentic Product Manager Installer
# Installs PM skills and tools for Claude Code, Cursor, or OpenCode.
#
# Usage:
#   ./install.sh --claude-code --project /path/to/project
#   ./install.sh --cursor --project /path/to/project
#   ./install.sh --opencode --project /path/to/project
#   ./install.sh --claude-code --global
#
# Flags:
#   --claude-code   Install for Claude Code
#   --cursor        Install for Cursor
#   --opencode      Install for OpenCode
#   --project PATH  Install into a specific project directory
#   --global        Install globally (platform-specific location)
#   --help          Show this help message

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PLATFORM=""
TARGET=""
SCOPE=""

usage() {
  echo "Agentic Product Manager Installer"
  echo ""
  echo "Usage:"
  echo "  ./install.sh --claude-code --project /path/to/project"
  echo "  ./install.sh --cursor --project /path/to/project"
  echo "  ./install.sh --opencode --project /path/to/project"
  echo "  ./install.sh --claude-code --global"
  echo ""
  echo "Platforms:"
  echo "  --claude-code   Install for Claude Code (skills + agents + hooks + CLAUDE.md)"
  echo "  --cursor        Install for Cursor (skills + agents in .cursor/)"
  echo "  --opencode      Install for OpenCode (copies skills + generates AGENTS.md)"
  echo ""
  echo "Scope:"
  echo "  --project PATH  Install into a specific project directory"
  echo "  --global        Install globally (Claude Code: ~/.claude, Cursor: ~/.cursor)"
  echo ""
  echo "Options:"
  echo "  --help          Show this help message"
  exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --claude-code)
      PLATFORM="claude-code"
      shift
      ;;
    --cursor)
      PLATFORM="cursor"
      shift
      ;;
    --opencode)
      PLATFORM="opencode"
      shift
      ;;
    --project)
      SCOPE="project"
      TARGET="$2"
      shift 2
      ;;
    --global)
      SCOPE="global"
      shift
      ;;
    --help|-h)
      usage
      ;;
    *)
      echo "Unknown option: $1"
      echo "Run './install.sh --help' for usage."
      exit 1
      ;;
  esac
done

# Validate inputs
if [ -z "$PLATFORM" ]; then
  echo "Error: No platform specified. Use --claude-code, --cursor, or --opencode."
  echo "Run './install.sh --help' for usage."
  exit 1
fi

if [ -z "$SCOPE" ]; then
  echo "Error: No scope specified. Use --project PATH or --global."
  echo "Run './install.sh --help' for usage."
  exit 1
fi

# Resolve global paths
if [ "$SCOPE" = "global" ]; then
  case "$PLATFORM" in
    claude-code)
      TARGET="$HOME/.claude"
      ;;
    cursor)
      TARGET="$HOME/.cursor"
      ;;
    opencode)
      TARGET="$HOME/.opencode"
      ;;
  esac
fi

if [ ! -d "$TARGET" ] && [ "$SCOPE" = "project" ]; then
  echo "Error: Project directory '$TARGET' does not exist."
  exit 1
fi

echo "Installing Agentic Product Manager"
echo "  Platform: $PLATFORM"
echo "  Scope:    $SCOPE"
echo "  Target:   $TARGET"
echo ""

# -------------------------------------------------------------------
# Claude Code installation
# -------------------------------------------------------------------
install_claude_code() {
  local dest="$1"

  echo "Installing for Claude Code..."

  # Copy skills
  echo "  Copying skills..."
  mkdir -p "$dest/skills"
  cp -r "$SCRIPT_DIR/skills/"* "$dest/skills/"

  # Copy shared materials
  echo "  Copying shared materials..."
  mkdir -p "$dest/_shared"
  cp -r "$SCRIPT_DIR/_shared/"* "$dest/_shared/"

  # Copy agents
  echo "  Copying agents..."
  mkdir -p "$dest/agents"
  cp -r "$SCRIPT_DIR/agents/"* "$dest/agents/"

  # Copy hooks
  echo "  Copying hooks..."
  mkdir -p "$dest/hooks"
  cp -r "$SCRIPT_DIR/hooks/"* "$dest/hooks/"
  chmod +x "$dest/hooks/"*.sh

  # Copy workflows
  echo "  Copying workflows..."
  mkdir -p "$dest/workflows"
  cp -r "$SCRIPT_DIR/workflows/"* "$dest/workflows/"

  # Install CLAUDE.md
  echo "  Installing CLAUDE.md..."
  if [ -f "$dest/CLAUDE.md" ]; then
    echo "    CLAUDE.md already exists. Merging..."
    echo "" >> "$dest/CLAUDE.md"
    echo "<!-- BEGIN: Agentic Product Manager -->" >> "$dest/CLAUDE.md"
    cat "$SCRIPT_DIR/adapters/claude-code/CLAUDE.md" >> "$dest/CLAUDE.md"
    echo "<!-- END: Agentic Product Manager -->" >> "$dest/CLAUDE.md"
  else
    cp "$SCRIPT_DIR/adapters/claude-code/CLAUDE.md" "$dest/CLAUDE.md"
  fi

  # Install settings.json (merge if exists)
  if [ -f "$dest/.claude/settings.json" ]; then
    echo "  settings.json already exists. Please merge manually from claude/settings.json"
  else
    mkdir -p "$dest/.claude"
    cp "$SCRIPT_DIR/adapters/claude-code/settings.json" "$dest/.claude/settings.json"
  fi

  # Install rules
  echo "  Installing rules..."
  mkdir -p "$dest/.claude/rules"
  cp "$SCRIPT_DIR/adapters/claude-code/rules/pm-conventions.md" "$dest/.claude/rules/pm-conventions.md"

  # Make setup-initiative script executable
  if [ -f "$dest/skills/setup-initiative/scripts/setup-initiative.sh" ]; then
    chmod +x "$dest/skills/setup-initiative/scripts/setup-initiative.sh"
  fi

  echo ""
  echo "Claude Code installation complete!"
  echo ""
  echo "Available commands:"
  echo "  /prd                    Create a Product Requirements Document"
  echo "  /one-pager              Create a decision-focused 1-Pager"
  echo "  /ice-score              Score an idea with ICE framework"
  echo "  /prism-review           Run a PRISM strategy review"
  echo "  /vision-review          Score a product vision"
  echo "  /okr-coach              OKR sparring partner"
  echo "  /interview-snapshot     Create an interview snapshot"
  echo "  /synthesize-interviews  Synthesize interview patterns"
  echo "  /create-opportunities   Extract opportunities from research"
  echo "  /generate-solutions     AI-human collaborative ideation"
  echo "  /test-assumptions       Identify and test assumptions"
  echo "  /setup-initiative       Scaffold a new initiative"
  echo "  /generate-tasks         Create task list from requirements"
  echo "  /process-tasks          Work through tasks one by one"
  echo "  /design-brief           Create a design brief"
  echo "  /figma-prompt           Generate Figma Make prompt"
  echo "  /team-structure         Org design guidance"
  echo "  /meeting-notes          Capture 1:1 meeting notes"
  echo "  /discovery-workflow     Full CDH pipeline orchestrator"
}

# -------------------------------------------------------------------
# Cursor installation
# -------------------------------------------------------------------
install_cursor() {
  local dest="$1"

  echo "Installing for Cursor..."

  # Remove legacy .cursor/rules/ if present (migration from old adapter)
  if [ -d "$dest/.cursor/rules" ]; then
    echo "  Removing legacy .cursor/rules/..."
    rm -rf "$dest/.cursor/rules"
  fi

  # Copy shared materials (needed by skills)
  echo "  Copying shared materials..."
  mkdir -p "$dest/_shared"
  cp -r "$SCRIPT_DIR/_shared/"* "$dest/_shared/"

  # Convert skills and agents using the Cursor adapter
  echo "  Converting skills and agents..."
  bash "$SCRIPT_DIR/adapters/cursor/convert.sh" \
    "$SCRIPT_DIR/skills" \
    "$SCRIPT_DIR/agents" \
    "$dest/.cursor"

  echo ""
  echo "Cursor installation complete!"
  echo "  Skills installed to: $dest/.cursor/skills/"
  echo "  Agents installed to: $dest/.cursor/agents/"
  echo "  Shared materials: $dest/_shared/"
  echo ""
  echo "Example commands (type / in Cursor to invoke):"
  echo "  /setup-initiative    Scaffold a new initiative"
  echo "  /prd                 Create a Product Requirements Document"
  echo "  /ice-score           Score an idea with ICE framework"
  echo "  /discovery-workflow  Full CDH pipeline orchestrator"
}

# -------------------------------------------------------------------
# OpenCode installation
# -------------------------------------------------------------------
install_opencode() {
  local dest="$1"

  echo "Installing for OpenCode..."

  # Use the OpenCode adapter
  mkdir -p "$dest/.opencode/skills"

  # Copy shared materials
  echo "  Copying shared materials..."
  mkdir -p "$dest/_shared"
  cp -r "$SCRIPT_DIR/_shared/"* "$dest/_shared/"

  # Copy skills and generate AGENTS.md
  echo "  Copying skills and generating AGENTS.md..."
  bash "$SCRIPT_DIR/adapters/opencode/convert.sh" "$SCRIPT_DIR/skills" "$dest/.opencode/skills" "$dest"

  echo ""
  echo "OpenCode installation complete!"
  echo "  Skills installed to: $dest/.opencode/skills/"
  echo "  AGENTS.md generated at: $dest/AGENTS.md"
}

# -------------------------------------------------------------------
# Run installation
# -------------------------------------------------------------------
case "$PLATFORM" in
  claude-code)
    install_claude_code "$TARGET"
    ;;
  cursor)
    install_cursor "$TARGET"
    ;;
  opencode)
    install_opencode "$TARGET"
    ;;
esac
