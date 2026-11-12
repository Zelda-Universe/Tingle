const fs=require('fs'),vm=require('vm');
const source=fs.readFileSync(require('path').join(__dirname,'../scripts/zmap.js'),'utf8');
function setup(url='https://example.test/?game=OoTR'){
  const context={ZMap:function(){},URL,window:{location:{href:url},history:{state:{},replaceState:jest.fn(function(state,_,href){this.state=state;context.window.location.href=href;})}}};
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype.drawerPageRoutes ='),source.indexOf('ZMap.prototype.restoreResponsiveDrawer =')),context);
  const map=Object.assign(Object.create(context.ZMap.prototype),{_drawerRoutingReady:true,mapOptions:{shortName:'OoTR'},mapControl:{resetContent:jest.fn()},_openRecentChanges:jest.fn(),_openUserProfile:jest.fn()});
  return {map,context};
}
test.each([['allChanges','all-changes'],['recentChanges-BotW','recent-edits'],['userProfile-42','profile']])('community page %s survives URL restoration',(type,page)=>{
  const {map,context}=setup('https://example.test/?game=OoTR&marker=7&area=field');
  map.syncDrawerPageURL(type);
  const url=new URL(context.window.location.href);
  expect(url.searchParams.get('page')).toBe(page==='profile'?null:page);
  if(page==='profile') expect(url.searchParams.get('user')).toBe('42');
  expect(url.searchParams.has('marker')).toBe(false);
  expect(url.searchParams.has('area')).toBe(false);
  map.restoreDrawerPage(page);
  if(page==='profile')expect(map._openUserProfile.mock.calls[0][0]).toEqual({name:'42'});
  else expect(map._openRecentChanges.mock.calls[0][0]).toBe(page==='all-changes'?null:'BotW');
});
test('leaving a community page removes its route arguments',()=>{
  const {map,context}=setup('https://example.test/?page=profile&profile=42&edits-game=BotW');
  map.syncDrawerPageURL('category');
  const params=new URL(context.window.location.href).searchParams;
  for(const key of ['page','profile','edits-game'])expect(params.has(key)).toBe(false);
});
test('empty profile links do not make profile requests',()=>{
  const {map}=setup('https://example.test/?page=profile&profile=');
  map.restoreDrawerPage('profile');
  expect(map._openUserProfile).not.toHaveBeenCalled();
});
test('profile links use the username once the profile has loaded',()=>{
  const {map,context}=setup();
  map._profileNames={42:'Hylian Hero'};
  map.syncDrawerPageURL('userProfile-42');
  expect(new URL(context.window.location.href).searchParams.get('user')).toBe('Hylian Hero');
  map.restoreDrawerPage('profile');
  expect(map._openUserProfile.mock.calls[0][0]).toEqual({name:'Hylian Hero'});
});

test('user Talk URLs use names and keep numeric ID fallbacks',()=>{
  const {map,context}=setup();
  map._profileNames={42:'GoldenChaos'};
  map.syncDrawerPageURL('talk-user-42');
  let url=new URL(context.window.location.href);
  expect(url.searchParams.get('user')).toBe('GoldenChaos');
  expect(url.searchParams.get('talk')).toBe('1');
  expect(url.searchParams.has('page')).toBe(false);
  map._profileNames={};map.syncDrawerPageURL('talk-user-42');
  expect(new URL(context.window.location.href).searchParams.get('user')).toBe('42');
  map.syncDrawerPageURL('category');
  url=new URL(context.window.location.href);
  expect(url.searchParams.has('user')).toBe(false);
  expect(url.searchParams.has('talk')).toBe(false);
});

test('marker and region Talk pages write reloadable addresses',()=>{
  const {map,context}=setup();
  map.syncDrawerPageURL('talk-marker-55');
  let params=new URL(context.window.location.href).searchParams;
  expect(params.get('marker')).toBe('55');
  expect(params.get('talk')).toBe('1');
  map.syncDrawerPageURL('m55');
  params=new URL(context.window.location.href).searchParams;
  expect(params.has('talk')).toBe(false);
});

test('initial marker rendering does not erase the Talk route before it restores',()=>{
  const original='https://example.test/?game=OoTR&marker=55&talk=1&comment=9';
  const {map,context}=setup(original);
  map.mapControl._restoringInitialPage=true;
  map.syncDrawerPageURL('m55');
  expect(context.window.location.href).toBe(original);
});
