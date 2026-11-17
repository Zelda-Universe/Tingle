const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// A notification about a path's edit opens that edit (its revision), not
// the path: Go to Path, on the revision, is the way to the path.
test('the notifications list opens a path notification\'s revision or talk, as its link does',()=>{
  const js=read('scripts/znotifications.js');
  expect(js).toContain("_this.openPathFromLink(target.game, target.path, reopen, {talk: target.talk, comment: target.comment, pathRev: target.pathRev});");
  expect(js).not.toContain('_this.openPathFromLink(target.game, target.path, reopen); return;');
});

test('a path edit, pin edit or restore notifies the owner with the revision it made',()=>{
  const lib=read('lib/common/paths.php');
  expect(lib).toContain("function pathNotifyOwner($db, $prefix, $path, $actorId, $action, $summary = '', $revisionId = 0)");
  expect(lib).toContain("$data['link']['pathrev'] = (int) $revisionId;");
  expect(read('ajax/save_path.php')).toMatch(/pathNotifyOwner\([\s\S]*?\[\$revision\]\), \$revision\);/);
  expect(read('ajax/save_path_pin.php')).toContain("pathNotifyOwner($db, $map_prefix, $path, $userId, 'edit', $summary, $revision);");
  expect(read('ajax/revert_path.php')).toContain("'revert', $summary, $restored);");
  // A deletion still goes to Notifications: there's nothing left to open.
  expect(lib).toContain("$action === 'delete' ? array('page' => 'notifications')");
});

test('opening a path link with a revision shows just the revision',()=>{
  const js=read('scripts/services/PathEditor.js');
  expect(js).toMatch(/if\(path && opts\.pathRev\) \{\s*zmap\._openPathRevision\(path, Number\(opts\.pathRev\), back \|\| null, \{fromHistory: false\}\);\s*return;/);
});

test('opening a revision never moves the map to its path: only Go to Path does',()=>{
  const paths=read('scripts/services/Paths.js');
  const branch=paths.slice(paths.indexOf('if(revision && zmap._openPathSubpage)'),paths.indexOf('var linkBack'));
  expect(branch).not.toContain('focusPath');
  const editor=read('scripts/services/PathEditor.js');
  const open=editor.slice(editor.indexOf('ZMap.prototype._openPathRevision = function'),editor.indexOf('ZMap.prototype._restorePathRevision'));
  expect(open).not.toContain('focusPath');
});

test('another game\'s path revision opens where it was clicked: the game and map stay; only Go to Path goes there',()=>{
  const js=read('scripts/services/PathEditor.js');
  const link=js.slice(js.indexOf('ZMap.prototype._openPathRevisionLink = function'),js.indexOf('ZMap.prototype._restorePathRevision'));
  expect(link).toContain("this._openPathRevision({slug: slug, game: game, elsewhere: true}, revisionId, back, {fromHistory: false});");
  expect(link).not.toContain('openGameURL');
  // Nothing of it drawn or focused on this game's map; its steps just read.
  expect(js).toContain('this._focusedPath = path.elsewhere ? null : path;');
  expect(js).toMatch(/if\(path\.elsewhere\) return;\s*zmap\._wirePathSteps/);
  // Go to Path: its game.
  expect(js).toContain('if(path.elsewhere) zmap.openPathFromLink(path.game, path.slug, back || null);');
  // Its link names its own game.
  expect(js).toContain("url.searchParams.set('game', path.elsewhere && path.game ? path.game : this.mapOptions.shortName);");
  // A notification's revision too.
  expect(js).toContain("if(opts.pathRev) { this._openPathRevisionLink(slug, Number(opts.pathRev), game, back || null); return; }");
  // Its steps named from the server, the markers not being loaded here.
  expect(js).toContain('markerName: s.markerName');
  expect(read('ajax/path_history.php')).toContain("$step['markerName'] = $names[(int) $step['markerId']];");
});

test('Go to Path from a revision keeps the way back to it',()=>{
  const js=read('scripts/services/PathEditor.js');
  expect(js).toContain('ZMap.prototype._pathSubtitle = function(page, path, link, back)');
  expect(js).toContain("zmap.openPathPage(path.slug, {back: back || null});");
  expect(js).toContain("zmap.openPathFromLink(path.game, path.slug, back || null);");
  expect(js).toContain('this._pathSubtitle(page, path, goToPath, reopen);');
});
