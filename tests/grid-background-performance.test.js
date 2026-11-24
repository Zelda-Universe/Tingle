const fs=require('fs'),vm=require('vm');
const source=fs.readFileSync('scripts/zmap.js','utf8');
function grid(createImageBitmap) {
  let image;
  const context2d={fillRect:jest.fn(),translate:jest.fn(),createPattern:jest.fn(()=> 'pattern')};
  const layer={on:jest.fn(),addTo:jest.fn(),redraw:jest.fn()};
  const map={createPane:()=>({style:{}}),options:{},getMinZoom:()=>0,getMaxZoom:()=>8,project:()=>({x:123,y:456}),hasLayer:()=>true,getContainer:()=>({style:{}})};
  const context={ZMap:function(){},Image:function(){image=this;this.width=this.height=1000;},Promise,window:{createImageBitmap},L:{latLng:()=>({}),gridLayer:()=>layer},document:{createElement:()=>({getContext:()=>context2d})}};
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._addMapGridBackground ='),source.indexOf('ZMap.prototype.setupOfflineMapMessage =')),context);
  context.ZMap.prototype._addMapGridBackground.call({map});
  return {image,layer,map,context2d};
}
test('grid decoding finishes before canvas redraw and paints only visible tile pixels',async()=>{
  let ready;const bitmap={close:jest.fn()};
  const g=grid(()=>new Promise(resolve=>{ready=resolve;}));
  expect(g.image.decoding).toBe('async');
  g.image.onload();
  expect(g.layer.redraw).not.toHaveBeenCalled();
  ready(bitmap);await Promise.resolve();await Promise.resolve();
  expect(g.layer.redraw).toHaveBeenCalledTimes(1);
  g.layer.createTile({x:2,y:-3,z:4});
  expect(g.context2d.createPattern).toHaveBeenCalledWith(bitmap,'repeat');
  const [x,y,w,h]=g.context2d.fillRect.mock.calls[1];
  expect([w,h]).toEqual([256,256]);
  expect(g.context2d.translate).toHaveBeenCalledWith(-x,-y);
  expect(x).toBe(((2*256-123+500)%1000+1000)%1000);
  g.layer.on.mock.calls.find(([type])=>type==='remove')[1]();
  expect(bitmap.close).toHaveBeenCalledTimes(1);
});
test('decode failures fall back to the original image',async()=>{
  const g=grid(()=>Promise.reject(new Error('unsupported')));
  g.image.onload();await Promise.resolve();await Promise.resolve();
  g.layer.createTile({x:0,y:0,z:0});
  expect(g.context2d.createPattern).toHaveBeenCalledWith(g.image,'repeat');
});
test('a removed map does not redraw when delayed decoding finishes',async()=>{
  const bitmap={close:jest.fn()},g=grid(()=>Promise.resolve(bitmap));
  g.map.hasLayer=()=>false;
  g.image.onload();await Promise.resolve();await Promise.resolve();
  expect(g.layer.redraw).not.toHaveBeenCalled();
  expect(bitmap.close).toHaveBeenCalledTimes(1);
});

test('cold-load map construction runs before requesting markers, without rebuilding an existing map',()=>{
  const src=fs.readFileSync('scripts/zmain.lib.js','utf8');
  for(const existing of [false,true]) {
    const order=[];
    const context={window:{},gameId:19,zMap:{map:existing?{}:null,addMap:()=>order.push('map data'),buildMap:()=>order.push('build')},
      $:{each:(rows,fn)=>rows.forEach((row,i)=>fn(i,row))},ZLoad3D:{forMaps:()=>({always:fn=>fn()})},
      startupJSON:(url,fn)=>{fn([{id:19}]);return {fail:()=>{}};},getMarkers:()=>order.push('markers'),showOfflineUnavailable:()=>{}};
    vm.runInNewContext(src.slice(src.indexOf('function getMaps()'),src.indexOf('// markersReady:')),context);
    context.getMaps();
    expect(order).toEqual(existing?['map data','markers']:['map data','build','markers']);
    expect(context.zMap._builtBeforeMarkers).toBe(existing?undefined:true);
  }
});
