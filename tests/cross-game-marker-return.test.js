const fs=require('fs');
const vm=require('vm');
function harness(url='https://zeldamaps.com/?game=OoTR&page=all-changes') {
  const stored=new Map();
  const window={location:{href:url},sessionStorage:{getItem:k=>stored.get(k)||null,setItem:(k,v)=>stored.set(k,v)},history:{state:null,replaceState:jest.fn(function(state,title,url){window.location.href=url;})}};
  const context={ZMap:function(){},URL,window};
  vm.runInNewContext(fs.readFileSync('scripts/services/MarkerNavigation.js','utf8'),context);
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{returnNextPageTo:jest.fn(),resetContent:jest.fn()},_openRecentChanges:jest.fn(),_openMarkerRevision:jest.fn(),_openUserProfile:jest.fn()});
  return {map,window,stored};
}

test('cross-game marker Back restores All Changes and its filter without changing games',()=>{
  const h=harness(),back=Object.assign(()=>{},{label:'All Changes',activitySource:{type:'recent',game:'',filter:'talk'}});
  const destination=h.map._markerURLWithReturn('https://zeldamaps.com/?game=BotW&marker=5&zoom=6',back);
  const token=new URL(destination).searchParams.get('nav-from');
  expect(token).toBeTruthy();
  h.window.location.href=destination;
  h.map._prepareMarkerLinkReturn();
  const page=h.map.mapControl.returnNextPageTo.mock.calls[0][0];
  expect(page.label).toBe('All Changes');
  page.page();
  const origin=new URL(h.window.location.href);
  expect(origin.searchParams.get('game')).toBe('BotW');
  expect(origin.searchParams.has('nav-from')).toBe(false);
  expect(h.map._openRecentChanges).toHaveBeenCalledWith(null,null,'talk');
  expect(new URL(h.window.location.href).searchParams.has('nav-restore')).toBe(false);
});

test('nested revision and profile return callbacks survive a game reload',()=>{
  const h=harness('https://zeldamaps.com/?game=OoTR&marker=5&rev=20');
  const profile=Object.assign(()=>{},{label:'Link',activitySource:{type:'profile',id:9,filter:'edits'}});
  const revision=Object.assign(()=>{},{label:'Revision 20',navigationSource:{type:'revision',id:20},navigationBack:profile});
  const destination=h.map._markerURLWithReturn('https://zeldamaps.com/?game=BotW&marker=6',revision);
  const token=new URL(destination).searchParams.get('nav-from');
  h.window.location.href=destination;
  expect(h.map._restoreMarkerLinkSource(token)).toBe(true);
  const [id,parent]=h.map._openMarkerRevision.mock.calls[0];
  expect(id).toBe(20);
  parent();
  expect(h.map._openUserProfile).toHaveBeenCalledWith({id:9},null);
  expect(h.map._profileActivityFilter).toBe('edits');
});

test('forged external returns and absent session contexts do not create redirects',()=>{
  const h=harness();
  h.stored.set('zmap-marker-return:evil',JSON.stringify({url:'https://evil.example/',path:{source:{type:'page'}}}));
  expect(h.map._readMarkerLinkReturn('evil')).toBeNull();
  h.window.location.href='https://zeldamaps.com/?game=BotW&marker=5&nav-from=missing';
  h.map._prepareMarkerLinkReturn();
  expect(h.map.mapControl.returnNextPageTo).not.toHaveBeenCalled();
  expect(h.map._restoreMarkerLinkSource('missing')).toBe(false);
});

test('storage failures do not prevent navigation',()=>{
  const h=harness();h.window.sessionStorage.setItem=()=>{throw Error('Unavailable');};
  expect(h.map._markerURLWithReturn('https://zeldamaps.com/?game=BotW&marker=5',()=>{})).toBe('https://zeldamaps.com/?game=BotW&marker=5');
});

test('the full drawer ancestry survives repeated game switches, not just its first page',()=>{
  const h=harness();h.map.restoreDrawerPage=jest.fn();
  const account=Object.assign(()=>{},{label:'Account',navigationSource:{type:'page',page:'account'}});
  const changes=Object.assign(()=>{},{label:'All Changes',activitySource:{type:'recent',game:'',filter:'edits'},navigationBack:account});
  const revision=Object.assign(()=>{},{label:'Revision 20',navigationSource:{type:'revision',id:20},navigationBack:changes});
  const profile=Object.assign(()=>{},{label:'GoldenChaos',activitySource:{type:'profile',id:9,filter:'talk'},navigationBack:revision});
  h.window.location.href=h.map._markerURLWithReturn('https://zeldamaps.com/?game=BotW&marker=5',profile);
  const carried=h.map._markerLinkReturnBack();
  h.window.location.href=h.map._markerURLWithReturn('https://zeldamaps.com/?game=EoW&marker=6',carried);
  h.map._markerLinkReturnBack()();
  const profileBack=h.map._openUserProfile.mock.calls[0][1];profileBack();
  const revisionBack=h.map._openMarkerRevision.mock.calls[0][1];revisionBack();
  const changesBack=h.map._openRecentChanges.mock.calls[0][1];changesBack();
  expect(h.map._openRecentChanges).toHaveBeenCalledWith(null,expect.any(Function),'edits');
  expect(h.map.restoreDrawerPage).toHaveBeenCalledWith('account',true);
  expect(new URL(h.window.location.href).searchParams.get('game')).toBe('EoW');
});
