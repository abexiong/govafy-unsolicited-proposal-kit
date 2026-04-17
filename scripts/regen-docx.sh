#!/usr/bin/env bash
# Govafy Unsolicited Proposal Kit — Regenerate downloads/*.docx from references/*.md
#
# The Markdown files in references/ are the authoritative source. The .docx files
# in downloads/ are downstream renderings produced by pandoc. Whenever a Markdown
# source changes, the corresponding .docx must be regenerated so the two stay in
# sync. Running this script and committing the resulting .docx churn is part of
# every release prep.
#
# The CI sanity check (scripts/sanity-check.sh, Check 6) runs this script and
# then asserts that no .docx files changed under git. If any did, the PR has
# stale .docx files and must be fixed before merging.
#
# Requires: pandoc (https://pandoc.org)
# Run from repo root: ./scripts/regen-docx.sh

set -euo pipefail
cd "$(dirname "$0")/.."

if ! command -v pandoc >/dev/null 2>&1; then
  echo "ERROR: pandoc is not installed. Install with 'brew install pandoc' (macOS) or 'apt-get install pandoc' (Linux)." >&2
  exit 2
fi

# Map every Markdown source to its .docx target. The .docx filenames are
# human-readable (with spaces and parentheses) so we can't derive them
# algorithmically — they're listed explicitly here. Whenever a new sample is
# added, add a line to this map.
declare -a PAIRS=(
  "references/guide.md|downloads/Govafy Guide to Writing Unsolicited Proposals.docx"
  "references/general-samples/01-innovation-rd.md|downloads/General Sample 1 - Innovation and R&D.docx"
  "references/general-samples/02-mission-solution.md|downloads/General Sample 2 - Mission-Solution.docx"
  "references/general-samples/03-crisis-rapid-response.md|downloads/General Sample 3 - Crisis and Rapid-Response.docx"
  "references/specific-samples/01-sentinelmind-dcsa.md|downloads/Specific Sample 1 - SentinelMind (DCSA).docx"
  "references/specific-samples/02-neuroedge-ussocom.md|downloads/Specific Sample 2 - NeuroEdge (USSOCOM).docx"
  "references/specific-samples/03-forgeforward-mcsc.md|downloads/Specific Sample 3 - ForgeForward (MCSC).docx"
  "references/specific-samples/04-fedfacility-iq-gsa-pbs.md|downloads/Specific Sample 4 - FedFacility IQ (GSA PBS).docx"
  "references/specific-samples/05-leadfed-opm.md|downloads/Specific Sample 5 - LeadFed (OPM).docx"
  "references/specific-samples/06-readyrelief-fema.md|downloads/Specific Sample 6 - ReadyRelief (FEMA).docx"
)

for pair in "${PAIRS[@]}"; do
  md="${pair%|*}"
  docx="${pair#*|}"
  if [ ! -f "$md" ]; then
    echo "WARN: source $md does not exist, skipping" >&2
    continue
  fi
  pandoc "$md" -o "$docx" --standalone
  printf "  regenerated: %s\n" "$docx"
done

echo ""
echo "All .docx files regenerated from Markdown source."
