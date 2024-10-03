// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// Location
// - opts: [Object]
//   - precision: [Number]
//
// Mostly just an abstract class,
// which is why the additional class name
// is added again manually.

L.Control.InfoBox.Location = L.Control.InfoBox.extend({
  options: {
    title: "Coordinates"
  },

  initialize: function(opts) {
    L.Control.InfoBox.prototype.initialize.call(this, opts);

    this._initSettings();
  },

  _initSettings: function() {
    this.options.precision = getSetOrDefaultValue(this.options.precision, 0);
  },

  onAdd: function(map) {
    var container = L.Control.InfoBox.prototype.onAdd.call(this, map);

    $(container).addClass("location");

    this._addMapHandler(map);

    return container;
  },

  _buildActionGroup: function(container) {
    var actionGroup = L.DomUtil.create('div', 'action-group');

    var copyLink = new CopyLink({ content: this.generateLink.bind(this) });
    $(actionGroup).append(copyLink.domNode);

    var link = new Link({ content: this.generateLink.bind(this) });
    $(actionGroup).append(link.domNode);

    $(container).append(actionGroup);
  },

  _addMapHandler: function(map) {
    L.DomEvent.on(map, 'move', function(event) {
      this._updateCoordsInfo(event.target);
    }.bind(this));
  }
});

L.Control.InfoBox.Location.prototype._className = "L.Control.InfoBox.Location";

L.control.infoBox.location = function (opts) {
  return new L.Control.InfoBox.Location(opts);
};
