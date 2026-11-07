#!/usr/bin/env node
// Builds OoT's map tiles and Switch Map thumbnails from the game's map
// textures. Source files are never modified.
//
//   node dev/assets/oot/import-assets.cjs /path/to/oot
//
// Makes, for each dungeon floor texture (<dungeon>_<floor>_Main.png) and for
// Hyrule's Child and Adult artwork (composed by compose-world.cjs):
//   tiles/oot/<name>/<z>_<x>_<y>.webp   the tile pyramid
//   images/icons/oot/<name>/icon.webp   the Switch Map thumbnail
// and records each texture in tile-report.json: its SHA-256, size and tile
// folder. A texture whose tiles are already built from the same file is
// skipped. Maps, markers and everything else live in the database; when a
// texture changes, its submap's tile_version (the first 16 characters of its
// SHA-256 here) needs a migration so browsers fetch the new tiles.
//
// Hyrule's artwork is composed here, and different versions of sharp resize
// slightly differently: with another sharp than the one that built the live
// tiles, both Hyrule ages come out a little different and are rebuilt, and
// the thumbnails' bytes change. Check the result before committing it.
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const ROOT = path.resolve(__dirname, '../../..');
const REPORT = path.join(__dirname, 'tile-report.json');
const slug = value => value.replace(/([a-z])([A-Z])/g, '$1-$2').replace(/_/g, '-').toLowerCase();

async function main(source) {
  if(!source || !fs.existsSync(source)) throw new Error('Usage: node dev/assets/oot/import-assets.cjs /path/to/oot');
  const sharp = require(process.env.SHARP_MODULE || 'sharp');
  const previous = fs.existsSync(REPORT) ? JSON.parse(fs.readFileSync(REPORT, 'utf8')).assets : [];
  const dungeon = path.join(source, 'OoTR-110-UI-CustomTex-Map-Dungeon');
  const assets = [];
  let built = 0, kept = 0;

  async function render(file, name, kind, sourceName) {
    const buffer = fs.readFileSync(file);
    const sha256 = crypto.createHash('sha256').update(buffer).digest('hex');
    const meta = await sharp(buffer).metadata();
    const maxZoom = Math.ceil(Math.log2(Math.max(meta.width, meta.height) / 256));
    const side = 256 * 2 ** maxZoom;
    const tileURL = 'oot/' + name + '/';
    const offsetX = Math.floor((side - meta.width) / 2), offsetY = Math.floor((side - meta.height) / 2);
    assets.push({source: sourceName, sha256, width: meta.width, height: meta.height, maxZoom, tileURL, offsetX, offsetY});
    await thumbnail(buffer, name);
    const existing = previous.find(asset => asset.tileURL === tileURL && asset.sha256 === sha256);
    if(existing && fs.existsSync(path.join(ROOT, 'tiles', tileURL, `${maxZoom}_${2 ** maxZoom - 1}_${2 ** maxZoom - 1}.webp`))) {
      kept++;
      return;
    }
    // Hyrule paints its own background, fitted to the areas; around it the
    // tiles are transparent. Dungeon floors fill their square.
    const background = kind === 'world' ? {r: 0, g: 0, b: 0, alpha: 0} : '#241a0c';
    const canvas = await sharp({create: {width: side, height: side, channels: 4, background}})
      .composite([{input: buffer, left: offsetX, top: offsetY}]).png().toBuffer();
    const dir = path.join(ROOT, 'tiles', tileURL);
    fs.mkdirSync(dir, {recursive: true});
    // Zoom 0 is a single tile; each higher level is a full tile pyramid.
    for(let z = 0; z <= maxZoom; z++) {
      const size = 256 * 2 ** z;
      const image = await sharp(canvas).resize(size, size).png().toBuffer();
      for(let y = 0; y < 2 ** z; y++) {
        await Promise.all(Array.from({length: 2 ** z}, (_, x) =>
          sharp(image).extract({left: x * 256, top: y * 256, width: 256, height: 256})
            .webp({quality: 90}).toFile(path.join(dir, `${z}_${x}_${y}.webp`))));
      }
    }
    built++;
  }

  // The Switch Map thumbnail: the artwork trimmed of empty space and fitted
  // to the square with a little room around it.
  async function thumbnail(buffer, name) {
    // Twice: Hyrule's transparent surround first, then its painted background.
    const art = await sharp(await sharp(buffer).trim().toBuffer()).trim().toBuffer();
    const fitted = await sharp(art).resize(232, 232, {fit: 'contain', background: {r: 0, g: 0, b: 0, alpha: 0}}).png().toBuffer();
    const image = await sharp({create: {width: 256, height: 256, channels: 4, background: '#241a0c'}})
      .composite([{input: fitted, left: 12, top: 12}]).webp({quality: 85}).toBuffer();
    const dir = path.join(ROOT, 'images', 'icons', 'oot', name);
    fs.mkdirSync(dir, {recursive: true});
    fs.writeFileSync(path.join(dir, 'icon.webp'), image);
  }

  const floors = fs.readdirSync(dungeon).filter(f => f.endsWith('_Main.png')).sort((a, b) => a.localeCompare(b, 'en', {numeric: true}));
  for(const file of floors) {
    const name = slug(file.replace(/_Main\.png$/, ''));
    await render(path.join(dungeon, file), name, 'dungeon', path.relative(source, path.join(dungeon, file)));
  }
  const temporary = fs.mkdtempSync(path.join(require('os').tmpdir(), 'oot-world-'));
  try {
    await require('./compose-world.cjs')(source, temporary, sharp);
    for(const age of ['Child', 'Adult']) {
      await render(path.join(temporary, `Hyrule_${age}.png`), 'hyrule-' + age.toLowerCase(), 'world', `Hyrule_${age}.png (compose-world.cjs)`);
    }
  } finally { fs.rmSync(temporary, {recursive: true, force: true}); }

  fs.writeFileSync(REPORT, JSON.stringify({
    description: "The textures OoT's map tiles are built from (import-assets.cjs). A submap's tile_version is the first 16 characters of its texture's sha256.",
    assets
  }, null, 1) + '\n');
  console.log(JSON.stringify({textures: assets.length, built, kept}));
}

if(require.main === module) main(process.argv[2]).catch(error => { console.error(error.message); process.exitCode = 1; });
module.exports = {slug};
