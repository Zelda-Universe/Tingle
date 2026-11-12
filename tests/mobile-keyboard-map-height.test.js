const fs=require('fs');
const vm=require('vm');
const path=require('path');

test('keyboard dismissal unfreezes a still-focused editor and clears Safari page scrolling',()=>{
  const source=fs.readFileSync(path.join(__dirname,'../scripts/controls/ZLayers.js'),'utf8');
  const start=source.indexOf('        var refreshMobileLayout = function()');
  const end=source.indexOf("        document.addEventListener('focusin'",start);
  const control={viewStyleBottomSlide:true,_keyboardDrawerViewport:{height:837,width:390},_refreshMobileDrawerLayout:jest.fn()};
  const context={...control,document:{activeElement:{matches:()=>false,tagName:'IFRAME',closest:()=>true}},window:{innerWidth:390,visualViewport:{height:447},scrollTo:jest.fn(),requestAnimationFrame:jest.fn()}};
  vm.runInNewContext(source.slice(start,end)+'; this.refresh=refreshMobileLayout;',context);
  context.refresh();
  expect(context._keyboardDrawerViewport.keyboardWasOpen).toBe(true);
  expect(context._refreshMobileDrawerLayout).not.toHaveBeenCalled();
  context.window.visualViewport.height=837;
  context.refresh();
  expect(context._keyboardDrawerViewport).toBeNull();
  expect(context.window.scrollTo).toHaveBeenCalledWith(0,0);
  expect(context._refreshMobileDrawerLayout).toHaveBeenCalledTimes(1);
});

test('keyboard viewport panning cannot shrink the map clipping container',()=>{
  const source=fs.readFileSync(path.join(__dirname,'../scripts/zmap.js'),'utf8');
  const body=source.slice(source.indexOf('  var updateMobileMapHeight = function()'),source.indexOf('  // Resizes keep the map'));
  const setProperty=jest.fn();
  const context={isMobile:()=>true,document:{documentElement:{style:{setProperty,removeProperty:jest.fn()}}},
    window:{innerHeight:513,screen:{height:890},visualViewport:{offsetTop:283}},mapControl:{_keyboardDrawerViewport:{height:837}}};
  vm.runInNewContext(body+'; updateMobileMapHeight();',context);
  expect(setProperty).not.toHaveBeenCalled();
  context.mapControl._keyboardDrawerViewport=null;
  vm.runInNewContext(body+'; updateMobileMapHeight();',context);
  expect(setProperty).toHaveBeenCalledWith('--mobile-map-height','607px');
});
