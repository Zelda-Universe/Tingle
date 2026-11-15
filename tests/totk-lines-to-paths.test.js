const fs=require('fs');
const path=require('path');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// TotK's old marker lines as paths (migrations/20261115190000_totk_lines_to_paths.sql):
// 100 Korok pairs and 105 Korok races, official but unlisted, and 7
// dragon flights, listed.
const up=read('migrations/20261115190000_totk_lines_to_paths.sql');
const down=read('migrations/20261115190000_totk_lines_to_paths.down.sql');

test('212 paths: pairs and races unlisted, dragons listed, each with its history',()=>{
  const inserts=up.match(/^INSERT INTO `path` .*$/gm);
  expect(inserts.length).toBe(212);
  expect(inserts.filter(l=>l.includes("'Korok Pair'") && l.includes("'unlisted'")).length).toBe(100);
  expect(inserts.filter(l=>l.includes("'Korok Race'") && l.includes("'unlisted'")).length).toBe(105);
  // A race's start: a shown pin named Korok Race: Start (no korok there: it isn't a marker).
  expect((up.match(/NULL AS `marker_id`, \d+ AS `submap_id`, [-\d.]+ AS `x`, [-\d.]+ AS `y`, 'Korok Race: Start' AS `name`, NULL AS `note`, 1 AS `shown`/g) || []).length).toBe(105);
  expect(inserts.filter(l=>l.includes("Flight") && l.includes("'public'")).length).toBe(7);
  // One check each, as Jess's, only while the marker's line is as it was.
  inserts.forEach(l=>{
    expect(l).toContain("'single'");
    expect(l).toMatch(/SELECT 21, 15, 'official'/);
    expect(l).toMatch(/AND EXISTS \(SELECT 1 FROM `marker` WHERE id = \d+ AND path = '/);
  });
  expect(up.match(/^INSERT INTO `path_revision` .*'create'.*$/gm).length).toBe(212);
});

test('the old lines are backed up before they\'re cleared, and the down migration puts them back',()=>{
  expect(up.indexOf('INSERT IGNORE INTO `marker_path_backup`')).toBeLessThan(up.indexOf("UPDATE `marker` m SET m.path = ''"));
  expect(down).toContain('UPDATE `marker` m JOIN `marker_path_backup` b ON b.marker_id = m.id SET m.path = b.path');
  // (No DROP: the site's database user may not have it.)
  expect(down).not.toMatch(/DROP TABLE/);
  // Every statement on one line, as bin/migrate.php splits them.
  up.split('\n').filter(l=>l && !l.startsWith('--')).forEach(l=>expect(l.endsWith(';')).toBe(true));
});

// An official path can be unlisted: on the map, out of lists, the sitemap
// and feeds.
test('official paths can be unlisted, and unlisted ones stay out of lists, the sitemap, search and feeds',()=>{
  expect(read('ajax/save_path.php')).toContain("if ($scope === 'official') $visibility = $visibility === 'unlisted' ? 'unlisted' : 'public';");
  expect(read('scripts/services/PathEditor.js')).toContain("<option value='official-unlisted'>");
  expect(read('scripts/services/Paths.js')).toContain("ids[p.categoryId] && p.visibility !== 'unlisted'");
  expect(read('sitemap/index.php')).toContain("$p['visibility'] !== 'unlisted'");
  expect(read('index.php')).toContain("if(($seoPath['visibility'] ?? '') === 'unlisted') $robots = 'noindex, follow';");
  expect(read('lib/common/community_changes.php')).toContain(" AND NOT (p.scope='official' AND p.visibility='unlisted')");
});

// A single path's later markers (a Korok pair's Carry korok) are checked
// with its first: not counted or listed on their own.
test('category counts leave out the markers a single path stands in for',()=>{
  const ZMap=function(){};
  const source=read('scripts/services/Paths.js');
  const start=source.indexOf('ZMap.prototype._categoryCounts');
  new Function('ZMap',source.slice(start,source.indexOf('\n};',start)+3))(ZMap);
  const zmap=new ZMap();
  const markers=[{categoryId:1,pathFollower:true,complete:true},{categoryId:1,pathFollower:true,complete:false},
    {categoryId:1,pathFollower:false,complete:true},{categoryId:2,pathFollower:true,complete:true}];
  zmap.getMarkers=()=>markers;
  zmap.paths=[{}];
  expect(zmap._categoryCounts({id:1,total:10,complete:4})).toEqual({done:3,total:8});
  // No paths loaded: as counted.
  zmap.paths=[];
  expect(zmap._categoryCounts({id:1,total:10,complete:4})).toEqual({done:4,total:10});
  expect(read('scripts/widgets/CategoryButton.js')).toContain('zMap._categoryCounts(this.category)');
  expect(read('scripts/services/CategoryPage.js')).toContain('if(marker.pathFollower) return false;');
  expect(read('scripts/services/AreaSearch.js')).toContain('if(marker.pathFollower) return false;');
});

// A single path's page (PathEditor.js openPathPage): one check, as a
// marker page's Complete, with no guide (Start, numbers, each step's
// Complete).
test('a single path\'s page has one Complete and no guide',()=>{
  const editor=read('scripts/services/PathEditor.js');
  expect(editor).toContain("var single = path.kind === 'single';");
  expect(editor).toContain("class='marker-action-button infoWindowIcn path-single-complete ");
  expect(editor).toContain("(shown.length && !single ? \"<div class='path-start-row drawer-peek-end'>");
  expect(editor).toContain("(check && !framed && !single ? \"<button type='button' class='path-step-complete'>");
  expect(editor).toContain("zmap._setMarkerDone(lead.id, complete, function() { zmap.updatePathCompletionCounts(); });");
  expect(read('styles/zmain.css')).toContain('.path-timeline.path-steps-single .path-step-n { display: none; }');
});

test('a single path\'s later marker completes with its path, even opened before paths load',()=>{
  const zmap=read('scripts/zmap.js');
  expect(zmap).toContain('var checkMarker = follows ? follows.lead : marker;');
  expect(zmap).toContain('this._markerCompleteButtonHTML(checkMarker)');
  const editor=read('scripts/services/PathEditor.js');
  expect(editor).toContain("if(own) own.outerHTML = zmap._markerCompleteButtonHTML(follows.lead);");
  expect(editor).toContain('Completes together with ');
  // Paths starting at a bare point open on their own map.
  expect(read('scripts/services/Paths.js')).toContain("var layer = !onFirst && (this.maps || []).find(function(l) { return String(l.defaultSubMapId) === String(first.submapId); });");
});

test('a single path\'s cards show no steps, progress, starts or finishes',()=>{
  const editor=read('scripts/services/PathEditor.js');
  expect(editor).toContain("if(!single) meta.push(steps + (steps === 1 ? ' step' : ' steps'));");
  expect(editor).toContain("if(p.started && !single) stats.push(\"<span class='path-finished' title='People who started it'>");
  expect(editor).toContain("if(p.kind !== 'single' && Array.isArray(p.steps) && this._pathCheckMarkers) {");
});

test('both of a Korok pair\'s markers stay on the map, done together, each linking to the other',()=>{
  const zmap=read('scripts/zmap.js');
  expect(zmap).not.toContain('&& !marker.pathFollower');
  expect(zmap).toContain('var check = marker.pathFollower && marker.pathLead ? marker.pathLead : marker;');
  expect(read('scripts/services/PathEditor.js')).toContain("class='wiki-link wiki-code-link marker-path-partner' onclick='_this._openMarkerLink(");
  const up=read('migrations/20261115190000_totk_lines_to_paths.sql');
  expect(up).toContain("UPDATE `marker` SET name = 'Korok Pair: Start' WHERE marker_category_id = 2116 AND name = 'Hidden Korok: Pair'");
  expect(up).toContain("UPDATE `marker` SET name = 'Korok Pair: Finish' WHERE marker_category_id = 2116 AND name = 'Hidden Korok: Carry'");
  expect(up).toContain("'Light Dragon\\'s Flight Path'");
});

test('a race\'s start opens its path, with no hover name; search finds paths by name and by their markers',()=>{
  const paths=read('scripts/services/Paths.js');
  expect(paths).toContain("if(path.kind === 'single') zmap.openPathPage(path.slug, {back: null}); else zmap.openPathPin(path, p.step);");
  expect(paths).toContain("if(tip && path.kind !== 'single') dot.bindTooltip(");
  const editor=read('scripts/services/PathEditor.js');
  expect(editor).toContain("if(p._preview || p.visibility === 'unlisted') return false;");
  expect(editor).toContain("if(p.steps.some(function(s) { return s.markerId && ids[s.markerId]; })) found.push(p);");
  expect(read('scripts/handlers/SearchMarkerHandler.js')).toContain('results = this._addMarkersOfMatchedPaths(results, query);');
});

test('hovering a race\'s start is hovering its path: thicker edges and its card',()=>{
  const paths=read('scripts/services/Paths.js');
  expect(paths).toContain("if(path.kind === 'single') pathDots.push(dot);");
  expect(paths).toContain('var hovered = [hit].concat(pathDots);');
  expect(paths).toContain("hovered.forEach(function(layer) { layer.bindTooltip(function() {");
});

test('a race\'s start is edged as its line: thin, thicker while the path is hovered or open',()=>{
  const paths=read('scripts/services/Paths.js');
  expect(paths).toContain("(path.kind === 'single' ? ' zm-path-point' + (selected ? ' thick' : '') : '')");
  expect(paths).toContain("el.classList.toggle('thick', on);");
  const css=read('styles/zmain.css');
  expect(css).toContain('.zm-path-pin-dot.zm-path-point span { border-width: 1.25px; }');
  expect(css).toContain('.zm-path-pin-dot.zm-path-point.thick span { border-width: 2.5px; }');
});

test('a path card\'s thumbnail draws its ends as markers: its colour, a white edge at any size',()=>{
  const editor=read('scripts/services/PathEditor.js');
  expect(editor).toContain("r='\" + (square ? 13 : 7) + \"' fill='\" + c + \"' stroke='#fff' stroke-width='2' vector-effect='non-scaling-stroke'/>");
  // The finish has a flag.
  expect(editor).toContain("<rect x='-.42' y='-.6' width='.16' height='1.2' rx='.08'/><path d='M-.3 -.6 L.5 -.33 L-.3 -.06 Z'/></g>");
  expect(editor).toContain("r='\" + (square ? 11 : 5.5) + \"' fill='\" + c + \"' stroke='#fff' stroke-width='2' vector-effect='non-scaling-stroke'/>");
});

test('one-check paths are left out of start and finish figures (counting them made TotK\'s paths load in seconds)',()=>{
  const paths=read('lib/common/paths.php');
  const fn=paths.slice(paths.indexOf('function pathChecksSql'));
  expect(fn.slice(0,fn.indexOf('\n  }'))).toContain("WHERE s.marker_id IS NOT NULL AND cp.kind <> 'single'");
});
