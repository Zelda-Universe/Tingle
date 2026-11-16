/* Paths (get_paths): ordered routes through markers, drawn over the map.
   A guide path's steps are each their own marker (a trading sequence, a
   route), numbered when the path says so; a single path is one marker with
   one check (a Korok pair, a dragon's flight), so only its first step shows.
   Steps are markers or bare points (a user's own pins, hidden waypoints).
   Official paths show with their category (or their first marker's); a
   user's own paths only when opened by their link (?path=<slug>). */

// How far paths are released (lib/common/paths.php PATHS_STAGE, which the
// server enforces; index.php tells the page): 'staff', 'readonly' (everyone
// sees and uses the official paths, staff make them) or 'open'.
ZMap.prototype._pathsStage = function() {
  return window.zmapPathsStage || 'staff';
};
ZMap.prototype._isPathStaff = function() {
  var user = this.getUser && this.getUser();
  return !!user && Number(user.level) >= 10;
};
// Seeing and using paths (signed out too, once released).
ZMap.prototype._pathsVisible = function() {
  return this._pathsStage() !== 'staff' || this._isPathStaff();
};
// Making and changing them, and users' own paths (Community Paths, profiles).
ZMap.prototype._pathsMakeable = function() {
  return this._pathsStage() === 'open' || this._isPathStaff();
};

ZMap.prototype.loadPaths = function() {
  var zmap = this;
  this.paths = [];
  // Only those the server gives paths to ask for them. (Signed out of them:
  // the map loses any it had.)
  if(!this._pathsVisible()) {
    this._pathsEnabled = false;
    if(this._preparePaths) { this._preparePaths(); this.drawPaths(); }
    return;
  }
  // A link's path comes too, even someone else's (a shared route).
  var linked = new URL(window.location.href).searchParams.get('path') || '';
  $.getJSON('ajax.php?command=get_paths&game=' + gameId + '&path=' + encodeURIComponent(linked)).done(function(paths) {
    zmap.paths = Array.isArray(paths) ? paths : [];
    // An embed (previewed on Zelda Maps, signed in) shows only what anyone
    // would see: the official paths and the one embedded, nobody's progress.
    if(zmap.isFramed && zmap.isFramed()) {
      zmap.paths = zmap.paths.filter(function(p) { return p.scope === 'official' || p.slug === linked; });
      zmap.paths.forEach(function(p) { p.complete = false; p.steps.forEach(function(s) { s.done = false; }); });
    }
    zmap._preparePaths();
    zmap.refreshMap();
    // (Make New Path From Here, on markers and dropped pins.)
    zmap._pathsEnabled = !!zmap.getUser() && zmap._pathsMakeable();
    if(zmap._refreshMarkerPaths) zmap._refreshMarkerPaths();
    // A category page opened before they loaded (a ?category= link) gets
    // its paths now (CategoryPage.js), or becomes its one path's page.
    var control = zmap.mapControl;
    if(zmap.selectedCategory && control && /^category-/.test(control.getContentType() || '') &&
      zmap._categoryPaths(zmap.selectedCategory).paths.length) zmap._showCategoryPage(zmap.selectedCategory);
    // A path's link (or a reload of its page): in place at once, already in
    // focus and fitted, the drawer not sliding (as a marker's link opens).
    var slug = new URL(window.location.href).searchParams.get('path');
    if(slug) {
      if(zmap.openPathPage && zmap.paths.some(function(p) { return p.slug === slug; })) {
        var control = zmap.mapControl;
        control._restoringInitialPage = true;
        // (A pin's link: its page, over its path's.)
        var pin = new URL(window.location.href).searchParams.get('pin');
        // (Read before the path's page rewrites the address.)
        var params = new URL(window.location.href).searchParams;
        try { zmap._withoutPageSlide(function() {
          zmap.openPathPage(slug, {instant: true});
          var path = zmap.paths.find(function(p) { return p.slug === slug; });
          if(pin && path.steps.some(function(s) { return s.pinKey === pin; })) zmap.openPathPin(path, pin, null, {instant: true});
          // (A revision's link, or a notification's at its Talk.)
          else if(zmap._openPathSubpage) zmap._openPathSubpage(path, {pathRev: Number(params.get('pathrev')) || 0,
            talk: params.get('talk') === '1', comment: Number(params.get('comment')) || 0});
        }); }
        finally { control._restoringInitialPage = false; }
      } else { zmap.focusPath(slug, {instant: true}); zmap.drawPaths(); }
    }
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
  this.getMarkers().forEach(function(marker) { marker.pathFollower = false; marker.pathLead = null; });
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
      // (Its later markers still show on the map, checked with its first:
      // zmap.js _markerShownDone.)
      path.points.forEach(function(p) { if(p.marker && p.marker !== path.lead) { p.marker.pathFollower = true; p.marker.pathLead = path.lead; } });
    }
  });
  // A follower isn't a check of its own: categories' counts leave it out
  // (_categoryCounts), so they're redrawn.
  var menu = this.mapControl && this.mapControl._categoryMenu;
  if(menu && menu.categoryButtons) menu.categoryButtons.forEach(function(button) { button.updateCategoryLabel(); });
};

