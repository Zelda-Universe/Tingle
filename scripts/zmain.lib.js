// This script sets OSName variable as follows:
// "Windows"    for all versions of Windows
// "MacOS"      for all versions of Macintosh OS
// "Linux"      for all versions of Linux
// "UNIX"       for all other UNIX flavors
// "Unknown OS" indicates failure to detect the OS

var OSName="Unknown OS";
if (navigator.appVersion.indexOf("Win"  )!=-1) OSName="Windows" ;
if (navigator.appVersion.indexOf("Mac"  )!=-1) OSName="MacOS"   ;
if (navigator.appVersion.indexOf("X11"  )!=-1) OSName="UNIX"    ;
if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux"   ;

function getUrlParam(vParam) {
   vParam = vParam.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");

   var regexS = "[\\?&]"+vParam+"=([^&#]*)";
   var regex = new RegExp(regexS);
   var vResults = regex.exec(window.location.href);

   if (vResults == null) {
      return "";
   } else {
      return decodeURIComponent(vResults[1]);
   }

};

function setCookie(cname, cvalue, exdays) {
   if (exdays) {
      var d = new Date();
      d.setTime(d.getTime() + (exdays*24*60*60*1000));
      var expires = "expires="+ d.toUTCString();
   } else {
      var d = new Date();
      d.setTime(d.getTime() + (365*24*60*60*1000));
      var expires = "expires="+ d.toUTCString();

   }
   //console.log(expires);

   // Added explicity tag SameSite -> https://www.chromestatus.com/feature/5633521622188032.
   document.cookie = cname + "=" + cvalue + ";" + expires + "; SameSite=Lax";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}



function zMapInit(vResults) {
  // Should only get only one map

  // if (vResults.success === false) { # Bad condition, or overlap???? false without msg???????? no success, or no vR at alll, must not be empty cont list success, no db conn at least perm/constr has msg, so what else.....
  //   zLogger.error('Container response provided!');
  //   return 1;
  // }
  if (vResults.success === false) {
    zLogger.error(vResults.msg);
    return 2;
  }

  if (vResults.length == 0 || !vResults.every((vC)=>vC)) {
    zLogger.error('No containers provided to load!');
    return 3;
  }

  $.each(vResults, function(i, vContainer) {
    // Settings
    {
      vContainer.showMapControl             = getUrlParamValue('showMapControl', vContainer.showMapControl);
      vContainer.collapsed                  = getUrlParamValue('collapsed', isMobile());
      vContainer.showCategoryControl        = getUrlParamValue('showCategoryControl', true);//vContainer.showCategoryControl);
      if (getCookie('isCategoryOpen') == '') {
         setCookie('isCategoryOpen',"true");
      }
      vContainer.showCategoryControlOpened  = getUrlParamValue('showCategoryControlOpened', getCookie('isCategoryOpen')=="true");//vContainer.showCategoryControl);
      vContainer.showZoomControl            = getUrlParamValue('showZoomControl', vContainer.showZoomControl);

      vContainer.zoom                       = getUrlParamValue('zoom', vContainer.defaultZoom);
      vContainer.zoomSnap                   = parseFloat(getUrlParamValue('zoomSnap', 0)); /*@TODO: Check if there is a zoomSnap parameter. If not, use the one we got from the DB*/
      vContainer.zoomDelta                  = parseFloat(getUrlParamValue('zoomDelta', 1)); /*@TODO: Check if there is a zoomDelta parameter. If not, use the one we got from the DB*/
      if (vContainer.zoom > vContainer.maxZoom) {
         vContainer.zoom = vContainer.maxZoom;
      }
      vContainer.centerX                    = getUrlParamValue('x', vContainer.centerX);
      vContainer.centerY                    = getUrlParamValue('y', vContainer.centerY);
      vContainer.bgColor                    = getUrlParamValue('bgColor', vContainer.bgColor);
      vContainer.showInfoControls           = getUrlParamValue('showInfoControls', vContainer.showInfoControls);

      if (vContainer.startArea) {
        vContainer.startArea = parseBounds(vContainer.startArea);
      }

      vContainer.help                       = getUrlParamValue('help', true);

      var showCompleted = getCookie('showCompleted');
      if (showCompleted == '') {
         setCookie('showCompleted',"true");
         vContainer.showCompleted = true;
      } else {
         vContainer.showCompleted = (showCompleted == 'true');
      }
    }

    zMap.constructor(vContainer);

    // Offline, another game's saved page can stand in for this one's.
    var seoName=seoGameName(vContainer);
    // Area pages say "Ocarina of Time Remake" too; any of them is this game's page.
    var titleGameName=isOcarina(vContainer.shortName) ? 'Ocarina of Time' : seoName;
    if(seoName && document.title.indexOf(titleGameName) === -1) {
      document.title = seoName + ' Interactive Map - Zelda Maps';
    }

    // TODO: Remove when proper lang files are added for the other games,
    // or when a proper detection mechanism is added, probably another
    // container field boolean value, since a head XHR request,
    // if we can manage it might still produce a 404 console error message..
    if(vContainer.shortName === 'TotK' || vContainer.shortName === 'EoW') {
	    getLang(vContainer.shortName);
    }

    gameId = vContainer.id;

    var categoriesSelectedIds = JSON.parse(
      ZConfig.getConfig('categoriesSelectedIds') || '[]'
    );
    // A category page (?category=korok-seeds) shows only that category,
    // unless the link names its own selection.
    if(window.zmapLandingCategoryId && !getUrlParam('categoriesSelectedIds')) {
      categoriesSelectedIds = [window.zmapLandingCategoryId];
    }
    if (categoriesSelectedIds && categoriesSelectedIds.length > 0) {
      var categoriesSelectedIdPairsObject = Object.fromEntries(
        categoriesSelectedIds.map((id) => [id, true])
      );
      zMap.categoriesSelectedIdPairsObject = categoriesSelectedIdPairsObject;
    }

    getMapCategories(categoriesSelectedIdPairsObject);

    var completedMarkers = getCookie('completedMarkers');
    if (completedMarkers != undefined && completedMarkers != null && completedMarkers != "") {
       zMap.addCompletedMarkers(JSON.parse(completedMarkers));
    }

    getGames();

    // Keep each game's loading color on the map canvas. Painting the document
    // root black also colors iOS Safari's safe-area/browser-chrome backdrop,
    // creating black bands above and below an otherwise edge-to-edge map.
    $('#map').css('background-color', vContainer.bgColor);
 });
}

