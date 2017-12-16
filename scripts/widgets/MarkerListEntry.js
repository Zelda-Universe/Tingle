function MarkerListEntry(marker, opts) {
  this._initSettings(marker, opts);
  this._initDOMElements(marker);
};

MarkerListEntry.prototype._initSettings = function(marker, opts) {
  this.marker = marker;
};

MarkerListEntry.prototype._initDOMElements = function(marker) {
  this.domNode = $('' +
    '<li class="marker-list-entry">' +
      '<span class="icon">' +
      '</span>' +
      '<span class="details">' +
        '<div class="name">' +
          (marker.name || marker.title) +
        '</div>' +
        '<div class="description">' +
          marker.description +
        '</div>' +
      '</span>' +
    '</li>'
  );

  this.categoryIcon = new CategoryIcon(categories[(marker.categoryId || marker.markerCategoryId)]);
  this.iconNode = this.domNode.find('.icon');
  this.iconNode.append(this.categoryIcon.domNode);
};
