// Switching games without a reload (staff test; off unless turned on in
// Settings). Every way to another game (Switch Game, History, Recent
// Community Edits, notifications, followed markers, profiles, path
// revisions) goes through openGameURL(url): another game's address. With
// this off, or whenever it isn't safe to switch in place, that address is
// loaded as it always was: a full page load. So the site works as it did
// unless this is turned on, and whatever it doesn't handle falls back to
// what it always did.
//
// Switching in place: the address changes (with history, so Back returns to
// the game before), the current map is taken apart (Leaflet's map and its
// controls, and every page-wide listener, timer and element it set up:
// zmap.js _onPage, _onCleanup), and a new ZMap is made for the new game and
// started as a page load starts one (zmain.js, zmain.lib.js zMapInit), from
// the new address. A new ZMap rather than the old one reset: everything a
// map keeps about its game starts empty.

ZMap.prototype.GAME_SWITCH_KEY = 'zeldamapsGameSwitch';
// Admins and up (Moderator 10, Admin 15, Super Admin 20).
ZMap.prototype.GAME_SWITCH_LEVEL = 15;

ZMap.prototype._gameSwitchAllowed = function() {
  var user = this.getUser && this.getUser();
  return !!user && Number(user.level) >= this.GAME_SWITCH_LEVEL;
};

ZMap.prototype._gameSwitchOn = function() {
  try { return this._gameSwitchAllowed() && localStorage.getItem(this.GAME_SWITCH_KEY) === 'on'; } catch(e) { return false; }
};

ZMap.prototype._setGameSwitch = function(on) {
  try {
    if(on) localStorage.setItem(this.GAME_SWITCH_KEY, 'on');
    else localStorage.removeItem(this.GAME_SWITCH_KEY);
  } catch(e) {}
};

// A game's short name as addresses have it, matching across OoT's two
// names (OoT, OoTR).
ZMap.prototype._sameGame = function(a, b) {
  if(!a || !b) return false;
  if(isOcarina(a) && isOcarina(b)) return true;
  return String(a).toLowerCase() === String(b).toLowerCase();
};

// Why the current page can't be swapped out now (null: it can). Each falls
// back to a full load, as before.
ZMap.prototype._gameSwitchBlocker = function() {
  if(!this._gameSwitchOn()) return 'off';
  if(this.isFramed && this.isFramed()) return 'embed';
  if(!window.history || !history.pushState) return 'no history';
  if(!this.map || !this.mapControl) return 'not loaded';
  // Something being edited: a full load is what happened before (and may
  // be asked about), never lost in place.
  if(window.tinymce && tinymce.editors && tinymce.editors.length) return 'editing';
  if(this._pathEditing) return 'editing a path';
  var type = this.mapControl.getContentType && this.mapControl.getContentType() || '';
  if(/^(markerEdit|newMarker|pathEditor|pathPinEditor|mapSettings|areaNameEdit|regionEdit|accountInformation)/.test(type)) return 'editing';
  if(document.querySelector('dialog[open]')) return 'dialog open';
  // A map download runs in this page: a reload picks it up again afterwards.
  if(this._offlineJob) return 'downloading';
  return null;
};

// Another game's address: switched to in place when on and safe, else
// loaded. Returns true when it switched in place.
ZMap.prototype.openGameURL = function(url) {
  var target = new URL(url, window.location.href);
  var game = target.searchParams.get('game');
  var current = this.mapOptions && this.mapOptions.shortName;
  var blocker = !game ? 'no game' : this._sameGame(game, current) ? 'same game' : this._gameSwitchBlocker();
  if(blocker) {
    if(blocker !== 'off' && blocker !== 'same game' && window.console) console.info('Game switch: loading the page (' + blocker + ')');
    window.location.href = target.href;
    return false;
  }
  this._switchGameInPlace(target, { push: true });
  return true;
};

