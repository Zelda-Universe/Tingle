// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

function SearchMarkerListView(opts) {
  MarkerListView.call(this, opts);
};

SearchMarkerListView.prototype = Object.create(MarkerListView.prototype);
SearchMarkerListView.prototype.constructor = SearchMarkerListView;

SearchMarkerListView.prototype._createEntry = function(opts) {
  return new SearchMarkerListEntry(opts);
};
