const fs = require('fs');
const path = require('path');
const root = path.resolve(__dirname, '..');

test('warp pad SVG preserves the existing portal shape with padding', () => {
  const font = fs.readFileSync(path.join(root, 'fonts/icomoon.svg'), 'utf8');
  const svg = fs.readFileSync(path.join(root, 'images/icons/oot/WarpPad.svg'), 'utf8');
  const original = font.match(/glyph-name="LA_Portal" d="([^"]+)"/)[1];
  expect(svg).toContain(`d="${original}"`);
  expect(svg).toContain('viewBox="-48 -48 1120 1120"');
  expect(svg).toContain('translate(0 960) scale(1 -1)');
});

test('the offline shell includes every custom OoT glyph', () => {
  const worker = fs.readFileSync(path.join(root, 'service-worker.js'), 'utf8');
  for (const name of ['Poe', 'Kaepora', 'SilverRupee', 'GossipStone', 'WarpPad', 'Chest']) {
    expect(worker).toContain(`./images/icons/oot/${name}.svg`);
  }
});

test('the chest replacement is scoped to OoT and NPCs retain the original speech bubble', () => {
  const migration = fs.readFileSync(path.join(root, 'migrations/20261106150000_oot_chest_icon.sql'), 'utf8');
  expect(migration).toContain("SET img = 'OoT_Chest' WHERE id = 64021 AND container_id = 64");
  const style = fs.readFileSync(path.join(root, 'styles/style.css'), 'utf8');
  expect(style).toContain('M4%205h24a3');
  expect(style).not.toContain('images/icons/NPC.svg');
  expect(fs.readFileSync(path.join(root, 'images/icons/oot/Chest.svg'), 'utf8')).toContain('viewBox="0 0 32 32"');
});

test('the owl keeps its original size and clips artwork without clipping completion badges', () => {
  const css = fs.readFileSync(path.join(root, 'styles/poi.css'), 'utf8');
  expect(css).toContain('.category-icon.icon-OoT_Kaepora::before {\n  clip-path:');
  expect(css).toContain('.circleMap-small.poi-travel > .icon-OoT_Kaepora {\n  clip-path:');
  expect(css).not.toContain('.poi-badge > .icon-OoT_Kaepora::before { width:.92em');
  expect(css).not.toContain('width:1.08em');
});
