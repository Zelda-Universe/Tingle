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
  return this._getCategoryMarkers(category).length > 0;
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
  this.selectedArea = null; // Its address is cleared, too.
  var name = category.displayTitle || category.name;
  // No description: the title says what the page is, and the list is the
  // point (the area page's description has no category equivalent).
  var page = $('<div class="area-detail-page category-detail-page">' +
    '<h2 class="popupTitle"></h2><div class="area-marker-groups"></div></div>');
  page.find('h2').text(name);
  // The database's name in the tab title: the same one the server's page
  // title uses (index.php), so a reload doesn't change it.
  document.title = category.name + ' Map - ' + seoGameName(this.mapOptions) + ' - Zelda Maps';
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
    (groups[marker.categoryId] || (groups[marker.categoryId] = [])).push(marker);
  });
  var content = page.find('.area-marker-groups');
  // In the order of the category list, as drawn (grouped or not).
  var listOrder = this._categoryListOrder();
  var position = function(id) { return id in listOrder ? listOrder[id] : Infinity; };
  Object.keys(groups).sort(function(a, b) {
    return position(a) - position(b);
  }).forEach(function(id) {
    // The category's own markers list under the page's title (whose small
    // heading would repeat it); a child category's keep their own.
    var isSelf = String(id) === String(category.id);
    var group = $('<section class="poi-category-groups">' +
      (isSelf ? '' : '<div class="poi-category-heading"><h3 class="area-category-title"></h3></div>') +
      '<ul class="marker-list"></ul></section>');
    group.attr('data-category-id', id);
    if(!isSelf) {
      var groupCompleted = groups[id].filter(completed).length;
      group.find('h3').text((zmap.categories[id] && zmap.categories[id].name || '') + ' (' + groupCompleted + '/' + groups[id].length + ' Complete)');
    }
    groups[id].sort(function(a, b) { return (a.title || a.name || '').localeCompare(b.title || b.name || ''); }).forEach(function(marker) {
      var entry = new MarkerListEntry(marker, { categories: zmap.categories, onClick: function() {
        control.returnNextPageTo({ category: category });
        zMap.goTo({ marker: marker.id, panTo: false }, true);
        if(control.viewStyleBottomSlide) control.openDrawerDefaultPartial();
      }});
      entry.domNode.addClass('search-marker-list-entry area-marker-list-entry');
      // The location under the name, as search results show it (the entry's
      // search-marker-list-entry class hides the description, so this is the
      // second line).
      if(typeof getMarkerLocationName === 'function') {
        var locationText = getMarkerLocationName(marker);
        if(locationText) entry.domNode.find('.details').append($('<div class="location"></div>').text(locationText));
      }
      if(marker.complete === true || marker.complete == 1) {
        entry.domNode.addClass('area-marker-completed');
        entry.iconNode.append('<span class="area-marker-check" aria-label="Completed"><i class="fas fa-check" aria-hidden="true"></i></span>');
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
  $(control._contents).find('section[data-category-id]').each(function() {
    var id = this.getAttribute('data-category-id');
    $(this).find('h3').text((zmap.categories[id] && zmap.categories[id].name || '') + ' (' + count(markers.filter(function(m) { return m.categoryId == id; })) + ')');
  });
};
