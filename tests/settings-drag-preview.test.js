/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),$=require('jquery');
test('a lifted row follows pointer movement and returns on release',()=>{
  const context={ZMap:function(){},$,document,window:{requestAnimationFrame:()=>1,cancelAnimationFrame:()=>{},matchMedia:()=>({matches:true}),addEventListener:window.addEventListener.bind(window),removeEventListener:window.removeEventListener.bind(window)}};
  vm.runInNewContext(fs.readFileSync('scripts/zmapsettings.js','utf8'),context);
  const root=$('<div><div class="map-settings-group" data-section="Section"><div class="map-settings-children"><div class="map-settings-item"><button class="map-settings-handle"></button><span class="map-settings-name">First</span></div><div class="map-settings-item"><button class="map-settings-handle"></button><span class="map-settings-name">Second</span></div></div></div></div>').appendTo(document.body);
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{_contents:{getBoundingClientRect:()=>({top:0,bottom:600})}}});
  map._mapSettingsSortable(root,jest.fn());
  const item=root.find('.map-settings-item')[0];
  root.find('.map-settings-handle').first().trigger($.Event('pointerdown',{button:0,clientX:20,clientY:30,pointerId:1}));
  const preview=document.querySelector('.map-settings-drag-preview');
  expect(preview).not.toBeNull();
  expect(item.style.visibility).toBe('hidden');
  expect(document.body.classList.contains('settings-dragging')).toBe(true);
  expect(preview.style.scale).toBe('1.025');
  const move=new MouseEvent('pointermove',{clientX:55,clientY:90,cancelable:true});
  Object.defineProperty(move,'pointerId',{value:1});document.dispatchEvent(move);
  expect(preview.style.transform).toBe('translate(35px,60px)');
  const up=new MouseEvent('pointerup');Object.defineProperty(up,'pointerId',{value:1});document.dispatchEvent(up);
  expect(item.style.visibility).toBe('');
  expect(document.querySelector('.map-settings-drag-preview')).toBeNull();
  expect(document.body.classList.contains('settings-dragging')).toBe(false);
  root.remove();
});