// The marker that checks for a single path's later marker (a Korok pair's
// Carry korok: its Pair korok), or null.
ZMap.prototype._pathLeadFor = function(marker) {
  if(!marker || !marker.pathFollower) return null;
  var path = (this.paths || []).find(function(p) {
    return p.kind === 'single' && p.lead && p.lead !== marker && p.steps.some(function(s) { return String(s.markerId) === String(marker.id); });
  });
  return path ? {lead: path.lead, path: path} : null;
};

// The other markers checked together with this one in a single path (a
// Korok pair's start and finish), with the path, or null.
ZMap.prototype._pathPartners = function(marker) {
  if(!marker) return null;
  var path = (this.paths || []).find(function(p) {
    return p.kind === 'single' && !p._preview && p.points && p.points.some(function(pt) { return pt.marker === marker; }) &&
      p.points.some(function(pt) { return pt.marker && pt.marker !== marker; });
  });
  if(!path) return null;
  var others = [];
  path.points.forEach(function(pt) { if(pt.marker && pt.marker !== marker && others.indexOf(pt.marker) === -1) others.push(pt.marker); });
  return {path: path, others: others};
};

// A category's completion count, less the markers a single path stands in
// for (a Korok pair's second korok): those are checked with their path's
// first marker, not on their own.
ZMap.prototype._categoryCounts = function(category) {
  var total = category.total || 0, done = category.complete || 0;
  if(this.paths && this.paths.length) {
    this.getMarkers().forEach(function(marker) {
      if(!marker.pathFollower || marker.categoryId != category.id) return;
      total--;
      if(marker.complete === true || marker.complete == 1) done--;
    });
  }
  return {done: Math.max(0, done), total: Math.max(0, total)};
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
  // A single path shows with the marker standing for it (hidden once
  // completed, say), wherever that is: not just while it's on screen
  // (markers off screen are taken off the map).
  return !!category && category.checked !== false && this._pathCategoryAtZoom(category) &&
    !(path.kind === 'single' && path.lead && !this._shouldShowMarker(path.lead, true));
};

// Whether a category's markers show at this zoom (its zoom threshold), as
// zmap.js _shouldShowMarker has it: a path that's a category shows when its
// markers do, so it never draws lines between markers that aren't there.
ZMap.prototype._pathCategoryAtZoom = function(category) {
  var layer = this.mapControl && this.mapControl.currentMapLayer;
  var menu = this.mapControl && this.mapControl._categoryMenu;
  if(layer && layer.alwaysShowCategories) return true;
  if(!category._respectZoomThreshold && (this.mapOptions.categorySelectionMethod != 'focus' || !(menu && menu.modeAutomatic))) return true;
  return Number(category.visible_zoom) <= this._getDisplayZoom();
};

// A path's own pages (PathEditor.js): while one is open, its path is the
// selected one, drawn on top with a white outline.
// (A revision's page is pathRevision-N, a path's Talk talk-path-N: _pathPageKind.)
ZMap.prototype.PATH_PAGES = ['path', 'pathEditor', 'pathHistory', 'pathRevision', 'pathTalk', 'pathPin', 'pathPinEditor'];
// Pages that put the path in focus: its own markers alone on the map, as a
// focused category's are. (Not the editor: steps are added from any marker.)
ZMap.prototype.PATH_FOCUS_PAGES = ['path', 'pathHistory', 'pathRevision', 'pathTalk', 'pathPin', 'pathPinEditor'];
ZMap.prototype._pathPageKind = function(type) {
  type = type || '';
  return /^pathRevision-\d+$/.test(type) ? 'pathRevision' : /^talk-path-\d+$/.test(type) ? 'pathTalk' : type;
};

ZMap.prototype._pathPageChanged = function(type) {
  this._updatePathFocus(type);
  this._updatePathTitle(type);
};

// The browser's title on a path's own pages, as its page's link has it for
// search engines (index.php, lib/common/seo.php): "Biggoron's Sword Trading
// Sequence - Ocarina of Time Remake Guide - Zelda Maps". Leaving them puts
// back the game's own, unless the page now open has set its own (a
// category's, an area's).
ZMap.prototype._updatePathTitle = function(type) {
  var kind = this._pathPageKind(type), path = this._focusedPath;
  // (A revision shows its version in focus: the path it's of.)
  if(path && path._preview) path = this._previewOf;
  var game = typeof seoGameName === 'function' ? seoGameName(this.mapOptions || {}) : '';
  if(path && path.name && game && ['path', 'pathHistory', 'pathRevision', 'pathTalk', 'pathPin'].indexOf(kind) !== -1) {
    this._pathTitle = path.name + ' - ' + game + ' Guide - Zelda Maps';
    document.title = this._pathTitle;
  } else if(this._pathTitle) {
    if(document.title === this._pathTitle && game) document.title = game + ' Interactive Map - Zelda Maps';
    this._pathTitle = null;
  }
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
  var kind = this._pathPageKind(type);
  var open = !!path && (this.PATH_PAGES.indexOf(kind) !== -1 || ofPath);
  var focused = !!path && (this.PATH_FOCUS_PAGES.indexOf(kind) !== -1 || ofPath);
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
    if((url.searchParams.has('path') || url.searchParams.has('pin')) && !(this.isFramed && this.isFramed())) {
      url.searchParams.delete('path');
      url.searchParams.delete('pin');
      history.replaceState(history.state, '', url.toString());
    }
  }
  // Markers in or out of focus need the whole map redrawn (it redraws the
  // paths too); the highlight alone, just the paths.
  if(focusChanged && this.map) this.refreshMap();
  else if(this.paths) this.drawPaths();
};

