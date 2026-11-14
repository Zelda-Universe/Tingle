const fs=require('fs');
const vm=require('vm');
const source=fs.readFileSync(require('path').join(__dirname,'../scripts/zmap.js'),'utf8');
const point=(x,y)=>({x,y,add(p){return point(x+p.x,y+p.y);},subtract(p){return point(x-p.x,y-p.y);},distanceTo(p){return Math.hypot(x-p.x,y-p.y);}});

function setup(zoom=2) {
  let centre=point(200,410);
  const map={_loaded:true,getZoom:()=>zoom,getMinZoom:()=>2,
    getContainer:()=>({getBoundingClientRect:()=>({bottom:800})}),getSize:()=>point(400,800),
    project:p=>p,unproject:p=>p,getCenter:()=>centre,latLngToContainerPoint:p=>p,
    setView:jest.fn(p=>{centre=p;})};
  const zMap={mapControl:{viewStyleBottomSlide:true,_mobileDrawerBaseTop:0,_startPosition:700,options:{softOpenTo:400}}};
  const context={zMap,map,L:{point},bounds:()=>({getCenter:()=>point(200,400)}),
    insets:{},measureInsets:()=>({left:0,right:0,top:80,bottom:100})};
  const start=source.indexOf('  this._recenterMobileMapAtMinimumZoom = function');
  const end=source.indexOf('\n  // Leaflet keeps',start);
  vm.runInNewContext(source.slice(start,end).replace('this._recenterMobileMapAtMinimumZoom','zMap.recenter'),context);
  return {map,zMap,context,centre:()=>centre};
}

test('minimum-zoom artwork follows partial drawer and returns when collapsed',()=>{
  const h=setup();
  h.zMap.recenter(400);
  expect(h.centre().y).toBe(560);
  const calls=h.map.setView.mock.calls.length;
  h.zMap.recenter(10);
  expect(h.centre().y).toBe(560);
  expect(h.map.setView).toHaveBeenCalledTimes(calls);
  h.zMap.recenter(700);
  expect(h.centre().y).toBe(410);
});

test('zoomed-in views are not moved by the drawer',()=>{
  const h=setup(3);
  h.zMap.recenter(400);
  expect(h.map.setView).not.toHaveBeenCalled();
});

test('zoomed in, the map edges stop at the partial drawer, not the collapsed one',()=>{
  const h=setup(3);
  h.zMap.recenter(400);
  // Above the partial drawer (800 - 400), so a path's last step can be shown.
  expect(h.context.insets.bottom).toBe(400);
  h.zMap.recenter(10);
  // A drawer pulled further up keeps the partial edge.
  expect(h.context.insets.bottom).toBe(400);
  h.zMap.recenter(700);
  expect(h.context.insets.bottom).toBe(100);
  expect(h.map.setView).not.toHaveBeenCalled();
});
