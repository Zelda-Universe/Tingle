/** @jest-environment jsdom */
const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/../scripts/zmap.js', 'utf8');

test('announces downloaded maps only after the worker serves a tile for this game', () => {
  let listener;
  Object.defineProperty(navigator, 'onLine', { configurable: true, value: false });
  Object.defineProperty(navigator, 'serviceWorker', { configurable: true, value: {
    addEventListener: (name, callback) => { listener = callback; }
  } });
  window.caches = {};
  const context = { ZMap: function() {}, document, window, navigator, URL, location };
  vm.runInNewContext(source.slice(source.indexOf('ZMap.prototype.setupOfflineMapMessage ='),
    source.indexOf('ZMap.prototype.goToStart =')), context);
  const map = Object.assign(Object.create(context.ZMap.prototype), {
    maps: [{ _url: 'https://zeldamaps.com/tiles/eow/hyrule_overworld/{z}_{x}_{y}.png' }],
    mapOptions: { name: 'Echoes of Wisdom' }
  });
  map.setupOfflineMapMessage();
  const message = document.querySelector('.offline-map-empty-message');
  expect(message.textContent).toContain('Connect to the internet');
  listener({data:{type:'zeldamaps-tile-source',source:'download',url:'https://zeldamaps.com/tiles/totk/1_0_0.png'}});
  expect(message.textContent).toContain('Connect to the internet');
  listener({data:{type:'zeldamaps-tile-source',source:'download',url:'https://zeldamaps.com/tiles/eow/hyrule_overworld/0_0_0.png'}});
  expect(message.textContent).toBe("You're offline. Using on-device downloaded maps.");
});
