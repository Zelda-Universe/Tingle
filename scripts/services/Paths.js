/* Paths (get_paths): ordered routes through markers, drawn over the map.
   A guide path's steps are each their own marker (a trading sequence, a
   route), numbered when the path says so; a single path is one marker with
   one check (a Korok pair, a dragon's flight), so only its first step shows.
   Steps are markers or bare points (a user's own pins, hidden waypoints).
   Official paths show with their category (or their first marker's); a
   user's own paths only when opened by their link (?path=<slug>). */

ZMap.prototype.loadPaths = function() {
  var zmap = this;
  this.paths = [];
  // Only admins get paths while they're built (lib/common/paths.php, which
  // decides): no one else needs to ask.
  var user = this.getUser();
  if(!user || Number(user.level) < 10) return;
  // A link's path comes too, even someone else's (a shared route).
  var linked = new URL(window.location.href).searchParams.get('path') || '';
  $.getJSON('ajax.php?command=get_paths&game=' + gameId + '&path=' + encodeURIComponent(linked)).done(function(paths) {
    zmap.paths = Array.isArray(paths) ? paths : [];
    zmap._preparePaths();
    zmap.refreshMap();
    zmap._pathsEnabled = !!(zmap.getUser() && zmap.getUser().level >= 10);
    if(zmap._refreshMarkerPaths) zmap._refreshMarkerPaths();
    // A category page opened before they loaded (a ?category= link) gets
    // its paths now (CategoryPage.js), or becomes its one path's page.
    var control = zmap.mapControl;
    if(zmap.selectedCategory && control && /^category-/.test(control.getContentType() || '') &&
      zmap._categoryPaths(zmap.selectedCategory).paths.length) zmap._showCategoryPage(zmap.selectedCategory);
    // A path's link: once the page has settled, as its own start-up view
    // would otherwise land on top.
    var slug = new URL(window.location.href).searchParams.get('path');
    if(slug) setTimeout(function() {
      if(zmap.openPathPage && zmap.paths.some(function(p) { return p.slug === slug; })) zmap.openPathPage(slug);
      else { zmap.focusPath(slug); zmap.drawPaths(); }
    }, 600);
  });
};

ZMap.prototype._pathMarker = function(id) {
  if(!this._pathMarkerIndex) {
    var index = this._pathMarkerIndex = {};
    this.getMarkers().forEach(function(marker) { index[marker.id] = marker; });
  }
  return this._pathMarkerIndex[id] || null;
};

// Each step's place, and which markers a single path stands in for.
ZMap.prototype._preparePaths = function() {
  var zmap = this;
  this._pathMarkerIndex = null;
  this.getMarkers().forEach(function(marker) { marker.pathFollower = false; });
  this.paths.forEach(function(path) {
    path.points = path.steps.map(function(step) {
      if(step.markerId) {
        var marker = zmap._pathMarker(step.markerId);
        if(marker) return {latLng: marker.getLatLng(), submapId: marker.submapId, marker: marker, shown: true, step: step};
        // One since removed from the map, kept by a user's path: where it was.
        if(step.deleted && step.x != null) return {latLng: L.latLng(Number(step.y), Number(step.x)), submapId: step.submapId,
          marker: null, shown: true, step: step, deleted: true};
        return null;
      }
      return {latLng: L.latLng(Number(step.y), Number(step.x)), submapId: step.submapId, marker: null,
        shown: step.shown == 1, step: step};
    }).filter(Boolean);
    var first = path.points.find(function(p) { return p.marker; });
    path.lead = first ? first.marker : null;
    if(path.kind === 'single') {
      path.points.forEach(function(p) { if(p.marker && p.marker !== path.lead) p.marker.pathFollower = true; });
    }
  });
};

