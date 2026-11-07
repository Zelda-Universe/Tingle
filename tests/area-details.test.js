const fs=require('fs');
const vm=require('vm');
const source=fs.readFileSync(require('path').join(__dirname,'../scripts/services/AreaSearch.js'),'utf8');

test('selected area follows the active map variant',()=>{
  const context={ZMap:function(){},L:{latLngBounds:b=>b}};
  vm.runInNewContext(source,context);
  const adult={id:'field',areaDestination:true,name:'Hyrule Field',mapId:'65000',submapId:'650001',bounds:[[-2,1],[-1,2]]};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    selectedArea:{...adult,submapId:'650000'},
    mapControl:{getContentType:()=> 'area-field-variant-650000',getCurrentMap:()=>({mapId:'65000',subMapId:'650001'})},
    getAreaSearchEntries:()=>[adult],_showAreaPage:jest.fn(),updateUrl:jest.fn()
  });
  map.refreshSelectedAreaVariant();
  expect(map._showAreaPage).toHaveBeenCalledWith(adult,adult.bounds);
  expect(map.updateUrl).toHaveBeenCalled();
});

test("a place name's page follows the age switch to that age's own name",()=>{
  const context={ZMap:function(){},L:{latLngBounds:b=>b}};
  vm.runInNewContext(source,context);
  const label=(id,submapId)=>({id,name:'Lake Hylia',title:'Lake Hylia',categoryId:'64011',categoryTypeId:3,mapId:'65000',submapId});
  const child=label('64400015','650000'),adult=label('64410015','650001');
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    selectedArea:child,categories:{'64011':{name:'Area Labels'}},
    mapControl:{getContentType:()=> 'area-64400015-variant-650000',getCurrentMap:()=>({mapId:'65000',subMapId:'650001'}),resetContent:jest.fn()},
    getAreaSearchEntries:()=>[],getMarkers:()=>[child,adult],_showAreaPage:jest.fn(),updateUrl:jest.fn()
  });
  map.refreshSelectedAreaVariant();
  expect(map.mapControl.resetContent).not.toHaveBeenCalled();
  expect(map._showAreaPage).toHaveBeenCalledWith(adult,null);
});

test('shared list icons read POI treatments from raw category records',()=>{
  const context={getPOIStyle:c=>({'64002':'heart'})[c.id],getSetOrDefaultValues:values=>values.find(v=>v!==undefined)};
  vm.runInNewContext(fs.readFileSync(require('path').join(__dirname,'../scripts/widgets/CategoryIcon.js'),'utf8'),context);
  const icon=Object.create(context.CategoryIcon.prototype);
  icon._initSettings({id:'64002',container_id:'64',img:'OoT_HeartPiece',color:'#cdb269'});
  expect(icon.poiStyle).toBe('heart');
  expect(icon.iconClass).toBe('OoT_HeartPiece');
});

