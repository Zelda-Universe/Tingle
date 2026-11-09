const fs=require('fs'),vm=require('vm');
const file=(name)=>fs.readFileSync(require('path').join(__dirname,'../scripts/'+name),'utf8');
const ZWIKI=file('zwiki.js');

// Every wiki page opens through _showWikiPage. Pages whose content loads
// from the server after the slide must say so (opts.settles), or the drawer
// shrinks to the Loading placeholder and jumps back when the content
// arrives (scripts/controls/ZLayers.js pins the height until it settles).
// The contract below forces that choice for every page.
const FILES=['zwiki.js','zbeta.js','znotifications.js','zreports.js','zmapsettings.js'];
// [test, expects the settles flag]
const PAGE_RULES=[
  [/markerHistory-/, true],
  [/markerRevision-/, true],
  [/'talk-'/, true],
  [/'notificationsPage'/, true],
  [/'notificationSettingsPage'/, true],
  [/'followedMarkersPage'/, true],
  [/'report-'/, true],
  [/'mapSettings',\s*$/m, true],
  [/'recentChanges-'/, true],
  [/'profilePreview'/, false],
  [/'userProfile-'/, false],
  [/'mapSettingsItem'/, false]
];

// Each _showWikiPage( call, up to its closing `);` at the statement level.
function wikiPageCalls(source){
  var calls=[],index=0;
  while(true){
    var start=source.indexOf('_showWikiPage(',index);
    if(start===-1)break;
    var open=source.indexOf('(',start);
    var depth=0,end=-1;
    for(var i=open;i<source.length;i++){
      if(source[i]==='(')depth++;
      else if(source[i]===')'){depth--;if(!depth){end=i;break;}}
    }
    calls.push(source.slice(start,end+1));
    index=end+1;
  }
  return calls;
}
const CALLS={};
FILES.forEach(function(name){CALLS[name]=wikiPageCalls(file(name));});

test('every wiki page declares whether it settles',()=>{
  var total=0;
  Object.keys(CALLS).forEach(function(name){
    CALLS[name].forEach(function(call){
      total++;
      var rules=PAGE_RULES.filter(function(rule){return rule[0].test(call);});
      // A page matching no rule (a new one) or two rules must be classified.
      expect(rules.length).toBe(1);
      var id=(call.match(/id="([a-z_]+)"/)||[,'?'])[1];
      var hasSettles=/settles:\s*true/.test(call);
      expect([name, id, hasSettles]).toEqual([name, id, rules[0][1]]);
    });
  });
  expect(total).toBeGreaterThanOrEqual(10);
});

// _showWikiPage passes the flag on to the drawer.
function showWikiPage(){
  const context={ZMap:function(){}};
  vm.runInNewContext(ZWIKI.slice(ZWIKI.indexOf('ZMap.prototype._showWikiPage ='),ZWIKI.indexOf('ZMap.prototype._wikiError')),context);
  context.ZMap.prototype._wireWikiLinks=()=>{};
  const control={viewStyleBottomSlide:false,_expand:jest.fn(),_contents:{querySelector:()=>({})},setContent:jest.fn()};
  return Object.assign(Object.create(context.ZMap.prototype),{mapControl:control});
}
test('_showWikiPage marks settling pages for the drawer',()=>{
  const page=showWikiPage();
  const back=function(){};
  page._showWikiPage('<div></div>','allChanges',back,'reopen');
  expect(page.mapControl._nextPageSettles).toBe(false);
  expect(page.mapControl._nextPageBack).toBe(back);
  page._showWikiPage('<div></div>','allChanges',back,'reopen',{settles:true});
  expect(page.mapControl._nextPageSettles).toBe(true);
});
