/** @jest-environment jsdom */
// Regression: turning push on from Notification Settings used to fail on
// Safari with "The string contains invalid characters." because the base64url
// padding made a string whose length is 1 mod 4, which atob() rejects.
const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(__dirname + '/../scripts/znotifications.js', 'utf8');

function loadPushKey() {
  const context = { ZMap: function() {}, atob, Uint8Array };
  vm.runInNewContext(
    source.slice(source.indexOf('ZMap.prototype._pushKey ='), source.indexOf('ZMap.prototype._renderPushControl =')),
    context
  );
  return Object.create(context.ZMap.prototype);
}

// base64url, as the server sends it (lib/common/push.php strips the '=').
function toBase64Url(bytes) {
  return Buffer.from(bytes).toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

// A 65-byte uncompressed P-256 point, as pushVapidKeys stores it.
function makeKey(byteLength, filler) {
  const key = Buffer.alloc(byteLength, 0);
  key[0] = 0x04;
  for(let i = 1; i < key.length; i++) key[i] = filler + i;
  return key;
}

test('_pushKey decodes the 65-byte VAPID public key (87 base64url chars, length % 4 == 3)', () => {
  const map = loadPushKey();
  const key = makeKey(65, 1);
  const base64Url = toBase64Url(key);
  expect(base64Url.length).toBe(87);
  const bytes = map._pushKey(base64Url);
  expect(bytes).toBeInstanceOf(Uint8Array);
  expect(Buffer.from(bytes).equals(key)).toBe(true);
});

test('_pushKey round-trips keys of every base64 length remainder', () => {
  const map = loadPushKey();
  // Byte lengths 62..65 give base64url remainders mod 4 of 3,0,2,3 (1 is unreachable: a valid base64 can't be 1 mod 4).
  for(const length of [62, 63, 64, 65]) {
    const key = makeKey(length, 2);
    const base64Url = toBase64Url(key);
    const bytes = map._pushKey(base64Url);
    expect(Buffer.from(bytes).equals(key)).toBe(true);
  }
});
