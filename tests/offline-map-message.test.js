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
    maps: [], mapOptions: {}
  });
  delete window.caches;
  map.setupOfflineMapMessage();
  const message = document.querySelector('.offline-map-empty-message');
  expect(message.textContent).toContain('Connect to the internet');
  expect(message.style.display).toBe('block');
  map.maps = [{ _url: 'https://zeldamaps.com/tiles/eow/hyrule_overworld/{z}_{x}_{y}.png' }];
  map.mapOptions.name = 'Echoes of Wisdom';
  map.mapControl = { viewStyleBottomSlide: true, _mobileDrawerBaseTop: 0, _startPosition: 600 };
  map.setupOfflineMapMessage();
  expect(document.querySelectorAll('.offline-map-empty-message')).toHaveLength(1);
  expect(message.textContent).toContain('Echoes of Wisdom');
  expect(message.classList.contains('offline-map-message-mobile')).toBe(true);
  listener({data:{type:'zeldamaps-tile-source',source:'download',url:'https://zeldamaps.com/tiles/totk/1_0_0.png'}});
  expect(message.textContent).toContain('Connect to the internet');
  listener({data:{type:'zeldamaps-tile-source',source:'download',url:'https://zeldamaps.com/tiles/eow/hyrule_overworld/0_0_0.png'}});
  expect(message.textContent).toBe("You're offline. Using on-device downloaded maps.");
  Object.defineProperty(navigator, 'onLine', { configurable: true, value: true });
  window.dispatchEvent(new Event('online'));
  expect(message.style.display).toBe('none');
  Object.defineProperty(navigator, 'onLine', { configurable: true, value: false });
  window.dispatchEvent(new Event('offline'));
  expect(message.style.display).toBe('block');
});
