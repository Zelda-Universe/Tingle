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
  for(const age of ['Child', 'Adult']) {
    const layers = [];
    boxes[age] = {};
    for(const [region,x,y,width] of layout.regions) {
      if((region === 'HyruleCastle' && age === 'Adult') || (region === 'GanonCastle' && age === 'Child')) continue;
      let file = path.join(folder, `Mini_${region}_${age}_00.png`);
      // Gerudo Fortress is only supplied as Adult artwork, but exists in both eras.
      if(!fs.existsSync(file) && region === 'GerudoFortress') file = path.join(folder, `Mini_${region}_Adult_00.png`);
      if(!fs.existsSync(file)) throw new Error('Missing clean region: ' + file);
      const {data,info} = await sharp(file).trim().resize({width}).png().toBuffer({resolveWithObject:true});
      const left = Math.round(x-info.width/2), top = Math.round(y-info.height/2);
      layers.push({input:data,left,top});
      boxes[age][region] = [left, top, info.width, info.height];
    }
    await sharp({create:{width:canvas,height:canvas,channels:4,background:'#241a0c'}})
      .composite(layers).png().toFile(path.join(output, `Hyrule_${age}.png`));
  }
  fs.writeFileSync(path.join(__dirname, 'world-boxes.json'), JSON.stringify({canvas, boxes}, null, 1) + '\n');
}
module.exports = compose;
