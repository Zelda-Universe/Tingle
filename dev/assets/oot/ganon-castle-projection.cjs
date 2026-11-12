const calibration=require('./scene-data/ganon-castle-calibration.json');
function projectCastle(floor,x,z) {
  if(!Number.isInteger(floor)||floor<0||floor>6) return null;
  // HQ source pixels are drawn at 4/3 scale on a 4096-square pyramid:
  // source / 12 is map units, with the shared tower pivot at (128,-128).
  return {floor:(floor+1)+'F',
    x:128+(x-calibration.gamePivot[0])*calibration.pixelsPerGameUnit[0]/12,
    y:-128-(z-calibration.gamePivot[1])*calibration.pixelsPerGameUnit[1]/12};
}
module.exports={projectCastle};
