#!/usr/bin/env bash
# Regenerate the PACC workpaper pages from Markdown.
# Run from the repository root: bash src/pacc/build.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
mkdir -p pacc

build () {
  local name="$1" title="$2"
  pandoc "src/pacc/$name.md" -f gfm-tex_math_dollars -t html5 \
    --template=src/pacc/doc-template.html \
    --metadata pagetitle="$title" -o "pacc/$name.html"
  # Wrap tables so they scroll sideways on phones, as the Lakeridge pages do
  sed -i 's#<table>#<div class="tbl"><table>#g; s#</table>#</table></div>#g' "pacc/$name.html"
}

build board-report        "Final report to the board"
build pci-scope           "PCI DSS scope determination"
build findings-register   "Findings register"
build refund-testing      "Refund and credit testing"
build correction-memo     "Correction to the interim memo"
echo "Built: $(ls pacc/*.html | tr '\n' ' ')"
