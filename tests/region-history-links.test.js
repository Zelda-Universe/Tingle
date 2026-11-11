/** @jest-environment jsdom */
const fs=require('fs');
const vm=require('vm');
const $=require('jquery');
const source=fs.readFileSync(require('path').join(__dirname,'../scripts/zwiki.js'),'utf8');
const context={ZMap:function(){},$};
vm.runInNewContext(source,context);

test('talk can show View Marker even when Back already returns to the selected marker',()=>{
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{_skipNextSlide:false},cachedMarkersById:{123:{id:123,visible:true}},_wikiMarkerReachable:()=>true,_openMarkerLink:jest.fn(function() {expect(map.mapControl._skipNextSlide).toBe(true);})});
  const page=$('<div><div class="wiki-subtitle-row"><p class="wiki-subtitle"></p></div></div>');
  map._wikiSetMarkerSubtitle(page,'Marker',123,null,{fromMarker:123},{view:true});
  expect(page.find('button').text()).toBe('View Marker');
  page.find('button').trigger('click');
  expect(map._openMarkerLink).toHaveBeenCalledWith(123,null,{fromMarker:123},null);
  expect(map.mapControl._skipNextSlide).toBe(false);
});

test('label history links open the region page rather than a marker popup',()=>{
  const label={id:123,categoryTypeId:3,visible:true};
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    cachedMarkersById:{123:label},mapOptions:{shortName:'OoTR'},
    mapControl:{returnNextPageTo:jest.fn()},navigateToArea:jest.fn(),goTo:jest.fn()
  });
  const page=$('<div><div class="wiki-subtitle-row"><p class="wiki-subtitle"></p></div></div>');
  map._wikiSetMarkerSubtitle(page,'Region',123,'OoTR',null);
  expect(page.find('button').text()).toBe('Go to Region');
  page.find('button').trigger('click');
  expect(map.navigateToArea).toHaveBeenCalledWith(label);
  expect(map.goTo).not.toHaveBeenCalled();
});

test('ordinary marker history links keep marker navigation',()=>{
  const map=Object.assign(Object.create(context.ZMap.prototype),{
    cachedMarkersById:{123:{id:123,categoryTypeId:1,visible:true}},mapOptions:{shortName:'OoTR'},
    mapControl:{},navigateToArea:jest.fn(),goTo:jest.fn()
  });
  const page=$('<div><div class="wiki-subtitle-row"><p class="wiki-subtitle"></p></div></div>');
  map._wikiSetMarkerSubtitle(page,'Marker',123,'OoTR',null);
  expect(page.find('button').text()).toBe('Go to Marker');
  page.find('button').trigger('click');
  expect(map.goTo).toHaveBeenCalledWith({marker:123});
});
