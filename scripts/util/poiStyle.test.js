const fs = require('fs');
const vm = require('vm');
const context = {};
vm.runInNewContext(fs.readFileSync(__dirname + '/poiStyle.js', 'utf8'), context);
const style = context.getPOIStyle;

test('EoW and LA use the shared chest without replacing map, compass, or key glyphs', () => {
  for (const game of ['4', '22']) {
    expect(context.getPOIGlyph({container_id:game, img:'BotW_Treasure-Chest', name:'Treasure Chest'})).toBe('General_Chest');
    for (const img of ['General_Map','General_Compass','General_Key']) {
      expect(context.getPOIGlyph({container_id:game,img})).toBe(img);
    }
  }
  expect(context.getPOIGlyph({container_id:'19',img:'BotW_Treasure-Chest'})).toBe('BotW_Treasure-Chest');
  expect(context.getPOIGlyph({container_id:'64',img:'OoT_Chest'})).toBe('OoT_Chest');
});

test('only heart pieces use the quarter-filled variant, not whole heart containers',()=>{
  for(const [container_id,id] of [['64','64002'],['4','1956'],['22','2220']])
    expect(context.getPOIGlyph({container_id,id,img:'General_Heart'})).toBe('General_HeartPiece');
  expect(context.getPOIGlyph({container_id:'64',id:'64004',img:'General_Heart'})).toBe('General_Heart');
  expect(style({container_id:'64',id:'64006'})).toBe('memory');
});

