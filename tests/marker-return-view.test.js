const fs=require('fs');
const path=require('path');
const vm=require('vm');
const zmapSource=fs.readFileSync(path.join(__dirname,'../scripts/zmap.js'),'utf8');

const point=(x,y)=>({x,y,distanceTo:o=>Math.hypot(o.x-x,o.y-y)});

// goTo + _openMarker + the marker return view methods, as one slice.
function loadOpenMarker() {
  const start=zmapSource.indexOf('ZMap.prototype.goTo = function');
  const end=zmapSource.indexOf('ZMap.prototype._setViewAtMarkerInVisibleArea',start);
  const settles=[];
  let center=point(100,100);
  const map={options:{zoomAnimationThreshold:4},
    getCenter:()=>center,
    getZoom:()=>5,
    getMaxZoom:()=>10,
    latLngToContainerPoint:p=>point(p.x,p.y),
    setView:jest.fn(),
    panTo:jest.fn(),
    once:(name,fn)=>{settles.push({name,fn});},
    off:(name,fn)=>{ for(let i=settles.length-1;i>=0;i--) if(settles[i].name===name && settles[i].fn===fn) settles.splice(i,1); }};
  const marker={id:5,visible:0,getLatLng:()=>({lat:51.5,lng:-0.5})};
  const zmap={
    cachedMarkersById:{5:marker},
    mapControl:{getCurrentMap:()=>({mapId:19,subMapId:1901}),changeMapToMarker:jest.fn(),changeMapOnly:jest.fn()},
    map,
    _createMarkerPopup:jest.fn(),
    _closeNewMarker:jest.fn(),
    _createPin:jest.fn(()=>({addTo:jest.fn().mockReturnThis()}))
  };
  const context={
    ZMap:function(){},
    ZConfig:{getConfig:()=>null},
    L:{latLng:(lat,lng)=>({lat,lng})},
    toastr:{error:jest.fn()},
    markers:[],
    newMarker:null,
    _this:zmap,
    window:{}
  };
  vm.runInNewContext(zmapSource.slice(start,end),context);
  Object.assign(zmap,context.ZMap.prototype);
  const result={zmap,map,marker};
  result.center=function(){return center;};
  result.setCenter=function(pointNow){center=pointNow;};
  result.fireEvent=function(name){settles.filter(e=>e.name===name).forEach(e=>e.fn());};
  result.fireSettles=function(){result.fireEvent('moveend');result.fireEvent('zoomend');};
  return result;
}

test('opening a marker remembers the view it left, re-reading where it landed',()=>{
  const h=loadOpenMarker();
  h.zmap.goTo({marker:5,panTo:false},true);
  const view=h.zmap._markerReturnView;
  expect(view.mapId).toBe(19);
  expect(view.subMapId).toBe(1901);
  expect(view.center).toBe(h.center());
  expect(view.zoom).toBe(5);
  // Seeded from the pre-move state, until the move settles...
  expect(view.arrived.center).toBe(h.center());
  expect(view.arrived.mapId).toBe(19);
  expect(h.map.setView).toHaveBeenCalledWith(expect.objectContaining({lat:51.5,lng:-0.5}),5);
  // ...where the map actually ends up (a clamp, or the settle) re-records it.
  h.setCenter(point(300,310));
  h.fireSettles();
  expect(view.arrived.center).toBe(h.center());
});

test('a later user zoom cannot overwrite a settled marker arrival',()=>{
  const h=loadOpenMarker();
  h.zmap.goTo({marker:5,panTo:false},true);
  h.setCenter(point(300,310));
  h.fireEvent('moveend');
  const arrival=h.zmap._markerReturnView.arrived;
  h.setCenter(point(500,510));
  h.fireEvent('zoomend');
  expect(h.zmap._markerReturnView.arrived).toBe(arrival);
  expect(h.zmap.restoreMarkerReturnView()).toBe(false);
});

test('a marker on another map: back restores the map and the view it left',()=>{
  const h=loadOpenMarker();
  // The marker lives on another map: the view is remembered before the move
  // (on the old map), and the map switch happens as part of it.
  const before=h.center();
  let current={mapId:19,subMapId:1901};
  h.zmap.mapControl.getCurrentMap=()=>current;
  h.zmap.mapControl.changeMapToMarker=()=>{current={mapId:22,subMapId:2201};};
  h.zmap.goTo({marker:5,panTo:false},true);
  expect(h.zmap._markerReturnView.mapId).toBe(19);
  h.setCenter(point(300,310));
  h.fireSettles();
  expect(h.zmap._markerReturnView.arrived.mapId).toBe(22); // settled on the marker's map
  expect(h.zmap.restoreMarkerReturnView()).toBe(true);
  expect(h.zmap.mapControl.changeMapOnly).toHaveBeenCalledWith(19,1901); // switch back first
  expect(h.map.setView).toHaveBeenLastCalledWith(before,5,expect.objectContaining({duration:.25}));
});

