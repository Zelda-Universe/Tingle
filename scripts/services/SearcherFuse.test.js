const { SearcherFuse } = require('./SearcherFuse');
const { $ } = require('jquery');

beforeEach(() => {
  Fuse = jest.fn();
});

test('init', () => {
  expect(() => new SearcherFuse()).not.toThrow();
});
