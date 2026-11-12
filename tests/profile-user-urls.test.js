/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),{execFileSync}=require('child_process');
const $=require('jquery');
const windowStub={location:{href:'https://zeldamaps.com/?user=GoldenChaos&talk=1'}};
const context={ZMap:function(){},URL,$,window:windowStub};
const zmapSource=fs.readFileSync('scripts/zmap.js','utf8');
vm.runInNewContext(zmapSource.slice(zmapSource.indexOf('ZMap.prototype._withoutPageSlide ='),zmapSource.indexOf('ZMap.prototype.restoreDrawerPage =')),context);
vm.runInNewContext(fs.readFileSync('scripts/zwiki.js','utf8'),context);
vm.runInNewContext(fs.readFileSync('scripts/znotifications.js','utf8'),context);

test.each(['GoldenChaos','42'])('profile URLs accept %s as a username or ID fallback',identifier=>{
  windowStub.location.href='https://zeldamaps.com/?user='+identifier;
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{},_openUserProfile:jest.fn()});
  expect(map._hasWikiLink()).toBe(true);
  map._openWikiLink(map._wikiLinkParams());
  expect(map._openUserProfile).toHaveBeenCalledWith({name:identifier},undefined);
});

test.each(['GoldenChaos','42'])('Talk resolves %s to a real user ID before loading comments',identifier=>{
  windowStub.location.href='https://zeldamaps.com/?user='+identifier+'&talk=1';
  const api=jest.fn(()=>({done:fn=>fn({success:true,user:{id:42,username:'GoldenChaos'}})}));
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{},_wikiGet:api,_openTalk:jest.fn()});
  map._openWikiLink(map._wikiLinkParams());
  expect(api).toHaveBeenCalledWith('user_profile',{name:identifier});
  expect(map._openTalk).toHaveBeenCalledWith('user',42,'GoldenChaos',expect.any(Function),{highlight:0});
});

test('profile links and canonical metadata use username URLs',()=>{
  const map=Object.create(context.ZMap.prototype);
  expect(map._wikiUserURL('Hylian Hero')).toBe('?user=Hylian%20Hero');
  expect(map._wikiUserURL('GoldenChaos',true)).toBe('?user=GoldenChaos&talk=1');
  const result=JSON.parse(execFileSync('php',['-r','require "lib/common/profile_metadata.php"; echo json_encode([profilePageMetadata("GoldenChaos"),profilePageMetadata("GoldenChaos",true)]);'],{encoding:'utf8'}));
  expect(result.map(m=>m.url)).toEqual(['https://zeldamaps.com/?user=GoldenChaos','https://zeldamaps.com/?user=GoldenChaos&talk=1']);
});

test('copy-profile action reuses marker clipboard feedback rather than copying wiki code',()=>{
  const source=fs.readFileSync('scripts/zwiki.js','utf8');
  expect(source).toContain('Copy Link to Profile');
  expect(source).toContain('_this._copyText(new URL(_this._wikiUserURL(profile.username),window.location.href).href,this)');
  expect(source).not.toContain("_this._wikiCopy('[[user:'");
});

test('profile copy buttons display Copied! and restore their label just like marker buttons',async()=>{
  jest.useFakeTimers();
  try {
    const source=fs.readFileSync('scripts/zmap.js','utf8');
    const start=source.indexOf('ZMap.prototype._copyText =');
    const end=source.indexOf('ZMap.prototype.',start+1);
    const clipboard=jest.fn(()=>Promise.resolve());
    const copyContext={ZMap:function(){},window:{isSecureContext:true,clearTimeout,setTimeout},navigator:{clipboard:{writeText:clipboard}},document};
    vm.runInNewContext(source.slice(start,end),copyContext);
    const button=document.createElement('button');
    button.innerHTML='<span class="copy-action-icon"><i class="fas fa-link"></i></span><span class="copy-action-label">Copy Link to Profile</span>';
    copyContext.ZMap.prototype._copyText('https://zeldamaps.com/?user=GoldenChaos',button);
    await Promise.resolve();
    expect(clipboard).toHaveBeenCalledWith('https://zeldamaps.com/?user=GoldenChaos');
    expect(button.querySelector('.copy-action-label').textContent).toBe('Copied!');
    jest.advanceTimersByTime(1500);
    expect(button.querySelector('.copy-action-label').textContent).toBe('Copy Link to Profile');
  } finally {jest.useRealTimers();}
});

test.each(['?user=GoldenChaos&talk=1','?game=BotW&marker=5&talk=1&comment=9'])('Talk destination remains in the address while startup loads %s',query=>{
  windowStub.location.href='https://zeldamaps.com/'+query;
  windowStub.history={state:null,replaceState:(state,title,url)=>{windowStub.location.href=url;}};
  const map=Object.assign(Object.create(context.ZMap.prototype),{mapControl:{},_openWikiLink:jest.fn()});
  map._openRevisionLinkWhenReady('user');
  map._openRevisionLinkWhenReady('markers');
  expect(map._openWikiLink).toHaveBeenCalledWith(expect.objectContaining({talk:true}));
  expect(new URL(windowStub.location.href).searchParams.get('talk')).toBe('1');
});

test('profile copy control spans both action columns',()=>{
  const css=fs.readFileSync('styles/zmain.css','utf8');
  const rule=css.slice(css.indexOf('.profile-actions [data-action="copy-profile"]'));
  expect(rule.slice(0,rule.indexOf('}'))).toContain('grid-column: 1 / -1');
});

test('empty bios have no placeholder and Edit Profile is a circular banner action',()=>{
  const source=fs.readFileSync('scripts/zwiki.js','utf8'),css=fs.readFileSync('styles/zmain.css','utf8');
  expect(source.includes("You haven\\'t written a bio yet.")).toBe(false);
  expect(source.includes('No bio yet.')).toBe(false);
  expect(source).toContain('class="profile-banner-edit" data-action="edit" aria-label="Edit Profile"');
  const actions=source.slice(source.indexOf('<div class="wiki-actions profile-actions">'),source.indexOf('(data.canEdit ?',source.indexOf('<div class="wiki-actions profile-actions">')));
  expect(actions.includes('data-action="edit"')).toBe(false);
  const editRule=css.slice(css.indexOf('.profile-banner-edit {'),css.indexOf('.profile-banner-edit:hover'));
  expect(editRule).toContain('border-radius:50%');
  expect(editRule).toContain('right:16px');
  expect(css).toContain('.profile-head .profile-bio:empty { display:none; }');
});

test('profile edit uses the scrollport for native stickiness and activity segments have breathing room',()=>{
  const source=fs.readFileSync('scripts/zwiki.js','utf8'),css=fs.readFileSync('styles/zmain.css','utf8');
  expect(source).toContain("find('.profile-banner-edit').detach().on('click',openProfileEditor).prependTo(this.mapControl._contents)");
  expect(css).toContain('min-height:34px; padding:6px 12px');
  expect(css).toContain('.profile-activity-heading { display:flex; align-items:center;');
});
