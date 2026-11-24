// Usage: node dev/build-fontawesome.cjs /path/to/original-5.0.13-all.js
// Prints the generated asset to stdout. Keep the upstream license header.
// Only icon dictionaries are reduced; the original SVG renderer is unchanged.
const fs = require('fs');
const path = require('path');
const acorn = require('acorn');
const root = path.resolve(__dirname, '..');
function sources(dir) {
  return fs.readdirSync(dir, {withFileTypes:true}).flatMap(entry => {
    const file = path.join(dir,entry.name);
    if(entry.name === 'vendor' || entry.name.startsWith('.')) return [];
    return entry.isDirectory() ? sources(file) : /\.(js|php|html)$/.test(file) && !/\.test\.js$/.test(file) ? [file] : [];
  });
}
function build(original) {
  if(!original.includes('Font Awesome Free 5.0.13')) throw new Error('Expected the original Font Awesome Free 5.0.13 all.js');
  const files = ['scripts','ajax','lib'].flatMap(dir=>sources(path.join(root,dir)))
    .concat(fs.readdirSync(root).filter(name=>/\.(php|html)$/.test(name)).map(name=>path.join(root,name)));
  const used = new Set();
  for(const file of files) {
    const text=fs.readFileSync(file,'utf8');
    for(const match of text.matchAll(/\bfa-([a-z0-9-]+)/g)) used.add(match[1]);
    // Dynamic icon classes also use plain names, e.g. 'chevron-' + 'up'.
    for(const match of text.matchAll(/["'`]([a-z0-9-]+)["'`]/g)) used.add(match[1]);
  }
  ['chevron-up','chevron-down','chevron-left','chevron-right','bell','question-circle'].forEach(name=>used.add(name));
  const replacements=[];
  function walk(node) {
    if(node.type==='ObjectExpression' && node.properties.length>100 && node.properties.every(p=>p.value?.type==='ArrayExpression' && p.value.elements.length===5)) {
      const properties=node.properties.filter(p=>used.has(p.key.name || p.key.value) || p.value.elements[2].elements.some(alias=>used.has(alias.value)));
      replacements.push({start:node.start,end:node.end,text:'{'+properties.map(p=>original.slice(p.start,p.end)).join(',')+'}',count:properties.length});
      return;
    }
    for(const value of Object.values(node)) {
      if(Array.isArray(value)) value.forEach(child=>{if(child?.type) walk(child);});
      else if(value?.type) walk(value);
    }
  }
  walk(acorn.parse(original,{ecmaVersion:2020}));
  if(replacements.length!==3) throw new Error('Expected the brands, regular and solid icon dictionaries');
  let result=original;
  replacements.sort((a,b)=>b.start-a.start).forEach(r=>{result=result.slice(0,r.start)+r.text+result.slice(r.end);});
  return result;
}
module.exports={build};
if(require.main===module) process.stdout.write(build(fs.readFileSync(process.argv[2],'utf8')));
