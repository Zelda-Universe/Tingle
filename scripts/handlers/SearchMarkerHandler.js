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

// TODO: Make this a generic mixin, probably automatically included in all widgets, or even use a JS framework that does this already!!
SearchMarkerHandler.prototype.addHandler = function(eventName, handleFunction) {
  this.handlers[eventName].push(handleFunction);
};

if(typeof module !== 'undefined') {
  module.exports = {
    SearchMarkerHandler: SearchMarkerHandler
  };
}
