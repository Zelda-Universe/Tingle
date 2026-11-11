/** @jest-environment jsdom */
const fs=require('fs');
const vm=require('vm');
const $=require('jquery');
const path=require('path');
const source=fs.readFileSync(path.join(__dirname,'../scripts/zwiki.js'),'utf8');
const context={ZMap:function(){},$};
vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._markerEditorToolsHTML ='),source.indexOf('ZMap.prototype._refreshMarkerEditorTools =')),context);
const editor=Object.assign(Object.create(context.ZMap.prototype),{
  _isWikiEditor:()=>true,_canEditMarker:()=>true,getUser:()=>({level:10}),
  _wikiEscape:String,_wikiUserLink:(id,name)=>`<a>${name}</a>`
});
test('marker and region controls share markup, identity and attribution',()=>{
  const marker={id:123,userId:7,userName:'Original author'};
  const poi=$(editor._markerEditorToolsHTML(marker));
  const region=$(editor._markerEditorToolsHTML(marker,{regionMode:true,allowDelete:false}));
  expect(poi.find('.marker-editor-buttons button').map((i,e)=>e.textContent).get()).toEqual(['Edit','History','Talk','Delete']);
  expect(region.find('.marker-editor-buttons button').map((i,e)=>e.textContent).get()).toEqual(['Edit','History','Talk']);
  expect(region.find('.marker-editor-meta').text()).toContain('Marker #123');
  expect(region.find('.marker-editor-meta').text()).toContain('Original author');
});
test('unbacked regions do not invent a Talk page or creator',()=>{
  const region=$(editor._markerEditorToolsHTML({id:321},{regionMode:true,allowDelete:false,talk:false,identityLabel:'Region'}));
  expect(region.find('.marker-editor-meta').text()).toBe('Region #321');
  expect(region.find('.marker-editor-buttons button').map((i,e)=>e.textContent).get()).toEqual(['Edit','History']);
});
test('area label identity resolves to the existing marker',()=>{
  const areaSource=fs.readFileSync(path.join(__dirname,'../scripts/services/AreaSearch.js'),'utf8');
  vm.runInNewContext(areaSource,context);
  const label={id:123,categoryTypeId:3};
  const map=Object.assign(Object.create(context.ZMap.prototype),{cachedMarkersById:{123:label}});
  expect(map._areaLabelMarker({id:123,categoryTypeId:3})).toBe(label);
  expect(map._areaLabelMarker({region:{label}})).toBe(label);
  expect(map._areaLabelMarker({mapDestination:true,mapId:64024})).toBeNull();
});
