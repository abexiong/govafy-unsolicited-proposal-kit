#!/usr/bin/env bash
# Govafy Unsolicited Proposal Kit — Sync root skill into plugin subfolder
#
# The kit ships in two install formats from the same repo:
#
#   1. Skill format:  users git-clone into ~/.claude/skills/  — reads SKILL.md
#                     and references/ from the REPO ROOT.
#
#   2. Plugin format: users /plugin install via a marketplace — reads SKILL.md
#                     and references/ from skills/govafy-unsolicited-proposal-kit/
#                     (Claude Code's plugin spec expects skills at
#                     skills/<skill-name>/SKILL.md inside the plugin).
#
# Root-level SKILL.md and references/ are the authoritative source. This script
# mirrors them into the plugin subfolder so the two install paths ship the
# same content. Run this after any edit to root SKILL.md or references/.
# Check 7 in scripts/sanity-check.sh runs this script and asserts no drift.

set -euo pipefail
cd "$(dirname "$0")/.."

PLUGIN_SKILL_DIR="skills/govafy-unsolicited-proposal-kit"

mkdir -p "$PLUGIN_SKILL_DIR"

# Copy root SKILL.md over the plugin copy (-p preserves mtime; helps drift detection)
cp -p SKILL.md "$PLUGIN_SKILL_DIR/SKILL.md"

# Mirror references/ tree. Using rsync if available (cleaner), else cp -R.
if command -v rsync >/dev/null 2>&1; then
  rsync -a --delete references/ "$PLUGIN_SKILL_DIR/references/"
else
  rm -rf "$PLUGIN_SKILL_DIR/references"
  cp -Rp references "$PLUGIN_SKILL_DIR/references"
fi

echo "Plugin skill folder synced from root:"
echo "  SKILL.md          -> $PLUGIN_SKILL_DIR/SKILL.md"
echo "  references/       -> $PLUGIN_SKILL_DIR/references/"
