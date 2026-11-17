const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/../service-worker.js', 'utf8');

// A push is sent for each new notification, and the worker asks the server
// what's unread from the last few minutes. Two close together (a Yeah and a
// reply) each found both, and an iPhone showed each twice: it doesn't replace
// a notification shown again with the same tag.

// (A Response as far as the worker uses one.)
class Response {
  constructor(body) { this.body = body; }
  async text() { return this.body; }
}

function worker(unread) {
  const listeners = {};
  const stores = {};
  const shown = [];
  const caches = {
    open: async name => {
      const store = stores[name] = stores[name] || new Map();
      return {
        match: async url => store.has(url) ? { json: async () => JSON.parse(store.get(url)) } : undefined,
        put: async (url, response) => { store.set(url, await response.text()); }
      };
    },
    keys: async () => Object.keys(stores)
  };
  const self = {
    location: { origin: 'https://zeldamaps.com' },
    registration: {
      scope: 'https://zeldamaps.com/',
      showNotification: async (title, options) => { shown.push({ title, tag: options.tag }); }
    },
    clients: { matchAll: async () => [] },
    addEventListener: (type, fn) => { listeners[type] = fn; }
  };
  vm.runInNewContext(source, {
    URL, Response, self, caches,
    fetch: async () => ({ json: async () => ({ notifications: unread() }) })
  });
  const push = () => {
    let done;
    listeners.push({ waitUntil: promise => { done = promise; } });
    return done;
  };
  return { push, shown, stores };
}

const yeah = { id: 41, title: 'LucyNei gave your comment a Yeah', url: '?game=TotK' };
const reply = { id: 42, title: 'LucyNei replied to your comment', url: '?game=TotK' };

test('two pushes that each find both notifications show each once', async () => {
  const w = worker(() => [reply, yeah]);
  await Promise.all([w.push(), w.push()]);
  expect(w.shown.map(n => n.title)).toEqual([yeah.title, reply.title]);
});

test('one after the other, too', async () => {
  let unread = [yeah];
  const w = worker(() => unread);
  await w.push();
  unread = [reply, yeah];
  await w.push();
  expect(w.shown.map(n => n.tag)).toEqual(['zeldamaps-notification-41', 'zeldamaps-notification-42']);
});

test('a push with nothing new still shows something, as browsers require', async () => {
  const w = worker(() => [yeah]);
  await w.push();
  await w.push();
  expect(w.shown.map(n => n.tag)).toEqual(['zeldamaps-notification-41', 'zeldamaps-notification-41']);
});

test('nothing unread: the general one, as before', async () => {
  const w = worker(() => []);
  await w.push();
  expect(w.shown).toEqual([{ title: 'Zelda Maps', tag: 'zeldamaps-notifications' }]);
});

test('what\'s been shown is kept apart from the caches an update clears', async () => {
  const w = worker(() => [yeah]);
  await w.push();
  expect(Object.keys(w.stores)).toEqual(['zm-push-shown']);
  expect(source).toContain("cacheName.startsWith('zeldamaps-') &&");
});
