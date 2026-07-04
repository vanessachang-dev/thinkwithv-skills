#!/usr/bin/env bash
# Publish sync (maintainer tool): copy vault-sourced public skills into skills/.
#
# The vault is directory-per-skill (<name>/SKILL.md + optional references/,
# scripts/). Reads skills-manifest.json; for each entry with "source": "vault",
# copies the whole vault skill directory into skills/[category/]<name>/. Entries
# with "source": "repo" are left untouched (their canonical copy lives here).
#
# The vault path is NOT hardcoded — this keeps the public repo free of local
# paths. Point it at your vault Skills directory before running:
#
#   export TWV_VAULT_SKILLS="$HOME/Documents/Obsidian/.../4. Library/AI OS/Skills"
#   bash scripts/sync-from-vault.sh
#
# Idempotent: re-running with an unchanged vault produces no diff. Run it, then
# `git status` to see what drifted.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$ROOT/skills-manifest.json"
: "${TWV_VAULT_SKILLS:?Set TWV_VAULT_SKILLS to your vault Skills directory}"

synced=0
while IFS=$'\t' read -r name category; do
  src="$TWV_VAULT_SKILLS/$name"
  if [ ! -f "$src/SKILL.md" ]; then
    echo "!! missing in vault: $name/SKILL.md" >&2
    exit 1
  fi
  dest="$ROOT/skills${category:+/$category}/$name"
  rm -rf "$dest"
  mkdir -p "$dest"
  cp -R "$src/." "$dest/"
  # Don't publish internal/dev artifacts (revert archives, caches, OS cruft).
  rm -rf "$dest/_archive"
  find "$dest" -type d -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true
  find "$dest" -name '.DS_Store' -delete 2>/dev/null || true
  echo "synced  $name  <-  $name/"
  synced=$((synced + 1))
done < <(jq -r '.skills[] | select(.source=="vault") | [.name, (.category // "")] | @tsv' "$MANIFEST")

echo "done: $synced vault-sourced skills synced (repo-native skills untouched)"
