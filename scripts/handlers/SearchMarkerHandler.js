// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearchMarkerHandler - Connects the various related widgets to perform search actions, cohesively-containing logic, and provides configuration.
// - opts: [Object] Typical options object.
//   - markerSearchField: [Object] - The search field to use.  Creates a default instance if one is not provided.
//   - markerListView: [Object] - The list view to use.  Creates one if not provided.  Applies configuration whether to create a plain or search stats list view.
//   - showSearchStats: [Boolean] - Determines which list view to create, if one is not provided: a plain or search stats version.
//   - markerSearchClick: [Function] - The function to execute when a marker search entry in the list is clicked.

function SearchMarkerHandler(opts) {
  this._initSettings(opts);
  this._initComponents(opts);
  this._setupUIInteraction();
};

SearchMarkerHandler.prototype._initSettings = function(opts) {
  this.markerSearchField = opts.markerSearchField;
  this.markerListView = opts.markerListView;
  this.categories = opts.categories || {};

  this.showSearchStats = getSetOrDefaultValue(opts.showSearchStats, false);

  opts["markerEntryClick"] = Object.pop(opts, "markerSearchClick");

  ZConfig.addHandlers(
    [
      'searchTarget-markers'          ,
      'searchTargetIndexStart-markers',
      'searchTargetIndexEnd-markers'
    ],
    this.createSearcher.bind(this)
  );

  this.handlers = {
    markerListViewBuilt: []
  };
};

SearchMarkerHandler.prototype._initComponents = function(opts) {
  if(!this.markerSearchField) {
    this.markerSearchField = new MarkerSearchField();
  }

  if(!this.markerListView) {
    if(this.showSearchStats) {
      this.markerListView = new SearchMarkerListView(opts);
    } else {
      this.markerListView = new MarkerListView(opts);
    }
  }
};

SearchMarkerHandler.prototype.setMarkers = function(markers) {
  this.markers = markers;

  this.createSearcher();
};

SearchMarkerHandler.prototype.createSearcher = function() {
  var startIndex  =  Number.parseInt(ZConfig.getConfig(
    'searchTargetIndexStart-markers'
  ));
  if(!Number.isInteger(startIndex)) {
    startIndex = 0;
  }

  var endIndex    =  Number.parseInt(ZConfig.getConfig(
    'searchTargetIndexEnd-markers'
  ));
  if(!Number.isInteger(endIndex)) {
    endIndex = this.markers.length;
  }

  this.searchableMarkers = this.markers.slice(startIndex, endIndex);
  this.searcher = new SearcherFuse({
    name: 'markers',
    targetSearchMaterial: this.searchableMarkers
  });
};

SearchMarkerHandler.prototype._setupUIInteraction = function() {
  this.markerSearchField.domNode.on('search', this._displayResults.bind(this));
};

SearchMarkerHandler.prototype._displayResults = function(e, query) {
  var results = this._deduplicateSearchResults(this.searcher.search(query));
  results = this._addMarkersInMatchedAreas(results, query);
  if (!this.showSearchStats) results = results.map(function(entry) { return entry.item; });
  this.markerListView.showMarkers(query, results);
  this.handlers["markerListViewBuilt"].forEach(function(handler) {
    handler(this.markerListView);
  }, this);
};

SearchMarkerHandler.prototype._deduplicateSearchResults = function(results) {
  var searchableMarkers = this.searchableMarkers;
  var categories = this.categories;
  var standardLabelsByNameAndMap = Object.create(null);
  var resultIndexesByLocation = Object.create(null);
  var deduplicatedResults = [];

  function getMarker(result) {
    return result.item || result;
  }

  function getName(marker) {
    return (marker.name || marker.title || '').trim().toLowerCase();
  }

  function isCloseLabel(marker) {
    var category = categories[marker.categoryId || marker.markerCategoryId];
    return category && / - Close$/i.test(category.name);
  }

  searchableMarkers.forEach(function(marker) {
    if(
      (marker.categoryTypeId == 3 || marker.markerCategoryTypeId == 3) &&
      !isCloseLabel(marker)
    ) {
      standardLabelsByNameAndMap[JSON.stringify([marker.mapId, getName(marker)])] = true;
    }
  });

  function hasStandardLabel(marker) {
    return !!standardLabelsByNameAndMap[
      JSON.stringify([marker.mapId, getName(marker)])
    ];
  }

  results.forEach(function(result) {
    var marker = getMarker(result);
    var isLabel = marker.categoryTypeId == 3 || marker.markerCategoryTypeId == 3;
    if(isLabel && isCloseLabel(marker) && hasStandardLabel(marker)) return;

    var position = typeof marker.getLatLng === 'function' ? marker.getLatLng() : marker._latlng;
    var latitude = position ? position.lat : marker.y;
    var longitude = position ? position.lng : marker.x;
    var hasPosition = Number.isFinite(Number(latitude)) && Number.isFinite(Number(longitude));
    var locationKey = hasPosition
      ? [
          getName(marker),
          marker.mapId,
          Number(latitude).toFixed(3),
          Number(longitude).toFixed(3)
        ].join(':')
      : marker.id;
    var existingIndex = resultIndexesByLocation[locationKey];

    if(existingIndex === undefined) {
      resultIndexesByLocation[locationKey] = deduplicatedResults.length;
      deduplicatedResults.push(result);
      return;
    }

    var existingMarker = getMarker(deduplicatedResults[existingIndex]);
    var existingIsLabel = existingMarker.categoryTypeId == 3 || existingMarker.markerCategoryTypeId == 3;
    if(existingIsLabel && !isLabel) deduplicatedResults[existingIndex] = result;
  });

  return deduplicatedResults;
};