ZMap.prototype._pathShown = function(path) {
  if(path === this._previewOf) return false;
  // The path whose page is open, whatever's focused; once its page closes it
  // goes back to showing with its category like any other.
  if(this._pathPageOpen && this._focusedPath === path) return true;
  // A path in focus: the others step aside, as other categories' markers do.
  if(this._pathFocusIds) return false;
  if(path.scope !== 'official') return false;
  // Not always on the map: only while one of its markers is open (opening
  // any of them selects the path).
  if(path.alwaysShow === false) {
    var open = this._pathOpenMarkerId;
    return !!open && path.steps.some(function(s) { return String(s.markerId) === open; });
  }
  var categoryId = path.categoryId || (path.lead && path.lead.categoryId);
  var category = categoryId && this.categories[categoryId];
  return !!category && category.checked !== false && !(path.kind === 'single' && path.lead && !this.map.hasLayer(path.lead));
};

// A path's own pages (PathEditor.js): while one is open, its path is the
// selected one, drawn on top with a white outline.
ZMap.prototype.PATH_PAGES = ['path', 'pathEditor', 'pathHistory', 'pathRevision'];
// Pages that put the path in focus: its own markers alone on the map, as a
// focused category's are. (Not the editor: steps are added from any marker.)
ZMap.prototype.PATH_FOCUS_PAGES = ['path', 'pathHistory', 'pathRevision'];

ZMap.prototype._pathPageChanged = function(type) {
  this._updatePathFocus(type);
};

// Whether a path is selected and in focus, as the page now open says: one
// of its own pages, or one of its markers opened from it (its Back returns
// to the path). Redraws what changed.
ZMap.prototype._updatePathFocus = function(type) {
  var control = this.mapControl;
  if(type === undefined) type = control && control.getContentType ? control.getContentType() : '';
  var path = this._focusedPath;
  var markerPage = /^m(\d+)$/.exec(type || '');
  // The marker that's open: a path not always on the map shows while one of
  // its markers is (_pathShown).
  var openMarker = markerPage ? markerPage[1] : null;
  var markerChanged = openMarker !== (this._pathOpenMarkerId || null);
  this._pathOpenMarkerId = openMarker;
  var ofPath = !!(path && markerPage && path.steps.some(function(s) { return String(s.markerId) === markerPage[1]; }));
  var open = !!path && (this.PATH_PAGES.indexOf(type) !== -1 || ofPath);
  var focused = !!path && (this.PATH_FOCUS_PAGES.indexOf(type) !== -1 || ofPath);
  var ids = null;
  if(focused) {
    ids = {};
    path.steps.forEach(function(s) { if(s.markerId) ids[s.markerId] = true; });
  }
  var key = ids ? (path.slug || path.id) + ':' + Object.keys(ids).sort().join(',') : '';
  var focusChanged = key !== (this._pathFocusKey || '');
  if(open === !!this._pathPageOpen && !focusChanged) {
    if(markerChanged && this.paths && this.paths.some(function(p) { return p.alwaysShow === false; })) this.drawPaths();
    return;
  }
  this._pathPageOpen = open;
  this._pathFocusIds = ids;
  this._pathFocusKey = key;
  // Leaving its pages, the path leaves the address too.
  if(!open) {
    // Leaving the path: coming back, its guide offers to Continue (PathEditor.js).
    this._pathStartLabel = null;
    var url = new URL(window.location.href);
    if(url.searchParams.has('path')) {
      url.searchParams.delete('path');
      history.replaceState(history.state, '', url.toString());
    }
  }
  // Markers in or out of focus need the whole map redrawn (it redraws the
  // paths too); the highlight alone, just the paths.
  if(focusChanged && this.map) this.refreshMap();
  else if(this.paths) this.drawPaths();
};