function getMapCategories(categoriesSelectedIdPairsObject) {
  $.getJSON(
    "ajax.php?command=get_categories&game=" + gameId,
    function(vResults) {
      vResults = ensureBotWNPCCategory(vResults);
      $.each(vResults, function(i, category) {
        category.img = getPOIGlyph(category);
        zMap.addCategory(category);

        if (categoriesSelectedIdPairsObject) {
          category.checked = !!categoriesSelectedIdPairsObject[category.id];
        }
      });

      for(categoryRoot of zMap.categoryRootsArr) {
        if(categoryRoot.checked) {
          for(categoryChild of categoryRoot.childrenArr) {
            categoryChild.checked = true;
          }
        }
      }

      getMaps();
    }
  ).fail(showOfflineUnavailable);
};

// Games in progress (ALttP's, Path Lab), after the others: only staff get
// any. Asked again when someone signs in or out (zmap.js setUser), so the
// game list follows the account without a reload.
function refreshAdminGames() {
  $.getJSON("ajax.php?command=get_admin_games", function(list) {
    list = Array.isArray(list) ? list : [];
    var had = games.filter(function(game) { return game && game.adminOnly; }).map(function(game) { return String(game.id); });
    games.forEach(function(game, i) { if(game && game.adminOnly) delete games[i]; });
    $.each(list, function(i, game) { game.adminOnly = true; zMap.addGame(game); });
    var now = list.map(function(game) { return String(game.id); });
    if(had.join() === now.join()) return;
    if(zMap.mapControl && zMap.mapControl.refreshGameMenu) zMap.mapControl.refreshGameMenu();
  });
}

function getGames() {
   $.getJSON("ajax.php?command=get_games", function(vResults) {
      if (vResults.success === false || vResults.length === 0) {
        zLogger.error('No games provided to switch between!');
        return 4;
      }

      $.each(vResults, function(i,map){
        zMap.addGame(map);
      });
      refreshAdminGames();
      // Other games' data isn't fetched here. The service worker saves the
      // data of each game as it's viewed, and Offline Maps downloads save a
      // whole game; fetching every game on every visit cost over 10 MB.
   });
};

