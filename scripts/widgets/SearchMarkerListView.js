function SearchMarkerListView() {
  MarkerListView.call(this);
};

SearchMarkerListView.prototype = Object.create(MarkerListView.prototype);
SearchMarkerListView.prototype.constructor = SearchMarkerListView;

SearchMarkerListView.prototype._createEntry = function(searchEntry) {
  return new SearchMarkerListEntry(searchEntry);
};
