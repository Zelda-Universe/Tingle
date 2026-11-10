const fs=require('fs');
const vm=require('vm');
const source=fs.readFileSync(require('path').join(__dirname,'../scripts/widgets/SearchMarkerListEntry.js'),'utf8');
test('locations name the correct variant, including after changing age',()=>{
  let current={mapId:65000,subMapId:650000};
  const context={markerLocationNameCache:{},getNearestMarkerAreaName:()=>'',
    zMap:{mapOptions:{shortName:'OoTR'},mapControl:{getCurrentMap:()=>current},maps:[
      {originalId:65000,defaultSubMapId:650000,mapName:'Hyrule',submapName:'Child'},
      {originalId:65000,defaultSubMapId:650001,mapName:'Hyrule',submapName:'Adult'}]}};
  vm.runInNewContext(source.slice(source.indexOf('function getMarkerLocationName('),source.indexOf('// The area a POI')),context);
  const marker={id:1,mapId:65000,submapId:650000,globalMarker:1};
  expect(context.getMarkerLocationName(marker)).toBe('Hyrule');
  current={mapId:65000,subMapId:650001};
  expect(context.getMarkerLocationName(marker)).toBe('Hyrule');
  expect(context.getMarkerLocationName({...marker,globalMarker:0})).toBe('Hyrule (Child)');
  expect(context.getMarkerLocationName({...marker,globalMarker:0,submapId:650001})).toBe('Hyrule (Adult)');
});
