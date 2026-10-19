#!/usr/bin/env bash
# Regenerate the PACC workpaper pages from Markdown.
# Run from the repository root: bash src/pacc/build.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
mkdir -p pacc

# build NAME "Page title" "Open Graph title" "Open Graph description (one sentence)"
# OG values are passed with --variable so pandoc does not line-wrap them. They are inserted
# as written, so avoid double quotes and & in them.
build () {
  local name="$1" title="$2" og_title="$3" og_desc="$4"
  pandoc "src/pacc/$name.md" -f gfm-tex_math_dollars -t html5 \
    --template=src/pacc/doc-template.html \
    --metadata pagetitle="$title" \
    --variable og-title="$og_title" \
    --variable og-description="$og_desc" \
    --variable og-page="$name.html" \
    -o "pacc/$name.html"
  # Wrap tables so they scroll sideways on phones, as the Lakeridge pages do
  sed -i 's#<table>#<div class="tbl"><table>#g; s#</table>#</table></div>#g' "pacc/$name.html"
}

build board-report "Final report to the board" \
  "Final report to the board" \
  "Sixteen rated findings written for a church board with no technical member, with management's disagreement recorded beside the finding it concerns."
build pci-scope "PCI DSS scope determination" \
  "PCI DSS scope determination" \
  "Five card channels traced, and why a church-built giving page fell under SAQ D rather than SAQ A-EP once server files were reviewed."
build findings-register "Findings register" \
  "Findings register" \
  "Sixteen findings with condition, criteria, cause, effect and recommendation, including one rating lowered on evidence and one held against management pushback."
build refund-testing "Refund and credit testing" \
  "Refund and credit testing" \
  "All 27 refunds and credits tested against original transactions, with five unsupported items referred to the board chair rather than investigated."
build correction-memo "Correction to the interim memo" \
  "Correction to the interim memo: PCI scope" \
  "Correcting a PCI scope conclusion from SAQ A-EP to SAQ D in the first line, and what changed in how conditional conclusions are written."
echo "Built: $(ls pacc/*.html | tr '\n' ' ')"
