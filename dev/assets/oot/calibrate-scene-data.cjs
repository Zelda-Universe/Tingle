// Estimate scene-to-artwork transforms from the existing entrance annotations.
// Fits are diagnostic ONLY: annotated exits are not exact engine transforms.
const fs=require('fs'),path=require('path');
const {load}=require('./extract-scene-data.cjs');
function solve(matrix,vector) {
  const a=matrix.map((row,i)=>row.concat(vector[i]));
  for(let c=0;c<3;c++) {
    let pivot=c;for(let r=c+1;r<3;r++) if(Math.abs(a[r][c])>Math.abs(a[pivot][c])) pivot=r;
    if(Math.abs(a[pivot][c])<1e-10) return null;
    [a[c],a[pivot]]=[a[pivot],a[c]];
    const scale=a[c][c];for(let k=c;k<4;k++) a[c][k]/=scale;
    for(let r=0;r<3;r++) if(r!==c) {const n=a[r][c];for(let k=c;k<4;k++) a[r][k]-=n*a[c][k];}
  }
  return a.map(row=>row[3]);
}
function fit(anchors) {
  if(anchors.length<3) return null;
  const rows=anchors.map(a=>[a.position[0],a.position[2],1]);
  const normal=[0,1,2].map(i=>[0,1,2].map(j=>rows.reduce((s,row)=>s+row[i]*row[j],0)));
  const axis=k=>solve(normal,[0,1,2].map(i=>rows.reduce((s,row,n)=>s+row[i]*anchors[n].target[k],0)));
  const u=axis(0),v=axis(1);return u&&v ? {u,v} : null;
}
function project(transform,position) {
  const row=[position[0],position[2],1];
  return ['u','v'].map(axis=>transform[axis].reduce((sum,n,i)=>sum+n*row[i],0));
}
function main(source) {
  const params=load(path.join(source,'Banc/BancBasedResource/MapParam.byml.yaml'));
  const connections=require('./connections.json'),world=require('./world-boxes.json'),calibrations=[];
  for(const age of ['Child','Adult']) {
    const exits={...connections.exits,...(age==='Adult' ? connections.adultExits : {})};
    for(const region of Object.keys(world.boxes[age])) {
      const scene=params[region+'_'+age] ? region+'_'+age : region;
      const data=params[scene];if(!data) continue;
      const pairs=[];
      for(const [a,b] of connections.links) for(const [from,to] of [[a,b],[b,a]]) {
        if(!exits[from] || !exits[to] || exits[from][0]!==region || !world.boxes[age][exits[to][0]]) continue;
        const anchors=(data.EntranceAnchor || []).filter(e=>e.Location===exits[to][0] && e.IsVisible!==false);
        if(anchors.length!==1 || pairs.some(p=>p.id===String(anchors[0].InstanceID))) continue;
        pairs.push({id:String(anchors[0].InstanceID),destination:exits[to][0],position:anchors[0].Trans,target:exits[from].slice(1)});
      }
      const transform=fit(pairs),box=world.boxes[age][region];
      const residual=a=>{const uv=project(transform,a.position);return Math.hypot((uv[0]-a.target[0])*box[2],(uv[1]-a.target[1])*box[3]);};
      const errors=transform ? pairs.map(residual) : [];
      const heldOut=transform && pairs.length>=4 ? pairs.map((a,i)=>{
        const test=fit(pairs.filter((_,j)=>i!==j));if(!test) return null;
        const uv=project(test,a.position);return Math.hypot((uv[0]-a.target[0])*box[2],(uv[1]-a.target[1])*box[3]);
      }) : [];
      calibrations.push({scene,region,age,anchors:pairs,transform,
        rmsPixels:errors.length ? Math.sqrt(errors.reduce((s,n)=>s+n*n,0)/errors.length) : null,
        heldOutMaxPixels:heldOut.length && heldOut.every(Number.isFinite) ? Math.max(...heldOut) : null,
        verified:false,status:transform ? 'estimated-needs-artwork-verification' : 'needs-more-control-points'});
    }
  }
  const output={note:'Do not apply these estimates to production. Exit annotations are hand-placed and may identify different ends of an entrance.',calibrations};
  fs.writeFileSync(path.join(__dirname,'scene-data/calibration-report.json'),JSON.stringify(output,null,2)+'\n');
  console.log(JSON.stringify(calibrations.map(c=>({scene:c.scene,age:c.age,anchors:c.anchors.length,rms:c.rmsPixels,heldOut:c.heldOutMaxPixels})),null,2));
}
if(require.main===module) main(process.argv[2]);
module.exports={solve,fit,project};
