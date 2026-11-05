// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearchArea
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - markerListViewBuiltHandler: [Function] The function to run when the marker list view has finished building.

function SearchArea(opts) {
  opts = opts || {};

  this._initState(opts);
};

SearchArea.prototype._initState = function(opts) {
  this.resultsFocusedHandler = opts.resultsFocusedHandler;
  this.resultsClearedHandler = opts.resultsClearedHandler;
  this.markerSearchField = new MarkerSearchField({
    incrementalSearch: true,
    showProgressBar: false,
    updateProgressTotalStepsAmount: 15,
    name: opts.name
  });
  $(this.markerSearchField.domNode).appendTo(opts.parent);

  this.searchMarkerHandler = new SearchMarkerHandler({
    markerSearchField: this.markerSearchField,
    showSearchStats: true,
    categories: opts.categories,
    markerSearchClick: opts.markerSearchClick || function(marker, e) {
      if(marker.areaDestination || marker.markerCategoryTypeId == 3 || marker.categoryTypeId == 3) {
        zMap.navigateToArea(marker); return;
      }
      zMap.goTo({ marker: marker.id }, true);
    }
  });
  this.searchMarkerHandler.addHandler(
    "markerListViewBuilt",
    opts.markerListViewBuiltHandler
  );

  zMap.addHandler("markersAdded", function(markers) {
    this.searchMarkerHandler.setMarkers(markers.concat(zMap.getAreaSearchEntries()));
  }.bind(this));

  L.DomEvent.disableClickPropagation(opts.parent);
  L.DomEvent.on(opts.parent, 'click', L.DomEvent.stopPropagation);

  this.markerSearchField.searchInput.on('focus', function() {
    if(this.resultsFocusedHandler) this.resultsFocusedHandler();
  }.bind(this));
  this.markerSearchField.searchInput.on('input', function() {
    if(
      this.markerSearchField._getQuery().length < this.markerSearchField.minMatchCharLength &&
      this.resultsClearedHandler
    ) {
      this.resultsClearedHandler();
    }
  }.bind(this));
  this.markerSearchField.clearSearchButton.on('click', function() {
    if(this.resultsClearedHandler) this.resultsClearedHandler();
  }.bind(this));
  this.markerSearchField.searchInput.on('keydown', function(e) {
    if(e.key === 'Escape' && this.resultsClearedHandler) {
      this.resultsClearedHandler();
    }
  }.bind(this));
};

SearchArea.prototype.focus = function() {
  this.markerSearchField.focus();
};
