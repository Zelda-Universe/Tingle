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

test('shared list icons read POI treatments from raw category records',()=>{
  const context={getPOIStyle:c=>c.poiStyle,getSetOrDefaultValues:values=>values.find(v=>v!==undefined)};
  vm.runInNewContext(fs.readFileSync(require('path').join(__dirname,'../scripts/widgets/CategoryIcon.js'),'utf8'),context);
  const icon=Object.create(context.CategoryIcon.prototype);
  icon._initSettings({container_id:'64',poiStyle:'heart',img:'OoT_HeartPiece',color:'#cdb269'});
  expect(icon.poiStyle).toBe('heart');
  expect(icon.iconClass).toBe('OoT_HeartPiece');
});

test('area SEO catalog has unique variant URLs and area-specific descriptions',()=>{
  const helper=require('path').resolve(__dirname,'../lib/common/seo.php');
  const areas=JSON.parse(require('child_process').execFileSync('php',['-r',`require ${JSON.stringify(helper)}; echo json_encode(seoAreaPages());`],{encoding:'utf8'}));
  expect(areas.filter(a=>!a.isMap).length).toBe(40);
  expect(areas.filter(a=>a.isMap).length).toBe(66);
  expect(new Set(areas.map(a=>a.url)).size).toBe(areas.length);
  for(const area of areas) {
    expect(area.description).toContain(area.name);
    expect(area.description).toContain('Ocarina of Time');
    expect(area.description).toContain('Remake (2026)');
    expect(new URL(area.url).searchParams.get('area')).toBe(area.key);
    expect(new URL(area.url).searchParams.get('subMap')).toBe(area.subMap);
  }
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
