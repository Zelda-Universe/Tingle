#!/usr/bin/env node
// Reproducible, local-only import. Source files are never modified.
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const ROOT = path.resolve(__dirname, '../../..');
const GAME = '64';
function csv(text) {
  const rows = []; let row = [], value = '', quoted = false;
  for(let i = 0; i < text.length; i++) {
    const c = text[i];
    if(c === '"') { if(quoted && text[i + 1] === '"') { value += '"'; i++; } else quoted = !quoted; }
    else if(c === ',' && !quoted) { row.push(value); value = ''; }
    else if((c === '\n' || c === '\r') && !quoted) {
      if(c === '\r' && text[i + 1] === '\n') i++;
      row.push(value); if(row.some(Boolean)) rows.push(row); row = []; value = '';
    } else value += c;
  }
  if(value || row.length) { row.push(value); rows.push(row); }
  const headers = rows.shift() || [];
  return rows.map(values => Object.fromEntries(headers.map((h, i) => [h, values[i] || ''])));
}
const friendly = key => ({ HountedWasteland: 'Haunted Wasteland', LostWood: 'Lost Woods',
  InsideJabuJabuBelly: "Inside Jabu-Jabu's Belly", InsideTheDekuTree: 'Inside the Deku Tree',
  GanonCastle: "Ganon's Castle", DodongoCavern: "Dodongo's Cavern",
  BottomOfTheWell: 'Bottom of the Well', GerudoFortress: "Gerudo's Fortress" }[key] || key.replace(/([a-z])([A-Z])/g, '$1 $2'));
