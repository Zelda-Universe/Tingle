// Center
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.Location.Center = L.Control.InfoBox.Location.extend({
  options: {
    title: "Center Coordinates",
    className: "center"
  },

  getContent: function(parent) {
    var latRow = this.createRow('Latitude: ', parent);
    this.latValueCell = $('.value', latRow);

    var longRow = this.createRow('Longitude: ', parent);
    this.lngValueCell = $('.value', longRow);
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