function getMaps() {
  $.getJSON("ajax.php?command=get_map&game=" + gameId, function(vResults) {
    $.each(vResults, function(i, map) {
      zMap.addMap(map);
    });

    getMarkers();
  }).fail(showOfflineUnavailable);
};

function getUserInfo() {
   var requestedPage = getUrlParam('page');
   // offline: this device's saved account, used when the server can't be
   // reached, so being offline doesn't sign anyone out.
   var applyUserInfo = function(vResults, offline) {
    if(vResults.user) zMap.setUser(vResults.user);
    zMap.restoreDrawerPage(requestedPage);
    if(zMap.settingsControl) {
      // Offline, this device's settings are the newest.
      if(vResults.user && !offline) zMap.settingsControl.applyAccountSettings(vResults.user.settings);
      zMap.settingsControl.applySavedMinimalUI();
    }
    updateAdState();
    // Both wait for the connection when offline.
    if(vResults.user) {
      zMap.syncOfflineChanges();
      zMap.checkOfflineMapUpdates();
      // (A map download an earlier page left unfinished: OfflineDownloads.js.)
      if(zMap.resumeOfflineDownloads) zMap.resumeOfflineDownloads();
    }
    if(offline) return;
    // Paths, once we know who's asking (scripts/services/Paths.js: admins
    // only while they're built). The markers are in by now.
    if(zMap.loadPaths) zMap.loadPaths();
    // From now on, signing in or out refreshes what's the account's
    // (zmap.js setUser): the games in progress and the paths.
    zMap._accountReady = true;
    var startedAs = zMap.getUser();
    zMap._accountKey = startedAs ? startedAs.id + ':' + startedAs.level : '';
    if(ZConfig.getConfig("changelog") == 'true')
      checkChangelog(vResults.user);
   };
   // Only the server saying so signs this device out. Errors (a database
   // hiccup, a bad gateway) keep the account this device last saw.
   var keepSavedUser = function() {
    applyUserInfo(ZOfflineSync.savedUserInfo() || {}, true);
   };
   // An embed (embed.php) is never signed in: it doesn't ask.
   // (Unless it's previewed on Zelda Maps' own pages: index.php.)
   // (Signed out, not offline: its paths still load, lib/common/paths.php.)
   if(window.zmapEmbed && !window.zmapEmbedPreview) { applyUserInfo({}, false); return; }
   $.getJSON("ajax.php?command=get_user_info").done(function(vResults) {
    if(!vResults || (!vResults.user && !vResults.loggedOut)) {
      keepSavedUser();
      return;
    }
    ZOfflineSync.saveUserInfo(vResults);
    applyUserInfo(vResults, false);
   }).fail(keepSavedUser);
};

function checkChangelog(user) {
   // (Not over someone else's page, in an embed.)
   if(zMap.isFramed && zMap.isFramed()) return;
   new ChangelogHandler({
    user    : user,
    version : zMap.version
  });

};

function hideLoginControls() {
  var controlHeader = $(".leaflet-control-container .leaflet-control-layers-list .row-header")
  $(".login-button", controlHeader).parent().hide();
  var searchBoxParent = $(".search-box", controlHeader).parent();
  searchBoxParent.removeClass("col-xs-8");
  searchBoxParent.addClass("col-xs-10");
}

function showLoginControls() {
  var controlHeader = $(".leaflet-control-container .leaflet-control-layers-list .row-header")
  $(".login-button", controlHeader).parent().show();
  var searchBoxParent = $(".search-box", controlHeader).parent();
  searchBoxParent.removeClass("col-xs-10");
  searchBoxParent.addClass("col-xs-8");
}

function getMarkers(categories) {
  $.getJSON(
    "ajax.php?command=get_markers&game=" + gameId,
    function(gameId, vResults) {
      if (vResults.success === false) {
        zLogger.error('Error retrieving markers.');
        return 5;
      }

      zMap.buildMap(gameId);

      getUserInfo();
      if(vResults && vResults.length > 0) {
        zMap.addMarkers(vResults);
      }
      zMap.refreshMap();
      zMap.setupOfflineMapMessage();

      finalLoad();
    }.bind(this, gameId)
  ).fail(showOfflineUnavailable);
};

