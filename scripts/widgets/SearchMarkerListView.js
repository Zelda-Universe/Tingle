// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

function SearchMarkerListView(opts) {
  MarkerListView.call(this, opts);
};

SearchMarkerListView.prototype = Object.create(MarkerListView.prototype);
SearchMarkerListView.prototype.constructor = SearchMarkerListView;

SearchMarkerListView.prototype._createEntry = function(searchEntry, opts) {
  return new SearchMarkerListEntry(searchEntry, opts);
};
