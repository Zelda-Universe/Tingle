# Font Awesome subset

`fontawesome-subset.js` is generated from Font Awesome Free 5.0.13's original
`https://use.fontawesome.com/releases/v5.0.13/js/all.js` distribution. Its SVG
renderer, icon paths, and license notice are preserved; unused icon dictionary
entries are removed.

To regenerate after adding icons, download that exact upstream release, then
run `node dev/build-fontawesome.cjs /path/to/all.js`. The command prints the
replacement asset. Review and save it as `scripts/vendor/fontawesome-subset.js`.
Run the icon and startup tests before deploying.

The generator scans application scripts and PHP templates, including lazy
tools. Plain icon names and the dynamically assembled chevron variants are
included too. New dynamically constructed names may need an explicit entry in
the generator.

Upstream licensing: icons CC BY 4.0, fonts SIL OFL 1.1, code MIT.
See https://fontawesome.com/license and the preserved asset header.
