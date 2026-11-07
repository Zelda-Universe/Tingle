// Draws compare-collectibles.cjs's results on the map's own artwork, one
// image per area and age: our marker in red, the game's position in green,
// joined by a line, and unmatched game points as hollow green rings.
//
//   node dev/assets/oot/preview-collectibles.cjs
//
// Reads scene-data/collectible-comparison.json and tiles/oot/hyrule-*/ at
// zoom 5 (the full 8192px artwork); writes scene-data/collectible-previews/.
const fs = require('fs');
const path = require('path');
const sharp = require('sharp');
const layout = require('./world-boxes.json');
const {project} = require('./game-to-map.cjs');

const ROOT = path.join(__dirname, '..', '..', '..');
const TILE = 256, ZOOM = 5, PX = 32, MARGIN = 60;
const comparison = require('./scene-data/collectible-comparison.json');
const OUT = path.join(__dirname, 'scene-data', 'collectible-previews');

async function crop(age, [left, top, width, height]) {
  const x0 = Math.max(0, left - MARGIN), y0 = Math.max(0, top - MARGIN);
  const x1 = Math.min(layout.canvas, left + width + MARGIN), y1 = Math.min(layout.canvas, top + height + MARGIN);
  // Whole tiles onto a grid-aligned image, then cut out the area.
  const gx = Math.floor(x0 / TILE), gy = Math.floor(y0 / TILE);
  const gw = Math.ceil(x1 / TILE) - gx, gh = Math.ceil(y1 / TILE) - gy;
  const tiles = [];
  for(let ty = gy; ty < gy + gh; ty++) {
    for(let tx = gx; tx < gx + gw; tx++) {
      const file = path.join(ROOT, 'tiles', 'oot', 'hyrule-' + age.toLowerCase(), `${ZOOM}_${tx}_${ty}.webp`);
      if(fs.existsSync(file)) tiles.push({input: file, left: (tx - gx) * TILE, top: (ty - gy) * TILE});
    }
  }
  const grid = await sharp({create: {width: gw * TILE, height: gh * TILE, channels: 4, background: '#241a0c'}})
    .composite(tiles).png().toBuffer();
  const image = await sharp(grid).extract({left: x0 - gx * TILE, top: y0 - gy * TILE, width: x1 - x0, height: y1 - y0}).png().toBuffer();
  return {image, x0, y0, width: x1 - x0, height: y1 - y0};
}

(async () => {
  fs.mkdirSync(OUT, {recursive: true});
  for(const age of ['Child', 'Adult']) {
    for(const [region, box] of Object.entries(layout.boxes[age])) {
      const here = m => {
        const at = project(m.scene, 0, 0); // area check only
        const area = at && at.region === region && at.age === age;
        return area;
      };
      const matches = comparison.matches.filter(here);
      const missing = comparison.unmatchedGame.filter(g => here({scene: g.scene}));
      if(!matches.length && !missing.length) continue;
      const {image, x0, y0, width, height} = await crop(age, box);
      const pt = ([x, y]) => [x * PX - x0, -y * PX - y0];
      let svg = '';
      matches.forEach(m => {
        const [ax, ay] = pt(m.ours), [bx, by] = pt(m.game);
        svg += `<line x1="${ax}" y1="${ay}" x2="${bx}" y2="${by}" stroke="#fff" stroke-width="2"/>`;
        svg += `<circle cx="${ax}" cy="${ay}" r="7" fill="#e53935" stroke="#000"/>`;
        svg += `<circle cx="${bx}" cy="${by}" r="7" fill="#43a047" stroke="#000"/>`;
        svg += `<text x="${bx + 9}" y="${by + 4}" font-size="13" font-family="sans-serif" fill="#fff" stroke="#000" stroke-width="3" paint-order="stroke">${m.offsetPixels}px ${m.name.replace(/&/g, '&amp;')}</text>`;
      });
      missing.forEach(g => {
        const [bx, by] = pt(g.at);
        svg += `<circle cx="${bx}" cy="${by}" r="9" fill="none" stroke="#43a047" stroke-width="3"/>`;
      });
      await sharp(image).composite([{input: Buffer.from(`<svg width="${width}" height="${height}">${svg}</svg>`), left: 0, top: 0}])
        .jpeg({quality: 85}).toFile(path.join(OUT, `${region}_${age}.jpg`));
    }
  }
  console.log('wrote ' + fs.readdirSync(OUT).length + ' previews to ' + path.relative(ROOT, OUT));
})();
