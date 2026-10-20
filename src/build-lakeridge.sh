#!/usr/bin/env bash
# Regenerate the four Lakeridge workpaper pages from Markdown.
# Run from the repository root: bash src/build-lakeridge.sh
set -euo pipefail
cd "$(dirname "$0")/.."

# build NAME "Page title" "Meta description (<155 chars)" "Open Graph title" "Open Graph description"
# Values are passed with --variable so pandoc does not line-wrap them. They are inserted
# as written, so avoid double quotes and & in them.
build () {
  local name="$1" title="$2" desc="$3" og_title="$4" og_desc="$5"
  pandoc "src/$name.md" -f gfm-tex_math_dollars -t html5 \
    --template=src/doc-template.html \
    --metadata pagetitle="$title" \
    --variable page-description="$desc" \
    --variable og-title="$og_title" \
    --variable og-description="$og_desc" \
    --variable og-page="$name.html" \
    -o "lakeridge/$name.html"
  # Wrap tables so they scroll sideways on phones
  sed -i 's#<table>#<div class="tbl"><table>#g; s#</table>#</table></div>#g' "lakeridge/$name.html"
}

build scoping-memo "IT-100 Scoping memo" \
  "Simulated ITGC scoping memo for an Ontario credit union: \$550K materiality, scope set by audit reliance, and each exclusion tied to a covering control." \
  "IT-100 Scoping memo" \
  "Materiality, what the audit relies on, and every scoping exclusion paired with the control that covers it, for a simulated credit union ITGC engagement."
build cuec-analysis "IT-200 CUEC analysis" \
  "Simulated SOC 1 Type II review under CAS 402: 19 CUECs mapped, 11 of 15 relevant failing at design, and no reliance on 3 of 5 control objectives." \
  "IT-200 SOC 1 and CUEC analysis" \
  "A SOC 1 Type II read as a user auditor under CAS 402, with all 19 complementary user entity controls mapped and two report exceptions traced back to the client."
build change-management-workpaper "IT-320 Change management" \
  "Simulated change management test: 10 of 25 approvals had no evidence, and 4 of 10 changes traced back from system logs had no ticket at all." \
  "IT-320 Change management workpaper" \
  "A 25-item sample of 86 service desk changes found 10 approvals without evidence, and tracing 10 Ledgerline configuration changes back to tickets found 4 made by Finance with no ticket at all."
build deficiency-memo "IT-900 Deficiency evaluation" \
  "Simulated CAS 265 evaluation of 17 ITGC deficiencies: five individually significant, reported to the Audit Committee as three significant deficiencies." \
  "IT-900 Deficiency evaluation" \
  "Seventeen ITGC deficiencies evaluated individually and together under CAS 265, aggregated by root cause into three significant deficiencies."
echo "Built Lakeridge pages."