// ifChanged: only if what's drawn would differ (refreshMap runs after every
// move of the map: redrawing then made the step numbers blink, and panning
// slow). The arrows follow the map by themselves (_pathArrows).
ZMap.prototype.drawPaths = function(ifChanged) {
  if(!this.map || !this.paths) return;
  var zmap = this, map = this.map;
  var current = this.mapControl && this.mapControl.getCurrentMap();
  var submap = current && String(current.subMapId);
  // (Its page open, or being edited: the editor shows its numbers too.)
  var selectedPath = this._pathPageOpen || this._pathEditing ? this._focusedPath : null;
  var options = this.mapOptions;
  // (A numbered path's numbers move with the zoom, to keep clear of markers.)
  var key = JSON.stringify([submap, selectedPath && (selectedPath.slug || selectedPath.id), !!this._pathEditing,
    selectedPath && selectedPath.numbered ? Math.round(map.getZoom() * 4) / 4 : 0,
    this._getDisplayZoom && this._getDisplayZoom() > Number(options.switchIconsAtZoom),
    this.paths.map(function(p) {
      return zmap._pathShown(p) ? [p.slug || p.id, p.color, p.numbered, p.smooth, p.loops,
        (p.points || []).map(function(q) { return [q.submapId, q.latLng.lat, q.latLng.lng, q.shown ? 1 : 0, q.step && q.step.name]; })] : 0;
    })]);
  if(ifChanged === true && key === this._pathDrawnKey && this._pathLayer) return;
  this._pathDrawnKey = key;
  if(!this._pathLayer) this._pathLayer = L.layerGroup().addTo(map);
  this._pathLayer.clearLayers();
  // (Their own drawing layer: _pathRenderer.)
  var renderer = this._pathRenderer();
  var widthVar = this._pathWidthVar.bind(this);
  // The selected path last, over the others.
  this.paths.filter(function(p) { return p !== selectedPath; }).concat(selectedPath ? [selectedPath] : []).forEach(function(path) {
    if(!zmap._pathShown(path)) return;
    var here = path.points.filter(function(p) { return String(p.submapId) === submap; });
    if(here.length < 2) return;
    var color = path.color || '#ffad48';
    var line = here.map(function(p) { return p.latLng; });
    // Where the stream stops (each step shown on the map: a marker or pin,
    // not a hidden waypoint), and how far short of it, so an arrow's point
    // ends at the marker's edge: [index in line, gap in pixels].
    var stopGap = function(p) { return !p.shown ? null : p.marker ? 13 : 9; };
    var stops = [];
    if(path.smooth && line.length > 2) {
      // A curve through every step (map units are flat, so it's drawn in them).
      var every = 16;
      line = zmap._smoothPoints(line.map(function(ll) { return [ll.lng, ll.lat]; }), path.loops, every)
        .map(function(p) { return L.latLng(p[1], p[0]); });
      here.forEach(function(p, i) { stops.push([i * every, stopGap(p)]); });
      if(path.loops) stops.push([here.length * every, stopGap(here[0])]);
    } else {
      here.forEach(function(p, i) { stops.push([i, stopGap(p)]); });
      if(path.loops) { line.push(line[0]); stops.push([here.length, stopGap(here[0])]); }
    }
    stops = stops.filter(function(s, i) { return s[1] !== null || i === 0 || i === stops.length - 1; })
      .map(function(s) { return [s[0], s[1] || 0]; });
    var selected = path === selectedPath;
    // Drawn as a stream of arrows (the official guides' style): each a stem
    // along the line and a head, edged in white and shadowed, each sitting
    // on top of the next, filling the line from step to step (_pathArrows).
    // The edge is thin, and thicker while the path is hovered or in focus.
    var border = selected ? 2.5 : 1.25, hoverBorder = 2.5;
    var arrows = zmap._pathArrows(renderer, line, stops, color, border).addTo(zmap._pathLayer);
    // Its pins: dots (grey, a marker since removed from the map) that open
    // the pin, as a marker opens its page.
    var pathDots = [];
    here.filter(function(p) { return p.shown && !p.marker; }).forEach(function(p) {
      var dot = L.marker(p.latLng, {keyboard: false, zIndexOffset: 900, icon: L.divIcon({
        // (A single path's point, a Korok race's start, is edged as its line
        // is: thin, thicker while the path is hovered or open.)
        className: 'zm-path-pin-dot' + (p.deleted ? ' deleted' : '') + (path.kind === 'single' ? ' zm-path-point' + (selected ? ' thick' : '') : ''),
        iconSize: [16, 16], iconAnchor: [8, 8],
        html: "<span style='--path-color:" + color + "'></span>"})}).addTo(zmap._pathLayer);
      var tip = p.deleted ? (p.step.markerName || 'Marker') + ' (removed from the map)' : p.step.name;
      // (Not a single path's point, a Korok race's start: no name of its own to show.)
      if(tip && path.kind !== 'single') dot.bindTooltip(zmap._pathEsc ? zmap._pathEsc(tip) : tip, {direction: 'right', offset: [8, 0], className: 'zm-path-pin'});
      if(!p.deleted && p.step.pinKey && !path._preview && !zmap._pathEditing && zmap.openPathPin) {
        // (A single path's point, a Korok race's start: part of the path,
        // not a place of its own, so it opens the path.)
        dot.on('click', function() { if(path.kind === 'single') zmap.openPathPage(path.slug, {back: null}); else zmap.openPathPin(path, p.step); });
      }
      if(path.kind === 'single') pathDots.push(dot);
    });
    // The line itself opens the path's page (not while one's being edited:
    // clicks then add steps and drop pins). Hovered, its edge, and every
    // arrow's, thickens, so it's clear it can be clicked.
    if(!path._preview && !zmap._pathEditing && !(zmap.isFramed && zmap.isFramed())) {
      var hit = widthVar(L.polyline(line, {renderer: renderer, color: '#000', opacity: 0, weight: 18, bubblingMouseEvents: false, className: 'zm-path-hit'})
        // (From the map: its page closes, as a marker's does.)
        .on('click', function(e) { L.DomEvent.stop(e); zmap.openPathPage(path.slug, {back: null}); })
        .addTo(zmap._pathLayer));
      // (A single path's points, a Korok race's start, are hovered as the
      // line is: part of it.)
      var hovered = [hit].concat(pathDots);
      if(!selected) {
        var hover = function(on) {
          arrows.setBorder(on ? hoverBorder : border);
          pathDots.forEach(function(dot) { var el = dot.getElement(); if(el) el.classList.toggle('thick', on); });
        };
        hovered.forEach(function(layer) { layer.on('mouseover', function() { hover(true); }).on('mouseout', function() { hover(false); }); });
      }
      // Its name by the pointer, as a hint at what clicking opens.
      // Hovered, its card (as lists show it: PathEditor.js _pathCardHTML)
      // follows the pointer, a preview of what clicking opens.
      // (Not the path whose page is open: it's already in view.)
      if(!L.Browser.mobile && !selected) hovered.forEach(function(layer) { layer.bindTooltip(function() {
        return zmap._pathCardHTML ? zmap._pathCardHTML(path, {className: 'path-card-preview', author: true}) : zmap._pathEsc(path.name);
      }, {sticky: true, direction: 'top', offset: [0, -14], opacity: 1, className: 'zm-path-tooltip zm-path-card-tooltip', pane: zmap._pathPreviewPane()}); });
    }
    // Numbers on a numbered path's steps: white, the number in the path's
    // colour (styles/zmain.css .zm-path-step).
    // Beside a marker, just clear of its right edge: half its icon (medium or
    // small, as the zoom has it: zmap.js _createMarkerIcon) and its 1.5px
    // white ring (styles/poi.css), then a pixel's gap. On a pin, over it.
    if(path.numbered && selected) {
      var options = zmap.mapOptions;
      var iconSize = zmap._getDisplayZoom() > Number(options.switchIconsAtZoom) ? Number(options.iconWidth) : Number(options.iconSmallWidth);
      var clear = Math.ceil((iconSize || 23) / 2 + 1.5) + 1;
      // Where a marker's number goes: to its right, or, where that would sit
      // on another marker (or another number), the first place round it that's
      // clear (_pathNumberOffset).
      var obstacles = zmap._pathNumberObstacles((iconSize || 23) / 2 + 1.5);
      var placed = [];
      var n = 0;
      here.forEach(function(p) {
        if(!p.shown) return;
        n++;
        var anchor = [10, 10];
        if(p.marker) {
          var offset = zmap._pathNumberOffset(map.latLngToContainerPoint(p.latLng), clear + 10, obstacles, placed);
          anchor = [10 - offset.x, 10 - offset.y];
        }
        L.marker(p.latLng, {interactive: false, keyboard: false, zIndexOffset: 1000, icon: L.divIcon({
          className: 'zm-path-step', iconSize: [20, 20], iconAnchor: anchor,
          html: '<span style="--path-color:' + color + '">' + n + '</span>'})}).addTo(zmap._pathLayer);
      });
    }
  });
};

