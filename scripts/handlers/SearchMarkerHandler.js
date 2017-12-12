function SearchMarkerHandler(opts) {
  this._initSettings(opts);
  // TODO: fuse init...
  this._setupInteraction();
};

SearchMarkerHandler.prototype._initSettings = function(opts) {
  this.markerSearchField = opts.markerSearchField;
  this.markerListView = opts.markerListView;
  this.markers = opts.markers;
};

SearchMarkerHandler.prototype._setupInteraction = function() {
  this.markerSearchField.domNode.on('search', this._displayResults.bind(this));
};

SearchMarkerHandler.prototype._displayResults = function(query) {
  // TODO: fuse-filter results based on our markerSearchField's current value: `query` parameter now.
  this.markerListView.showMarkers(this.markers.slice(0, 5)); // Debug set; remove later.
  mapControl.setContent(this.markerListView.domNode.html());
};
