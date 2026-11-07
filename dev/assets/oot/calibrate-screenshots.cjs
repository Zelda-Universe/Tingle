// Measured icon centers in the user's original-resolution game screenshots.
// Fits source X/Z to screenshot pixels, NOT yet to trimmed composite artwork.
const fs = require('fs');
const path = require('path');
const { fit, project } = require('./calibrate-scene-data.cjs');
const {fitAxes, evaluate: compareModel} = require('./audit-projection.cjs');
const points = require('./scene-data/map-points.json');
const samples = [
  { scene:'HyruleField_Child', image:'video-child-frame-24.5s (measurements normalized to 2048x1152)', anchors:[
    ['14128250030289710996',677,487], ['14825051130171187671',1153,278],
    ['12007978132755687032',785,864], ['2177746409373494991',1212,727]
  ] },
  { scene:'Market_Child', image:'codex-clipboard-1785a97c-302d-4d19-9f44-4890e28ff43d.png', anchors:[
    ['8568137720802848289',1384,634], ['11628104451986877978',1234,478],
    ['5215133574889185473',972,503], ['8942465719711548237',1487,843]
  ] },
  { scene:'KakarikoVillage_Child', image:'codex-clipboard-05d1e64e-2c55-4cc2-be5f-cd10a73a3020.png', anchors:[
    ['14107117960174262321',1123,552], ['15314554401574296838',1303,558],
    ['7677963516305772491',1049,460], ['11629189455828560791',1041,225],
    ['15118290503807073158',1194,317]
  ] },
  { scene: 'GerudoValley_Adult', image: 'codex-clipboard-f3aba44d-a17b-4ab2-8d17-198bcf3a5a2d.png', anchors: [
    ['1077480308077338993',1132,91], ['14813002874583645116',1038,826],
    ['13584527502619061465',803,369], ['11535915511003753934',875,665]
  ] },
  { scene: 'DeathMountainCrater_Child', image: 'codex-clipboard-a2753b30-fcd9-4e22-9176-def3d0198870.png', anchors: [
    ['16784485264831565984',549,545], ['12493798230772313904',357,551],
    ['12975373498949047978',405,302], ['6397182598322965076',585,263],
    ['18219295034534354574',529,684]
  ] },
  { scene: 'LakeHylia_Child', image: 'codex-clipboard-0c1d496e-55a1-46c8-841a-def4219e71be.png', anchors: [
    ['6175378250368022556',984,474], ['3889886157160285015',661,228],
    ['8655370827943125875',227,883], ['7014193622407727514',694,205],
    ['13944703896577680014',647,260]
  ] }
];
function evaluate(sample) {
  const anchors = sample.anchors.map(([id,x,y]) => {
    const source = points.find(p => p.scene === sample.scene && p.id === id);
    if (!source) throw Error('Missing source anchor '+id);
    return { id, kind:source.kind, position:source.position, target:[x,y] };
  });
  const transform = fit(anchors);
  const errors = anchors.map(a => Math.hypot(...project(transform,a.position).map((n,i)=>n-a.target[i])));
  const heldOut = anchors.map((a,i) => {
    const model = fit(anchors.filter((_,j)=>i!==j));
    return Math.hypot(...project(model,a.position).map((n,k)=>n-a.target[k]));
  });
  return {...sample, anchors, transform, axisAligned:compareModel(anchors,[0,0,1,1],fitAxes), residualPixels:errors,
    rmsPixels:Math.sqrt(errors.reduce((s,x)=>s+x*x,0)/errors.length),
    heldOutPixels:heldOut, heldOutMaxPixels:Math.max(...heldOut),
    status:'screenshot-space-only; artwork registration required before database changes'};
}
if (require.main === module) {
  const result = { measurementUncertaintyPixels:3, note:'Manual icon-center measurements. Missing markers are not evidence of absence. No database positions changed.', calibrations:samples.map(evaluate) };
  fs.writeFileSync(path.join(__dirname,'scene-data/screenshot-calibration.json'),JSON.stringify(result,null,2)+'\n');
  console.log(JSON.stringify(result.calibrations.map(({scene,rmsPixels,heldOutMaxPixels})=>({scene,rmsPixels,heldOutMaxPixels})),null,2));
}
module.exports = {samples,evaluate};