ZMap.prototype.drawPaths = function() {
  if(!this.map || !this.paths) return;
  var zmap = this, map = this.map;
  if(!this._pathLayer) this._pathLayer = L.layerGroup().addTo(map);
  this._pathLayer.clearLayers();
  var current = this.mapControl && this.mapControl.getCurrentMap();
  var submap = current && String(current.subMapId);
  var selectedPath = this._pathPageOpen ? this._focusedPath : null;
  // The selected path last, over the others.
  this.paths.filter(function(p) { return p !== selectedPath; }).concat(selectedPath ? [selectedPath] : []).forEach(function(path) {
    if(!zmap._pathShown(path)) return;
    var here = path.points.filter(function(p) { return String(p.submapId) === submap; });
    if(here.length < 2) return;
    var color = path.color || '#ffad48';
    var line = here.map(function(p) { return p.latLng; });
    if(path.smooth && line.length > 2) {
      // A curve through every step (map units are flat, so it's drawn in them).
      line = zmap._smoothPoints(line.map(function(ll) { return [ll.lng, ll.lat]; }), path.loops)
        .map(function(p) { return L.latLng(p[1], p[0]); });
    } else if(path.loops) line.push(line[0]);
    var selected = path === selectedPath;
    // One shape with one thin white border: every white part of the path
    // (under its line, arrows and pins) is drawn first, then every coloured
    // part over it, so where they overlap they merge into one silhouette.
    var width = selected ? 5 : 3.5, border = 1.5;
    var arrow = function(size, options) {
      return L.polylineDecorator(line, {patterns: [{offset: 24, repeat: 90, symbol: L.Symbol.arrowHead({pixelSize: size, pathOptions: options})}]});
    };
    var arrowSize = selected ? 13 : 11;
    var pins = here.filter(function(p) { return p.shown && !p.marker; });
    // The white: under the line, its arrows and its pins. (The selected
    // path's is lifted off the map with a shadow: styles/zmain.css.)
    var casing = L.polyline(line, {color: '#fff', weight: width + border * 2, opacity: 1, interactive: false,
      lineCap: 'round', lineJoin: 'round', className: 'zm-path-casing' + (selected ? ' zm-path-outline' : '')}).addTo(zmap._pathLayer);
    var casingArrows = arrow(arrowSize, {fill: true, fillColor: '#fff', fillOpacity: 1, color: '#fff', weight: border * 2, lineJoin: 'round', opacity: 1})
      .addTo(zmap._pathLayer);
    pins.forEach(function(p) {
      L.circleMarker(p.latLng, {radius: 6 + border, stroke: false, fillColor: '#fff', fillOpacity: 1, interactive: false}).addTo(zmap._pathLayer);
    });
    // The colour.
    var visible = L.polyline(line, {color: color, weight: width, opacity: 1, interactive: false, lineCap: 'round', lineJoin: 'round',
      dashArray: path.scope === 'user' ? '8 6' : null, className: 'zm-path-line'}).addTo(zmap._pathLayer);
    var colorArrows = arrow(arrowSize, {fill: true, fillColor: color, fillOpacity: 1, stroke: false}).addTo(zmap._pathLayer);
    pins.forEach(function(p) {
      // A pin; or, grey, a marker since removed from the map.
      var dot = L.circleMarker(p.latLng, {radius: 6, stroke: false, fillColor: p.deleted ? '#6b6b6b' : color, fillOpacity: 1}).addTo(zmap._pathLayer);
      var tip = p.deleted ? (p.step.markerName || 'Marker') + ' (removed from the map)' : p.step.name;
      if(tip) dot.bindTooltip(zmap._pathEsc ? zmap._pathEsc(tip) : tip, {direction: 'right', offset: [8, 0], className: 'zm-path-pin'});
    });
    // The line itself opens the path's page (not while one's being edited:
    // clicks then add steps and drop pins). Hovered, the line thickens, so
    // it's clear it can be clicked.
    if(!path._preview && !zmap._pathEditing) {
      var hit = L.polyline(line, {color: '#000', opacity: 0, weight: 18, bubblingMouseEvents: false, className: 'zm-path-hit'})
        .on('click', function(e) { L.DomEvent.stop(e); zmap.openPathPage(path.slug); })
        .addTo(zmap._pathLayer);
      if(!selected) {
        // (Its arrows grow with it.)
        var setArrows = function(size) {
          casingArrows.setPatterns([{offset: 24, repeat: 90, symbol: L.Symbol.arrowHead({pixelSize: size,
            pathOptions: {fill: true, fillColor: '#fff', fillOpacity: 1, color: '#fff', weight: border * 2, lineJoin: 'round', opacity: 1}})}]);
          colorArrows.setPatterns([{offset: 24, repeat: 90, symbol: L.Symbol.arrowHead({pixelSize: size,
            pathOptions: {fill: true, fillColor: color, fillOpacity: 1, stroke: false}})}]);
        };
        hit.on('mouseover', function() {
          visible.setStyle({weight: 5});
          casing.setStyle({weight: 5 + border * 2});
          setArrows(14);
        }).on('mouseout', function() {
          visible.setStyle({weight: width});
          casing.setStyle({weight: width + border * 2});
          setArrows(arrowSize);
        });
      }
      // Its name by the pointer, as a hint at what clicking opens.
      if(!L.Browser.mobile) hit.bindTooltip(zmap._pathEsc ? zmap._pathEsc(path.name) : path.name, {sticky: true, direction: 'top', offset: [0, -10], className: 'zm-path-tooltip'});
    }
    // Numbers on a numbered path's steps: white, the number in the path's
    // colour (styles/zmain.css .zm-path-step).
    // Beside a marker, just clear of its right edge: half its icon (medium or
    // small, as the zoom has it: zmap.js _createMarkerIcon) and its 1.5px
    // white ring (styles/poi.css), then a pixel's gap. On a pin, over it.
    if(path.numbered) {
      var options = zmap.mapOptions;
      var iconSize = zmap._getDisplayZoom() > Number(options.switchIconsAtZoom) ? Number(options.iconWidth) : Number(options.iconSmallWidth);
      var clear = Math.ceil((iconSize || 23) / 2 + 1.5) + 1;
      var n = 0;
      here.forEach(function(p) {
        if(!p.shown) return;
        n++;
        L.marker(p.latLng, {interactive: false, keyboard: false, zIndexOffset: 1000, icon: L.divIcon({
          className: 'zm-path-step', iconSize: [20, 20], iconAnchor: p.marker ? [-clear, 10] : [10, 10],
          html: '<span style="--path-color:' + color + '">' + n + '</span>'})}).addTo(zmap._pathLayer);
      });
    }
  });
};

