function MarkerListEntry(opts) {
  this._initDOMElements(opts);
};

MarkerListEntry.prototype._initDOMElements = function(opts) {
  this.domNode = $('' +
    '<li class="marker-list-entry">' +
      '<span class="icon">' +
      '</span>' +
      '<span class="details">' +
        '<div class="title">' +
          opts.marker.title +
        '</div>' +
        '<div class="description">' +
          opts.marker.description +
        '</div>' +
      '</span>' +
    '</li>'
  );

  this.categoryIcon = new CategoryIcon(categories[opts.marker.categoryId]);
  this.domNode.find('.icon').append(this.categoryIcon.domNode);
};
