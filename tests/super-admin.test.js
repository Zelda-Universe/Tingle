const fs=require('fs');
const path=require('path');
const vm=require('vm');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// The staff roles (lib/common/admin.php): Moderator (10), with everything
// admins have for now; Admin (15); Super Admin (20), who manages the other
// admins in the admin panel and to everyone else is an Admin.
test('a super admin is shown publicly as an Admin, a moderator as a Moderator',()=>{
  const context={ZMap:function(){}};
  const wiki=read('scripts/zwiki.js');
  vm.runInNewContext(wiki.slice(0,wiki.indexOf('ZMap.prototype.WIKI_ACTIONS')),context);
  const zmap=new context.ZMap();
  expect(zmap._wikiRoleLabel(20)).toBe('Admin');
  expect(zmap._wikiRoleLabel(15)).toBe('Admin');
  expect(zmap._wikiRoleLabel(10)).toBe('Moderator');
  expect(zmap._wikiRoleLabel(5)).toBe('Contributor');
  expect(zmap._wikiRoleLabel(1,true)).toBe('Beta Editor');
  // Comments' role tag: the same.
  expect(wiki).toContain("comment.level >= _this.WIKI_ADMIN_LEVEL ? '<span class=\"wiki-role\">' + _this._wikiRoleLabel(comment.level) + '</span>'");
});

test('only the admin panel names the Super Admin role',()=>{
  expect(read('scripts/zmap.js')).toContain("{ level: 20, label: 'Super Admin' }");
  const admin=read('lib/common/admin.php');
  expect(admin).toContain('const SUPER_ADMIN_LEVEL = 20;');
  expect(admin).toContain("adminLevel() > $targetLevel");
  const update=read('ajax/admin_update_user.php');
  expect(update).toContain('Only admins can make someone a moderator, and only super admins an admin.');
  expect(update).toContain("You can't remove your own super admin role.");
});

test('moderators get every staff permission there is today',()=>{
  // Everything staff-only checks 10 and up: the admin panel, wiki, paths
  // and admin-only games (ALttP's).
  expect(read('lib/common/admin.php')).toContain('const MODERATOR_LEVEL = 10;\n  const ADMIN_LEVEL = MODERATOR_LEVEL;');
  expect(read('lib/common/wiki.php')).toContain('const WIKI_ADMIN_LEVEL = 10;');
  expect(read('lib/common/paths.php')).toContain('const PATHS_ADMIN_LEVEL = 10;');
  // Today's admins stay admins: the role starts empty.
  expect(read('migrations/20261115150000_moderator_role.sql')).toContain('UPDATE `user` SET `level` = 15 WHERE `level` = 10;');
});

test('the promotion only touches Jess, and only as an admin already',()=>{
  expect(read('migrations/20261115140000_super_admin.sql'))
    .toContain('UPDATE `user` SET `level` = 20 WHERE `id` = 15 AND `level` >= 10 AND `level` < 20;');
});
