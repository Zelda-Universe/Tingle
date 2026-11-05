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
  GanonCastle: "Ganon's Castle", DodongoCavern: "Dodongo's Cavern" }[key] || key.replace(/([a-z])([A-Z])/g, '$1 $2'));
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
  async function render(file, dest) {
    const buffer = fs.readFileSync(file);
    const sha256 = crypto.createHash('sha256').update(buffer).digest('hex');
    const meta = await sharp(buffer).metadata();
    const maxZoom = Math.ceil(Math.log2(Math.max(meta.width, meta.height) / 256));
    const side = 256 * 2 ** maxZoom;
    const existing = previous.find(asset => asset.source === path.relative(source,file) && asset.sha256 === sha256);
    if(existing && fs.existsSync(path.join(ROOT,'tiles',existing.tileURL,`${maxZoom}_${2 ** maxZoom - 1}_${2 ** maxZoom - 1}.webp`))) {
      assets.push(existing);
      tileCount += (4 ** (maxZoom + 1) - 1) / 3;
      return { maxZoom, tileURL: existing.tileURL };
    }
    const offsetX = Math.floor((side - meta.width) / 2), offsetY = Math.floor((side - meta.height) / 2);
    const canvas = await sharp({ create: { width: side, height: side, channels: 4, background: '#241a0c' } })
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
    fs.mkdirSync(path.join(out, 'previews'), {recursive:true});
    await sharp(canvas).resize(256,256).webp({quality:85}).toFile(path.join(out, 'previews', dest + '.webp'));
    assets.push({source:path.relative(source,file), sha256,
      width:meta.width, height:meta.height, maxZoom, tileURL:relative, offsetX, offsetY});
    return { maxZoom, tileURL:relative };
  }
  async function addMap(key, name, files, kind) {
    const id = String(mapId++), subMap = [];
    for(const [i, file] of files.entries()) {
      const stem = path.basename(file, path.extname(file));
      const suffix = stem.startsWith(key + '_') ? stem.slice(key.length + 1).replace(/_Main$/, '') : 'Overview';
      const dest = slug(key + '-' + suffix);
      const rendered = await render(file, dest);
      const variant = suffix.replace(/_/g, ' · ').replace(/State(\d+)/g, 'State $1').replace(/Lv(\d+)/g, 'Water level $1');
      subMap.push({id:String(submapId++),name:variant, mapTypeName:'FlatMap',googleDefault:'0',
        tileURL:rendered.tileURL, tileBaseURL:'/tiles/',tileExt:'webp',img404:'blank',emptyMap:'0',
        mapMapper:'Supplied OoT asset dump; texture placement preserved',isDefault:i === 0 ? '1':'0',opacity:'1',
        iconURL:'data/OoT/previews/' + dest + '.webp',maxZoom:String(rendered.maxZoom),submapLayer:[]});
    }
    maps.push({id,name,defaultZoom:'1',maxZoom:String(Math.max(...subMap.map(s=>Number(s.maxZoom)))),
      mapCopyright:'Map artwork © Nintendo. Local asset preview; no coordinate data supplied.',kind,subMap});
    console.log(name + ': ' + subMap.length + ' map variants');
  }
  await addMap('Hyrule', 'Hyrule — Illustrated Overview', [path.join(source,'O5gaxzr81p.webp')], 'overview');
  await sharp(path.join(source,'O5gaxzr81p.webp')).resize(1200,630,{fit:'cover'}).webp({quality:85})
    .toFile(path.join(ROOT,'images/social-oot.webp'));
  const fields = fs.readdirSync(field).filter(f => f.endsWith('.png') && !f.startsWith('Mini_')).sort((a,b)=>
    Number(a.includes('_Adult_')) - Number(b.includes('_Adult_')) || a.localeCompare(b));
  for(const key of [...new Set(fields.map(f=>f.split('_')[0]))])
    await addMap(key, friendly(key), fields.filter(f=>f.startsWith(key+'_')).map(f=>path.join(field,f)), 'region');
  const floors = fs.readdirSync(dungeon).filter(f=>f.endsWith('_Main.png')).sort((a,b)=>a.localeCompare(b, 'en', {numeric:true}));
  for(const key of [...new Set(floors.map(f=>f.split('_')[0]))])
    await addMap(key, friendly(key), floors.filter(f=>f.startsWith(key+'_')).map(f=>path.join(dungeon,f)), 'dungeon');
  const icons = fs.readdirSync(iconDir).filter(f=>f.endsWith('.png')).sort();
  fs.mkdirSync(path.join(out,'icons'),{recursive:true});
  for(const file of icons) await sharp(path.join(iconDir,file)).resize(128,128,{fit:'inside'}).png().toFile(path.join(out,'icons',file));
  const categories = [], iconCSS = [];
  const groups = [
    ['Collectibles', [ ['Gold Skulltulas','Item_Token_Gold','relic'], ['Items','Item_Boomerang','interest'],
      ['Ocarinas & Songs','Item_Ocarina_Time','memory'], ['Bottles','Item_Bottle_Milk','memory'] ]],
    ['Equipment', [ ['Swords','Weapon_Sword_Master','treasure'], ['Shields','Weapon_Shield_Hylian','treasure'],
      ['Bows','Weapon_Range_Bow','treasure'], ['Slingshots','Weapon_Range_SlingShot','treasure'] ]],
    ['Dungeon Items', [ ['Small Keys','Item_Dungeon_SmallKey','treasure'], ['Boss Keys','Item_Dungeon_BossKey','treasure'],
      ['Dungeon Maps','Item_Dungeon_Map','location'], ['Compasses','Item_Dungeon_Compass','location'] ]]
  ];
  let categoryId = 64000;
  for(const [group, leaves] of groups) {
    const parent = String(categoryId++);
    const base = {container_id:GAME,marker_category_type_id:'1',default_checked:true,visible:true,visible_zoom:'0',zoom_min:'0',zoom_max:'6',min_zoom:'0',max_zoom:'6',color:'#cdb269'};
    categories.push({...base,id:parent,parent_id:null,name:group,img:'General_Map',poiStyle:''});
    for(const [name,icon,style] of leaves) {
      if(!fs.existsSync(path.join(out,'icons',icon+'.png'))) throw new Error('Missing category icon '+icon);
      const glyph = 'OoT_' + icon;
      categories.push({...base,id:String(categoryId++),parent_id:parent,name,img:glyph,poiStyle:style});
      iconCSS.push(`.icon-${glyph}::before { content: ''; display: inline-block; width: 1em; height: 1em; background: url('icons/${icon}.png') center / contain no-repeat; vertical-align: middle; }`);
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
  write('container.json',[{id:GAME,name:'Ocarina of Time',shortName:'OoT',icon:'OoT',markerURL:'markers/',markerExt:'png',
    bgColor:'#241a0c',showMapControl:'1',showZoomControl:'1',centerX:'128',centerY:'-128',boundTopX:'10',boundTopY:'-10',
    boundBottomX:'-266',boundBottomY:'266',clusterMaxZoom:'6',clusterGridSize:'30',defaultZoom:'1',maxZoom:'6',
    tileSize:'256',iconWidth:'23',iconHeight:'23',iconSmallWidth:'16',iconSmallHeight:'16',switchIconsAtZoom:'-1',
    scaleP:'1',scaleN:'-1',offsetX:'0',offsetY:'0',visible:'1',assetPreview:true}]);
  write('maps.json',maps); write('categories.json',categories); write('markers.json',[]);
  const availableKeys = new Set(['Hyrule', ...fields.map(f=>f.split('_')[0]), ...floors.map(f=>f.split('_')[0])]);
  const unplacedLocationLabels = (text['LocationMsg/Location.csv'] || []).filter(row=>!availableKeys.has(row.Label))
    .map(row=>({key:row.Label,name:row.USenText}));
  write('import-report.json',{schemaVersion:1,game:'OoT',containerId:GAME,maps:maps.length,submaps:assets.length,tileCount,
    icons:icons.length,textFiles:Object.keys(text).length,placedPOIs:0,
    unplacedDefinitions:Object.fromEntries(Object.entries(unplaced).map(([kind,rows])=>[kind,rows.length])),
    unplacedLocationLabels,
    limitations:['No actor placement, scene coordinates, map transforms, or POI coordinate tables are present.',
      'The illustrated overview is not georeferenced to the separate regional textures.',
      'Mini textures are thumbnails, and dungeon Back/Alpha/Grad/All files are supporting masks, not additional playable floors.',
      'Categories and icons are ready, but no collectible/NPC/item markers are invented from dialogue.'],assets});
  console.log(JSON.stringify({maps:maps.length,submaps:assets.length,tileCount,icons:icons.length,textFiles:Object.keys(text).length}));
}
if(require.main === module) main(process.argv[2]).catch(error=>{console.error(error.message);process.exitCode=1;});
module.exports = {csv,friendly,slug};