// The switch itself. opts.push: a new history entry (not when Back or
// Forward brought us here).
//
// The new game's settings, categories and maps are asked for first, the
// game on screen staying as it is meanwhile; its markers are asked for too,
// not waited on. Once those are in, the old map comes down and the new one
// goes up in the same moment (the browser never draws neither), its map and
// sidebar built from what's in, its markers added when they arrive
// (zmain.lib.js startupJSON, zmGameSwitchBuildEarly). The old game's map
// stays on screen over it (a still copy: _coverMap) till the new one's in,
// as MAP_TRANSITIONS.game says (zmap.js): 'fade', the map first and its
// markers after (the old markers fading at once, the old map fading once
// the new one's tiles are in, then the new markers fading in); 'cut', all
// at once when its tiles and markers are in. Slow, it dims under a spinner
// (zmMapWaiting) from the moment it's picked.
// From Switch Game the new sidebar starts on that page and slides back to
// its categories (_slideBackFromGameMenu); on a phone the sheet closes,
// as picking a map closes it, the new game's sheet carrying on the close
// (_continueSheetClose).
ZMap.prototype._switchGameInPlace = function(target, opts) {
  var old = this;
  var game = target.searchParams.get('game');
  // OoT's data is asked for as OoT, its address says OoTR (zmain.js).
  var dataGame = isOcarina(game) ? 'OoT' : game;
  if(isOcarina(game)) target.searchParams.set('game', 'OoTR');
  if(old._switchingGame) return;
  old._switchingGame = true;
  document.documentElement.classList.add('zm-switching-game');
  var done = function() { document.documentElement.classList.remove('zm-switching-game'); };
  var container = old.map && old.map.getContainer();
  var slowMs = old.mapControl && old.mapControl.MAP_SWAP_SLOW_MS || 350;
  var slow = window.setTimeout(function() {
    if(window.zmMapWaiting) zmMapWaiting(container, true, old.mapControl && old.mapControl._container);
  }, slowMs);
  var loadPage = function() { window.location.href = target.href; };
  // On a phone, picked in Switch Game: the sheet back to its categories and
  // closed at once, as picking a map does (ZLayers _finishMapMenuSelection),
  // while the new game's asked for; its sheet then takes over, closed too.
  var sheet = old.mapControl && old.mapControl.viewStyleBottomSlide && old.mapControl._contentType === 'games' ? old.mapControl : null;
  if(sheet) { try { sheet.reset(); sheet.closeDrawer(); } catch(e) { sheet = null; } }
  // (Not waited for: the game switches at once, as on a computer, the new
  // game's sheet finishing the close: _continueSheetClose.)
  // The new game's settings first: if they can't be had (offline, and not
  // downloaded), it's loaded as a page instead, which shows what it shows.
  $.getJSON('ajax.php?command=get_container&game=' + encodeURIComponent(dataGame)).done(function(containers) {
    if(!Array.isArray(containers) || !containers.length || !containers.every(Boolean)) { loadPage(); return; }
    // (As zMapInit asks for them: by the game's id.)
    var id = containers[0].id;
    var url = function(command) { return 'ajax.php?command=' + command + '&game=' + id; };
    var data = {};
    data[url('get_categories')] = $.getJSON(url('get_categories'));
    data[url('get_map')] = $.getJSON(url('get_map'));
    data[url('get_markers')] = $.getJSON(url('get_markers'));
    $.when(data[url('get_categories')], data[url('get_map')]).done(function() {
      // (Out of jQuery's handling of those answers first: asked for again
      // from inside it, as the start-up chain does, one would come after
      // this, not in it.)
      setTimeout(function() {
        try {
          var control = old.mapControl;
          // From Switch Game (on a computer): that page, to slide back from.
          var menu = control && !control.viewStyleBottomSlide && control._contentType === 'games' && control._gameMenu && $(control._gameMenu.domNode)[0];
          var fromGameMenu = menu ? menu.cloneNode(true) : null;
          // On a phone, a sheet still closing: where it's got to.
          var closingFrom = sheet ? old._sheetGeometry() : null;
          // The old game's map, as it is, to stay on screen meanwhile.
          var fade = old.MAP_TRANSITIONS.game !== 'cut';
          var cover = old._coverMap(fade);
          if(opts && opts.push) history.pushState({ zmGame: game }, '', target.href);
          else history.replaceState(Object.assign({}, history.state, { zmGame: game }), '', target.href);
          old._teardownForGameSwitch();
          // What the server put in the page for its first game.
          window.zmapLandingCategoryId = null;
          gameId = dataGame;
          zMap = new ZMap();
          window.zMap = zMap;
          zMap.setupOfflineMapMessage();
          window.zmGameSwitchData = data;
          window.zmGameSwitchBuildEarly = true;
          try { zMapInit(containers); }
          finally { window.zmGameSwitchBuildEarly = false; window.zmGameSwitchData = null; }
          if(!zMap.map) throw new Error('The new map was not built.');
          // (A phone's sheet laid out closed now, not a moment later: it's
          // first built full height.)
          var sheetNow = zMap.mapControl;
          if(sheetNow && sheetNow.viewStyleBottomSlide && !sheetNow._open && sheetNow._refreshMobileDrawerLayout) {
            try { sheetNow._refreshMobileDrawerLayout(); } catch(e) {}
            if(closingFrom) zMap._continueSheetClose(closingFrom);
          }
          zMap._watchMapLoading();
          // Fading: its markers to come in after its map.
          if(fade && zMap.mapControl._freezeMapContent) zMap.mapControl._freezeMapContent({ copies: false });
          zMap._uncoverWhenDrawn(cover, fade ? null : data[url('get_markers')], slow);
          if(fromGameMenu) zMap._slideBackFromGameMenu(fromGameMenu);
          done();
        } catch(error) {
          // Anything unexpected: the page, loaded as always.
          if(window.console) console.error('Game switch failed, loading the page instead', error);
          loadPage();
        }
      }, 0);
    }).fail(loadPage);
  }).fail(loadPage);
};

