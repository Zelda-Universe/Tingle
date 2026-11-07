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
  for (const name of ['Poe', 'Kaepora', 'SilverRupee', 'GossipStone', 'WarpPad']) {
    expect(worker).toContain(`./images/icons/oot/${name}.svg`);
  }
});