// The hover card's own layer, over every marker, label and popup.
ZMap.prototype._pathPreviewPane = function() {
  var name = 'zmPathPreview';
  if(!this.map.getPane(name)) {
    var pane = this.map.createPane(name);
    pane.style.zIndex = 750;
    pane.style.pointerEvents = 'none';
  }
  return name;
};

// The markers on the map, as circles in the map's pixels (radius: half an
// icon and its ring), that a path's step numbers keep clear of.
ZMap.prototype._pathNumberObstacles = function(radius) {
  var map = this.map, size = map.getSize(), out = [];
  this.getMarkers().forEach(function(marker) {
    if(!marker || !marker._map || marker.categoryTypeId == 3 || !marker.getLatLng) return;
    var at = map.latLngToContainerPoint(marker.getLatLng());
    if(at.x < -60 || at.y < -60 || at.x > size.x + 60 || at.y > size.y + 60) return;
    out.push({x: at.x, y: at.y, r: radius});
  });
  // (And a path's pins.)
  if(this._pathLayer) this._pathLayer.eachLayer(function(layer) {
    if(layer.options && layer.options.icon && /zm-path-pin-dot/.test(layer.options.icon.options.className || '')) {
      var at = map.latLngToContainerPoint(layer.getLatLng());
      out.push({x: at.x, y: at.y, r: 9.5});
    }
  });
  return out;
};