// Just the return view methods.
function loadReturnView() {
  const start=zmapSource.indexOf('ZMap.prototype._rememberMarkerReturnView');
  const end=zmapSource.indexOf('ZMap.prototype._setViewAtMarkerInVisibleArea',start);
  const context={ZMap:function(){},window:{}};
  vm.runInNewContext(zmapSource.slice(start,end),context);
  return context;
}

describe('back from a marker',()=>{
  const context=loadReturnView();
  const pre=point(100,100);
  function zmapFor(center,zoom,ids,arrived) {
    const mapControl={getCurrentMap:()=>({mapId:ids[0],subMapId:ids[1]}),changeMapOnly:jest.fn()};
    const map={options:{zoomAnimationThreshold:4},
      getCenter:()=>center,getZoom:()=>zoom,
      latLngToContainerPoint:p=>point(p.x,p.y),
      setView:jest.fn(),once:jest.fn()};
    const zmap=Object.assign(Object.create(context.ZMap.prototype),{
      mapControl,
      map,
      _markerReturnView:arrived===undefined ? null : {mapId:19,subMapId:1901,center:pre,zoom:5,arrived}
    });
    return {zmap,map,mapControl};
  }

  test('restores the view the marker was opened from, while the map is still there',()=>{
    const arrived={center:point(300,300),zoom:8};
    const h=zmapFor(point(300,300),8,[19,1901],arrived);
    expect(h.zmap.restoreMarkerReturnView()).toBe(true);
    expect(h.map.setView).toHaveBeenCalledWith(pre,5,expect.objectContaining({duration:.25}));
    expect(h.zmap._markerReturnView).toBeNull();
  });

  test('a 1px nudge still counts as the marker view',()=>{
    const arrived={center:point(300,300),zoom:8};
    const h=zmapFor(point(301,300),8,[19,1901],arrived);
    expect(h.zmap.restoreMarkerReturnView()).toBe(true);
  });

  test('a panned or zoomed map keeps its place',()=>{
    const arrived={center:point(300,300),zoom:8};
    expect(zmapFor(point(310,300),8,[19,1901],arrived).zmap.restoreMarkerReturnView()).toBe(false); // panned
    expect(zmapFor(point(300,300),7,[19,1901],arrived).zmap.restoreMarkerReturnView()).toBe(false); // zoomed
  });

  test('a marker on another map: the map and view are restored while it is still there',()=>{
    const arrived={center:point(300,300),zoom:8,mapId:22,subMapId:2201};
    const h=zmapFor(point(300,300),8,[22,2201],arrived);
    expect(h.zmap.restoreMarkerReturnView()).toBe(true);
    expect(h.mapControl.changeMapOnly).toHaveBeenCalledWith(19,1901);
    expect(h.map.setView).toHaveBeenCalledWith(pre,5,expect.objectContaining({duration:.25}));
  });

  test('a map the user chose (or a panned marker map) is kept',()=>{
    const arrived={center:point(300,300),zoom:8,mapId:22,subMapId:2201};
    // A different map altogether: the user switched maps of their own.
    let h=zmapFor(point(300,300),8,[33,3301],arrived);
    expect(h.zmap.restoreMarkerReturnView()).toBe(false);
    expect(h.mapControl.changeMapOnly).not.toHaveBeenCalled();
    // The marker's map, but panned since landing on it.
    h=zmapFor(point(310,300),8,[22,2201],arrived);
    expect(h.zmap.restoreMarkerReturnView()).toBe(false);
    expect(h.mapControl.changeMapOnly).not.toHaveBeenCalled();
  });

  test('never restores without a settled arrival, or with nothing remembered',()=>{
    // A different map with no destination recorded is not undone either.
    const noDest=zmapFor(point(300,300),8,[22,2201],{center:point(300,300),zoom:8});
    expect(noDest.zmap.restoreMarkerReturnView()).toBe(false);
    expect(noDest.mapControl.changeMapOnly).not.toHaveBeenCalled();
    const unsettled=zmapFor(point(300,300),8,[19,1901]);
    unsettled.zmap._markerReturnView={mapId:19,subMapId:1901,center:pre,zoom:5,arrived:null};
    expect(unsettled.zmap.restoreMarkerReturnView()).toBe(false);
    const none=zmapFor(point(300,300),8,[19,1901]);
    expect(none.zmap.restoreMarkerReturnView()).toBe(false); // nothing remembered
  });
});
