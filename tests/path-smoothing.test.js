const fs=require('fs');
const vm=require('vm');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

const load=()=>{
  const context={ZMap:function(){},Math};
  vm.runInNewContext(read('scripts/services/Paths.js'),context);
  return new context.ZMap();
};
const near=(a,b)=>Math.abs(a[0]-b[0])<1e-9 && Math.abs(a[1]-b[1])<1e-9;

test('a smooth path passes through every step, in order',()=>{
  const map=load();
  const steps=[[0,0],[10,5],[20,-5],[30,0]];
  const curve=map._smoothPoints(steps,false,8);
  expect(curve.length).toBe(1+3*8);
  steps.forEach((step,i)=>expect(near(curve[i*8],step)).toBe(true));
});

test('a looping smooth path closes on its first step',()=>{
  const map=load();
  const steps=[[0,0],[10,0],[10,10],[0,10]];
  const curve=map._smoothPoints(steps,true,4);
  expect(curve.length).toBe(1+4*4);
  expect(near(curve[curve.length-1],steps[0])).toBe(true);
});

test('a sharp turn does not overshoot far past its steps',()=>{
  const map=load();
  // Centripetal spacing keeps a hairpin from looping out.
  const curve=map._smoothPoints([[0,0],[100,0],[100,1],[0,1]],false,16);
  const xs=curve.map(p=>p[0]);
  expect(Math.max(...xs)).toBeLessThan(110);
  expect(Math.min(...xs)).toBeGreaterThan(-10);
});

test('two steps, or none to curve, stay as they are',()=>{
  const map=load();
  expect(map._smoothPoints([[0,0],[5,5]],false)).toEqual([[0,0],[5,5]]);
  expect(map._smoothPoints([[0,0],[5,5]],true)).toEqual([[0,0],[5,5],[0,0]]);
});

test('smoothing is a saved, history-tracked path setting',()=>{
  expect(read('migrations/20261113120000_path_smooth.sql')).toContain('ADD COLUMN IF NOT EXISTS smooth');
  expect(read('lib/common/paths.php')).toContain("'smooth' => !empty($in['smooth']) ? 1 : 0");
  expect(read('ajax/get_paths.php')).toContain('p.smooth');
  expect(read('scripts/services/PathEditor.js')).toContain("name='smooth'");
});
