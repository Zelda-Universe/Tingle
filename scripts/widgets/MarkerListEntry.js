// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// MarkerListEntry
// - opts: [Object] Typical options object.
//   - onClick: [Function] The function to call when clicked.  Passes in the owned marker data object this entry represents.

function MarkerListEntry(marker, opts) {
  this._initSettings(marker, opts);
  this._initDOMElements(marker);
  this._setupUIInteraction(opts);
};

MarkerListEntry.prototype._initSettings = function(marker, opts) {
  this.marker = marker;
  this.categories = opts.categories;
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

  this.categoryIcon = new CategoryIcon(
    this.categories[(marker.categoryId || marker.markerCategoryId)]
  );
  this.iconNode = this.domNode.find('.icon');
  this.iconNode.append(this.categoryIcon.domNode);
};

MarkerListEntry.prototype._setupUIInteraction = function(opts) {
  this.domNode.on('click', opts.onClick.bind(this, this.marker));
};
