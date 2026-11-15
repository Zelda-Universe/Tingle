// Category pages: clicking a category in the category list focuses its
// markers (the existing behaviour) and also opens a page, styled like an area
// page, listing all of the category's markers. It shares ?category=<slug>
// with the server: lib/common/seo.php's seoLandingCategories gives the same
// categories their own title, description, canonical address and sitemap
// entry, so the address is valid on reload and indexable.
// The back button unfocuses (every category checked again, as clicking the
// focused category would) and returns to the category list.

// The address the server gives the category (?category=): its name,
// lower-cased, with '&' as "and" and everything else non-alphanumeric as
// dashes. Matches seoSlug(seoPlainText(...)) in lib/common/seo.php; a few
// entity forms are undone first, as the server's html_entity_decode does.
ZMap.prototype.categoryURLKey = function(category) {
  if(category && category.slug) return category.slug;
  var name = String((category && (category.name || '')) || '');
  name = name
    .replace(/&#(\d+);/g, function(match, code) { return String.fromCharCode(Number(code)); })
    .replace(/&amp;/gi, '&')
    .replace(/&quot;/gi, '"')
    .replace(/&apos;/gi, "'")
    .replace(/&lt;/gi, '<')
    .replace(/&gt;/gi, '>')
    .replace(/&nbsp;/gi, ' ');
  // Entities the server decodes to letters (&#65; → A) are a corner of a
  // corner; the common ones are handled above, the rest read as dashes.
  name = name.replace(/&#?\w+;/g, ' ');
  var slug = name.toLowerCase().replace(/&/g, ' and ');
  return slug.replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
};

// The same rule the server uses (seoLandingCategories): a regular (not
// label) category inside a group, visible, with at least one visible marker.
// Section roots and label categories (Area, Places, Region) focus as before
// but have no page.
ZMap.prototype.categoryHasPage = function(category) {
  if(!category || !category.parent_id || String(category.marker_category_type_id) !== '1') return false;
  if(category.visible === false) return false;
  if(this._getCategoryMarkers(category).length > 0) return true;
  // A category that's a path whose markers are in other categories (OoT's
  // Trading Sequence): its page is the path's (Paths.js _categoryPaths).
  return !!(this._categoryPaths && this._categoryPaths(category).single);
};

// Every marker in the category or one of its children (what focusing it
// shows), as the area page lists the markers in an area: the hidden and the
// labels stay out.
ZMap.prototype._getCategoryMarkers = function(category) {
  var zmap = this;
  var ids = Object.create(null);
  var collect = function(c) {
    if(!c || ids[c.id]) return;
    ids[c.id] = true;
    (c.childrenArr || []).forEach(collect);
  };
  collect(category);
  return this.getMarkers().filter(function(marker) {
    if(marker.categoryTypeId == 3 || marker.dbVisible == 0) return false;
    var markerCategory = zmap.categories[marker.categoryId];
    if(!markerCategory || markerCategory.visible === false) return false;
    return !!ids[marker.categoryId];
  });
};

// The page itself, in the structure of the area page (area-detail-page), so
// it shares the scrolling compact title bar, the pills and the list styles.
ZMap.prototype._showCategoryPage = function(category) {
  var zmap = this, control = this.mapControl;
  this.selectedCategory = category;
  // A category that is one path (Paths.js) opens as that path's page; one
  // with several, or with markers of its own too, lists them first.
  var categoryPaths = this._categoryPaths ? this._categoryPaths(category) : {paths: []};
  if(categoryPaths.single && this.openPathPage) {
    this.openPathPage(categoryPaths.single, {back: this._categoryPageBackAction(control)});
    return;
  }
  this.selectedArea = null; // Its address is cleared, too.
  var name = category.displayTitle || category.name;
  var page = $('<div class="area-detail-page category-detail-page">' +
    '<h2 class="popupTitle"></h2><div class="area-marker-groups"></div></div>');
  page.find('h2').text(name);
  // The database's name in the tab title: the same one the server's page
  // title uses (index.php), so a reload doesn't change it.
  document.title = category.name + ' - ' + seoGameName(this.mapOptions) + ' - Zelda Maps';
  var pills = $('<div class="area-header-pills"></div>').insertAfter(page.find('h2'));
  var markers = this._getCategoryMarkers(category);
  function completed(marker) { return marker.complete === true || marker.complete == 1; }
  if(markers.length) {
    pills.append(document.createTextNode(' '));
    pills.append($('<p class="area-completion-pill marker-coordinate-pill"></p>').text(
      markers.filter(completed).length + '/' + markers.length + ' Complete'));
  }
  var groups = Object.create(null);
  markers.forEach(function(marker) {
    var region = zmap.getMarkerRegion && zmap.getMarkerRegion(marker);
    var location = region && (region.name || region.shortName);
    if(!location && zmap.markerAreaLink) {
      var area = zmap.markerAreaLink(marker);
      location = area && (area.title || area.label);
    }
    if(!location) {
      var layer = (zmap.maps || []).find(function(layer) { return layer.originalId == marker.mapId; });
      location = layer && (layer.mapName || layer.title) || 'Other Locations';
    }
    (groups[location] || (groups[location] = [])).push(marker);
  });
  var content = page.find('.area-marker-groups');
  if(category.description) {
    $('<div class="area-description"></div>').text(category.description).insertAfter(pills);
  }
  if(categoryPaths.paths.length) {
    var pathSection = $('<section class="poi-category-groups category-paths">' +
      '<div class="poi-category-heading"><h3 class="area-category-title">Paths</h3></div><div class="path-compact-list"></div></section>');
    categoryPaths.paths.forEach(function(path) {
      // A compact path card (PathEditor.js), with the path's thumbnail.
      var button = $(zmap._pathListItemHTML(path));
      button.on('click', function() {
        zmap.openPathPage(path, {back: function() { control._navigatingBack = true; zmap._showCategoryPage(category); }});
      });
      pathSection.find('.path-compact-list').append(button);
    });
    content.append(pathSection);
  }
  var currentMap = control.getCurrentMap ? control.getCurrentMap().mapId : null;
  var onCurrentMap = function(name) {
    return groups[name].some(function(marker) { return String(marker.mapId) === String(currentMap); });
  };
  // Current-map regions first, alphabetical within both sets.
  Object.keys(groups).sort(function(a, b) {
    return Number(onCurrentMap(b)) - Number(onCurrentMap(a)) || a.localeCompare(b);
  }).forEach(function(id) {
    var group = $('<section class="poi-category-groups">' +
      '<div class="poi-category-heading"><h3 class="area-category-title"></h3></div>' +
      '<ul class="marker-list"></ul></section>');
    group.attr('data-region', id);
    group.attr('data-region-marker-ids', JSON.stringify(groups[id].map(function(marker) { return String(marker.id); })));
    group.attr('data-region-maps', JSON.stringify(groups[id].map(function(marker) { return String(marker.mapId); })));
    var groupCompleted = groups[id].filter(completed).length;
    group.find('h3').text(id + ' (' + groupCompleted + '/' + groups[id].length + ' Complete)');
    group.find('.poi-category-heading').append(
      $('<button type="button" class="poi-category-toggle category-region-zoom">Zoom</button>')
        .attr('aria-label', 'Zoom to ' + id)
        .on('click', function() { zmap.zoomToCategoryRegion(groups[id], id); })
    );
    groups[id].sort(function(a, b) { return (a.title || a.name || '').localeCompare(b.title || b.name || ''); }).forEach(function(marker) {
      var entry = new MarkerListEntry(marker, { categories: zmap.categories, completionCheckbox: true, onClick: function() {
        control.returnNextPageTo({ category: category });
        zmap.navigateToMarker(marker.id);
      }});
      entry.domNode.addClass('search-marker-list-entry area-marker-list-entry');
      // The location under the name, as search results show it (the entry's
      // search-marker-list-entry class hides the description, so this is the
      // second line).
      if(typeof getMarkerLocationName === 'function') {
        var locationText = getMarkerLocationName(marker);
        if(locationText) entry.domNode.find('.details').append($('<div class="location"></div>').text(locationText));
      }
      group.find('ul').append(entry.domNode);
    });
    content.append(group);
  });
  // Back: the existing unfocus, the list, the game's title, the category
  // out of the address. Set before setContent, which consumes it (HeaderBar
  // re-sets it when a search re-shows the page's saved content).
  control._nextPageBack = this._categoryPageBackAction(control);
  control.setContent(page.contents(), 'category-' + category.id);
  var wrapper = control._contents.querySelector('.menu-cat-content-inner');
  if(wrapper) wrapper.classList.add('area-detail-page');
};

ZMap.prototype.sortCategoryRegionsForCurrentMap = function() {
  if(this._preserveCategoryRegionOrder) return;
  var control = this.mapControl;
  if(!control || !/^category-/.test(control.getContentType() || '')) return;
  var root = control._contents.querySelector('.area-marker-groups');
  if(!root) return;
  var mapId = String(control.getCurrentMap().mapId);
  var sections = Array.from(root.children);
  var current = function(section) {
    return JSON.parse(section.getAttribute('data-region-maps') || '[]').includes(mapId);
  };
  sections.sort(function(a, b) {
    return Number(current(b)) - Number(current(a)) ||
      (a.getAttribute('data-region') || '').localeCompare(b.getAttribute('data-region') || '');
  }).forEach(function(section) { root.appendChild(section); });
};

// Fit the region artwork, never just this category's points within it.
ZMap.prototype.zoomToCategoryRegion = function(markers, regionName) {
  if(!markers || !markers.length) return;
  var map = this.map, control = this.mapControl, current = control.getCurrentMap();
  var first = markers.find(function(marker) {
    return marker.mapId == current.mapId && marker.submapId == current.subMapId;
  }) || markers.find(function(marker) { return marker.mapId == current.mapId; }) || markers[0];
  var targetSubmap = first.submapId;
  if(first.mapId == current.mapId && first.globalMarker == 1) targetSubmap = current.subMapId;
  var layer = (this.maps || []).find(function(layer) {
    return layer.originalId == first.mapId && layer.defaultSubMapId == targetSubmap;
  }) || (this.maps || []).find(function(layer) { return layer.originalId == first.mapId; });
  var region = layer && regionName && this._layerRegions(layer).find(function(region) {
    return region.submapId == targetSubmap && (region.name === regionName || region.shortName === regionName);
  });
  var targetMarker = targetSubmap == first.submapId ? first : Object.assign({}, first, {submapId: targetSubmap});
  if(!region && this.getMarkerRegion) {
    region = this.getMarkerRegion(targetMarker) || this.getMarkerRegion(targetMarker, 'area');
  }
  var bounds = region && region.bounds;
  if(!bounds && layer && (!regionName || regionName === (layer.mapName || layer.title))) {
    bounds = layer.mapBounds || layer.options && layer.options.bounds;
  }
  try { bounds = bounds && L.latLngBounds(bounds); } catch(e) { bounds = null; }
  if(!bounds || !bounds.isValid()) return;
  var preserveOrder = this._preserveCategoryRegionOrder;
  this._preserveCategoryRegionOrder = true;
  try { control.changeMapOnly(first.mapId, targetSubmap); }
  finally { this._preserveCategoryRegionOrder = preserveOrder; }
  this._categoryZoomRegion = !isOcarina(this.mapOptions.shortName) ? region : null;
  if(this.updateRegionBorders) this.updateRegionBorders();
  this._fitBoundsToVisibleMap(bounds);
};

// Fit bounds to the part of the map not under the panel (desktop) or the
// drawer (phones), with room for the header: a region's zoom, a path's.
// opts.maxDrawerShare caps how much of the map a tall drawer may take from
// it, so something still shows above a drawer that's open most of the way.
ZMap.prototype._fitBoundsToVisibleMap = function(bounds, opts) {
  var map = this.map, control = this.mapControl;
  opts = opts || {};
  var rect = map.getContainer().getBoundingClientRect();
  var drawer = control.getContainer().getBoundingClientRect();
  var topLeft = [24, 72], bottomRight = [24, 24];
  if(control.viewStyleBottomSlide) {
    // Where the drawer is going, when it's still on its way there.
    var drawerTop = drawer.top;
    if(Number.isFinite(opts.drawerTargetTop)) {
      var base = Number.isFinite(control._mobileDrawerBaseTop) ? control._mobileDrawerBaseTop :
        drawer.top - (Number.parseFloat(control._container.style.top) || 0);
      drawerTop = base + opts.drawerTargetTop;
    }
    var covered = Math.max(0, rect.bottom - drawerTop);
    if(opts.maxDrawerShare) covered = Math.min(covered, rect.height * opts.maxDrawerShare);
    bottomRight[1] += covered;
  } else if(window.getComputedStyle(control.getContainer()).display !== 'none') {
    if(control.options.position.endsWith('left')) topLeft[0] += drawer.width;
    else bottomRight[0] += drawer.width;
  }
  var threshold = map.options.zoomAnimationThreshold;
  map.options.zoomAnimationThreshold = Infinity;
  try {
    var fitOptions = {paddingTopLeft: topLeft, paddingBottomRight: bottomRight,
      maxZoom: Number.isFinite(opts.maxZoom) ? Math.min(opts.maxZoom, map.getMaxZoom()) : map.getMaxZoom(),
      animate: opts.animate !== false && !window.matchMedia('(prefers-reduced-motion: reduce)').matches,
      duration: .25, easeLinearity: .2};
    // opts.fly: flown there (out and back in), for a longer way.
    if(opts.fly && fitOptions.animate) map.flyToBounds(bounds, L.extend(fitOptions, {duration: .8}));
    else map.fitBounds(bounds, fitOptions);
  } finally { map.options.zoomAnimationThreshold = threshold; }
};

// From the category list: focus first (CategoryButton does it), then the
// page. No-op for categories the server doesn't give a page (sections,
// labels), which keep the plain focus behaviour.
ZMap.prototype.openCategoryPage = function(category) {
  if(!this.categoryHasPage(category)) return;
  var control = this.mapControl;
  if(!control) return;
  this._closeNewMarker();
  this._showCategoryPage(category);
  if(control.viewStyleBottomSlide) control.openDrawerDefaultPartial();
  this.updateUrl();
};

// ?category= on load (a shared link, or a reload of one): the server already
// checked only this category (window.zmapLandingCategoryId, from index.php)
// and finalLoad fitted the map to it; this opens the page.
ZMap.prototype.restoreCategoryFromURL = function() {
  var params = new URL(window.location.href).searchParams;
  var slug = params.get('category');
  if(!slug) return false;
  // A marker link takes precedence: index.php titles it as the marker (and
  // canonicals it to the category's page), so the marker page wins.
  if(params.has('marker')) return false;
  var category = null;
  if(window.zmapLandingCategoryId && this.categories[window.zmapLandingCategoryId]) {
    // The server's resolution of the slug: authoritative over the client's.
    category = this.categories[window.zmapLandingCategoryId];
  } else {
    category = this._categoryBySlug(slug);
  }
  if(!category) {
    // A slug nobody has: clear it rather than leaving a dead parameter.
    var url = new URL(window.location.href);
    url.searchParams.delete('category');
    window.history.replaceState(Object.assign({}, window.history.state), '', url.href);
    return false;
  }
  var control = this.mapControl;
  if(!control) return false;
  control._restoringInitialPage = true;
  try {
    this._showCategoryPage(category);
    if(control.viewStyleBottomSlide) {
      control.openDrawerDefaultPartial();
      // finalLoad focused (switched map, checked the category) but deferred
      // the fit while the drawer was closed: frame the markers once the
      // drawer has settled. Links that set their own zoom keep that view.
      if(!params.get('zoom')) {
        window.setTimeout(function() {
          zMap.focusSingleMapCategory(category);
        }, 400);
      }
    }
  } finally {
    control._restoringInitialPage = false;
  }
  return true;
};

// The first category the server would page for this slug (the same first-
// with-markers rule, so a name used twice in one game resolves alike).
ZMap.prototype._categoryBySlug = function(slug) {
  var zmap = this;
  return (zmap.categoriesArr || []).find(function(category) {
    return !!category.parent_id && String(category.marker_category_type_id) === '1' &&
      zmap.categoryURLKey(category) === slug;
  }) || null;
};

// The map view before the category's focus moved it, and where the fit
// landed (focusSingleMapCategory records both as it runs): the page's Back
// restores the earlier view while the map is still at the fit, as the area
// page does (_rememberAreaReturnView, scripts/services/AreaSearch.js). A pan
// or zoom in the meantime is the user's own and stays where it is.
ZMap.prototype._rememberCategoryReturnView = function() {
  var current = this.mapControl.getCurrentMap();
  this._categoryReturnView = {
    mapId: current.mapId, subMapId: current.subMapId,
    center: this.map.getCenter(), zoom: this.map.getZoom(),
    arrived: null
  };
};

ZMap.prototype._recordCategoryReturnArrival = function(arrival) {
  var zmap = this, view = this._categoryReturnView;
  if(!view) return;
  var map = this.map;
  view.arrived = arrival || { center: map.getCenter(), zoom: map.getZoom() };
  // The target can be clamped once the fit lands (the artwork's bounds, the
  // drawer and ad insets), or the map size can still be settling on phones:
  // where the map actually ends up is where \"hasn't moved\" is measured
  // from. A once-only listener: a later move of the user's is not it.
  var settle = function() {
    map.off('moveend', settle);
    map.off('zoomend', settle);
    if(zmap._categoryReturnView !== view) return; // consumed or superseded
    view.arrived = { center: map.getCenter(), zoom: map.getZoom() };
  };
  map.once('moveend', settle);
  map.once('zoomend', settle);
};

// Called as the category page closes. Returns true when it moved the map
// back to the pre-focus view.
ZMap.prototype.restoreCategoryReturnView = function() {
  var view = this._categoryReturnView, map = this.map;
  this._categoryReturnView = null;
  if(!view || !view.arrived) return false;
  var current = this.mapControl.getCurrentMap();
  if(current.mapId != view.mapId || current.subMapId != view.subMapId) return false;
  var moved = map.latLngToContainerPoint(map.getCenter()).distanceTo(map.latLngToContainerPoint(view.arrived.center));
  if(Math.abs(map.getZoom() - view.arrived.zoom) > 0.01 || moved > 2) return false;
  var reducedMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  // Leaflet snaps a zoom jump of more than four levels instead of gliding.
  var threshold = map.options.zoomAnimationThreshold;
  map.options.zoomAnimationThreshold = Infinity;
  try { map.setView(view.center, view.zoom, { animate: !reducedMotion, duration: .25, easeLinearity: .2 }); }
  finally { map.options.zoomAnimationThreshold = threshold; }
  return true;
};

// The page's Back action: the map back to its pre-focus view (when the user
// hasn't moved it), the existing unfocus, then the category list (and the
// phone drawer back to the list's stop). The restore runs first, so the
// unfocus's refresh culls the pre-focus view's markers, not the fitted
// view's (which would flash a burst of them onto the map on the way back).
ZMap.prototype._categoryPageBackAction = function(control) {
  var zmap = this;
  return function() {
    if(zmap.restoreCategoryReturnView) zmap.restoreCategoryReturnView();
    zmap._unfocusCategories();
    zmap._closeCategoryPage();
    control.resetContent();
    if(control.viewStyleBottomSlide) control.openDrawerDefaultPartial();
  };
};

// The existing unfocus: clicking the one focused category does auto mode,
// everything checked, refresh. The page's Back button does the same.
ZMap.prototype._unfocusCategories = function() {
  var menu = this.mapControl && this.mapControl._categoryMenu;
  if(!menu) return;
  menu.modeAutomatic = true;
  menu.toggleAll(true);
  this.refreshMap(menu._categoryTreeArr || menu._categories);
};

// What closing the page leaves behind: the game's own title, and the
// category out of the address (syncDrawerPageURL keeps it that way from
// then on, but the button should not wait for the content swap).
ZMap.prototype._closeCategoryPage = function() {
  this._categoryZoomRegion = null;
  if(!this.selectedCategory) return;
  this.selectedCategory = null;
  var gameName = seoGameName(this.mapOptions || {});
  if(gameName) document.title = gameName + ' Interactive Map - Zelda Maps';
  var url = new URL(window.location.href);
  if(url.searchParams.has('category')) {
    url.searchParams.delete('category');
    window.history.replaceState(Object.assign({}, window.history.state), '', url.href);
  }
};

// Its completion counts while it's open, as the area page's do when a
// marker is completed from its page.
ZMap.prototype.updateCategoryCompletionCounts = function() {
  var control = this.mapControl, zmap = this;
  if(!control || !this.selectedCategory || !/^category-\d+$/.test(control.getContentType() || '')) return;
  var markers = this._getCategoryMarkers(this.selectedCategory);
  function count(rows) {
    return rows.filter(function(m) { return m.complete === true || m.complete == 1; }).length + '/' + rows.length + ' Complete';
  }
  $(control._contents).find('.area-completion-pill').text(markers.length ? count(markers) : '');
  $(control._contents).find('section[data-region-marker-ids]').each(function() {
    var ids = JSON.parse(this.getAttribute('data-region-marker-ids'));
    $(this).find('h3').text(this.getAttribute('data-region') + ' (' + count(markers.filter(function(m) { return ids.includes(String(m.id)); })) + ')');
  });
};
