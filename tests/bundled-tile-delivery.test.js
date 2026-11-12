const fs = require('fs');
const {execFileSync} = require('child_process');

test('bundled HQ tiles use the current site in web and CLI runtimes', () => {
  const result = execFileSync('php', ['-r',
    'require "lib/common/tile_delivery.php"; echo json_encode([bundledMapTileBaseURL("oot/hq-v1/hyrule-child/"),bundledMapTileBaseURL("oot/hq-v1/gerudo-training-ground-1f-state00/"),bundledMapTileBaseURL("totk/surface/"),bundledMapTileBaseURL("oot/hyrule-child/")]);'
  ], {cwd: __dirname + '/..', encoding:'utf8'});
  expect(JSON.parse(result)).toEqual(['/tiles/','/tiles/',null,null]);
});

test('online and offline map URLs share the bundled tile routing rule', () => {
  const online = fs.readFileSync(__dirname + '/../ajax/get_map.php','utf8');
  const offline = fs.readFileSync(__dirname + '/../ajax/get_offline_maps.php','utf8');
  expect(online).toContain("bundledMapTileBaseURL($row2['tileURL'])");
  expect(offline).toContain("bundledMapTileBaseURL($relativeDirectory . '/') ?? $tilePublicBaseURL");
  expect(offline).toContain('offline-manifests-v8-');
});
