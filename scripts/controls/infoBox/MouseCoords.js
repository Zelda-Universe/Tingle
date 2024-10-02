// Mouse
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.MouseCoords = L.Control.InfoBox.extend({
  options: {
    className : 'mouse mouse-coords',
    mode      : 'normal',
    title     : 'Mouse Coordinates'
  },

  initialize: function(opts) {
    L.Control.InfoBox.prototype.initialize.call(this, opts);

    this._initSettings();
  },

  _initSettings: function() {
    if(this.options.mode == 'mini') {
      this.options.title = '';
    }
    this.options.precision = getSetOrDefaultValue(this.options.precision, 0);
  },

  onAdd: function(map) {
    var container = L.Control.InfoBox.prototype.onAdd.call(this, map);

    if(this.options.mode == 'normal') {
      var latRow  = this.createRow('Latitude: ' , container);
      this.latValueCell = $('.value', latRow  );

      var longRow = this.createRow('Longitude: ', container);
      this.lngValueCell = $('.value', longRow );
    } else if(this.options.mode == 'mini') {
      var row = this.createRow('', container);
      this.latValueCell = $('.value', row);
    }

    this._updateCoordsInfo({ lat: 0, lng: 0 })

    this._addMapHandler(map);

    return container;
  },

  _addMapHandler: function(map) {
    if(this._updateCoordsInfo) {
      L.DomEvent.on(map, 'mousemove', function(event) {
        this._updateCoordsInfo(event.latlng);
      }.bind(this));
    }
  },

  _updateCoordsInfo: function(coords) {
    if(this.options.mode == 'normal') {
      if (coords) {
        this.latValueCell.text(coords.lat.toFixed(this.options.precision));
        this.lngValueCell.text(coords.lng.toFixed(this.options.precision));
      }
    } else if(this.options.mode == 'mini') {
      function pad(num, size) {
        var newNum = num;

        if (num < 0) {
          newNum = num * -1;
        }

        newNum = newNum.toString();
        newNum = ("000"+newNum).slice(-1 * size);
        if (num < 0) {
          newNum = '-' + newNum;
        }
        return newNum;
      }

      if (coords && $.isNumeric(coords.lng) && $.isNumeric(coords.lat)) {
        this.latValueCell.text(pad(coords.lng.toFixed(this.options.precision), 4) + " | " + pad(coords.lat.toFixed(this.options.precision), 4));
      }
    }
  }
});

L.Control.InfoBox.MouseCoords.prototype._className = "L.Control.InfoBox.MouseCoords";

L.control.infoBox.mouseCoords = function (opts) {
	return new L.Control.InfoBox.MouseCoords(opts);
};
