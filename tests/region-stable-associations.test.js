const fs=require('fs');
const vm=require('vm');
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
