const {build}=require('../dev/assets/oot/ganon-castle-to-sql.cjs');
const {projectDungeon}=require('../dev/assets/oot/game-to-map.cjs');
const maps=[{id:'64033',name:"Inside Ganon's Castle",subMap:[
  {id:'640130',name:'1F'},{id:'640131',name:'1F'},
  ...Array.from({length:6},(_,i)=>({id:String(640132+i),name:(i+2)+'F'}))]}];
test('Castle import places every real chest and Silver Rupee without duplicating Gauntlets',()=>{
  const result=build(maps),m=result.markers;
  expect(result.sourceObjects).toBe(1333);
  expect(m).toHaveLength(33);expect(result.added).toBe(32);
  expect(m.filter(x=>x.kind==='chest')).toHaveLength(12);
  expect(m.filter(x=>x.kind==='silver')).toHaveLength(20);
  expect(m.filter(x=>x.kind==='boss-door')).toHaveLength(1);
  expect(new Set(m.map(x=>x.gameId)).size).toBe(33);
  const gold=m.find(x=>x.name==='Chest - Golden Gauntlets');
  expect(gold.id).toBe(64704026);expect(gold.where.submapId).toBe('640130');
  expect(m.find(x=>x.name==='Chest - Boss Key').where.submapId).toBe('640135');
  expect(m.find(x=>x.kind==='boss-door').where.submapId).toBe('640137');
  expect(result.up).toContain('AND submap_id=650001 AND x=118.829 AND y=-94.378');
  expect(result.up).toContain('REPLACE(tab_text');
  expect(result.up).not.toContain('INSERT INTO marker (id, submap_id, overlay_id, marker_status_id, marker_category_id, user_id, name, description, x, y, z, jump_marker_id, global, path, game_data, visible, last_updated) SELECT 64704026');
  for(const x of m) {
    expect(typeof x.gameId).toBe('string');
    expect(x.where.x).toBeGreaterThan(0);expect(x.where.x).toBeLessThan(256);
    expect(x.where.y).toBeGreaterThan(-256);expect(x.where.y).toBeLessThan(0);
  }
  expect(build(maps).up).toBe(result.up);
});
test('Castle floors use one game frame and reject unsupported floors',()=>{
  const a=projectDungeon('InsideGanonCastle',0,0,-24.64);
  const b=projectDungeon('InsideGanonCastle',6,0,-24.64);
  expect(a).toEqual({floor:'1F',x:128,y:-128});
  expect(b).toEqual({floor:'7F',x:128,y:-128});
  expect(projectDungeon('InsideGanonCastle',7,0,0)).toBeNull();
  const registration=require('../dev/assets/oot/scene-data/ganon-castle-calibration.json');
  expect(Object.keys(registration.floorPivots)).toHaveLength(7);
});