// A step number's place beside its marker (at `at`, distance `d` to the
// number's centre): right, then the other sides and corners, the first
// where its 10px circle overlaps no marker and no number already placed
// (added to `placed`). Right if nowhere is clear.
ZMap.prototype._pathNumberOffset = function(at, d, obstacles, placed) {
  var k = Math.SQRT1_2;
  var tries = [[1, 0], [k, -k], [k, k], [0, -1], [0, 1], [-1, 0], [-k, -k], [-k, k]];
  var clearOf = function(x, y) {
    return obstacles.every(function(o) { return Math.hypot(o.x - x, o.y - y) >= o.r + 11; }) &&
      placed.every(function(q) { return Math.hypot(q.x - x, q.y - y) >= 21; });
  };
  for(var i = 0; i < tries.length; i++) {
    var dx = Math.round(tries[i][0] * d), dy = Math.round(tries[i][1] * d);
    if(clearOf(at.x + dx, at.y + dy)) { placed.push({x: at.x + dx, y: at.y + dy}); return {x: dx, y: dy}; }
  }
  placed.push({x: at.x + d, y: at.y});
  return {x: d, y: 0};
};

// Show one path (?path=<slug>): drawn even if its category is off, and the
// map fitted to it.
ZMap.prototype.focusPath = function(slug, opts) {
  var path = (this.paths || []).find(function(p) { return p.slug === slug; });
  if(!path || !path.points.length) return;
  // (A view set mid-way through a zoom the page's start-up began is lost:
  // once it ends.)
  var zmap = this;
  if(opts && opts.instant && this.map._animatingZoom) {
    this._focusedPath = path;
    this._viewChosen = true;
    this.map.once('zoomend', function() { setTimeout(function() { zmap.focusPath(slug, opts); }, 0); });
    return;
  }
  this._focusedPath = path;
  var first = path.points[0];
  var current = this.mapControl.getCurrentMap();
  if(String(current.subMapId) !== String(first.submapId)) {
    // Its map: the first point's marker's, or, for a path starting at a
    // bare point (a dragon's flight, a Korok trail), a marker's on the same
    // submap, or the map that submap opens on.
    var onFirst = path.points.find(function(p) { return p.marker && String(p.submapId) === String(first.submapId); });
    var layer = !onFirst && (this.maps || []).find(function(l) { return String(l.defaultSubMapId) === String(first.submapId); });
    var mapId = onFirst ? onFirst.marker.mapId : layer ? layer.originalId : null;
    if(mapId != null) this.mapControl.changeMapOnly(mapId, first.submapId);
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
  // (A tenth again around it, so it doesn't run right up to the edges.)
  bounds = bounds.pad(.1);
  if(this._fitBoundsToVisibleMap) this._fitBoundsToVisibleMap(bounds, {maxDrawerShare: .5, animate: !(opts && opts.instant),
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
  // (Not an unlisted official one: on the map, but left out of lists.)
  var paths = (this.paths || []).filter(function(p) { return !p._preview && p.categoryId && ids[p.categoryId] && p.visibility !== 'unlisted'; });
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

// Paths' own drawing layer, as OoT's connectors have (OotFloors.js): during
// a zoom Leaflet scales the drawing with a CSS transform and only redraws it
// when the zoom ends, so the lines would swell and shrink mid-gesture. Their
// widths are divided by that scale as it changes (styles/zmain.css, each
// line's --zm-w), so only their positions move; the filled shapes (arrows,
// pins) are hidden until the zoom ends. A pinch, which zooms without an
// animation, redraws every quarter level.
ZMap.prototype._pathRenderer = function(casing) {
  if(!this._pathSvgs) this._setupPathRenderers();
  return casing ? this._pathSvgs.casing : this._pathSvgs.color;
};

// Two layers: every path's white edge beneath, every path's colour above, so
// a path's arrows can be redrawn (grown on hover) without its white ones
// coming up over its line.
ZMap.prototype._setupPathRenderers = function() {
  var zmap = this, map = this.map, panes = [];
  var make = function(name, z) {
    var pane = map.getPane(name) || map.createPane(name);
    pane.style.zIndex = z;
    panes.push(pane);
    var renderer = L.svg({pane: name, padding: 1.5});
    var drawnZoom = null, updateDrawing = renderer._update, projectAll = renderer._onZoomEnd;
    renderer._update = function() {
      updateDrawing.call(this);
      if(!this._map || this._map._animatingZoom || this._zoom === drawnZoom) return;
      drawnZoom = this._zoom;
      for(var id in this._layers) this._layers[id]._reset();
    };
    renderer._onZoomEnd = function() {
      projectAll.call(this);
      drawnZoom = this._map.getZoom();
    };
    return renderer;
  };
  var casing = make('zmPathsCasing', '389'), color = make('zmPaths', '390');
  this._pathSvgs = {casing: casing, color: color};
  var setScale = function(scale) { panes.forEach(function(pane) { pane.style.setProperty('--zm-path-zoom-scale', scale > 0 ? scale : 1); }); };
  var frame = null;
  var track = function() {
    var svg = panes[1].querySelector('svg');
    setScale(svg ? new DOMMatrixReadOnly(getComputedStyle(svg).transform).a : 1);
    frame = window.requestAnimationFrame(track);
  };
  map.on('zoomanim', function() {
    if(frame === null) track();
  });
  map.on('zoom', function() {
    if(frame !== null || !color._map) return;
    var zoom = map.getZoom();
    [casing, color].forEach(function(renderer) {
      if(Math.abs(zoom - renderer._zoom) >= 0.25) {
        renderer._update();
        renderer._updateTransform(map.getCenter(), zoom);
      }
    });
    setScale(map.getZoomScale(zoom, color._zoom));
  });
  // Done. (The arrows are spaced afresh for the new zoom as the drawing
  // places its layers again: _pathArrows.)
  map.on('zoomend', function() {
    if(frame !== null) window.cancelAnimationFrame(frame);
    frame = null;
    setScale(1);
  });
};

// A line's width for the zoom compensation (_pathRenderer), kept in step
// with its weight.
ZMap.prototype._pathWidthVar = function(layer) {
  var apply = function(l) {
    if(!l._path) return;
    if(l.options.weight != null) l._path.style.setProperty('--zm-w', l.options.weight + 'px');
  };
  if(layer.eachLayer) layer.eachLayer(apply); else apply(layer);
  return layer;
};

// A path's stream of arrows, as a layer of the paths' drawing
// (_setupPathRenderers), which places it as it does a line: when the map
// moves, zooms or is pinched. Between each step and the next shown one, the
// line is filled with arrows of near SPACING pixels, as many as fit, the
// last one's point stopping at the step's edge. Each arrow is its stem,
// drawn along the line itself (so it bends with it), and its head: a white
// edge round both, then the colour, and a shadow. Each is drawn over the
// next one along, its head over that one's stem. Through a zoom the drawing
// is scaled, so the stems' widths and the heads are scaled back (styles
// zmain.css: --zm-path-zoom-scale): only their places move.
ZMap.prototype.PATH_ARROW_SPACING = 56;
ZMap.prototype.PATH_ARROW = {stem: 5, head: 12, halfWidth: 8};

ZMap.prototype._pathArrowLayerClass = function() {
  if(ZMap._PathArrows) return ZMap._PathArrows;
  var NS = 'http://www.w3.org/2000/svg';
  var el = function(name, attrs, parent) {
    var node = document.createElementNS(NS, name);
    for(var k in attrs) node.setAttribute(k, attrs[k]);
    if(parent) parent.appendChild(node);
    return node;
  };
  var d = function(points) {
    return points.map(function(p, i) { return (i ? 'L' : 'M') + p.x.toFixed(1) + ' ' + p.y.toFixed(1); }).join('');
  };
  ZMap._PathArrows = L.Polyline.extend({
    options: {stroke: false, fill: false, interactive: false, noClip: true, smoothFactor: 0},
    initialize: function(latlngs, options) {
      L.Polyline.prototype.initialize.call(this, latlngs, options);
    },
    // A group of its own in place of a line's single path.
    onAdd: function() {
      this._renderer._initPath(this);
      this._path = el('g', {'class': 'zm-path-arrows'});
      this._path.style.setProperty('--zm-arrow-b', this.options.border + 'px');
      this._reset();
      this._renderer._addPath(this);
    },
    setBorder: function(b) {
      this.options.border = b;
      if(this._path) this._path.style.setProperty('--zm-arrow-b', b + 'px');
      return this;
    },
    // Laid out again only for a new zoom, or once the map has moved past
    // what was laid out (the drawing's bounds, and as much again around
    // them): not on every move.
    _update: function() {
      if(!this._map) return;
      var zoom = this._map.getZoom(), view = this._renderer._bounds;
      if(this._laid && this._laid.zoom === zoom && this._laid.version === this._version && view &&
        this._laid.bounds.contains(view)) return;
      this._updatePath();
    },
    _project: function() {
      L.Polyline.prototype._project.call(this);
      // (A new projection: a new zoom, or the map placed afresh.)
      this._version = (this._version || 0) + 1;
    },
    _updatePath: function() {
      var g = this._path, o = this.options, map = this._map;
      while(g.firstChild) g.removeChild(g.firstChild);
      var pts = this._rings && this._rings[0];
      if(!pts || pts.length < 2) return;
      // Thinner further out: from 55% at the map's furthest zoom to full
      // size halfway in.
      var zoom = map.getZoom(), min = map.getMinZoom(), max = map.getMaxZoom();
      var t = max > min ? (zoom - min) / (max - min) : 1;
      var f = .55 + .45 * Math.min(1, Math.max(0, t * 2));
      var a = {stem: o.arrow.stem * f, head: o.arrow.head * f, halfWidth: o.arrow.halfWidth * f};
      g.style.setProperty('--zm-arrow-scale', f);
      // What's laid out: what the drawing covers, and as much again around it.
      var view = this._renderer._bounds;
      var region = null;
      if(view) {
        var size = view.getSize();
        region = L.bounds(view.min.subtract(size.divideBy(2)), view.max.add(size.divideBy(2)));
        this._laid = {zoom: zoom, version: this._version, bounds: region};
      }
      var segments = this._segments(pts, o.stops, a, f);
      var arrows = [];
      segments.forEach(function(seg) {
        var cum = seg.cum, line = seg.points, total = cum[cum.length - 1];
        var at = function(dist) {
          dist = Math.max(0, Math.min(total, dist));
          var lo = 1, hi = cum.length - 1;
          while(lo < hi) { var mid = (lo + hi) >> 1; if(cum[mid] < dist) lo = mid + 1; else hi = mid; }
          var span = cum[lo] - cum[lo - 1] || 1, u = (dist - cum[lo - 1]) / span;
          return line[lo - 1].add(line[lo].subtract(line[lo - 1]).multiplyBy(u));
        };
        var between = function(x0, x1) {
          var out = [at(x0)];
          for(var j = 1; j < cum.length - 1; j++) if(cum[j] > x0 && cum[j] < x1) out.push(line[j]);
          out.push(at(x1));
          return out;
        };
        var length = total - seg.endGap;
        if(length < a.head * 1.2) return;
        // Each stretch's own arrow length: longer along a long stretch, as
        // a stroke drawn by hand would be, so they aren't all alike.
        var target = Math.min(170, Math.max(64, 40 + Math.sqrt(length) * 4.2)) * f;
        var count = Math.max(1, Math.round(length / target)), each = length / count;
        for(var n = 0; n < count; n++) {
          var tip = each * (n + 1);
          // (Its tail under the head before it; its stem a little into its
          // own head, so no edge shows between.)
          var tail = n === 0 ? 0 : each * n - a.head * .6;
          var stem = between(tail, tip - a.head + 3 * f);
          var tipPoint = at(tip), back = at(tip - Math.min(4, each / 2));
          if(region && !region.intersects(L.bounds(stem.concat([tipPoint])))) continue;
          arrows.push({stem: stem, tip: tipPoint, angle: Math.atan2(tipPoint.y - back.y, tipPoint.x - back.x) * 180 / Math.PI});
        }
      });
      // The last first: each arrow over the next one along. Its shadow is a
      // dark copy a pixel down (an SVG filter on each was slow to pan).
      var head = 'M0 0L' + (-a.head).toFixed(2) + ' ' + (-a.halfWidth).toFixed(2) + 'L' + (-a.head).toFixed(2) + ' ' + a.halfWidth.toFixed(2) + 'Z';
      var edge = '--zm-w: calc(' + a.stem.toFixed(2) + 'px + 2 * var(--zm-arrow-b) * var(--zm-arrow-scale))';
      var headEdge = 'stroke-width: calc(2 * var(--zm-arrow-b) * var(--zm-arrow-scale))';
      var frag = document.createDocumentFragment();
      for(var k = arrows.length - 1; k >= 0; k--) {
        var arrow = arrows[k], group = el('g', {'class': 'zm-path-arrow'}, frag), path = d(arrow.stem);
        var place = 'translate(' + arrow.tip.x.toFixed(1) + ' ' + arrow.tip.y.toFixed(1) + ') rotate(' + arrow.angle.toFixed(1) + ')';
        var shadow = el('g', {'class': 'zm-path-arrow-shadow'}, group);
        el('path', {d: path, fill: 'none', stroke: '#000', 'stroke-linecap': 'butt', 'stroke-linejoin': 'round', style: edge}, shadow);
        el('path', {d: head, fill: '#000', stroke: '#000', 'stroke-linejoin': 'round', style: headEdge},
          el('g', {'class': 'zm-path-arrow-scale'}, el('g', {transform: place}, shadow)));
        el('path', {d: path, fill: 'none', stroke: '#fff', 'stroke-linecap': 'butt', 'stroke-linejoin': 'round',
          'class': 'zm-path-arrow-edge', style: edge}, group);
        el('path', {d: head, fill: o.color, stroke: '#fff', 'stroke-linejoin': 'round', 'paint-order': 'stroke',
          'class': 'zm-path-arrow-head', style: headEdge}, el('g', {'class': 'zm-path-arrow-scale'}, el('g', {transform: place}, group)));
        el('path', {d: path, fill: 'none', stroke: o.color, 'stroke-linecap': 'butt', 'stroke-linejoin': 'round',
          'class': 'zm-path-arrow-stem', style: '--zm-w: ' + a.stem.toFixed(2) + 'px'}, group);
      }
      g.appendChild(frag);
    },
    // The line from each stop to the next, in pixels, finely spaced, with
    // the stretches that run close to another stretch of the same path set
    // apart: each moved to its own right (as traffic keeps to its side),
    // easing back to the steps at its ends. Out and back along one way, the
    // two then run side by side; two going the same way, the later one moves
    // across. Returns [{points, cum, endGap}].
    _segments: function(pts, stops, a, f) {
      var spacing = 6;
      var segs = [];
      for(var si = 0; si + 1 < stops.length; si++) {
        var raw = pts.slice(stops[si][0], stops[si + 1][0] + 1);
        if(raw.length < 2) continue;
        // Evenly spaced points, every few pixels (corners kept).
        var points = [raw[0]];
        for(var i = 1; i < raw.length; i++) {
          var from = raw[i - 1], to = raw[i], len = from.distanceTo(to), parts = Math.max(1, Math.round(len / spacing));
          for(var k = 1; k <= parts; k++) points.push(from.add(to.subtract(from).multiplyBy(k / parts)));
        }
        segs.push({index: si, points: points, endGap: stops[si + 1][1]});
      }
      var measure = function(seg) {
        var cum = [0];
        for(var i = 1; i < seg.points.length; i++) cum.push(cum[i - 1] + seg.points[i - 1].distanceTo(seg.points[i]));
        seg.cum = cum;
      };
      segs.forEach(measure);
      // Which points are close to another stretch's: a grid of cells.
      var near = 15, ends = 22, cell = near, grid = {};
      var keyOf = function(p) { return Math.floor(p.x / cell) + ',' + Math.floor(p.y / cell); };
      var direction = function(seg, i) {
        var p = seg.points, a0 = p[Math.max(0, i - 2)], a1 = p[Math.min(p.length - 1, i + 2)];
        var dx = a1.x - a0.x, dy = a1.y - a0.y, l = Math.hypot(dx, dy) || 1;
        return [dx / l, dy / l];
      };
      segs.forEach(function(seg, s) {
        var total = seg.cum[seg.cum.length - 1];
        seg.points.forEach(function(p, i) {
          if(seg.cum[i] < ends || total - seg.cum[i] < ends) return;
          var key = keyOf(p);
          (grid[key] || (grid[key] = [])).push([s, i]);
        });
      });
      var moved = false;
      segs.forEach(function(seg, s) {
        var total = seg.cum[seg.cum.length - 1];
        seg.shift = seg.points.map(function(p, i) {
          if(seg.cum[i] < ends || total - seg.cum[i] < ends) return 0;
          var cx = Math.floor(p.x / cell), cy = Math.floor(p.y / cell), best = 0;
          for(var x = cx - 1; x <= cx + 1; x++) for(var y = cy - 1; y <= cy + 1; y++) {
            (grid[x + ',' + y] || []).forEach(function(hit) {
              if(hit[0] === s || best === 2) return;
              var other = segs[hit[0]], q = other.points[hit[1]];
              if(p.distanceTo(q) > near) return;
              var mine = direction(seg, i), theirs = direction(other, hit[1]);
              var dot = mine[0] * theirs[0] + mine[1] * theirs[1];
              // (Only running alongside, not crossing: within about 25°.)
              if(Math.abs(dot) < .9) return;
              var same = dot > 0;
              // Opposite ways: both to their right. The same way: the later
              // one across, the earlier where it is.
              var want = !same ? 1 : hit[0] < s ? 2 : 0;
              if(want > best) best = want;
            });
          }
          if(best) moved = true;
          return best;
        });
      });
      if(!moved) return segs;
      var offset = (a.stem / 2 + 2.5 * Math.max(f, .7) + 1.5);
      segs.forEach(function(seg) {
        var n = seg.points.length, raw = seg.shift, total = seg.cum[n - 1];
        if(!raw.some(Boolean)) return;
        // Held a little past where it's close, then eased in and out.
        var held = raw.map(function(v, i) {
          var m = 0;
          for(var j = Math.max(0, i - 5); j <= Math.min(n - 1, i + 5); j++) m = Math.max(m, raw[j]);
          return m;
        });
        var eased = held.map(function(v, i) {
          var sum = 0, count = 0;
          for(var j = Math.max(0, i - 14); j <= Math.min(n - 1, i + 14); j++) { sum += held[j]; count++; }
          // (Smoothstep: no corner where it starts or stops.)
          var u = sum / count / 2, v = Math.min(1, Math.max(0, u));
          return (v * v * (3 - 2 * v)) * 2;
        });
        seg.points = seg.points.map(function(p, i) {
          var taper = Math.min(1, seg.cum[i] / (ends * 2), (total - seg.cum[i]) / (ends * 2));
          taper = taper * taper * (3 - 2 * taper);
          var amount = eased[i] * taper * offset;
          if(!amount) return p;
          var dir = direction(seg, i);
          // (Its right, on a screen whose y runs down.)
          return L.point(p.x - dir[1] * amount, p.y + dir[0] * amount);
        });
        measure(seg);
      });
      return segs;
    }
  });
  return ZMap._PathArrows;
};

// line: the path's points (latlngs); stops: [[index in line, gap]] where the
// stream stops and starts again. Returns the layer (setBorder(b) for hover).
ZMap.prototype._pathArrows = function(renderer, line, stops, color, border) {
  var Arrows = this._pathArrowLayerClass();
  return new Arrows(line, {renderer: renderer, stops: stops, color: color, border: border,
    spacing: this.PATH_ARROW_SPACING, arrow: this.PATH_ARROW});
};
