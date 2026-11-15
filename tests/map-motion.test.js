const fs=require('fs');
const path=require('path');
const vm=require('vm');
const source=fs.readFileSync(path.join(__dirname,'../scripts/services/MapMotion.js'),'utf8');

// The map's two named animations (MapMotion.js): "move", the quick pan and
// zoom, and "fly", a path's flight.
function load(reduced) {
  const context={ZMap:function(){},window:{matchMedia:()=>({matches:!!reduced})}};
  vm.runInNewContext(source,context);
  const map={options:{zoomAnimationThreshold:4},setView:jest.fn(function(){this.seenThreshold=this.options.zoomAnimationThreshold;}),
    fitBounds:jest.fn(),flyTo:jest.fn(),flyToBounds:jest.fn()};
  return {zmap:Object.assign(Object.create(context.ZMap.prototype),{map}),map};
}

test('move is the quick pan and zoom, at any zoom',()=>{
  const {zmap,map}=load();
  zmap._animateView('c',6,'move');
  expect(map.setView).toHaveBeenCalledWith('c',6,{animate:true,duration:.25,easeLinearity:.2});
  expect(map.seenThreshold).toBe(Infinity);
  expect(map.options.zoomAnimationThreshold).toBe(4);
  zmap._animateToBounds('b',{maxZoom:5},'move');
  expect(map.fitBounds).toHaveBeenCalledWith('b',{maxZoom:5,animate:true,duration:.25,easeLinearity:.2});
});

test('fly is a path\'s flight, a little longer when framing',()=>{
  const {zmap,map}=load();
  zmap._animateView('c',6,'fly');
  expect(map.flyTo).toHaveBeenCalledWith('c',6,{duration:.6});
  zmap._animateToBounds('b',{},'fly');
  expect(map.flyToBounds).toHaveBeenCalledWith('b',{duration:.8});
});

test('no motion, or reduced motion, goes straight there',()=>{
  for(const [reduced,motion] of [[false,false],[true,'move'],[true,'fly']]) {
    const {zmap,map}=load(reduced);
    zmap._animateView('c',6,motion);
    expect(map.setView).toHaveBeenCalledWith('c',6,{animate:false});
    expect(map.flyTo).not.toHaveBeenCalled();
  }
});
