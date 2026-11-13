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
        return marker ? {latLng: marker.getLatLng(), submapId: marker.submapId, marker: marker, shown: true, step: step} : null;
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
  if(path.scope !== 'official') return false;
  var categoryId = path.categoryId || (path.lead && path.lead.categoryId);
  var category = categoryId && this.categories[categoryId];
  return !!category && category.checked !== false && !(path.kind === 'single' && path.lead && !this.map.hasLayer(path.lead));
};

// A path's own pages (PathEditor.js): while one is open, its path is the
// selected one, drawn on top with a white outline.
ZMap.prototype.PATH_PAGES = ['path', 'pathEditor', 'pathHistory', 'pathRevision'];

ZMap.prototype._pathPageChanged = function(type) {
  var open = this.PATH_PAGES.indexOf(type) !== -1;
  if(open === !!this._pathPageOpen) return;
  this._pathPageOpen = open;
  // Leaving its pages, the path leaves the address too.
  if(!open) {
    var url = new URL(window.location.href);
    if(url.searchParams.has('path')) {
      url.searchParams.delete('path');
      history.replaceState(history.state, '', url.toString());
    }
  }
  if(this.paths) this.drawPaths();
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
    if(path.loops) line.push(line[0]);
    var selected = path === selectedPath;
    // The selected path's white outline; the others get a fainter one while
    // hovered, so it's clear they can be clicked.
    var outline = L.polyline(line, {color: '#fff', weight: selected ? 10 : 8, opacity: selected ? 1 : 0, interactive: false,
      lineCap: 'round', lineJoin: 'round', className: 'zm-path-outline' + (selected ? '' : ' zm-path-outline-hover')}).addTo(zmap._pathLayer);
    var visible = L.polyline(line, {color: color, weight: selected ? 5 : 3.5, opacity: selected ? 1 : .9, interactive: false,
      dashArray: path.scope === 'user' ? '8 6' : null, className: 'zm-path-line'}).addTo(zmap._pathLayer);
    // The line itself opens the path's page (not while one's being edited:
    // clicks then add steps and drop pins).
    if(!path._preview && !zmap._pathEditing) {
      var hit = L.polyline(line, {color: '#000', opacity: 0, weight: 18, bubblingMouseEvents: false, className: 'zm-path-hit'})
        .on('click', function(e) { L.DomEvent.stop(e); zmap.openPathPage(path.slug); })
        .addTo(zmap._pathLayer);
      if(!selected) {
        hit.on('mouseover', function() {
          outline.setStyle({opacity: .85});
          visible.setStyle({weight: 5, opacity: 1});
        }).on('mouseout', function() {
          outline.setStyle({opacity: 0});
          visible.setStyle({weight: 3.5, opacity: .9});
        });
      }
      // Its name by the pointer, as a hint at what clicking opens.
      if(!L.Browser.mobile) hit.bindTooltip(zmap._pathEsc ? zmap._pathEsc(path.name) : path.name, {sticky: true, direction: 'top', offset: [0, -10], className: 'zm-path-tooltip'});
    }
    L.polylineDecorator(line, {patterns: [{offset: 24, repeat: 90, symbol: L.Symbol.arrowHead({pixelSize: selected ? 13 : 11,
      pathOptions: {fill: true, fillColor: color, fillOpacity: 1, color: '#fff', weight: selected ? 2 : 0}})}]}).addTo(zmap._pathLayer);
    // Numbers on a numbered path's steps; a named point of a user's path gets
    // a dot with its name (hidden waypoints get nothing).
    var n = 0;
    here.forEach(function(p) {
      if(!p.shown) return;
      n++;
      if(path.numbered) {
        L.marker(p.latLng, {interactive: false, keyboard: false, zIndexOffset: 1000, icon: L.divIcon({
          className: 'zm-path-step', iconSize: [22, 22], iconAnchor: p.marker ? [-4, 30] : [11, 11],
          html: '<span style="--path-color:' + color + '">' + n + '</span>'})}).addTo(zmap._pathLayer);
      }
      if(!p.marker) {
        var dot = L.circleMarker(p.latLng, {radius: 6, color: '#fff', weight: 2, fillColor: color, fillOpacity: 1}).addTo(zmap._pathLayer);
        if(p.step.name) dot.bindTooltip(p.step.name, {direction: 'right', offset: [8, 0], className: 'zm-path-pin'});
      }
    });
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
  this.map.fitBounds(L.latLngBounds(here.map(function(p) { return p.latLng; })).pad(.15), {animate: false});
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
