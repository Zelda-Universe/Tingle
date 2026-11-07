// Terrain control points measured independently of collectible icons.
// Coordinates refer to original screenshots and 1067px Mini textures.
const fs=require('fs'),path=require('path');
const {fit,project}=require('./calibrate-scene-data.cjs');
const {samples,evaluate}=require('./calibrate-screenshots.cjs');
const controls={
  HyruleField_Child:[
    [1158,495,628,453], [1100,406,584,386],
    [1078,305,565,306], [1340,547,768,494],
    [1270,438,715,410], [1328,432,759,405]
  ],
  Market_Child:[
    [1360,500,525,549], [1340,581,508,610],
    [1142,453,357,511], [1431,225,577,342],
    [1503,576,633,604], [1488,843,597,815]
  ],
  KakarikoVillage_Child:[
    [1323,461,640,543], [1049,460,431,540],
    [1477,351,756,457], [1530,616,796,658],
    [1098,189,468,334], [1152,122,510,283]
  ],
  LakeHylia_Child:[
    [203,463,293,508], [548,370,522,445],
    [440,840,452,757], [727,629,641,619],
    [514,656,500,636], [907,315,765,405]
  ],
  GerudoValley_Adult:[
    [1115,25,546,196], [1058,578,507,577],
    [1174,577,585,577], [1243,682,631,648],
    [854,454,367,489], [878,644,383,624]
  ],
  DeathMountainCrater_Child:[
    [558,195,606,417], [391,278,494,473],
    [706,288,704,479], [707,145,706,384],
    [345,152,462,390], [395,152,496,388]
  ]
};
async function main(){
  const sharp=require('sharp');
  const boxes=require('./world-boxes.json').boxes;
  const output=[];
  for(const sample of samples.filter(s=>controls[s.scene])){
    const terrain=controls[sample.scene].map(([x,y,u,v])=>({position:[x,0,y],target:[u,v]}));
    const registration=fit(terrain);
    const residuals=terrain.map(a=>Math.hypot(...project(registration,a.position).map((n,i)=>n-a.target[i])));
    const heldOut=terrain.map((a,i)=>Math.hypot(...project(fit(terrain.filter((_,j)=>i!==j)),a.position).map((n,k)=>n-a.target[k])));
    const calibrated=evaluate(sample);
    const file=path.join('/Users/Jess/Desktop/oot/OoTR-110-CustomTex-Map-Field','Mini_'+sample.scene+'_00.png');
    const trimmed=await sharp(file).trim().toBuffer({resolveWithObject:true});
    const region=sample.scene.replace(/_(Child|Adult)$/,'');
    const age=sample.scene.endsWith('_Adult')?'Adult':'Child';
    const box=boxes[age][region];
    const markers=calibrated.anchors.map(a=>{
      const model=sample.scene==='LakeHylia_Child'?calibrated.transform:calibrated.axisAligned.transform;
      const pixel=project(registration,project(model,a.position).reduce((r,n,i)=>{r[i===0?0:2]=n;return r;},[0,0,0]));
      const u=(pixel[0]+(trimmed.info.trimOffsetLeft||0))/trimmed.info.width;
      const v=(pixel[1]+(trimmed.info.trimOffsetTop||0))/trimmed.info.height;
      return {id:a.id,kind:a.kind,texturePixel:pixel,u,v,x:(box[0]+u*box[2])/32,y:-(box[1]+v*box[3])/32};
    });
    const svg='<svg width="1067" height="1067">'+markers.map((m,i)=>`<circle cx="${m.texturePixel[0]}" cy="${m.texturePixel[1]}" r="12" fill="${m.kind==='CollectHeart'?'#ed4463':'#ffe366'}" stroke="black" stroke-width="2"/><text x="${m.texturePixel[0]+15}" y="${m.texturePixel[1]}" font-size="20" fill="white" stroke="black" stroke-width=".5">${i+1}</text>`).join('')+'</svg>';
    const preview=path.join(__dirname,'scene-data',sample.scene+'-calibration.png');
    await sharp(file).composite([{input:Buffer.from(svg)}]).png().toFile(preview);
    output.push({scene:sample.scene,terrainControls:terrain,registration,terrainResidualPixels:residuals,terrainHeldOutPixels:heldOut,markers,status:sample.scene==='Market_Child'?'rejected: source marker fit inconsistent; verify reward anchors and screenshot geometry before use':sample.scene==='LakeHylia_Child'?'provisional: clustered source anchors and screenshot skew; do not apply':'manual terrain registration; preview only, no database writes'});
  }
  // Hyrule Field has only two visible icons: use terrain registration to
  // compare the prior entrance-based estimate, not to claim a fresh affine fit.
  const fieldControls=[[319,116,628,453],[444,54,715,410],[509,47,759,405],
    [522,175,768,494],[217,660,565,829],[477,340,740,607]];
  const fieldRegistration=fit(fieldControls.map(([x,y,u,v])=>({position:[x,0,y],target:[u,v]})));
  const fieldModel=require('./scene-data/calibration-report.json').calibrations.find(c=>c.scene==='HyruleField_Adult').transform;
  const fieldFile='/Users/Jess/Desktop/oot/OoTR-110-CustomTex-Map-Field/Mini_HyruleField_Adult_00.png';
  const trim=await sharp(fieldFile).trim().toBuffer({resolveWithObject:true});
  const checks=[['2177746409373494991',378,374],['9047381233010434881',315,536]].map(([id,x,y])=>{
    const point= require('./scene-data/map-points.json').find(p=>p.scene==='HyruleField_Adult'&&p.id===id);
    const observed=project(fieldRegistration,[x,0,y]);
    const uv=project(fieldModel,point.position);
    const predicted=[uv[0]*trim.info.width-(trim.info.trimOffsetLeft||0),uv[1]*trim.info.height-(trim.info.trimOffsetTop||0)];
    return {id,observedTexturePixel:observed,predictedTexturePixel:predicted,errorTexturePixels:Math.hypot(...observed.map((n,i)=>n-predicted[i]))};
  });
  output.push({scene:'HyruleField_Adult',terrainControls:fieldControls,registration:fieldRegistration,checks,
    status:'two-icon cross-check only; second identity inferred from spatial agreement, not independently confirmed'});
  fs.writeFileSync(path.join(__dirname,'scene-data/artwork-calibration.json'),JSON.stringify(output,null,2)+'\n');
  console.log(JSON.stringify(output.map(x=>({scene:x.scene,maxTerrainResidual:x.terrainResidualPixels?Math.max(...x.terrainResidualPixels):null,checks:x.checks})),null,2));
}
if(require.main===module)main().catch(e=>{console.error(e);process.exitCode=1;});