test('area SEO catalog has one page per area and dungeon, with counted descriptions',()=>{
  // A small OoT: Hyrule (Child and Adult) and one dungeon with three floors,
  // as seo.php reads them from the database.
  const maps=[
    {id:'65000',name:'Hyrule',kind:'world',subMaps:['650000','650001']},
    {id:'64031',name:'Water Temple',kind:'dungeon',subMaps:['640101','640102','640103']}
  ];
  const labels=[
    {name:'Hyrule Field',mapId:'65000',subMapId:'650000'},
    {name:'Zora&#039;s River',mapId:'65000',subMapId:'650000'},
    {name:'Hyrule Field',mapId:'65000',subMapId:'650001'},
    {name:"Zora's River",mapId:'65000',subMapId:'650001'},
    {name:"Ganon's Castle",mapId:'65000',subMapId:'650001'}
  ];
  const collectible=(mapId,categoryId,areaName='')=>({mapId,categoryId,areaName});
  const markers=[
    ...Array(4).fill(collectible('65000','64002',"Zora's River")),
    ...Array(4).fill(collectible('65000','64001',"Zora's River")),
    collectible('65000','64002','Hyrule Field'),
    collectible('64031','64001'),collectible('64031','64001')
  ];
  const helper=require('path').resolve(__dirname,'../lib/common/seo.php');
  const script=`require ${JSON.stringify(helper)}; $in=json_decode(stream_get_contents(STDIN), true);
    echo json_encode(seoFinishAreaPages(seoOotAreaPages($in['maps'], $in['labels'], $in['markers'])));`;
  const areas=JSON.parse(require('child_process').execFileSync('php',['-r',script],
    {encoding:'utf8',input:JSON.stringify({maps,labels,markers})}));
  // Each area once, both ages on one page; each map once, all floors on one page.
  expect(areas.filter(a=>!a.isMap).map(a=>a.name)).toEqual(['Hyrule Field',"Zora's River","Ganon's Castle"]);
  expect(areas.filter(a=>a.isMap).map(a=>a.name)).toEqual(['Hyrule','Water Temple']);
  expect(new Set(areas.map(a=>a.url)).size).toBe(areas.length);
  expect(new Set(areas.map(a=>a.description)).size).toBe(areas.length);
  for(const area of areas) {
    expect(area.description.startsWith(area.name+' map for Ocarina of Time Remake')).toBe(true);
    expect(area.description.length).toBeLessThanOrEqual(150);
    expect(area.key).not.toMatch(/[^a-z0-9-]/);
    expect(area.keys).toContain(area.key);
    expect(area.subMaps).toContain(area.subMap);
    expect(new URL(area.url).searchParams.get('game')).toBe('OoTR');
    expect(new URL(area.url).searchParams.get('area')).toBe(area.key);
    expect(new URL(area.url).searchParams.get('subMap')).toBe(area.subMap);
  }
  const river=areas.find(a=>a.name==="Zora's River");
  expect(river.key).toBe('zoras-river');
  expect(river.keys).toContain('zora-s-river'); // older links
  expect(river.subMaps).toEqual(['650000','650001']); // Child leads
  expect(river.description).toBe("Zora's River map for Ocarina of Time Remake: where to find its 4 Heart Pieces and 4 Gold Skulltulas.");
  expect(areas.find(a=>a.name==='Hyrule Field').description).toBe('Hyrule Field map for Ocarina of Time Remake: where to find its Heart Piece.');
  expect(areas.find(a=>a.name==="Ganon's Castle").subMap).toBe('650001'); // Adult only
  const temple=areas.find(a=>a.key==='map-64031');
  expect(temple.subMaps.length).toBe(3); // every floor
  expect(temple.description).toBe('Water Temple map for Ocarina of Time Remake, floor by floor: where to find its 2 Gold Skulltulas.');
  expect(areas.find(a=>a.key==='map-65000').description).toBe('Hyrule map for Ocarina of Time Remake: where to find its 5 Heart Pieces and 4 Gold Skulltulas.');
});

test('area lists only visible categories, matching maps/ages and contained POIs',()=>{
  const context={ZMap:function(){}};
  vm.runInNewContext(source,context);
  const marker=(id,categoryId,submapId,globalMarker,inside=true)=>({id,categoryId,submapId,globalMarker,
    mapId:'65000',categoryTypeId:1,dbVisible:1,getLatLng:()=>({inside})});
  const rows=[marker(1,1,'child',0),marker(2,2,'child',0),marker(3,1,'adult',0),
    marker(4,1,'adult',1),marker(5,1,'child',0,false)];
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    categories:{1:{checked:true},2:{checked:false}},mapOptions:{shortName:'OoT'},getMarkers:()=>rows
  });
  const results=map._getAreaMarkers({mapId:'65000',submapId:'child'},{contains:p=>p.inside});
  expect(Array.from(results,m=>m.id)).toEqual([1,4]);
});
