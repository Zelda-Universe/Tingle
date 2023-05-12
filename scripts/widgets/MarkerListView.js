// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// MarkerListView
// - opts: [Object] Typical options object.
//   - markerEntryClick: [Function] The function to execute when a marker entry in the list is clicked.
// - Methods
//   - showMarkers(<query>, <marker...>)

function MarkerListView(opts) {
  ListView.call(this, opts);
  this._initSettings(opts);
};
MarkerListView.prototype = Object.create(ListView.prototype);
MarkerListView.prototype.constructor = MarkerListView;

MarkerListView.prototype = $.extend({}, ListView.prototype, {
  _initSettings: function(opts) {
    ListView.prototype._initSettings.call(this, opts);
    this.markerEntryClick = opts.markerEntryClick;
  },

  _initDOMElements: function(opts) {
    ListView.prototype._initDOMElements.call(this, opts);

    var header = this.entriesDomNode.find('.header');
    header.empty();
    header.html(
      'Found <span class="amount"></span> results ' +
      'for "<span class="query"></span>".'
    ); // TODO: Externalize string.  Probably just use `this.header` reference at that point and substitute parts into string instead of dealing with HTML at this small level.

    this.currentAmountDomNode = header.find('.amount');
    this.currentSearchQueryDomNode = header.find('.query');
  },

  showMarkers: function(query, markers) {
    this.clear();

    this.currentSearchQueryDomNode.text(query);

    this._addEntries(markers);
  },

  _addEntries: function(markers = []) {
    markers.forEach(function(marker) {
      this.addEntry(
        this._createEntry(
          { marker: marker, onClick: this.markerEntryClick }
        ).domNode
      );
    }, this);
  },

  _createEntry: function(opts) {
    return new MarkerListEntry(opts);
  }
});
