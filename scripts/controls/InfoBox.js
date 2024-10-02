// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// InfoBox
// - options: [Object]
//   - title: [String] The text to optionally place in the header.

L.Control.InfoBox = L.Control.extend({
  _setDebugNames: function() {
    this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
    this._debugName = this.name;
  },

  initialize: function(opts) {
    this._setDebugNames();
    L.setOptions(this, opts);
  },

  onAdd: function(map) {
    var container = L.DomUtil.create(
      'span',
      "infobox " + (this.options.className || "")
    );
    if(this.options.title && !this.options.hideTitle) {
      var header = L.DomUtil.create('div', 'row header', container);
      header.append(this.options.title);

      L.DomUtil.create('div', 'infobox-separator', container);
    }

    return container;
  },

  createRow: function(titleText, container) {
    var row = L.DomUtil.create('div', 'row', container);

    var titleCell = L.DomUtil.create('span', 'title', row);
    titleCell.append(titleText);

    var valueCell = L.DomUtil.create('span', 'value', row);

    return row;
  }
});

L.Control.InfoBox.prototype._className = "L.Control.InfoBox";

L.control.infoBox = function (opts) {
  return new L.Control.InfoBox(opts);
};
