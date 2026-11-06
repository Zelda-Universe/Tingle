// Adds desktop trackpad pan and pinch gestures without replacing Leaflet's
// mouse, keyboard, drag, or touchscreen handlers.

function looksLikeTrackpadPan(event) {
  if(
       event.ctrlKey
    || event.metaKey
    || event.altKey
    || event.shiftKey
    || event.deltaMode !== 0
  ) {
    return false;
  }

  var deltaX = Math.abs(event.deltaX);
  var deltaY = Math.abs(event.deltaY);

  return (
       deltaX > 0
    || deltaY < 50
    || event.deltaY % 1 !== 0
  );
};

function looksLikeTrackpadPinch(event) {
  return (
       event.ctrlKey
    && event.deltaMode === 0
    && (
         Math.abs(event.deltaY) < 50
      || event.deltaY % 1 !== 0
    )
  );
};

function isInteractiveUiEvent(event, container) {
  var target = event.target;
  if(!target || target === container || typeof target.closest !== 'function') {
    return false;
  }

  // Not .leaflet-tooltip: place names are tooltips spread over the map, and
  // a swipe passing over one must still pan it, not zoom.
  return target.closest(
    '.leaflet-control, .leaflet-popup, '
    + '.mobile-search-results-panel, button, input, select, textarea, a, '
    + '[contenteditable="true"]'
  ) !== null;
};

function TrackpadGestureHandler(map) {
  this.map = map;
  this.container = map.getContainer();
  this.trackpadPanUntil = 0;
  this.panX = 0;
  this.panY = 0;
  this.panFrame = null;
  this.pinchEndTimer = null;
  this.pinchPoint = null;
  this.pinchTargetZoom = null;
  this.pinchActive = false;
  this.gestureStartZoom = null;
  this.gesturePoint = null;

  this.onWheel = this.onWheel.bind(this);
  this.onGestureStart = this.onGestureStart.bind(this);
  this.onGestureChange = this.onGestureChange.bind(this);
  this.onGestureEnd = this.onGestureEnd.bind(this);
  this.destroy = this.destroy.bind(this);

  this.container.addEventListener('wheel', this.onWheel, {
    capture: true,
    passive: false
  });

  // Safari exposes gesture events on iOS too. Capturing those there competes
  // with Leaflet's touchscreen pinch/tap state; this override is for desktop
  // trackpads only, not touchscreens (including desktop-layout iPads).
  if('ongesturestart' in window && !(navigator.maxTouchPoints > 0)) {
    this.container.addEventListener('gesturestart', this.onGestureStart, {
      capture: true,
      passive: false
    });
    this.container.addEventListener('gesturechange', this.onGestureChange, {
      capture: true,
      passive: false
    });
    this.container.addEventListener('gestureend', this.onGestureEnd, {
      capture: true,
      passive: false
    });
  }

  map.on('unload', this.destroy);
};

TrackpadGestureHandler.prototype.stopEvent = function(event) {
  event.preventDefault();
  event.stopPropagation();
  event.stopImmediatePropagation();
};

TrackpadGestureHandler.prototype.getEventPoint = function(event) {
  if(event.clientX === undefined || event.clientY === undefined) {
    return this.map.getSize().divideBy(2);
  }

  return this.map.mouseEventToContainerPoint(event);
};

TrackpadGestureHandler.prototype.limitZoom = function(zoom) {
  return Math.max(
    this.map.getMinZoom(),
    Math.min(this.map.getMaxZoom(), zoom)
  );
};

TrackpadGestureHandler.prototype.setSmoothZoomAround = function(point, zoom) {
  zoom = this.limitZoom(zoom);

  if(!this.pinchActive) {
    this.map._stop();
    this.map._moveStart(true, false);
    this.pinchActive = true;
  }

  var viewHalf = this.map.getSize().divideBy(2);
  var scale = this.map.getZoomScale(zoom);
  var centerOffset = point.subtract(viewHalf).multiplyBy(1 - 1 / scale);
  var center = this.map.containerPointToLatLng(viewHalf.add(centerOffset));

  // Mark this as an in-progress pinch so GridLayer retains and transforms the
  // loaded tiles instead of pruning them before the next level is available.
  this.map._move(center, zoom, {pinch: true, round: false});
};

