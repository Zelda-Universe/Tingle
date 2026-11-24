const fs=require('fs'),vm=require('vm'),zlib=require('zlib');
const {build}=require('../dev/build-fontawesome.cjs');
function packs(source) {
  const context={window:{navigator:{userAgent:''}}};
  vm.runInNewContext(source,context);
  return context.window.___FONT_AWESOME___.styles;
}
test('local icon subset preserves required solid, regular and brand icons',()=>{
  const source=fs.readFileSync('scripts/vendor/fontawesome-subset.js','utf8'),styles=packs(source);
  for(const name of ['check','times','pencil-alt','chevron-up','chevron-down','chevron-left','chevron-right','reply','history','comments','map-marker-alt','cloud-upload-alt']) {
    expect(styles.fas[name]).toBeDefined();
    expect(styles.fas[name][4]).toMatch(/^M/);
  }
  expect(styles.far.bell).toBeDefined();expect(styles.fab.discord).toBeDefined();
  expect(styles.fas.dragon).toBeUndefined();
  expect(source).toContain('License - https://fontawesome.com/license');
  expect(zlib.gzipSync(source).length).toBeLessThan(45000);
});
test('the builder changes only icon dictionaries and refuses incompatible input',()=>{
  const icons=Object.fromEntries(Array.from({length:102},(_,i)=>['unused-'+i,[16,16,[],'f001','M0 0']]));
  icons.check=[16,16,[],'f002','M1 1'];
  const source='/* Font Awesome Free 5.0.13 */\n'+['brands','regular','solid'].map(name=>'var '+name+'='+JSON.stringify(icons)+';').join('\n')+'\nvar renderer="untouched";';
  const result=build(source);
  expect(result).toContain('var renderer="untouched";');
  expect(result).toContain('"check":[16,16,[],"f002","M1 1"]');
  expect(result).not.toContain('unused-101');
  expect(()=>build('wrong release')).toThrow('Expected');
});
