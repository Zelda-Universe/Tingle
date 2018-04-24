// Header
// - options: [Object]
//   - mapControl: [Object] The drawer menu that will render the list of searched markers.

L.Control.ZMobileHeaderBar = L.Control.extend({
  options: {
    position: 'topleft'
  },

  onAdd: function() {
    var parentDiv = L.DomUtil.create('div', 'header-bar mobile-header-bar');

    var headerBar = new HeaderBar({
			parent: parentDiv,
			mapControl: this.options.mapControl,
			shrinkButton: false
		});

    return parentDiv;
  },

	// onRemove: function() {
	// 	headerBar.destroy();
	// };
});

L.control.zmobileheaderbar = function (options) {
  return new L.Control.ZMobileHeaderBar(options);
};
