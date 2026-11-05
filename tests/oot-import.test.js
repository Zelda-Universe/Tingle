const fs = require('fs');
const path = require('path');
const vm = require('vm');
const {csv} = require('../dev/assets/oot/import-assets.cjs');
const read = name => JSON.parse(fs.readFileSync(path.join(__dirname,'../data/OoT',name+'.json'),'utf8'));

test('OoT marker titles omit their area while retaining separate area metadata',()=>{
  const convert=require('../dev/assets/oot/pois-to-markers.cjs');
  const pois=require('../dev/assets/oot/pois.json');
  const converted=convert(pois);
  const marker=converted.find(m=>m.id==='64100010');
  expect(marker.name).toBe('Piece of Heart - Windmill');
  expect(JSON.parse(marker.gameData).areaName).toBe('Kakariko Village');
  expect(converted.find(m=>m.id==='64100003').name).toBe('Piece of Heart - Tower');
  expect(JSON.parse(converted.find(m=>m.id==='64100003').gameData).areaName).toBe('Lon Lon Ranch');
  expect(converted.every(m=>JSON.parse(m.gameData).areaName)).toBe(true);
  expect(converted.every(m=>!m.name.includes('—') && !m.tabText.includes('—'))).toBe(true);
  expect(converted.every(m=>m.tabText.includes('<p>') && m.tabText.length>30)).toBe(true);
});

test('OoTR and legacy OoT both resolve to the pack and replace placeholder games',()=>{
  const helper=path.resolve(__dirname,'../lib/common/oot_pack.php');
  const script=`require ${JSON.stringify(helper)}; echo json_encode([ootPackIsGame('OoTR'),ootPackIsGame('OoT'),ootPackAppendGame([['id'=>'999','shortName'=>'OoTR'],['id'=>'998','shortName'=>'OoT']])]);`;
  const result=JSON.parse(require('child_process').execFileSync('php',['-r',script],{encoding:'utf8'}));
  expect(result[0]).toBe(true); expect(result[1]).toBe(true);
  expect(result[2]).toHaveLength(1);
  expect(result[2][0].id).toBe('64');
  expect(result[2][0].shortName).toBe('OoTR');
});

test('age changes retain shared marker pins and deselect age-specific markers',()=>{
  const source=fs.readFileSync(path.join(__dirname,'../scripts/zmap.js'),'utf8');
  const start=source.indexOf('ZMap.prototype._reconcileOotMarkerSelection =');
  const end=source.indexOf('\n};',start)+3;
  const pin={markerPos:0};
  const context={ZMap:function(){},newMarker:pin,markers:[{mapId:'65000',submapId:'650000',globalMarker:'1'}],
    URL,window:{location:{href:'https://example.test/?marker=42'},history:{state:{},replaceState:jest.fn()}}};
  vm.runInNewContext(source.slice(start,end),context);
  const control={_contentType:'m42',resetContent:jest.fn()};
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:control,
    _closeNewMarker:jest.fn(()=>{context.newMarker=null;})});
  map._reconcileOotMarkerSelection('65000','650001');
  expect(context.newMarker).toBe(pin);
  expect(map._closeNewMarker).not.toHaveBeenCalled();
  context.markers[0].globalMarker='0';
  map._reconcileOotMarkerSelection('65000','650001');
  expect(context.newMarker).toBeNull();
  expect(control.resetContent).toHaveBeenCalled();
  expect(context.window.history.replaceState.mock.calls[0][2]).not.toContain('marker=');
});

test('OoT API attaches artwork hashes to tile URLs without changing source data',()=>{
  const {execFileSync}=require('child_process');
  const helper=path.resolve(__dirname,'../lib/common/oot_pack.php');
  const maps=JSON.parse(execFileSync('php',['-r',`require ${JSON.stringify(helper)}; echo json_encode(ootPackData('maps'));`],{encoding:'utf8'}));
  const assets=read('import-report').assets;
  for(const map of maps) for(const sub of map.subMap) {
    const asset=assets.find(a=>a.tileURL===sub.tileURL);
    expect(sub.tileVersion).toBe(asset.sha256.slice(0,16));
  }
});

test('CSV importer preserves quoted commas, newlines, escaped quotes and Unicode',()=>{
  expect(csv('Label,USenText,JPjaText\r\nA,"Hello, \"\"Link\"\"\nAgain",リンク\r\n')).toEqual([
    {Label:'A',USenText:'Hello, "Link"\nAgain',JPjaText:'リンク'}
  ]);
});

