// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// InfoBox
// - options: [Object]
//   - title: [String] The text to optionally place in the header.

L.Control.InfoBox = L.Control.ZControl.extend({
  _className: "L.Control.InfoBox",

  onAdd: function() {
    L.Control.ZControl.prototype.onAdd.call(this);
    $(this.domNode).addClass("infobox");

    if(this.options.title) {
      this.headerDomNode = L.DomUtil.create('div', 'row header vertical-divider', this.domNode);
      $(this.headerDomNode).append($('<p class="title">' + this.options.title + '</p>'));
    }

    L.DomUtil.create('div', 'infobox-separator', this.domNode);

    this.contentNode = L.DomUtil.create('div', 'content', this.domNode);

    return this.domNode;
  },

	// onRemove: function() {
	// 	locationInfo.destroy();
	// };
});

L.control.infoBox = function(opts) {
  return new L.Control.InfoBox(opts);
};
