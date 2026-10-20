#!/usr/bin/env bash
# Regenerate the PACC workpaper pages from Markdown.
# Run from the repository root: bash src/pacc/build.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
mkdir -p pacc

# build NAME "Page title" "Meta description (<155 chars)" "Open Graph title" "Open Graph description"
# Values are passed with --variable so pandoc does not line-wrap them. They are inserted
# as written, so avoid double quotes and & in them.
build () {
  local name="$1" title="$2" desc="$3" og_title="$4" og_desc="$5"
  pandoc "src/pacc/$name.md" -f gfm-tex_math_dollars -t html5 \
    --template=src/pacc/doc-template.html \
    --metadata pagetitle="$title" \
    --variable page-description="$desc" \
    --variable og-title="$og_title" \
    --variable og-description="$og_desc" \
    --variable og-page="$name.html" \
    -o "pacc/$name.html"
  # Wrap tables so they scroll sideways on phones, as the Lakeridge pages do
  sed -i 's#<table>#<div class="tbl"><table>#g; s#</table>#</table></div>#g' "pacc/$name.html"
}

build board-report "Final report to the board" \
  "Simulated board report for an Ontario church: 16 rated findings in plain language, management's disagreement recorded, and eight quarterly questions." \
  "Final report to the board" \
  "Sixteen rated findings written for a church board with no technical member, with management's disagreement recorded beside the finding it concerns."
build pci-scope "PCI DSS scope determination" \
  "Simulated PCI DSS 4.0.1 scope determination across five card channels, showing why a church-built giving page fell under SAQ D rather than SAQ A-EP." \
  "PCI DSS scope determination" \
  "Five card channels traced, and why a church-built giving page fell under SAQ D rather than SAQ A-EP once server files were reviewed."
build findings-register "Findings register" \
  "Simulated register of 16 findings with condition, criteria, cause, effect and recommendation, one rating lowered on evidence and one held under pushback." \
  "Findings register" \
  "Sixteen findings with condition, criteria, cause, effect and recommendation, including one rating lowered on evidence and one held against management pushback."
build refund-testing "Refund and credit testing" \
  "Simulated refund testing: all 27 refunds and credits checked against original transactions, with 5 unsupported items referred to the board chair." \
  "Refund and credit testing" \
  "All 27 refunds and credits tested against original transactions, with five unsupported items referred to the board chair rather than investigated."
build correction-memo "Correction to the interim memo" \
  "Simulated memo correcting a PCI scope conclusion from SAQ A-EP to SAQ D in its first line, and what changed in how conditional conclusions are written." \
  "Correction to the interim memo: PCI scope" \
  "Correcting a PCI scope conclusion from SAQ A-EP to SAQ D in the first line, and what changed in how conditional conclusions are written."
echo "Built PACC pages."
