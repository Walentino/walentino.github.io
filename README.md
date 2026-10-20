# Personal site: Adewale Odeja, CISA

Static site. No build step. Works on GitHub Pages as is.

## Files
- index.html: home page
- lakeridge/index.html: case study
- lakeridge/*.html: four public workpapers (vendor names fictionalized)
- pacc/index.html: SME controls and compliance review case study (Port Alder Community Church, simulated)
- pacc/*.html: five public documents. Regenerate with `bash src/pacc/build.sh`
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
Edit the Markdown in src/ (Lakeridge) or src/pacc/ (Port Alder), then regenerate from the repository root:

    bash src/build-lakeridge.sh
    bash src/pacc/build.sh

Each script sets every page's title, meta description and Open Graph tags. To change a description, edit it in the script, not in the HTML, or the next rebuild will overwrite it. Keep meta descriptions under 155 characters.
