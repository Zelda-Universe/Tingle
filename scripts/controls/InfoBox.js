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

  onAdd: function() {
    var parent = L.DomUtil.create(
      'span',
      "infobox " + (this.options.className || "")
    );
    if(this.options.title) {
      var header = L.DomUtil.create('div', 'row header', parent);
      header.append(this.options.title);
    }

    L.DomUtil.create('div', 'infobox-separator', parent);

    this.getContent(parent);

    return parent;
  },

  getContent: function() {}

	// onRemove: function() {
	// 	locationInfo.destroy();
	// };
});

L.Control.InfoBox.prototype._className = "L.Control.InfoBox";

L.control.infoBox = function (opts) {
  return new L.Control.InfoBox(opts);
};
