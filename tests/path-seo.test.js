const fs=require('fs');
const path=require('path');
const vm=require('vm');
const read=file=>fs.readFileSync(path.join(__dirname,'..',file),'utf8');

// Official paths get their own page for search engines and link previews
// once everyone may see them (lib/common/seo.php seoPathPages), and the
// browser's title matches it while one of the path's pages is open.
test('the server gives paths their own title, description, canonical address and steps',()=>{
  const seo=read('lib/common/seo.php');
  expect(seo).toContain("if (!pathsVisible(0) || !$db->fetchOne(");
  expect(seo).toContain("p.scope = 'official' AND \" . pathPublishedSql() . \" AND c.visible = 1");
  const index=read('index.php');
  expect(index).toContain("$pageHeading = $seoPath['name'] . ' - ' . $metadata['name'] . ' Guide';");
  expect(index).toContain('$canonicalUrl = seoPathUrl($pathGame, $seoPath[\'slug\']);');
  expect(index).toContain("<?php foreach ($seoPath['steps'] as $stepName): ?>");
  expect(read('sitemap/index.php')).toContain('$paths = seoPathPages($db, $map_prefix);');
});

test('games that are not public are never indexed',()=>{
  const index=read('index.php');
  expect(index).toContain("$robots = isset($_GET['game']) && !isset($gameAliases[$gameKey]) ? 'noindex, nofollow' : 'index, follow';");
  expect(index).toContain('<meta name="robots"   content="<?= $robots ?>">');
  // ALttP's and Path Lab's names aren't public games'.
  const aliases=index.slice(index.indexOf('$gameAliases = ['),index.indexOf('];',index.indexOf('$gameAliases = [')));
  expect(aliases.toLowerCase()).not.toMatch(/alttp|pathlab/);
});

test('the browser title follows a path\'s pages and steps aside for others',()=>{
  const source=read('scripts/services/Paths.js');
  const context={ZMap:function(){},document:{title:'Ocarina of Time Remake Interactive Map - Zelda Maps'},seoGameName:g=>g.pageTitle || g.name};
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype.PATH_PAGES'),source.indexOf('// Whether a path is selected and in focus')),context);
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype._updatePathTitle'),source.indexOf('// Whether a path is selected and in focus')),context);
  const zmap=Object.assign(new context.ZMap(),{mapOptions:{name:'Ocarina of Time (2026)',pageTitle:'Ocarina of Time Remake'},_focusedPath:{name:"Biggoron's Sword Trading Sequence"}});
  zmap._updatePathTitle('pathRevision-17');
  expect(context.document.title).toBe("Biggoron's Sword Trading Sequence - Ocarina of Time Remake Guide - Zelda Maps");
  zmap._updatePathTitle('categories');
  expect(context.document.title).toBe('Ocarina of Time Remake Interactive Map - Zelda Maps');
  // A page that set its own title keeps it.
  zmap._updatePathTitle('path');
  context.document.title='Key Items - Ocarina of Time Remake - Zelda Maps';
  zmap._updatePathTitle('category-64063');
  expect(context.document.title).toBe('Key Items - Ocarina of Time Remake - Zelda Maps');
});
