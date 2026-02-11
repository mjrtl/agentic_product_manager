#!/usr/bin/env bash
set -euo pipefail

# Cursor Adapter: Convert skills and agents for Cursor's native format
#
# Usage:
#   ./convert.sh <skills-dir> <agents-dir> <output-base-dir>
#
# Outputs:
#   <output-base-dir>/skills/<name>/SKILL.md   — Skills with transformed frontmatter
#   <output-base-dir>/agents/<name>.md          — Agents with injected YAML frontmatter

SKILLS_DIR="${1:?Usage: ./convert.sh <skills-dir> <agents-dir> <output-base-dir>}"
AGENTS_DIR="${2:?Usage: ./convert.sh <skills-dir> <agents-dir> <output-base-dir>}"
OUTPUT_BASE="${3:?Usage: ./convert.sh <skills-dir> <agents-dir> <output-base-dir>}"

SKILLS_OUT="$OUTPUT_BASE/skills"
AGENTS_OUT="$OUTPUT_BASE/agents"

mkdir -p "$SKILLS_OUT"
mkdir -p "$AGENTS_OUT"

# ---------------------------------------------------------------
# Part A: Skills conversion
# ---------------------------------------------------------------
skill_count=0

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  skill_file="$skill_dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    continue
  fi

  out_skill_dir="$SKILLS_OUT/$skill_name"
  mkdir -p "$out_skill_dir"

  # --- Transform frontmatter ---
  # Split into frontmatter and body
  frontmatter=$(awk '/^---$/{c++; if(c==2) exit; next} c==1{print}' "$skill_file")
  body=$(awk '/^---$/{c++; if(c==2){p=1; next}} p{print}' "$skill_file")

  # Build new frontmatter by filtering and transforming line-by-line
  new_frontmatter=""

  while IFS= read -r line; do
    # Skip argument-hint field
    if [[ "$line" =~ ^argument-hint: ]]; then
      continue
    fi

    # Handle user-invocable -> disable-model-invocation
    if [[ "$line" =~ ^user-invocable:\ *false ]]; then
      new_frontmatter+="disable-model-invocation: true"$'\n'
      continue
    fi
    # Skip user-invocable: true (default behavior, no output needed)
    if [[ "$line" =~ ^user-invocable: ]]; then
      continue
    fi

    # Replace name value with directory name
    if [[ "$line" =~ ^name: ]]; then
      new_frontmatter+="name: $skill_name"$'\n'
      continue
    fi

    # Keep everything else (description and its continuation lines)
    new_frontmatter+="$line"$'\n'
  done <<< "$frontmatter"

  # Write transformed SKILL.md
  {
    echo "---"
    printf '%s' "$new_frontmatter"
    echo "---"
    printf '%s\n' "$body"
  } > "$out_skill_dir/SKILL.md"

  # --- Copy subdirectories (references/, scripts/, templates/, assets/) ---
  for subdir in "$skill_dir"*/; do
    [ -d "$subdir" ] || continue
    subdir_name=$(basename "$subdir")
    cp -r "$subdir" "$out_skill_dir/$subdir_name"
  done

  skill_count=$((skill_count + 1))
  echo "  Converted skill: $skill_name"
done

echo "  $skill_count skills converted to $SKILLS_OUT/"

# ---------------------------------------------------------------
# Part B: Agents conversion
# ---------------------------------------------------------------

# Agent metadata lookup: description and readonly flag
# readonly is a semantic design decision (pm-researcher only reads)
get_agent_meta() {
  local name="$1"
  case "$name" in
    pm-researcher)
      AGENT_DESCRIPTION="Read-only context gatherer for product management workflows."
      AGENT_READONLY="true"
      return 0
      ;;
    pm-writer)
      AGENT_DESCRIPTION="Document creator that enforces writing standards for all PM outputs."
      AGENT_READONLY="false"
      return 0
      ;;
    pm-analyst)
      AGENT_DESCRIPTION="Scoring and evaluation specialist for product management workflows."
      AGENT_READONLY="false"
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

agent_count=0

for agent_file in "$AGENTS_DIR"/*.md; do
  [ -f "$agent_file" ] || continue
  agent_name=$(basename "$agent_file" .md)

  # Only convert known agents
  if ! get_agent_meta "$agent_name"; then
    echo "  Warning: Unknown agent '$agent_name', skipping"
    continue
  fi

  # Write agent file with YAML frontmatter prepended
  {
    echo "---"
    echo "name: $agent_name"
    echo "description: \"$AGENT_DESCRIPTION\""
    echo "readonly: $AGENT_READONLY"
    echo "---"
    echo ""
    cat "$agent_file"
  } > "$AGENTS_OUT/$agent_name.md"

  agent_count=$((agent_count + 1))
  echo "  Converted agent: $agent_name"
done

echo "  $agent_count agents converted to $AGENTS_OUT/"
