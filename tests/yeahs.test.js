/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),$=require('jquery');
const context={ZMap:function(){},$};
vm.runInNewContext(fs.readFileSync('scripts/zwiki.js','utf8'),context);
const map=Object.assign(Object.create(context.ZMap.prototype),{getUser:()=>({level:10}),_wikiEscape:s=>$('<span>').text(s).html()});

test('unreleased Yeah controls and counts are hidden from non-admins',()=>{
  for(const user of [null,{level:1},{level:5,betaEditor:true}]) {
    const viewer=Object.assign(Object.create(map),{getUser:()=>user});
    expect(viewer._yeahHTML('comment',21,false)).toBe('');
    expect(viewer._yeahHTML('revision',21,true)).toBe('');
  }
});

test('Yeah controls expose a count, toggle state and monochrome plus icon',()=>{
  const button=$(map._yeahHTML('comment',21,false));
  expect(button.is('button[type=button]')).toBe(true);
  expect(button.attr('data-yeah-key')).toBe('comment:21');
  expect(button.attr('aria-pressed')).toBe('false');
  expect(button.find('.yeah-count').text()).toBe('0');
  expect(button.find('.yeah-icon').hasClass('yeah-plus')).toBe(true);
});
test('history counts use the person without a plus and namespace revision IDs',()=>{
  const summary=$(map._yeahHTML('settings',36,true));
  expect(summary.is('button')).toBe(false);
  expect(summary.attr('data-yeah-key')).toBe('settings:36');
  expect(summary.find('.yeah-icon').hasClass('yeah-person')).toBe(true);
});
test('storage prevents duplicate Yeahs per account and target',()=>{
  const migration=fs.readFileSync('migrations/20261111080000_likes.sql','utf8');
  expect(migration).toContain('PRIMARY KEY (`target_type`, `target_id`, `user_id`)');
  const endpoint=fs.readFileSync('ajax/likes_set.php','utf8');
  expect(endpoint).toContain('INSERT IGNORE');
  expect(endpoint).toContain('wikiRequireEditor');
  expect(endpoint).toContain('likeTargetExists');
  expect(endpoint).toContain('HTTP_SEC_FETCH_SITE');
});
