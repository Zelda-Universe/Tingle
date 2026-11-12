/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),$=require('jquery');
const context={ZMap:function(){},$};
vm.runInNewContext(fs.readFileSync('scripts/zwiki.js','utf8'),context);
const map=Object.assign(Object.create(context.ZMap.prototype),{_wikiMarkerURL:(id,game)=>'/?game='+(game || 'OoTR')+'&marker='+id,_wikiEscape:s=>$('<div>').text(s).html(),_wikiAgo:()=> 'now',_wikiUserLink:(id,name)=>name,mapOptions:{shortName:'OoTR'},_openTalk:jest.fn()});
test('reply activity displays its quoted parent and opens the precise comment',()=>{
  const row=map._wikiActivityRow({id:8,userId:1,username:'Editor',revisionType:'talk',pageType:'marker',pageId:12,parentId:7,parentBody:'Original message',parentUsername:'Original author',body:'Reply <script>bad()</script>',markerTitle:'A marker',ago:0});
  expect(row.find('blockquote').text()).toContain('Original author');
  expect(row.find('blockquote').text()).toContain('Original message');
  expect(row.find('script')).toHaveLength(0);
  expect(row.find('a.wiki-revision-marker').attr('data-marker')).toBe('12');
  expect(row.text()).not.toContain('Comment 8');
  expect(row.find('.activity-comment-body').next().is('blockquote')).toBe(true);
  map._openActivityComment(row.find('.wiki-revision')[0],()=>{});
  expect(map._openTalk).toHaveBeenCalledWith('marker',12,'A marker',expect.any(Function),{highlight:8,game:null,region:false});
});
test('deleted marker names are not linked in talk or revision items',()=>{
  const change={id:8,markerId:12,pageId:12,pageType:'marker',markerTitle:'Deleted marker',markerDeleted:true,revisionType:'talk',body:'Comment'};
  expect(map._wikiActivityRow(change).find('a.wiki-revision-marker')).toHaveLength(0);
  expect(map._wikiRevisionRow({...change,revisionType:'marker'},{markerTitle:'Deleted marker'}).find('a.wiki-revision-marker')).toHaveLength(0);
});
test('activity comments leave marker selection and the map untouched and return to the activity list',()=>{
  const marker={id:12,title:'Selected marker'};
  const markerBack=()=>{};
  const local=Object.assign(Object.create(context.ZMap.prototype),map,{cachedMarkersById:{12:marker},mapControl:{},goTo:jest.fn(),_closeNewMarker:jest.fn(),_openMarkerLink:jest.fn(),_wikiBackToMarker:()=>markerBack,_openTalk:jest.fn()});
  const row=local._wikiActivityRow({id:8,revisionType:'talk',pageType:'marker',pageId:12,body:'Comment',markerTitle:'Selected marker'});
  const sourceBack=jest.fn();
  local._openActivityComment(row.find('.wiki-revision')[0],sourceBack);
  expect(local.goTo).not.toHaveBeenCalled();
  expect(local._openMarkerLink).not.toHaveBeenCalled();
  expect(local._openTalk).toHaveBeenCalledWith('marker',12,'Selected marker',sourceBack,{highlight:8,game:null,region:false});
  local._openTalk.mock.calls[0][3]();
  expect(local._closeNewMarker).not.toHaveBeenCalled();
  expect(sourceBack).toHaveBeenCalledTimes(1);
});
test('activity filters use the admin segmented styling',()=>{
  const control=$(map._activityFilterHTML('talk'));
  expect(control.hasClass('admin-tabs')).toBe(true);
  expect(control.find('button').map((i,e)=>e.textContent).get()).toEqual(['All','Edits','Talk']);
  expect(control.find('[aria-selected=true]').text()).toBe('Talk');
});
