const fs = require('fs');
const path = require('path');

describe('scalable EoW icon assets', () => {
  test('Waypoint and Echo use raster artwork while Stamp uses its finished SVG', () => {
    const css = fs.readFileSync(path.join(__dirname, '../styles/poi.css'), 'utf8');
    expect(css).toContain('--eow-icon: url(images/icons/eow/Warp.png)');
    expect(css).toContain('--eow-icon: url(images/icons/eow/Echo.png)');
    expect(css).toContain('--eow-icon: url(images/icons/eow/StampTable.svg)');
  });
  test.each([
    ['Warp', 56], ['StampTable', 64], ['WorldGlobePiece', 64], ['Echo', 80]
  ])('%s uses smooth paths at its original proportions', (name, size) => {
    const svg = fs.readFileSync(path.join(__dirname, '../images/icons/eow', name + '.svg'), 'utf8');
    expect(svg).toContain(`viewBox="0 0 ${size} ${size}"`);
    expect(svg).toMatch(/<path\b/);
    if(name === 'WorldGlobePiece') {
      expect(svg).toMatch(/[HV]\s*\d/);
      expect(svg).not.toMatch(/[Cc]\s*-?\d/);
    } else expect(svg).toMatch(/[CcAa]\s*-?\d/);
    expect(svg).not.toMatch(/<image\b|data:image|<rect\b/);
    expect(svg.length).toBeLessThan(12000);
  });
});
