#!/usr/bin/env bash
# Govafy Unsolicited Proposal Kit — Sanity Check
#
# Catches the regressions that shipped between v1.0.0 and v1.2.1:
#   1. Appendix F checkbox count drifts from the claim ("30 items" / "35 items")
#   2. A new sample is added without updating the fictional-data marker file
#   3. SKILL.md / AGENTS.md / README.md cite a guide section that doesn't match the guide
#   4. Stale "three-mode" boilerplate sneaks back in
#
# Run from the repo root: ./scripts/sanity-check.sh
# Exit code 0 = all checks pass. Non-zero = at least one check failed.

set -u
cd "$(dirname "$0")/.." || exit 2

FAIL=0
pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; }
fail() { printf "  \033[31m✗\033[0m %s\n" "$1"; FAIL=$((FAIL + 1)); }
section() { printf "\n\033[1m== %s ==\033[0m\n" "$1"; }

# ---------------------------------------------------------------------------
section "Check 1 — Appendix F checkbox count matches every claim"
# ---------------------------------------------------------------------------
ACTUAL=$(grep -c "^- \[ \]" references/guide.md || echo 0)
echo "  Actual Appendix F checkbox count: $ACTUAL"

if grep -rqE "(30|31|32|33|34) items" references/workflows/ SKILL.md AGENTS.md README.md .cursor 2>/dev/null; then
  fail "Found stale Appendix F count (anything other than $ACTUAL):"
  grep -rnE "(30|31|32|33|34) items" references/workflows/ SKILL.md AGENTS.md README.md .cursor 2>/dev/null | sed 's/^/    /'
else
  pass "No stale Appendix F counts found"
fi

if grep -rq "$ACTUAL items" references/workflows/ 2>/dev/null; then
  pass "At least one workflow file references the correct count ($ACTUAL items)"
else
  fail "No workflow file references the actual count of $ACTUAL items"
fi

# ---------------------------------------------------------------------------
section "Check 2 — Every sample's fictional company name is in the marker file"
# ---------------------------------------------------------------------------
MARKER_FILE="references/workflows/fictional-data-markers.md"
if [ ! -f "$MARKER_FILE" ]; then
  fail "Marker file $MARKER_FILE does not exist"
else
  for sample in references/general-samples/*.md references/specific-samples/*.md; do
    # Pull the company name from the title page (UPPERCASE block immediately after [TITLE PAGE])
    company=$(awk '/\[TITLE PAGE\]/{flag=1; next} flag && /^\*\*[A-Z]/ {gsub(/\*\*/, ""); print; exit}' "$sample")
    company_short=$(echo "$company" | sed -E 's/, (Inc|LLC|LLP)\.?$//')
    if [ -z "$company" ]; then
      fail "Could not parse company name from $sample"
      continue
    fi
    if grep -qiF "$company_short" "$MARKER_FILE"; then
      pass "$sample → '$company_short' is in marker file"
    else
      fail "$sample → '$company_short' is NOT in $MARKER_FILE"
    fi
  done
fi

# ---------------------------------------------------------------------------
section "Check 3 — Eligibility test section number is consistent"
# ---------------------------------------------------------------------------
# The guide's TOC must match what SKILL.md / AGENTS.md / README.md cite.
# Pull the section number from the guide's TOC line for the eligibility test.
# Portable across BSD awk (macOS) and GNU awk (Linux).
GUIDE_ELIG_SECTION=$(grep -E "^\*\*Section [0-9]+\.\*\* The Six-Part Eligibility Test" references/guide.md \
  | head -1 \
  | sed -E 's/^\*\*Section ([0-9]+)\..*/\1/')
echo "  Guide TOC places eligibility test in Section: $GUIDE_ELIG_SECTION"

for f in SKILL.md AGENTS.md README.md; do
  if grep -qE "Section $GUIDE_ELIG_SECTION[^0-9].*(eligibility|six-part)" "$f"; then
    pass "$f cites Section $GUIDE_ELIG_SECTION for the eligibility test"
  else
    if grep -qE "Section [0-9]+[^0-9].*(eligibility|six-part)" "$f"; then
      fail "$f cites the WRONG section for the eligibility test (should be Section $GUIDE_ELIG_SECTION):"
      grep -nE "Section [0-9]+[^0-9].*(eligibility|six-part)" "$f" | sed 's/^/    /'
    fi
  fi
