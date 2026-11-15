const fs=require('fs');
const path=require('path');
const css=fs.readFileSync(path.join(__dirname,'../styles/zmain.css'),'utf8');

// A path's colour in the drawer (styles/zmain.css): never too dark to see on
// its dark background, lifted to a lightness floor with its hue kept.
test('the steps\' line has a lightness floor, after a plain fallback',()=>{
  const rule=css.slice(css.indexOf('.path-timeline .path-step::before {'));
  const body=rule.slice(0,rule.indexOf('}'));
  expect(body.indexOf('background: color-mix(in srgb, var(--path-color, #ffad48) 70%, #1b1b1f);'))
    .toBeLessThan(body.indexOf('background: oklch(from color-mix(in srgb, var(--path-color, #ffad48) 70%, #1b1b1f) max(l, .6) c h);'));
});

test('icons and the current step\'s underline get the same floor',()=>{
  expect(css.match(/oklch\(from var\(--path-color, #ffad48\) max\(l, \.6\) c h\)/g).length).toBe(4);
});
