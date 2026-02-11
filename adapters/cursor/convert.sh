#!/usr/bin/env bash
set -euo pipefail

# Cursor Adapter: Convert SKILL.md files to .mdc rules
#
# Usage:
#   ./convert.sh <skills-dir> <output-dir>
#
# Converts each SKILL.md into a .mdc file with Cursor-compatible frontmatter.
# Reference files are appended to the .mdc content.

SKILLS_DIR="${1:?Usage: ./convert.sh <skills-dir> <output-dir>}"
OUTPUT_DIR="${2:?Usage: ./convert.sh <skills-dir> <output-dir>}"

mkdir -p "$OUTPUT_DIR"

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  skill_file="$skill_dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    continue
  fi

  output_file="$OUTPUT_DIR/${skill_name}.mdc"

  # Extract frontmatter fields from SKILL.md
  name=$(sed -n 's/^name: *//p' "$skill_file" | head -1)
  description=$(sed -n '/^description: *>/,/^[a-z]/{ /^description/d; /^[a-z]/d; s/^ *//; p; }' "$skill_file" | tr '\n' ' ' | sed 's/ *$//')

  # If description extraction failed, try single-line format
  if [ -z "$description" ]; then
    description=$(sed -n 's/^description: *//p' "$skill_file" | head -1)
  fi

  # Determine if user-invocable (default: true)
  user_invocable=$(sed -n 's/^user-invocable: *//p' "$skill_file" | head -1)
  if [ "$user_invocable" = "false" ]; then
    always_apply="true"
  else
    always_apply="false"
  fi

  # Get the content after the frontmatter closing ---
  content=$(awk '/^---$/{count++; if(count==2){found=1; next}} found{print}' "$skill_file")

  # Build .mdc file
  cat > "$output_file" << MDCEOF
---
description: ${description}
globs:
alwaysApply: ${always_apply}
---

${content}
MDCEOF

  # Append reference files if they exist
  if [ -d "$skill_dir/references" ]; then
    for ref_file in "$skill_dir"/references/*.md; do
      [ -f "$ref_file" ] || continue
      ref_name=$(basename "$ref_file")
      echo "" >> "$output_file"
      echo "---" >> "$output_file"
      echo "" >> "$output_file"
      echo "## Reference: ${ref_name%.md}" >> "$output_file"
      echo "" >> "$output_file"
      cat "$ref_file" >> "$output_file"
    done
  fi

  echo "  Converted: $skill_name -> ${skill_name}.mdc"
done

echo "  Done. $(find "$OUTPUT_DIR" -name "*.mdc" | wc -l | tr -d ' ') rules created."