// A phone's sheet, as drawn now, if it's still on its way closed (null
// once it's down): its place and size, for the new game's to carry on from.
ZMap.prototype._sheetGeometry = function() {
  var control = this.mapControl;
  if(!control || !control._container || !control.drawerTop) return null;
  if(!(control.drawerTop() < control._startPosition - 1)) return null;
  var drawn = window.getComputedStyle(control._container);
  var geometry = {};
  ['top', 'height', 'left', 'width', 'borderRadius'].forEach(function(property) { geometry[property] = drawn[property]; });
  return geometry;
};

// The new game's sheet, laid out closed, put where the old one had got to
// and closed from there with its own animation: one sheet closing, as
// picking a map closes it, the game switched under it.
ZMap.prototype._continueSheetClose = function(from) {
  var control = this.mapControl, sheet = control && control._container;
  if(!sheet || !from) return;
  try {
    sheet.style.transition = 'none';
    Object.keys(from).forEach(function(property) { sheet.style[property] = from[property]; });
    sheet.style.maxHeight = from.height;
    // (Drawn there before it moves.)
    void sheet.offsetHeight;
    control.closeDrawer();
  } catch(e) {
    try { control._refreshMobileDrawerLayout(); } catch(e2) {}
  }
};

// From Switch Game: the new sidebar starts on a copy of that page (just to
// look at) and goes Back to its categories, sliding as Back does.
ZMap.prototype._slideBackFromGameMenu = function(page) {
  var control = this.mapControl;
  if(!control || !page) return;
  try {
    page.inert = true;
    page.setAttribute('aria-hidden', 'true');
    this._withoutPageSlide(function() { control.setContent(page, 'gameSwitchFrom'); });
    control._navigatingBack = true;
    control.resetContent();
  } catch(e) {
    try { control.resetContent(); } catch(e2) {}
  }
};

// The map on screen copied (just to look at) over the map's element, to
// stay there while the map under it is replaced. One already there (a game
// picked while the last was still coming up) is what's on screen: kept.
// fadeMarkers: what's on it (markers, labels, ...) fading away at once,
// its map staying.
ZMap.prototype._coverMap = function(fadeMarkers) {
  var map = this.map, control = this.mapControl, container = map && map.getContainer();
  if(!container || !map._mapPane || !control || !control._stillCopy) return null;
  for(var i = 0; i < container.children.length; i++) {
    if(container.children[i].classList.contains('zm-map-cover')) return container.children[i];
  }
  var cover = document.createElement('div');
  cover.className = 'zm-map-cover';
  cover.setAttribute('aria-hidden', 'true');
  var copy = control._stillCopy(map._mapPane);
  cover.appendChild(copy);
  container.appendChild(cover);
  if(fadeMarkers && control._contentPanes) {
    var panes = Array.prototype.slice.call(map._mapPane.children);
    var reduce = control._reducedMotion && control._reducedMotion();
    var ms = control.MAP_SWAP_FADE_MS || 150;
    control._contentPanes().forEach(function(pane) {
      var part = copy.children[panes.indexOf(pane)];
      if(!part) return;
      if(!reduce) { void part.offsetWidth; part.style.transition = 'opacity ' + ms + 'ms ease-out'; }
      part.style.opacity = '0';
    });
  }
  return cover;
};

// The old game's copy taken away once this map's tiles are drawn (and,
// given their request, its markers are on it), cut or faded as
// MAP_TRANSITIONS.game says, and the dimming with it (slow: its timer). Too
// long, it goes anyway. Then the markers, if they were held back, fade in.
ZMap.prototype._uncoverWhenDrawn = function(cover, markers, slow) {
  var zmap = this, map = this.map, control = this.mapControl;
  var container = map && map.getContainer();
  var token = {}, started = Date.now(), markersIn = !markers;
  var wait = control && control.MAP_SWAP_WAIT_MS || 8000;
  if(cover) cover._zmUncover = token;
  if(markers && markers.always) markers.always(function() { markersIn = true; });
  var drawn = function() {
    var loading = false;
    map.eachLayer(function(layer) { if(layer instanceof L.GridLayer && layer.isLoading && layer.isLoading()) loading = true; });
    return !loading && !(control && control._mapSwap);
  };
  var uncover = function() {
    // Another game picked meanwhile: the cover's that one's now.
    if(cover && cover._zmUncover !== token) return;
    if(zmap.map !== map) return;
    if(!(markersIn && drawn()) && Date.now() - started < wait) { window.requestAnimationFrame(uncover); return; }
    window.clearTimeout(slow);
    if(window.zmMapWaiting) zmMapWaiting(container, false);
    var reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    var ms = control && control.MAP_SWAP_FADE_MS || 150;
    var fade = zmap.MAP_TRANSITIONS.game !== 'cut' && !reduce;
    // The markers in after the map (held back, fading: _freezeMapContent).
    var letMarkersIn = function() {
      if(control && control._releaseMapContent && zmap.map === map) control._releaseMapContent(fade ? control.MAP_MARKERS_IN_MS || 200 : 0, true);
    };
    if(control && control._finishTileFades) control._finishTileFades(control.currentMapLayer);
    if(!cover) { letMarkersIn(); return; }
    cover._zmUncover = null;
    if(!fade) { cover.remove(); letMarkersIn(); return; }
    cover.style.transition = 'opacity ' + ms + 'ms ease-out';
    cover.style.opacity = '0';
    window.setTimeout(function() { cover.remove(); letMarkersIn(); }, ms + 20);
  };
  uncover();
};

