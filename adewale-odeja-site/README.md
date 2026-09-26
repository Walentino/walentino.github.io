# Personal site: Adewale Odeja, CISA

Static site. No build step. Works on GitHub Pages as is.

## Files
- index.html: home page
- lakeridge/index.html: case study
- lakeridge/*.html: four public workpapers (vendor names fictionalized)
- assets/style.css: shared styles
- src/: Markdown sources and template (not needed on the live site)

## Publish at https://walentino.github.io/
1. On GitHub, create a new public repository named exactly `walentino.github.io`.
2. Upload everything in this folder (index.html, assets/, lakeridge/). Commit to `main`.
3. Settings > Pages > Source: Deploy from a branch > `main` / root. Save.
4. Live in 1 to 2 minutes at https://walentino.github.io/
   Your SOC portfolio stays at https://walentino.github.io/signalroot/

## Before you share the link
- Add `resume.pdf` to the root of the repository (the buttons link to it).
- Add your email: in index.html, search for "Add your email" and replace the comment with the link.
- In the signalroot site, change the "SOC Analyst (Tier 1/2)" headline and add a link back to the home page.

## Editing a workpaper
Edit the file in src/, then regenerate:
pandoc src/NAME.md -f gfm-tex_math_dollars -t html5 --template=src/doc-template.html --metadata pagetitle="TITLE" -o lakeridge/NAME.html