// Show one path (?path=<slug>): drawn even if its category is off, and the
// map fitted to it.
ZMap.prototype.focusPath = function(slug) {
  var path = (this.paths || []).find(function(p) { return p.slug === slug; });
  if(!path || !path.points.length) return;
  this._focusedPath = path;
  var first = path.points[0];
  var current = this.mapControl.getCurrentMap();
  if(String(current.subMapId) !== String(first.submapId) && first.marker) {
    this.mapControl.changeMapOnly(first.marker.mapId, first.submapId);
  }
  var here = path.points.filter(function(p) { return String(p.submapId) === String(first.submapId); });
  // The page's own view: the map's fit-on-open doesn't undo it.
  this._viewChosen = true;
  var bounds = L.latLngBounds(here.map(function(p) { return p.latLng; }));
  // Fitted to the map that's left to see, as a region is (CategoryPage.js).
  // (On a phone the path's page opens the drawer part way, and the path fills
  // the map above it; with the drawer pulled up, it still gets the top half.)
  var control = this.mapControl;
  this._prepareMapEdgesForDrawer();
  if(this._fitBoundsToVisibleMap) this._fitBoundsToVisibleMap(bounds, {maxDrawerShare: .5,
    drawerTargetTop: control.viewStyleBottomSlide && control._partialDrawerMode ? control.options.softOpenTo : undefined});
  else this.map.fitBounds(bounds.pad(.15), {animate: false});
};

