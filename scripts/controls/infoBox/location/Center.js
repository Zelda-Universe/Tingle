// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Center
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.Location.Center = L.Control.InfoBox.Location.extend({
  _className: "L.Control.InfoBox.Location.Center",

  options: {
    title: "Center Coordinates",
    className: "center"
  },

  onAdd: function(map) {
    L.Control.InfoBox.Location.prototype.onAdd.call(this, map);

    var latRow = this._createRow('Latitude: ', this.contentNode);
    this.latValueCell = $('.value', latRow);

    var longRow = this._createRow('Longitude: ', this.contentNode);
    this.lngValueCell = $('.value', longRow);

    return this.domNode;
  },

  _updateCoordsInfo: function() {
    var center = this._map.getCenter();
    this.latValueCell.text(center.lat.toFixed(this.options.precision));
    this.lngValueCell.text(center.lng.toFixed(this.options.precision));
  }
});

L.control.infoBox.location.center = function(opts) {
	return new L.Control.InfoBox.Location.Center(opts);
};
