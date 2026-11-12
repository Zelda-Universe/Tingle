const {build}=require('../dev/assets/oot/gerudo-proving-to-sql.cjs');
const {projectDungeon}=require('../dev/assets/oot/game-to-map.cjs');
const maps=[{id:'64032',name:'Gerudo Proving Grounds',subMap:[
  {id:'640120',name:'1F'},{id:'640121',name:'1F'},
  {id:'640122',name:'2F'},{id:'640123',name:'2F'}]}];
test('Gerudo import includes all map-facing chests and all twenty Silver Rupees',()=>{
  const result=build(maps),markers=result.markers;
  expect(result.sourceObjects).toBe(917);
  expect(markers).toHaveLength(43);
  expect(markers.filter(m=>m.kind==='chest')).toHaveLength(22);
  expect(markers.filter(m=>m.category===64027)).toHaveLength(9);
  expect(markers.filter(m=>m.kind==='silver')).toHaveLength(20);
  expect(markers.filter(m=>m.name==='Chest - Ice Arrow')).toHaveLength(1);
  expect(markers.filter(m=>m.name==='Pierre')).toHaveLength(1);
  expect(new Set(markers.map(m=>m.gameId)).size).toBe(43);
  for(const m of markers) {
    expect(typeof m.gameId).toBe('string');
    expect(m.where.submapId).toBe(m.floor===1?'640122':'640120');
    expect(m.where.area).toBe('Gerudo Proving Grounds');
    expect(m.where.x).toBeGreaterThan(0);expect(m.where.x).toBeLessThan(256);
    expect(m.where.y).toBeGreaterThan(-256);expect(m.where.y).toBeLessThan(0);
  }
  expect(build(maps).up).toBe(result.up);
});
test('shared Gerudo projection passes held-out doors on both floors',()=>{
  const {validation}=require('../dev/assets/oot/gerudo-proving-projection.cjs');
  expect(validation.some(p=>p.floor===1)).toBe(true);
  validation.forEach(p=>expect(p.errorPixels).toBeLessThan(3));
  const a=projectDungeon('GerudoTrainingGround',0,-1.75,-48);
  const b=projectDungeon('GerudoTrainingGround',1,-1.75,-48);
  expect([a.x,a.y]).toEqual([b.x,b.y]);
  expect(a.floor).toBe('1F');expect(b.floor).toBe('2F');
});
