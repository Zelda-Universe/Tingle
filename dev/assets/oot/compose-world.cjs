// Editable geographic approximation from clean scene silhouettes. No invented POIs.
const fs = require('fs');
const path = require('path');
async function compose(source, output, sharp) {
  const layout = require('./world-layout.json');
  const folder = path.join(source, 'OoTR-110-CustomTex-Map-Field');
  const canvas = layout.canvas || 4096;
  fs.mkdirSync(output, {recursive:true});
  // Where each area lands, per age, so markers stored relative to an area follow it.
  const boxes = {};
  const images = {};
  for(const age of ['Child', 'Adult']) {
    const layers = [];
    boxes[age] = {};
    for(const [region,x,y,width] of layout.regions) {
      if((region === 'HyruleCastle' && age === 'Adult') || (region === 'GanonCastle' && age === 'Child')) continue;
      let file = path.join(folder, `Mini_${region}_${age}_00.png`);
      // Gerudo Fortress is only supplied as Adult artwork, but exists in both eras.
      if(!fs.existsSync(file) && region === 'GerudoFortress') file = path.join(folder, `Mini_${region}_Adult_00.png`);
      if(!fs.existsSync(file)) throw new Error('Missing clean region: ' + file);
      // width is for the Child artwork. Adult artwork that's a different size
      // (Market, Death Mountain Crater, Gerudo Valley) is drawn at the same
      // scale, not stretched to the same width.
      const trimmed = await sharp(file).trim().toBuffer();
      let drawnWidth = width;
      const childFile = path.join(folder, `Mini_${region}_Child_00.png`);
      if(age === 'Adult' && fs.existsSync(childFile) && file !== childFile) {
        const childWidth = (await sharp(await sharp(childFile).trim().toBuffer()).metadata()).width;
        drawnWidth = Math.round(width * (await sharp(trimmed).metadata()).width / childWidth);
      }
      const {data,info} = await sharp(trimmed).resize({width:drawnWidth}).png().toBuffer({resolveWithObject:true});
      // adultShift lines Adult artwork up with the Child artwork where the
      // Adult image has extra on one side (Zora's Fountain's Ice Cavern path).
      const [shiftX, shiftY] = (age === 'Adult' && (layout.adultShift || {})[region]) || [0, 0];
      const left = Math.round(x-info.width/2+shiftX), top = Math.round(y-info.height/2+shiftY);
      layers.push({input:data,left,top});
      boxes[age][region] = [left, top, info.width, info.height];
    }
    images[age] = layers;
  }
  // The map's own background: a rectangle around every area of both ages,
  // with a margin, rather than the whole square canvas. Outside it the map is
  // transparent, and the site keeps the view within it.
  // margin: [sides, top and bottom] in pixels.
  const [marginX, marginY] = layout.margin || [160, 160];
  const all = [...Object.values(boxes.Child), ...Object.values(boxes.Adult)];
  const extent = [
    Math.max(0, Math.min(...all.map(b => b[0])) - marginX), Math.max(0, Math.min(...all.map(b => b[1])) - marginY),
    Math.min(canvas, Math.max(...all.map(b => b[0] + b[2])) + marginX), Math.min(canvas, Math.max(...all.map(b => b[1] + b[3])) + marginY)];
  const backdrop = await sharp({create:{width:extent[2]-extent[0],height:extent[3]-extent[1],channels:4,background:'#241a0c'}}).png().toBuffer();
  for(const age of ['Child', 'Adult']) {
    await sharp({create:{width:canvas,height:canvas,channels:4,background:{r:0,g:0,b:0,alpha:0}}})
      .composite([{input:backdrop,left:extent[0],top:extent[1]}, ...images[age]]).png().toFile(path.join(output, `Hyrule_${age}.png`));
  }
  fs.writeFileSync(path.join(__dirname, 'world-boxes.json'), JSON.stringify({canvas, extent, boxes}, null, 1) + '\n');
}
module.exports = compose;
