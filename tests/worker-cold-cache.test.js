const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/../service-worker.js', 'utf8');

// After Safari has been idle, the first read of the saved copies loads all of
// them from disk, downloaded maps included. Measured in the iOS simulator with
// one 20,000-tile map: a white page for 13 seconds when the page and the
// scripts it waits on waited for that read; 2 seconds once they didn't.

const never = () => new Promise(() => {});

function worker({ match, put, fetch }) {
  const waitUntil = jest.fn();
  const scope = { URL, self: { location: { origin: 'https://zeldamaps.com' },
    registration: { scope: 'https://zeldamaps.com/' }, addEventListener() {} },
    caches: { open: async () => ({ put, match }), match },
    fetch };
  vm.runInNewContext(source, scope);
  return { scope, event: { waitUntil } };
}

function response(body) {
  return { ok: true, body, clone: () => response(body + ' (copy)') };
}

test('a page is answered from the network without waiting to save its copy', async () => {
  const live = response('page');
  const { scope, event } = worker({ fetch: async () => live, put: never, match: never });
  expect(await scope.navigateWithCurrentShell({ url: 'https://zeldamaps.com/?game=OoT' }, event)).toBe(live);
  expect(event.waitUntil).toHaveBeenCalledTimes(1);
});

test('game data is answered from the network without waiting to save its copy', async () => {
  const live = response('markers');
  const { scope, event } = worker({ fetch: async () => live, put: never, match: never });
  expect(await scope.networkFirst({ url: 'https://zeldamaps.com/ajax.php?command=get_markers' }, 'data', null, event)).toBe(live);
});

test('a script comes from the network when the saved copies are slow to read', async () => {
  const live = response('script');
  const { scope, event } = worker({ fetch: async () => live, put: never, match: never });
  expect(await scope.staleWhileRevalidate({ url: 'https://zeldamaps.com/res.php?type=javascript' }, 'app', event)).toBe(live);
});

test('a script still comes from its saved copy when that is ready first', async () => {
  const saved = response('saved script');
  const { scope, event } = worker({ fetch: never, put: never, match: async () => saved });
  expect(await scope.staleWhileRevalidate({ url: 'https://zeldamaps.com/res.php?type=javascript' }, 'app', event)).toBe(saved);
});

test('offline, a script comes from its saved copy', async () => {
  const saved = response('saved script');
  let read;
  const match = () => new Promise(resolve => { read = () => resolve(saved); });
  const { scope, event } = worker({ fetch: async () => { throw new Error('Offline'); }, put: never, match });
  const answer = scope.staleWhileRevalidate({ url: 'https://zeldamaps.com/res.php?type=javascript' }, 'app', event);
  await new Promise(resolve => setTimeout(resolve, 0));
  read();
  expect(await answer).toBe(saved);
});

test('a server error does not beat a saved copy', async () => {
  const saved = response('saved script');
  let read;
  const match = () => new Promise(resolve => { read = () => resolve(saved); });
  const { scope, event } = worker({ fetch: async () => ({ ok: false, status: 500 }), put: never, match });
  const answer = scope.staleWhileRevalidate({ url: 'https://zeldamaps.com/res.php?type=javascript' }, 'app', event);
  await new Promise(resolve => setTimeout(resolve, 0));
  read();
  expect(await answer).toBe(saved);
});
