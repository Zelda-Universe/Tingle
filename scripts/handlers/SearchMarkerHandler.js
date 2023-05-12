// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearchMarkerHandler - Connects the various related widgets to perform search actions, cohesively-containing logic, and provides configuration.
// - opts: [Object] Typical options object.
//   - markerSearchField: [Object] - The search field to use.  Creates a default instance if one is not provided.
//   - markerListView: [Object] - The list view to use.  Creates one if not provided.  Applies configuration whether to create a plain or search stats list view.
//   - showSearchStats: [Boolean] - Determines which list view to create, if one is not provided: a plain or search stats version.
//   - markerSearchClick: [Function] - The function to execute when a marker search entry in the list is clicked.
// - Methods:
//   - setMarkers(<marker...>):
// - Events:
//   - resultsReceived: ([<result>...])
//   - markerListViewBuilt: (MarkerListView)
//   - ready: ()
// - Config:
//   - initialSearchQuery: [String] The query to run upon not only self-initialization, but also after receiving the marker data to search.

function SearchMarkerHandler(opts) {
  this._setDebugNames();
  this._initialize();
  this._initHandlers();
  this._initSettings(opts);
  this._initComponents(opts);
  this._setupUIInteraction();
};
$.extend(SearchMarkerHandler.prototype, DebugMixin.prototype);
$.extend(SearchMarkerHandler.prototype, EventHandlersMixin.prototype);

SearchMarkerHandler.prototype._initialize = function() {
  this.eventNames = [
    'resultsReceived',
    'markerListViewBuilt'
  ];
},

SearchMarkerHandler.prototype._initSettings = function(opts) {
  this.markerSearchField = opts.markerSearchField;
  this.markerListView = opts.markerListView;

  this.showSearchStats = getSetOrDefaultValue(opts.showSearchStats, false);

  opts["markerEntryClick"] = Object.pop(opts, "markerSearchClick");
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
  this._checkForInitialSearchQuery();
};

SearchMarkerHandler.prototype._checkForInitialSearchQuery = function() {
  if(!this.initialSearchQuery) {
    this.initialSearchQuery = ZConfig.getConfig("initialSearchQuery");
    if(this.initialSearchQuery) {
      $(this.markerSearchField.searchInput)
        .prop("value", this.initialSearchQuery)
        .trigger("input")
      ;
    }
  }
}

SearchMarkerHandler.prototype._setupUIInteraction = function() {
  this.markerSearchField.addEventHandler('searchExecuted', this.search.bind(this));
};

SearchMarkerHandler.prototype.search = function(query) {
  var results = this.searcher.search(query);
  this._displayResults(query, results);
};

SearchMarkerHandler.prototype._displayResults = function(query, results) {
  if (!this.showSearchStats) results = results.map(function(entry) { return entry.item; });
  this.markerListView.showMarkers(query, results);
  this.triggerEventHandlers("resultsReceived", results);
  this.triggerEventHandlers("markerListViewBuilt", this.markerListView); // Move this into `markerListView`?  IoC by passing in the search system to fire the results event?
};
