// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
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
    var container = L.Control.InfoBox.prototype.onAdd.call(this);
    $(container).addClass("location");

    this._updateCoordsInfo(map);
    this._addMapHandler(map);

    return container;
  },

	// onRemove: function() {
	// 	locationInfo.destroy();
	// };

  _buildActionGroup: function(parent) {
    var actionGroup = L.DomUtil.create('div', 'action-group');

    var copyLink = new CopyLink({ content: this.generateLink.bind(this) });
    $(actionGroup).append(copyLink.domNode);

    var link = new Link({ content: this.generateLink.bind(this) });
    $(actionGroup).append(link.domNode);

    $(parent).append(actionGroup);
  },

  createRow: function(titleText, parent) {
    var row = L.DomUtil.create('div', 'row', parent);

    var titleCell = L.DomUtil.create('span', 'title', row);
    titleCell.append(titleText);

    var valueCell = L.DomUtil.create('span', 'value', row);

    return row;
  },

  _addMapHandler: function(map) {
    L.DomEvent.on(map, 'move', function(event) {
      this._updateCoordsInfo(event.target);
    }.bind(this));
  },

  _updateCoordsInfo: function() {
    console.error(this._debugName + ": Superclass method `" + this.prototype._className + "._updateCoordsInfo` not overridden.");
  }
});

L.Control.InfoBox.Location.prototype._className = "L.Control.InfoBox.Location";

L.control.infoBox.location = function (opts) {
  return new L.Control.InfoBox.Location(opts);
};
