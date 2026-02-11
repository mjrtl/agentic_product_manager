#!/usr/bin/env bash
set -euo pipefail

# OpenCode Adapter: Copy skills and generate AGENTS.md
#
# Usage:
#   ./convert.sh <skills-dir> <output-dir> <project-root>
#
# Copies SKILL.md files and references to the OpenCode skills directory
# and generates an AGENTS.md file at the project root.

SKILLS_DIR="${1:?Usage: ./convert.sh <skills-dir> <output-dir> <project-root>}"
OUTPUT_DIR="${2:?Usage: ./convert.sh <skills-dir> <output-dir> <project-root>}"
PROJECT_ROOT="${3:?Usage: ./convert.sh <skills-dir> <output-dir> <project-root>}"

mkdir -p "$OUTPUT_DIR"

# Copy each skill directory
for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  dest="$OUTPUT_DIR/$skill_name"

  mkdir -p "$dest"
  cp -r "$skill_dir"/* "$dest/" 2>/dev/null || true

  echo "  Copied: $skill_name"
done

# Generate AGENTS.md
AGENTS_FILE="$PROJECT_ROOT/AGENTS.md"

cat > "$AGENTS_FILE" << 'AGENTSEOF'
# PM Agent Skills - Multi-Agent Discovery

This project contains 20 agent skills for Product Managers plus shared reference materials.

## Skills

AGENTSEOF

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  skill_file="$skill_dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    continue
  fi

  # Extract name and description
  name=$(sed -n 's/^name: *//p' "$skill_file" | head -1)
  description=$(sed -n '/^description: *>/,/^[a-z]/{ /^description/d; /^[a-z]/d; s/^ *//; p; }' "$skill_file" | tr '\n' ' ' | sed 's/ *$//')
  if [ -z "$description" ]; then
    description=$(sed -n 's/^description: *//p' "$skill_file" | head -1)
  fi

  # Extract user-invocable status
  user_invocable=$(sed -n 's/^user-invocable: *//p' "$skill_file" | head -1)

  # Build trigger text
  if [ "$user_invocable" = "false" ]; then
    trigger="Auto-loaded when PM work is detected"
  else
    trigger="\"/$skill_name\""
  fi

  cat >> "$AGENTS_FILE" << EOF
### $name
- **Path**: \`.opencode/skills/$skill_name/SKILL.md\`
- **Trigger**: $trigger
- **Description**: $description

EOF
done

# Add shared references section
cat >> "$AGENTS_FILE" << 'SHAREDEOF'
## Shared References

- `_shared/writing-standards.md` - Writing style guide and banned words list
- `_shared/meeting-notes-guide.md` - 1:1 meeting notes format
SHAREDEOF

echo "  Generated: AGENTS.md"
echo "  Done. $(find "$OUTPUT_DIR" -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' ') skills copied."
