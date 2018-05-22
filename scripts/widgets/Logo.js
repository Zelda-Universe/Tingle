// Logo
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - headerHeight: [Number]

function Logo(opts) {
  this._initDOMElements(opts);
};

Logo.prototype._initDOMElements = function(opts) {
  var logoDiv = L.DomUtil.create('img', 'img-responsive center-block', opts.parent);
  logoDiv.src  = 'images/zmaps_white.png';
};
