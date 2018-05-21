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
  logoDiv.style.height = (opts.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator
  logoDiv.style.textAlign = 'left';//TODO: move to CSS
};
