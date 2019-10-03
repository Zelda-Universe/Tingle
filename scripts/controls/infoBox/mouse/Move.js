// Mouse
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.Mouse.Move = L.Control.InfoBox.Mouse.extend({
  options: {
    title: "Mouse Coordinates",
    className: "mouse"
  },

  getContent: function(parent) {
    var latRow = this.createRow('Latitude: ', parent);
    this.latValueCell = $('.value', latRow);

    var longRow = this.createRow('Longitude: ', parent);
    this.lngValueCell = $('.value', longRow);
  },

  _updateCoordsInfo: function(mouse) {
      if (mouse != undefined) {
         //var mouse = this._map.getMouse();
         this.latValueCell.text(mouse.lat.toFixed(this.options.precision));
         this.lngValueCell.text(mouse.lng.toFixed(this.options.precision));
      }
  }
});

L.Control.InfoBox.Mouse.Move.prototype._className = "L.Control.InfoBox.Mouse.Move";

L.control.infoBox.mouse.move = function (opts) {
	return new L.Control.InfoBox.Mouse.Move(opts);
};
