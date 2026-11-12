// Landmark-calibrated projection for the cropped, shared Gerudo floor canvas.
// Unlike existing dungeons, there is no verified full-texture game rectangle.
const calibration=require('./scene-data/gerudo-proving-calibration.json');
const registration=require('./hq-alignment.json').assets.find(a=>a.name==='GerudoTrainingGround_1F_State00_Main').transform;
function fit(axis) {
  const rows=calibration.anchors,n=rows.length;
  const sx=rows.reduce((s,a)=>s+a.game[axis],0),sy=rows.reduce((s,a)=>s+a.pixel[axis],0);
  const xx=rows.reduce((s,a)=>s+a.game[axis]**2,0),xy=rows.reduce((s,a)=>s+a.game[axis]*a.pixel[axis],0);
  const scale=(n*xy-sx*sy)/(n*xx-sx*sx);
  return [scale,(sy-scale*sx)/n];
}
const axes=[fit(0),fit(1)];
function texturePoint(x,z) {return [axes[0][0]*x+axes[0][1],axes[1][0]*z+axes[1][1]];}
function projectGerudo(floor,x,z) {
  const p=texturePoint(x,z);
  // HQ preparation doubles original texture pixels; map units remain original / 8.
  const u=registration[0][0]*p[0]+registration[0][1]*p[1]+registration[0][2]+24;
  const v=registration[1][0]*p[0]+registration[1][1]*p[1]+registration[1][2]+304;
  return {floor:floor===1?'2F':'1F',x:u/8,y:-v/8};
}
const validation=calibration.validation.map(a=>{
  const p=texturePoint(...a.game);
  return {...a,errorPixels:Math.hypot(p[0]-a.pixel[0],p[1]-a.pixel[1])};
});
module.exports={projectGerudo,texturePoint,validation,axes};
