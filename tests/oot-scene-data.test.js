const yaml=require('js-yaml');
const {schema,mapPoints}=require('../dev/assets/oot/extract-scene-data.cjs');
const {fit,project}=require('../dev/assets/oot/calibrate-scene-data.cjs');
const {fitAxes,evaluate}=require('../dev/assets/oot/audit-projection.cjs');

test('every recorded Child region has an independently checked artwork alignment',()=>{
  const index=require('../dev/assets/oot/scene-data/child-video-index.json');
  const report=require('../dev/assets/oot/scene-data/child-video-calibration.json');
  expect(report).toHaveLength(index.regions.length);
  expect(new Set(report.map(r=>r.scene)).size).toBe(18);
  for(const row of report){
    expect(row.registration.inliers).toBeGreaterThanOrEqual(20);
    expect(row.registration.heldOutConsistentCount).toBeGreaterThanOrEqual(10);
    expect(row.registration.heldOutP95TexturePixels).toBeLessThan(2);
  }
});

test('underconstrained source transforms are not presented as verified',()=>{
  const report=[...require('../dev/assets/oot/scene-data/child-video-calibration.json'),
    ...require('../dev/assets/oot/scene-data/adult-video-calibration.json')];
  for(const row of report)for(const model of [row.sourceCalibration,row.skullOnlyCalibration]){
    if(!model)continue;
    if(model.status.startsWith('candidate-passes')){
      expect(model.independentValidationPossible).toBe(true);
      expect(model.pairs.length).toBeGreaterThanOrEqual(3);
      expect(Math.max(...model.heldOutTexturePixels)).toBeLessThan(5);
      expect(model.pairs.every(p=>typeof p.id==='string')).toBe(true);
    }
  }
});

test('Adult footage covers all indexed regions without masking the sparse Wasteland fit',()=>{
  const index=require('../dev/assets/oot/scene-data/adult-video-index.json');
  const report=require('../dev/assets/oot/scene-data/adult-video-calibration.json');
  expect(report).toHaveLength(index.regions.length);
  expect(report).toHaveLength(20);
  for(const row of report){
    expect(row.registration.heldOutP95TexturePixels).toBeLessThan(2);
    if(row.scene==='HountedWasteland_Adult'){
      expect(row.status).toBe('registration-needs-review');
    }else expect(row.status).toMatch(/^artwork-aligned/);
  }
});

test('cross-age checks preserve reward offsets instead of silently applying them',()=>{
  const report=require('../dev/assets/oot/scene-data/cross-age-calibration.json');
  const lake=report.find(r=>r.region==='LakeHylia').adultModelTransfer;
  const source=require('../dev/assets/oot/scene-data/map-points.json');
  const fishing=source.find(p=>p.scene==='LakeHylia_Child'&&p.properties.GameDataHashName==='MiniGame_Fishing_GetHeartPiece');
  expect(lake.checks.find(p=>p.id===fishing.id).errorTexturePixels).toBeGreaterThan(20);
  expect(lake.checks.filter(p=>p.id!==fishing.id).every(p=>p.errorTexturePixels<2)).toBe(true);
  expect(lake.status).toMatch(/do not apply/);
  const valley=report.find(r=>r.region==='GerudoValley').childModelTransfer;
  expect(valley.checks.every(p=>p.errorTexturePixels<2)).toBe(true);
});

test('screenshot anchors refer to real source identities and retain measured precision',()=>{
  const {samples,evaluate:measure}=require('../dev/assets/oot/calibrate-screenshots.cjs');
  for(const sample of samples){
    const report=measure(sample);
    expect(report.anchors.every(a=>typeof a.id==='string')).toBe(true);
    if(sample.scene==='Market_Child'){
      expect(report.heldOutMaxPixels).toBeGreaterThan(20);
    }else expect(report.rmsPixels).toBeLessThan(1);
  }
});

test('artwork calibration remains preview-only and records independent checks',()=>{
  const report=require('../dev/assets/oot/scene-data/artwork-calibration.json');
  for(const scene of report.filter(s=>s.markers)){
    expect(scene.terrainHeldOutPixels).toHaveLength(scene.terrainControls.length);
    for(const marker of scene.markers){
      expect(marker.u).toBeGreaterThanOrEqual(0);
      expect(marker.u).toBeLessThanOrEqual(1);
      expect(marker.v).toBeGreaterThanOrEqual(0);
      expect(marker.v).toBeLessThanOrEqual(1);
    }
  }
  expect(report.find(s=>s.scene==='HyruleField_Adult').checks).toHaveLength(2);
});

test('axis-only projection can be independently checked against held-out anchors',()=>{
  const anchors=[[0,0],[10,0],[0,10],[10,10]].map(([x,z])=>({position:[x,5,z],target:[x*.02+.1,z*.03+.2]}));
  const report=evaluate(anchors,[0,0,1000,800],fitAxes);
  expect(report.rmsArtworkPixels).toBeLessThan(1e-8);
  expect(report.maxHeldOutArtworkPixels).toBeLessThan(1e-8);
});

test('source actor IDs retain every digit',()=>{
  const value=yaml.load('id: !ul 1756130225587834111\nhash: !u 0xa8569064',{schema});
  expect(value.id).toBe('1756130225587834111');
  expect(value.hash).toBe('0xa8569064');
});

test('map-facing points preserve floor and offset metadata',()=>{
  const points=mapPoints({Test:{MinFloor:-2,Floor:[{CollectSign:[{InstanceID:'123',Trans:[1,2,3],OriginTrans:[4,5,6],IsUseOriginTrans:true}]}]}});
  expect(points[0].floor).toBe(-2);
  expect(points[0].properties.OriginTrans).toEqual([4,5,6]);
  expect(points[0].properties.IsUseOriginTrans).toBe(true);
});

test('affine calibration requires independent anchors and projects both map axes',()=>{
  const anchors=[[0,0],[10,0],[0,10],[10,10]].map(([x,z])=>({position:[x,99,z],target:[2*x+z+5,-x+3*z+7]}));
  const transform=fit(anchors);
  expect(project(transform,[3,999,4])[0]).toBeCloseTo(15);
  expect(project(transform,[3,999,4])[1]).toBeCloseTo(16);
  expect(fit(anchors.slice(0,2))).toBeNull();
  expect(fit([anchors[0],anchors[0],anchors[0]])).toBeNull();
});

test('source collectible identities match known game counts without merging eras by position',()=>{
  const points=require('../dev/assets/oot/scene-data/map-points.json');
  expect(new Set(points.filter(p=>p.kind==='CollectHeart').map(p=>p.id)).size).toBe(36);
  expect(new Set(points.filter(p=>p.kind==='CollectSign').map(p=>p.id)).size).toBe(100);
  expect(require('../dev/assets/oot/scene-data/actors.json').filter(a=>a.type==='Enemy_Poe_Big')).toHaveLength(10);
});
