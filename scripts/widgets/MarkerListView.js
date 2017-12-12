function MarkerListView() {
  this._initDOMElements();
};

MarkerListView.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<ul class="marker-list">' +
    '</ul>'
  );

  this.separatorDomNodeTemplate = '<div class="leaflet-control-layers-separator"></div>';
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
      this.domNode.append(new MarkerListEntry({ marker: marker }).domNode);
      this.domNode.append($(this.separatorDomNodeTemplate));
    }, this);
  }
};
