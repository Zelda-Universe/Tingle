// Investigate projection hypotheses without changing map data or the database.
const fs=require('fs'),path=require('path');
const {load}=require('./extract-scene-data.cjs');
const {fit,project}=require('./calibrate-scene-data.cjs');
function regress(pairs,sourceAxis,targetAxis) {
  const xs=pairs.map(a=>a.position[sourceAxis]),ys=pairs.map(a=>a.target[targetAxis]);
  const mx=xs.reduce((s,n)=>s+n,0)/xs.length,my=ys.reduce((s,n)=>s+n,0)/ys.length;
  const variance=xs.reduce((s,n)=>s+(n-mx)**2,0);
  if(variance<1e-10) return null;
  const scale=xs.reduce((s,n,i)=>s+(n-mx)*(ys[i]-my),0)/variance;
  return [scale,my-scale*mx];
}
function fitAxes(anchors) {
  if(anchors.length<2) return null;
  const x=regress(anchors,0,0),z=regress(anchors,2,1);
  return x&&z ? {u:[x[0],0,x[1]],v:[0,z[0],z[1]]} : null;
}
function error(transform,anchor,box) {
  const uv=project(transform,anchor.position);
  return Math.hypot((uv[0]-anchor.target[0])*box[2],(uv[1]-anchor.target[1])*box[3]);
}
function evaluate(anchors,box,model) {
  const transform=model(anchors);if(!transform) return null;
  const errors=anchors.map(a=>error(transform,a,box));
  const heldOut=anchors.map((a,i)=>{
    const t=model(anchors.filter((_,j)=>i!==j));return t ? error(t,a,box) : null;
  });
  return {transform,rmsArtworkPixels:Math.sqrt(errors.reduce((s,n)=>s+n*n,0)/errors.length),
    maxHeldOutArtworkPixels:heldOut.every(Number.isFinite) ? Math.max(...heldOut) : null};
}
function main(source) {
  const params=load(path.join(source,'Banc/BancBasedResource/MapParam.byml.yaml'));
  const catalog=require('./scene-data/calibration-report.json');
  const boxes=require('./world-boxes.json').boxes;
  const fieldPresence={};
  for(const [scene,data] of Object.entries(params)) for(const field of Object.keys(data)) {
    (fieldPresence[field] || (fieldPresence[field]=[])).push(scene);
  }
  const rooms=[];
  for(const [scene,data] of Object.entries(params)) for(const [roomIndex,room] of (data.Room || []).entries()) {
    rooms.push({scene,roomIndex,center:room.CenterTrans || null,zoom:room.ZoomScale ?? null,
      floors:room.Floor || [],hidden:room.IsInvisibleMiniMap || false,areaAnchors:room.AreaAnchor || []});
  }
  const models=catalog.calibrations.filter(c=>c.anchors.length>=4).map(c=>({scene:c.scene,age:c.age,anchors:c.anchors.length,
    axesOnly:evaluate(c.anchors,boxes[c.age][c.region],fitAxes),
    affine:evaluate(c.anchors,boxes[c.age][c.region],fit)}));
  const report={sourceRevision:require('./scene-data/report.json').revision,
    sceneCount:Object.keys(params).length,fieldPresence,roomCount:rooms.length,
    roomZoomScales:[...new Set(rooms.map(r=>r.zoom).filter(n=>n!==null))].sort((a,b)=>a-b),
    sceneCenters:Object.fromEntries(Object.entries(params).filter(([,v])=>v.CenterTrans).map(([k,v])=>[k,v.CenterTrans])),
    rooms,models,
    conclusions:[
      'Top-level CenterTrans exists only for Gerudo Fortress and the two Sacred Forest Meadow eras, not every overworld scene.',
      'Room centers, Floor, IsInvisibleMiniMap and ZoomScale describe local dungeon/minimap framing; no verified full-texture conversion has been identified.',
      'Hyrule Field permits held-out testing with six independent entrance references. Other fitted scenes have only three, which cannot validate an affine fit.',
      'Residuals measure agreement with hand-annotated exits, not true engine projection accuracy. No model is marked exact or applied to markers.',
      'Recovering the base texture scale/origin or independently registering more landmarks is still required for verified placement.'
    ]};
  fs.writeFileSync(path.join(__dirname,'scene-data/projection-audit.json'),JSON.stringify(report,null,2)+'\n');
  console.log(JSON.stringify({sceneCount:report.sceneCount,centerScenes:Object.keys(report.sceneCenters),roomCount:report.roomCount,models},null,2));
}
if(require.main===module) main(process.argv[2]);
module.exports={fitAxes,evaluate};
