const fs = require('fs');

test('tile delivery and service worker changes rotate the shared app cache version', () => {
  const source = fs.readFileSync(__dirname + '/../lib/common/assets.php', 'utf8');
  for (const file of ['service-worker.js','service-worker.php','ajax/get_map.php','lib/common/tile_delivery.php']) {
    expect(source).toContain("'" + file + "'");
  }
  expect(source).toContain('md5_file($path)');
});

test('app cache rotation preserves downloaded maps and reloads existing clients', () => {
  const worker = fs.readFileSync(__dirname + '/../service-worker.js', 'utf8');
  const page = fs.readFileSync(__dirname + '/../index.php', 'utf8');
  expect(worker).toContain("!cacheName.startsWith('zeldamaps-offline-')");
  expect(page).toContain("addEventListener('controllerchange'");
  expect(page).toContain('window.location.reload()');
});
