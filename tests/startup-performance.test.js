/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),$=require('jquery');
const source=fs.readFileSync('scripts/zmap.js','utf8');
function methods(start,end,extra={}) {
  const context={ZMap:function(){},$,window,document,performance,...extra};
  vm.runInNewContext(source.slice(source.indexOf(start),source.indexOf(end,source.indexOf(start)+1)),context);
  return context.ZMap.prototype;
}
test('startup scripts are deferred in dependency order and editor is not eagerly downloaded',()=>{
  const html=fs.readFileSync('index.php','utf8');
  expect(html.indexOf('type=css')).toBeLessThan(html.indexOf('jquery.min.js'));
  expect(html).toContain('href="images/zmaps_white.png" as="image" fetchpriority="high"');
  expect(fs.existsSync('fonts/brandon/264CA8_2_0.woff')).toBe(true);
  expect(html.includes('src="https://cdnjs.cloudflare.com/ajax/libs/tinymce')).toBe(false);
  expect(html).toContain('src="scripts/vendor/fontawesome-subset.js?v=');
  for(const src of ['jquery.min.js','leaflet.js','toastr.min.js','fuse.min.js']) {
    const tag=html.slice(html.lastIndexOf('<script',html.indexOf(src)),html.indexOf('>',html.indexOf(src)));
    expect(tag).toContain('defer');
  }
});
test('startup prioritizes the app over marker data without delaying or duplicating requests',async()=>{
  const html=fs.readFileSync('index.php','utf8');
  const start=html.indexOf('      (function() {',html.indexOf('var early')-200);
  const end=html.indexOf('</script>',start);
  const script=html.slice(start,end).replace(/<\?php[\s\S]*?\?>/g,'');
  const fetch=jest.fn(url=>Promise.resolve({ok:true,json:()=>Promise.resolve(url.includes('get_container')?[{id:19}]:[])}));
  const context={window:{fetch,Promise,location:{search:'?game=BotW'}},fetch,navigator:{onLine:true},URLSearchParams,Promise};
  vm.runInNewContext(script,context);
  for(let i=0;i<8;i++) await Promise.resolve();
  expect(fetch).toHaveBeenCalledTimes(4);
  for(const [url,options] of fetch.mock.calls) {
    expect(options.credentials).toBe('same-origin');
    expect(options.priority).toBe(url.includes('get_markers')?'low':'high');
    expect(context.window.zmEarlyData[url]).toBeDefined();
  }
  for(const src of ['jquery.min.js','leaflet.js','res.php?type=javascript']) {
    const pos=html.indexOf('src="',html.lastIndexOf('<script',html.indexOf(src)));
    const tag=html.slice(html.lastIndexOf('<script',pos),html.indexOf('>',pos));
    expect(tag).toContain('fetchpriority="high"');
    expect(tag).toContain('defer');
  }
});
test('all Brandon font variants display fallback text while downloading',()=>{
  const css=fs.readFileSync('styles/zmain.css','utf8');
  const faces=css.match(/@font-face\s*\{[^}]*BrandonText[^}]*\}/g);
  expect(faces).toHaveLength(7);
  faces.forEach(face=>expect(face).toContain('font-display: swap;'));
});
test('marker batches yield, preserve order and publish the full list exactly once',()=>{
  jest.useFakeTimers();
  let now=0;
  const proto=methods('ZMap.prototype.addMarkers =','ZMap.prototype.addMarker =',{performance:{now:()=>now+=5}});
  const added=[],handler=jest.fn(),label=jest.fn();
  const map=Object.assign(Object.create(proto),{addMarker:m=>added.push(m),handlers:{markersAdded:[handler]},mapControl:{_categoryMenu:{categoryButtons:[{updateCategoryLabel:label}]}}});
  const data=[1,2,3,4,5],finished=jest.fn();
  map.addMarkersInBatches(data).done(finished);
  expect(added).toEqual([]);
  jest.runOnlyPendingTimers();
  expect(added.length).toBeLessThan(data.length);
  expect(handler).not.toHaveBeenCalled();
  jest.runAllTimers();
  expect(added).toEqual(data);
  expect(handler).toHaveBeenCalledTimes(1);
  expect(handler).toHaveBeenCalledWith(data);
  expect(label).toHaveBeenCalledTimes(1);
  expect(finished).toHaveBeenCalledWith(data);
  jest.useRealTimers();
});
test('editor downloads once on demand, retries failures, and resolves only when available',()=>{
  const proto=methods('ZMap.prototype._loadRichTextEditor =','// Marker editor form:');
  const map=Object.create(proto);
  delete window.tinymce;
  const first=map._loadRichTextEditor();
  expect(map._loadRichTextEditor()).toBe(first);
  let script=document.head.querySelector('script');
  expect(script.src).toContain('/tinymce/5.10.9/');
  script.onerror();
  expect(first.state()).toBe('rejected');
  const retry=map._loadRichTextEditor();
  script=document.head.querySelector('script');
  window.tinymce={};script.onload();
  expect(retry.state()).toBe('resolved');
  script.remove();delete window.tinymce;
});
test('a game switched to meanwhile stops the old map\'s marker batches, and nothing waits on them runs',()=>{
  jest.useFakeTimers();
  const proto=methods('ZMap.prototype.addMarkers =','ZMap.prototype.addMarker =',{performance:{now:()=>0}});
  const added=[],handler=jest.fn();
  const map=Object.assign(Object.create(proto),{addMarker:m=>added.push(m),handlers:{markersAdded:[handler]},mapControl:{}});
  window.zMap={};   // (GameSwitch.js: the new game's map)
  const finished=jest.fn(),failed=jest.fn();
  map.addMarkersInBatches([1,2,3]).done(finished).fail(failed);
  jest.runAllTimers();
  expect(added).toEqual([]);
  expect(handler).not.toHaveBeenCalled();
  expect(finished).not.toHaveBeenCalled();
  expect(failed).not.toHaveBeenCalled();
  delete window.zMap;
  jest.useRealTimers();
});
test('the account is asked for at once but applied once every marker is in',()=>{
  const lib=fs.readFileSync('scripts/zmain.lib.js','utf8');
  expect(lib).toContain('function getUserInfo(markersReady)');
  expect(lib).toContain('(markersReady || $.Deferred().resolve().promise()).always(function() { applyNow(vResults, offline); });');
  // (the request goes out before the batches are done, not after)
  expect(lib.indexOf('getUserInfo(ready);')).toBeGreaterThan(lib.indexOf('zMap.addMarkersInBatches(vResults)'));
  expect(lib.indexOf('getUserInfo(ready);')).toBeLessThan(lib.indexOf('ready.done(function() {'));
});