test('OoT pack exposes all distinct maps and main-texture variants',()=>{
  const maps=read('maps'),report=read('import-report');
  expect(maps).toHaveLength(11);
  expect(maps.flatMap(m=>m.subMap)).toHaveLength(66);
  expect(new Set(maps.map(m=>m.id)).size).toBe(maps.length);
  expect(new Set(maps.flatMap(m=>m.subMap.map(s=>s.id))).size).toBe(66);
  expect(maps.filter(m=>m.kind==='world').map(m=>m.name)).toEqual(['Hyrule']);
  expect(maps.find(m=>m.kind==='world').subMap.map(s=>s.name)).toEqual(['Child','Adult']);
  const [child,adult]=maps.find(m=>m.kind==='world').subMap;
  expect(child.placeLabels).toHaveLength(20);
  expect(adult.placeLabels).toHaveLength(20);
  expect(child.placeLabels.some(p=>p.name==='Hyrule Castle')).toBe(true);
  expect(adult.placeLabels.some(p=>p.name==="Ganon's Castle")).toBe(true);
  expect(adult.placeLabels.every(p=>Number.isFinite(p.x)&&Number.isFinite(p.y))).toBe(true);
  const boxes=require('../dev/assets/oot/world-boxes.json');
  const kakariko=child.placeLabels.find(p=>p.name==='Kakariko Village');
  const [x,y,w,h]=boxes.boxes.Child.KakarikoVillage;
  expect(kakariko.bounds).toEqual([[-(y+h)/32,x/32],[-y/32,(x+w)/32]]);
  expect(maps.some(m=>m.kind==='overview' || m.kind==='region')).toBe(false);
  expect(maps.filter(m=>m.kind==='dungeon')).toHaveLength(10);
  // Markers are the hand-placed collectibles in dev/assets/oot/pois.json.
  const pois=JSON.parse(fs.readFileSync(path.join(__dirname,'../dev/assets/oot/pois.json'),'utf8'));
  expect(read('markers')).toEqual(require('../dev/assets/oot/pois-to-markers.cjs')(pois));
  expect(report.placedPOIs).toBe(pois.length);
  expect(Object.keys(read('text-catalog'))).toHaveLength(540);
  const definitions=read('unplaced-content');
  expect(definitions.items).toHaveLength(185);
  expect(definitions.npcs).toHaveLength(90);
  expect(definitions.enemies).toHaveLength(90);
  expect(Object.values(definitions).flat().every(row=>row.coordinates===null)).toBe(true);
  for(const map of maps) for(const sub of map.subMap) {
    expect(sub.tileBaseURL).toBe('/tiles/');
    expect(fs.existsSync(path.join(__dirname,'../',sub.iconURL))).toBe(true);
  }
});

test('every category icon exists and every category belongs to a group',()=>{
  const categories=read('categories');
  for(const category of categories.filter(c=>c.parent_id)) {
    expect(categories.some(c=>c.id===category.parent_id)).toBe(true);
    // A supplied PNG, or an SVG drawn for the site (Heart Pieces).
    const name=category.img.replace(/^OoT_/, '');
    if(!category.img.startsWith('OoT_')) {
      const css=['style.css','poi.css'].map(file=>fs.readFileSync(path.join(__dirname,'../styles',file),'utf8')).join('\n');
      expect(css).toMatch(new RegExp('\\.icon-'+category.img+'::?before'));
      continue;
    }
    expect(['.png','.svg'].some(ext=>fs.existsSync(path.join(__dirname,'../data/OoT/icons',name+ext)))).toBe(true);
  }
});

test('hand-placed OoT collectibles are complete, unique and on real categories and maps',()=>{
  const pois=JSON.parse(fs.readFileSync(path.join(__dirname,'../dev/assets/oot/pois.json'),'utf8'));
  const categories=new Set(read('categories').map(c=>c.id));
  const markers=read('markers');
  expect(new Set(markers.map(m=>m.id)).size).toBe(markers.length);
  expect(markers.every(m=>categories.has(m.markerCategoryId))).toBe(true);
  // All 36 Pieces of Heart and 100 Gold Skulltulas in the remake.
  expect(pois.filter(p=>p.category==='64002')).toHaveLength(36);
  expect(pois.filter(p=>p.category==='64001')).toHaveLength(100);
  expect(pois.filter(p=>p.category==='64003')).toHaveLength(10);
  // Dungeon markers name a floor of their own dungeon.
  const floors=new Map(read('maps').flatMap(m=>m.subMap.map(s=>[s.id,m.id])));
  for(const p of pois.filter(p=>p.submap)) expect(floors.get(p.submap)).toBe(p.map);
  for(const p of pois) expect(['child','adult','both']).toContain(p.age);
  // Overworld markers sit inside a real area of the Hyrule layout.
  const areas=new Set(require('../dev/assets/oot/world-layout.json').regions.map(r=>r[0]));
  for(const p of pois.filter(p=>p.map==='65000')) {
    expect(areas.has(p.region)).toBe(true);
    expect(p.u).toBeGreaterThanOrEqual(0); expect(p.u).toBeLessThanOrEqual(1);
    expect(p.v).toBeGreaterThanOrEqual(0); expect(p.v).toBeLessThanOrEqual(1);
  }
  for(const m of markers) {
    expect(+m.x).toBeGreaterThanOrEqual(0); expect(+m.x).toBeLessThanOrEqual(256);
    expect(+m.y).toBeLessThanOrEqual(0); expect(+m.y).toBeGreaterThanOrEqual(-256);
  }
});

test('all OoT floors, age variants and room states become selectable map layers',()=>{
  const source=fs.readFileSync(__dirname+'/../scripts/zmap.js','utf8');
  const context={ZMap:function(){},L:{tileLayer:(url,options)=>({_url:url,options})}};
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype.addMap ='),source.indexOf('ZMap.prototype.addMarkers =')),context);
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    mapOptions:read('container')[0],maps:[],tilesBaseURL:'https://zeldamaps.com/tiles/',tileNameFormat:'{z}_{x}_{y}'
  });
  read('maps').forEach(m=>map.addMap(m));
  expect(map.maps).toHaveLength(66);
  expect(new Set(map.maps.map(m=>m.id)).size).toBe(66);
  expect(map.maps.every(m=>m._url.startsWith('/tiles/oot/'))).toBe(true);
  expect(map.maps.some(m=>/Water level 3/.test(m.title))).toBe(true);
});