// The page's background (its tiles pattern) pulsing behind the map while
// the map's first images load: on a game switched to, and on each map
// opened after (Switch Map, a floor). Not while panning about.
ZMap.prototype._watchMapLoading = function() {
  var zmap = this, map = this.map;
  if(!map || this._watchingMapLoading) return;
  this._watchingMapLoading = true;
  var container = map.getContainer();
  // (Each time it's put on the map: a map opened again loads again.)
  var watch = function(layer) {
    if(!(layer instanceof L.GridLayer) || layer._zmLoadWatched) return;
    if(layer.isLoading && !layer.isLoading()) return;
    layer._zmLoadWatched = true;
    container.classList.add('zm-map-loading');
    var settle = function() {
      layer._zmLoadWatched = false;
      layer.off('load', settle);
      map.off('layerremove', removed);
      // (Still pulsing for another map loading, if one is.)
      var loading = false;
      map.eachLayer(function(other) { if(other._zmLoadWatched) loading = true; });
      if(zmap.map === map && !loading) container.classList.remove('zm-map-loading');
    };
    var removed = function(e) { if(e.layer === layer) settle(); };
    layer.on('load', settle);
    map.on('layerremove', removed);
  };
  map.eachLayer(watch);
  map.on('layeradd', function(e) { watch(e.layer); });
};

// Everything this map set up, taken away: its editors and dialogs, its
// page-wide listeners, timers and elements, and Leaflet's map with every
// layer and control on it.
ZMap.prototype._teardownForGameSwitch = function() {
  if(this._endPathEditing) { try { this._endPathEditing(); } catch(e) {} }
  if(this._closePathBar) { try { this._closePathBar(); } catch(e) {} }
  if(window.tinymce) { try { tinymce.remove(); } catch(e) {} }
  // A map change still waiting: nothing of it to finish.
  var control = this.mapControl;
  if(control && control._mapSwap) { try { control._clearMapSwap(control._mapSwap); control._releaseMapContent(); } catch(e) {} }
  document.querySelectorAll('dialog[open]').forEach(function(dialog) { try { dialog.close(); } catch(e) {} });
  (this._pageCleanups || []).splice(0).forEach(function(cleanup) {
    try { cleanup(); } catch(e) { if(window.console) console.warn('Game switch cleanup', e); }
  });
  if(this.map) {
    try { this.map.off(); this.map.remove(); } catch(e) { if(window.console) console.warn('Game switch: removing the map', e); }
  }
  // (Any of its timers still to come find nothing to act on.)
  this.map = null;
  this.mapControl = null;
  if(window.toastr) toastr.clear();
};

// Back and Forward between games switched in place: the game at that
// address, switched to again (not pushed: it's already in history).
window.addEventListener('popstate', function() {
  if(typeof zMap === 'undefined' || !zMap || !zMap._gameSwitchOn || !zMap._gameSwitchOn()) return;
  var target = new URL(window.location.href);
  var game = target.searchParams.get('game');
  if(!game || zMap._sameGame(game, zMap.mapOptions && zMap.mapOptions.shortName)) return;
  if(zMap._gameSwitchBlocker()) { window.location.reload(); return; }
  zMap._switchGameInPlace(target, { push: false });
});

// The switch in Settings, for those allowed it (setUser adds it once the
// account's known). Off by default; on just for this browser.
ZMap.prototype._addGameSwitchSetting = function() {
  var settings = this.settingsControl;
  if(!settings || !settings.addCheckbox || this._gameSwitchCheckbox || !this._gameSwitchAllowed()) return;
  var zmap = this;
  this._gameSwitchCheckbox = settings.addCheckbox('Switch games without reloading (staff test)', this._gameSwitchOn(), function(checked) {
    zmap._setGameSwitch(checked);
    toastr.info(checked ? 'Switching games now happens in place, in this browser.' : 'Switching games loads the page again, as normal.');
  });
};
