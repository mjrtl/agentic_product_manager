#!/usr/bin/env bash
# Writing Standards Check Hook
# Checks for banned words and phrases when .md files are written
# inside initiative directories.
#
# Usage: Called as a Claude Code hook on file write events.
# Expects the file path as the first argument.

set -euo pipefail

FILE_PATH="${1:-}"

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Only check .md files in initiatives/ directory
case "$FILE_PATH" in
  initiatives/*.md|initiatives/**/*.md) ;;
  *) exit 0 ;;
esac

# Skip README files
case "$FILE_PATH" in
  */README.md) exit 0 ;;
esac

if [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

ISSUES=()

# Banned words check (case-insensitive)
banned_words=(
  "utilize" "leverage" "facilitate" "commence" "delve"
  "robust" "seamless" "seamlessly" "performant" "innovative"
  "game-changing" "disrupt" "disruptive" "battle tested"
  "blazing fast" "lightning fast" "mission-critical"
  "best practices" "out of the box" "cognitive load"
  "business logic" "agile"
)

for word in "${banned_words[@]}"; do
  if grep -qi "$word" "$FILE_PATH" 2>/dev/null; then
    ISSUES+=("Banned word found: \"$word\"")
  fi
done

# Banned phrases check
banned_phrases=(
  "I think" "I believe" "we believe" "it seems"
  "sort of" "kind of" "pretty much"
  "we're excited" "today, we're excited"
  "the future of" "we obsess over"
  "let's dive" "in conclusion" "to summarize"
  "hope this helps"
)

for phrase in "${banned_phrases[@]}"; do
  if grep -qi "$phrase" "$FILE_PATH" 2>/dev/null; then
    ISSUES+=("Banned phrase found: \"$phrase\"")
  fi
done

# Check for em dashes (Unicode U+2014)
if grep -q '—' "$FILE_PATH" 2>/dev/null; then
  ISSUES+=("Em dash found; use semicolons, commas, or sentence breaks instead")
fi

# Check for smart quotes
if grep -qP '[\x{201C}\x{201D}\x{2018}\x{2019}]' "$FILE_PATH" 2>/dev/null; then
  ISSUES+=("Smart quotes found; use straight quotes or backtick quotes instead")
fi

if [ ${#ISSUES[@]} -gt 0 ]; then
  echo "## Writing standards issues in $(basename "$FILE_PATH")"
  echo ""
  for issue in "${ISSUES[@]}"; do
    echo "- $issue"
  done
  echo ""
  echo "Review \`_shared/writing-standards.md\` for alternatives."
fi
