#!/usr/bin/env bash
#
# import-skill.sh — Import skills from skills.sh into this repo's skills/ directory
#
# Usage:
#   ./import-skill.sh <repo-url> [--skill <name>] [--yes]
#
# Examples:
#   ./import-skill.sh https://github.com/vercel-labs/skills --skill find-skills
#   ./import-skill.sh https://github.com/anthropics/skills --skill skill-creator
#   ./import-skill.sh https://github.com/some-org/repo    # all skills from repo
#
# This wraps `npx skills add` so that imported skills land in skills/ as real
# directories (not symlinks), then cleans up .agents/ and all agent-specific
# symlink directories that `npx skills add` creates.

set -euo pipefail

# --- Config ---

SKILLS_DIR="skills"

# Agent-specific directories that `npx skills add` creates (symlinks into .agents/)
AGENT_DIRS=(
  .claude .cursor .agent .cline .codebuddy .commandcode .continue .crush
  .factory .goose .junie .kilocode .kiro .kode .mcpjam .mux .neovate
  .openhands .pi .pochi .qoder .qwen .roo .trae .windsurf .zencoder
)

# --- Parse args ---

REPO_URL=""
SKILL_NAME=""
AUTO_YES=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skill)
      SKILL_NAME="$2"
      shift 2
      ;;
    --yes|-y)
      AUTO_YES=true
      shift
      ;;
    -h|--help)
      sed -n '3,16p' "$0" | sed 's/^# \?//'
      exit 0
      ;;
    *)
      if [[ -z "$REPO_URL" ]]; then
        REPO_URL="$1"
      else
        echo "Error: unexpected argument: $1" >&2
        exit 1
      fi
      shift
      ;;
  esac
done

if [[ -z "$REPO_URL" ]]; then
  echo "Error: repository URL is required" >&2
  echo "Usage: ./import-skill.sh <repo-url> [--skill <name>] [--yes]" >&2
  exit 1
fi

# --- Run npx skills add ---

echo "Downloading skill(s) from $REPO_URL..."

NPX_ARGS=("skills" "add" "$REPO_URL")
if [[ -n "$SKILL_NAME" ]]; then
  NPX_ARGS+=("--skill" "$SKILL_NAME")
fi

npx "${NPX_ARGS[@]}"

# --- Copy from .agents/skills/ to skills/ ---

if [[ ! -d ".agents/skills" ]]; then
  echo "Error: .agents/skills/ not found after download. Did npx skills add succeed?" >&2
  exit 1
fi

imported=()

for skill_dir in .agents/skills/*/; do
  name="$(basename "$skill_dir")"
  dest="$SKILLS_DIR/$name"

  if [[ -d "$dest" ]] || [[ -L "$dest" ]]; then
    if [[ "$AUTO_YES" != true ]]; then
      printf "Skill '%s' already exists in %s. Overwrite? [y/N] " "$name" "$SKILLS_DIR"
      read -r answer
      if [[ ! "$answer" =~ ^[Yy]$ ]]; then
        echo "  Skipped $name"
        continue
      fi
    fi
    rm -rf "$dest"
  fi

  cp -R "$skill_dir" "$dest"
  # Remove symlink if skills add created one pointing to .agents/
  if [[ -L "$dest" ]]; then
    real_path="$(readlink "$dest")"
    rm "$dest"
    cp -R "$real_path" "$dest"
  fi
  imported+=("$name")
done

# --- Clean up .agents/ ---

rm -rf .agents/

# --- Clean up agent-specific directories ---

for dir in "${AGENT_DIRS[@]}"; do
  if [[ -d "$dir" ]]; then
    rm -rf "$dir"
  fi
done

# --- Summary ---

echo ""
if [[ ${#imported[@]} -eq 0 ]]; then
  echo "No skills imported (all skipped)."
else
  echo "Imported ${#imported[@]} skill(s) into $SKILLS_DIR/:"
  for name in "${imported[@]}"; do
    echo "  $SKILLS_DIR/$name/"
  done
fi

echo ""
echo "Cleaned up .agents/ and agent-specific directories."