TrackpadGestureHandler.prototype.finishPinch = function() {
  if(this.pinchActive) {
    var zoomSnap = this.map.options.zoomSnap;
    var center = this.map.getCenter();
    var zoom = this.map.getZoom();

    this.map.options.zoomSnap = 0;
    if(this.map.options.zoomAnimation) {
      // This final no-prune update starts loading the nearest tile level while
      // the transformed previous level remains visible.
      this.map._animateZoom(center, zoom, true, false);
    } else {
      this.map._resetView(center, zoom, true);
    }
    this.map.options.zoomSnap = zoomSnap;
  }

  this.pinchActive = false;
  this.pinchPoint = null;
  this.pinchTargetZoom = null;
};

TrackpadGestureHandler.prototype.schedulePinchEnd = function() {
  clearTimeout(this.pinchEndTimer);
  this.pinchEndTimer = setTimeout(function() {
    this.finishPinch();
  }.bind(this), 120);
};

TrackpadGestureHandler.prototype.onWheel = function(event) {
  if(isInteractiveUiEvent(event, this.container)) {
    this.trackpadPanUntil = 0;
    return;
  }

  if(looksLikeTrackpadPinch(event)) {
    this.stopEvent(event);
    this.pinchPoint = this.getEventPoint(event);

    if(this.pinchTargetZoom === null) {
      this.pinchTargetZoom = this.map.getZoom();
    }

    var zoomChange = Math.max(-0.75, Math.min(0.75, -event.deltaY * 0.025));
    this.pinchTargetZoom = this.limitZoom(
      this.pinchTargetZoom + zoomChange
    );
    this.setSmoothZoomAround(
      this.pinchPoint,
      this.pinchTargetZoom
    );
    this.schedulePinchEnd();
    return;
  }

  var now = Date.now();
  if(looksLikeTrackpadPan(event)) {
    this.trackpadPanUntil = now + 250;
  } else if(now > this.trackpadPanUntil) {
    return;
  }

  this.stopEvent(event);
  this.panX += event.deltaX;
  this.panY += event.deltaY;

  if(this.panFrame !== null) return;

  this.panFrame = window.requestAnimationFrame(function() {
    // Reset first: if panning throws, a pending frame left behind would make
    // every later scroll wait on it, and the map could never pan again.
    var offset = [this.panX, this.panY];
    this.panX = 0;
    this.panY = 0;
    this.panFrame = null;
    this.map.panBy(offset, {
      animate: false,
      noMoveStart: true
    });
  }.bind(this));
};

TrackpadGestureHandler.prototype.onGestureStart = function(event) {
  if(isInteractiveUiEvent(event, this.container)) return;

  this.stopEvent(event);
  this.gestureStartZoom = this.map.getZoom();
  this.pinchTargetZoom = this.gestureStartZoom;
  this.gesturePoint = this.getEventPoint(event);
  this.pinchPoint = this.gesturePoint;
};

TrackpadGestureHandler.prototype.onGestureChange = function(event) {
  if(this.gestureStartZoom === null) return;

  this.stopEvent(event);
  this.pinchTargetZoom = this.limitZoom(
    this.gestureStartZoom + Math.log(event.scale) / Math.LN2
  );
  this.setSmoothZoomAround(
    this.gesturePoint,
    this.pinchTargetZoom
  );
};

TrackpadGestureHandler.prototype.onGestureEnd = function(event) {
  if(this.gestureStartZoom === null) return;

  this.stopEvent(event);
  this.finishPinch();
  this.gestureStartZoom = null;
  this.gesturePoint = null;
};

TrackpadGestureHandler.prototype.destroy = function() {
  clearTimeout(this.pinchEndTimer);
  if(this.panFrame !== null) {
    window.cancelAnimationFrame(this.panFrame);
  }

  this.container.removeEventListener('wheel', this.onWheel, true);
  this.container.removeEventListener('gesturestart', this.onGestureStart, true);
  this.container.removeEventListener('gesturechange', this.onGestureChange, true);
  this.container.removeEventListener('gestureend', this.onGestureEnd, true);
  this.map.off('unload', this.destroy);
};

if(typeof module !== 'undefined') {
  module.exports = {
    isInteractiveUiEvent: isInteractiveUiEvent,
    looksLikeTrackpadPan: looksLikeTrackpadPan,
    looksLikeTrackpadPinch: looksLikeTrackpadPinch
  };
}
