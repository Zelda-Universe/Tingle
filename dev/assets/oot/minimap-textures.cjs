// Measures the minimap textures the Hyrule map is composed from
// (compose-world.cjs): each one's width and the box sharp's trim() keeps.
// game-to-map.cjs needs these to place game coordinates on our artwork.
//
//   node dev/assets/oot/minimap-textures.cjs /path/to/oot
//
// Writes minimap-textures.json next to this file. Re-run it whenever the
// source textures change (compose-world.cjs would change too).
const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

(async () => {
  const source = process.argv[2];
  if(!source) throw new Error('Usage: node minimap-textures.cjs /path/to/oot');
  const folder = path.join(source, 'OoTR-110-CustomTex-Map-Field');
  const textures = {};
  for(const file of fs.readdirSync(folder).filter(name => /^Mini_.*\.png$/.test(name)).sort()) {
    const full = path.join(folder, file);
    const meta = await sharp(full).metadata();
    const {info} = await sharp(full).trim().toBuffer({resolveWithObject: true});
    textures[file.replace(/^Mini_|\.png$/g, '')] = {
      width: meta.width, height: meta.height,
      trim: [-info.trimOffsetLeft, -info.trimOffsetTop, info.width, info.height]
    };
  }
  fs.writeFileSync(path.join(__dirname, 'minimap-textures.json'), JSON.stringify({
    description: 'Mini_<texture>.png sizes and trim boxes [left, top, width, height], from minimap-textures.cjs.',
    textures
  }, null, 1) + '\n');
  console.log(Object.keys(textures).length + ' textures');
})();