describe('TotK POI visual prototype', () => {
  test('Link’s Awakening includes all leaf categories exactly once', () => {
    const ids = ['1951', '1952', '1953', '1954', '1956', '1957', '1958', '1960', '1961', '1962', '1964', '1965', '1966', '1969', '1968'];
    const categories = ids.map(id => ({ id, container_id: '4', parent_id: '1950' }));
    const groups = context.getPOICategoryGroups(categories);
    expect(groups.flatMap(g => g.categories).map(c => c.id).sort()).toEqual(ids.sort());
    expect(groups.filter(g => g.categories.length).map(g => g.title)).toEqual([
      'Collectibles', 'Locations', 'Points of Interest', 'Enemies & Bosses', 'Treasure'
    ]);
  });
  test.each([
    ['1956', 'heart'], ['1957', 'korok'], ['1958', 'memory'], ['1964', 'location'],
    ['1965', 'location'], ['1966', 'location'], ['1968', 'enemy'], ['1962', 'treasure']
  ])('LA %s uses the shared %s treatment', (id, expected) => {
    expect(style({ id, container_id: '4' })).toBe(expected);
  });
  test('EoW sections include every existing leaf category exactly once', () => {
    var ids = ['2210', '2211', '2220', '2221', '2222', '2278', '2230', '2231', '2232', '2233'];
    var records = ids.map(id => ({ id, parent_id: '2201', container_id: '22' }));
    records.push({ id: '2299', parent_id: '2204', container_id: '22' });
    var groups = context.getPOICategoryGroups(records);
    expect(groups.filter(g => g.categories.length).map(g => g.title)).toEqual([
      'Travel Gates', 'Collectibles', 'Locations', 'Points of Interest', 'Treasure'
    ]);
    expect(groups.flatMap(g => g.categories).map(c => c.id).sort()).toEqual(ids.sort());
    expect(context.getPOIStyle(records[0])).toBe('interest');
  });
  test('OoT sections follow BotW and TotK: Travel, Collectibles, Locations, Points of Interest, Treasure', () => {
    const root = (id, name) => ({ id, name, parent_id: null, container_id: '64', marker_category_type_id: '1' });
    const records = [root('64000', 'Collectibles'), {id: '64010', name: 'Labels', parent_id: null, container_id: '64', marker_category_type_id: '3'},
      root('64020', 'Treasure'), root('64030', 'Locations'), root('64040', 'Points of Interest'), root('64050', 'Travel Points')];
    expect(context.getPOICategoryGroups(records).map(g => g.title)).toEqual(['Travel Points', 'Collectibles', 'Locations', 'Points of Interest', 'Treasure']);
  });
  test.each([['64002', 'heart'], ['64001', 'relic'], ['64003', 'korok'], ['64000', ''], ['64021', 'treasure'],
    ['64031', 'location'], ['64032', 'location'], ['64033', 'location'], ['64041', 'interest'], ['64042', 'enemy'],
    ['64004', 'heart'], ['64005', 'silver'], ['64007', 'fairy-thought'], ['64008', 'song'], ['64043', 'interest'], ['64046', 'interest'], ['64051', 'travel'], ['64053', 'travel']])(
    'OoT %s uses the shared %s treatment, by category ID', (id, expected) => {
    expect(style({ id, container_id: '64' })).toBe(expected);
  });
  test.each([
    ['2232', 'travel'], ['2220', 'heart'], ['2221', 'memory'], ['2231', 'relic'],
    ['2211', 'korok'], ['2230', 'cave'], ['2233', 'location'], ['2278', 'treasure']
  ])('EoW %s receives the shared %s treatment', (id, treatment) => {
    expect(style({ id, container_id: '22' })).toBe(treatment);
  });
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

describe('Map Settings layouts and looks', () => {
  const base = [
    { id: '1901', parent_id: null, container_id: '19', marker_category_type_id: '1', name: 'Point of Interest' },
    { id: '1916', parent_id: '1910', container_id: '19', marker_category_type_id: '1', name: 'Korok Seeds' },
    { id: '1923', parent_id: '1920', container_id: '19', marker_category_type_id: '1', name: 'Sheikah Tower' },
    { id: '1934', parent_id: '1901', container_id: '19', marker_category_type_id: '1', name: 'Memories' },
    { id: '1955', parent_id: '1901', container_id: '19', marker_category_type_id: '1', name: 'NPCs' }
  ];

  test('a saved layout replaces the built-in sections, in its order', () => {
    const records = base.map(c => Object.assign({}, c));
    Object.assign(records[2], { menu_section: 'Collectibles', menu_order: 1 });
    Object.assign(records[1], { menu_section: 'Collectibles', menu_order: 2 });
    Object.assign(records[0], { menu_section: 'Points', menu_order: 3 });
    const groups = context.getPOICategoryGroups(records);
    expect(groups.map(g => g.title)).toEqual(['Collectibles', 'Points']);
    expect(groups[0].categories.map(c => c.id)).toEqual(['1923', '1916']);
    // Not in the layout: with its section's own "Other …" entry.
    expect(groups[1].categories.map(c => c.id)).toEqual(['1901', '1934', '1955']);
  });

  test('games listed by their database sections get a layout for Map Settings', () => {
    const records = [
      { id: '1', parent_id: null, container_id: '1', marker_category_type_id: '1', name: 'Items' },
      { id: '2', parent_id: '1', container_id: '1', marker_category_type_id: '1', name: 'Bombs' },
      { id: '3', parent_id: null, container_id: '1', marker_category_type_id: '1', name: 'Shops' },
      { id: '4', parent_id: null, container_id: '1', marker_category_type_id: '3', name: 'Labels' }
    ];
    expect(context.getPOIMenuLayout(records).map(g => [g.title, g.categories.map(c => c.id)])).toEqual([
      ['Items', ['2']], ['Shops', ['3']]
    ]);
  });

  test('a shape and colours given in Map Settings', () => {
    const custom = { id: '1916', container_id: '19', custom_style: 1, shape: 'diamond', color: '#123456', glyph_color: '#ffcc00' };
    expect(context.getPOIStyle(custom)).toBe('travel');
    expect(context.getPOIStyleVars(custom)).toBe('--poi-fill: #123456; color: #ffcc00; ');
    const none = Object.assign({}, custom, { shape: 'none' });
    expect(context.getPOIStyle(none)).toBe('treasure');
    expect(context.getPOIStyleVars(none)).toBe('--poi-outline: #123456; color: #ffcc00; ');
    expect(context.getPOIFill(none)).toBeNull();
    // Built-in styles are untouched.
    expect(context.getPOIStyleVars({ id: '1916', container_id: '19', color: '#000000' })).toBe('');
  });

  test('menu names', () => {
    expect(context.getPOIMenuName(base[0], base)).toBe('Other POIs');
    expect(context.getPOIMenuName({ id: '2134', name: 'Tears' }, [])).toBe("Dragon's Tears");
    expect(context.getPOIMenuName({ id: '2134', name: 'Dragon Tears' }, [])).toBe('Dragon Tears');
  });
});