const slug = value => value.replace(/([a-z])([A-Z])/g, '$1-$2').replace(/_/g, '-').toLowerCase();
async function main(source) {
  if(!source || !fs.existsSync(source)) throw new Error('Usage: node dev/assets/oot/import-assets.cjs /path/to/oot');
  const sharp = require(process.env.SHARP_MODULE || 'sharp');
  const out = path.join(ROOT, 'data/OoT');
  fs.mkdirSync(out, { recursive: true });
  const previous = fs.existsSync(path.join(out,'import-report.json'))
    ? JSON.parse(fs.readFileSync(path.join(out,'import-report.json'),'utf8')).assets : [];
  const write = (name, data) => fs.writeFileSync(path.join(out, name), JSON.stringify(data, null, 2) + '\n');
  const field = path.join(source, 'OoTR-110-CustomTex-Map-Field');
  const dungeon = path.join(source, 'OoTR-110-UI-CustomTex-Map-Dungeon');
  const iconDir = path.join(source, 'OoTR-110-UI-Icons');
  const maps = [], assets = [];
  let mapId = 64000, submapId = 640000, tileCount = 0;
  async function render(file, dest, kind) {
    const buffer = fs.readFileSync(file);
    const sha256 = crypto.createHash('sha256').update(buffer).digest('hex');
    const meta = await sharp(buffer).metadata();
    const maxZoom = Math.ceil(Math.log2(Math.max(meta.width, meta.height) / 256));
    const side = 256 * 2 ** maxZoom;
    const existing = previous.find(asset => asset.source === path.relative(source,file) && asset.sha256 === sha256);
    if(existing && fs.existsSync(path.join(ROOT,'tiles',existing.tileURL,`${maxZoom}_${2 ** maxZoom - 1}_${2 ** maxZoom - 1}.webp`))) {
      assets.push(existing);
      tileCount += (4 ** (maxZoom + 1) - 1) / 3;
      return { maxZoom, tileURL: existing.tileURL, preview: await preview(buffer, dest) };
    }
    const offsetX = Math.floor((side - meta.width) / 2), offsetY = Math.floor((side - meta.height) / 2);
    // The Hyrule map paints its own background, fitted to the areas; around
    // it the tiles are transparent. Dungeon floors fill their square.
    const background = kind === 'world' ? {r:0, g:0, b:0, alpha:0} : '#241a0c';
    const canvas = await sharp({ create: { width: side, height: side, channels: 4, background } })
      .composite([{input: buffer, left: offsetX, top: offsetY}]).png().toBuffer();
    const relative = 'oot/' + dest + '/';
    const dir = path.join(ROOT, 'tiles', relative);
    fs.mkdirSync(dir, {recursive:true});
    // Keep zoom 0 as a single tile; each higher level is a real tile pyramid.
    for(let z = 0; z <= maxZoom; z++) {
      const size = 256 * 2 ** z;
      const image = await sharp(canvas).resize(size, size).png().toBuffer();
      for(let y = 0; y < 2 ** z; y++) {
        await Promise.all(Array.from({length:2 ** z}, (_, x) =>
          sharp(image).extract({left:x * 256, top:y * 256, width:256, height:256})
            .webp({quality:90}).toFile(path.join(dir, `${z}_${x}_${y}.webp`))));
        tileCount += 2 ** z;
      }
    }
    assets.push({source:path.relative(source,file), sha256,
      width:meta.width, height:meta.height, maxZoom, tileURL:relative, offsetX, offsetY});
    return { maxZoom, tileURL:relative, preview: await preview(buffer, dest) };
  }
  // The Switch Map thumbnail: the map's artwork trimmed of empty space and
  // fitted to the square with a little room around it, rather than the whole
  // (mostly empty) tile canvas. Returns a short hash of the image, which goes
  // on its URL so browsers fetch a new one when it changes.
  async function preview(buffer, dest) {
    // Twice: Hyrule's transparent surround first, then its painted background.
    const art = await sharp(await sharp(buffer).trim().toBuffer()).trim().toBuffer();
    const fitted = await sharp(art).resize(232, 232, {fit:'contain', background:{r:0, g:0, b:0, alpha:0}}).png().toBuffer();
    const image = await sharp({create:{width:256, height:256, channels:4, background:'#241a0c'}})
      .composite([{input:fitted, left:12, top:12}]).webp({quality:85}).toBuffer();
    fs.mkdirSync(path.join(out, 'previews'), {recursive:true});
    fs.writeFileSync(path.join(out, 'previews', dest + '.webp'), image);
    return crypto.createHash('sha256').update(image).digest('hex').slice(0, 12);
  }
  async function addMap(key, name, files, kind) {
    const id = String(mapId++), subMap = [];
    for(const [i, file] of files.entries()) {
      const stem = path.basename(file, path.extname(file));
      const suffix = stem.startsWith(key + '_') ? stem.slice(key.length + 1).replace(/_Main$/, '') : 'Overview';
      const dest = slug(key + '-' + suffix);
      const rendered = await render(file, dest, kind);
      const variant = suffix.replace(/_/g, ' · ').replace(/State(\d+)/g, 'State $1').replace(/Lv(\d+)/g, 'Water level $1');
      subMap.push({id:String(submapId++),name:variant, mapTypeName:'FlatMap',googleDefault:'0',
        tileURL:rendered.tileURL, tileBaseURL:'/tiles/',tileExt:'webp',img404:'blank',emptyMap:'0',
        mapMapper:'Supplied OoT asset dump; texture placement preserved',isDefault:i === 0 ? '1':'0',opacity:'1',
        iconURL:'data/OoT/previews/' + dest + '.webp?v=' + rendered.preview,maxZoom:String(rendered.maxZoom),submapLayer:[]});
    }
    maps.push({id,name,defaultZoom:'1',maxZoom:String(Math.max(...subMap.map(s=>Number(s.maxZoom)))),
      mapCopyright:'Map artwork © Nintendo. Local asset preview; no coordinate data supplied.',kind,subMap});
    console.log(name + ': ' + subMap.length + ' map variants');
  }
  // Reserve the old overview IDs so existing regional/dungeon links remain stable.
  mapId++; submapId++;
  const fields = fs.readdirSync(field).filter(f => f.endsWith('.png') && !f.startsWith('Mini_')).sort((a,b)=>
    Number(a.includes('_Adult_')) - Number(b.includes('_Adult_')) || a.localeCompare(b));
  for(const key of [...new Set(fields.map(f=>f.split('_')[0]))])
    await addMap(key, friendly(key), fields.filter(f=>f.startsWith(key+'_')).map(f=>path.join(field,f)), 'region');
  const floors = fs.readdirSync(dungeon).filter(f=>f.endsWith('_Main.png')).sort((a,b)=>a.localeCompare(b, 'en', {numeric:true}));
  for(const key of [...new Set(floors.map(f=>f.split('_')[0]))])
    await addMap(key, friendly(key), floors.filter(f=>f.startsWith(key+'_')).map(f=>path.join(dungeon,f)), 'dungeon');
  const temporary = fs.mkdtempSync(path.join(require('os').tmpdir(),'oot-world-'));
  try {
    await require('./compose-world.cjs')(source, temporary, sharp);
    mapId = 65000; submapId = 650000;
    await addMap('Hyrule', 'Hyrule', ['Child','Adult'].map(age=>path.join(temporary,`Hyrule_${age}.png`)), 'world');
    const names = {ZoraDomain:"Zora's Domain",ZoraFountain:"Zora's Fountain",ZoraRiver:"Zora's River",LonLonRanch:'Lon Lon Ranch',GanonCastle:"Ganon's Castle"};
    maps[maps.length-1].subMap.forEach(submap=>{
      const layout = require('./world-layout.json'), scale = (layout.canvas || 4096) / 256;
      submap.placeLabels = layout.regions
        .filter(([key])=> !(key==='HyruleCastle' && submap.name==='Adult') && !(key==='GanonCastle' && submap.name==='Child'))
        .map(([key,x,y])=>{
          const box=require('./world-boxes.json').boxes[submap.name][key];
          return {name:names[key] || friendly(key),x:x/scale,y:-(y+(key==='HyruleField' ? -350 : 0))/scale,
            bounds:box ? [[-(box[1]+box[3])/scale,box[0]/scale],[-box[1]/scale,(box[0]+box[2])/scale]] : undefined};
        });
      // Lon Lon Ranch is drawn inside the Hyrule Field artwork; label the ranch there.
      const field = require('./world-boxes.json').boxes[submap.name].HyruleField;
      submap.placeLabels.push({name:names.LonLonRanch, x:(field[0] + 0.447 * field[2]) / scale, y:-(field[1] + 0.598 * field[3]) / scale});
      submap.connections = require('./connections.cjs')(submap.placeLabels, key => names[key] || friendly(key), submap.name);
      // The map's limits: the painted rectangle around the areas, in map units.
      const extent = require('./world-boxes.json').extent;
      submap.bounds = [[-extent[3]/scale, extent[0]/scale], [-extent[1]/scale, extent[2]/scale]];
    });
  } finally { fs.rmSync(temporary,{recursive:true,force:true}); }
  // Regions are now part of the world, not separate destinations.
  maps.splice(0,maps.length,...maps.filter(m=>m.kind === 'world'),...maps.filter(m=>m.kind === 'dungeon'));
  const icons = fs.readdirSync(iconDir).filter(f=>f.endsWith('.png')).sort();
  fs.mkdirSync(path.join(out,'icons'),{recursive:true});
  for(const file of icons) await sharp(path.join(iconDir,file)).resize(128,128,{fit:'inside'}).png().toFile(path.join(out,'icons',file));
  const categories = [], iconCSS = [];
  // The collectibles tracked for now. Ids are fixed so markers keep their
  // categories across rebuilds. The supplied icons have no Piece of Heart, so
  // HeartPiece.svg (drawn for this site) sits beside this script.
  fs.copyFileSync(path.join(__dirname,'HeartPiece.svg'), path.join(out,'icons','HeartPiece.svg'));
  fs.copyFileSync(path.join(__dirname,'Poe.svg'),path.join(out,'icons','Poe.svg'));
  const groups = [
    ['64000', 'Collectibles', [ ['64002','Heart Pieces','HeartPiece.svg','heart'], ['64001','Gold Skulltulas','Item_Token_Gold.png','relic'],
      ['64003','Big Poes','Poe.svg','korok'] ]]
  ];
  for(const [parent, group, leaves] of groups) {
    const base = {container_id:GAME,marker_category_type_id:'1',default_checked:true,visible:true,visible_zoom:'0',zoom_min:'0',zoom_max:'6',min_zoom:'0',max_zoom:'6',color:'#cdb269'};
    categories.push({...base,id:parent,parent_id:null,name:group,img:'General_Map',poiStyle:''});
    for(const [id,name,file,style] of leaves) {
      if(!fs.existsSync(path.join(out,'icons',file))) throw new Error('Missing category icon '+file);
      const glyph = id === '64002' ? 'General_Heart' : id === '64001' ? 'BotW_Boss' : 'OoT_' + file.replace(/\.(png|svg)$/,'');
      categories.push({...base,id,parent_id:parent,name,img:glyph,poiStyle:style});
      if(glyph.startsWith('OoT_') && glyph !== 'OoT_Poe') iconCSS.push(`.icon-${glyph}::before { content: ''; display: inline-block; width: 1em; height: 1em; background: url('icons/${file}') center / contain no-repeat; vertical-align: middle; }`);
    }
  }
  fs.writeFileSync(path.join(out,'icons.css'), iconCSS.join('\n') + '\n');
  const text = {};
  function walk(dir) { return fs.readdirSync(dir,{withFileTypes:true}).flatMap(e=>e.isDirectory()?walk(path.join(dir,e.name)):[path.join(dir,e.name)]); }
  const textRoot = path.join(source,'OoTR-Text-USen-JPja-EUde');
  for(const file of walk(textRoot).filter(f=>f.endsWith('.csv'))) text[path.relative(textRoot,file)] = csv(fs.readFileSync(file,'utf8'));
  write('text-catalog.json',text);
  function definitions(table) {
    const rows = text[table] || [];
    return rows.filter(row=>/_Name$/.test(row.Label)).map(row=>{
      const key = row.Label.replace(/_Name$/, '');
      const caption = rows.find(value=>value.Label === key + '_Caption');
      return {key,name:row.USenText,japanese:row.JPjaText,german:row.EUdeText,
        description:caption ? caption.USenText : '',source:table,
        icon:icons.includes(key+'.png') ? 'data/OoT/icons/'+key+'.png' : null,
        coordinates:null};
    });
  }
  const unplaced = {items:definitions('ActorMsg/PouchContent.csv'),npcs:definitions('ActorMsg/Npc.csv'),
    enemies:definitions('ActorMsg/Enemy.csv'),locations:(text['LocationMsg/Location.csv'] || []).map(row=>
      ({key:row.Label,name:row.USenText,coordinates:null}))};
  write('unplaced-content.json',unplaced);
  write('container.json',[{id:GAME,name:'Ocarina of Time (2026)',shortName:'OoT',icon:'Ocarina-of-Time',markerURL:'markers/',markerExt:'png',
    bgColor:'#241a0c',showMapControl:'1',showZoomControl:'1',centerX:'128',centerY:'-128',boundTopX:'10',boundTopY:'-10',
    boundBottomX:'-266',boundBottomY:'266',clusterMaxZoom:'6',clusterGridSize:'30',defaultZoom:'1',maxZoom:'6',
    tileSize:'256',iconWidth:'23',iconHeight:'23',iconSmallWidth:'16',iconSmallHeight:'16',switchIconsAtZoom:'-1',
    scaleP:'1',scaleN:'-1',offsetX:'0',offsetY:'0',visible:'1',assetPreview:true}]);
  write('maps.json',maps); write('categories.json',categories);
  // Markers come from pois.json beside this script (see pois-to-markers.cjs),
  // so swapping in better data later means replacing that one file.
  const placedMarkers = require('./pois-to-markers.cjs')(JSON.parse(fs.readFileSync(path.join(__dirname,'pois.json'),'utf8')));
  write('markers.json', placedMarkers);
  const availableKeys = new Set(['Hyrule', ...fields.map(f=>f.split('_')[0]), ...floors.map(f=>f.split('_')[0])]);
  const unplacedLocationLabels = (text['LocationMsg/Location.csv'] || []).filter(row=>!availableKeys.has(row.Label))
    .map(row=>({key:row.Label,name:row.USenText}));
  write('import-report.json',{schemaVersion:1,game:'OoT',containerId:GAME,maps:maps.length,submaps:assets.length,tileCount,
    icons:icons.length,textFiles:Object.keys(text).length,placedPOIs:placedMarkers.length,
    unplacedDefinitions:Object.fromEntries(Object.entries(unplaced).map(([kind,rows])=>[kind,rows.length])),
    unplacedLocationLabels,
    limitations:['No actor placement, scene coordinates, map transforms, or POI coordinate tables are present.',
      'World scene layout is an editable geographic approximation, not surveyed coordinates. Illustration excluded.',
      'Clean Mini textures form the world composites. Dungeon Back/Alpha/Grad/All files are supporting masks.',
      'Categories and icons are ready, but no collectible/NPC/item markers are invented from dialogue.'],assets});
  console.log(JSON.stringify({maps:maps.length,submaps:assets.length,tileCount,icons:icons.length,textFiles:Object.keys(text).length}));
}
if(require.main === module) main(process.argv[2]).catch(error=>{console.error(error.message);process.exitCode=1;});
module.exports = {csv,friendly,slug};
