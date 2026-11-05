const { SearchMarkerHandler } = require('./SearchMarkerHandler');

function marker(overrides = {}) {
  return {
    id: '1',
    name: 'Great Sky Island',
    mapId: 'sky',
    markerCategoryTypeId: 3,
    markerCategoryId: 'regular',
    x: 10,
    y: 20,
    ...overrides
  };
}

function createHandler(searchableMarkers, categories = {}) {
  const handler = Object.create(SearchMarkerHandler.prototype);
  handler.searchableMarkers = searchableMarkers;
  handler.categories = categories;
  return handler;
}

describe('SearchMarkerHandler duplicate search results', () => {
  test('collapses close and same-location label variants', () => {
    const closeLabel = marker({
      id: 'close',
      markerCategoryId: 'close'
    });
    const standardLabel = marker({
      id: 'standard',
      markerCategoryId: 'regular'
    });
    const regionLabel = marker({
      id: 'region',
      markerCategoryId: 'region'
    });
    const handler = createHandler(
      [closeLabel, standardLabel, regionLabel],
      {
        close: { name: 'Places Labels - Close' },
        regular: { name: 'Places Labels' },
        region: { name: 'Region Labels' }
      }
    );

    expect(handler._deduplicateSearchResults([
      { item: closeLabel },
      { item: standardLabel },
      { item: regionLabel }
    ])).toEqual([{ item: standardLabel }]);
  });

  test('keeps same-name labels at different locations', () => {
    const fountainA = marker({ id: 'a', name: 'Great Fairy Fountain' });
    const fountainB = marker({
      id: 'b',
      name: 'Great Fairy Fountain',
      x: 500,
      y: 600
    });
    const handler = createHandler([fountainA, fountainB], {});

    expect(handler._deduplicateSearchResults([
      { item: fountainA },
      { item: fountainB }
    ])).toHaveLength(2);
  });

  test('prefers a POI over a colocated area label', () => {
    const areaLabel = marker({ id: 'label' });
    const poi = marker({
      id: 'poi',
      markerCategoryTypeId: 1,
      markerCategoryId: 'poi'
    });
    const handler = createHandler([areaLabel, poi], {});

    expect(handler._deduplicateSearchResults([
      { item: areaLabel },
      { item: poi }
    ])).toEqual([{ item: poi }]);
  });
});

describe('SearchMarkerHandler area searches', () => {
  const river = { id: 'area-river', name: "Zora's River", mapId: 'hyrule', areaDestination: true, markerCategoryTypeId: 3 };
  const domain = { id: 'area-domain', name: "Zora's Domain", mapId: 'hyrule', areaDestination: true, markerCategoryTypeId: 3 };
  const kokiri = { id: 'area-kokiri', name: 'Kokiri Forest', mapId: 'hyrule', areaDestination: true, markerCategoryTypeId: 3 };
  const temple = { id: 'map-temple', name: 'Forest Temple', mapId: 'temple', areaDestination: true, mapDestination: true, markerCategoryTypeId: 3 };
  const poi = (id, name, area, mapId = 'hyrule') => ({ id, name, mapId, area, categoryTypeId: 1 });
  const pillar = poi('pillar', 'Gold Skulltula - Pillar', "Zora's River");
  const entrance = poi('entrance', "Gold Skulltula - Zora's Domain Entrance", "Zora's River");
  const torches = poi('torches', 'Piece of Heart - Torches', "Zora's Domain");
  const twins = poi('twins', 'Gold Skulltula - House of Twins', 'Kokiri Forest');
  const inTemple = poi('basement', 'Gold Skulltula - Basement', null, 'temple');
  const all = [river, domain, kokiri, temple, pillar, entrance, torches, twins, inTemple];

  beforeEach(() => {
    global.zMap = { getMarkerAreaName: marker => marker.area };
  });
  afterEach(() => { delete global.zMap; });

  const names = results => results.map(result => (result.item || result).name);
  const wrap = list => list.map(item => ({ item, matches: [], score: 0 }));

  test('lists the POIs of each matching area right after it, moving direct matches under their area', () => {
    const handler = createHandler(all);
    const results = handler._addMarkersInMatchedAreas(wrap([river, domain, entrance]), 'zoras');
    expect(names(results)).toEqual([
      "Zora's River", 'Gold Skulltula - Pillar', "Gold Skulltula - Zora's Domain Entrance",
      "Zora's Domain", 'Piece of Heart - Torches'
    ]);
  });

  test("doesn't expand fuzzy area matches or whole maps", () => {
    const handler = createHandler(all);
    expect(names(handler._addMarkersInMatchedAreas(wrap([kokiri]), 'kak'))).toEqual(['Kokiri Forest']);
    expect(names(handler._addMarkersInMatchedAreas(wrap([temple]), 'temple'))).toEqual(['Forest Temple']);
  });
});
