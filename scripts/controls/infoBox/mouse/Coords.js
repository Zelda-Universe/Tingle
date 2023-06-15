// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Mouse
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.Coords.Move = L.Control.InfoBox.Coords.extend({
  options: {
    //title: "Mouse Coordinates",
    className: "mouse-coords"
  },

  getContent: function(parent) {
    var row = this.createRow('', parent);
    this.latValueCell = $('.value', row);
  },

  _updateCoordsInfo: function(mouse) {
      function pad(num, size) {
         var newNum = num;
         if (num < 0) {
            newNum = num *-1;
         }
         
         newNum = newNum.toString();
         newNum = ("000"+newNum).slice(-1 * size);
         if (num < 0) {
            newNum = '-' + newNum;
         }
         return newNum;
        
      }
      if (mouse != undefined) {
         //var mouse = this._map.getMouse();
         this.latValueCell.text(pad(mouse.lng.toFixed(this.options.precision), 4) + " | " + pad(mouse.lat.toFixed(this.options.precision), 4));
      } else {
         this.latValueCell.text(pad(map.getCenter().lng, 4) + " | " + pad(map.getCenter().lat, 4));
      }
  }
});

L.Control.InfoBox.Coords.Move.prototype._className = "L.Control.InfoBox.Coords.Move";

L.control.infoBox.coords.move = function (opts) {
	return new L.Control.InfoBox.Coords.Move(opts);
};
