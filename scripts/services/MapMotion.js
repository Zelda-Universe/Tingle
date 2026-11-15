// The map's two animations, by name:
//  * "move": the site's quick pan and zoom. A marker opened from a link, Go
//    to Marker, a list, a search or a bookmark; a category's or area's page
//    fitting the map; Back putting the map where it was.
//  * "fly": a path's own flight, out and back in, slower, for a longer way.
//    The guide between steps (Start, Complete, Next) and a step's name
//    (PathEditor.js).
// Both reach any zoom (Leaflet would otherwise snap a change of more than
// four levels), and both go straight there with reduced motion.
ZMap.prototype.MAP_MOTION = {
  move: {duration: .25, easeLinearity: .2},
  // (Framing a stretch of the map flies a little longer than to a point.)
  fly: {duration: .6, boundsDuration: .8}
};

// motion: 'move', 'fly', or none (straight there); true is 'move'.
ZMap.prototype._mapMotion = function(motion) {
  if(!motion) return null;
  var reduced = typeof window !== 'undefined' && window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if(reduced) return null;
  return motion === 'fly' ? 'fly' : 'move';
};

// Runs fn with Leaflet's four-level limit on animated zooms lifted.
ZMap.prototype._withAnyZoomAnimated = function(fn) {
  var map = this.map, threshold = map.options.zoomAnimationThreshold;
  map.options.zoomAnimationThreshold = Infinity;
  try { return fn(); }
  finally { map.options.zoomAnimationThreshold = threshold; }
};

// The map to center at zoom.
ZMap.prototype._animateView = function(center, zoom, motion) {
  var map = this.map, kind = this._mapMotion(motion), spec = this.MAP_MOTION;
  if(kind === 'fly') return map.flyTo(center, zoom, {duration: spec.fly.duration});
  if(kind === 'move') return this._withAnyZoomAnimated(function() {
    map.setView(center, zoom, {animate: true, duration: spec.move.duration, easeLinearity: spec.move.easeLinearity});
  });
  map.setView(center, zoom, {animate: false});
};

// The map fitted to bounds (options: Leaflet's fitBounds padding, maxZoom).
ZMap.prototype._animateToBounds = function(bounds, options, motion) {
  var map = this.map, kind = this._mapMotion(motion), spec = this.MAP_MOTION;
  options = Object.assign({}, options);
  if(kind === 'fly') return map.flyToBounds(bounds, Object.assign(options, {duration: spec.fly.boundsDuration}));
  if(kind === 'move') return this._withAnyZoomAnimated(function() {
    map.fitBounds(bounds, Object.assign(options, {animate: true, duration: spec.move.duration, easeLinearity: spec.move.easeLinearity}));
  });
  map.fitBounds(bounds, Object.assign(options, {animate: false}));
};