// Searching for an area (e.g. "zora") also lists every POI in each matching
// area, right after that area; POIs that matched by name too move under their
// area. Only areas whose name contains what was typed expand (fuzzy matches
// like "kak" -> Kokiri Forest don't), and whole maps and Region labels don't:
// their every marker would bury the results.
//
// An area is an OoT area (outlined; POIs inside it belong to it) or another
// game's place label (POIs belong to the nearest label of the same level).
SearchMarkerHandler.prototype._addMarkersInMatchedAreas = function(results, query) {
  if(typeof zMap === 'undefined' || !zMap.getMarkerAreaName) return results;
  var categories = this.categories || {};
  function getMarker(result) { return result.item || result; }
  // Search items are raw marker records; the map's own marker has the
  // position and category.
  function onMap(marker) { return (zMap.cachedMarkersById && zMap.cachedMarkersById[marker.id]) || marker; }
  function plain(text) { return String(text || '').toLowerCase().replace(/['\u2019]/g, '').replace(/\s+/g, ' ').trim(); }
  function isLabel(marker) { return marker.categoryTypeId == 3 || marker.markerCategoryTypeId == 3; }
  function areaKey(area) {
    if(area.mapDestination) return null;
    if(area.areaDestination) return 'area:' + area.mapId + ':' + area.name;
    if(isLabel(area) && zMap.nearestLabel) {
      var levelId = area.categoryId || area.markerCategoryId;
      var level = categories[levelId] || (zMap.categories || {})[levelId];
      if(level && /region/i.test(level.name || '')) return null;
      return 'label:' + area.id;
    }
    return null;
  }
  var typed = plain(query);
  var matched = Object.create(null), labelLevels = Object.create(null);
  results.forEach(function(result) {
    var area = getMarker(result), key = areaKey(area);
    if(!key || !typed || plain(area.name || area.title).indexOf(typed) === -1) return;
    matched[key] = true;
    if(key.indexOf('label:') === 0) labelLevels[area.categoryId || area.markerCategoryId] = true;
  });
  if(!Object.keys(matched).length) return results;
  function isPOI(marker) {
    return !marker.areaDestination && !isLabel(marker) && marker.dbVisible != 0;
  }
  // The matched areas a POI is in: its OoT area, and its nearest label at each
  // matched label level.
  var ownersCache = Object.create(null);
  function owners(marker) {
    if(ownersCache[marker.id]) return ownersCache[marker.id];
    var keys = [];
    var name = zMap.getMarkerAreaName(marker);
    if(name && matched['area:' + marker.mapId + ':' + name]) keys.push('area:' + marker.mapId + ':' + name);
    Object.keys(labelLevels).forEach(function(level) {
      var label = zMap.nearestLabel(onMap(marker), level);
      if(label && matched['label:' + label.id]) keys.push('label:' + label.id);
    });
    return ownersCache[marker.id] = keys;
  }
  var candidates = this.searchableMarkers.filter(function(marker) { return isPOI(marker) && owners(marker).length; });
  var shown = Object.create(null);
  var expanded = [];
  results.forEach(function(result) {
    var area = getMarker(result);
    if(isPOI(area) && owners(area).length) return; // listed under its area instead
    expanded.push(result);
    var key = areaKey(area);
    if(!key || !matched[key]) return;
    candidates.filter(function(marker) {
      return !shown[marker.id] && owners(marker).indexOf(key) !== -1;
    }).sort(function(a, b) {
      return (a.name || a.title || '').localeCompare(b.name || b.title || '');
    }).forEach(function(marker) {
      shown[marker.id] = true;
      var direct = results.find(function(r) { return getMarker(r) === marker; });
      expanded.push(direct || (result.item ? { item: marker, matches: [], score: 1 } : marker));
    });
  });
  // A POI that matched by name but whose areas never appeared keeps its place.
  results.forEach(function(result) {
    var marker = getMarker(result);
    if(isPOI(marker) && owners(marker).length && !shown[marker.id]) expanded.push(result);
  });
  return expanded;
};

// TODO: Make this a generic mixin, probably automatically included in all widgets, or even use a JS framework that does this already!!
SearchMarkerHandler.prototype.addHandler = function(eventName, handleFunction) {
  this.handlers[eventName].push(handleFunction);
};

if(typeof module !== 'undefined') {
  module.exports = {
    SearchMarkerHandler: SearchMarkerHandler
  };
}
