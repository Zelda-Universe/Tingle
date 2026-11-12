const {build}=require('../dev/assets/oot/encounters-grottos-to-sql.cjs');
const report=require('../dev/assets/oot/scene-data/encounters-grottos-import.json');
const source=require('../dev/assets/oot/scene-data/encounter-grotto-sources.json');
const holes=require('../dev/assets/oot/scene-data/grotto-anchors.json').anchors;
const coverage=require('../dev/assets/oot/scene-data/encounter-artwork-coverage.json');
test('all main bosses, curated miniboss actors and actual grotto anchors are represented once',()=>{
  expect(report.counts).toEqual({bosses:10,minibosses:22,grottos:33,graves:4});
  expect(report.markers).toHaveLength(69);
  expect(new Set(report.markers.map(m=>m.id)).size).toBe(69);
  const expected=source.scenes.flatMap(s=>s.encounters.map(o=>s.scene+':'+BigInt(o.hash_id)));
  const actual=report.markers.filter(m=>['boss','miniboss'].includes(m.kind)).flatMap(m=>m.sourceIds.map(id=>m.scene+':'+id));
  expect(actual.sort()).toEqual(expected.sort());
  expect(report.markers.filter(m=>m.kind==='boss').map(m=>m.name).sort()).toEqual([
    'Gohma','King Dodongo','Barinade','Phantom Ganon','Volvagia','Morpha','Bongo Bongo','Twinrova','Ganondorf','Ganon'].sort());
  const represented=new Set(report.markers.filter(m=>['grotto','grave'].includes(m.kind)).flatMap(m=>m.sourceIds));
  expect([...represented].sort()).toEqual([...new Set(holes.map(h=>h.id))].sort());
});
test('paired encounters and era variants do not create duplicate completions',()=>{
  const m=report.markers;
  expect(m.filter(m=>m.name==='Lizalfos Pair')).toHaveLength(2);
  expect(m.filter(m=>m.name==='Stalfos Encounter')).toHaveLength(2);
  expect(m.filter(m=>m.kind==='grotto'&&m.where.global===1).length).toBeGreaterThan(25);
  expect(m.filter(m=>m.kind==='grave')).toHaveLength(4);
  expect(m.find(m=>m.name==="Dampé's Grave").where.global).toBe(0);
  expect(m.find(m=>m.name==='Iron Knuckle - Nabooru').where.submapId).toBe('640096');
});
test('unillustrated arenas use explicit entrance references instead of off-map positions',()=>{
  for(const m of report.markers) {
    expect(Number.isFinite(m.where.x)).toBe(true);expect(Number.isFinite(m.where.y)).toBe(true);
    expect(m.where.x).toBeGreaterThanOrEqual(0);expect(m.where.x).toBeLessThanOrEqual(256);
    expect(m.where.y).toBeGreaterThanOrEqual(-256);expect(m.where.y).toBeLessThanOrEqual(0);
    expect(m.metadata.sourceIds).toEqual(m.sourceIds);
    if(m.reference)expect(m.text).toContain('Shown at');
    else if(['boss','miniboss'].includes(m.kind))expect(coverage[m.key].visible).toBe(true);
  }
  expect(report.markers.find(m=>m.name==='Gohma').where.age).toBe('Young Link');
  const fs=require('fs'),sql=fs.readFileSync(__dirname+'/../migrations/20261112010000_oot_encounters_grottos.sql','utf8');
  expect(sql).toContain("WHERE id=64600029 AND name='Gerudo Training Ground' AND marker_category_id=64033");
  expect(sql).not.toContain('SELECT 64600029,');
});