// Offline, for a game whose map data this device never saved: a notice in
// place of the map, with links to the games that are downloaded.
function showOfflineUnavailable(xhr) {
  if(!ZOfflineSync.isNetworkError(xhr) || document.getElementById('offline-unavailable')) return;
  var requested = getUrlParam('game');
  var downloaded = sortGames(ZMapOfflinePacks.downloadedGameIds()).filter(function(id) { return id !== requested; });
  var notice = $('<div>', { id: 'offline-unavailable', class: 'offline-unavailable', role: 'alert' });
  var card = $('<div>', { class: 'offline-unavailable-card' }).appendTo(notice);
  card.append($('<img>', { src: 'images/zmaps_white.png', alt: 'Zelda Maps', class: 'offline-unavailable-logo' }));
  var message = $('<p>').appendTo(card);
  var links = $('<div>', { class: 'offline-unavailable-links' });
  var render = function(names) {
    var name = names[requested];
    message.text('You\'re offline. Connect to the internet to view ' + (name ? 'maps for ' + name : 'this map') + '.');
    links.empty();
    downloaded.forEach(function(id) {
      links.append($('<a>', { href: '?game=' + encodeURIComponent(id) }).text(names[id] || id));
    });
    if(downloaded.length) {
      card.append($('<p>', { class: 'offline-unavailable-hint' }).text('Your downloaded maps:'), links);
    }
  };
  render({});
  // Offline, the request can fail before the page's body exists.
  $(function() { $('body').append(notice); });
  // Game names, if this device saved the list.
  $.getJSON('ajax.php?command=get_games').done(function(games) {
    var names = {};
    (games || []).forEach(function(game) { names[game.shortName] = game.name; });
    card.find('.offline-unavailable-hint').remove();
    render(names);
  });
}

function finalLoad() {
  return zMap._withoutPageSlide(finalLoadContent);
}

function finalLoadContent() {
  var marker = ZConfig.getConfig('marker');
  if(marker) {
    if(zMap._prepareMarkerLinkReturn) zMap._prepareMarkerLinkReturn();
    // Zoomed in on the marker, as opening it from a list does
    // (navigateToMarker), unless the address gives a view of its own (a
    // reload keeps where it was). That view is the page's: the map's own
    // fit on opening doesn't undo it (_fitToMapBounds).
    var linkHasView = new URL(window.location.href).searchParams.has('zoom');
    if(!linkHasView) zMap._viewChosen = true;
    zMap.mapControl._restoringInitialPage = true;
    try {
      zMap.goTo({
      marker: marker,
      zoom: linkHasView ? undefined : Math.max(zMap.map.getZoom(), 6),
      panTo: false,
      centerInVisibleArea: true
      });
    } finally {
      zMap.mapControl._restoringInitialPage = false;
    }
    // An embed in a small frame shows more around it (zmap.js).
    if(zMap.isFramed && zMap.isFramed()) setTimeout(function() { zMap._fitEmbedMarker(marker); }, 0);
    if(zMap._hasWikiLink()) zMap._openRevisionLinkWhenReady('markers');
    return;
  }
  // Links to a user's Talk page (?user=1&talk=1) don't open a marker.
  if(zMap._hasWikiLink()) zMap._openRevisionLinkWhenReady('markers');

  if(ZConfig.getConfig('droppedPin') == 'true') {
    var pinX = Number.parseFloat(ZConfig.getConfig('x'));
    var pinY = Number.parseFloat(ZConfig.getConfig('y'));
    if(Number.isFinite(pinX) && Number.isFinite(pinY)) {
      zMap._openDroppedPin(new L.LatLng(pinY, pinX));
    }
  }

  // A landing category page focuses its markers, unless the link sets its
  // own zoom. Its page (restoreDrawerPage) raises the closed phone drawer,
  // so the fit happens there, once the drawer has settled.
  var landingCategory = window.zmapLandingCategoryId && zMap.categories[window.zmapLandingCategoryId];
  if(landingCategory && !getUrlParam('zoom')) {
    zMap.focusSingleMapCategory(landingCategory, !!(zMap.mapControl && zMap.mapControl.viewStyleBottomSlide && !zMap.mapControl._open));
    return;
  }

  var zoom = (
    ZConfig.getConfig('zoom')
    || ZConfig.getConfig(`zoom-${gameId}`)
  );

  if(zoom) {
    zMap.map.setZoom(zoom);
    return;
  }
};

