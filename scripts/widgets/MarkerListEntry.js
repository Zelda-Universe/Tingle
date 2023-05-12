// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// MarkerListEntry
// - opts: [Object] Typical options object.
//   - marker: [Object] The marker with information to display.

function MarkerListEntry(opts) {
  ListEntry.call(this, $.extend(opts, {
    title: (opts.marker.name || opts.marker.title),
    description:opts.marker.description
  }));
};
MarkerListEntry.prototype = Object.create(ListEntry.prototype);
MarkerListEntry.prototype.constructor = MarkerListEntry;

MarkerListEntry.prototype._makeIcon = function(opts) {
  return new CategoryIcon(categories[(opts.marker.categoryId || opts.marker.markerCategoryId)]);
};
