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
