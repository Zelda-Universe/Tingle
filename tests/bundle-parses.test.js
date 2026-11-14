const fs=require('fs');
const vm=require('vm');
const path=require('path');
const root=path.join(__dirname,'..');

// Every script the site bundles (javascript.txt, res.php) must parse: one
// that doesn't stops the whole map from starting, and most aren't loaded by
// any other test.
const files=fs.readFileSync(path.join(root,'javascript.txt'),'utf8')
  .split('\n').map(line=>line.trim()).filter(line=>line && !line.startsWith('#') && line.endsWith('.js'))
  // (res.php skips a listed file that's gone: CategoryParentButton.js was
  // removed long ago but is still listed.)
  .filter(file=>fs.existsSync(path.join(root,file)));

test('the bundle lists scripts',()=>{
  expect(files.length).toBeGreaterThan(10);
});

test.each(files)('%s parses',file=>{
  const source=fs.readFileSync(path.join(root,file),'utf8');
  expect(()=>new vm.Script(source,{filename:file})).not.toThrow();
});
