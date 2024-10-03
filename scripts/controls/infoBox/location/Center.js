// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// Center
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.Location.Center = L.Control.InfoBox.Location.extend({
  options: {
    title: "Center Coordinates",
    className: "center"
  },

  onAdd: function(map) {
    var container = L.Control.InfoBox.Location.prototype.onAdd.call(this, map);

    var latRow = this.createRow('Latitude: ', container);
    this.latValueCell = $('.value', latRow);

    var longRow = this.createRow('Longitude: ', container);
    this.lngValueCell = $('.value', longRow);

    this._updateCoordsInfo();

    return container;
  },

  _updateCoordsInfo: function() {
    var center = this._map.getCenter();
    this.latValueCell.text(center.lat.toFixed(this.options.precision));
    this.lngValueCell.text(center.lng.toFixed(this.options.precision));
  }
});

L.Control.InfoBox.Location.Center.prototype._className = "L.Control.InfoBox.Location.Center";

L.control.infoBox.location.center = function (opts) {
	return new L.Control.InfoBox.Location.Center(opts);
};
