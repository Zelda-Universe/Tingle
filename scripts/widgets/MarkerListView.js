function MarkerListView() {
  this._initDOMElements();
};

MarkerListView.prototype._initDOMElements = function() {
  this.domNode = $(' \
    <div class="marker-list"> \
    </div> \
  ');

  this.markerListEntryTemplate = ' \
    <div class="marker-list-entry"> \
    ... \
    </div> \
  '; // TODO: Add property placeholders.  Check Trello for design.  Maybe have the icon left cenetered most of the area, fixed height for default desktop mode, then maybe 2 or 2 others for other devices.  Another item....  Then title and desc. text TR and BR.  But mostly look at Trello!
};

MarkerListView.prototype.showMarkers = function(markers) {
  markers.forEach(function(marker) {
    $(this.markerListEntryTemplate).appendTo(this.domNode); // TODO: Don't forget property replacing like those wonders templating libraries ;).
  });
};
