const fs=require('fs');
const vm=require('vm');
const source=fs.readFileSync('scripts/zmap.js','utf8');
const wiki=fs.readFileSync('scripts/zwiki.js','utf8');
const context={ZMap:function(){},URL,window:{location:{href:'https://zeldamaps.com/'}}};
vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype.navigateToMarker ='),source.indexOf('ZMap.prototype.goTo =')),context);
vm.runInNewContext(wiki,context);

test.each([1,6,8])('marker links zoom in without zooming out from zoom %s',zoom=>{
  const map=Object.assign(Object.create(context.ZMap.prototype),{cachedMarkersById:{5:{id:5,categoryTypeId:1}},map:{getZoom:()=>zoom},goTo:jest.fn()});
  map.navigateToMarker(5);
  expect(map.goTo).toHaveBeenCalledWith({marker:5,zoom:Math.max(zoom,6),centerInVisibleArea:true,panTo:false},true);
});

test('region links retain zoom-to-region behavior',()=>{
  const marker={id:5,categoryTypeId:3};
  const map=Object.assign(Object.create(context.ZMap.prototype),{cachedMarkersById:{5:marker},navigateToArea:jest.fn()});
  map.navigateToMarker(5);
  expect(map.navigateToArea).toHaveBeenCalledWith(marker);
});

test('history links and View Marker share navigation while preserving their Back destination',()=>{
  const back=Object.assign(()=>{}, {label:'History'});
  const map=Object.assign(Object.create(context.ZMap.prototype),{cachedMarkersById:{5:{id:5,categoryTypeId:1}},mapOptions:{shortName:'OoTR'},mapControl:{returnNextPageTo:jest.fn()},navigateToMarker:jest.fn()});
  map._openMarkerLink(5,null,back,'OoTR');
  expect(map.navigateToMarker).toHaveBeenCalledWith(5);
  expect(map.mapControl.returnNextPageTo).toHaveBeenCalledWith({page:back,label:'History'});
});

test('new-tab and cross-game marker links include a close-up zoom',()=>{
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapOptions:{shortName:'OoTR'}});
  const url=new URL(map._wikiMarkerURL(5,'BotW'));
  expect(url.searchParams.get('marker')).toBe('5');
  expect(url.searchParams.get('zoom')).toBe('6');
});

test('the shared visible-area path forces a partial mobile drawer',()=>{
  expect(source).toContain('_createMarkerPopup(marker, centerInVisibleArea)');
  const start=source.indexOf('  var forcePartialMobile =');
  const end=source.indexOf('ZMap.prototype._getDisplayZoom',start);
  const tail=source.slice(start,end).replace(/\n}\s*$/,'');
  for(const initial of [false,true]) {
    const mapControl={viewStyleBottomSlide:true,_restoringInitialPage:initial,openDrawerSmall:jest.fn()};
    vm.runInNewContext('(function(forcePartial){'+tail+'}).call(host,true)',{host:{mapControl}});
    expect(mapControl.openDrawerSmall).toHaveBeenCalledWith(true,initial);
  }
  for(const file of ['scripts/widgets/HeaderBar.js','scripts/widgets/SearchArea.js','scripts/services/CategoryPage.js','scripts/services/AreaSearch.js']) {
    expect(fs.readFileSync(file,'utf8')).toContain('navigateToMarker(marker.id)');
  }
});

test('marker framing uses the final partial drawer top while its resize is animating',()=>{
  const point=(x,y)=>({x,y,add:p=>point(x+p.x,y+p.y),subtract:p=>point(x-p.x,y-p.y)});
  const scope={ZMap:function(){},L:{point},window:{}};
  const start=source.indexOf('ZMap.prototype._setViewAtMarkerInVisibleArea =');
  vm.runInNewContext(source.slice(start,source.indexOf('ZMap.prototype.getMarkers',start)),scope);
  const map={getContainer:()=>({getBoundingClientRect:()=>({top:0,width:400,height:1000})}),getSize:()=>({x:400,y:1000}),project:()=>point(100,100),unproject:p=>[p.x,p.y],setView:jest.fn()};
  const host={map,mapControl:{viewStyleBottomSlide:true,_mobileDrawerBaseTop:50,_container:{getBoundingClientRect:()=>({top:100})}}};
  scope.ZMap.prototype._setViewAtMarkerInVisibleArea.call(host,{getLatLng:()=>({})},6,600);
  expect(map.setView).toHaveBeenCalledWith([100,275],6,{animate:false});
});