// Get value of parameters
function getUrlParamValue(vParamName, vDefaultValue) {
   var vParamName = getUrlParam(vParamName);

   if (vParamName == undefined || vParamName == "") {
      return vDefaultValue;
   }
   if (vParamName == "false") {
      return false;
   }
   if (vParamName == "true") {
      return true;
   }
   return vParamName;
};

function globalKeyPressHandler(e) {
  var evtobj = window.event? event : e

  if (evtobj.key == 'z' && (
    ((OSName != 'MacOS') && evtobj.ctrlKey) ||
    ((OSName == 'MacOS') && evtobj.metaKey)
    )) {
    zMap.undoMarkerComplete();
  }
}

function parseBounds(input) {
  function error() {
    zLogger.error("Map parameter is invalid: \"" + input + "\".  Ignoring, and continuing to load the map with the default view.");
    return false;
  };

  var bounds;

  // Try loading as JSON first.
  try {
    bounds = JSON.parse(input);
  } catch(e) {
    // Ignore and try other methods.
  }

  // Try the CSV/CSL method next if it's not JSON.
  if(!bounds) bounds = input.split(',');
  if(!bounds) return error(); // We're fresh out of methods we're currently supporting.  Error out and be happy (with the default view)!

  // Check if data is not in the format we expect, namely, 4 ordinate elements, or 2 pairs or 2 each.
  if(bounds.length != 4 && bounds.length != 2)  return error();

  if(bounds.length == 4) {
    bounds = [
      bounds.slice(0, 2),
      bounds.slice(2, 4)
    ];
  }

  bounds.forEach(function(point) {
    point = point.map(parseFloat);

    // Check if the data is not in the format we expect, namely, containing any invalid number ordinate elements.
    if(bounds && bounds.includes(NaN)) return error();

    return point;
  });


  return bounds;
};

/**** ADS *****/
var AD_CLIENT = 'ca-pub-7269573247649351';
var AD_SLOT = '4512666333';
var AD_PRODUCTION_HOSTS = ['zeldamaps.com', 'www.zeldamaps.com'];
var AD_GAP = 8;
var AD_BOTTOM = 10; // Matches #ads in zmain.css.
var AD_SIDEBAR_GAP = 16;
var adState = { key: null, observing: false, fallbackTimer: null };

// "live" on the production site. Elsewhere "test" asks AdSense for test ads
// and shows a placeholder when none are served, as on localhost.
// Override with ?ads=live|test|placeholder|off.
function getAdMode() {
  var mode = ZConfig.getConfig('ads');
  if(['live', 'test', 'placeholder', 'off'].indexOf(mode) > -1) return mode;
  return AD_PRODUCTION_HOSTS.indexOf(location.hostname) > -1 ? 'live' : 'test';
}

// The strip along the bottom of the desktop page, left of the bottom-right
// controls. The banner centres on the page, and slides under the sidebar
// (which leaves room above it) when it would otherwise cover the controls.
function getDesktopAdArea() {
  var panel = zMap.mapControl && zMap.mapControl._container;
  var panelRect = panel && panel.offsetParent ? panel.getBoundingClientRect() : null;
  var controls = document.querySelector('.leaflet-bottom.leaflet-right');
  var right = controls && controls.offsetHeight
    ? controls.getBoundingClientRect().left : window.innerWidth;
  return {
    center: window.innerWidth / 2,
    left: panelRect ? panelRect.left : AD_GAP,
    right: right - AD_GAP
  };
}

// The banner's distance from the bottom: AD_BOTTOM, plus the home
// indicator's safe area in home-screen apps (zmain.css).
function getDesktopAdBottom(ads) {
  ads.classList.add('ads-desktop');
  var bottom = parseFloat(window.getComputedStyle(ads).bottom);
  return isNaN(bottom) ? AD_BOTTOM : bottom;
}

// The largest banner that fits the layout, or null when none does.
function getAdSize(mobile) {
  if(mobile) return window.innerWidth >= 320 + AD_GAP * 2 ? { width: 320, height: 50 } : null;
  var area = getDesktopAdArea();
  return [{ width: 728, height: 90 }, { width: 468, height: 60 }].find(function(size) {
    return size.width <= area.right - area.left;
  }) || null;
}

// Centred on the page, nudged left when it would cover the controls.
function getDesktopAdLeft(width) {
  var area = getDesktopAdArea();
  return Math.max(area.left, Math.min(area.center - width / 2, area.right - width));
}

