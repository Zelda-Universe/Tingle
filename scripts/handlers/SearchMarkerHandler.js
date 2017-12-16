function SearchMarkerHandler(opts) {
  this._initSettings(opts);
  // TODO: fuse init...
  this._setupUIInteraction();
};

SearchMarkerHandler.prototype._initSettings = function(opts) {
  this.markerSearchField = opts.markerSearchField;
  this.markerListView = opts.markerListView;
  this.markers = opts.markers;
  this.handlers = {
    markerListViewBuilt: []
  };
};
};

SearchMarkerHandler.prototype._setupUIInteraction = function() {
  this.markerSearchField.domNode.on('search', this._displayResults.bind(this));
};

  this.markerListView.showMarkers(this.markers.slice(0, 5)); // Debug set; remove later.
SearchMarkerHandler.prototype._displayResults = function(e, query) {
  this.handlers["markerListViewBuilt"].forEach(function(handler) {
    handler(this.markerListView);
  }, this);
};

// TODO: Make this a generic mixin, probably automatically included in all widgets, or even use a JS framework that does this already!!
SearchMarkerHandler.prototype.addHandler = function(eventName, handleFunction) {
  this.handlers[eventName].push(handleFunction);
};
