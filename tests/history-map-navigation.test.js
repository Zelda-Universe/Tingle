const fs=require('fs');
const vm=require('vm');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

test('opening a revision preserves the current map selection in its URL',()=>{
  const context={ZMap:function(){},URL,window:{location:{href:'https://zeldamaps.com/?game=LA&marker=12'},history:{state:null,replaceState:jest.fn()}}};
  vm.runInNewContext(read('scripts/zwiki.js'),context);
  context.ZMap.prototype._setRevisionURL(999,42);
  const url=new URL(context.window.history.replaceState.mock.calls[0][2]);
  expect(url.searchParams.get('game')).toBe('LA');
  expect(url.searchParams.get('marker')).toBe('12');
  expect(url.searchParams.get('rev')).toBe('42');
});

test('recent edits and profile edits open revisions for every viewer without switching games',()=>{
  const recent=read('scripts/zbeta.js');
  const profile=read('scripts/zwiki.js');
  expect(recent.includes('else window.location.href = _this._wikiMarkerURL(markerId, markerGame,')).toBe(false);
  expect(profile.includes('// Revisions are for editors; everyone else goes to the marker.')).toBe(false);
  expect(read('scripts/znotifications.js').includes('if(!link.rev && !link.talk && link.game')).toBe(true);
});
