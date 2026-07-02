#!/usr/bin/env bash
# Publish sync (maintainer tool): copy vault-sourced public skills into skills/.
#
# Reads skills-manifest.json. For each entry with "source": "vault", copies the
# vault's SKILL.md into skills/[category/]<name>/SKILL.md. Entries with
# "source": "repo" are left untouched (their canonical copy already lives here).
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
while IFS=$'\t' read -r name vaultFile category; do
  src="$TWV_VAULT_SKILLS/$vaultFile"
  if [ ! -f "$src" ]; then
    echo "!! missing in vault: $vaultFile" >&2
    exit 1
  fi
  dest="$ROOT/skills${category:+/$category}/$name"
  mkdir -p "$dest"
  cp "$src" "$dest/SKILL.md"
  echo "synced  $name  <-  $vaultFile"
  synced=$((synced + 1))
done < <(jq -r '.skills[] | select(.source=="vault") | [.name, .vaultFile, (.category // "")] | @tsv' "$MANIFEST")

echo "done: $synced vault-sourced skills synced (repo-native skills untouched)"
