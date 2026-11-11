const fs=require('fs');
const vm=require('vm');
test('saving updates region display in place without replacing structural attributes',()=>{
  const context={ZMap:function(){}};
  vm.runInNewContext(fs.readFileSync('scripts/services/AreaSearch.js','utf8'),context);
  const bounds=[[1,2],[3,4]],rings=[[]];
  const raw={id:20,name:'Old',polygon:{coordinates:[]},connectionKey:'Original',labelMarkerId:10};
  const label={id:10,title:'Old',name:'Old',submapId:1,setTooltipContent:jest.fn()};
  const region={id:20,name:'Old',bounds,rings,connectionKey:'Original',labelMarkerId:10,label};
  const area={id:'area-1-Old',name:'Old',submapId:1,region};
  const poi={submapId:1,gameData:{areaName:'Old',actor:'unchanged'}};
  const map=Object.assign(Object.create(context.ZMap.prototype),{maps:[{submapRegions:[{regions:[raw]}],_regions:[region]}],getMarkers:()=>[label,poi],_wikiEscape:s=>s});
  map._applyAreaEdit(area,{kind:'region',id:20},'New','Description');
  expect(area.name).toBe('New');
  expect(raw.name).toBe('New');
  expect(region.description).toBe('Description');
  expect(label.setTooltipContent).toHaveBeenCalledWith('New');
  expect(poi.gameData.areaName).toBe('New');
  expect(region.bounds).toBe(bounds);
  expect(region.rings).toBe(rings);
  expect(region.connectionKey).toBe('Original');
  expect(region.labelMarkerId).toBe(10);
});
test('renamed labels retain their exact polygon association despite duplicate names',()=>{
  const context={ZMap:function(){}};
  vm.runInNewContext(fs.readFileSync('scripts/services/AreaSearch.js','utf8'),context);
  const label={id:10,submapId:1,categoryTypeId:3,categoryId:2,title:'Changed label'};
  const duplicate={id:11,submapId:1,categoryTypeId:3,categoryId:2,title:'Changed region'};
  const region={id:20,labelMarkerId:10,submapId:1,kind:'area',name:'Changed region',bounds:[[1,2],[3,4]]};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    getMarkers:()=>[label,duplicate],categories:{2:{name:'Area Labels'}},maps:[{}],_layerRegions:()=>[region]
  });
  map._attachAreaBorders();
  expect(region.label).toBe(label);
  expect(label.region).toBe(region);
  expect(label.bounds).toBe(region.bounds);
  expect(duplicate.region).toBeUndefined();
  expect(map._areaLabelMarker({id:'area-1-name',markerCategoryTypeId:3,region})).toBe(label);
});
