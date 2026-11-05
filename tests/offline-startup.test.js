const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/../scripts/zmain.js', 'utf8');

test.each([
  [false, '', ['LA'], 'LA'],
  [false, '', [], 'OoT'],
  [true, '', ['LA'], 'OoT'],
  [false, 'EoW', ['LA'], 'EoW']
])('startup online=%s, linked game=%s, downloads=%j selects %s before requesting data', (online, linked, downloads, expected) => {
  const getJSON = jest.fn(() => ({ fail() {} }));
  const replaceState = jest.fn();
  const $ = Object.assign(() => ({ on() {} }), { getJSON });
  const context = { URL, $, document: {}, globalKeyPressHandler() {}, zMapInit() {}, showOfflineUnavailable() {},
    navigator: { onLine: online }, ZConfig: { getConfig() {} },
    ZMap: function() { this.setupOfflineMapMessage = jest.fn(); },
    ZMapOfflinePacks: { downloadedGameIds: () => downloads }, getUrlParam: () => linked,
    window: { location: { href: 'https://stage.zeldamaps.com/' }, history: { state: null, replaceState } }
  };
  vm.runInNewContext(source, context);
  expect(getJSON).toHaveBeenCalledWith('ajax.php?command=get_container&game=' + expected, context.zMapInit);
  if(!linked) expect(replaceState).toHaveBeenCalledWith(null, '', 'https://stage.zeldamaps.com/?game=' + expected);
  else expect(replaceState).not.toHaveBeenCalled();
});
