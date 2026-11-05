const fs = require('fs');
const path = require('path');
const vm = require('vm');
const {csv} = require('../dev/assets/oot/import-assets.cjs');
const read = name => JSON.parse(fs.readFileSync(path.join(__dirname,'../data/OoT',name+'.json'),'utf8'));

test('CSV importer preserves quoted commas, newlines, escaped quotes and Unicode',()=>{
  expect(csv('Label,USenText,JPjaText\r\nA,"Hello, \"\"Link\"\"\nAgain",リンク\r\n')).toEqual([
    {Label:'A',USenText:'Hello, "Link"\nAgain',JPjaText:'リンク'}
  ]);
});

test('OoT pack exposes all distinct maps and main-texture variants without invented POIs',()=>{
  const maps=read('maps'),report=read('import-report');
  expect(maps).toHaveLength(32);
  expect(maps.flatMap(m=>m.subMap)).toHaveLength(116);
  expect(new Set(maps.map(m=>m.id)).size).toBe(maps.length);
  expect(new Set(maps.flatMap(m=>m.subMap.map(s=>s.id))).size).toBe(116);
  expect(maps.filter(m=>m.kind==='region')).toHaveLength(21);
  expect(maps.filter(m=>m.kind==='dungeon')).toHaveLength(10);
  expect(read('markers')).toEqual([]);
  expect(report.placedPOIs).toBe(0);
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

test('every category icon is an actual supplied asset and every category belongs to a group',()=>{
  const categories=read('categories');
  for(const category of categories.filter(c=>c.parent_id)) {
    expect(categories.some(c=>c.id===category.parent_id)).toBe(true);
    expect(fs.existsSync(path.join(__dirname,'../data/OoT/icons',category.img.replace(/^OoT_/, '')+'.png'))).toBe(true);
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
  expect(map.maps).toHaveLength(116);
  expect(new Set(map.maps.map(m=>m.id)).size).toBe(116);
  expect(map.maps.every(m=>m._url.startsWith('/tiles/oot/'))).toBe(true);
  expect(map.maps.some(m=>/Water level 3/.test(m.title))).toBe(true);
});
