const fs=require('fs');
const vm=require('vm');
const path=require('path');
test('renaming a region never changes or removes its connector',()=>{
  const source=fs.readFileSync(path.join(__dirname,'../scripts/controls/OotFloors.js'),'utf8');
  const regions=[
    {kind:'area',name:'Lost Woods',connectionKey:'Lost Woods',bounds:[[0,0],[10,10]]},
    {kind:'area',name:'Sacred Grove',connectionKey:'Sacred Forest Meadow',bounds:[[20,20],[30,30]]}
  ];
  const line=jest.fn(()=>({addTo:()=>{}}));
  const context={connections:{clearLayers:()=>{}},connectionRenderer:{},
    L:{polyline:line,circleMarker:()=>({addTo:()=>{}})},
    zmap:{mapControl:{currentMapLayer:{options:{maxNativeZoom:5},mapConnections:[
      {from:['Lost Woods',.5,0],to:['Sacred Forest Meadow',.5,1],route:'d'}]}},_layerRegions:()=>regions}};
  vm.runInNewContext(source.slice(source.indexOf('  function drawConnections()'),source.indexOf("  panel.className = 'oot-floor-control'")),context);
  context.drawConnections();
  expect(line).toHaveBeenCalledTimes(1);
  const points=line.mock.calls[0][0];
  regions[1].name='Another display name';
  context.drawConnections();
  expect(line).toHaveBeenCalledTimes(2);
  expect(line.mock.calls[1][0]).toEqual(points);
});
