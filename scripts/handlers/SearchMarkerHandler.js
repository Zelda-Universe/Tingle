// SearchMarkerHandler
// - opts: [Object]
//   - markerSearchField: [Object]
//   - markerListView: [Object]
//   - showSearchStats: [Boolean]

function SearchMarkerHandler(opts) {
  this._initSettings(opts);
  this._initComponents();
  this._setupUIInteraction();
};

SearchMarkerHandler.prototype._initSettings = function(opts) {
  this.markerSearchField = opts.markerSearchField;
  this.markerListView = opts.markerListView;

  this.showSearchStats = getSetOrDefaultValue(opts.showSearchStats, false);

  this.handlers = {
    markerListViewBuilt: []
  };
};

SearchMarkerHandler.prototype._initComponents = function() {
  if(!this.markerSearchField) {
    this.markerSearchField = new SearchMarkerHandler();
  }

  if(!this.markerListView) {
    if(this.showSearchStats) {
      this.markerListView = new SearchMarkerListView();
    } else {
      this.markerListView = new MarkerListView();
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