// On a phone, the map's edges set for where the drawer is going (its
// partial height) before the map moves, so a fit or a step near the bottom
// of the artwork can come up above it (zmap.js _limitZoomToMapBounds): the
// drawer's own move updates them only once it's under way.
ZMap.prototype._prepareMapEdgesForDrawer = function() {
  var control = this.mapControl;
  if(!control || !control.viewStyleBottomSlide || !this._recenterMobileMapAtMinimumZoom) return;
  this._recenterMobileMapAtMinimumZoom(control._partialDrawerMode ? control.options.softOpenTo : control.drawerTop());
};

// A category's paths (those shown as it or one of its children), and, when
// there's just one and every marker in the category is one of its steps,
// that path: the category and the path are then the same thing, and its
// page is the path's page (CategoryPage.js).
ZMap.prototype._categoryPaths = function(category) {
  var ids = Object.create(null);
  var collect = function(c) {
    if(!c || ids[c.id]) return;
    ids[c.id] = true;
    (c.childrenArr || []).forEach(collect);
  };
  collect(category);
  var paths = (this.paths || []).filter(function(p) { return !p._preview && p.categoryId && ids[p.categoryId]; });
  if(paths.length !== 1) return {paths: paths, single: null};
  var steps = Object.create(null);
  paths[0].steps.forEach(function(step) { if(step.markerId) steps[step.markerId] = true; });
  var others = this._getCategoryMarkers(category).some(function(marker) { return !steps[marker.id]; });
  return {paths: paths, single: others ? null : paths[0]};
};

// A smooth curve through points ([x, y] each, in order): a centripetal
// Catmull-Rom spline, which passes through every point without the loops and
// overshoots a plain one makes at sharp turns. A loop's curve closes on its
// first point; an open one's ends are extended in a straight line. Each
// stretch between two points becomes `steps` short segments.
ZMap.prototype._smoothPoints = function(pts, loops, steps) {
  var n = pts.length;
  if(n < 3) return loops && n === 2 ? pts.concat([pts[0]]) : pts.slice();
  steps = steps || 16;
  var at = function(i) {
    if(loops) return pts[(i % n + n) % n];
    if(i < 0) return [2 * pts[0][0] - pts[1][0], 2 * pts[0][1] - pts[1][1]];
    if(i >= n) return [2 * pts[n - 1][0] - pts[n - 2][0], 2 * pts[n - 1][1] - pts[n - 2][1]];
    return pts[i];
  };
  // Knot spacing: the square root of each stretch's length (centripetal).
  var gap = function(a, b) { return Math.max(Math.sqrt(Math.hypot(b[0] - a[0], b[1] - a[1])), 1e-6); };
  var mix = function(a, b, ta, tb, t) {
    var wa = (tb - t) / (tb - ta), wb = (t - ta) / (tb - ta);
    return [a[0] * wa + b[0] * wb, a[1] * wa + b[1] * wb];
  };
  var out = [pts[0].slice()];
  for(var i = 0, segments = loops ? n : n - 1; i < segments; i++) {
    var p0 = at(i - 1), p1 = at(i), p2 = at(i + 1), p3 = at(i + 2);
    var t0 = 0, t1 = t0 + gap(p0, p1), t2 = t1 + gap(p1, p2), t3 = t2 + gap(p2, p3);
    for(var k = 1; k <= steps; k++) {
      var t = t1 + (t2 - t1) * k / steps;
      var a1 = mix(p0, p1, t0, t1, t), a2 = mix(p1, p2, t1, t2, t), a3 = mix(p2, p3, t2, t3, t);
      var b1 = mix(a1, a2, t0, t2, t), b2 = mix(a2, a3, t1, t3, t);
      out.push(k === steps ? p2.slice() : mix(b1, b2, t1, t2, t));
    }
  }
  return out;
};

