// MIT Licensed
// Copyright (c) 2023 Pysis(868)
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

  this.showSearchStats = getSetOrDefaultValue(opts.showSearchStats, false);

  opts["markerEntryClick"] = Object.pop(opts, "markerSearchClick");

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
  this.searcher = new SearcherFuse({ targetSearchMaterial: markers });
};

SearchMarkerHandler.prototype._setupUIInteraction = function() {
  this.markerSearchField.domNode.on('search', this._displayResults.bind(this));
};

SearchMarkerHandler.prototype._displayResults = function(e, query) {
  var results = this.searcher.search(query);
  if (!this.showSearchStats) results = results.map(function(entry) { return entry.item; });
  this.markerListView.showMarkers(query, results);
  this.handlers["markerListViewBuilt"].forEach(function(handler) {
    handler(this.markerListView);
  }, this);
};

// TODO: Make this a generic mixin, probably automatically included in all widgets, or even use a JS framework that does this already!!
SearchMarkerHandler.prototype.addHandler = function(eventName, handleFunction) {
  this.handlers[eventName].push(handleFunction);
};
