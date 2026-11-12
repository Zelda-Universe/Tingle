const fs=require('fs'),vm=require('vm');
const source=fs.readFileSync('scripts/zmap.js','utf8');
const context={ZMap:function(){}};
vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._withoutPageSlide ='),source.indexOf('ZMap.prototype._restoreDrawerPage =')),context);
vm.runInNewContext(fs.readFileSync('scripts/zwiki.js','utf8'),context);
vm.runInNewContext(fs.readFileSync('scripts/znotifications.js','utf8'),context);

test('URL routes suppress slides but explicit in-app Back restores them',()=>{
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{},_restoreDrawerPage:jest.fn(function(){return this.mapControl._suppressPageSlide;})});
  expect(map.restoreDrawerPage('account')).toBe(true);
  expect(map.mapControl._suppressPageSlide).toBeUndefined();
  expect(map.restoreDrawerPage('account',true)).toBeUndefined();
});

test('delayed profile data retains initial-load suppression without suppressing future navigation',()=>{
  let done;
  const request={done:fn=>{done=fn;return request;},fail:()=>request};
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{},_wikiGet:()=>request,_renderUserProfile:jest.fn(function(){expect(this.mapControl._suppressPageSlide).toBe(true);})});
  map._withoutPageSlide(()=>map._openUserProfile({name:'GoldenChaos'}));
  expect(map.mapControl._suppressPageSlide).toBeUndefined();
  done({success:true});
  expect(map._renderUserProfile).toHaveBeenCalledTimes(1);
  expect(map.mapControl._suppressPageSlide).toBeUndefined();
  map._renderUserProfile=jest.fn(function(){expect(this.mapControl._suppressPageSlide).toBeUndefined();});
  map._openUserProfile({name:'GoldenChaos'});done({success:true});
  expect(map._renderUserProfile).toHaveBeenCalledTimes(1);
});

test('delayed user Talk lookup also paints without sliding on cold load',()=>{
  let done;
  const request={done:fn=>{done=fn;return request;}};
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{},_wikiGet:()=>request,_openTalk:jest.fn(function(){expect(this.mapControl._suppressPageSlide).toBe(true);})});
  map._withoutPageSlide(()=>map._openWikiLink({user:'GoldenChaos',talk:true}));
  done({success:true,user:{id:1,username:'GoldenChaos'}});
  expect(map._openTalk).toHaveBeenCalledTimes(1);
  expect(map.mapControl._suppressPageSlide).toBeUndefined();
});

test('central slide decision honors suppression and all startup entry points use it',()=>{
  expect(fs.readFileSync('scripts/controls/ZLayers.js','utf8')).toContain('var shouldSlide = !this._suppressPageSlide');
  expect(fs.readFileSync('scripts/zmain.lib.js','utf8')).toContain('return zMap._withoutPageSlide(finalLoadContent)');
  expect(fs.readFileSync('scripts/znotifications.js','utf8')).toContain('this._withoutPageSlide(function() {this._openWikiLink(link);}');
});
