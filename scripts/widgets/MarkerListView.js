function MarkerListView() {
  this._initDOMElements();
};

MarkerListView.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<div class="marker-list">' +
    '</div>'
  );
};

MarkerListView.prototype.generateMarkerEntryView = function(marker) {
  return $('' +
    '<div class="marker-list-entry">' +
      '<span class="title">' +
        marker.title +
      '</span>' +
      '<span class="description">' +
        marker.description +
      '</span>' +
    '</div>'
  );
};

MarkerListView.prototype.showMarkers = function(markers) {
  this.domNode.empty();

  if(markers.length == 0) {
    $('' +
      '<div class="no-results">' +
        'No results found.' +
      '</div>'
    ).appendTo(this.domNode);
  } else {
    markers.forEach(function(marker) {
      this.generateMarkerEntryView(marker).appendTo(this.domNode); // TODO: Don't forget properly replacing like those wonders templating libraries ;).
    }, this);
  }
};
