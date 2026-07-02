#!/usr/bin/env bash
# Build one zip per skill from skills/.
#
# Each skill is a directory containing a SKILL.md, at any depth under skills/
# (e.g. skills/fable-prompt-builder/ or skills/critical-thinking/distinguish/).
# The archive holds a top-level <skill>/ folder so it unzips cleanly into
# ~/.claude/skills/<skill>/ regardless of the source category.
#
# Usage: bash scripts/build-zips.sh   →   writes dist/<skill>.zip for each skill
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"
rm -rf "$DIST"
mkdir -p "$DIST"

find "$ROOT/skills" -type f -name SKILL.md -print0 | while IFS= read -r -d '' skillmd; do
  dir="$(dirname "$skillmd")"
  name="$(basename "$dir")"
  parent="$(dirname "$dir")"
  ( cd "$parent" && zip -rq "$DIST/$name.zip" "$name" -x "*.DS_Store" )
  echo "built dist/$name.zip"
done

ls -la "$DIST"
