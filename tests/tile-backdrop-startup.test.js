const fs=require('fs'),vm=require('vm');
const source=fs.readFileSync('scripts/zmap.js','utf8');
function setup(loading=true) {
  const listeners={};
  const layer={options:{maxZoom:6},isLoading:()=>loading,
    on(type,fn){(listeners[type] ||= new Set()).add(fn);return this;},
    off(type,fn){listeners[type]?.delete(fn);return this;},
    fire(type){[...(listeners[type] || [])].forEach(fn=>fn({target:this}));}};
  const backdrop={};
  const map={getPane:jest.fn(()=>null),createPane:jest.fn(()=>({style:{}})),
    addLayer:jest.fn(b=>{b._map=map;}),removeLayer:jest.fn(b=>{b._map=null;})};
  const context={ZMap:function(){},L:{tileLayer:()=>backdrop}};
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._addTileBackdrop ='),source.indexOf('// Each submap\'s named regions')),context);
  const zmap=Object.assign(Object.create(context.ZMap.prototype),{mapOptions:{maxZoom:6,tileSize:256},_tilePyramidBounds:()=>[]});
  zmap._addTileBackdrop(layer,'tiles/{z}/{x}/{y}',4);
  layer._map=map;
  return {layer,map,backdrop};
}
test('backdrop waits for foreground tiles, then loads once',()=>{
  const {layer,map}=setup();layer.fire('add');
  expect(map.addLayer).not.toHaveBeenCalled();
  layer.fire('load');layer.fire('load');
  expect(map.addLayer).toHaveBeenCalledTimes(1);
});
test('removing a map cancels its pending backdrop; reopening waits again',()=>{
  const {layer,map,backdrop}=setup();layer.fire('add');layer.fire('remove');layer._map=null;
  layer.fire('load');expect(map.addLayer).not.toHaveBeenCalled();
  layer._map=map;layer.fire('add');layer.fire('load');
  expect(map.addLayer).toHaveBeenCalledWith(backdrop);
  layer.fire('remove');expect(map.removeLayer).toHaveBeenCalledWith(backdrop);
});
test('a layer with no outstanding foreground tiles can show its backdrop immediately',()=>{
  const {layer,map}=setup(false);layer.fire('add');
  expect(map.addLayer).toHaveBeenCalledTimes(1);
});
