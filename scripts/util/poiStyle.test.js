const fs = require('fs');
const vm = require('vm');
const context = {};
vm.runInNewContext(fs.readFileSync(__dirname + '/poiStyle.js', 'utf8'), context);
const style = context.getPOIStyle;

describe('TotK POI visual prototype', () => {
  test.each([
    ['1923', 'travel'], ['1924', 'travel'], ['1925', 'travel'], ['1926', 'travel'],
    ['1927', 'location'], ['1938', 'location'], ['1916', 'korok'],
    ['1934', 'memory'], ['1948', 'treasure'], ['1945', 'treasure'],
    ['1940', 'enemy'], ['1949', 'interest']
  ])('BotW %s shares the %s treatment', (id, expected) => {
    expect(style({ id, container_id: '19', parent_id: id === '1940' ? '1930' : '1901' })).toBe(expected);
  });
  test('BotW uses its own travel categories and keeps Memories named correctly', () => {
    var categories = ['1923', '1924', '1925', '1926', '1934'].map(id => ({ id, container_id: '19', parent_id: '1920', name: id === '1934' ? 'Memories' : id }));
    var groups = context.getPOICategoryGroups(categories);
    expect(groups[0].categories.map(c => c.id)).toEqual(['1923', '1925', '1924', '1926']);
    expect(groups[1].categories[0].name).toBe('Memories');
  });
  test('BotW parent categories with direct markers remain selectable', () => {
    var categories = [
      { id: '1901', name: 'Point of Interest', container_id: '19', parent_id: null },
      { id: '1920', name: 'Locations', container_id: '19', parent_id: null },
      { id: '1930', name: 'Enemies', container_id: '19', parent_id: null }
    ];
    var groups = context.getPOICategoryGroups(categories);
    expect(groups.find(g => g.title === 'Locations').categories).toContain(categories[1]);
    expect(groups.find(g => g.title === 'Points of Interest').categories).toContain(categories[0]);
    expect(groups.find(g => g.title === 'Enemies & Bosses').categories).toContain(categories[2]);
  });
  test('groups categories in reference order without changing source records', () => {
    var categories = [
      { id: '2123', container_id: '21', parent_id: '2120' },
      { id: '2116', container_id: '21', parent_id: '2110' },
      { id: '2158', container_id: '21', parent_id: '2110' },
      { id: '9999', container_id: '21', parent_id: '2101' },
      { id: '2163', container_id: '21', parent_id: '2162' }
    ];
    var before = JSON.stringify(categories);
    var groups = context.getPOICategoryGroups(categories);
    expect(groups.map(g => g.title)).toEqual(['Travel Gates', 'Collectibles', 'Locations', 'Points of Interest', 'Enemies & Bosses', 'Treasure', 'Misc']);
    expect(groups[0].categories[0]).toBe(categories[0]);
    expect(groups[6].categories).toContain(categories[3]);
    expect(groups.flatMap(g => g.categories).map(c => c.id).sort()).toEqual(['2116', '2123', '2158', '9999']);
    expect(JSON.stringify(categories)).toBe(before);
    expect(context.getPOICategoryGroups([{ container_id: '20' }])).toBeNull();
  });
  test.each([
    ['2123', 'travel'], ['2125', 'travel'], ['2126', 'travel'], ['2127', 'travel'],
    ['2116', 'korok'], ['2134', 'memory'], ['2169', 'relic'],
    ['2150', 'location-round'], ['2152', 'location-round'], ['2151', 'cave'],
    ['2138', 'location'], ['2174', 'location'], ['2148', 'treasure']
  ])('%s uses %s treatment', (id, expected) => {
    expect(style({ id, container_id: '21' })).toBe(expected);
  });
  test('fills incomplete enemy and POI reference rows by category family', () => {
    expect(style({ id: '2153', container_id: '21', parent_id: '2130' })).toBe('enemy');
    expect(style({ id: '2167', container_id: '21', parent_id: '2101' })).toBe('interest');
  });
  test('treasure variants share the outlined treatment', () => {
    expect(style({ id: '2158', container_id: '21', name: "Treasure Chest (Sage's Will)" })).toBe('treasure');
  });
  test('other games, missing records and unmapped categories stay unchanged', () => {
    expect(style({ id: '2123', container_id: '19' })).toBe('');
    expect(style(null)).toBe('');
    expect(style({ id: '2163', container_id: '21' })).toBe('');
  });
});