done

# ---------------------------------------------------------------------------
section "Check 4 — No stale 'three-mode' boilerplate"
# ---------------------------------------------------------------------------
if grep -rqE "three-mode|three modes|all three modes" references/ SKILL.md AGENTS.md README.md .cursor 2>/dev/null; then
  fail "Found stale 'three-mode' references (Mode 4 was added in v1.1.0 — should be 'four-mode'):"
  grep -rnE "three-mode|three modes|all three modes" references/ SKILL.md AGENTS.md README.md .cursor 2>/dev/null | sed 's/^/    /'
else
  pass "No stale 'three-mode' references found"
fi

# ---------------------------------------------------------------------------
section "Check 5 — No phantom 'acme.example' marker"
# ---------------------------------------------------------------------------
# acme.example was an artifact of an early grep list; no actual sample uses it.
if grep -rqF "acme.example" references/workflows/ 2>/dev/null; then
  fail "Found 'acme.example' in a workflow file — this is a phantom marker (no sample uses it):"
  grep -rnF "acme.example" references/workflows/ 2>/dev/null | sed 's/^/    /'
else
  pass "No phantom 'acme.example' marker found"
fi

# ---------------------------------------------------------------------------
section "Check 6 — downloads/*.docx are in sync with their .md source"
# ---------------------------------------------------------------------------
# Compare the text content of each .docx against the text content of its .md
# source. We compare TEXT (not bytes) because pandoc embeds timestamps inside
# the .docx zip archive — byte-comparison would false-positive on every run.
# The check tolerates whitespace differences so .docx structural formatting
# doesn't cause noise; what matters is that the words are identical.
if ! command -v pandoc >/dev/null 2>&1; then
  fail "pandoc is not installed — cannot verify .docx files are in sync"
else
  declare -a CHECK_PAIRS=(
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
  TMP_DIR=$(mktemp -d)
  trap 'rm -rf "$TMP_DIR"' EXIT
  for pair in "${CHECK_PAIRS[@]}"; do
    md="${pair%|*}"
    docx="${pair#*|}"
    if [ ! -f "$md" ]; then
      fail "Source $md is missing"
      continue
    fi
    if [ ! -f "$docx" ]; then
      fail "Target $docx is missing — run scripts/regen-docx.sh"
      continue
    fi
    # Extract text from both sides and reduce to lowercase alphanumeric tokens
    # only — strip ALL formatting (punctuation, em-dashes, table borders, smart
    # quotes, capitalization). This makes the comparison invariant to pandoc
    # version differences (Ubuntu apt pandoc vs Homebrew pandoc render text
    # subtly differently). What we care about is: do the two documents contain
    # the same words in the same order?
    normalize_text() {
      pandoc "$1" -t plain --wrap=none 2>/dev/null \
        | tr '[:upper:]' '[:lower:]' \
        | tr -c 'a-z0-9\n' ' ' \
        | tr -s '[:space:]' ' ' \
        | sed 's/^ //; s/ $//'
    }
    normalize_text "$md"   > "$TMP_DIR/from-md.txt"
    normalize_text "$docx" > "$TMP_DIR/from-docx.txt"
    if diff -q "$TMP_DIR/from-md.txt" "$TMP_DIR/from-docx.txt" >/dev/null 2>&1; then
      pass "$(basename "$docx") matches $(basename "$md")"
    else
      fail "$(basename "$docx") is stale relative to $(basename "$md") — run scripts/regen-docx.sh and commit the result"
    fi
  done
fi

# ---------------------------------------------------------------------------
echo ""
if [ "$FAIL" -eq 0 ]; then
  printf "\033[32mAll sanity checks passed.\033[0m\n"
  exit 0
else
  printf "\033[31m%d sanity check(s) failed.\033[0m\n" "$FAIL"
  exit 1
fi
