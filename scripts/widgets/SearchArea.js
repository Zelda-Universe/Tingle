// MIT Licensed
// Copyright (c) 2023 Pysis(868)
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
  this.markerSearchField = new MarkerSearchField({
    incrementalSearch: true,
    updateProgressTotalStepsAmount: 15
  });
  $(this.markerSearchField.domNode).appendTo(opts.parent);

  var searchMarkerHandler = new SearchMarkerHandler({
    markerSearchField: this.markerSearchField,
    showSearchStats: true,
    markerSearchClick: function(marker, e) {
      zMap.goTo({ marker: marker.id });
    }
  });
  searchMarkerHandler.addHandler("markerListViewBuilt", opts.markerListViewBuiltHandler);

  zMap.addHandler("markersAdded", function(markers) {
    searchMarkerHandler.setMarkers(markers);
  });

  L.DomEvent.disableClickPropagation(opts.parent);
  L.DomEvent.on(opts.parent, 'click', L.DomEvent.stopPropagation);
};

SearchArea.prototype.focus = function() {
  this.markerSearchField.focus();
};
