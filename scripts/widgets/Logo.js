// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// Logo
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - headerHeight: [Number]

// What an embed shows, on Zelda Maps itself, in a new tab (the logo, and
// the header's Open on Zelda Maps: ZLayers.js).
function openOnZeldaMaps() {
  // (The map's own page, not embed.php, without the embed's settings.)
  var url = new URL(window.location.href);
  url.pathname = url.pathname.replace(/embed\.php$/, '');
  ['hideOthers', 'showMapControl', 'hidePin'].forEach(function(name) { url.searchParams.delete(name); });
  window.open(url.toString(), '_blank', 'noopener');
}

function Logo(opts) {
  this._initDOMElements(opts);
};

Logo.prototype._initDOMElements = function(opts) {
  var logoDiv = L.DomUtil.create('img', 'logo', opts.parent);
  logoDiv.src  = 'images/zmaps_white.png';
  logoDiv.draggable = false;
  // In an embed, the logo opens what's shown on Zelda Maps itself, in a new
  // tab: the one way out of it.
  if(document.documentElement.classList.contains('zm-framed')) {
    logoDiv.classList.add('logo-framed-link');
    logoDiv.setAttribute('role', 'link');
    logoDiv.setAttribute('tabindex', '0');
    logoDiv.setAttribute('aria-label', 'Open in Zelda Maps');
    logoDiv.title = 'Open in Zelda Maps';
    var open = function(e) {
      if(e.type === 'keydown' && e.key !== 'Enter') return;
      L.DomEvent.stop(e);
      openOnZeldaMaps();
    };
    L.DomEvent.on(logoDiv, 'click', open);
    L.DomEvent.on(logoDiv, 'keydown', open);
  }
};
