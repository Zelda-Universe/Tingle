function MarkerListView() {
  this._initDOMElements();
};

MarkerListView.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<div class="marker-list-view">' +
      '<div class="no-results">' +
        'No results found for "<span class="query"></span>".' +
      '</div>' +
      '<div class="results">' +
        '<div class="header">' +
          'Found <span class="amount"></span> results for "<span class="query"></span>".' +
        '</div>' +
        '<ul class="marker-list">' +
        '</ul>' +
      '</div>' +
    '</div>'
  );

  this.noResultsDomNode = this.domNode.find('.no-results');
  this.resultsDomNode = this.domNode.find('.results');
  this.markerListDomNode = this.resultsDomNode.find('.marker-list');
  this.currentSearchAmountDomNode = this.domNode.find('.amount');
  this.currentSearchQueryDomNodes = this.domNode.find('.query');

  this.separatorDomNodeTemplate = '' +
    '<div class="leaflet-control-layers-separator">' +
    '</div>' +
  '';

  this.clear();
};

MarkerListView.prototype.clear = function() {
  this.noResultsDomNode.hide();
  this.resultsDomNode.hide();
  this.markerListDomNode.empty();
};

MarkerListView.prototype.showMarkers = function(query, entries) {
  this.clear();

  this.currentSearchQueryDomNodes.text(query);

  if(entries.length == 0) {
    this.noResultsDomNode.show();
  } else {
    this.currentSearchAmountDomNode.text(entries.length);
    this._addEntries(entries);
    this.resultsDomNode.show();
  }
};

MarkerListView.prototype._addEntries = function(entries) {
  entries.forEach(function(entry) {
    this.markerListDomNode.append(this._createEntry(entry).domNode);
    this.markerListDomNode.append($(this.separatorDomNodeTemplate));
  }, this);
};

MarkerListView.prototype._createEntry = function(entry) {
  return new MarkerListEntry({ marker: ((entry.item) ? entry.item : entry)});
};