function loadAdSense() {
  if(document.getElementById('adsense-script')) return;
  var script = document.createElement('script');
  script.id = 'adsense-script';
  script.async = true;
  script.crossOrigin = 'anonymous';
  script.src = 'https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=' + AD_CLIENT;
  document.head.appendChild(script);
}

function showAdPlaceholder(ads, size) {
  ads.innerHTML = '';
  var placeholder = document.createElement('div');
  placeholder.className = 'ad-placeholder';
  placeholder.textContent = 'Test ad · ' + size.width + '×' + size.height;
  ads.appendChild(placeholder);
}

function renderAd(ads, size, mode) {
  ads.style.width = size.width + 'px';
  ads.style.height = size.height + 'px';
  if(mode == 'placeholder') return showAdPlaceholder(ads, size);

  // A fixed-size slot, so AdSense serves exactly this banner size.
  var slot = document.createElement('ins');
  slot.className = 'adsbygoogle';
  slot.style.display = 'inline-block';
  slot.style.width = size.width + 'px';
  slot.style.height = size.height + 'px';
  slot.setAttribute('data-ad-client', AD_CLIENT);
  slot.setAttribute('data-ad-slot', AD_SLOT);
  if(mode == 'test') slot.setAttribute('data-adtest', 'on');
  ads.appendChild(slot);
  loadAdSense();
  (window.adsbygoogle = window.adsbygoogle || []).push({});

  if(mode == 'test') {
    adState.fallbackTimer = window.setTimeout(function() {
      if(slot.isConnected && slot.getAttribute('data-ad-status') != 'filled') {
        showAdPlaceholder(ads, size);
      }
    }, 4000);
  }
}

function positionAds() {
  var ads = document.getElementById('ads');
  if(!ads || !ads.firstChild) return;
  var control = zMap.mapControl;
  var width = parseInt(ads.style.width);
  if(ads.classList.contains('ads-mobile')) {
    var drawer = control._container;
    ads.style.left = (window.innerWidth - width) / 2 + 'px';
    ads.style.top = drawer.getBoundingClientRect().top
      - parseInt(ads.style.height) - AD_GAP + 'px';
    ads.classList.toggle('ads-lifted', control.drawerTop() < control._startPosition - 1);
  } else {
    ads.style.top = '';
    ads.style.left = getDesktopAdLeft(width) + 'px';
    ads.classList.remove('ads-lifted');
  }
}

function observeAdLayout() {
  if(adState.observing || !zMap.mapControl) return;
  adState.observing = true;
  var drawer = zMap.mapControl._container;
  // The drawer moves by its inline top, so follow its style.
  new MutationObserver(positionAds).observe(drawer, {
    attributes: true,
    attributeFilter: ['style', 'class']
  });
  if(window.ResizeObserver) new ResizeObserver(function() { updateAdState(); }).observe(drawer);
  window.addEventListener('resize', function() { updateAdState(); });
}

// Called once the user is known and whenever they sign in or out. Ads are
// never requested for signed-in users.
function updateAdState() {
  var ads = document.getElementById('ads');
  if(!ads || !zMap.mapControl) return;
  observeAdLayout();
  var authenticated = !!user;
  var mobile = isMobile();
  var mode = getAdMode();
  // No ads in an embed (embed.php, or the map framed anywhere): it's part of
  // someone else's page. Nor the room kept for one, so the sidebar fills it.
  var embedded = !!window.zmapEmbed || (zMap.isFramed && zMap.isFramed());
  var size = authenticated || embedded || mode == 'off' ? null : getAdSize(mobile);

  zMap.mapControl.setBottomReserve(
    size && !mobile ? getDesktopAdBottom(ads) + size.height + AD_SIDEBAR_GAP : 0
  );

  var key = size ? [mode, mobile, size.width].join(':') : '';
  if(key !== adState.key) {
    adState.key = key;
    window.clearTimeout(adState.fallbackTimer);
    ads.innerHTML = '';
    ads.className = size ? (mobile ? 'ads-mobile' : 'ads-desktop') : '';
    if(size) renderAd(ads, size, mode);
  }
  positionAds();
  // On phones the banner sits above the drawer, out of the map's viewable area.
  if(zMap._updateMinZoom) zMap._updateMinZoom();
};

/**** LANG *****/
function getLang(shortName) {

   $.getJSON("data/" + shortName + "/lang/en-us.json", function(vResults){
		zMap.addLanguage(vResults);
   });

};
