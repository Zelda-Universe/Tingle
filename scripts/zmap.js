/*
Code TraceExample:

codeTrace-targetClasses  : [ "ZMap" ]
codeTrace-methodsToIgnore: {
 "ZMap": [
    "addCategory"             ,
    "addGame"                 ,
    "addHandler"              ,
    "addMap"                  ,
    "addMapControl"           ,
    "addMarker"               ,
    "addMarkers"              ,
    "addMarkerToCategoryCache",
    "buildCategoryMenu"       ,
    "_buildContextMenu"       ,
    "buildMap"                ,
    "checkWarnUserSeveralEnabledCategories",
    "_closeNewMarker"         ,
    "constructor"             ,
    "_createLoginForm"        ,
    "_createMarkerIcon"       ,
    "_createMarkerPopup"      ,
    "getUser"                 ,
    "goTo"                    ,
    "_openMarker"             ,
    "refreshMap"              ,
    "_shouldShowMarker"       ,
    "updateUrl"               ,
    "_updateMarkerPresence"   ,
    "_updateMarkersPresence"  ,
    "_updateMarkersVisiblilityByCategory"
  ]
}
*/

function ZMap() {
  this.name = 'ZMap';
  this._debugName = this.name + "[" + L.Util.stamp(this) + "]";

   var _this;

   // Now that we have the changelog system using the database
   // with a field for each number, let's use 3 numbers and no
   // letters in the version.
   this.version = '0.10.0';

   this.maps = [];
   this.games = [];
   this._overlayMap = [];
   this.map;
   this.lang = {};
   this.mapControl;
   this.currentMap;
   this.currentOverlaypMap;

   this.categoryCount = 0;

   this.backgroundZIndex = 50;  // Default ZIndex of map layers that will be on the background (tiles, scenes, etc)
   this.foregroundZIndex = 150; // Default ZIndex of map layers that will be on top (secrets, enemies)

   this.markerCluster;
   this.markers;
   this.categories;
   this.categoryTree;
   this.markerIconSmall;
   this.markerIconMedium;

   this.errorTileUrl    = ZConfig.getConfig("errorTileUrl"  );
   this.tileNameFormat  = ZConfig.getConfig("tileNameFormat");
   this.tilesBaseURL    = ZConfig.getConfig("tilesBaseURL"  );

   // @TODO: This is a WORKAROUND. Icon should be in the same folder as the tiled map itself.
   //        For now, since we don`t want to bother Matthew, we are creating a new folder in the code
   //        In the future, we need to move the icon.png of every map to the tiledmap and change defaultIconURL to defaultTilesURL
   this.defaultIconURL = 'images/icons/';

   this.newMarker;

   this.user;

   this.userWarnedAboutMarkerQty;
   this.userWarnedAboutLogin;

   this.completedMarkers;

   this.currentIcon;

   this.langMsgs = {
      GENERAL_ERROR   : "I AM ERROR. %1",

      LOGOUT_SUCCESS : "May the Goddess smile upon you, %1!",
      LOGOUT_ERROR   : "I AM ERROR! Could not log out. Please try clearing your cache and restarting your browser to safely log out.",

      LOGIN_WELCOME  : "Welcome back!",
      LOGIN_SUCCESS : "Hey, listen! Welcome back, %1!",
      LOGIN_ERROR   : "I AM ERROR. %1",

      ACCOUNT_TITLE  : "Account",

      REGISTER_WELCOME  : "Create an Account",
      REGISTER_ERROR   : "I AM ERROR! %1",

      LOST_PASSWORD_WELCOME: "Forgot Password",
      LOST_PASSWORD_SUCCESS: "Hey, listen! If that email has an account, Saria sent it a link to reset your password.",
      LOST_PASSWORD_ERROR: "I AM ERROR. You ended up back at the beginning! %1",

      RESET_PASSWORD_WELCOME: "New Password",
      RESET_PASSWORD_CHECKING: "Checking your link…",
      RESET_PASSWORD_INVALID: "This password reset link is invalid or has expired.",
      RESET_PASSWORD_MISMATCH: "Those passwords don't match.",
      RESET_PASSWORD_SUCCESS: "Your password has been changed. You can now log in.",
      RESET_PASSWORD_ERROR: "I AM ERROR. %1",

      CHANGE_PASSWORD_WELCOME: "Change Your Password",
      CHANGE_PASSWORD_SUCCESS: "Excuuuuse me, %1! Your password has been successfully updated!",
      CHANGE_PASSWORD_ERROR: "I AM ERROR. Could not update password. Try again.  %1",

      DELETE_ACCOUNT_WELCOME: "Delete Your Account",
      DELETE_ACCOUNT_SUCCESS: "Account has been deleted.",
      DELETE_ACCOUNT_ERROR: "Account could not be deleted: %1",

      MARKER_COMPLETE_WARNING : "You're not logged in, so your completed markers will be stored in a cookie. Log in or create an account to save your markers in our database.",

      MARKER_ADD_COMPLETE_ERROR : "I AM ERROR. This marker couldn’t be saved to our database. %1",
      MARKER_DEL_COMPLETE_ERROR : "I AM ERROR. This marker couldn’t be deleted from our database. %1",
      MARKER_COMPLETE_TRANSFER_ERROR : "I AM ERROR. There seems to be a problem moving your completed markers from cookies to our database. We'll automatically try again later. %1",
      MARKER_COMPLETE_TRANSFER_SUCCESS : "All of your completed markers were moved from cookies to our database and tied to your account.",
      MARKER_COMPLETE_TRANSFER_PARTIAL_SUCCESS : "We tried moving your completed markers from cookies to our database and tied to your account, but an error occurred. We try again the next time you login.",
      MARKER_DEL_ALL_COMPLETE_SUCCESS : "Map markers reset successfully!",
      MARKER_DEL_ALL_COMPLETE_QUESTION : "Are you sure want to start a new quest? All completed markers for %1 will be reset.",

      MARKER_DEL_ERROR : "You’ve met with a terrible fate, haven’t you? There seems to be a problem and this marker couldn’t be deleted from our database.",
      MARKER_EDIT_ERROR : "You’ve met with a terrible fate, haven’t you? There seems to be a problem and this marker couldn’t be edited in our database.",
      MARKER_ADD_ERROR : "You’ve met with a terrible fate, haven’t you? There seems to be a problem and this marker couldn’t be added to our database. ERROR: %1",
      MARKER_DEL_SUCCESS : "Marker %1 has been successfully deleted.",
      MARKER_EDIT_SUCCESS : "Marker %1 has been successfully edited.",
      MARKER_ADD_SUCCESS : "Marker %1 has been successfully added.",
      MARKER_ADD_SUCCESS_RESTRICTED : "Thank you for your contribution! Your marker is pending review and, if approved, it will show up shortly.",

      GO_TO_MARKER_ERROR : "I AM ERROR. Marker %1 couldn't be found on this map.",
   }

   this.handlers = {
     markersAdded: [],
     userChanged: []
   };
};

ZMap.prototype.constructor = function(vMapOptions) {
  _this = this;

  this.userWarnedAboutMarkerQty = false;
  userWarnedAboutLogin = false;
  this.mapOptions = {};

  games = [];
  this.maps = [];
  markers = [];
        this.categories = {};
     this.categoriesArr = [];
     this.categoryRoots = {};
  this.categoryRootsArr = [];
  completedMarkers = [];
  user = null;
  newMarker = null;
  this.cachedMarkersByCategory = {};
  this.cachedMarkersById = {};

  if (vMapOptions == null) {
    alert("Need to pass options to map constructor");
    return false;
  } else {
    if (vMapOptions.showCompleted == undefined) {
      vMapOptions.showCompleted = true;
    }
    this.mapOptions = vMapOptions;
  }

  if(!this.mapOptions.categorySelectionMethod)
  this.mapOptions.categorySelectionMethod =
  ZConfig.getConfig("categorySelectionMethod");

  if(ZConfig.getConfig("markerClusters") == 'true') {
    markerCluster = new L.MarkerClusterGroup({
      maxClusterRadius: this.mapOptions.clusterGridSize,
      disableClusteringAtZoom: this.mapOptions.clusterMaxZoom
    });
  }

  markerIconMedium = L.DivIcon.extend({
    options: {
      iconSize: [
        this.mapOptions.iconWidth,
        this.mapOptions.iconHeight
      ]
      , iconAnchor: [
        Math.floor(this.mapOptions.iconWidth   / 2),
        Math.floor(this.mapOptions.iconHeight  / 2)
      ]
      , popupAnchor: [0,0]
    }
  });
  markerIconSmall = L.DivIcon.extend({
    options: {
      iconSize: [
        this.mapOptions.iconSmallWidth,
        this.mapOptions.iconSmallHeight
      ]
      , iconAnchor: [
        Math.floor(this.mapOptions.iconSmallWidth  / 2),
        Math.floor(this.mapOptions.iconSmallHeight / 2)
      ]
      , popupAnchor: [0,0]
    }
  });

  if (this.mapOptions.defaultZoom > this.mapOptions.switchIconsAtZoom) {
    currentIcon = 'Medium';
  } else {
    currentIcon = 'Small';
  }
};

// Add a map category
ZMap.prototype.addCategory = function(category) {
  if(category.name) category.name = category.name.replace(/\bside-quests\b/gi, function(label) {
    return label.replace('-', ' ');
  });
  if(String(category.container_id) === '19' && String(category.id) === '1915') {
    category.visible = true;
  }
  category.checkedDefault = Object.pop(category, 'default_checked');

  if(this.mapOptions.categorySelectionMethod == 'focus') {
    category.checked = category.checkedDefault;
  } else {
    category.checked = false;
  }

  category.children    = {};
  category.childrenArr = [];

  category.complete = 0;
  category.total = 0;

  this.categories[category.id] = category;
  this.categoriesArr.push(category);
  this.categoryCount++;

  if(category.parent_id) {
    this.categories[category.parent_id].children[category.id] = category;
    this.categories[category.parent_id].childrenArr.push(category);
  } else {
    this.categoryRoots[category.id] = category;
    this.categoryRootsArr.push(category);
  }
};

ZMap.prototype.addGame = function(vGame) {
   // @TODO: consume color / img from DB (depends on how we do in the mockup
   vGame.img = vGame.icon;
   vGame.color = "#8e72b9";
   vGame.checked = true;
   vGame.name = vGame.name;
   games[vGame.id] = vGame;
};

// Every map's tiles form one square pyramid: zoom 0 is a single tile. Its
// bounds, inverted through the map's projection (ZCRS, in loadMap), stop
// requests for tiles beyond the artwork, which don't exist.
ZMap.prototype._tilePyramidBounds = function() {
  var o = this.mapOptions, size = Number(o.tileSize);
  var toLatLng = function(x, y) {
    return L.latLng((y - parseFloat(o.offsetY)) / Number(o.scaleN), (x - parseFloat(o.offsetX)) / Number(o.scaleP));
  };
  return L.latLngBounds(toLatLng(0, 0), toLatLng(size, size));
};

// A low-resolution copy of a layer's artwork underneath it, always kept
// whole: zooming out, or flinging the map somewhere new, shows it straight
// away, softly, while the sharp tiles load on top. It's one fixed tile level
// (zoom 2: 16 tiles at most), so it's never rebuilt or dropped while
// zooming. It lives in its own pane below the tiles, so the maps' own
// stacking (bringToBack, overlay z-indexes) can never put it on top.
ZMap.prototype._addTileBackdrop = function(layer, tileURL, maxNativeZoom) {
  var backdropZoom = Math.min(2, Number(maxNativeZoom) || 0);
  var backdrop = L.tileLayer(tileURL, {
    pane: 'tileBackdropPane',
    maxZoom: Math.max(Number(layer.options.maxZoom) || 0, Number(this.mapOptions.maxZoom) || 0),
    minNativeZoom: backdropZoom, maxNativeZoom: backdropZoom,
    minZoom: 0, noWrap: true, bounds: this._tilePyramidBounds(),
    tileSize: Number(this.mapOptions.tileSize), opacity: layer.options.opacity,
    keepBuffer: 64, updateWhenIdle: false, updateWhenZooming: false,
    className: 'tile-backdrop'
  });
  // Load the whole level at once, not just what's on screen, so it's
  // complete before any zoom out or fling reveals more of it.
  backdrop._getTiledPixelBounds = function() {
    var bounds = this.options.bounds, zoom = this._tileZoom;
    return L.bounds(
      this._map.project(bounds.getNorthWest(), zoom),
      this._map.project(bounds.getSouthEast(), zoom)
    );
  };
  // Foreground tiles get the connection first. Loading all 16 backdrop
  // tiles alongside them made a cold mobile visit slower, especially when
  // the visible map uses a different native zoom level.
  var pendingBackdrop = null;
  layer.on('add', function(e) {
    var map = e.target._map;
    var start = pendingBackdrop = function() {
      layer.off('load', start);
      pendingBackdrop = null;
      if(layer._map !== map) return;
      if(!map.getPane('tileBackdropPane')) map.createPane('tileBackdropPane').style.zIndex = '150';
      map.addLayer(backdrop);
    };
    if(layer.isLoading()) layer.on('load', start);
    else start();
  });
  layer.on('remove', function() {
    if(pendingBackdrop) layer.off('load', pendingBackdrop);
    pendingBackdrop = null;
    if(backdrop._map) backdrop._map.removeLayer(backdrop);
  });
  layer.backdrop = backdrop;
};

// Each submap's named regions (BotW's tower regions), kept as get_map sends
// them; AreaSearch.js turns them into areas when first needed.
ZMap.prototype._submapRegionData = function(submaps) {
  return (submaps || []).map(function(submap) {
    return { submapId: submap.id, regions: submap.regions || [] };
  });
};

// A map's Switch Map thumbnail: images/icons/<its tiles' folder>/icon.<ext>,
// with its version (get_map.php iconVersion, from the file itself) in the
// address, so new art is never hidden by a cached copy of the old (browsers
// and Cloudflare keep images for a month). Without one: the artwork's own
// version, if it has one (versionSuffix: "?v=…").
ZMap.prototype._mapIconURL = function(submap, versionSuffix) {
  if(!submap) return '';
  var version = submap.iconVersion ? '?v=' + encodeURIComponent(submap.iconVersion) : (versionSuffix || '');
  return this.defaultIconURL + submap.tileURL + 'icon.' + submap.tileExt + version;
};

ZMap.prototype.addMap = function(vMap) {
   // If there is no subMap, we can't add to the map
   if (vMap.subMap.length == 0) {
      console.log("No subMap configured for \"" + vMap.name + "\"!!!");
      return;
   }
   // A 3D map (BotW's Divine Beasts): the game's model in place of tiles
   // (scripts/controls/Map3D.js), listed and switched to as any map is.
   if (vMap.kind === '3d' && typeof ZMap3D !== 'undefined') {
     var layer3d = ZMap3D.layer(this, vMap);
     layer3d.id = 'mID' + vMap.id; layer3d.originalId = vMap.id; layer3d.title = vMap.name;
     layer3d.mapDescription = vMap.description || ''; layer3d.mapKind = '3d';
     layer3d.alwaysShowCategories = vMap.alwaysShowCategories == 1;
     layer3d.submapRegions = []; layer3d.defaultSubMapId = vMap.subMap[0].id; layer3d.mapBounds = null; layer3d._overlayMap = [];
     this.maps.push(layer3d);
     return;
   }
   var tileBaseURL = vMap.subMap[0].tileBaseURL || this.tilesBaseURL;
   // A map with a kind (OoT's world and dungeons) makes each of its submaps
   // (ages, floors, water levels) its own selectable layer, chosen with the
   // floor and age switch (OotFloors.js), rather than overlays on a blank
   // base (mapOptions.submapLayers).
   if(vMap.kind) {
     this.mapOptions.submapLayers = true;
     vMap.subMap.forEach(function(submap) {
       var variantName=submap.name.replace(/(?:\s*·\s*)?State\s*\d+/gi,'');
       var title = vMap.name + (vMap.subMap.length > 1 ? ' — ' + variantName : '');
       var tileVersion = submap.tileVersion ? '?v=' + encodeURIComponent(submap.tileVersion) : '';
       var tileURL = (submap.tileBaseURL || tileBaseURL) + submap.tileURL + this.tileNameFormat + '.' + submap.tileExt + tileVersion;
       var maxNativeZoom = Number(submap.maxZoom || vMap.maxZoom);
       // Once loaded, the map should never show gaps: load tiles while
       // panning, not only after (Leaflet's default on phones), and keep the
       // ones just off screen. These maps are small, so this costs little.
       var layer = L.tileLayer(tileURL, {
         maxZoom: Number(this.mapOptions.maxZoom), maxNativeZoom: maxNativeZoom,
         minZoom: 0, noWrap: true, bounds: this._tilePyramidBounds(), tileSize: Number(this.mapOptions.tileSize), keepBuffer: 6,
         updateWhenIdle: false, updateWhenZooming: true,
         attribution: vMap.mapCopyright, label: title,
         // The Switch Map thumbnail, where every game's is, versioned with
         // the artwork so a new picture isn't hidden by a cached old one.
         iconURL: submap.iconURL || this._mapIconURL(submap, tileVersion)
       });
       this._addTileBackdrop(layer, tileURL, maxNativeZoom);
       layer.id = 'mID' + vMap.id + 's' + submap.id;
       layer.originalId = vMap.id;
       layer.defaultSubMapId = submap.id;
       layer.mapKind = vMap.kind;
       layer.alwaysShowCategories = vMap.alwaysShowCategories == 1;
       layer.mapName = vMap.name;
       layer.mapDescription = vMap.description || '';
       layer.submapName = variantName;
       // Its named regions and areas with borders (map_region), as for every game.
       layer.submapRegions = this._submapRegionData([submap]);
       layer.mapConnections = submap.connections || [];
       // A floor's own limits where its artwork doesn't fill the square
       // (ALttP's), else a dungeon's whole square, as OoT's.
       layer.mapBounds = submap.bounds || (vMap.kind === 'dungeon' ? this._tilePyramidBounds() : null);
       layer.title = submap === vMap.subMap[0] ? vMap.name : title;
       layer._overlayMap = [];
       this.maps.push(layer);
     }, this);
     return;
   }

   // If only one submap exists, we just add it without any overlay
  if (
        vMap.subMap.length == 1
    &&  vMap.subMap[0].submapLayer.length == 0
  ) {
    // Its artwork's version, where it has one (as for the maps above), so
    // new art isn't hidden by cached tiles and downloaded maps' tiles match.
    var singleTileVersion = vMap.subMap[0].tileVersion ? '?v=' + encodeURIComponent(vMap.subMap[0].tileVersion) : '';
    var tLayer = L.tileLayer(
      tileBaseURL
      + vMap.subMap[0].tileURL
      + this.tileNameFormat
      + '.'
      + vMap.subMap[0].tileExt
      + singleTileVersion
      , {
          maxZoom           : Math.max(Number(vMap.maxZoom), Number(this.mapOptions.maxZoom) || 0)
        , maxNativeZoom     : Number(vMap.maxZoom)
        , attribution       : vMap.mapCopyright
          + ', '
          + vMap.subMap[0].mapMapper
        , opacity           : vMap.subMap[0].opacity
        , noWrap            : true
        , tileSize          : this.mapOptions.tileSize
        , updateWhenIdle    : false
        , updateWhenZooming : true
        , keepBuffer        : 4
        , label             : vMap.name
        , iconURL           : vMap.subMap[0].iconURL || this._mapIconURL(vMap.subMap[0], singleTileVersion)
        , errorTileUrl      : this.errorTileUrl
      }
    );

    this._addTileBackdrop(tLayer, tLayer._url, vMap.maxZoom);

    tLayer.id               = 'mID' + vMap.id   ;
    tLayer.originalId       = vMap.id           ;
    tLayer.title            = vMap.name         ;
    tLayer.mapDescription   = vMap.description || '';
    tLayer.alwaysShowCategories = vMap.alwaysShowCategories == 1;
    tLayer._overlayMap      = []                ;
    // Named regions with borders, as get_map serves them (AreaSearch.js).
    tLayer.submapRegions    = this._submapRegionData(vMap.subMap);
    tLayer.defaultSubMapId  = vMap.subMap[0].id ;
    // Its own pan limits, where the artwork doesn't fill the square (LA's
    // dungeons): the map fits to them when opened, as OoT's dungeons do.
    tLayer.mapKind          = vMap.kind || null;
    tLayer.mapBounds        = vMap.subMap[0].bounds || null;

    this.maps.push(tLayer);
  } else {
      // Create the base map
      //  We create it as an empty map, so different sized overlay maps won't show on top
      //  We could create based on first submap of the array, but then we would need to change the controller to not redisplay the first submap
      /* TODO: Improve this to use no tile at all (remove tile border)*/
      var tLayer = L.tileLayer(tileBaseURL + vMap.subMap[0].tileURL + 'blank.png'
                                           , { maxZoom:           Math.max(Number(vMap.maxZoom), Number(this.mapOptions.maxZoom) || 0)
                                             , maxNativeZoom:     Number(vMap.maxZoom)
                                             , noWrap:            true
                                             , tileSize:          this.mapOptions.tileSize
                                             , updateWhenIdle:    false
                                             , updateWhenZooming: true
                                             , keepBuffer:        4
                                             , label:             vMap.name
                                             , iconURL:           vMap.subMap[0].iconURL || this._mapIconURL(vMap.subMap[0])
                                             }
      );

    tLayer.id          = 'mID' + vMap.id;
    tLayer.originalId  = vMap.id;
    tLayer.title       = vMap.name;
    tLayer.mapDescription = vMap.description || '';
    tLayer.alwaysShowCategories = vMap.alwaysShowCategories == 1;
    tLayer._overlayMap = [];
    tLayer.submapRegions = this._submapRegionData(vMap.subMap);
    tLayer.defaultSubMapId = vMap.subMap[0].id;

    // Add all the submaps to the overlay array (including the first submap for control purposes)
    for (var i = 0; i < vMap.subMap.length; i++) {
       var overlay = L.tileLayer((vMap.subMap[i].tileBaseURL || tileBaseURL) + vMap.subMap[i].tileURL + this.tileNameFormat + '.' + vMap.subMap[i].tileExt
                                            , { maxZoom:           Math.max(Number(vMap.maxZoom), Number(this.mapOptions.maxZoom) || 0)
                                            , maxNativeZoom:     Number(vMap.maxZoom)
                                            , attribution:       vMap.mapCopyright + ', ' + vMap.subMap[i].mapMapper
                                            , opacity:           vMap.subMap[i].opacity
                                            , noWrap:            true
                                            , tileSize:          this.mapOptions.tileSize
                                            , updateWhenIdle:    false
                                            , updateWhenZooming: true
                                            , keepBuffer:        4
                                            , label:             vMap.name
                                            , iconURL:           vMap.subMap[i].iconURL || this._mapIconURL(vMap.subMap[i])
                                          }
       );

       this._addTileBackdrop(overlay, overlay._url, vMap.maxZoom);

       overlay.id          = 'mID' + vMap.subMap[i].id;
       overlay.originalId  = vMap.subMap[i].id;
       overlay.title       = vMap.subMap[i].name;
       overlay.isDefault   = vMap.subMap[i].isDefault;

       if (vMap.subMap[i].submapLayer.length > 0) {

          overlay.layers = [];
          var bgZIdx = _this.backgroundZIndex;
          var fgZIdx = _this.foregroundZIndex;

          for (var j = 0; j < vMap.subMap[i].submapLayer.length; j++) {

             var submap = vMap.subMap[i].submapLayer[j];

             var overlay2 = L.tileLayer((submap.tileBaseURL || tileBaseURL) + submap.tileURL + '{z}_{x}_{y}.' + submap.tileExt
                                                                     , { maxZoom:           Math.max(Number(submap.maxZoom || vMap.maxZoom), Number(this.mapOptions.maxZoom) || 0)
                                                                       , maxNativeZoom:     Number(submap.maxZoom || vMap.maxZoom)
                                                                       , noWrap:            true
                                                                       , attribution:       submap.mapMapper
                                                                       , zIndex:            (submap.type == 'B' ? bgZIdx++ : fgZIdx++)
                                                                       , tileSize:          this.mapOptions.tileSize
                                                                       , opacity:           submap.opacity
                                                                       , updateWhenIdle:    false
                                                                       , updateWhenZooming: true
                                                                       , keepBuffer:        4
                                                                       , label:             vMap.name
                                                                       , iconURL:           this._mapIconURL(vMap.subMap)
                                                                       });
             overlay2.id             = 'mID' + submap.id;
             overlay2.originalId     = submap.id;
             overlay2.title          = submap.name;
             overlay2.controlChecked = submap.controlChecked;
             overlay2.type           = submap.type;

             //console.debug(overlay2);
             overlay.layers.push(overlay2);

          }

       }

       tLayer._overlayMap.push(overlay);
    }

    this.maps.push(tLayer);
   }
  if (this.mapControl) {
    this.mapControl.rebuildMap();
  }
}

ZMap.prototype.addMarkers = function(vMarkers) {
  vMarkers.forEach(function(vMarker) {
    this.addMarker(vMarker);
  }, this);
  this._markersAdded(vMarkers);
};

ZMap.prototype._markersAdded = function(vMarkers) {
  this.handlers["markersAdded"].forEach(function(handler) {
    handler(vMarkers); // or markers..
  }, this);
  if(this.mapControl) this.mapControl._categoryMenu.categoryButtons.forEach(function(button) {
    button.updateCategoryLabel();
  });
};

// Initial data can contain thousands of markers. Give rendering and input a
// turn between short batches, but publish markersAdded only once, as before.
ZMap.prototype.addMarkersInBatches = function(vMarkers) {
  var zmap=this,index=0,done=$.Deferred();
  var batch=function() {
    // A game switched to meanwhile (GameSwitch.js: a new ZMap): this one's markers are no
    // longer wanted, and nothing waiting on them should run.
    if(window.zMap && window.zMap!==zmap) return;
    try {
      var started=performance.now();
      do {zmap.addMarker(vMarkers[index++]);}
      while(index<vMarkers.length && performance.now()-started<8);
      if(index<vMarkers.length) {window.setTimeout(batch,0);return;}
      zmap._markersAdded(vMarkers);
      // Consumers need the complete imported list, not one event per batch.
      done.resolve(vMarkers);
    } catch(error) {done.reject(error);}
  };
  if(!vMarkers.length) {done.resolve(vMarkers);return done.promise();}
  window.setTimeout(batch,0);
  return done.promise();
};

ZMap.prototype.addMarker = function(vMarker) {
   if (vMarker == null) {
      return;
   }
   vMarker = correctBotWMarkerCategory(vMarker);

   var marker;
   if (vMarker.markerCategoryTypeId != 3) {
      marker = new L.Marker([vMarker.y,vMarker.x], { title: (_this.lang[vMarker.name + "_Name"] != null) ? _this.lang[vMarker.name + "_Name"] : vMarker.name
                                                   , icon: _this._createMarkerIcon(vMarker.markerCategoryId)
                                                   });
   } else {
      // Names imported from game data (gameData.source) are at the place's
      // centre, so they're drawn centred on it. Older names were placed by
      // hand around Leaflet's default pin, whose label sits 16px right and
      // 28px up from its point; those keep that, so they don't move.
      var importedLabel = false;
      try { importedLabel = !!(vMarker.gameData && JSON.parse(vMarker.gameData).source); } catch(e) {}
      // The pin itself is invisible and ignores taps (interactive: false),
      // so taps beside a name reach the markers under it; the name is what
      // you click.
      var labelPin = { interactive: false, keyboard: false,
        icon: L.divIcon({className: 'map-label-anchor', html: '', iconSize: [0, 0],
          tooltipAnchor: importedLabel ? [0, 0] : [16, -28]}) };
      marker = new L.marker([vMarker.y,vMarker.x], labelPin);
      // Its tier (Region, Area, Places…) sets its size (styles/zmain.css).
      var labelCategory = this.categories && this.categories[vMarker.markerCategoryId];
      var labelTier = labelCategory ? ' label-tier-' + String(labelCategory.name).toLowerCase().replace(/[^a-z]+/g, '-').replace(/^-|-$/g, '') : '';
      marker.bindTooltip(vMarker.name, {permanent: true, interactive:true, className: this.mapOptions.shortName + "-label" + labelTier,direction: 'center', offset: [0, 0] });
      marker.getTooltip().on('click',function(e) {
        if(e.originalEvent) L.DomEvent.stop(e.originalEvent);
        _this.navigateToArea(marker);
      });
      // Names are links to their area pages: reachable with Tab, opened with
      // Enter or Space.
      marker.on('tooltipopen', function(e) {
        var name = e.tooltip.getElement();
        if(!name || name.hasAttribute('tabindex')) return;
        name.setAttribute('tabindex', '0');
        name.setAttribute('role', 'link');
        name.addEventListener('keydown', function(event) {
          if(event.key !== 'Enter' && event.key !== ' ') return;
          event.preventDefault();
          _this.navigateToArea(marker);
        });
      });
   }

   marker.id              = vMarker.id;
   marker.title           = (_this.lang[vMarker.name + "_Name"] != null) ? _this.lang[vMarker.name + "_Name"] : vMarker.name;
   marker.description     = vMarker.description;
   marker.categoryId      = vMarker.markerCategoryId;
   marker.categoryTypeId  = vMarker.markerCategoryTypeId;
   marker.jumpMarkerId    = vMarker.jumpMakerId;
   marker.mapId           = vMarker.mapId;
   marker.submapId        = vMarker.submapId;
   marker.mapOverlayId    = vMarker.overlayId;
   marker.tabText         = vMarker.tabText.split('<|>');
   marker.tabTextOriginal = vMarker.tabText;
   marker.tabId           = vMarker.tabId.split('<|>');
   marker.tabUserId       = vMarker.tabUserId.split('<|>');
   marker.tabUserName     = vMarker.tabUserName.split('<|>').map(displayUserName);
   marker.userId          = vMarker.userId;
   marker.userName        = displayUserName(vMarker.userName);
   marker.globalMarker    = vMarker.globalMarker;
   marker.bounds          = vMarker.bounds;
   // marker.visible         = true;            // Used by the application to hide / show markers (everything is starting as visible) @TODO: might need to change this
   marker.visible         = this.categories[vMarker.markerCategoryId].checked
   marker.dbVisible       = vMarker.visible; // This is used in the database to check if a marker is deleted or not... used by the grid
   marker.draggable       = true; // @TODO: not working ... maybe marker cluster is removing the draggable event
   marker.complete        = false;
   marker.z               = vMarker.z
   if (vMarker.path != undefined && vMarker.path != null && vMarker.path != "") {

      path = [];
      var pathJSON = JSON.parse(vMarker.path);
      pathJSON.forEach(function(vLatLng) {
         path.push(new L.latLng(vLatLng));
      }, this);


      var vColor = this.categories[marker.categoryId].color;
      // @TODO: Current library only supports one color. Consider switch to a different lib with multiple color support (hence why color is in the array and not global)
      if (pathJSON[0].color != undefined && pathJSON[0].color != null && pathJSON[0].color != "") {
         vColor = pathJSON[0].color;
      }
      marker.path = L.polyline(path, {smoothFactor: 1, color: vColor});
      marker.pathDecorator = L.polylineDecorator(path, {
         patterns: [
            {offset: 15, repeat: 50, symbol: L.Symbol.arrowHead({pixelSize: 15, pathOptions: {fillOpacity: 1, weight: 0, color: vColor}})}
         ]
      });
   }

    if (vMarker.gameData != null && vMarker.gameData.length > 0) {
        try {
            marker.gameData = JSON.parse(vMarker.gameData);
        } catch (e) {
            console.log(vMarker.gameData);
        }
    } else {
        marker.gameData = null;
    }

   this.categories[marker.categoryId].total++;
   for (var i = 0; i < completedMarkers.length; i++) {
      if (marker.id == completedMarkers[i]) {
         this.categories[marker.categoryId].complete++;
         _this._doSetMarkerDoneIcon(marker, true);
         break;
      }
   }

   markers.push(marker);
   this.addMarkerToCategoryCache(marker);
   this.cachedMarkersById[marker.id] = marker;
   marker.pos = markers.length - 1;

   marker.on('click', function() {
    if(marker.categoryTypeId == 3) { _this.navigateToArea(marker); return; }
    // While a path is being edited, a click adds the marker as its next step.
    if(_this._pathEditing && _this._pathEditing.addMarker(marker)) return;
    // On desktop the marker loads into the hidden sidebar, so Minimal UI stays.
    if (_this.mapControl.options.collapsed && _this.mapControl.viewStyleBottomSlide) {
      _this.mapControl.toggle();
    }

    if (newMarker == null || (newMarker.markerId != marker.id)) {
      _this._createMarkerPopup(marker);

      _this._closeNewMarker();
      newMarker = _this._createPin(marker._latlng, marker).addTo(_this.map);
      newMarker.markerId = marker.id;
      newMarker.markerPos = marker.pos;
      _this._panMarkerIntoVisibleMapArea(marker, true);
      //map.panTo(marker.getLatLng());
    }
   });

   marker.on('contextmenu',function(e){
      // (An embed has no Complete.)
      if (_this.isFramed()) return;
      if (!marker.complete) {
        _this._doSetMarkerDoneAndCookie(marker);
      } else {
        _this._doSetMarkerUndoneAndCookie(marker);
      }
      if (!_this.mapControl.options.collapsed) {
         if (
              _this.mapControl.getContentType() == 'm'
           +  marker.id
           && _this.mapOptions.showCompleted    == true
         ) {
            //@TODO: Improve to not show marker content if this was not being displayed
            _this._createMarkerPopup(marker);
         } else {
            //_this.mapControl.resetContent();
         }
      }
      if (newMarker == null || (newMarker.markerId != marker.id)) {

         //map.panTo(marker.getLatLng());
      }

   });
};

ZMap.prototype._closeNewMarker = function() {
   if (newMarker != null) {
      this.map.removeLayer(newMarker);
      newMarker = null;
   }
}

// Selection follows map membership, not whether a marker happens to be on screen.
ZMap.prototype._reconcileOotMarkerSelection = function(mapId, subMapId) {
  var control = this.mapControl;
  var onThisMap = function(marker) {
    return marker && marker.mapId == mapId && (marker.globalMarker == 1 || marker.submapId == subMapId);
  };
  // A marker's page is open (selected on the map or opened from a link) and
  // the marker isn't on this version: close it as the drawer's X does, which
  // collapses the drawer on phones and returns the sidebar to the categories
  // on desktop.
  var page = /^m(\d+)$/.exec(control._contentType || '');
  if(page && !onThisMap(markers.find(function(marker) { return marker && marker.id == page[1]; }))) {
    control.closePage();
    return;
  }
  if(!newMarker || newMarker.markerPos == null) { this._closeNewMarker(); return; }
  if(onThisMap(markers[newMarker.markerPos])) return;
  this._closeNewMarker();
  control._headerPageParent = control._mobileAccountParent = null;
  control._desktopAccountReturnMarker = control._switchMenuReturnMarker = null;
  var url = new URL(window.location.href);
  url.searchParams.delete('marker');
  var state = Object.assign({}, window.history.state);
  delete state.drawerReloadParent;
  window.history.replaceState(state, '', url.href);
};

// The pin shown on a selected marker, a dropped pin or a marker being added:
// the Master Sword, stabbing down into the spot as it appears. The bottom 19%
// of the blade is cut away on impact (styles/zmain.css), so the anchor is that
// cut edge: the visible blade ends exactly on the spot.
//
// Given the marker it stabs, it ends on that marker's drawn centre instead.
// Marker icons are anchored at floor(size / 2), so an odd-sized icon (23px)
// is drawn half a pixel right of and below its point; the pin follows it, and
// re-checks when the marker's icon switches size with the zoom.
ZMap.prototype._createPin = function(latlng, marker) {
  var map = this.map, zmap = this;
  var swordIcon = function() {
    var dx = 0, dy = 0;
    var options = marker && marker.options.icon && marker.options.icon.options;
    if (options && options.iconSize && options.iconAnchor) {
      dx = Number(options.iconSize[0]) / 2 - Number(options.iconAnchor[0]);
      dy = Number(options.iconSize[1]) / 2 - Number(options.iconAnchor[1]);
    }
    return L.divIcon({
      className: 'sword-pin',
      html: "<img class='sword-pin-image' src='images/pin-sword.svg' alt='' draggable='false'>",
      iconSize: [30, 42],
      iconAnchor: [15 - dx, 34 - dy]
    });
  };
  var pin = L.marker(latlng, {
    icon: swordIcon(),
    keyboard: false,
    zIndexOffset: 1000
  });
  if (marker) {
    var anchor = pin.options.icon.options.iconAnchor.join();
    var follow = function() {
      var icon = swordIcon();
      if (icon.options.iconAnchor.join() === anchor) return;
      anchor = icon.options.iconAnchor.join();
      pin.setIcon(icon);
      // A new icon would replay the stab; this is the same pin, already in.
      var image = pin.getElement() && pin.getElement().querySelector('.sword-pin-image');
      if (image) image.style.animation = 'none';
      zmap._syncPinSpread(pin);
    };
    // After the zoom's own handlers, which swap the markers' icons.
    var followLater = function() { window.setTimeout(follow, 0); };
    // A spread marker (spreadOverlappingMarkers) is drawn away from its
    // spot: the pin goes where it's drawn, and moves with it.
    pin._spreadMarker = marker;
    pin.on('add', function() { map.on('zoomend', followLater); zmap._syncPinSpread(pin); });
    pin.on('remove', function() { map.off('zoomend', followLater); });
  }
  return pin;
};

// Gives a marker's pin the same nudge as the marker's icon, if it's spread.
ZMap.prototype._syncPinSpread = function(pin) {
  pin = pin || newMarker;
  if (!pin || !pin._spreadMarker || !pin._icon) return;
  var icon = pin._spreadMarker._icon;
  var nudge = icon ? icon.style.translate : '';
  if (pin._icon.style.translate !== nudge) pin._icon.style.translate = nudge;
};

ZMap.prototype._panMarkerIntoVisibleMapArea = function(marker, onlyIfObscured, delay) {
   var attempts = 0;
   var panWhenDrawerSettled = function() {
      if (this.mapControl.getContentType() != 'm' + marker.id) return;

      if (
         attempts++ < 20 &&
         this.mapControl._drawerAnimationTimeout
      ) {
         window.setTimeout(panWhenDrawerSettled, 100);
         return;
      }

      var mapRect = this.map.getContainer().getBoundingClientRect();
      var mapMarker = this.cachedMarkersById[marker.id];
      if (!mapMarker) return;

      var markerPoint = this.map.latLngToContainerPoint(mapMarker.getLatLng());
      var panOffset;

      if(this.mapControl.viewStyleBottomSlide) {
         var drawerRect = this.mapControl._container.getBoundingClientRect();
         var visibleBottom = Math.max(
            0,
            Math.min(mapRect.height, drawerRect.top - mapRect.top)
         );
         if (visibleBottom <= 0) return;
         if (onlyIfObscured && markerPoint.y <= visibleBottom) return;

         panOffset = [
            0,
            markerPoint.y - (visibleBottom / 2)
         ];
      } else {
         var drawer = this.mapControl._container;
         var drawerRect = drawer.getBoundingClientRect();
         var drawerVisible = window.getComputedStyle(drawer).display !== 'none';
         var drawerOnLeft = this.mapControl.options.position.endsWith('left');
         var visibleLeft = 0;
         var visibleRight = mapRect.width;
         if(drawerVisible) {
            var drawerWidth = Math.min(
               mapRect.width,
               Math.max(drawerRect.width, this.mapControl.options.width || 0)
            );
            var drawerEdge = drawerOnLeft
               ? drawerRect.left - mapRect.left
               : drawerRect.right - mapRect.left;
            visibleLeft = drawerOnLeft ? drawerEdge + drawerWidth : 0;
            visibleRight = drawerOnLeft ? mapRect.width : drawerEdge - drawerWidth;
         }
         if (visibleRight <= visibleLeft) return;
         if (
            onlyIfObscured &&
            markerPoint.x >= visibleLeft &&
            markerPoint.x <= visibleRight
         ) return;

         panOffset = [
            markerPoint.x - ((visibleLeft + visibleRight) / 2),
            markerPoint.y - (mapRect.height / 2)
         ];
      }

      var mapIsPanning = this.map._panAnim && this.map._panAnim._inProgress;
      this.map.panBy(panOffset, {
         animate: !mapIsPanning,
         duration: 0.25
      });
   }.bind(this);

   window.setTimeout(
      panWhenDrawerSettled,
      delay == null ? 380 : delay
   );
};


ZMap.prototype._createMarkerContentList = function(list) {
	var content = "";
	if (list != null) {
		content = content + "<ul class=\"list-group\">";
		for (var i = 0; i < list.length; i++) {
			if (list[i].name != undefined) {
				content = content + "<li class=\"list-group-item\"><img src=\"data/" + this.mapOptions.shortName + "/item/" + list[i].name + ".png\" class=\"item-image\"  onerror=\"this.style.display='none'\"> <span class=\"item-text\">" + _this.lang[list[i].name + "_Name"] + "</span><span class=\"badge badge-primary badge-pill\">" + list[i].condition + "</span>";
				if (list.length == 1 && _this.lang[list[0].name + "_Caption"] != null) {
					content = content + "<p style=\"margin-top: 10px;\">" + _this.lang[list[0].name + "_Caption"] + "</p>";
				}
				content = content + "</li>";
			} else {
				content = content + "<li class=\"list-group-item\"><img src=\"data/" + this.mapOptions.shortName + "/item/" + list[i] + ".png\" class=\"item-image\"  onerror=\"this.style.display='none'\"> <span class=\"item-text\">" + _this.lang[list[i] + "_Name"] + "</span>";
				if (list.length == 1 && _this.lang[list[0] + "_Caption"] != null) {
					content = content + "<p style=\"margin-top: 10px;\">" + _this.lang[list[0] + "_Caption"] + "</p>";
				}
				content = content + "</li>";
			}
		}
		content = content + "</ul>";
	}
	return content;
}

// Deleted accounts keep a "<deleted-ID>" placeholder username; credit their
// contributions to a deleted user instead.
function displayUserName(userName) {
  return /^<deleted-\d+>$/.test(userName || '') ? 'Deleted user' : userName;
}

ZMap.prototype._createMarkerPopup = function(marker, forcePartial) {
    var title = marker.title;
    if (marker.gameData != null && marker.gameData.actor != null && _this.lang[marker.gameData.actor + "_Name"] != null) {
       title = _this.lang[marker.gameData.actor + "_Name"]
    }

    var latlng = marker.getLatLng();
    var coordinateText;
    var coordinateMarkupPattern = /<p\b[^>]*\bname\s*=\s*(['"])coord\1[^>]*>([\s\S]*?)<\/p>/i;
    var coordinateMarkup = (marker.tabText || []).find(function(text) {
      return coordinateMarkupPattern.test(text);
    });
    if(marker.z != null) {
      coordinateText = this.pad(Math.round(latlng.lng), 4) + ", " +
        this.pad(Math.round(latlng.lat), 4);
      coordinateText += ", " + this.pad(Math.round(marker.z), 4);
    } else if(coordinateMarkup) {
      coordinateText = coordinateMarkup.match(coordinateMarkupPattern)[2]
        .replace(/<[^>]*>/g, '')
        .replace(/\s*\|\s*/g, ', ')
        .trim();
    } else {
      coordinateText = this.pad(Math.round(latlng.lng), 4) + ", " +
        this.pad(Math.round(latlng.lat), 4);
    }

    this._bookmarkTarget = { markerId: marker.id };
    // Beside the coordinates, from finest to broadest: the nearest place name
    // ("Hickaly Woods"), area name ("West Necluda"), and the area the marker
    // is in (OoT's areas and dungeons, BotW's tower regions: "Dueling
    // Peaks"). Each opens its page, as clicking a name on the map does.
    var placeLink = this.markerLabelLink ? this.markerLabelLink(marker, 'place') : null;
    var areaNameLink = this.markerLabelLink ? this.markerLabelLink(marker, 'area') : null;
    var areaLink = this.markerAreaLink ? this.markerAreaLink(marker) : null;
    // The place and area name pills are left out of the compact title bar
    // (marker-name-pill), which keeps the coordinates and the region, or,
    // with no region, the place name (ZLayers _setupCompactTitle).
    var pillFor = function(link, which) {
      if(!link) return '';
      var label = $('<span>').text(link.label).html();
      var classes = 'marker-coordinate-pill marker-region-pill' + (which === 'area' ? '' : ' marker-name-pill');
      return link.area
        ? "<button type='button' class='" + classes + "' onclick='_this.openMarkerArea(" + marker.id + ", \"" + which + "\"); return false'" +
          " title='" + $('<span>').text(link.title).html() + "'>" + label +
          "<i class='fas fa-chevron-right' aria-hidden='true'></i></button>"
        : "<p class='" + classes + "'>" + label + "</p>";
    };
    var pills = "<p class='marker-coordinate-pill'>" + coordinateText + "</p>";
    // In an embed, the game first: the page around it may not say.
    var gamePill = this._embedGamePillHTML();
    if(placeLink || areaNameLink || areaLink || gamePill) {
      pills = "<div class='area-header-pills marker-header-pills'>" + gamePill + pills +
        pillFor(placeLink, 'place') + pillFor(areaNameLink, 'area-name') + pillFor(areaLink, 'area') + "</div>";
    }
    // A single path's later marker (a Korok pair's Carry korok) is checked
    // with its path's first marker: its Complete is that one's
    // (scripts/services/Paths.js _pathLeadFor).
    var follows = this._pathLeadFor ? this._pathLeadFor(marker) : null;
    var checkMarker = follows ? follows.lead : marker;
    var content = "<h2 class='popupTitle'>" + title + "</h2>" +
      pills +
      "<div class='marker-actions-row marker-actions-row-four'>" +
        this._markerCompleteButtonHTML(checkMarker) +
        this._bookmarkButtonHTML() +
        "<button type='button' class='marker-action-button infoWindowIcn' onclick='_this._copyToClipboard(" + marker.id + ", this); return false'>" +
          "<span class='marker-action-icon'><i class='fas fa-link'></i></span>" +
          "<span class='marker-action-label'>Copy Link</span>" +
        "</button>" +
        "<button type='button' class='marker-action-button infoWindowIcn' onclick='_this._copyToClipboardEmbed(" + marker.id + ", this); return false'>" +
          "<span class='marker-action-icon'><i class='icon-embed2'></i></span>" +
          "<span class='marker-action-label'>Embed Code</span>" +
        "</button>" +
      "</div>" +
      // Street view from here, where there is one (StreetView.js: filled in
      // once it's known, hidden otherwise).
      "<div class='marker-actions-row street-view-row' hidden></div>" +
      // The paths this marker is a step of, and starting one from it.
      (this._markerPathsHTML ? this._markerPathsHTML(marker) : '');
    content = content + "<div class='popupContent'>";

    if (marker.gameData != null) {
		//console.log(marker.gameData);
        if (marker.gameData.subtitle != null && _this.lang["Nickname_" + marker.gameData.subtitle] != null) {
            content = content + "<p class=\"subtitle\">" + _this.lang["Nickname_" + marker.gameData.subtitle] + "</p>";
        }
        if (marker.gameData.location != null && _this.lang[marker.gameData.location] != null && marker.gameData.subtitle == null && _this.lang[marker.gameData.subtitle] == null) {
            content = content + "<p class=\"subtitle\">" + _this.lang[marker.gameData.location] + "</p>";
        }

        if (marker.gameData.actor != null && _this.lang[marker.gameData.actor + "_Caption"] != null && marker.gameData.rewards == null) {
			content = content + "<p><img src=\"data/" + this.mapOptions.shortName + "/gallery/" + marker.gameData.actor + ".png\" style=\"border-radius: 10%; width: 100px; float: left; margin-right: 10px;\" onerror=\"this.style.display='none'\"><img src=\"data/" + this.mapOptions.shortName + "/item/" + marker.gameData.actor + ".png\" style=\"border-radius: 10%; width: 100px; float: left; margin-right: 10px;\" onerror=\"this.style.display='none'\"><img src=\"data/" + this.mapOptions.shortName + "/gallery/" + marker.gameData.actor + "_Icon.png\" style=\"border-radius: 10%; width: 100px; float: left; margin-right: 10px;\" onerror=\"this.style.display='none'\">" + _this.lang[marker.gameData.actor + "_Caption"] + "</p>";
        }

		if (marker.gameData.shop != null) {
			var shop = marker.gameData.shop;
			console.log(shop);
			//content = content + "<ul class=\"list-group\">";
			content = content + "<div><table class=\"table shop\"><tr><th style=\"border-top: 0px;\"><span class=\"item-text\">Items</span></th>"
			if (shop[0].stock != undefined) {
				content = content + "<th style=\"border-top: 0px;\"><span class=\"item-text\">Stock</span></th>";
			}
			content = content +  "<th style=\"border-top: 0px;\"><span class=\"item-text\" style=\"text-align:center; width: 100px; display: inline-block;\">Price</span></th></tr>";
			for (var i = 0; i < shop.length; i++) {
				content = content + "<tr>";
				content = content + "<td><img src=\"data/" + this.mapOptions.shortName + "/item/" + shop[i].item + ".png\" class=\"item-image\"  onerror=\"this.style.display='none'\"><span class=\"item-text\">" + _this.lang[shop[i].item + "_Name"] + "</span></td>";
				if (shop[i].stock != null) {
					content = content + "<td><span class=\"item-text\">" + shop[i].stock + "</span></td>"
				}
				content = content + "<td><img src=\"data/" + this.mapOptions.shortName + "/" +shop[i].currency +".png\" class=\"item-image\"  onerror=\"this.style.display='none'\"><span class=\"item-text\">" + shop[i].price + "</span></td>"
				content = content + "</tr>";
				//content = content + "<li class=\"list-group-item\"><img src=\"data/" + mapOptions.shortName + "/item/" + shop[i].item + ".png\" class=\"item-image\"  onerror=\"this.style.display='none'\"> <span class=\"item-text\">" + _this.lang[shop[i].item + "_Name"] + "</span>";
				//content = content + "</li>";
			}
			//content = content + "</ul>";
			content = content + "</table><div>";
		}

		content = content + this._createMarkerContentList(marker.gameData.rewards);
		content = content + this._createMarkerContentList(marker.gameData.equip);
		//content = content + this._createMarkerContentList(marker.gameData.carry);


    }

	if (marker.gameData == null || isOcarina(this.mapOptions.shortName)) {
		//content = content + "<hr>";

		for (var i = 0; i < marker.tabText.length; i++) {
		   // (Its [[marker:123]] links as links: zwiki.js.)
		   content = content + this._renderContentShortcodes(marker.tabText[i].replace(
         /<p\b(?=[^>]*\bname\s*=\s*(['"])coord\1)[^>]*>[\s\S]*?<\/p>/gi,
         ''
       ));
		}
	}
   /*

   if (marker.tabText.length > 1) {
      var ul = "<ul>";
      for (var i = 0; i < marker.tabText.length; i++) {
         if (i == 0) {
            ul = ul + "<li style=\"minHeight: 120px;\"><div style='font: 12px/1.5 \"Helvetica Neue\", Arial, Helvetica, sans-serif;'>" + marker.tabText[i] + "</div></li>";
         } else {
            ul = ul + "<li id='citem-" + i + "' style='display: none'><div style='font: 12px/1.5 \"Helvetica Neue\", Arial, Helvetica, sans-serif;'>" + marker.tabText[i] + "</div></li>";
         }
      }
      ul = ul + "</ul>";
      content = content + ul;
   } else if (marker.tabText.length == 1 && marker.tabText[0] != "") {
      content = content  + "<div>" + marker.tabText[0] + "</div>";
   }*/

  content += "</div>";

  this.mapControl.setContent(content, 'm'+marker.id);
  this._streetViewButton(marker.getLatLng(), marker);
  // Its links to other markers open them, with a way back here.
  var markerContent = this.mapControl._contents.querySelector('.menu-cat-content-inner > .popupContent');
  if(markerContent && this._wireWikiLinks) {
    var zmap = this, markerId = marker.id;
    // (Back to this page keeps its own Back, to a path, an area, a search…)
    this._wireWikiLinks(markerContent, this._wikiBackToMarker ? this._wikiBackToMarker(markerId) : function() { zmap.navigateToMarker(markerId); });
  }
  this._refreshMarkerEditorTools(marker);
  var forcePartialMobile = (
    !!forcePartial &&
    this.mapControl.viewStyleBottomSlide
  );
  this.mapControl.openDrawerSmall(
    forcePartialMobile,
    !!(forcePartialMobile && (this.mapControl._restoringInitialPage || this.mapControl._suppressPageSlide))
  );
}

ZMap.prototype._getDisplayZoom = function() {
   // While laying out for a zoom that's on its way (_markersOnThisMap), what
   // shows is what will show there.
   return Math.round(this._layoutZoom !== undefined ? this._layoutZoom : this.map.getZoom());
}

// Only the categories with markers on one map in the category menu (an
// experiment, on 3D maps for now: Map3D.js): the others, and any section
// heading left with none, hidden until it's called with null. A category
// counts if it or one under it has a marker there.
ZMap.prototype._limitCategoriesToMap = function(submapId) {
  var menu = this.mapControl && this.mapControl._categoryMenu;
  if(!menu || !menu.categoryButtons) return;
  var categories = this.categories || {}, on = null;
  if(submapId != null) {
    on = {};
    this.getMarkers().forEach(function(marker) {
      if(String(marker.submapId) !== String(submapId)) return;
      // (Guarded against a loop in the category tree.)
      for(var id = marker.categoryId, n = 0; id != null && categories[id] && !on[id] && n < 20; n++) {
        on[id] = true; id = categories[id].parent_id;
      }
    });
  }
  var shown = function(category) { return !on || !!on[category.id]; };
  menu.categoryButtons.forEach(function(button) {
    button.domNode.closest('li').toggleClass('zm-off-map', !shown(button.category));
  });
  (menu.poiCategoryGroups || []).forEach(function(group) {
    group.toggle.closest('li').toggleClass('zm-off-map', !group.categories.some(shown));
  });
  if(menu.listViewNode) {
    menu.listViewNode.find('.category-list-row[data-category-id]').each(function() {
      var category = categories[this.getAttribute('data-category-id')];
      $(this).toggleClass('zm-off-map', !!category && !shown(category));
    });
    menu.listViewNode.find('.category-list-section').each(function() {
      var section = $(this);
      section.toggleClass('zm-off-map', !section.find('.category-list-row:not(.zm-off-map)').length);
    });
  }
};

// size: 'Medium' or 'Small' for that size whatever the zoom (a 3D map's
// markers are always the zoomed-in ones).
ZMap.prototype._createMarkerIcon = function(vCatId, vComplete, size) {
   var poiStyle = getPOIStyle(this.categories[vCatId]);
   var poiClass = poiStyle ? ' poi-badge poi-' + poiStyle : '';
   // The colours given in Map Settings (fill or outline, and glyph).
   var fillStyle = getPOIStyleVars(this.categories[vCatId]);
   if(poiStyle && String(this.categories[vCatId].container_id) === '22') poiClass += ' poi-eow';
   if (size ? size === 'Medium' : this._getDisplayZoom() > this.mapOptions.switchIconsAtZoom) {
      return new markerIconMedium({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-medium" + poiClass + "' style='" + fillStyle + "background-color: " + this.categories[vCatId].color + "; "
                                                                      + "border-color: " + this.categories[vCatId].color + "'>"
                                       + "<span class='icon-" + this.categories[vCatId].img + " icnText-medium'></span>"
                                       + (vComplete?"<span class='icon-checkmark completeMarker completeMarker-Medium'></span>":"")
                                 + "</div>"
      });
   } else {
      return new markerIconSmall({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-small" + poiClass + "' style='" + fillStyle + "background-color: " + this.categories[vCatId].color + "; "
                                                                      + "border-color: " + this.categories[vCatId].color + "'>"
                                       + "<span class='icon-" + this.categories[vCatId].img + " icnText-small'></span>"
                                       + (vComplete?"<span class='icon-checkmark completeMarker completeMarker-Small'></span>":"")
                                 + "</div>"
      });
   }
}

ZMap.prototype._getClipboardParams = function(href) {
   var params = href[1].split("&");

   var clipboardParams = "";

   for (var i = 0; i < params.length; i++) {
      if (params[i].search("game=") == 0
         || params[i].search("showMapControl=") == 0
         || params[i].search("collapsed=") == 0
         || params[i].search("showCategoryControl=") == 0
         || params[i].search("showZoomControl=") == 0
         || params[i].search("bgColor=") == 0
         || params[i].search("help=") == 0
      ) {
         clipboardParams = clipboardParams + params[i] + "&";
      }
   }
   return clipboardParams;
}
// The address of the map's own page, or (embed) of embed.php, the one page
// other sites may frame, whichever this page is.
ZMap.prototype._pageAddress = function(embed) {
   return new URL(embed ? 'embed.php' : './', window.location.href.split('?')[0]).href;
}
// An Embed Code copied, counted for the Admin panel's Embeds (anonymous:
// lib/common/embeds.php). target: 'marker', 'pin' or 'path'.
ZMap.prototype.trackEmbedCopy = function(target) {
  try {
    var data = new URLSearchParams({ target: target, game: this.mapOptions.shortName || '' });
    if(navigator.sendBeacon) navigator.sendBeacon('ajax.php?command=track_embed', data);
    else $.post('ajax.php?command=track_embed', data.toString());
  } catch(e) {}
};
// Embed Code: the dialog with a preview and its code (EmbedDialog.js).
ZMap.prototype._copyToClipboardEmbed = function(vMarkerId, button) {
   var href = window.location.href.split("?");
   var clipboardParams = this._getClipboardParams(href);
   // Its name as its page shows it (a game's own names: _createMarkerPopup).
   var heading = button && $(button).closest('.leaflet-control-layers, body').find('.popupTitle').first().text();
   var marker = this.cachedMarkersById && this.cachedMarkersById[vMarkerId];
   this.openEmbedDialog({
     src: this._pageAddress(true) + "?" + clipboardParams + "marker=" + vMarkerId + "&zoom=" + this.map.getZoom() + "&hideOthers=true&showMapControl=true&hidePin=false",
     target: 'marker',
     title: heading || (marker && marker.title)
   });
}
ZMap.prototype._copyToClipboard = function(vMarkerId, button) {
   var href = window.location.href.split("?");
   var clipboardParams = this._getClipboardParams(href);
   this._copyText(this._pageAddress(false) + "?" + clipboardParams + "marker=" + vMarkerId + "&zoom=" + this.map.getZoom(), button);
}

// Copies straight to the clipboard. The action button then shows a checkmark
// and "Copied!" for a moment; where the browser won't allow it, the text is
// offered to copy by hand instead.
ZMap.prototype._copyText = function(text, button) {
  var confirm = function() {
    if(!button) return;
    var icon = button.querySelector('.marker-action-icon, .copy-action-icon');
    var label = button.querySelector('.marker-action-label, .copy-action-label');
    // A wiki page's button (glyph, then its words): the two wrapped, once.
    var glyph = !icon && button.querySelector(':scope > i, :scope > svg');
    if(glyph) {
      icon = document.createElement('span');
      icon.className = 'copy-action-icon';
      button.insertBefore(icon, glyph);
      icon.appendChild(glyph);
      label = document.createElement('span');
      label.className = 'copy-action-label';
      while(icon.nextSibling) label.appendChild(icon.nextSibling);
      button.appendChild(label);
    }
    if(!icon || !label) return;
    if(!button._copyOriginal) button._copyOriginal = { icon: icon.innerHTML, label: label.innerHTML };
    icon.innerHTML = "<i class='fas fa-check' aria-hidden='true'></i>";
    label.textContent = 'Copied!';
    button.classList.add('is-copied');
    window.clearTimeout(button._copyTimer);
    button._copyTimer = window.setTimeout(function() {
      icon.innerHTML = button._copyOriginal.icon;
      label.innerHTML = button._copyOriginal.label;
      button.classList.remove('is-copied');
    }, 1500);
  };
  var byHand = function() { window.prompt("Copy to clipboard: Ctrl+C, Enter", text); };
  if(navigator.clipboard && window.isSecureContext) {
    navigator.clipboard.writeText(text).then(confirm, function() {
      // Older Safari without clipboard permission: the selection route works.
      if(copyBySelection()) confirm(); else byHand();
    });
  } else if(copyBySelection()) {
    confirm();
  } else {
    byHand();
  }
  function copyBySelection() {
    var field = document.createElement('textarea');
    field.value = text;
    field.setAttribute('readonly', '');
    field.style.position = 'fixed';
    field.style.opacity = '0';
    document.body.appendChild(field);
    field.select();
    var copied = false;
    try { copied = document.execCommand('copy'); } catch(e) {}
    field.remove();
    return copied;
  }
};

ZMap.prototype.addMarkerToCategoryCache = function(marker) {
  if(!this.cachedMarkersByCategory[marker.categoryId]) this.cachedMarkersByCategory[marker.categoryId] = [];
  this.cachedMarkersByCategory[marker.categoryId].push(marker);
};

ZMap.prototype.refreshMapCompleted = function() {
  this.refreshMap(null, true);
}

ZMap.prototype.focusSingleMapCategory = function(category, deferFit) {
  var navigationRequest = this._categoryNavigationRequest;
  var categories = [];
  var collect = function(c) {
    categories.push(c);
    (c.childrenArr || []).forEach(collect);
  };
  collect(category);
  var candidates = [];
  categories.forEach(function(c) {
    (this.cachedMarkersByCategory[c.id] || []).forEach(function(marker) {
      if(marker.visible === false || marker.categoryTypeId == 3 || (marker.complete && !this.mapOptions.showCompleted)) return;
      if(marker.mapId == null || marker.submapId == null) return;
      candidates.push(marker);
    }, this);
  }, this);
  if(!candidates.length) return;
  var currentMap = this.mapControl.getCurrentMap();
  var currentMapCandidates = candidates.filter(function(marker) {
    return String(marker.mapId) === String(currentMap.mapId) &&
      String(marker.submapId) === String(currentMap.subMapId);
  });
  var stayOnCurrentMap = currentMapCandidates.length > 0;
  var previousZoom = this.map.getZoom();
  if(stayOnCurrentMap) {
    var viewport = this.map.getBounds();
    if(currentMapCandidates.some(function(marker) { return viewport.contains(marker.getLatLng()); })) return;
    candidates = currentMapCandidates;
  } else {
    var first = candidates[0];
    if(candidates.some(function(m) {
      return String(m.mapId) !== String(first.mapId) || String(m.submapId) !== String(first.submapId);
    })) return;
    // The map changes: there is no pre-focus view to come back to.
    this._categoryReturnView = null;
    this.mapControl.changeMapOnly(first.mapId, first.submapId);
    this.mapControl.setCurrentMap(first.mapId, first.submapId);
    this.refreshMap();
  }
  var fit = function() {
    // The fit can wait (a drawer to settle first): if the user went back in
    // the meantime, the unfocus re-checked everything, so don't refocus.
    var menu = this.mapControl && this.mapControl._categoryMenu;
    if(navigationRequest !== this._categoryNavigationRequest || !category.checked ||
      (menu && menu.modeAutomatic)) return;
    var padding = this._visibleMapPadding();
    var bounds = L.latLngBounds(candidates.map(function(m) { return m.getLatLng(); }));
    var fitOptions = { paddingTopLeft: padding.topLeft, paddingBottomRight: padding.bottomRight,
      maxZoom: stayOnCurrentMap ? previousZoom : this.map.getMaxZoom(), animate: true };
    // Where the map was before the fit moved it, and where the fit lands:
    // the category page's Back (CategoryPage.js) returns it here when the
    // map hasn't been panned or zoomed since.
    if(this._rememberCategoryReturnView) this._rememberCategoryReturnView();
    var arrival = null;
    try { arrival = this.map._getBoundsCenterZoom ? this.map._getBoundsCenterZoom(bounds, fitOptions) : null; } catch (e) {}
    this.map.fitBounds(bounds, fitOptions);
    if(this._recordCategoryReturnArrival) this._recordCategoryReturnArrival(arrival);
  }.bind(this);
  if(this.mapControl.viewStyleBottomSlide && this.mapControl._open && !this.mapControl._partialDrawerMode) {
    this.mapControl.openDrawerDefaultPartial();
    window.setTimeout(fit, 400);
  } else if(!deferFit) {
    // deferFit: the phone drawer is closed and a page that raises it follows
    // (a landing category page); that page fits once the drawer settles, so
    // fitting now would frame the space below the closed drawer.
    fit();
  }
};

// How the map changes from one to another (ZLayers _swapMapLayer has the
// details): 'cut' (the one on screen till the new one's in, then both, map
// and markers, in one frame), 'fade' (the old markers fading at once, then
// the old map fading over the new once it's in, then the new markers) or
// 'instant' (the old map gone at once, the new one coming in over the
// page's background, its markers once its tiles are in; not for games).
// variant: another version of the same place (OoT's ages and floors,
// ALttP's Light and Dark World, TotK's Sky, Surface and Depths); map:
// another map (Switch Map, a link to somewhere else); game: another game
// (Switch Game). One place to change them (an admin setting, one day).
ZMap.prototype.MAP_TRANSITIONS = { variant: 'cut', map: 'instant', game: 'fade' };

// A map taking a while to come up (another map, floor or game picked): the
// one on screen dimmed, under a spinner, till the new one's in. On the map's
// element itself, so it lasts through a game switched in place. avoid: the
// sidebar, or a phone's sheet, for the spinner to be centred beside or
// above, in the map that can be seen.
function zmMapWaiting(container, on, avoid) {
  if(!container) return;
  var veil = null;
  for(var i = 0; i < container.children.length; i++) {
    if(container.children[i].classList.contains('zm-map-waiting')) { veil = container.children[i]; break; }
  }
  if(!on) {
    if(!veil || !veil.classList.contains('is-on')) return;
    veil.classList.remove('is-on');
    veil._zmGone = window.setTimeout(function() { veil.remove(); }, 250);
    return;
  }
  if(!veil) {
    veil = document.createElement('div');
    veil.className = 'zm-map-waiting';
    veil.setAttribute('role', 'status');
    veil.innerHTML = '<span class="zm-map-waiting-spinner" aria-hidden="true"></span><span class="zm-map-waiting-label">Loading map</span>';
    container.appendChild(veil);
  }
  window.clearTimeout(veil._zmGone);
  var left = 0, bottom = 0;
  try {
    var box = container.getBoundingClientRect(), cover = avoid && avoid.getBoundingClientRect();
    if(cover && cover.width && cover.height) {
      // A sheet along the bottom, or a sidebar down the left.
      if(cover.top > box.top + 40 && cover.width > box.width * .6) bottom = Math.max(0, box.bottom - cover.top);
      else if(cover.left <= box.left + 40 && cover.height > box.height * .6) left = Math.max(0, cover.right - box.left);
    }
  } catch(e) {}
  veil.style.setProperty('--zm-waiting-left', left + 'px');
  veil.style.setProperty('--zm-waiting-bottom', bottom + 'px');
  // (Drawn clear first, so it fades in.)
  void veil.offsetWidth;
  veil.classList.add('is-on');
}

// The part of the map not under the drawer (beside it on a desktop, above it
// on a phone), less a margin, as padding from each edge in pixels: what a fit
// frames (a focused category, a 3D map's model: Map3D.js).
ZMap.prototype._visibleMapPadding = function() {
  var rect = this.map.getContainer().getBoundingClientRect();
  var drawer = this.mapControl._container.getBoundingClientRect();
  var topLeft = [32, 72], bottomRight = [32, 32];
  if(this.mapControl.viewStyleBottomSlide) {
    bottomRight[1] += Math.max(0, rect.bottom - drawer.top);
  } else if(!this.mapControl.options.collapsed) {
    if(this.mapControl.options.position.endsWith('left')) topLeft[0] += drawer.width;
    else bottomRight[0] += drawer.width;
  }
  return { topLeft: topLeft, bottomRight: bottomRight };
};

ZMap.prototype.refreshMap = function(affectedCategories, completedChanged) {
  // Markers may appear or go (the layout notices those itself), or change
  // look: lay the place names out again afterwards.
  if(this._scheduleLabelLayout) this._scheduleLabelLayout(!!(affectedCategories || completedChanged));
  if(affectedCategories) {
    if(!$.isArray(affectedCategories)) {
      affectedCategories = [affectedCategories];
    }

    affectedCategories.forEach(
      this._updateMarkersVisiblilityByCategory,
      this
    );
  } else {
    if(completedChanged) {
      this._updateMarkersPresence(
        completedMarkers.map(function(completedMarkerId) {
          return this.cachedMarkersById[completedMarkerId];
        }, this)
      );
    } else {
      this._updateMarkersPresence(markers); // uses global....
    }
  }

  this.checkWarnUserSeveralEnabledCategories();
  if(this.mapControl && this.mapControl._categoryMenu) {
    this.mapControl._categoryMenu.categoryButtons.forEach(function(button) { button.updateCategoryLabel(); });
  }
  // Paths follow their categories and the map shown (scripts/services/Paths.js).
  if(this.drawPaths) this.drawPaths(true);
};

ZMap.prototype._updateMarkersVisiblilityByCategory = function(affectedCategory) {
  if(!affectedCategory) return;

  var markers = this.cachedMarkersByCategory[affectedCategory.id];
  if(markers) {
    markers.forEach(function (marker) {
      marker.visible = affectedCategory.checked;
    });
  }

  this._updateMarkersPresence(markers);
};

ZMap.prototype._updateMarkersPresence = function(markers) {
  if(!markers) return;

  // The visible area, measured once for all of them rather than per marker.
  mapBounds = this.map.getBounds().pad(0.15);
  markers.forEach(function(marker) {
    this._updateMarkerPresence(marker, true);
  }, this);
  verboseFirst = true;
};

// The look of a marker's icon: its category, whether it's complete, and the
// size it's drawn at. setIcon replaces the icon's element (it blinks), so
// it's only called when this changes.
// Whether a marker shows as done: its own check, or, for a single path's
// later marker (a Korok pair's finish), its path's first marker's
// (scripts/services/Paths.js sets pathLead).
ZMap.prototype._markerShownDone = function(marker) {
  var check = marker.pathFollower && marker.pathLead ? marker.pathLead : marker;
  return check.complete === true || check.complete == 1;
};

ZMap.prototype._markerIconKey = function(marker) {
  return marker.categoryId + ':' + (this._markerShownDone(marker) ? 1 : 0) + ':' +
    (this._getDisplayZoom() > this.mapOptions.switchIconsAtZoom ? 'medium' : 'small');
};

ZMap.prototype._updateMarkerPresence = function(marker, boundsMeasured) {
  if(!boundsMeasured) mapBounds = this.map.getBounds().pad(0.15);

  // OoT: markers for things either age can get (globalMarker) show on both
  // the Child and Adult maps, as one marker.
  var everySubmap = isOcarina(this.mapOptions.shortName) && marker.globalMarker == 1;
  if (
       this.mapControl.getCurrentMap().mapId    != marker.mapId
    || (!everySubmap && this.mapControl.getCurrentMap().subMapId != marker.submapId)
  ) {
    this.map.removeLayer(marker);

    if (marker.path != undefined && marker.path != null && marker.path != "") {
      this.map.removeLayer(marker.path);
      this.map.removeLayer(marker.pathDecorator);
    }

    return;
  }

  if(this._shouldShowMarker(marker)) {
    if(marker.categoryTypeId != 3) {
      var iconKey = this._markerIconKey(marker);
      if(marker._iconKey !== iconKey) {
        marker._iconKey = iconKey;
        marker.setIcon(_this._createMarkerIcon(marker.categoryId, _this._markerShownDone(marker)));
      }
    }
    this.map.addLayer(marker);

    if (marker.path != undefined && marker.path != null && marker.path != "") {
      marker.path.addTo(this.map);
      marker.pathDecorator.addTo(this.map);
    }
  } else {
    this.map.removeLayer(marker);

    if (marker.path != undefined && marker.path != null && marker.path != "") {
      this.map.removeLayer(marker.path);
      this.map.removeLayer(marker.pathDecorator);
    }
  }
};

// ignoreBounds: answer whether the marker is hidden for any reason other than
// being culled outside the viewport.
ZMap.prototype._shouldShowMarker = function(marker, ignoreBounds) {
  var markerCategory = this.categories[marker.categoryId];

  // Data Handling Investigation Display
  // Currently all possible data is shown, no conditional presence.
  if(verbose && verboseFirst) {
    console.log('- marker category'                                     );
    console.log(`  - id                : ${marker.categoryId}`          );
    console.log(`  - type id           : ${marker.categoryTypeId}`      );
    console.log(`  - checked           : ${markerCategory.checked}`     );
    console.log(`  - visible zoom level: ${markerCategory.visible_zoom}`);
    console.log();

    var markerLL = marker.getLatLng();
    console.log('- marker'                                              );
    console.log(`  - visiblility       : ${marker.visible}`             );
    console.log(`  - coordinates lat   : ${markerLL.lat}`               );
    console.log(`  - coordinates lng   : ${markerLL.lng}`               );
    console.log(`  - completion        : ${marker.complete}`            );
    console.log();

    var mapBoundsCurr = this.map.getBounds();
    console.log('- map'                                                 );
    console.log(`  - view/bounds coordinates      : N/S ${
      mapBoundsCurr.getNorth()}/${mapBoundsCurr.getSouth()
    }`);
    console.log(`  - view/bounds coordinates      : W/E ${
      mapBoundsCurr.getWest()}/${mapBoundsCurr.getEast()
    }`);
    console.log(`  - zoom level current           : ${this.map.getZoom()}`);
    console.log(`  - show completed markers choice: ${
      this.mapOptions.showCompleted
    }`);
    console.log(`  - category selection method    : ${
      this.mapOptions.categorySelectionMethod
    }`);
    console.log(`  - category selection mode auto : ${
      this.mapControl._categoryMenu.modeAutomatic
    }`);
    console.log();

    // Specific Conditional Results
    console.log(`does mapBounds contain marker: ${mapBounds.contains(marker.getLatLng())}`);
    console.log(
      'is marker category zoom level\n' +
      'below or equal to the map\'s\n' +
      `current                      : ${
        markerCategory.visible_zoom <= this._getDisplayZoom()
    }`);
    console.log(
      'show incomplete marker if\n' +
      `generally restricted         : ${
        this.mapOptions.showCompleted == false && marker.complete != true
    }`);

    verboseFirst = false;
  }

  if (marker.categoryTypeId == 1 || marker.categoryTypeId == 2) {
    // A path in focus (scripts/services/Paths.js): its own markers alone,
    // whichever categories they're in.
    if (this._pathFocusIds) {
      return !!this._pathFocusIds[marker.id] && marker.visible
        && (ignoreBounds || mapBounds.contains(marker.getLatLng()));
    }
    return marker.visible
    && this.mapOptions.showPoiLabels !== false
    && markerCategory.checked
    && (ignoreBounds || mapBounds.contains(marker.getLatLng()))  // Is in the Map Bounds (PERFORMANCE)
    && (
      (this.mapControl.currentMapLayer && this.mapControl.currentMapLayer.alwaysShowCategories)
      || (!markerCategory._respectZoomThreshold && (
        this.mapOptions.categorySelectionMethod != "focus"
        || !this.mapControl._categoryMenu.modeAutomatic
      ))
      || markerCategory.visible_zoom <= this._getDisplayZoom()
    ) // Check if we should show for the category, and at this zoom level, for focus modes
    && (
      this.mapOptions.showCompleted == true || (
        this.mapOptions.showCompleted == false
        && !(this._markerShownDone ? this._markerShownDone(marker) : marker.complete == true)
      )
    ); // Should we show completed markers?
  } else if (marker.categoryTypeId == 3) {
    return marker.visible
      && (ignoreBounds || mapBounds.contains(marker.getLatLng()))  // Is in the Map Bounds (PERFORMANCE)
      && (
        this.mapOptions.categorySelectionMethod == "focus"
        && this.categories[marker.categoryId].visible_zoom <= this._getDisplayZoom()
        && this._labelTierShown(this.categories[marker.categoryId].name)
        && !this._labelShownCloser(marker)
      ) // Check if we should show for the category, and at this zoom level
      && (
        this.mapOptions.showCompleted == true || (
         this.mapOptions.showCompleted == false
         && marker.complete != true
        )
      ) // Should we show completed markers?

     ;
   }
}

// Region and place names come in tiers (TotK's and BotW's label categories,
// by name): region names zoomed out, then areas; place names from zoom 5 on,
// joined by the close-up ones from zoom 6, both staying as you zoom in.
ZMap.prototype._labelTierShown = function(categoryName) {
  var zoom = this._getDisplayZoom();
  // A game with only some tiers lets the next one fill in: OoT has only area
  // names, shown at every zoom.
  var has = this._labelTiers || (this._labelTiers = (function(categories) {
    var names = {};
    Object.keys(categories).forEach(function(id) {
      if(categories[id].marker_category_type_id == 3) names[categories[id].name] = true;
    });
    return names;
  })(this.categories));
  switch(categoryName) {
    case 'Region Labels': return zoom <= 3;
    case 'Area Labels':
      return (!has['Region Labels'] || zoom > 3) && (!has['Places Labels'] || zoom <= 5);
    case 'Places Labels': return zoom > 5;
    case 'Places Labels - Close': return zoom > 6;
    default: return false;
  }
};

// Leaflet places the map artwork for where a zoom animation was heading. If
// the map moves on before it ends (a quick pinch and pan), the artwork stays
// placed for that old spot while markers, names and lines follow the map: the
// artwork ended up shifted under everything, by 100px or more. Each time the
// map comes to rest, place the artwork for where it actually is.
L.Map.addInitHook(function() {
  this.on('moveend zoomend', function() {
    if(this._animatingZoom) return;
    var center = this.getCenter(), zoom = this.getZoom();
    this.eachLayer(function(layer) {
      if(layer instanceof L.GridLayer && layer._levels && layer._map) layer._setZoomTransforms(center, zoom);
    });
  });
});

// A name whose marker leaves the screen fades out for 200ms before Leaflet
// removes it, so if the marker comes back sooner (a quick pinch or pan) the
// same name is shown again, still holding its old, off-screen position. If a
// zoom animation is playing, the browser glides it in from there: names
// flew in from across the map after a pinch. A name that comes back goes
// straight to its place, and glides with zooms again from two frames on.
(function() {
  var onAdd = L.Tooltip.prototype.onAdd;
  L.Tooltip.include({
    onAdd: function() {
      var container = this._container;
      if(container) container.style.transition = 'none';
      var result = onAdd.apply(this, arguments);
      if(container) {
        window.cancelAnimationFrame(this._glideFrame);
        this._glideFrame = window.requestAnimationFrame(function() {
          this._glideFrame = window.requestAnimationFrame(function() { container.style.transition = ''; });
        }.bind(this));
      }
      return result;
    }
  });
})();

ZMap.prototype._setupLabelLayout = function() {
  var zmap = this, map = this.map, frame = null, laidOutAt = null, changed = true;
  // Names are laid out from those on screen, so again when the zoom changes,
  // a marker or name comes or goes, or the site says something changed
  // (schedule(true)); not on every pan step. Spread markers come from every
  // marker on the map, so a pan never moves them.
  map.on('layeradd layerremove', function(e) {
    if(e.layer instanceof L.Marker || e.layer instanceof L.Tooltip) changed = true;
  });
  var schedule = function(force) {
    if(force === true) changed = true;
    if(frame) window.cancelAnimationFrame(frame);
    frame = window.requestAnimationFrame(function() {
      frame = null;
      // (A frame asked for just before switching games: that map's gone.)
      if(zmap.map !== map) return;
      var zoom = map.getZoom();
      if(!changed && zoom === laidOutAt) return;
      changed = false;
      laidOutAt = zoom;
      zmap.spreadOverlappingMarkers(zoom);
      zmap.layoutLabelMarkers();
    });
  };
  map.on('zoomend moveend', function() { schedule(); });
  // A marker coming on screen while markers are spread takes its nudge.
  map.on('layeradd', function(e) {
    var marker = e.layer;
    // A selected marker's pin takes that marker's nudge.
    if(marker && marker._spreadMarker) { zmap._syncPinSpread(marker); return; }
    if(!zmap._markersSpread || !(marker instanceof L.Marker) || !marker._icon || marker.categoryTypeId == 3) return;
    var offset = (zmap._spreadOffsets || {})[marker.id];
    marker._icon.style.translate = offset ? offset[0] + 'px ' + offset[1] + 'px' : '';
  });
  // Markers spread or collapse as a zoom heads into or out of range: as an
  // animated zoom starts, and every frame of a pinch.
  map.on('zoomanim zoom', function(e) {
    if(e.type === 'zoomanim') zmap.spreadOverlappingMarkers(e.zoom);
    else if(!map._animatingZoom) zmap.spreadOverlappingMarkers(map.getZoom());
  });
  this._scheduleLabelLayout = schedule;
  schedule(true);
};

// Markers at the same spot, or near enough that their icons cover each
// other, move apart just enough to be clicked, but only when zoomed in very
// close (within SPREAD_ZOOMS of the closest zoom). Further out, every icon
// stays on its true spot, overlapping or not. Up close, overlapping icons
// push each other away a little at a time until none overlaps, so each
// stays as near its true position as it can; they animate there from their
// spots (and back when zooming out), so it's clear they've moved. Only the
// icons move (CSS translate, which adds to Leaflet's own positioning), not
// the markers. Worked out from every marker that would show on this map, not
// just those on screen, so panning never moves an icon (_spreadOffsetsForMap).
ZMap.prototype.SPREAD_ZOOMS = 1;
ZMap.prototype._spreadsAtZoom = function(zoom) {
  return zoom >= this.map.getMaxZoom() - this.SPREAD_ZOOMS - 0.001;
};
ZMap.prototype._collapseSpreadMarkers = function() {
  this.getMarkers().forEach(function(marker) {
    if(marker && marker._icon) marker._icon.style.translate = '';
  });
  this._markersSpread = false;
  this._syncPinSpread();
};
ZMap.prototype.spreadOverlappingMarkers = function(zoom) {
  if(zoom === undefined) zoom = this.map.getZoom();
  if(!this._spreadsAtZoom(zoom)) { if(this._markersSpread) this._collapseSpreadMarkers(); return; }
  var offsets = this._spreadOffsetsForMap();
  this.getMarkers().forEach(function(marker) {
    if(!marker || !marker._icon || marker.categoryTypeId == 3) return;
    var offset = offsets[marker.id], value = offset ? offset[0] + 'px ' + offset[1] + 'px' : '';
    if(marker._icon.style.translate !== value) marker._icon.style.translate = value;
  });
  this._markersSpread = true;
  this._syncPinSpread();
};

// The markers that would show on the current map at a zoom (any that aren't
// hidden for a reason other than being off screen), labels left out unless
// asked for.
ZMap.prototype._markersOnThisMap = function(labels, zoom) {
  var zmap = this, current = this.mapControl.getCurrentMap(), ocarina = isOcarina(this.mapOptions.shortName);
  this._layoutZoom = zoom;
  try {
    return this.getMarkers().filter(function(marker) {
      if(!marker || (marker.categoryTypeId == 3) !== !!labels || marker.mapId != current.mapId) return false;
      if(marker.submapId != current.subMapId && !(ocarina && marker.globalMarker == 1)) return false;
      return zmap._shouldShowMarker(marker, true);
    });
  } finally {
    this._layoutZoom = undefined;
  }
};

// How far each marker is nudged, {marker id: [x, y] in pixels}. Worked out
// once, at the zoom spreading starts, and kept for every closer zoom: zooming
// in only parts markers further, so nudges that kept them apart there keep
// them apart closer in, and a spread marker never moves again until it
// collapses. Worked out afresh only when the map or what's shown changes.
ZMap.prototype._spreadOffsetsForMap = function() {
  var map = this.map, current = this.mapControl.getCurrentMap();
  var zoom = map.getMaxZoom() - this.SPREAD_ZOOMS;
  var size = Number(Math.round(zoom) > this.mapOptions.switchIconsAtZoom ? this.mapOptions.iconWidth : this.mapOptions.iconSmallWidth) || 22;
  // Every marker that shows anywhere in spreading range (some only appear
  // closer in), so none turns up later needing a nudge.
  var candidates = this._markersOnThisMap(false, map.getMaxZoom());
  var key = [current.mapId, current.subMapId, zoom, size, candidates.map(function(m) { return m.id; }).join(',')].join('|');
  if(this._spreadKey !== key) {
    this._spreadKey = key;
    this._spreadOffsets = this._spreadPositions(candidates.map(function(marker) {
      var at = map.project(marker.getLatLng(), zoom);
      return {marker: marker, x: at.x, y: at.y, px: at.x, py: at.y, id: Number(marker.id)};
    }), size + 1);
  }
  return this._spreadOffsets;
};

// Pushes overlapping items (closer than gap) apart by half the overlap each,
// a few rounds, and returns how far each moved: {marker id: [x, y]}.
ZMap.prototype._spreadPositions = function(items, gap) {
  var closePairs = function() {
    var cells = {}, pairs = [];
    items.forEach(function(item) {
      var key = Math.floor(item.px / gap) + ':' + Math.floor(item.py / gap);
      (cells[key] = cells[key] || []).push(item);
    });
    items.forEach(function(item) {
      var cx = Math.floor(item.px / gap), cy = Math.floor(item.py / gap);
      for(var dx = -1; dx <= 1; dx++) for(var dy = -1; dy <= 1; dy++) {
        (cells[(cx + dx) + ':' + (cy + dy)] || []).forEach(function(other) {
          if(item.id < other.id && Math.hypot(other.px - item.px, other.py - item.py) < gap) pairs.push([item, other]);
        });
      }
    });
    return pairs;
  };
  for(var round = 0; round < 40; round++) {
    var pairs = closePairs();
    if(!pairs.length) break;
    pairs.forEach(function(pair) {
      var a = pair[0], b = pair[1], dx = b.px - a.px, dy = b.py - a.py, d = Math.hypot(dx, dy);
      // Markers at the very same spot: part them in a fixed direction, by
      // their IDs, so the same markers always open the same way.
      if(d < 0.01) { var angle = ((a.id * 7 + b.id * 13) % 360) * Math.PI / 180; dx = Math.cos(angle); dy = Math.sin(angle); d = 1; }
      var push = (gap - Math.hypot(b.px - a.px, b.py - a.py)) / 2 + 0.25;
      a.px -= dx / d * push; a.py -= dy / d * push;
      b.px += dx / d * push; b.py += dy / d * push;
    });
  }
  var offsets = {};
  items.forEach(function(item) {
    var tx = Math.round(item.px - item.x), ty = Math.round(item.py - item.y);
    if(tx || ty) offsets[item.marker.id] = [tx, ty];
  });
  return offsets;
};

ZMap.prototype.layoutLabelMarkers = function() {
  var map = this.map, points = [], labels = [];
  this.getMarkers().forEach(function(marker) {
    if(!map.hasLayer(marker)) return;
    if(marker.categoryTypeId == 3) {
      var tooltip = marker.getTooltip && marker.getTooltip();
      var element = tooltip && tooltip.getElement && tooltip.getElement();
      if(element) labels.push({marker: marker, element: element});
    } else {
      points.push(map.latLngToContainerPoint(marker.getLatLng()));
    }
  });
  // A game whose names are all in one tier shown at every zoom (OoT's Area
  // Labels) grows them as you zoom in, from 11px to 18px.
  // Always in the same order (as added), so names don't swap places as
  // markers load in a different order.
  labels.sort(function(a, b) { return Number(a.marker.id) - Number(b.marker.id); });
  var zmap = this, zoom = map.getZoom();
  var growing = Math.max(11, Math.min(18, 11 + (zoom - 1) * 1.4)) + 'px';
  var placed = [];
  labels.forEach(function(label) {
    var element = label.element;
    var tier = zmap.categories[label.marker.categoryId];
    var fontSize = tier && zmap._labelTierAtEveryZoom(tier.name) ? growing : '';
    if(element.style.fontSize !== fontSize) {
      element.style.fontSize = fontSize;
      // Leaflet centres a name by its size when drawn: re-centre it at the new size.
      label.marker.getTooltip().update();
    }
    // The text's own box: the name's padding is invisible, so it shouldn't
    // count as covering a marker.
    var rect = element.getBoundingClientRect(), style = window.getComputedStyle(element);
    var width = rect.width - (parseFloat(style.paddingLeft) || 0) - (parseFloat(style.paddingRight) || 0);
    var height = Math.max(16, rect.height - (parseFloat(style.paddingTop) || 0) - (parseFloat(style.paddingBottom) || 0));
    if(!(width > 0)) return;
    var origin = map.latLngToContainerPoint(label.marker.getLatLng());
    var dy = height + 2, dx = width * .3;
    var best = null;
    [[0, 0], [0, -dy], [0, dy], [0, -dy * 2], [0, dy * 2], [-dx, -dy], [dx, -dy], [-dx, dy], [dx, dy]].forEach(function(offset) {
      var box = {left: origin.x + offset[0] - width / 2, right: origin.x + offset[0] + width / 2,
        top: origin.y + offset[1] - height / 2, bottom: origin.y + offset[1] + height / 2};
      var collisions = points.filter(function(p) {
        return p.x > box.left - 14 && p.x < box.right + 14 && p.y > box.top - 14 && p.y < box.bottom + 14;
      }).length;
      collisions += placed.filter(function(other) {
        return box.left < other.right + 4 && box.right > other.left - 4 && box.top < other.bottom + 4 && box.bottom > other.top - 4;
      }).length * 2;
      var score = collisions * 100 + Math.hypot(offset[0], offset[1]);
      if(!best || score < best.score) best = {score: score, offset: offset, box: box};
    });
    element.style.marginLeft = Math.round(best.offset[0]) + 'px';
    element.style.marginTop = Math.round(best.offset[1]) + 'px';
    // Still on top of another name wherever it goes (a crowded map zoomed
    // out, like ALttP's Caves & Houses): leave it out until there's room.
    var overlaps = placed.some(function(other) {
      return best.box.left < other.right && best.box.right > other.left && best.box.top < other.bottom && best.box.bottom > other.top;
    });
    element.style.visibility = overlaps ? 'hidden' : '';
    if(!overlaps) placed.push(best.box);
  });
};

// Some games list a place under both place tiers (TotK's Great Sky Island).
// Once the close-up tier is showing too, the place tier's copy steps aside.
ZMap.prototype._labelShownCloser = function(marker) {
  var category = this.categories[marker.categoryId];
  if(!category || category.name !== 'Places Labels' || !this._labelTierShown('Places Labels - Close')) return false;
  var zmap = this;
  var close = this._closeLabelNames || (this._closeLabelNames = (function() {
    var names = Object.create(null);
    zmap.getMarkers().forEach(function(label) {
      var tier = label.categoryTypeId == 3 && zmap.categories[label.categoryId];
      if(tier && tier.name === 'Places Labels - Close') names[label.submapId + ':' + (label.title || label.name)] = true;
    });
    return names;
  })());
  return !!close[marker.submapId + ':' + (marker.title || marker.name)];
};

// Whether a label tier is the game's only one, so shown at every zoom.
ZMap.prototype._labelTierAtEveryZoom = function(categoryName) {
  this._labelTierShown(categoryName);
  var has = this._labelTiers || {};
  return categoryName === 'Area Labels' && !has['Region Labels'] && !has['Places Labels'];
};

ZMap.prototype.buildMap = function(gameId) {
  // console.log("Leaflet Version: "    + L.version     );
  // console.log("Zelda Maps Version: " + _this.version );

  // TOTK
  //   let scale = 36000/256/12000;
  //   let offsetX = 36000/256/2;
  //   let offsetY = 30000/256/2;

  let ZCRS = L.extend({}, L.CRS.Simple, {
    transformation: new L.transformation(
      this.mapOptions.scaleP,
      parseFloat(this.mapOptions.offsetX),
      this.mapOptions.scaleN,
      parseFloat(this.mapOptions.offsetY)
    )
  });

  if(this.maps.length == 0) {
    zLogger.error('No maps provided to load!');
    return 1;
  }

  var mainEl = $('main')[0];

  if(!mainEl) {
    zLogger.error('No main page element to add to!');
    return 2;
  }

  $.extend(
    true      ,
    this.mapOptions,
    {
      crs:          ZCRS,
      contextmenu:  ZConfig.getConfig('contextmenu' ) == 'false',
      contextmenuWidth: Number.parseInt(
        ZConfig.getConfig('contextmenuWidth')
      ),
      layers:       [this.maps[0]],
      // Pinches stretch a little past the zoom limits and spring back
      // (_addZoomRubberBand).
      bounceAtZoomLimits: true,
      maxBoundsViscosity: Number.parseFloat(
        ZConfig.getConfig('maxBoundsViscosity')
      ),
      zoom:         Number.parseFloat(
           this.mapOptions.zoom
	      || ZConfig.getConfig('zoom')
        || ZConfig.getConfig(`zoom-${gameId}`)
      ),
      zoomControl:  ZConfig.getConfig('zoomControl' ) == 'true',
      zoomDelta:    Number.parseFloat(ZConfig.getConfig('zoomDelta' )),
      zoomSnap:     Number.parseFloat(ZConfig.getConfig('zoomSnap'  ))
    }
  );

  this.mapOptions.center = new L.LatLng((
          ZConfig.getConfig('centerY')
      ||  ZConfig.getConfig('y')
      ||  ZConfig.getConfig(`centerY-${gameId}`)
      ||  ZConfig.getConfig(`y-${gameId}`)
      ||  this.mapOptions.centerY
    ), (
          ZConfig.getConfig('centerX')
      ||  ZConfig.getConfig('x')
      ||  ZConfig.getConfig(`centerX-${gameId}`)
      ||  ZConfig.getConfig(`x-${gameId}`)
      ||  this.mapOptions.centerX
    )
  );
  if(ZConfig.getConfig('enforceMaxBounds') != 'false') {
    this.mapOptions.maxBounds = new L.LatLngBounds(
      new L.LatLng(
            ZConfig.getConfig('boundTopX')
        ||  ZConfig.getConfig(`boundTopX-${gameId}`)
        ||  this.mapOptions.boundTopX,
            ZConfig.getConfig('boundTopY')
        ||  ZConfig.getConfig(`boundTopY-${gameId}`)
        ||  this.mapOptions.boundTopY
      ),
      new L.LatLng(
            ZConfig.getConfig('boundBottomX')
        ||  ZConfig.getConfig(`boundBottomX-${gameId}`)
        ||  this.mapOptions.boundBottomX,
            ZConfig.getConfig('boundBottomY')
        ||  ZConfig.getConfig(`boundBottomY-${gameId}`)
        ||  this.mapOptions.boundBottomY
      )
    );
  }

  this.map = L.map(mainEl, this.mapOptions);
  this._addMapGridBackground();
  this._limitZoomToMapBounds();
  this._addZoomRubberBand();
  var map = this.map;
  var updateMobileMapHeight = function() {
    if(!isMobile()) {
      document.documentElement.style.removeProperty('--mobile-map-height');
      return;
    }

    // Safari pans the visual viewport to reveal an iframe's caret. That
    // offset is not a change to the map's layout height. Subtracting it
    // shrank the clipping container above the focused editor (black screen).
    // Preserve its pre-keyboard dimensions, just like the drawer itself.
    if(this.mapControl && this.mapControl._keyboardDrawerViewport) return;

    var viewportTop = window.visualViewport
      ? window.visualViewport.offsetTop
      : 0;
    // (In an embed, the frame's own height: the screen's is the page around it.)
    var height = document.documentElement.classList.contains('zm-framed') ? window.innerHeight : Math.max(
      window.innerHeight,
      window.screen.height - viewportTop
    );
    document.documentElement.style.setProperty('--mobile-map-height', height + 'px');
  }.bind(this);
  // Resizes keep the map's top edge still, so it doesn't jump as a phone's
  // toolbars come and go. While the page is still settling (until the map is
  // first touched, or for a few seconds), they keep its centre instead: the
  // map grows once its full height is set, and keeping the top edge then
  // moved the view half that growth from where the address put it, a little
  // further on every reload.
  var settling = true;
  var settled = function() { settling = false; };
  // (Taken off with the map, if never fired: a game switched in place.)
  ['mousedown', 'touchstart', 'wheel', 'keydown'].forEach(function(type) {
    this._onPage(map.getContainer(), type, settled, { once: true, passive: true });
  }, this);
  window.setTimeout(settled, 5000);
  var invalidateMapSize = function() {
    updateMobileMapHeight();
    window.requestAnimationFrame(function() {
      if(this.map === map) map.invalidateSize(settling ? { pan: true, animate: false } : { pan: false });
    }.bind(this));
  }.bind(this);
  this._onPage(window, 'resize', invalidateMapSize);
  if(window.visualViewport) {
    this._onPage(window.visualViewport, 'resize', invalidateMapSize);
  }
  if(window.ResizeObserver) {
    var sizeObserver = this._mapSizeObserver = new window.ResizeObserver(invalidateMapSize);
    sizeObserver.observe(mainEl);
    this._onCleanup(function() { sizeObserver.disconnect(); });
  }
  invalidateMapSize();

  if(ZConfig.getConfig('trackpadGestures') != 'false') {
    this.trackpadGestureHandler = new TrackpadGestureHandler(this.map);
  }

  // Get all the base maps
  this.baseMaps = {};
  for (var i = 0; i < this.maps.length; i++) {
    this.baseMaps[this.maps[i].title] = this.maps[i];
  }

  //map.addLayer(markerCluster);

  // Change visible region to that specified by the corner coords if relevant query strings are present
  this.mapOptions.startArea = (
        ZConfig.getConfig('startArea')
    ||  ZConfig.getConfig(`startArea-${gameId}`)
  );
  if (this.mapOptions.startArea) {
    var boundsArr = this.mapOptions.startArea.split(',');
    if (boundsArr.length === 4) {
      this.map.fitBounds([
        boundsArr.slice(0, 2),
        boundsArr.slice(2, 4)
      ]);
    }
  }

  this.map.on(
    'zoomend',
    function() {
      if (this._getDisplayZoom() > 5 && currentIcon == 'Small') {
        currentIcon = 'Medium';
      } else if (this._getDisplayZoom() <= 5 && currentIcon == 'Medium') {
        currentIcon = 'Small';
      } else {
        return;
      }

      var mapBounds = this.map.getBounds().pad(0.15);

      for (var i = markers.length -1; i >= 0; i--) {
        var m = markers[i];
        // (Not one replaced by a save or deleted: it has no category left.)
        if (!_this.categories[m.categoryId]) continue;
        if (mapBounds.contains(m.getLatLng()) && m.categoryTypeId != 3 && m._iconKey !== _this._markerIconKey(m)) {
          m._iconKey = _this._markerIconKey(m);
          m.setIcon(_this._createMarkerIcon(m.categoryId, m.complete));
        }
      }
    },
    this
  );

  _this._buildContextMenu();

  this.addMapControl();
};

ZMap.prototype.addMapControl = function(gameId) {
  var mapControlOptions = $.extend(
    this.mapOptions, {
    collapsed: ZConfig.getConfig('collapsed') == 'true',
    defaultToggledState: (
      (this.categoriesSelectedIdPairsObject)
      ? undefined
      : (ZConfig.getConfig('categorySelectionMethod') == 'focus')
    ),
    maps: this.maps,
    zIndex: 0,
    zMap: this
  });

  this.mapControl = L.control.zlayers(
    this.baseMaps,
    {},
    mapControlOptions
  );
  if(!this.mapControl.isMobile) {
    var posBR = { position: 'bottomright' };
    L.control.zoom(posBR).addTo(this.map);
    if(this.mapControl.isMobile) {
      L.control.infoBox.location.center(posBR).addTo(this.map);
    } else {
      L.control.infoBox.mouseCoords({
        mode    : 'mini'        ,
        position: 'bottomright'
      }).addTo(this.map);
    }
  }

  if (
        this.mapOptions.showInfoControls
    ||  ZConfig.getConfig("showInfoControls") == 'true'
  ) {
    $('.leaflet-container').css('cursor', 'crosshair');

    var posBL = { position: 'bottomleft' };
    L.control.infoBox.mouseClickHist(posBL).addTo(this.map);
    if(!this.mapControl.isMobile) {
      L.control.infoBox.location.center(posBL).addTo(this.map);
    }
    L.control.infoBox.location.bounds(posBL).addTo(this.map);

    if (this.map.options.maxBounds) {
      L.control.infoBox.location.bounds({
        boundsFn: function() {
          return  this.map.options.maxBounds;
        }.bind(this),
        position: 'bottomleft',
        title: 'Max Bounds Coordinates'
      }).addTo(this.map);
    }
  }

  //@TODO: REDO!
  this.mapControl.setCurrentMap(
    parseInt(this.maps[0].originalId),
    parseInt(this.maps[0].defaultSubMapId)
  );
  this.mapControl.setCurrentMapLayer(this.maps[0]);
  this.mapControl.addTo(this.map);
  // The other floors and ages, ready (ZLayers _preloadVariants).
  if(this.mapControl._startPreloadingVariants) this.mapControl._startPreloadingVariants();
  // Credits under images, as pages show them (scripts/services/ImageCredits.js).
  if(this._watchImageCredits) this._watchImageCredits(this.mapControl._contents);
  this.settingsControl = L.control.settings({
    zMap: this,
    mapControl: this.mapControl
  }).addTo(this.map);
  if(this._updateMinZoom) this._updateMinZoom();
  this._setupLabelLayout();
  this._setupDroppedPinGesture();
  this._setupMarkerTouchTaps();
  this._setupDoubleTapZoom();

  // TODO keyboard accessibility

  this.map.on('baselayerchange', function(e) {
    //@TODO: Fix this null value - (for light / dark) - this is when a layer updates
    //       Defaulting to the first layer for now - workaround!!!!!
    var defaultSubMapId = e.defaultSubMapId;
    var i;
    for (i = 0; i < _this.maps.length; i++) {
      if (defaultSubMapId == null && _this.maps[i].originalId == e.originalId) {
            defaultSubMapId = _this.maps[i].defaultSubMapId;
            break;
         }
    }
    // END OF WORKAROUND!!!
    //console.log(e.originalId + " " + defaultSubMapId);
    var sameOotMap = _this.mapOptions.submapLayers && _this.mapControl.currentMap == e.originalId;
    // Maps that are each the game's whole space (TotK's Sky, Surface and
    // Depths: no bounds of their own) are the same place: the view stays.
    var previousLayer = _this.maps.find(function(layer) { return layer.originalId == _this.mapControl.currentMap; });
    var sameSpace = sameOotMap || (!_this.mapOptions.submapLayers && previousLayer && previousLayer !== e &&
      !previousLayer.mapBounds && !e.mapBounds);
    _this.mapControl.setCurrentMap(parseInt(e.originalId), parseInt(defaultSubMapId));
    if(_this.sortCategoryRegionsForCurrentMap) _this.sortCategoryRegionsForCurrentMap();
    if(isOcarina(_this.mapOptions.shortName)) _this._reconcileOotMarkerSelection(e.originalId, defaultSubMapId);
    _this.refreshMap();
    if(!isOcarina(_this.mapOptions.shortName)) _this._closeNewMarker();
    //this.mapControl.resetContent();

    if(!sameSpace) _this.map.setView(new L.LatLng(
      _this.mapOptions.centerY,
      _this.mapOptions.centerX
    ), _this.map.getZoom());
    _this.applyOotMapBounds();
    // (The layer itself: e is Leaflet's copy of its properties, which the
    // fit would never find to be the map on screen.)
    var openedLayer = _this.mapControl.currentMapLayer;
    if(!sameSpace && _this._fitsWhenOpened(openedLayer)) _this._fitToMapBounds(openedLayer);
  });
  // Open the map the address names (?map=2101 is TotK's Surface), on every
  // game, keeping the address's view: switching maps otherwise recentres.
  var requestedMap = ZConfig.getConfig('map'), requestedSubMap = ZConfig.getConfig('subMap');
  var openedMap = this.mapControl.getCurrentMap();
  // Whether the address gave a view of its own, read before anything below
  // writes the current view into it.
  var addressHasView = new URL(window.location.href).searchParams.has('zoom');
  // OoT's Child and Adult are one map's two submaps.
  if(requestedMap && (requestedMap != openedMap.mapId || (requestedSubMap && requestedSubMap != openedMap.subMapId))) {
    var requestedView = { center: this.map.getCenter(), zoom: this.map.getZoom() };
    this.mapControl.changeMapOnly(requestedMap, requestedSubMap);
    // A map that fits itself when opened does so, unless the address says where to look.
    if(addressHasView || !this._fitsWhenOpened(this.mapControl.currentMapLayer)) {
      this.map.setView(requestedView.center, requestedView.zoom, { animate: false });
    }
  }
  if(this.mapOptions.submapLayers && this.setupOotFloors) this.setupOotFloors();
  this.applyOotMapBounds();
  var initialLayer = this.mapControl.currentMapLayer;
  if(this._fitsWhenOpened(initialLayer) && !addressHasView) {
    this._fitToMapBounds(initialLayer);
  }

  // (Taken off with the map: a game switched in place leaves none behind.)
  var pageKeydown = function(e) {
    if(e.key == "Escape") {
      // (An embed keeps what it shows.)
      if(_this.isFramed()) return;
      if(_this.mapControl._contentType != _this.mapControl.options.defaultContentType) {
        _this.mapControl.resetContent();
        _this._closeNewMarker()
      } else if(_this.mapControl.viewStyleBottomSlide) {
        _this.mapControl.toggle();
      } else if(!_this.mapControl.options.collapsed && _this.settingsControl) {
        // Escape hides the desktop sidebar (Minimal UI) but doesn't bring it back.
        _this.settingsControl.setMinimalUI(true);
      }
    } else if(e.ctrlKey && e.key == "U") {
      _this.updateUrl();
      zLogger.info('Manually updated URL!');
    }
  }.bind(this.mapControl);
  $(document).on('keydown', pageKeydown);
  this._onCleanup(function() { $(document).off('keydown', pageKeydown); });

  // A trackpad pan ends a move every frame: refresh markers at most every
  // 150ms while it goes on, and once when it stops, rather than every frame
  // (each refresh visits every marker).
  var refreshTimer = null, lastRefresh = 0;
  var refreshAfterMove = function() {
    clearTimeout(refreshTimer);
    var wait = Math.max(0, 150 - (performance.now() - lastRefresh));
    var run = function() { lastRefresh = performance.now(); refreshTimer = null; _this.refreshMap(); };
    if(wait === 0) run(); else refreshTimer = setTimeout(run, wait);
  };
  this.map.on('moveend', function(e) {
    refreshAfterMove();
    if (
      newMarker != null
      && newMarker.markerPos != null
      && !_this.map.hasLayer(markers[newMarker.markerPos])
      // Markers are culled outside the viewport; only deselect when hidden.
      && !_this._shouldShowMarker(markers[newMarker.markerPos], true)
      // (Not an embed's marker: an embed hides all the others, hideOthers,
      // and the map moving as a phone-shaped frame settles would close it.)
      && !_this.isFramed()
      // (Not on a 3D map: it shows its markers whatever the 2D zoom, which
      // moves under it as a marker's picked.)
      && !(_this.mapControl.currentMapLayer && _this.mapControl.currentMapLayer.mapKind === '3d')
    ) {
      _this._closeNewMarker();
      _this.mapControl.resetContent();
    }

    if (
          ZConfig.getConfig('autoUpdateUrl'     ) != 'false'
      &&  ZConfig.getConfig('autoUpdateUrlMove' ) != 'false'
    ) {
		_this.scheduleUrlUpdate();
	  }
  });
};

ZMap.prototype._setupMarkerTouchTaps = function() {
  var map = this.map;
  var container = map.getContainer();
  var tap = null;
  this._onPage(container, 'touchstart', function(event) {
    tap = null;
    if(event.touches.length !== 1) return;
    var icon = event.target.closest && event.target.closest('.leaflet-marker-icon');
    var target = icon && map._targets[L.Util.stamp(icon)];
    if(!target || !target.markerId && !target.id) return;
    var touch = event.touches[0];
    tap = { target: target, x: touch.clientX, y: touch.clientY, time: Date.now() };
  }, { capture: true, passive: true });
  this._onPage(container, 'touchmove', function(event) {
    if(!tap) return;
    if(event.touches.length !== 1 ||
      Math.hypot(event.touches[0].clientX - tap.x, event.touches[0].clientY - tap.y) > 12) tap = null;
  }, { capture: true, passive: true });
  this._onPage(container, 'touchcancel', function() { tap = null; }, { passive: true });
  this._onPage(container, 'touchend', function(event) {
    var completedTap = tap;
    tap = null;
    if(!completedTap || event.touches.length || Date.now() - completedTap.time > 500) return;
    // Physical Safari can suppress the compatibility mouse click after touch
    // gestures. Dispatch the marker's existing action without preventing pan.
    completedTap.target.fire('click', { originalEvent: event });
  }, { capture: true, passive: true });
};

// Mobile Safari doesn't give Leaflet a dblclick for a double tap on the map,
// so zoom in on two quick taps ourselves.
ZMap.prototype._setupDoubleTapZoom = function() {
  var map = this.map;
  var container = map.getContainer();
  var tap = null;
  var lastTap = null;
  var lastTouchZoom = 0;

  // Where the browser does send a dblclick after our zoom, don't zoom twice.
  var doubleClickZoom = map.doubleClickZoom;
  var wasEnabled = doubleClickZoom.enabled();
  var onDoubleClick = doubleClickZoom._onDoubleClick;
  if(wasEnabled) doubleClickZoom.disable();
  doubleClickZoom._onDoubleClick = function(e) {
    if(Date.now() - lastTouchZoom < 600) return;
    onDoubleClick.call(this, e);
  };
  if(wasEnabled) doubleClickZoom.enable();

  this._onPage(container, 'touchstart', function(event) {
    tap = null;
    if(event.touches.length !== 1) { lastTap = null; return; }
    if(event.target.closest && event.target.closest('.leaflet-marker-icon, .leaflet-control, .leaflet-popup')) return;
    var touch = event.touches[0];
    tap = { x: touch.clientX, y: touch.clientY, time: Date.now() };
  }, { capture: true, passive: true });
  this._onPage(container, 'touchmove', function(event) {
    if(tap && (event.touches.length !== 1 ||
      Math.hypot(event.touches[0].clientX - tap.x, event.touches[0].clientY - tap.y) > 12)) {
      tap = lastTap = null;
    }
  }, { capture: true, passive: true });
  this._onPage(container, 'touchcancel', function() { tap = lastTap = null; }, { passive: true });
  this._onPage(container, 'touchend', function(event) {
    var completedTap = tap;
    tap = null;
    if(!completedTap || event.touches.length || Date.now() - completedTap.time > 300) {
      lastTap = null;
      return;
    }
    if(lastTap && completedTap.time - lastTap.time < 350 &&
      Math.hypot(completedTap.x - lastTap.x, completedTap.y - lastTap.y) < 40) {
      lastTap = null;
      lastTouchZoom = Date.now();
      var rect = container.getBoundingClientRect();
      var point = L.point(completedTap.x - rect.left, completedTap.y - rect.top);
      map.setZoomAround(point, Math.min(map.getZoom() + 1, map.getMaxZoom()));
      return;
    }
    lastTap = completedTap;
  }, { capture: true, passive: true });
};

ZMap.prototype._setupDroppedPinGesture = function() {
  var container = this.map.getContainer();
  var press = null;
  var holdDelay = 650;
  var movementTolerance = 9;

  function clearPress() {
    if(press && press.timer) window.clearTimeout(press.timer);
    press = null;
  }

  L.DomEvent.on(container, 'pointerdown', function(e) {
    if(e.button !== undefined && e.button !== 0) return;
    if(e.isPrimary === false) return;
    if($(e.target).closest('.leaflet-control, .leaflet-marker-icon, .leaflet-tooltip, .leaflet-popup').length) return;

    clearPress();
    press = {
      pointerId: e.pointerId,
      x: e.clientX,
      y: e.clientY
    };
    press.timer = window.setTimeout(function() {
      if(!press) return;
      var rect = container.getBoundingClientRect();
      var point = L.point(press.x - rect.left, press.y - rect.top);
      var latlng = this.map.containerPointToLatLng(point);
      clearPress();
      // (Not in an embed: it shows only what was embedded.)
      if(this.isFramed()) return;
      this._openDroppedPin(latlng);
    }.bind(this), holdDelay);
  }, this);

  L.DomEvent.on(container, 'pointermove', function(e) {
    if(!press || e.pointerId !== press.pointerId) return;
    if(Math.abs(e.clientX - press.x) > movementTolerance || Math.abs(e.clientY - press.y) > movementTolerance) {
      clearPress();
    }
  });
  L.DomEvent.on(container, 'pointerup pointercancel pointerleave', clearPress);
};

// Built like POI links: only the shareable params from the current URL.
ZMap.prototype._createDroppedPinLink = function(latlng) {
  var href = window.location.href.split("?");
  var clipboardParams = this._getClipboardParams(href);
  return this._pageAddress(false) + "?" + clipboardParams +
    "map=" + this.mapControl.getCurrentMap().mapId +
    "&subMap=" + this.mapControl.getCurrentMap().subMapId +
    "&zoom=" + this.map.getZoom() +
    "&x=" + latlng.lng.toFixed(4) +
    "&y=" + latlng.lat.toFixed(4) +
    "&droppedPin=true";
};

// Shown inside another site's page (an embed): just what was embedded
// (index.php sets the class first thing).
// A marker's link pasted into any of the drawer's text boxes becomes its
// shortcode with its title (zwiki.js _markerLinkShortcode).
document.addEventListener('paste', function(e) {
  var field = e.target;
  if(!field || !window.zMap || !zMap._markerLinkShortcode) return;
  var typing = field.tagName === 'TEXTAREA' || (field.tagName === 'INPUT' && /^(text|search|url)$/i.test(field.type || 'text'));
  if(!typing || !field.closest('.leaflet-control-layers') || field.readOnly) return;
  var data = e.clipboardData || window.clipboardData;
  var code = data && zMap._markerLinkShortcode(data.getData('text'));
  if(!code) return;
  e.preventDefault();
  var start = field.selectionStart, end = field.selectionEnd;
  if(typeof start !== 'number') { field.value += code; }
  else { field.setRangeText(code, start, end, 'end'); }
  field.dispatchEvent(new Event('input', { bubbles: true }));
}, true);

ZMap.prototype.isFramed = function() {
  return document.documentElement.classList.contains('zm-framed');
};

// The game, its icon and name, as the first header pill in an embed (marker,
// path and pin pages): whoever's reading the page around it may not know
// which game it is. The name its pages are titled with (Name (Page Title),
// game settings), else its name.
ZMap.prototype._embedGamePillHTML = function() {
  var options = this.mapOptions || {};
  var name = String(options.pageTitle || '').trim() || options.name;
  if(!this.isFramed() || !name) return '';
  var icon = options.icon ? "<span class='zm-embed-game-icon icon-" + $('<span>').text(options.icon).html() + "' aria-hidden='true'></span>" : '';
  return "<p class='marker-coordinate-pill zm-embed-game-pill'>" + icon + $('<span>').text(name).html() + "</p>";
};

// A Street view button on the page shown (a marker's or a dropped pin's),
// where there's street view at that spot (StreetView.js).
ZMap.prototype._streetViewButton = function(latlng, marker) {
  // (Staff only, where it's built: no one else loads or runs any of it. Load3D.js)
  if(!window.ZLoad3D || !ZLoad3D.streetViewHere(this, this.getUser())) return;
  var zmap = this, page = this.mapControl._contents;
  this._streetViewTarget = { latlng: latlng, marker: marker };
  if(!window.ZStreetView) {
    var target = this._streetViewTarget;
    ZLoad3D.ensure(this.getUser()).done(function() { if(zmap._streetViewTarget === target) zmap._streetViewButton(latlng, marker); });
    return;
  }
  var fill = function() {
    var t = zmap._streetViewTarget, rows = page ? page.querySelectorAll('.street-view-row') : [];
    if(!t) return;
    Array.prototype.forEach.call(rows, function(row) {
      if(row.childElementCount) return;
      ZStreetView.available(zmap, t.latlng).then(function(yes) {
        if(!yes || row.childElementCount || zmap._streetViewTarget !== t) return;
        row.innerHTML = "<button type='button' class='marker-action-button infoWindowIcn street-view-button'>" +
          "<span class='marker-action-icon'><i class='fas fa-street-view' aria-hidden='true'></i></span>" +
          "<span class='marker-action-label'>Street View</span></button>";
        row.hidden = false;
        row.querySelector('button').onclick = function() { ZStreetView.open(zmap, t.latlng, t.marker); return false; };
      });
    });
  };
  fill();
  // (The page can be drawn again after this, a marker's once its details
  // are in: its new, empty row filled for the same spot.)
  if(page && !this._streetViewWatch && window.MutationObserver) {
    this._streetViewWatch = new MutationObserver(fill);
    this._streetViewWatch.observe(page, { childList: true, subtree: true });
  }
};

ZMap.prototype._openDroppedPin = function(latlng) {
  this._closeNewMarker();
  newMarker = this._createPin(latlng).addTo(this.map);
  newMarker.droppedPin = true;

  var link = this._createDroppedPinLink(latlng);
  var embedLink = this._createDroppedPinEmbedLink(latlng);
  var coordinateText = this.pad(Math.round(latlng.lng), 4) + ", " +
    this.pad(Math.round(latlng.lat), 4);
  this._bookmarkTarget = {
    mapId: this.mapControl.getCurrentMap().mapId,
    subMapId: this.mapControl.getCurrentMap().subMapId,
    x: latlng.lng,
    y: latlng.lat
  };
  // Same layout as a POI page, minus completion: dropped pins aren't markers.
  var content = "<h2 class='popupTitle'>Dropped Pin</h2>" +
    "<p class='marker-coordinate-pill'>" + coordinateText + "</p>" +
    "<div class='marker-actions-row'>" +
      this._bookmarkButtonHTML() +
      "<button type='button' id='copy_dropped_pin_link' class='marker-action-button infoWindowIcn'>" +
        "<span class='marker-action-icon'><i class='fas fa-link'></i></span>" +
        "<span class='marker-action-label'>Copy Link</span>" +
      "</button>" +
      "<button type='button' id='copy_dropped_pin_embed' class='marker-action-button infoWindowIcn'>" +
        "<span class='marker-action-icon'><i class='icon-embed2'></i></span>" +
        "<span class='marker-action-label'>Embed Code</span>" +
      "</button>" +
    "</div>" +
    // Editors (and beta testers) add a marker here; anyone else learns about
    // the editing beta (scripts/zbeta.js).
    "<div class='marker-actions-row create-community-marker-row'>" +
      "<button type='button' id='create_community_marker' class='marker-action-button infoWindowIcn'>" +
        "<span class='marker-action-icon create-community-marker-icon'>" +
          "<i class='fas fa-plus' aria-hidden='true'></i><i class='fas fa-map-marker-alt' aria-hidden='true'></i>" +
        "</span>" +
        "<span class='marker-action-label'>Create Community Marker</span>" +
      "</button>" +
    "</div>" +
    // A path starting here (scripts/services/PathEditor.js), for those who
    // can make paths.
    (this._pathsEnabled && this.getUser() && this.openPathEditor ?
      "<div class='marker-actions-row make-path-from-pin-row'>" +
        "<button type='button' id='make_path_from_pin' class='marker-action-button infoWindowIcn'>" +
          "<span class='marker-action-icon create-community-marker-icon'>" +
            "<i class='fas fa-plus' aria-hidden='true'></i><i class='fas fa-map-signs' aria-hidden='true'></i>" +
          "</span>" +
          "<span class='marker-action-label'>Make New Path From Here</span>" +
        "</button>" +
      "</div>" : '') +
    "<div class='marker-actions-row street-view-row' hidden></div>" +
    "<div class='popupContent'></div>";

  this.mapControl.setContent(content, 'droppedPin-' + L.Util.stamp(newMarker));
  this._streetViewButton(latlng, null);
  this.mapControl.openDrawerSmall();

  var zmap = this;
  $('#copy_dropped_pin_link').on('click', function() {
    zmap._copyText(link, this);
    return false;
  });
  $('#copy_dropped_pin_embed').on('click', function() {
    zmap.openEmbedDialog({ src: embedLink, target: 'pin', title: 'Dropped Pin' });
    return false;
  });
  $('#make_path_from_pin').on('click', function() {
    // The pin becomes the path's first step (the editor draws it).
    zmap._closeNewMarker();
    zmap.openPathEditor(null, {submapId: zmap.mapControl.getCurrentMap().subMapId, x: latlng.lng, y: latlng.lat});
    return false;
  });
  $('#create_community_marker').on('click', function() {
    if(zmap._editingRole && zmap._editingRole() === 'editor') zmap._createMarkerForm(null, latlng);
    else if(zmap._showEditingBetaAlert) zmap._showEditingBetaAlert();
    return false;
  });
};

ZMap.prototype._createDroppedPinEmbedLink = function(latlng) {
  return this._createDroppedPinLink(latlng).replace(this._pageAddress(false), this._pageAddress(true)) + "&showMapControl=true";
};

//************* BOOKMARKS *************//
// Bookmarks are POIs (markerId) or dropped pins (map, submap and coordinates)
// saved to the user's account for the current game.

ZMap.prototype.getUserBookmarks = function() {
  var _this = this;
  var request = this._bookmarksRequest = (this._bookmarksRequest || 0) + 1;
  var userId = this.getUser() && this.getUser().id;
  var apply = function(results) {
    if(request !== _this._bookmarksRequest) return;
    _this.bookmarks = results || [];
    _this._updateBookmarkButton();
    if(_this.mapControl.getContentType() == 'bookmarksPage') _this._renderBookmarksList();
  };
  $.getJSON("ajax.php?command=get_user_bookmarks&game=" + gameId).done(function(results) {
    // Bookmarks added offline that haven't been sent yet stay listed.
    var pending = (ZOfflineSync.savedBookmarks(userId, gameId) || []).filter(function(bookmark) {
      return String(bookmark.id).indexOf('offline-') === 0 && ZOfflineSync.queue().some(function(item) {
        return item.tempId === bookmark.id;
      });
    });
    results = pending.concat(results || []);
    ZOfflineSync.saveBookmarks(userId, gameId, results);
    apply(results);
  }).fail(function(xhr) {
    if(!ZOfflineSync.isNetworkError(xhr)) return;
    apply(ZOfflineSync.savedBookmarks(userId, gameId) || []);
  });
};

ZMap.prototype._findBookmark = function(target) {
  if(!target) return null;
  return (this.bookmarks || []).find(function(bookmark) {
    // (A path's: scripts/services/PathEditor.js.)
    if(target.pathId != null) return bookmark.pathId == target.pathId;
    if(target.markerId != null) return bookmark.markerId == target.markerId;
    return bookmark.markerId == null && bookmark.pathId == null &&
      bookmark.mapId == target.mapId &&
      bookmark.submapId == target.subMapId &&
      Math.abs(bookmark.x - target.x) < 0.0001 &&
      Math.abs(bookmark.y - target.y) < 0.0001;
  }) || null;
};

ZMap.prototype._bookmarkButtonHTML = function() {
  return "<button type='button' id='bookmark_button' class='marker-action-button infoWindowIcn' onclick='_this.toggleBookmark(); return false'>" +
    this._bookmarkButtonContent(!!this._findBookmark(this._bookmarkTarget)) +
  "</button>";
};

ZMap.prototype._bookmarkButtonContent = function(bookmarked) {
  return "<span class='marker-action-icon'><i class='" + (bookmarked ? "fas" : "far") + " fa-bookmark'></i></span>" +
    "<span class='marker-action-label'>" + (bookmarked ? "Bookmarked" : "Bookmark") + "</span>";
};

ZMap.prototype._updateBookmarkButton = function() {
  var button = document.getElementById('bookmark_button');
  if(!button || !this.mapControl._contents.contains(button)) return;
  button.innerHTML = this._bookmarkButtonContent(!!this._findBookmark(this._bookmarkTarget));
};

ZMap.prototype.toggleBookmark = function() {
  var _this = this;
  var target = this._bookmarkTarget;
  if(!target) return;

  if(!this.getUser()) {
    this._showBookmarkRegistrationPrompt(target);
    return;
  }

  var button = document.getElementById('bookmark_button');
  if(button) button.disabled = true;
  var existing = this._findBookmark(target);
  var request = existing
    ? { command: 'del_bookmark', data: { bookmarkId: existing.id } }
    : {
        command: 'add_bookmark',
        data: target.pathId != null ? { pathId: target.pathId }
          : target.markerId != null
          ? { markerId: target.markerId }
          : { mapId: target.mapId, submapId: target.subMapId, x: target.x, y: target.y }
      };

  var finished = function() {
    if(button) button.disabled = false;
  };
  ZOfflineSync.send({
    command: request.command,
    data: request.data,
    userId: this.getUser().id,
    game: gameId,
    success: function(data) {
      finished();
      if(!data.success) {
        toastr.error(data.msg || 'The bookmark could not be saved.');
        return;
      }
      if(existing) {
        _this.bookmarks = _this.bookmarks.filter(function(bookmark) {
          return bookmark.id != existing.id;
        });
      } else if(target.pathId != null) {
        // A path's: what its card in Bookmarks shows (PathEditor.js).
        var path = (_this.paths || []).find(function(p) { return p.id == target.pathId; }) || {};
        _this.bookmarks.unshift({id: data.id, pathId: target.pathId, markerId: null, slug: path.slug, name: path.name,
          color: path.color, kind: path.kind, loops: path.loops, smooth: path.smooth, scope: path.scope,
          steps: (path.steps || []).length, thumb: path.thumb});
      } else {
        _this.bookmarks.unshift({
          id: data.id,
          markerId: target.markerId != null ? target.markerId : null,
          mapId: target.markerId != null ? null : target.mapId,
          submapId: target.markerId != null ? null : target.subMapId,
          x: target.markerId != null ? null : Number(target.x.toFixed(4)),
          y: target.markerId != null ? null : Number(target.y.toFixed(4))
        });
      }
      ZOfflineSync.saveBookmarks(_this.getUser().id, gameId, _this.bookmarks);
      if(_this._bookmarkTarget === target) _this._updateBookmarkButton();
    },
    error: function() {
      finished();
      toastr.error('The bookmark could not be saved.');
    }
  });
};

ZMap.prototype._showBookmarkRegistrationPrompt = function(target) {
  if(document.getElementById('bookmark-registration-prompt')) return;
  var previousFocus = document.activeElement;
  var dialog = document.createElement('dialog');
  dialog.id = 'bookmark-registration-prompt';
  dialog.className = 'bookmark-registration-prompt';
  dialog.setAttribute('aria-labelledby', 'bookmark-registration-title');
  dialog.setAttribute('aria-describedby', 'bookmark-registration-description');
  dialog.innerHTML = '<h2 id="bookmark-registration-title">Register to save bookmarks.</h2>' +
    '<p id="bookmark-registration-description">Bookmarking POIs requires a free Zelda Maps account. Register to bookmark this POI and get other cool features like Offline Maps and ad-free browsing!</p>' +
    '<div class="bookmark-registration-actions"><button type="button" class="infoWindowIcn" data-action="register">Register Now</button>' +
    '<button type="button" class="bookmark-registration-cancel" data-action="cancel">Maybe Later</button></div>';
  dialog.addEventListener('close', function() {
    dialog.remove();
    if(previousFocus && previousFocus.isConnected) previousFocus.focus({ preventScroll: true });
  });
  var dismiss = function(register) {
    if(dialog.classList.contains('is-closing')) return;
    var finish = function() {
      dialog.close();
      if(register) {
        this._pendingBookmarkRegistration = Object.assign({}, target);
        if(this.mapControl.viewStyleBottomSlide) {
          this.mapControl._registrationParentPartial = !!this.mapControl._partialDrawerMode;
        }
        this._createRegisterForm();
        if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerLarge();
      }
    }.bind(this);
    dialog.classList.add('is-closing');
    if(typeof dialog.getAnimations !== 'function') { finish(); return; }
    var animations = dialog.getAnimations();
    if(!animations.length) finish();
    else Promise.all(animations.map(function(animation) { return animation.finished.catch(function() {}); })).then(finish);
  }.bind(this);
  dialog.addEventListener('cancel', function(e) { e.preventDefault(); dismiss(false); });
  dialog.querySelector('[data-action="cancel"]').addEventListener('click', function() {
    this.trackFeatureEvent('prompt_later', 'bookmark');
    dismiss(false);
  }.bind(this));
  dialog.querySelector('[data-action="register"]').addEventListener('click', function() {
    this.trackFeatureEvent('prompt_register', 'bookmark');
    dismiss(true);
  }.bind(this));
  document.body.appendChild(dialog);
  dialog.showModal();
  this.trackFeatureEvent('prompt_shown', 'bookmark');
};

// Completing markers while signed out. Counts are this device's saved
// completes (all games), so the prompts grow with what there is to lose:
// - the 3rd complete: a prompt to register (once);
// - after that, reminders saying how many markers they've completed.
//   How often is an A/B test: each device is put in a group at random, kept
//   in its prompt state, and the group goes with its events and sign-ups
//   (Admin, Sign-Up Sources):
//     milestone: the prompt again, at 15, 50 and 100 completes, then
//       every 100;
//     visit: a banner that doesn't block the map, on the first complete of
//       every visit, like the old toast.
// Both only offer Maybe Later: the reminders keep coming. (Devices that chose
// Don't Remind Me Again before it was removed stay opted out.)
ZMap.prototype.COMPLETE_PROMPT_KEY = 'zeldamaps.completeRegistrationPrompt';
ZMap.prototype.COMPLETE_PROMPT_OFF_KEY = 'zeldamaps.completeRegistrationPromptOff';
ZMap.prototype.COMPLETE_PROMPT_FIRST = 3;
ZMap.prototype.COMPLETE_REMINDERS = [15, 50, 100];
ZMap.prototype.COMPLETE_REMINDER_VARIANTS = ['milestone', 'visit'];

// This device's group, chosen the first time it's needed.
ZMap.prototype._completeReminderVariant = function(state) {
  if(this.COMPLETE_REMINDER_VARIANTS.indexOf(state.variant) < 0) {
    var random = new Uint8Array(1);
    if(window.crypto && crypto.getRandomValues) crypto.getRandomValues(random);
    else random[0] = Math.floor(Math.random() * 256);
    state.variant = this.COMPLETE_REMINDER_VARIANTS[random[0] % 2];
    this._saveCompletePromptState(state);
  }
  return state.variant;
};

ZMap.prototype._completePromptState = function() {
  var state = {};
  try {
    state = JSON.parse(localStorage.getItem(this.COMPLETE_PROMPT_KEY) || '{}') || {};
    if(localStorage.getItem(this.COMPLETE_PROMPT_OFF_KEY) === '1') state.off = true;
  } catch(e) {}
  return state;
};

ZMap.prototype._saveCompletePromptState = function(state) {
  try {
    localStorage.setItem(this.COMPLETE_PROMPT_KEY, JSON.stringify(state));
    if(state.off) localStorage.setItem(this.COMPLETE_PROMPT_OFF_KEY, '1');
  } catch(e) {}
};

ZMap.prototype._isCompleteReminder = function(count) {
  var last = this.COMPLETE_REMINDERS[this.COMPLETE_REMINDERS.length - 1];
  return this.COMPLETE_REMINDERS.indexOf(count) >= 0 || (count > last && count % 100 === 0);
};

ZMap.prototype._showCompleteRegistrationPrompt = function(markerId) {
  if(this.getUser() || this.isFramed()) return;
  var state = this._completePromptState();
  if(state.off) return;
  var count = (completedMarkers || []).length;
  if(!state.prompted) {
    if(count < this.COMPLETE_PROMPT_FIRST) return;
    this._completeReminderVariant(state);
    state.prompted = true;
    state.lastAt = count;
    this._saveCompletePromptState(state);
    this._completeReminderShownThisVisit = true;
    this._showCompleteRegistrationDialog(markerId);
    return;
  }
  var variant = this._completeReminderVariant(state);
  // Not with fewer than the first prompt's count (say, after the browser
  // cleared the saved completes).
  if(count < this.COMPLETE_PROMPT_FIRST) return;
  var due = variant === 'visit'
    // Once a visit: the first complete after the page loads.
    ? !this._completeReminderShownThisVisit
    // Each milestone once: un-completing and completing again doesn't repeat it.
    : count > (state.lastAt || 0) && this._isCompleteReminder(count);
  if(!due) return;
  this._completeReminderShownThisVisit = true;
  state.lastAt = Math.max(state.lastAt || 0, count);
  this._saveCompletePromptState(state);
  if(variant === 'visit') this._showCompleteReminder(markerId, count, variant);
  else this._showCompleteRegistrationDialog(markerId, count);
};

// The "visit" group's reminder: a banner like the old toast (which stayed
// until closed), with the count and a
// Register button. It leaves the map usable, and stays until it's dismissed,
// so lasting longer isn't a difference between the test's groups.
ZMap.prototype._showCompleteReminder = function(markerId, count, variant) {
  var _this = this;
  $('#complete-reminder').remove();
  var banner = $(
    '<div id="complete-reminder" class="complete-reminder" role="status">' +
      '<span class="complete-reminder-icon" aria-hidden="true"><i class="fas fa-exclamation-triangle"></i></span>' +
      '<div class="complete-reminder-body">' +
        '<p class="complete-reminder-text"></p>' +
        '<div class="complete-reminder-actions">' +
          '<button type="button" class="complete-reminder-register" data-action="register">Register &amp; Save</button>' +
          '<button type="button" class="complete-reminder-later" data-action="later">Maybe Later</button>' +
        '</div>' +
      '</div>' +
      '<button type="button" class="complete-reminder-close" data-action="later" aria-label="Dismiss"><i class="fas fa-times" aria-hidden="true"></i></button>' +
    '</div>'
  );
  banner.find('.complete-reminder-text').text(
    'You’ve completed ' + count.toLocaleString() + (count === 1 ? ' marker' : ' markers') +
    ', but they’re currently only stored on this device. Register for free to save them to our database.'
  );
  var close = function() {
    banner.addClass('is-closing');
    window.setTimeout(function() { banner.remove(); }, 250);
  };
  banner.on('click', '[data-action]', function() {
    if(this.getAttribute('data-action') === 'register') {
      _this.trackFeatureEvent('reminder_register', 'complete', variant);
      close();
      _this._registerToSaveCompletes(markerId);
    } else {
      _this.trackFeatureEvent('reminder_dismiss', 'complete', variant);
      close();
    }
  });
  $('body').append(banner);
  this.trackFeatureEvent('reminder_shown', 'complete', variant);
};

ZMap.prototype._registerToSaveCompletes = function(markerId) {
  this._pendingCompleteRegistration = { markerId: markerId };
  this._pendingBookmarkRegistration = null;
  if(this.mapControl.viewStyleBottomSlide) {
    this.mapControl._registrationParentPartial = !!this.mapControl._partialDrawerMode;
  }
  this._createRegisterForm();
  if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerLarge();
};

// reminderCount: a later reminder, which says how many they've completed.
// Its choices are counted apart from the first prompt's (reminder_*).
ZMap.prototype._showCompleteRegistrationDialog = function(markerId, reminderCount) {
  if(document.getElementById('complete-registration-prompt')) return;
  var reminder = reminderCount > 0;
  var variant = this._completePromptState().variant || null;
  var body = reminder
    ? 'You’ve completed ' + Number(reminderCount).toLocaleString() + ' markers, but they’re currently only stored on this device. ' +
      'Register for free to save your markers, plus get other cool features like Offline Maps and ad-free browsing!'
    : 'Your completed markers will currently only be stored on this device. Register for free to save your markers, ' +
      'plus get other cool features like Offline Maps and ad-free browsing!';
  var previousFocus = document.activeElement;
  var dialog = document.createElement('dialog');
  dialog.id = 'complete-registration-prompt';
  dialog.className = 'bookmark-registration-prompt';
  dialog.setAttribute('aria-labelledby', 'complete-registration-title');
  dialog.setAttribute('aria-describedby', 'complete-registration-description');
  dialog.innerHTML = '<h2 id="complete-registration-title">Register to save your completed markers.</h2>' +
    '<p id="complete-registration-description"></p>' +
    '<div class="bookmark-registration-actions">' +
      '<button type="button" class="infoWindowIcn" data-action="register">Register Now &amp; Save My Markers</button>' +
      '<button type="button" class="bookmark-registration-cancel" data-action="later">Maybe Later</button>' +
    '</div>';
  dialog.querySelector('#complete-registration-description').textContent = body;
  dialog.addEventListener('close', function() {
    dialog.remove();
    if(previousFocus && previousFocus.isConnected) previousFocus.focus({ preventScroll: true });
  });
  var dismiss = function(action) {
    if(dialog.classList.contains('is-closing')) return;
    this.trackFeatureEvent(reminder
      ? (action === 'register' ? 'reminder_register' : 'reminder_dismiss')
      : (action === 'register' ? 'prompt_register' : 'prompt_later'), 'complete', variant);
    var finish = function() {
      dialog.close();
      if(action === 'register') this._registerToSaveCompletes(markerId);
    }.bind(this);
    dialog.classList.add('is-closing');
    var animations = typeof dialog.getAnimations === 'function' ? dialog.getAnimations() : [];
    if(!animations.length) finish();
    else Promise.all(animations.map(function(animation) { return animation.finished.catch(function() {}); })).then(finish);
  }.bind(this);
  dialog.addEventListener('cancel', function(e) { e.preventDefault(); dismiss('later'); });
  dialog.querySelectorAll('[data-action]').forEach(function(button) {
    button.addEventListener('click', function() { dismiss(button.getAttribute('data-action')); });
  });
  document.body.appendChild(dialog);
  dialog.showModal();
  this.trackFeatureEvent(reminder ? 'reminder_shown' : 'prompt_shown', 'complete', variant);
};

// Signed in from the prompt: back to the marker, and (for new accounts) a
// note that the completes went with them.
ZMap.prototype._finishCompleteRegistration = function(registered) {
  var target = this._pendingCompleteRegistration;
  this._pendingCompleteRegistration = null;
  this.mapControl._navigatingBack = true;
  if(target && this.cachedMarkersById[target.markerId]) {
    this.goTo({ marker: target.markerId, panTo: false, centerInVisibleArea: true });
  } else if(this.mapControl.isMobile) {
    this.mapControl.closeDrawer();
  } else {
    this.mapControl.resetContent();
  }
  if(!registered) return;
  var dialog = document.createElement('dialog');
  dialog.className = 'bookmark-registration-prompt';
  dialog.setAttribute('aria-labelledby', 'complete-registration-success-title');
  dialog.setAttribute('aria-describedby', 'complete-registration-success-description');
  dialog.innerHTML = '<h2 id="complete-registration-success-title">You\'re all set!</h2>' +
    '<p id="complete-registration-success-description">Thanks for registering! We\'ve saved your completed markers to your account, so they’ll be there wherever you sign in.</p>' +
    '<div class="bookmark-registration-actions"><button type="button" class="infoWindowIcn" data-action="dismiss" autofocus>Let\'s go!</button></div>';
  var dismiss = function() {
    if(dialog.classList.contains('is-closing')) return;
    dialog.classList.add('is-closing');
    var animations = typeof dialog.getAnimations === 'function' ? dialog.getAnimations() : [];
    if(animations.length) Promise.all(animations.map(function(animation) {
      return animation.finished.catch(function() {});
    })).then(function() { dialog.close(); });
    else dialog.close();
  };
  dialog.addEventListener('close', function() { dialog.remove(); });
  dialog.addEventListener('cancel', function(event) { event.preventDefault(); dismiss(); });
  dialog.querySelector('[data-action="dismiss"]').addEventListener('click', dismiss);
  document.body.appendChild(dialog);
  dialog.showModal();
};

// Anonymous counts of the sign-up prompts (shown, Register, Maybe Later,
// Don't Remind Me Again) and sign-ups, for Admin's Sign-Up Sources. Nothing
// about the person is sent.
// variant: the A/B group the event belongs to, if any.
ZMap.prototype.trackFeatureEvent = function(event, feature, variant) {
  try {
    var data = { event: event, feature: feature };
    if(variant) data.variant = variant;
    if(navigator.sendBeacon) navigator.sendBeacon('ajax.php?command=track_event', new URLSearchParams(data));
    else $.post('ajax.php?command=track_event', data);
  } catch(e) {}
};

ZMap.prototype._saveRegistrationBookmark = function() {
  var target = this._pendingBookmarkRegistration;
  if(!target || !this.getUser()) return;
  $.ajax({
    type: 'POST', url: 'ajax.php?command=add_bookmark',
    data: target.markerId != null ? { markerId: target.markerId } :
      { mapId: target.mapId, submapId: target.subMapId, x: target.x, y: target.y },
    success: function(data) {
      if(!data.success) {
        this._showRegistrationBookmarkError(data.msg || 'Your account is ready, but the bookmark could not be saved. Please try again.');
        return;
      }
      this._pendingBookmarkRegistration = null;
      this.bookmarks = this.bookmarks || [];
      if(!this._findBookmark(target)) this.bookmarks.push(Object.assign({ id: data.id }, target));
      this.getUserBookmarks();
      this.mapControl._navigatingBack = true;
      if(target.markerId != null) this.goTo({ marker: target.markerId, panTo: false, centerInVisibleArea: true });
      else {
        this.mapControl.changeMapOnly(target.mapId, target.subMapId);
        this._openDroppedPin(L.latLng(target.y, target.x));
      }
      this._updateBookmarkButton();
      this._showBookmarkRegistrationSuccess();
    }.bind(this),
    error: function() {
      this._showRegistrationBookmarkError('Your account is ready, but the bookmark could not be saved. Please check your connection and try again.');
    }.bind(this)
  });
};

ZMap.prototype._showBookmarkRegistrationSuccess = function() {
  var dialog = document.createElement('dialog');
  dialog.className = 'bookmark-registration-prompt';
  dialog.setAttribute('aria-labelledby', 'bookmark-registration-success-title');
  dialog.setAttribute('aria-describedby', 'bookmark-registration-success-description');
  dialog.innerHTML = '<h2 id="bookmark-registration-success-title">You\'re all set!</h2>' +
    '<p id="bookmark-registration-success-description">Thanks for registering! We\'ve saved your bookmark. You can view all of your bookmarks on your <a href="?page=account" data-action="account">Account Page</a>!</p>' +
    '<div class="bookmark-registration-actions"><button type="button" class="infoWindowIcn" data-action="dismiss" autofocus>Let\'s go!</button></div>';
  var dismiss = function(account) {
    if(dialog.classList.contains('is-closing')) return;
    dialog.classList.add('is-closing');
    var finish = function() {
      dialog.close();
      if(account) {
        // The saved POI is already the current page, so normal account
        // navigation captures it as the parent for the Back button.
        this._createAccountForm(this.getUser());
        if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerLarge();
      }
    }.bind(this);
    var animations = typeof dialog.getAnimations === 'function' ? dialog.getAnimations() : [];
    if(animations.length) Promise.all(animations.map(function(animation) {
      return animation.finished.catch(function() {});
    })).then(finish);
    else finish();
  }.bind(this);
  dialog.addEventListener('close', function() { dialog.remove(); });
  dialog.addEventListener('cancel', function(event) { event.preventDefault(); dismiss(false); });
  dialog.querySelector('[data-action="dismiss"]').addEventListener('click', function() { dismiss(false); });
  dialog.querySelector('[data-action="account"]').addEventListener('click', function(event) {
    event.preventDefault();
    dismiss(true);
  });
  document.body.appendChild(dialog);
  dialog.showModal();
};

ZMap.prototype._showRegistrationBookmarkError = function(message) {
  $('#registration-bookmark-error').remove();
  var status = $('<div id="registration-bookmark-error" role="alert"></div>');
  status.append($('<p class="login-error"></p>').text(message));
  var retry = $('<button type="button" class="infoWindowIcn">Retry Saving Bookmark</button>');
  retry.on('click', function() { retry.prop('disabled', true); this._saveRegistrationBookmark(); }.bind(this));
  status.append(retry);
  $('#newuser, #login').prepend(status);
};

ZMap.prototype._createBookmarksPage = function() {
  var page = $(
    '<div id="bookmarks" class="bookmarks-page">' +
      '<h3 class="text-center">Bookmarks</h3>' +
      '<div class="marker-list-view bookmarks-list"><ul class="marker-list"></ul></div>' +
    '</div>'
  );
  // Finish building the page before setContent measures its destination
  // height for the desktop drawer transition.
  this._renderBookmarksList(page);
  this.mapControl.setContent(page, 'bookmarksPage');
};

ZMap.prototype._renderBookmarksList = function(page) {
  var _this = this;
  var list = page ? $(page).find('.marker-list') : $('#bookmarks .marker-list');
  if(!list.length) return;
  list.empty();

  // Paths first, as compact path cards (scripts/services/PathEditor.js).
  var bookmarks = (this.bookmarks || []).filter(function(b) { return b.pathId != null; })
    .concat((this.bookmarks || []).filter(function(b) { return b.pathId == null; }));
  // Each shown bookmark with its entry (one whose marker is gone has none).
  var items = bookmarks.map(function(bookmark) {
    var entry = bookmark.pathId != null ? (_this._createPathBookmarkEntry ? _this._createPathBookmarkEntry(bookmark) : null)
      : bookmark.markerId != null ? _this._createMarkerBookmarkEntry(bookmark) : _this._createPinBookmarkEntry(bookmark);
    return entry ? {bookmark: bookmark, entry: entry} : null;
  }).filter(Boolean);
  var entries = items.map(function(item) { return item.entry; });

  if(!entries.length) {
    list.append('<li class="bookmarks-empty"><div class="bookmarks-empty-title">No Bookmarks</div>' +
      '<p>Bookmark POIs and dropped pins to find them here.</p></li>');
    return;
  }

  // With paths among them, Paths and Markers each have a label.
  var hasPaths = items.some(function(item) { return item.bookmark.pathId != null; });
  var hasMarkers = items.some(function(item) { return item.bookmark.pathId == null; });
  var label = function(text) { return $('<li class="bookmarks-section-label"><h3 class="area-category-title"></h3></li>').find('h3').text(text).end(); };
  if(!hasPaths) list.append('<div class="leaflet-control-layers-separator search-result-separator"></div>');
  var labelledMarkers = false;
  items.forEach(function(item, i) {
    var isPath = item.bookmark.pathId != null;
    if(hasPaths && i === 0) list.append(label('Paths'));
    if(hasPaths && !isPath && !labelledMarkers) {
      list.append(label('Markers'));
      list.append('<div class="leaflet-control-layers-separator search-result-separator"></div>');
      labelledMarkers = true;
    }
    list.append(item.entry);
    if(!isPath) list.append('<div class="leaflet-control-layers-separator search-result-separator"></div>');
  });
  // Paths but no markers: Markers still has its label, with an empty note.
  if(hasPaths && !hasMarkers) {
    list.append(label('Markers'));
    list.append('<li class="bookmarks-empty-markers">No marker bookmarks yet. Bookmark POIs and dropped pins to find them here.</li>');
  }
};

ZMap.prototype._createMarkerBookmarkEntry = function(bookmark) {
  var marker = this.cachedMarkersById[bookmark.markerId];
  if(!marker) return null;
  var title = marker.title;
  if(marker.gameData != null && marker.gameData.actor != null && this.lang[marker.gameData.actor + "_Name"] != null) {
    title = this.lang[marker.gameData.actor + "_Name"];
  }
  var entry = new SearchMarkerListEntry({
    item: {
      id: marker.id,
      name: title,
      description: '',
      categoryId: marker.categoryId,
      markerCategoryTypeId: marker.categoryTypeId,
      mapId: marker.mapId,
      submapId: marker.submapId
    },
    matches: []
  }, {
    categories: this.categories,
    onClick: this.openBookmark.bind(this, bookmark)
  });
  return entry.domNode;
};

ZMap.prototype._createPinBookmarkEntry = function(bookmark) {
  var pinMap = this.maps.find(function(map) {
    return map.originalId == bookmark.mapId;
  });
  var location = this.pad(Math.round(bookmark.x), 4) + ", " + this.pad(Math.round(bookmark.y), 4);
  if(this.maps.length > 1 && pinMap) location = pinMap.title + ' - ' + location;

  var entry = $(
    '<li class="marker-list-entry search-marker-list-entry">' +
      '<span class="icon"><span class="icon-background circle category-icon bookmark-pin-icon"><i class="fas fa-map-marker-alt"></i></span></span>' +
      '<span class="details">' +
        '<div class="name">Dropped Pin</div>' +
        '<div class="location"></div>' +
      '</span>' +
    '</li>'
  );
  entry.find('.location').text(location);
  entry.on('click', this.openBookmark.bind(this, bookmark));
  return entry;
};

// Show a bookmark from the Bookmarks page in the partial drawer; its page gets a
// back button to the list as well as the close button.
ZMap.prototype.openBookmark = function(bookmark) {
  var latlng;
  var marker = bookmark.markerId != null ? this.cachedMarkersById[bookmark.markerId] : null;
  if(bookmark.markerId != null && !marker) return;
  this.mapControl.returnNextPageTo('bookmarks');
  this._closeNewMarker();

  // (Where the map is headed: a marker's zoom as navigateToMarker sets it.)
  var zoom = marker ? Math.max(this.map.getZoom(), 6) : this.map.getZoom();
  if(marker) {
    this.navigateToMarker(marker.id);
    latlng = marker.getLatLng();
  } else {
    this.mapControl.changeMapOnly(bookmark.mapId, bookmark.submapId);
    latlng = L.latLng(bookmark.y, bookmark.x);
    this._openDroppedPin(latlng);
  }

  if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerSmall(true);
  // (Still panning and zooming, as it opened: navigateToMarker.)
  this._centerInVisibleAreaWhenSettled(latlng, 'move', zoom);
};

ZMap.prototype._centerInVisibleAreaWhenSettled = function(latlng, animate, zoom) {
  var attempts = 0;
  var center = function() {
    if(attempts++ < 20 && this.mapControl._drawerAnimationTimeout) {
      window.setTimeout(center, 100);
      return;
    }
    this._setViewAtMarkerInVisibleArea({ getLatLng: function() { return latlng; } }, zoom != null ? zoom : this.map.getZoom(), undefined, animate);
  }.bind(this);
  window.setTimeout(center, 0);
};

// The part of the screen the controls leave clear is the map's viewable
// area: beside the sidebar (and above any banner) on desktop; between the
// search bar and the collapsed drawer (and any banner above it) on phones. Fully zoomed out, the
// whole map fits there, centred; zoomed in, its edges stop at that area's
// edges instead of sliding under the controls. Kept current as the screen,
// layout or banner changes.
ZMap.prototype._limitZoomToMapBounds = function() {
  var zMap = this;
  var map = this.map;
  if(!map.options.maxBounds) return;
  // Read each time: a map can set its own limits (OoT's Hyrule map).
  var bounds = function() { return L.latLngBounds(map.options.maxBounds); };
  // Room left around the map when it's fully zoomed out.
  var margin = 10;
  var insets = { top: 0, right: 0, bottom: 0, left: 0 };

  function measureInsets() {
    var container = map.getContainer().getBoundingClientRect();
    var control = zMap.mapControl;
    var next = { top: 0, right: 0, bottom: 0, left: 0 };
    if(!control || !control._container) return next;
    if(control.viewStyleBottomSlide) {
      var settings = zMap.settingsControl && zMap.settingsControl.container;
      if(settings) next.top = Math.max(0, settings.getBoundingClientRect().bottom - container.top);
      var collapsedTop = control._mobileDrawerBaseTop + control._startPosition;
      var bottomEdge = Number.isFinite(collapsedTop) ? collapsedTop : container.bottom;
      var ads = document.getElementById('ads');
      if(ads && ads.classList.contains('ads-mobile')) {
        var adRect = ads.getBoundingClientRect();
        if(adRect.height) bottomEdge -= adRect.height + (typeof AD_GAP === 'number' ? AD_GAP : 8);
      }
      next.bottom = Math.max(0, container.bottom - bottomEdge);
    } else {
      var sidebar = control._container.getBoundingClientRect();
      if(sidebar.width) next.left = Math.max(0, sidebar.right - container.left);
      // A banner beside the sidebar covers the bottom of the map.
      var banner = document.getElementById('ads');
      if(banner && banner.classList.contains('ads-desktop')) {
        var bannerRect = banner.getBoundingClientRect();
        if(bannerRect.height && bannerRect.right > container.left + next.left) {
          next.bottom = Math.max(0, container.bottom - bannerRect.top);
        }
      }
    }
    return next;
  }

  // Keep the collapsed-drawer minimum zoom, but move the artwork's centre
  // with the visible space as the drawer opens. Never move a zoomed-in view.
  this._recenterMobileMapAtMinimumZoom = function(drawerTop) {
    var control = zMap.mapControl;
    // At every zoom, the map's edges stop at the open drawer's edge, not the
    // collapsed one's, so whatever's near the bottom of the artwork (a path's
    // last step) can be brought up into view above it. Beyond partial the
    // drawer covers the map; its partial edge is kept. (The minimum zoom stays
    // the collapsed drawer's: update() works it out before this runs.)
    var applyDrawerEdge = function() {
      var base = control._mobileDrawerBaseTop;
      if(!Number.isFinite(base) || !Number.isFinite(drawerTop)) return null;
      var top = Math.max(control.options.softOpenTo, Math.min(control._startPosition, drawerTop));
      if(top < control._startPosition - 1) {
        insets.bottom = Math.max(insets.bottom, map.getContainer().getBoundingClientRect().bottom - (base + top));
      }
      return top;
    };
    if(!control || !control.viewStyleBottomSlide || !map._loaded || map._animatingZoom) return;
    if(Math.abs(map.getZoom() - map.getMinZoom()) > .02) {
      insets = measureInsets();
      applyDrawerEdge();
      return;
    }
    var size = map.getSize();
    insets = measureInsets();
    if(applyDrawerEdge() === null) return;
    var visibleCentre = L.point((insets.left + size.x - insets.right) / 2,
      (insets.top + size.y - insets.bottom) / 2);
    if(visibleCentre.y <= insets.top) return;
    var artworkCentre = map.project(bounds().getCenter(), map.getZoom());
    var target = map.unproject(artworkCentre.add(L.point(size.x / 2, size.y / 2)).subtract(visibleCentre), map.getZoom());
    if(map.latLngToContainerPoint(target).distanceTo(map.latLngToContainerPoint(map.getCenter())) < .5) return;
    map.setView(target, map.getZoom(), {animate: false});
  };

  // Leaflet keeps the view inside maxBounds by comparing it with the whole
  // map container; compare with the viewable area instead. A map smaller
  // than that area is centred in it.
  var getBoundsOffset = map._getBoundsOffset;
  map._getBoundsOffset = function(pxBounds, maxBounds, zoom) {
    var min = pxBounds.min.add(L.point(insets.left, insets.top));
    var max = pxBounds.max.subtract(L.point(insets.right, insets.bottom));
    if(min.x < max.x && min.y < max.y) pxBounds = L.bounds(min, max);
    return getBoundsOffset.call(this, pxBounds, maxBounds, zoom);
  };
  // Dragging limits itself separately, from the container's edges.
  map.on('dragstart', function() {
    var drag = map.dragging;
    if(!drag || !drag._offsetLimit) return;
    drag._offsetLimit = L.bounds(
      map.latLngToContainerPoint(bounds().getNorthWest()).multiplyBy(-1)
        .add(L.point(insets.left, insets.top)),
      map.latLngToContainerPoint(bounds().getSouthEast()).multiplyBy(-1)
        .add(map.getSize()).subtract(L.point(insets.right, insets.bottom))
    );
  });

  // Not while a zoom is animating: Leaflet moves its tiles only when the zoom
  // changes, so a pan in the middle of an animation that stays at the same
  // zoom (as the page settles) left the artwork and place names offset from
  // the markers until the next zoom. Wait for the animation, then update.
  var deferred = null;
  var update = function(boundsChanged) {
    if(map._animatingZoom) {
      if(!deferred) {
        deferred = { boundsChanged: false };
        map.once('zoomend', function() {
          var again = deferred.boundsChanged;
          deferred = null;
          update(again);
        });
      }
      if(boundsChanged === true) deferred.boundsChanged = true;
      return;
    }
    var size = map.getSize();
    if(!size.x || !size.y) return;
    var previous = insets;
    insets = measureInsets();
    // Not getBoundsZoom(), which never returns less than the current minimum,
    // so the limit could never be lowered again.
    var free = size.subtract(L.point(
      insets.left + insets.right + 2 * margin, insets.top + insets.bottom + 2 * margin
    ));
    var current = map.getZoom() || 0;
    var mapSize = L.bounds(map.project(bounds().getNorthWest(), current), map.project(bounds().getSouthEast(), current)).getSize();
    if(free.x <= 0 || free.y <= 0 || !mapSize.x || !mapSize.y) return;
    var zoom = map.getScaleZoom(Math.min(free.x / mapSize.x, free.y / mapSize.y), current);
    if(Number.isFinite(zoom)) map.setMinZoom(Math.max(0, Math.min(zoom, Number(map.getMaxZoom()))));
    // On phones the edges then follow the open drawer (the minimum zoom,
    // above, stays the collapsed drawer's), before anything is kept inside
    // them: a view brought up above a partial drawer isn't pushed back down.
    if(zMap.mapControl && zMap.mapControl.viewStyleBottomSlide) {
      zMap._recenterMobileMapAtMinimumZoom(zMap.mapControl.drawerTop());
    }
    var moved = ['top', 'right', 'bottom', 'left'].some(function(side) {
      return Math.abs(insets[side] - previous[side]) > .5;
    });
    var mobileMinimum = zMap.mapControl && zMap.mapControl.viewStyleBottomSlide &&
      Math.abs(map.getZoom() - map.getMinZoom()) <= .02;
    if(!mobileMinimum && (moved || boundsChanged === true) && map._loaded) map.panInsideBounds(bounds(), { animate: false });
  };
  this._updateMinZoom = update;
  update();
  map.on('resize', update);
  map.on('zoomend', update);
};

// Leaflet lets a pinch run freely past the zoom limits and then snaps back.
// Resist instead, like a rubber band: the further past a limit, the less the
// map gives, up to RUBBER_BAND_ZOOM levels. Leaflet springs it back on release.
ZMap.prototype._addZoomRubberBand = function() {
  var map = this.map;
  var handler = map.touchZoom;
  if(!handler || typeof handler._onTouchMove !== 'function') return;
  var RUBBER_BAND_ZOOM = 0.5;
  function resist(zoom) {
    var min = map.getMinZoom(), max = Number(map.getMaxZoom());
    var limit = zoom < min ? min : zoom > max ? max : null;
    if(limit === null) return zoom;
    var past = Math.abs(zoom - limit);
    var give = RUBBER_BAND_ZOOM * (1 - Math.exp(-past / RUBBER_BAND_ZOOM));
    return zoom < limit ? limit - give : limit + give;
  }
  var onTouchMove = handler._onTouchMove;
  // Replaced on the instance before any pinch starts, so Leaflet adds and
  // removes this version of the listener.
  handler._onTouchMove = function(e) {
    var getScaleZoom = map.getScaleZoom;
    map.getScaleZoom = function() { return resist(getScaleZoom.apply(map, arguments)); };
    try { return onTouchMove.call(this, e); }
    finally { map.getScaleZoom = getScaleZoom; }
  };
};

ZMap.prototype._addMapGridBackground = function() {
  var map = this.map;
  var pane = map.createPane('map-grid-background');
  pane.style.zIndex = '190';
  pane.style.pointerEvents = 'none';
  var image = new Image();
  image.decoding = 'async';
  var texture = null;
  var bounds = map.options.maxBounds ? L.latLngBounds(map.options.maxBounds) : null;
  var gridCenter = bounds ? bounds.getCenter() : L.latLng(0, 0);
  var minimumZoom = map.getMinZoom();
  var maximumZoom = map.getMaxZoom();
  var layer = L.gridLayer({
    pane: 'map-grid-background', tileSize: 256,
    minZoom: minimumZoom, maxZoom: maximumZoom,
    updateWhenIdle: false, keepBuffer: 4
  });
  layer.createTile = function(coords) {
    var tile = document.createElement('canvas');
    tile.width = tile.height = 256;
    var context = tile.getContext('2d');
    context.fillStyle = '#000';
    context.fillRect(0, 0, 256, 256);
    if(texture) {
      // Place the texture's center on the map bounds' center at each zoom.
      var center = map.project(gridCenter, coords.z);
      var offsetX = ((coords.x * 256 - center.x + image.width / 2) % image.width + image.width) % image.width;
      var offsetY = ((coords.y * 256 - center.y + image.height / 2) % image.height + image.height) % image.height;
      context.translate(-offsetX, -offsetY);
      context.fillStyle = context.createPattern(texture, 'repeat');
      // After translating the pattern, paint only this tile's visible pixels.
      context.fillRect(offsetX, offsetY, 256, 256);
    }
    return tile;
  };
  image.onload = function() {
    // First use of a compressed image in canvas can synchronously decode it
    // in the redraw task. Prepare a decoded bitmap before painting the grid.
    var decoded=window.createImageBitmap ? window.createImageBitmap(image) :
      (image.decode ? image.decode().then(function() {return image;}) : Promise.resolve(image));
    decoded.catch(function() {return image;}).then(function(ready) {
      if(!map.hasLayer(layer)) {if(ready.close) ready.close();return;}
      texture=ready;
      layer.redraw();
      mainElBackground();
    });
  };
  layer.on('remove',function() {
    if(texture && texture.close) texture.close();
    texture=null;
  });
  function mainElBackground() {
    map.getContainer().style.backgroundImage = 'none';
  }
  image.src = 'images/zelda-maps-bg-tile.png';
  layer.addTo(map);
  this._mapGridBackground = layer;
};

// Page-wide listeners, timers and elements a map sets up for its game,
// recorded so switching games without a reload (scripts/services/
// GameSwitch.js) can take them all away again: _onPage for a listener,
// _onCleanup for anything else (an observer, a timer, an element).
ZMap.prototype._onPage = function(target, type, fn, options) {
  target.addEventListener(type, fn, options);
  this._onCleanup(function() { target.removeEventListener(type, fn, options); });
};
ZMap.prototype._onCleanup = function(fn) {
  (this._pageCleanups = this._pageCleanups || []).push(fn);
};

ZMap.prototype.setupOfflineMapMessage = function() {
  var map = this;
  if(!document.body) {
    document.addEventListener('DOMContentLoaded', function() { map.setupOfflineMapMessage(); }, { once: true });
    return;
  }
  if(this._offlineMessageSetup) { this._refreshOfflineMapMessage(); return; }
  this._offlineMessageSetup = true;
  var message = document.createElement('div');
  message.className = 'offline-map-empty-message';
  message.setAttribute('role', 'status');
  message.style.display = 'none';
  document.body.appendChild(message);
  this._onCleanup(function() { message.remove(); });
  var usingDownloadedTiles = false;
  if('serviceWorker' in navigator) this._onPage(navigator.serviceWorker, 'message', function(event) {
    var data = event.data;
    if(!data || data.type !== 'zeldamaps-tile-source') return;
    var path = new URL(data.url, location.href).pathname;
    var currentMapTile = map.maps.some(function(layer) {
      return layer._url && path.indexOf(new URL(layer._url.split('{')[0], location.href).pathname) === 0;
    });
    if(currentMapTile) {
      usingDownloadedTiles = data.source === 'download';
      refresh();
    }
  });
  function positionMessage() {
    message.classList.toggle('offline-map-message-mobile', !!(map.mapControl && map.mapControl.viewStyleBottomSlide));
    var landscapePhone = window.matchMedia('(orientation: landscape) and (max-height: 600px) and (pointer: coarse)').matches;
    message.classList.toggle('offline-map-message-landscape', landscapePhone);
    message.style.maxWidth = '';
    if(landscapePhone) {
      message.classList.remove('offline-map-message-mobile');
      var sidebar = map.mapControl && !map.mapControl.viewStyleBottomSlide && map.mapControl._container;
      var sidebarRight = sidebar ? sidebar.getBoundingClientRect().right : 0;
      var rightInset = Number.parseFloat(window.getComputedStyle(message).right) || 10;
      message.style.maxWidth = Math.max(120, window.innerWidth - sidebarRight - rightInset - 14) + 'px';
      return;
    }
    if(map.mapControl && map.mapControl.viewStyleBottomSlide) {
      var control = map.mapControl;
      var viewportBottom = window.visualViewport
        ? window.visualViewport.offsetTop + window.visualViewport.height : window.innerHeight;
      var collapsedTop = control._mobileDrawerBaseTop + control._startPosition;
      if(!Number.isFinite(collapsedTop)) collapsedTop = viewportBottom - 120;
      message.style.top = Math.min(collapsedTop - 12, viewportBottom - 24) + 'px';
      message.style.transform = 'translate(-50%, -100%)';
    } else {
      message.style.top = '12px';
      message.style.transform = 'translateX(-50%)';
    }
  }
  function refresh() {
    message.style.display = 'none';
    if(navigator.onLine) return;
    if(usingDownloadedTiles) {
      message.textContent = "You're offline. Using on-device downloaded maps.";
      message.style.display = 'block';
      positionMessage();
      return;
    }
    var names = { BotW: 'Breath of the Wild', TotK: 'Tears of the Kingdom', LA: "Link's Awakening", EoW: 'Echoes of Wisdom' };
    var name = (map.mapOptions && map.mapOptions.name) || names[new URL(location.href).searchParams.get('game')];
    message.textContent = "You're offline. Connect to the internet to view " + (name ? 'maps for ' + name : 'this map') + '.';
    message.style.display = 'block';
    positionMessage();
  }
  this._onPage(window, 'online', refresh);
  this._onPage(window, 'offline', refresh);
  this._onPage(window, 'resize', function() {
    positionMessage();
    if(window.requestAnimationFrame) window.requestAnimationFrame(positionMessage);
  });
  this._onPage(window, 'pageshow', refresh);
  this._onPage(document, 'visibilitychange', refresh);
  this._refreshOfflineMapMessage = refresh;
  if(window.visualViewport) this._onPage(window.visualViewport, 'resize', positionMessage);
  refresh();
};

ZMap.prototype.goToStart = function() {
  this.map.setView(
    new L.LatLng(
      this.mapOptions.centerY,
      this.mapOptions.centerX
    ),
    this.mapOptions.zoom
 );
}

ZMap.prototype.setUser = function(vUser) {
   user = vUser;
   // Signed in or out (or another account) once the page is up: the games
   // in progress (staff only) and the paths follow, without a reload.
   var accountKey = user ? user.id + ':' + user.level : '';
   var accountChanged = this._accountReady && accountKey !== this._accountKey;
   this._accountKey = accountKey;
   if(accountChanged && !this.isFramed()) {
     if(typeof refreshAdminGames === 'function') refreshAdminGames();
     if(this.loadPaths) this.loadPaths();
   }
   // Signed out: remove the account's offline data from this device.
   if(user == null) ZOfflineSync.clear();
   // Staff: the switch for changing games without a reload (GameSwitch.js).
   if(this._addGameSwitchSetting) this._addGameSwitchSetting();
   if(this._addBrowserBackSetting) this._addBrowserBackSetting();
   this._addAnalyticsTimingSetting();
   _this._buildContextMenu();
   if (this._watchWikiUser) this._watchWikiUser();
   this.notifyUserChanged();
   // (An embed, even previewed signed in, keeps to what anyone would see:
   // no notifications, completions or bookmarks, and nothing moved into the
   // account.)
   var framed = this.isFramed();
   if (this._watchNotifications && !framed) this._watchNotifications();

   if (user != null && !framed) {
      // Transfer cookies completed markers to database
      var cookieCompletedMarkers = getCookie('completedMarkers');
      if (cookieCompletedMarkers != undefined && cookieCompletedMarkers != null && cookieCompletedMarkers != "") {
         _this.transferCompletedMarkersToDB();
      } else {
         _this.getUserCompletedMarkers();
      }
      this.getUserBookmarks();
   } else {
      this.bookmarks = [];
      this._updateBookmarkButton();
   }
};

ZMap.prototype.notifyUserChanged = function() {
  this.handlers.userChanged.forEach(function(handler) {
    handler(user);
  });
};

ZMap.prototype.getUser = function() {
  return user;
};

// TODO: Make this a generic mixin, probably automatically included in all
// widgets, or even use a JS framework that provides this functionality already!!
ZMap.prototype.addHandler = function(eventName, handleFunction) {
  this.handlers[eventName].push(handleFunction);
};

//************* CATEGORY MENU *************//
ZMap.prototype.toggleCompleted = function() {
  zMap.mapOptions.showCompleted = this.toggledOn;
  setCookie('showCompleted', this.toggledOn);
  zMap.refreshMapCompleted();
};

ZMap.prototype.checkWarnUserSeveralEnabledCategories = function() {
  // Category selections are intentionally unrestricted. Tile and marker
  // buffering now handle larger selections without interrupting the user.
};

//************* CATEGORY MENU *************//



//****************************************************************************//
//*************                                                  *************//
//*************             BEGIN - MARKER HANDLING              *************//
//*************                                                  *************//
//****************************************************************************//
ZMap.prototype.deleteMarker = function(vMarkerId) {
  $.ajax({
    type: "POST",
    url: "ajax.php?command=del_marker",
    data: {markerId: vMarkerId, userId: user.id},
    dataType: "json",
    error: function() {
      toastr.error(_this.langMsgs.MARKER_DEL_ERROR.format('Check your connection and try again.'));
      $('[data-editor-action="confirm-delete"]').prop('disabled', false);
    },
    success: function(data) {
      if (data.success) {
        for (var i = 0; i < markers.length; i++) {
          // Just hide the marker on the marker array ... on reaload, query won't get it.
          if (markers[i].id == vMarkerId) {
            markers[i].visible = 0;
            markers[i].categoryId = -1;
            _this.map.removeLayer(markers[i]);
            delete _this.cachedMarkersById[vMarkerId];
            toastr.success(_this.langMsgs.MARKER_DEL_SUCCESS.format(markers[i].id));
            // The official paths it left, redrawn without it (scripts/services/Paths.js).
            if (data.paths && data.paths.length && _this._reloadPaths) _this._reloadPaths();
            if (_this.mapControl.isMobile) {
              _this.mapControl.closeDrawer();
            } else {
              _this.mapControl.resetContent();
            }
            _this.refreshMap();
            break;
          }
        }
      } else {
        toastr.error(_this.langMsgs.MARKER_DEL_ERROR.format(data.msg));
        $('[data-editor-action="confirm-delete"]').prop('disabled', false);
      }
    }
  });
}

ZMap.prototype.editMarker = function(vMarkerId) {
   var vMarker;
   for (var i = 0; i < markers.length; i++) {
      // Just hide the marker on the marker array ... on reaload, query won't get it.
      if (markers[i].id == vMarkerId) {
         vMarker = markers[i];
      }
   }

   this.map.closePopup(); // Safe coding

   _this._createMarkerForm(vMarker, vMarker._latlng);

}

// Adding or editing a marker: the standard field bars, a rich-text editor
// for each content section, and, for editors, an edit summary for History.
ZMap.prototype._loadRichTextEditor = function() {
  if(window.tinymce) return $.Deferred().resolve().promise();
  if(this._richTextEditorLoading) return this._richTextEditorLoading;
  var zmap=this,ready=$.Deferred(),script=document.createElement('script');
  this._richTextEditorLoading=ready.promise();
  script.src='https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.10.9/tinymce.min.js';
  script.referrerPolicy='origin';
  script.onload=function() {
    if(window.tinymce) ready.resolve();
    else failed();
  };
  function failed() {
    script.remove();zmap._richTextEditorLoading=null;ready.reject();
  }
  script.onerror=failed;
  document.head.appendChild(script);
  return this._richTextEditorLoading;
};

// Marker editor form: loaded on demand by services/FeatureLoader.js.
//****************************************************************************//
//*************                                                  *************//
//*************               END - MARKER HANDLING              *************//
//*************                                                  *************//
//****************************************************************************//


//****************************************************************************//
//*************                                                  *************//
//*************              BEGIN - MARKER INFO                 *************//
//*************                                                  *************//
//****************************************************************************//

//****************************************************************************//
//*************                                                  *************//
//*************              BEGIN - MARKER COMPLETE             *************//
//*************                                                  *************//
//****************************************************************************//
ZMap.prototype.clearCompletedMarkers = function() {
   var resetSucceeded = completedMarkers.length === 0;
   if (completedMarkers.length > 0) {
      $.ajax({
              type: "POST",
              url: "ajax.php?command=del_completed_marker_all",
              async: false,
              data: {gameId: gameId, userId: user.id},
              success: function(data) {
                  //data = jQuery.parseJSON(data);
                  if (data.success) {
                     completedMarkers = [];
                     resetSucceeded = true;
                  } else {
                     toastr.error(_this.langMsgs.MARKER_DEL_ERROR.format(data.msg));
                     //alert(data.msg);
                  }
              }
            });
   }

   if(!resetSucceeded) return false;
   this.categoriesArr.forEach(function(category) { category.complete = 0; });
   setCookie('completedMarkers', '[]');
   for (var i = 0; i < markers.length; i++) {
      _this._doSetMarkerDoneIcon(markers[i], false);
   }
   _this.refreshMap();
   window.alert(this.langMsgs.MARKER_DEL_ALL_COMPLETE_SUCCESS);
   $('#account_clear_completed_btn').prop('disabled', true);
   return true;
};

ZMap.prototype.transferCompletedMarkersToDB = function() {
   // Speeding up transfer of completed markers from singles to bulk
   $.ajax({
           type: "POST",
           url: "ajax.php?command=add_bulk_complete_marker",
           async: false,
           data: {markerList: JSON.stringify(completedMarkers), userId: user.id},
           success: function(data) {
                        if (data.success) {
                           completedMarkers = [];
                           document.cookie = 'completedMarkers=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
                           _this.getUserCompletedMarkers();
                           if(_this._quietCompleteTransfer) _this._quietCompleteTransfer = false;
                           else toastr.success(_this.langMsgs.MARKER_COMPLETE_TRANSFER_SUCCESS);
                        } else {
                           toastr.error(_this.langMsgs.MARKER_COMPLETE_TRANSFER_ERROR.format(data.msg));
                           //alert(data.msg);
                        }
                    }
         });
};

ZMap.prototype.getUserCompletedMarkers = function() {
   // (Nor an embed previewed on Zelda Maps itself, signed in: index.php.)
   if (this.isFramed()) return;
   // clean the categories complete count
   this.categoriesArr.forEach(function(category) {
      this.categories[category.id].complete = 0;
   }, this);

   //@TODO: Use gameID from zmap, not zmain
   var userId = user.id;
   var apply = function(markerIds) {
      // Look markers up by id and refresh once at the end: refreshing the
      // whole map per completed marker froze phones for accounts with many.
      var seen = {};
      markerIds.forEach(function(markerId) {
         var marker = _this.cachedMarkersById[markerId];
         if (!marker || seen[marker.id]) return;
         seen[marker.id] = true;
         if (completedMarkers.indexOf(marker.id) === -1) completedMarkers.push(marker.id);
         _this.categories[marker.categoryId].complete++;
         _this._doSetMarkerDoneIcon(marker, true);
      });
      _this.refreshMap();
      if(_this.mapControl && _this.mapControl._categoryMenu) {
        _this.mapControl._categoryMenu.categoryButtons.forEach(function(button) { button.updateCategoryLabel(); });
      }
   };
   $.getJSON("ajax.php?command=get_user_completed_markers&game=" + gameId + "&userId=" + userId).done(function(vResults) {
      // Including changes made offline that haven't been sent yet.
      var markerIds = ZOfflineSync.applyPendingCompleted(userId, gameId, (vResults || []).map(function(completed) {
         return completed.markerId;
      }));
      ZOfflineSync.saveCompleted(userId, gameId, markerIds);
      apply(markerIds);
   }).fail(function(xhr) {
      if(!ZOfflineSync.isNetworkError(xhr)) return;
      apply(ZOfflineSync.savedCompleted(userId, gameId) || []);
   });
}

// Keeps this device's copy of the account's completed markers current.
ZMap.prototype._saveCompletedOffline = function() {
  if(user && user.id) ZOfflineSync.saveCompleted(user.id, gameId, completedMarkers);
};

// Sends changes made offline, now or once the connection returns.
ZMap.prototype.syncOfflineChanges = function() {
  var _this = this;
  if(!this._offlineSyncListener) {
    this._offlineSyncListener = true;
    this._onPage(window, 'online', function() { _this.syncOfflineChanges(); });
  }
  if(!this.getUser()) return;
  ZOfflineSync.flush(this.getUser().id, {
    saveSettings: function(done) {
      if(_this.settingsControl) _this.settingsControl.saveAccountSettings(done);
      else done(false);
    },
    // Bookmarks added offline get their real ids.
    onDone: function(changed) { if(changed) _this.getUserBookmarks(); }
  });
};

ZMap.prototype.addCompletedMarkers = function(vComplete) {
   // (An embed shows no one's completions: it's the same for every reader.)
   completedMarkers = this.isFramed() ? [] : vComplete;
};

// A marker page's Complete: the given marker's check (a single path's later
// marker's page gives its path's first marker: Paths.js _pathLeadFor).
ZMap.prototype._markerCompleteButtonHTML = function(checkMarker) {
  return "<button type='button' id='check" + checkMarker.id + "' class='marker-action-button infoWindowIcn " + (!checkMarker.complete ? "unchecked" : "checked") + "' onclick=\"var button = document.getElementById('check" + checkMarker.id + "'); var complete = button.classList.contains('unchecked'); button.classList.toggle('unchecked', !complete); button.classList.toggle('checked', complete); _this._setMarkerDone(" + checkMarker.id + ", complete); return false\">" +
    "<span class='marker-action-icon'><i class='icon-" + (!checkMarker.complete ? "checkbox-unchecked" : "checkmark") + "'></i></span>" +
    "<span class='marker-action-label'>" + (!checkMarker.complete ? "Complete" : "Completed") + "</span>" +
  "</button>";
};

ZMap.prototype._setMarkerDone = function(vID, vComplete, onSettled) {
  if (vComplete) {
    _this._doSetMarkerDoneAndCookie(zMap.cachedMarkersById[vID], onSettled);
  } else {
    _this._doSetMarkerUndoneAndCookie(zMap.cachedMarkersById[vID], onSettled);
  }

  var buttonComplete = document.getElementById('check' + vID);
  if(
    buttonComplete &&
    this.mapControl._contents.contains(buttonComplete)
  ) {
    var iconContainer = buttonComplete.querySelector('.marker-action-icon');
    iconContainer.innerHTML = '';
    iconContainer.append(
      $(`<i class="icon-${((!vComplete)?"checkbox-unchecked":"checkmark")}"></i>`)[0]
    );
    buttonComplete.querySelector('.marker-action-label').textContent =
      vComplete ? "Completed" : "Complete";
  }
  if(this.mapControl && this.mapControl._categoryMenu) {
    this.mapControl._categoryMenu.categoryButtons.forEach(function(button) { button.updateCategoryLabel(); });
  }
}

ZMap.prototype._doSetMarkerDoneIcon = function(vMarker, vComplete) {
   vMarker.complete = vComplete;
   document.querySelectorAll('[data-list-marker-id="' + vMarker.id + '"]').forEach(function(row) {
     row.classList.toggle('area-marker-completed', !!vComplete);
     var checkbox = row.querySelector('.marker-list-completion');
     if(checkbox) checkbox.checked = !!vComplete;
   });
   vMarker._iconKey = this._markerIconKey(vMarker);
   vMarker.setIcon(_this._createMarkerIcon(vMarker.categoryId, this._markerShownDone(vMarker)));
   // A single path's later markers (a Korok pair's finish) show as done with
   // it, and hide with it when completed markers are hidden.
   var zmap = this;
   (this.paths || []).forEach(function(path) {
     if(path.kind !== 'single' || path.lead !== vMarker) return;
     path.points.forEach(function(p) {
       if(!p.marker || p.marker === vMarker) return;
       p.marker._iconKey = zmap._markerIconKey(p.marker);
       p.marker.setIcon(zmap._createMarkerIcon(p.marker.categoryId, !!vComplete));
       if(zmap._updateMarkerPresence) zmap._updateMarkerPresence(p.marker);
     });
   });
   if(this.updateAreaCompletionCounts) this.updateAreaCompletionCounts();
   if(this.updateCategoryCompletionCounts) this.updateCategoryCompletionCounts();
   if(this.updatePathCompletionCounts) this.updatePathCompletionCounts();
}

ZMap.prototype._doSetMarkerDoneAndCookie = function(vMarker, onSettled) {
  if (completedMarkers.some((cMId) => cMId == vMarker.id)) {
    if(onSettled) onSettled();
    return;
  }

  if (user && user.id) {
    ZOfflineSync.send({
      command: "add_complete_marker",
      data: { markerId: vMarker.id, userId: user.id },
      userId: user.id,
      game: gameId,
      success: function(data) {
        if (data.success) {
          _this._completeSetMarkerDoneAndCookie(vMarker);
          _this._saveCompletedOffline();
        } else {
          toastr.error(
            _this.langMsgs.MARKER_ADD_COMPLETE_ERROR.format(data.msg)
          );
        }
        if(onSettled) onSettled();
      },
      error: function() { if(onSettled) onSettled(); }
    });
  } else {
    this._completeSetMarkerDoneAndCookie(vMarker);
    if(onSettled) onSettled();
  }
}

ZMap.prototype._completeSetMarkerDoneAndCookie = function(vMarker) {
  completedMarkers.push(vMarker.id);
  _this._doSetMarkerDoneIcon(vMarker, true);
  _this.categories[vMarker.categoryId].complete++;

  if (user === null || user === undefined) {
    setCookie('completedMarkers', JSON.stringify(completedMarkers));

    // A prompt to register, so completes are saved to an account.
    _this._showCompleteRegistrationPrompt(vMarker.id);
  }

  if (!this.mapOptions.showCompleted) {
    // If we need to hide completed markers, remove the pin on top of the marker and reset the content of the map control
    // Issue: https://github.com/Zelda-Universe/Zelda-Maps/issues/231
    _this._closeNewMarker();
    if(!/^(category-|area-)/.test(_this.mapControl.getContentType() || '')) _this.mapControl.resetContent();
    _this.refreshMap();
  }
}

ZMap.prototype._doSetMarkerUndoneAndCookie = function(vMarker, onSettled) {
  if (user != null || user != undefined) {
    ZOfflineSync.send({
      command: "del_complete_marker",
      data: { markerId: vMarker.id, userId: user.id },
      userId: user.id,
      game: gameId,
      success: function(data) {
        if (data.success) {
          vMIdx = completedMarkers.indexOf(vMarker.id);
          if (vMIdx >= 0) completedMarkers.splice(vMIdx, 1);
          _this._doSetMarkerDoneIcon(vMarker, false);
          _this.categories[vMarker.categoryId].complete--;
          _this._saveCompletedOffline();
        } else {
          toastr.error(_this.langMsgs.MARKER_DEL_COMPLETE_ERROR.format(data.msg));
        }
        if(onSettled) onSettled();
      },
      error: function() { if(onSettled) onSettled(); }
    });
  } else {
    vMIdx = completedMarkers.indexOf(vMarker.id);
    if (vMIdx >= 0) completedMarkers.splice(vMIdx, 1);
    _this._doSetMarkerDoneIcon(vMarker, false);
    setCookie('completedMarkers', JSON.stringify(completedMarkers));
    _this.categories[vMarker.categoryId].complete--;
    if(onSettled) onSettled();
  }
  if (!_this.mapOptions.showCompleted) {
    _this.refreshMap();
  }
}

// This is done by ctrl + z
ZMap.prototype.undoMarkerComplete = function() {
  var mID = completedMarkers.pop();
  if (mID != undefined) {
    for (var i = 0; i < markers.length; i++) {
      if (markers[i].id == mID) {
        _this._doSetMarkerDoneIcon(markers[i], false);
        if (user != null || user != undefined) {
          $.ajax({
            type: "POST",
            url: "ajax.php?command=del_complete_marker",
            data: {markerId: mID, userId: user.id},
            success: function(data) {
              if (data.success) {
                this.categories[vMarker.categoryId].complete--;
              } else {
                toastr.error(_this.langMsgs.MARKER_DEL_COMPLETE_ERROR.format(data.msg));
              }
            }
          });
        } else {
          this.categories[markers[i].categoryId].complete--;
          setCookie('completedMarkers', JSON.stringify(completedMarkers));
        }
        //_this.refreshMap();
        break;
      }
    }
  }
}

//****************************************************************************//
//*************                                                  *************//
//*************               END - MARKER COMPLETE              *************//
//*************                                                  *************//
//****************************************************************************//






//****************************************************************************//
//*************                                                  *************//
//*************               BEGIN - CONTEXT MENU               *************//
//*************                                                  *************//
//****************************************************************************//
ZMap.prototype._buildContextMenu = function() {

  // Check if map and/or context was built
  if (this.map == null || this.map.contextmenu == null) {
    return;
  }

  function addMarker(e) {
    _this.map.closePopup(); // Safe coding

    if (newMarker != null) {
      _this.map.removeLayer(newMarker);
    }
    newMarker = this._createPin(e.latlng).addTo(this.map);
    _this.map.contextmenu.hide();
    _this.map.panTo(e.latlng);
    _this._createMarkerForm(null, e.latlng);
  }

   function login() {
      _this._createLoginForm();
   }

   // Create context options
   var contextMenu;
   // In an embed, only moving the map: no account, nothing to add.
   var framed = this.isFramed();

   if (framed) {
      contextMenu = [];
   } else if (user == null) {
      contextMenu = [{
         text: 'Login',
         hideOnSelect: true,
         callback: login
      }];
   } else if (user.level >= 5) {
      // Editors only: Contributors, Admins and the editing beta (scripts/zbeta.js).
      contextMenu = [{
         text: 'Add Marker',
         hideOnSelect: true,
         callback: addMarker
      }];
   } else {
      contextMenu = [];
   }

  contextMenu.push({
    text: 'Center map here',
    callback: function(e) { _this.map.panTo(e.latlng); }
  }, '-', {
    text: 'Zoom in',
    //icon: 'images/zoom-in.png',
    callback: function() { _this.map.zoomIn(); }
  }, {
    text: 'Zoom out',
    //icon: 'images/zoom-out.png',
    callback: function() { _this.map.zoomOut(); }
  });

  if (user != null && !framed) {
    contextMenu.push('-', {
         text: 'Change Password',
         callback: function() {
            zMap._createChangePasswordForm();
         }
      }, {
         text: 'Log Out',
         callback: this.logout.bind(this)
      });
  }

   // Rebuild Context Menu by removing all items and adding them back together
  this.map.contextmenu.removeAllItems();
  for (var i = 0; i < contextMenu.length; i++) {
    this.map.contextmenu.addItem(contextMenu[i]);
  }
}

ZMap.prototype.logout = function() {
  // This device stops getting push notifications for the account first,
  // while it's still signed in to say so.
  var forgetPush = this._pushForgetDevice ? this._pushForgetDevice() : Promise.resolve();
  var timeout = new Promise(function(resolve) { setTimeout(resolve, 3000); });
  Promise.race([forgetPush, timeout]).then(function() { _this._logoutNow(); });
};

ZMap.prototype._logoutNow = function() {
  $.ajax({
    type: "POST",
    url: "ajax.php?command=logout",
    success: function(data) {
      if(data.success) {
        toastr.success(_this.langMsgs.LOGOUT_SUCCESS.format(user.username));
        _this.setUser(null);
        if (_this.setNotificationCount) _this.setNotificationCount(0);
        updateAdState();
        _this.mapControl.resetContent();
        showLoginControls();
      } else {
        toastr.error(_this.langMsgs.LOGOUT_ERROR.format(data.msg));
      }
    },
    error: function(data) {
      toastr.error(_this.langMsgs.LOGOUT_ERROR.format(data.msg));
    }
  });
};


ZMap.prototype._createRegisterForm = function() {
   var completeTarget = this._pendingCompleteRegistration;
   var registrationTarget = this._pendingBookmarkRegistration || completeTarget;
   this.mapControl._registrationReturnMarker = registrationTarget && registrationTarget.markerId;
   // Where this sign-up started, for Admin's sign-up sources.
   var betaTarget = !registrationTarget && this._pendingBetaRegistration;
   var registrationSource = completeTarget ? 'complete' : (this._pendingBookmarkRegistration ? 'bookmark' : betaTarget ? 'editing_beta' : 'account');
   this.mapControl.setContent('<div id="newuser">'+
                        '<h3 class="text-center">' + this.langMsgs.REGISTER_WELCOME + '</h3>'+
                        '<form class="leaflet-control-layers-list" role="newuserform" id="newuserform" enctype="multipart/form-data">'+
                              '<div class="form-group">'+
                                 '<div class="cols-sm-10">'+
                                    '<div class="input-group">'+
                                       '<span class="input-group-addon"><i class="fa-user fa" aria-hidden="true"></i></span>'+
                                       '<input type="text" class="form-control" name="user" id="user" required="" placeholder="Create a username"/>'+
                                    '</div>'+
                                 '</div>'+
                              '</div>'+
                              '<div class="form-group">'+
                                 '<div class="cols-sm-10">'+
                                    '<div class="input-group">'+
                                       '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                       '<input type="password" class="form-control" name="password" id="password" required="" autocomplete="new-password" placeholder="Create a password"/>'+
                                    '</div>'+
                                 '</div>'+
                              '</div>'+
                              '<div class="form-group">'+
                                 '<div class="cols-sm-10"><div class="input-group">'+
                                    '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                    '<input type="password" class="form-control" name="password_confirmation" required="" autocomplete="new-password" placeholder="Confirm your password"/>'+
                                 '</div></div>'+
                              '</div>'+
                              '<div class="form-group">'+
                                 '<div class="cols-sm-10">'+
                                    '<div class="input-group">'+
                                       '<span class="input-group-addon"><i class="fa-user fa" aria-hidden="true"></i></span>'+
                                       '<input type="text" class="form-control" name="name" id="name" required="" placeholder="Your full name"/>'+
                                    '</div>'+
                                 '</div>'+
                              '</div>'+

                              '<div class="form-group">'+
                                 '<div class="cols-sm-10">'+
                                    '<div class="input-group">'+
                                       '<span class="input-group-addon"><i class="fas fa-envelope" aria-hidden="true"></i></span>'+
                                       '<input type="text" class="form-control" name="email" id="email" required="" placeholder="Your email address"/>'+
                                    '</div>'+
                                 '</div>'+
                              '</div>'+

                              '<div class="modal-footer">'+
                                 '<div>'+
                                    '<input type="hidden" name="source" value="' + registrationSource + '" />'+
                                    (completeTarget && this._completePromptState().variant ? '<input type="hidden" name="variant" value="' + this._completePromptState().variant + '" />' : '')+
                                    '<button type="submit" class="infoWindowIcn form-action-button">' + (completeTarget ? 'Register &amp; Save Markers' : registrationTarget ? 'Register &amp; Add Bookmark' : betaTarget ? 'Register and Start Editing' : 'Register') + '</button>'+
                                 '</div>'+
                               '</div>'+
                        '</form>'+
                     '</div>'
   , 'registerForm');


   var registrationForm = $('#newuserform');
   registrationForm.attr('novalidate', 'novalidate');
   var passwordFields = registrationForm.find('[name="password"], [name="password_confirmation"]').closest('.form-group');
   passwordFields.wrapAll('<div class="registration-password-group"></div>');
   var passwordGroup = registrationForm.find('.registration-password-group');
   var passwordMessages = $('<div class="registration-password-messages"></div>').insertAfter(passwordGroup);
   var registrationError = $('<div class="alert alert-danger login-error" role="alert" hidden></div>').prependTo(registrationForm);
   registrationForm.find('input').each(function(index) {
      var id = 'registration-validation-' + index;
      $(this).attr('aria-describedby', id);
      var message = $('<div class="registration-field-error" aria-live="polite" hidden></div>').attr('id', id);
      if($(this).closest('.registration-password-group').length) message.appendTo(passwordMessages);
      else message.insertAfter($(this).closest('.input-group'));
   });
   function validateRegistrationField(input) {
      if(input.name === 'user' && input.value) return usernameAvailable;
      var message = input.validity.valid ? '' : input.validationMessage;
      $(input).attr('aria-invalid', message ? 'true' : 'false');
      $('#' + $(input).attr('aria-describedby')).text(message).prop('hidden', !message);
      if(input.name === 'password' || input.name === 'password_confirmation') {
         var password = registrationForm.find('[name="password"]')[0];
         var confirmation = registrationForm.find('[name="password_confirmation"]')[0];
         if(!password.value && !confirmation.value && $(password).attr('aria-invalid') === 'true') {
            $('#' + $(password).attr('aria-describedby')).text('Please enter a password.').prop('hidden', false);
            $('#' + $(confirmation).attr('aria-describedby')).prop('hidden', true).text('');
         }
      }
      return !message;
   }
   function validatePasswordConfirmation(showMessage) {
      var confirmation = registrationForm.find('[name="password_confirmation"]')[0];
      confirmation.setCustomValidity(confirmation.value !== registrationForm.find('[name="password"]').val()
        ? 'Passwords do not match.' : '');
      if(showMessage && confirmation.value) validateRegistrationField(confirmation);
   }
   registrationForm.find('[name="email"]').attr('type', 'email');
   var usernameAvailable = false;
   var usernameVersion = 0;
   var usernameTimer;
   var usernameInput = registrationForm.find('[name="user"]');
   var usernameMessage = $('#' + usernameInput.attr('aria-describedby'));
   var usernameGroup = usernameInput.closest('.input-group');
   var usernameIcon = $('<span class="registration-validation-icon" aria-hidden="true"></span>').appendTo(usernameGroup);
   usernameInput.on('input change', function() {
      var name = this.value.trim();
      var version = ++usernameVersion;
      clearTimeout(usernameTimer);
      usernameAvailable = false;
      usernameGroup.removeClass('username-valid username-invalid');
      usernameIcon.empty();
      usernameInput.removeAttr('aria-invalid');
      function feedback(available, message, checking) {
         usernameAvailable = available;
         usernameMessage.text(message).prop('hidden', !message).css('color', checking ? '#aaa' : available ? '#77e2a8' : '#ff8c85');
         if(!checking) {
            usernameInput.attr('aria-invalid', !available);
            usernameGroup.addClass(available ? 'username-valid' : 'username-invalid');
            usernameIcon.html(available ? '<i class="fas fa-check"></i>' : '<i class="fas fa-times"></i>');
         }
      }
      if(!name) { usernameMessage.prop('hidden', true).text(''); return; }
      if(!/^[A-Za-z0-9][A-Za-z0-9_.-]{2,44}$/.test(name)) {
         feedback(false, 'Use 3–45 letters, numbers, periods, underscores, or hyphens.');
         return;
      }
      feedback(false, 'Checking username…', true);
      usernameTimer = setTimeout(function() {
         $.getJSON('ajax.php?command=check_username', { username: name }).done(function(data) {
            if(version !== usernameVersion) return;
            var available = !!(data.success && data.valid && data.available);
            feedback(available, data.success ? available ? 'Username available' : 'Username unavailable' : 'Unable to check username.');
         }).fail(function() {
            if(version === usernameVersion) feedback(false, 'Unable to check username. Please try again.');
         });
      }, 300);
   });
   registrationForm.find('input').on('input', function() {
      registrationError.prop('hidden', true).text('');
      validatePasswordConfirmation(true);
      if($(this).attr('aria-invalid') === 'true' || this.name === 'password_confirmation') validateRegistrationField(this);
   }).on('blur', function() {
      validatePasswordConfirmation(false);
      if(this.value) validateRegistrationField(this);
   });
   $("#newuserform").submit(function(e) {
      e.preventDefault();
      validatePasswordConfirmation(false);
      var firstInvalid;
      registrationForm.find('input').each(function() {
         if(!validateRegistrationField(this) && !firstInvalid) firstInvalid = this;
      });
      if(firstInvalid) { firstInvalid.focus(); return; }
      registrationError.prop('hidden', true).text('');
      var registrationUser = $('#newuserform [name="user"]').val();
      var registrationPassword = $('#newuserform [name="password"]').val();
      $.ajax({
        type: "POST",
        async: false,
        url: "ajax.php?command=user_add",
        data: $("#newuserform").serialize(), // serializes the form's elements.
        success: function(data) {
            //data = jQuery.parseJSON(data);
            if (data.success) {
               // Sign the new account straight in; fall back to the login
               // page if that fails.
               var bookmarkPending = !!_this._pendingBookmarkRegistration;
               var completePending = !!_this._pendingCompleteRegistration;
               // Registered from the editing beta's explainer (scripts/zbeta.js).
               var betaPending = !bookmarkPending && !completePending && !!_this._pendingBetaRegistration;
               _this._pendingBetaRegistration = false;
               if(betaPending) _this._joinBetaAfterSignIn = false;
               var showLoginFallback = function() {
                 _this._createLoginForm(bookmarkPending
                   ? 'Your account has been created! Please log in to finish saving your bookmark.'
                   : 'Your account has been created! Please log in.');
               };
               $.ajax({ type: 'POST', url: 'ajax.php?command=login',
                 data: { user: registrationUser, password: registrationPassword, remember: 'on' },
                 success: function(login) {
                   if(!login.success) return showLoginFallback();
                   // Signing in moves this device's completes to the account
                   // (transferCompletedMarkersToDB); the dialog below says so.
                   if(completePending) _this._quietCompleteTransfer = true;
                   _this.setUser(login.user);
                   ZOfflineSync.saveUserInfo({ success: true, user: login.user });
                   updateAdState();
                   if(_this.settingsControl) _this.settingsControl.applyAccountSettings(login.user.settings);
                   if(bookmarkPending) {
                     _this._saveRegistrationBookmark();
                     return;
                   }
                   if(completePending) {
                     _this._finishCompleteRegistration(true);
                     return;
                   }
                   if(_this.mapControl.isMobile) _this.mapControl.closeDrawer();
                   else _this.mapControl.resetContent();
                   if(betaPending) { _this._joinEditingBeta(); return; }
                   _this._showWelcomeAlert();
                 },
                 error: showLoginFallback
               });
            } else {
               registrationError.text(_this.langMsgs.REGISTER_ERROR.format(data.msg || 'Unable to register. Please try again.')).prop('hidden', false);
            }
        },
        error: function(data) {
           registrationError.text(data.responseJSON && data.responseJSON.msg || 'Unable to register. Please try again.').prop('hidden', false);
        }
      });

      e.preventDefault();
   });

}
ZMap.prototype._createDialogDeleteAllMarkers = function() {
   if (confirm(_this.langMsgs.MARKER_DEL_ALL_COMPLETE_QUESTION.format(games[gameId].name))) {
       this.clearCompletedMarkers();
   } else {
      // Do nothing!
   }
}

// Forgot Password: an email address, then a link to choose a new password
// (ajax/lost_password.php). Laid out as the login page is, its messages in
// the page (as login's are), not in toasts.
ZMap.prototype._createLostPasswordForm = function() {
   var _this = this;
   this.mapControl.setContent('<div id="lostpassword">'+
                        '<h3 class="text-center">' + this.langMsgs.LOST_PASSWORD_WELCOME + '</h3>'+
                        '<form class="leaflet-control-layers-list account-form" role="lostpasswordform" id="lostpasswordform" novalidate>'+
                          '<p class="account-form-intro">Enter the email address of your account, and we’ll send you a link to choose a new password.</p>'+
                          '<div id="lostpassword_error" class="alert alert-danger login-error" role="alert" aria-live="assertive" hidden></div>'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="fas fa-envelope" aria-hidden="true"></i></span>'+
                                   '<input type="email" class="form-control" name="email" id="lostpassword_email" required="" maxlength="254" placeholder="Email address" autocomplete="email" autocapitalize="off" spellcheck="false"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="modal-footer">'+
                             '<div>'+
                                '<button type="submit" class="infoWindowIcn form-action-button">Send Reset Link</button>'+
                             '</div>'+
                          '</div>'+
                        '</form>'+
                        // Once sent: what happens next, and the way back.
                        '<div class="account-form account-form-done" id="lostpassword_sent" hidden>'+
                          '<div class="alert alert-success login-message" role="status" aria-live="polite">' + this.langMsgs.LOST_PASSWORD_SUCCESS + '</div>'+
                          '<p class="account-form-intro">The link works for an hour. Can’t find it? Check your spam folder, or try again in a few minutes.</p>'+
                          '<div class="modal-footer"><div>'+
                             '<button type="button" id="lostpassword_login_btn" class="infoWindowIcn form-action-button">Back to Login</button>'+
                          '</div></div>'+
                        '</div>'+
                     '</div>'
   , 'lostPasswordForm');
   this._lockWhileOffline('#lostpassword', { dim: '#lostpasswordform' });

   var showError = function(message) {
      $('#lostpassword_error').text(_this.langMsgs.LOST_PASSWORD_ERROR.format(message || '')).prop('hidden', false);
   };
   $('#lostpassword_email').on('input', function() { $('#lostpassword_error').prop('hidden', true).text(''); });
   $('#lostpassword_login_btn').on('click', function() { _this._createLoginForm(); });

   $('#lostpasswordform').on('submit', function(e) {
      e.preventDefault();
      var field = document.getElementById('lostpassword_email');
      if(!field.value.trim() || !field.checkValidity()) {
         showError('Please enter a valid email address.');
         field.focus();
         return;
      }
      var button = $('#lostpasswordform button[type="submit"]').prop('disabled', true);
      $.ajax({
        type: 'POST',
        url: 'ajax.php?command=lost_password',
        data: { email: field.value.trim() },
        dataType: 'json'
      }).done(function(data) {
         if(data && data.success) {
            $('#lostpasswordform').prop('hidden', true);
            $('#lostpassword_sent').prop('hidden', false);
            $('#lostpassword_login_btn').trigger('focus');
         } else {
            showError(data && data.msg);
            button.prop('disabled', false);
         }
      }).fail(function() {
         showError('Please try again.');
         button.prop('disabled', false);
      });
   });
}

// The page a password-reset e-mail links to: /?reset=<token>. The link is
// checked with the server before the form is shown, so an expired or used
// one says so instead of failing on submit.
ZMap.prototype._createResetPasswordForm = function() {
   var _this = this;
   var token = new URL(window.location.href).searchParams.get('reset') || '';
   var forgetToken = function() {
      var url = new URL(window.location.href);
      url.searchParams.delete('reset');
      window.history.replaceState(window.history.state, '', url.href);
   };

   this.mapControl.setContent('<div id="resetpassword">'+
                        '<h3 class="text-center">' + this.langMsgs.RESET_PASSWORD_WELCOME + '</h3>'+
                        '<div class="account-form">'+
                          '<p class="account-form-intro account-form-status" id="resetpassword_status" role="status" aria-live="polite">' + this.langMsgs.RESET_PASSWORD_CHECKING + '</p>'+
                        '</div>'+
                        '<form class="leaflet-control-layers-list account-form" role="resetpasswordform" id="resetpasswordform" hidden>'+
                          '<div id="resetpassword_error" class="alert alert-danger login-error" role="alert" aria-live="assertive" hidden></div>'+
                          // For the browser's password manager: whose password this is.
                          '<input type="text" name="username" id="resetpassword_username" autocomplete="username" hidden/>'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                   '<input type="password" class="form-control" name="password" id="resetpassword_new" required="" minlength="8" maxlength="72" placeholder="New password (8+ characters)" autocomplete="new-password"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                   '<input type="password" class="form-control" name="confirm" id="resetpassword_confirm" required="" minlength="8" maxlength="72" placeholder="New password again" autocomplete="new-password"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="modal-footer">'+
                             '<div>'+
                                '<button type="submit" class="infoWindowIcn form-action-button">Change Password</button>'+
                             '</div>'+
                           '</div>'+
                        '</form>'+
                        '<div class="account-form account-form-done" id="resetpassword_expired" hidden>'+
                           '<div class="modal-footer"><div>'+
                              '<button id="resetpassword_again_btn" type="button" class="infoWindowIcn form-action-button">Request a New Link</button>'+
                           '</div></div>'+
                        '</div>'+
                     '</div>'
   , 'resetPasswordForm');
   this._lockWhileOffline('#resetpassword', { dim: '#resetpasswordform' });

   var showError = function(message) {
      $('#resetpassword_error').text(message).prop('hidden', false);
   };
   var showExpired = function() {
      $('#resetpassword_status').text(_this.langMsgs.RESET_PASSWORD_INVALID).prop('hidden', false);
      $('#resetpasswordform').prop('hidden', true);
      $('#resetpassword_expired').prop('hidden', false);
   };
   $('#resetpasswordform input').on('input', function() { $('#resetpassword_error').prop('hidden', true).text(''); });

   $('#resetpassword_again_btn').click(function(e) {
      forgetToken();
      _this._createLostPasswordForm();
      e.preventDefault();
   });

   if(!/^[0-9a-f]{64}$/.test(token)) {
      showExpired();
      return;
   }

   $.getJSON('ajax.php?command=reset_password&check=1&token=' + encodeURIComponent(token)).done(function(data) {
      if(!data.success || !data.valid) { showExpired(); return; }
      if(data.username) $('#resetpassword_username').val(data.username);
      $('#resetpassword_status').prop('hidden', true);
      $('#resetpasswordform').prop('hidden', false);
      $('#resetpassword_new').trigger('focus');
   }).fail(function() {
      $('#resetpassword_status').text(_this.langMsgs.GENERAL_ERROR.format('The link couldn’t be checked. Please reload the page to try again.'));
   });

   $('#resetpasswordform').submit(function(e) {
      e.preventDefault();
      var password = $('#resetpassword_new').val();
      if(password.length < 8) {
         showError(_this.langMsgs.RESET_PASSWORD_ERROR.format('Use a password of at least 8 characters.'));
         $('#resetpassword_new').trigger('focus');
         return;
      }
      if(password !== $('#resetpassword_confirm').val()) {
         showError(_this.langMsgs.RESET_PASSWORD_MISMATCH);
         $('#resetpassword_confirm').trigger('focus');
         return;
      }
      var button = $('#resetpasswordform button[type="submit"]').prop('disabled', true);
      $.ajax({
        type: 'POST',
        url: 'ajax.php?command=reset_password',
        data: { token: token, password: password },
        dataType: 'json'
      }).done(function(data) {
         if(data.success) {
            forgetToken();
            // The login page, saying so (as it does after registering).
            _this._createLoginForm(_this.langMsgs.RESET_PASSWORD_SUCCESS);
         } else if(data.field === 'password') {
            showError(_this.langMsgs.RESET_PASSWORD_ERROR.format(data.msg));
            button.prop('disabled', false);
         } else {
            // The link was used or expired between the check and now.
            showExpired();
         }
      }).fail(function() {
         showError(_this.langMsgs.RESET_PASSWORD_ERROR.format('Please try again.'));
         button.prop('disabled', false);
      });
   });
};

ZMap.prototype._createChangePasswordForm = function() {
   this.mapControl.setContent('<div id="changepassword">'+
                        '<h3 class="text-center">' + this.langMsgs.CHANGE_PASSWORD_WELCOME + '</h3>'+
                        '<form class="leaflet-control-layers-list" role="changepasswordform" id="changepasswordform" enctype="multipart/form-data">'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                   '<input type="password" s="form-control" class="form-control" name="currentpassword" id="currentpassword" required="" placeholder="Enter your current password"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                   '<input type="password" s="form-control" class="form-control" name="newpassword" id="newpassword" required="" placeholder="Enter a new password"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="modal-footer">'+
                             '<div>'+
                                '<button type="submit" class="infoWindowIcn form-action-button">Change Password</button>'+
                                '<button id="change_password_back_btn" type="button" class="infoWindowIcn form-action-button">Back</button>'+
                             '</div>'+
                           '</div>'+
                        '</form>'+
                     '</div>'
   , 'changePasswordForm');
   this._lockWhileOffline('#changepassword', { keep: '#change_password_back_btn', dim: '#changepasswordform' });


   $("#changepasswordform").submit(function(e) {
      $.ajax({
        type: "POST",
        async: false,
        url: "ajax.php?command=change_password",
        data: $("#changepasswordform").serialize(), // serializes the form's elements.
        success: function(data) {
          //data = jQuery.parseJSON(data);
          if (data.success) {
            toastr.success(_this.langMsgs.CHANGE_PASSWORD_SUCCESS);
            _this.mapControl.resetContent();
          } else {
            toastr.error(_this.langMsgs.CHANGE_PASSWORD_ERROR.format(data.msg));
          }
        }
      });

      e.preventDefault();
   });

   $("#change_password_back_btn").click(function(e) {
      _this._createAccountInformationForm();
      e.preventDefault();
   });
}

ZMap.prototype._createAccountDeleteForm = function() {
  this.mapControl.setContent(
    '<div id="deleteaccount">' +
      '<h3 class="text-center">' + this.langMsgs.DELETE_ACCOUNT_WELCOME + '</h3>' +
      '<div class="delete-account-warning" role="alert">' +
        '<strong>This action is permanent.</strong> ' +
        'Deleting your account will remove all of your user data from Zelda Maps. ' +
        'If you wish to save your maps data again, you will need to create a new account.' +
      '</div>' +
      '<form class="leaflet-control-layers-list" role="deleteaccountform" id="deleteaccountform" enctype="multipart/form-data">' +
        '<div class="form-group">' +
           '<div class="cols-sm-10">' +
              '<div class="input-group">' +
                '<span class="input-group-addon">' +
                  '<i class="icon-fa-lock fa-lg" aria-hidden="true"></i>' +
                '</span>' +
                '<input type="password" s="form-control" class="form-control" name="currentpassword" id="currentpassword" required="" placeholder="Enter your current password" autocomplete="current-password" aria-describedby="delete_password_error"/>' +
                '<span class="password-validation-icon" aria-hidden="true"></span>' +
              '</div>' +
           '</div>' +
        '</div>' +
        '<p id="delete_password_error" role="status" aria-live="polite"></p>' +
        '<div class="modal-footer">' +
           '<div>' +
              '<button type="submit" class="infoWindowIcn form-action-button bad">Permanently Delete Account</button>' +
           '</div>' +
         '</div>' +
      '</form>' +
    '</div>'
  , 'deleteAccountForm'
  );
  this._lockWhileOffline('#deleteaccount', { dim: '#deleteaccountform' });

  var _this = this;

  // The password is checked when the button is pressed; a wrong one is
  // flagged inline with the Account Information error style, and a right one
  // moves straight on to the final confirmation.
  var passwordInput = $('#currentpassword');
  var passwordGroup = passwordInput.closest('.input-group');
  var passwordIcon = passwordGroup.find('.password-validation-icon');
  var passwordMessage = $('#delete_password_error');
  var deleteButton = $('#deleteaccountform button[type="submit"]');
  var busy = false;
  var showPasswordError = function(message) {
    passwordInput.attr('aria-invalid', 'true');
    passwordGroup.addClass('password-invalid');
    passwordIcon.html('<i class="fas fa-times"></i>');
    passwordMessage.text(message);
  };
  var clearPasswordError = function() {
    passwordInput.removeAttr('aria-invalid');
    passwordGroup.removeClass('password-invalid');
    passwordIcon.empty();
    passwordMessage.text('');
  };
  var setBusy = function(value) {
    busy = value;
    deleteButton.prop('disabled', value);
  };
  passwordInput.on('input', clearPasswordError);

  var deleteAccount = function() {
    setBusy(true);

    $.ajax({
      type: "POST",
      url: "ajax.php?command=delete_account",
      data: $("#deleteaccountform").serialize(),
      success: function(data) {
        if(data.success) {
          // The server has already ended the session; just sign out locally.
          _this.setUser(null);
          updateAdState();
          showLoginControls();
          if(_this.mapControl.viewStyleBottomSlide) {
            _this.mapControl.closeDrawer();
          } else {
            _this.mapControl.resetContent();
          }
          _this._showAccountDeletedAlert();
        } else {
          setBusy(false);
          if(/password/i.test(data.msg || '')) {
            // e.g. the password was changed elsewhere since it was checked.
            showPasswordError('Current password is incorrect.');
          } else {
            toastr.error(_this.langMsgs.DELETE_ACCOUNT_ERROR.format(data.msg || 'Please try again.'));
          }
        }
      },
      error: function(data) {
        setBusy(false);
        var message = data.responseJSON && data.responseJSON.msg;
        toastr.error(_this.langMsgs.DELETE_ACCOUNT_ERROR.format(message || 'Unable to connect. Please try again.'));
      }
    });
  };

  $("#deleteaccountform").submit(function(e) {
    e.preventDefault();
    if(busy) return;
    var password = passwordInput.val();
    if(!password) {
      showPasswordError('Enter your current password.');
      return;
    }

    setBusy(true);
    $.ajax({ type: 'POST', url: 'ajax.php?command=check_account_password', data: { currentpassword: password } })
      .done(function(data) {
        setBusy(false);
        if(!(data.success && data.valid)) {
          showPasswordError('Current password is incorrect.');
          return;
        }
        clearPasswordError();
        // One last confirmation before anything is sent.
        _this._showAlert({
          id: 'confirm-delete-account-alert',
          title: 'Really Really Delete Your Account?',
          description: 'Confirm one last time that you really want to do this. This <strong>cannot be undone</strong>!',
          actions: [
            {
              label: 'Yes, Really Delete My Account',
              className: 'infoWindowIcn bad',
              onSelect: deleteAccount
            },
            { label: 'Cancel', className: 'bookmark-registration-cancel', cancel: true }
          ]
        });
      })
      .fail(function() {
        setBusy(false);
        showPasswordError('Unable to check password. Please try again.');
      });
  });
}

// Shows a modal alert in the same style as the bookmark registration prompt.
// opts: id, title, description (HTML),
//       actions: [{ label, className, onSelect, cancel }].
// Escape dismisses without selecting an action.
ZMap.prototype._showAlert = function(opts) {
  if(document.getElementById(opts.id)) return;
  var dialog = document.createElement('dialog');
  dialog.id = opts.id;
  dialog.className = 'bookmark-registration-prompt';
  dialog.setAttribute('aria-labelledby', opts.id + '-title');
  dialog.setAttribute('aria-describedby', opts.id + '-description');
  dialog.innerHTML = '<h2 id="' + opts.id + '-title"></h2>' +
    '<div id="' + opts.id + '-description"></div>' +
    '<div class="bookmark-registration-actions"></div>';
  dialog.querySelector('h2').textContent = opts.title;
  // One paragraph, or an array of them.
  [].concat(opts.description).forEach(function(paragraph) {
    var node = document.createElement('p');
    node.innerHTML = paragraph;
    dialog.querySelector('#' + opts.id + '-description').appendChild(node);
  });
  dialog.addEventListener('close', function() {
    dialog.remove();
  });

  var dismiss = function(action) {
    if(dialog.classList.contains('is-closing')) return;
    var finished = false;
    var finish = function() {
      if(finished) return;
      finished = true;
      if(dialog.open) dialog.close();
      // close() fires no event on an already-closed dialog; always clean up.
      dialog.remove();
      if(action && action.onSelect) action.onSelect();
    };
    dialog.classList.add('is-closing');
    // Paused animations (e.g. a backgrounded tab) never finish, so don't wait
    // longer than the exit animation needs.
    window.setTimeout(finish, 300);
    if(typeof dialog.getAnimations !== 'function') { finish(); return; }
    var animations = dialog.getAnimations();
    if(!animations.length) finish();
    else Promise.all(animations.map(function(animation) { return animation.finished.catch(function() {}); })).then(finish);
  };

  var actionsNode = dialog.querySelector('.bookmark-registration-actions');
  // Focus Cancel when there is one, otherwise the first button, rather than a
  // link in the text.
  var focusAction = opts.actions.find(function(action) { return action.cancel; }) || opts.actions[0];
  opts.actions.forEach(function(action) {
    var button = document.createElement('button');
    button.type = 'button';
    button.className = action.className || 'infoWindowIcn';
    button.autofocus = action === focusAction;
    if(action.cancel) button.setAttribute('data-action', 'cancel');
    button.textContent = action.label;
    button.addEventListener('click', function() { dismiss(action); });
    actionsNode.appendChild(button);
  });
  // Links in the text, <a data-action="name">, close the alert and then run
  // opts.links[name].
  dialog.querySelectorAll('p a[data-action]').forEach(function(link) {
    var onSelect = opts.links && opts.links[link.getAttribute('data-action')];
    if(!onSelect) return;
    link.addEventListener('click', function(e) {
      e.preventDefault();
      dismiss({ onSelect: onSelect });
    });
  });
  dialog.addEventListener('cancel', function(e) { e.preventDefault(); dismiss(null); });
  document.body.appendChild(dialog);
  dialog.showModal();
};

ZMap.prototype._showAccountDeletedAlert = function() {
  this._showAlert({
    id: 'account-deleted-alert',
    title: 'Account Deleted',
    description: 'We\'ve completely removed your account. Sorry to see you go!',
    actions: [{ label: 'Okay' }]
  });
};

ZMap.prototype._showWelcomeAlert = function() {
  this._showAlert({
    id: 'welcome-alert',
    title: 'Welcome to Zelda Maps!',
    description: [
      'You\'re registered! Ads are gone, and we\'ve automatically imported any completed markers. ' +
        'You can view your bookmarks and download maps for offline use from your ' +
        '<a href="?page=account" data-action="account">Account Page</a>.',
      'Happy exploring!'
    ],
    links: {
      account: function() {
        this._createAccountForm(this.getUser());
        if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerLarge();
      }.bind(this)
    },
    actions: [{ label: 'Let\'s go!' }]
  });
};

ZMap.prototype._createLoginForm = function(successMessage) {
   this.mapControl.setContent('<div id="login">'+
                           '<h3 class="text-center">' + this.langMsgs.LOGIN_WELCOME + '</h3>'+
                           '<form class="leaflet-control-layers-list" role="loginform" id="loginform" enctype="multipart/form-data">'+
                           '<div id="login-success" class="alert alert-success login-message" role="status" aria-live="polite" hidden></div>'+
                           '<div id="login-error" class="alert alert-danger login-error" role="alert" aria-live="assertive" hidden></div>'+
                           '<div class="form-group">'+
                              '<div class="cols-sm-10">'+
                                 '<div class="input-group">'+
                                    '<span class="input-group-addon"><i class="fa-user fa" aria-hidden="true"></i></span>'+
                                    '<input type="text" class="form-control" name="user" id="user" required="" placeholder="Username or email"/>'+
                                 '</div>'+
                              '</div>'+
                           '</div>'+
                           '<div class="form-group">'+
                              '<div class="cols-sm-10">'+
                                 '<div class="input-group">'+
                                    '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                    /* Added autocomplete as per suggestion -> https://www.chromium.org/developers/design-documents/form-styles-that-chromium-understands */
                                    '<input type="password" s="form-control" class="form-control" name="password" id="password" required="" placeholder="Password" autocomplete="current-password" />'+
                                 '</div>'+
                              '</div>'+
                           '</div>'+
                           '<div class="login-options">'+
                              '<a href="#" id="login_lost_btn" class="login-forgot">Forgot password?</a>'+
                           '</div>'+
                           '<div class="modal-footer">'+
                              '<div>'+
                                 '<button type="submit" class="infoWindowIcn form-action-button">Login</button>'+
                              '</div>'+
                           '</div>'+
                           '<div class="register-benefits">'+
                              '<h4>Register <em>for free</em> to:</h4>'+
                              '<ul>'+
                                 ['Remove ads!', 'Download maps to use offline', 'Save completed markers',
                                  'Save bookmarks &amp; dropped pins', 'Edit markers and contribute to making maps better (beta)'
                                 ].map(function(benefit) {
                                    return '<li><i class="fas fa-check" aria-hidden="true"></i><span>' + benefit + '</span></li>';
                                 }).join('')+
                              '</ul>'+
                              '<button id="login_register_btn" type="button" class="infoWindowIcn form-action-button">Register</button>'+
                           '</div>'+
                           '</form>'+
                        '</div>', 'loginForm');

   if(successMessage) {
      $("#login-success").text(successMessage).removeAttr("hidden");
   }

   function showLoginError(message) {
      $("#login-error")
        .text(_this.langMsgs.LOGIN_ERROR.format(message || "Unable to log in. Please try again."))
        .removeAttr("hidden");
   }

   function clearLoginError() {
      $("#login-error").attr("hidden", true).text("");
   }

   $("#loginform").submit(function(e) {
      clearLoginError();
      var result = false;
      $.ajax({
        type: "POST",
        async: false,
        url: "ajax.php?command=login",
        data: $("#loginform").serialize(),
        success: function(data) {
          //data = jQuery.parseJSON(data);
          if (data.success) {
            checkChangelog(data.user);
            if(_this._pendingBookmarkRegistration) _this.trackFeatureEvent('signed_in', 'bookmark');
            _this.setUser(data.user);
            updateAdState();

            if(_this._pendingBookmarkRegistration) {
              _this._saveRegistrationBookmark();
              return;
            }
            if(_this._pendingCompleteRegistration) {
              _this.trackFeatureEvent('signed_in', 'complete', _this._completePromptState().variant);
              _this._finishCompleteRegistration(false);
              return;
            }

            if (_this.mapControl.isMobile) {
               _this.mapControl.closeDrawer();
            } else {
              _this.mapControl.resetContent();
            }
            if(_this.settingsControl) _this.settingsControl.applyAccountSettings(data.user.settings);
            ZOfflineSync.saveUserInfo({ success: true, user: data.user });
            _this.syncOfflineChanges();
            _this.checkOfflineMapUpdates();
            if(_this.resumeOfflineDownloads) _this.resumeOfflineDownloads();
          } else {
            showLoginError(data.msg);
          }
        },
        error: function(data) {
          var message = data.responseJSON && data.responseJSON.msg;
          showLoginError(message);
        }
      });
      e.preventDefault();
   });

   $("#loginform input").on("input", clearLoginError);

   $("#login_register_btn").click(function(e) {
      _this._createRegisterForm();
      e.preventDefault();
   });

   $("#login_lost_btn").click(function(e) {
      _this._createLostPasswordForm();
      e.preventDefault();
   });

}

ZMap.prototype.drawerPageRoutes = {
  accountPage: 'account',
  accountInformationPage: 'account-information',
  offlineMapsPage: 'offline-maps',
  bookmarksPage: 'bookmarks',
  adminPage: 'admin',
  loginForm: 'login',
  registerForm: 'register',
  lostPasswordForm: 'lost-password',
  resetPasswordForm: 'reset-password',
  changePasswordForm: 'change-password',
  deleteAccountForm: 'delete-account',
  notificationsPage: 'notifications',
  notificationSettingsPage: 'notification-settings',
  followedMarkersPage: 'followed-markers'
};

ZMap.prototype.syncDrawerPageURL = function(contentType) {
  if(!this._drawerRoutingReady || (this.mapControl && this.mapControl._restoringInitialPage)) return;
  var url = new URL(window.location.href);
  var page = this.drawerPageRoutes[contentType];
  var recent = /^recentChanges-(.+)$/.exec(contentType || '');
  var profile = /^userProfile-(\d+)$/.exec(contentType || '');
  var userTalk = /^talk-user-(\d+)$/.exec(contentType || '');
  var markerTalk = /^talk-marker-(\d+)$/.exec(contentType || '');
  var settingsRevision=/^gameSettingsRevision-(\d+)$/.exec(contentType || '');
  if(contentType==='mapSettingsHistory') page='game-settings-history';
  url.searchParams.delete('history-game');
  if(contentType==='mapSettingsHistory' && this._settingsHistoryGame) url.searchParams.set('history-game',this._settingsHistoryGame);
  if(settingsRevision) page='game-settings-revision';
  url.searchParams.delete('settings-rev');
  if(settingsRevision) url.searchParams.set('settings-rev',settingsRevision[1]);
  if(contentType === 'allChanges') page = 'all-changes';
  if(recent) page = 'recent-edits';
  if(profile || userTalk) page = null;
  url.searchParams.delete('edits-game');
  url.searchParams.delete('profile');
  // By username, which reads better and lasts; IDs from older links still work.
  if(contentType === 'allChanges' || recent || profile) {
    url.searchParams.delete('marker');
    ['talk', 'comment', 'user', 'notification'].forEach(function(key) { url.searchParams.delete(key); });
  }
  if(profile || userTalk) {
    var userId=(profile || userTalk)[1];
    url.searchParams.set('user',(this._profileNames && this._profileNames[userId]) || userId);
    if(userTalk) url.searchParams.set('talk','1');
    else url.searchParams.delete('talk');
    url.searchParams.delete('marker');url.searchParams.delete('rev');
  } else {
    url.searchParams.delete('user');
    if(markerTalk) {
      url.searchParams.set('marker',markerTalk[1]);
      url.searchParams.set('talk','1');
    } else url.searchParams.delete('talk');
  }
  if(/^area-/.test(contentType || '') && this.selectedArea) {
    url.searchParams.set('area',this.areaURLKey(this.selectedArea));
    url.searchParams.delete('marker');
  } else url.searchParams.delete('area');
  // ?category= is the category page's address (lib/common/seo.php slugs the
  // same name), held only while that page is the one showing, as ?area= is.
  if(/^category-\d+$/.test(contentType || '') && this.selectedCategory) {
    url.searchParams.set('category', this.categoryURLKey(this.selectedCategory));
    url.searchParams.delete('marker');
    url.searchParams.delete('area');
  } else url.searchParams.delete('category');
  if(page) url.searchParams.set('page', page);
  else url.searchParams.delete('page');
  // Revision links (?marker=1&rev=2) last only while the revision is open.
  if(!/^markerRevision-/.test(contentType || '')) url.searchParams.delete('rev');
  // The reset token (?reset=) lasts only while the reset form is open.
  if(contentType !== 'resetPasswordForm') url.searchParams.delete('reset');
  var reloadParent = null;
  if(['accountPage', 'loginForm', 'games', 'maps'].includes(contentType)) {
    var parent = this.mapControl._headerPageParent;
    if(parent && /^m\d+$/.test(parent.type)) reloadParent = parent.type;
  }
  var state = Object.assign({}, window.history.state);
  if(reloadParent) state.drawerReloadParent = reloadParent;
  else delete state.drawerReloadParent;
  window.history.replaceState(state, '', url.href);
};

ZMap.prototype._withoutPageSlide = function(render) {
  var control=this.mapControl,previous=control._suppressPageSlide;
  control._suppressPageSlide=true;
  try {return render();} finally {control._suppressPageSlide=previous;}
};

ZMap.prototype.restoreDrawerPage = function(page, animate) {
  if(animate) return this._restoreDrawerPage(page);
  return this._withoutPageSlide(function() {return this._restoreDrawerPage(page);}.bind(this));
};

ZMap.prototype._restoreDrawerPage = function(page) {
  this._drawerRoutingReady = true;
  if(this.restoreAreaFromURL && this.restoreAreaFromURL()) return;
  if(this.restoreCategoryFromURL && this.restoreCategoryFromURL()) return;
  if(this._hasWikiLink && this._hasWikiLink()) {
    this._openRevisionLinkWhenReady('user');
    if(this._revisionLinkOpened) return;
  }
  var state = Object.assign({}, window.history.state);
  if(state.responsiveDrawer) {
    var snapshot = state.responsiveDrawer;
    delete state.responsiveDrawer;
    delete state.drawerReloadParent;
    window.history.replaceState(state, '', window.location.href);
    this.restoreResponsiveDrawer(snapshot);
    return;
  }
  var parent = state.drawerReloadParent;
  if(parent) {
    delete state.drawerReloadParent;
    var url = new URL(window.location.href);
    if(/^m\d+$/.test(parent)) {
      url.searchParams.set('marker', parent.substring(1));
      url.searchParams.delete('page');
      page = null;
    }
    window.history.replaceState(state, '', url.href);
    if(/^m\d+$/.test(parent)) {
      // The marker URL may have been cleared while viewing a header page.
      // finalLoad has already run by the time account restoration completes,
      // so changing the URL alone cannot restore the POI.
      this.mapControl._restoringInitialPage = true;
      try {
        this.goTo({ marker: parent.substring(1), panTo: false, centerInVisibleArea: true });
      } finally {
        this.mapControl._restoringInitialPage = false;
      }
      return;
    }
  }
  // A password-reset e-mail links to /?reset=<token>.
  if(new URL(window.location.href).searchParams.has('reset')) page = 'reset-password';
  if(!page) return;
  if(page === 'games' || page === 'maps') {
    this.syncDrawerPageURL(this.mapControl.getContentType());
    return;
  }
  if(['all-changes', 'recent-edits', 'profile'].includes(page)) {
    var params = new URL(window.location.href).searchParams;
    var _this = this;
    var back = function() { _this.mapControl.resetContent(); };
    if(page === 'profile') {
      // A username, or an account ID from an older link (user_profile.php).
      var profileName = params.get('user') || params.get('profile');
      if(!profileName || profileName.length > 100) return;
      this._openUserProfile({ name: profileName }, back);
    } else {
      this._openRecentChanges(page === 'recent-edits' ? this.mapOptions.shortName : null, back);
    }
    return;
  }
  if(['game-settings-history','game-settings-revision'].includes(page)) {
    if(!this.getUser()) {this._createLoginForm();return;}
    if(page==='game-settings-history' ? !this._canUseMapSettings() : !this._isWikiEditor()) return;
    var self=this,returnToCategories=function() {self.mapControl.resetContent();};
    if(page==='game-settings-history') this._openMapSettingsHistory(returnToCategories,new URL(window.location.href).searchParams.get('history-game') || this.mapOptions.shortName);
    else {
      var revisionId=Number(new URL(window.location.href).searchParams.get('settings-rev'));
      if(!Number.isInteger(revisionId) || revisionId<1) return;
      this._openGameSettingsRevision(revisionId,function() {self._openMapSettingsHistory(returnToCategories);});
    }
    return;
  }
  var authenticatedRoutes = {
    account: '_createAccountForm',
    'account-information': '_createAccountInformationForm',
    'offline-maps': '_createOfflineMapsForm',
    bookmarks: '_createBookmarksPage',
    admin: '_createAdminPage',
    'admin-reports': '_openAdminReports',
    // One report (scripts/zreports.js): ?page=report&report=12.
    report: '_routeReport',
    'change-password': '_createChangePasswordForm',
    'delete-account': '_createAccountDeleteForm',
    // Notifications (znotifications.js), editors only for now.
    notifications: '_routeNotifications',
    'notification-settings': '_routeNotificationSettings',
    'followed-markers': '_routeFollowedMarkers'
  };
  var publicRoutes = {
    login: '_createLoginForm', register: '_createRegisterForm',
    'lost-password': '_createLostPasswordForm',
    'reset-password': '_createResetPasswordForm'
  };
  if(authenticatedRoutes[page]) {
    if(this.getUser()) this[authenticatedRoutes[page]](this.getUser());
    else this._createLoginForm();
  } else if(publicRoutes[page]) {
    this[publicRoutes[page]]();
  } else return;
  if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerLarge();
  else this.mapControl._expand();
};

ZMap.prototype.restoreResponsiveDrawer = function(snapshot) {
  var control = this.mapControl;
  var type = snapshot.type;
  control._restoringInitialPage = true;
  try {
    if(snapshot.parent && /^m\d+$/.test(snapshot.parent.type || '')) {
      this.goTo({ marker: snapshot.parent.type.substring(1), panTo: false, centerInVisibleArea: false });
    }
    if(/^m\d+$/.test(type || '')) {
      this.goTo({ marker: type.substring(1), panTo: false, centerInVisibleArea: false });
    } else if(['games', 'maps'].includes(type)) {
      control._headerPageParent = snapshot.parent;
      control._navigatingBack = true; // Preserve the inherited parent during restoration.
      control.setContent(type === 'games' ? control._gameMenu.domNode : control._mapsMenu.domNode, type);
      (type === 'games' ? control._gamesButton : control._mapsButton)._toggle(true);
    } else if(type === 'allChanges' || /^recentChanges-/.test(type || '') || /^userProfile-\d+$/.test(type || '')) {
      var _this = this;
      var back = function() { _this.mapControl.resetContent(); };
      if(/^userProfile-/.test(type)) this._openUserProfile({ id: type.substring('userProfile-'.length) }, back);
      else this._openRecentChanges(type === 'allChanges' ? null : type.substring('recentChanges-'.length), back);
    } else if(this.drawerPageRoutes[type]) {
      control._headerPageParent = snapshot.parent;
      control._navigatingBack = true;
      this.restoreDrawerPage(this.drawerPageRoutes[type]);
    } else {
      control.resetContent();
    }
    // Parent positions belong to the old viewport. Preserve their relative
    // detent rather than reusing an absolute coordinate after a layout change.
    if(snapshot.parent) {
      var parent = Object.assign({}, snapshot.parent);
      var oldHeight = snapshot.parentViewportHeight || control._viewportHeight();
      parent.top = parent.top <= control.options.openTo + 1 ? control.options.openTo :
        Math.max(control.options.openTo + 2, parent.top * control._viewportHeight() / oldHeight);
      control._headerPageParent = parent;
      control._mobileAccountParent = parent;
    }
    if(control.viewStyleBottomSlide) {
      if(!snapshot.open) control.closeDrawer(true);
      else if(snapshot.partial) control.openDrawerDefaultPartial();
      else control.openDrawerLarge();
    } else {
      control._expand();
    }
    control._contents.scrollTop = snapshot.scrollTop || 0;
    this.syncDrawerPageURL(type);
  } finally {
    control._restoringInitialPage = false;
  }
};

//************* ADMIN *************//
// For admins (level 10+): registrations over time, and a searchable list of
// accounts that opens an editor for each. See ajax/admin_*.php.

ZMap.prototype.adminRoles = [
  { level: 1, label: 'User' },
  { level: 5, label: 'Contributor' },
  // Everything an admin has, for now (lib/common/admin.php).
  { level: 10, label: 'Moderator' },
  { level: 15, label: 'Admin' },
  // Admins who also manage the other admins. Only the admin panel says so:
  // everywhere else it's "Admin" (zwiki.js).
  { level: 20, label: 'Super Admin' }
];
ZMap.prototype.ADMIN_ROLE_LEVEL = 15;
ZMap.prototype.SUPER_ADMIN_LEVEL = 20;

// opts.restore: coming back from an account, so show the search, results and
// scroll position as they were instead of starting over.
ZMap.prototype._createAdminPage = function(opts) {
  var _this = this;
  var saved = opts && opts.restore ? this._adminState : null;
  // The site's settings: Admins and up only (lib/common/site_settings.php).
  var me = this.getUser && this.getUser();
  var siteSettings = !!me && Number(me.level) >= this.ADMIN_ROLE_LEVEL;
  this.mapControl.setContent(
    '<div id="admin">' +
      '<h3 class="text-center">Admin</h3>' +
      // Two tabs: the stats, and finding and managing accounts.
      '<div class="admin-tabs admin-page-tabs" role="tablist" aria-label="Admin">' +
        '<button type="button" role="tab" id="admin_tab_analytics" aria-controls="admin_panel_analytics" data-admin-tab="analytics">' +
          '<i class="fas fa-chart-bar" aria-hidden="true"></i>Analytics</button>' +
        '<button type="button" role="tab" id="admin_tab_users" aria-controls="admin_panel_users" data-admin-tab="users">' +
          '<i class="fas fa-users" aria-hidden="true"></i>Users</button>' +
        // Reported edits (scripts/zreports.js).
        '<button type="button" role="tab" id="admin_tab_reports" aria-controls="admin_panel_reports" data-admin-tab="reports">' +
          '<i class="fas fa-flag" aria-hidden="true"></i>Reports<span class="admin-tab-count" hidden></span></button>' +
        (siteSettings ? '<button type="button" role="tab" id="admin_tab_settings" aria-controls="admin_panel_settings" data-admin-tab="settings">' +
          '<i class="fas fa-sliders-h" aria-hidden="true"></i>Settings</button>' : '') +
      '</div>' +
      (siteSettings ? '<div class="admin-panel" id="admin_panel_settings" role="tabpanel" aria-labelledby="admin_tab_settings" data-admin-panel="settings" hidden></div>' : '') +
      '<div class="admin-panel" id="admin_panel_reports" role="tabpanel" aria-labelledby="admin_tab_reports" data-admin-panel="reports" hidden></div>' +
      '<div class="admin-panel" id="admin_panel_analytics" role="tabpanel" aria-labelledby="admin_tab_analytics" data-admin-panel="analytics">' +
      // Growth: how many people sign up and come back, and what brought
      // them. Engagement: which features they use, then each in detail.
      '<p class="admin-group-label">Growth</p>' +
      '<section data-section="accounts" class="admin-section admin-analytics-section">' +
        '<h4 class="admin-section-heading">Accounts <span id="admin_total" class="admin-muted admin-section-summary"></span></h4>' +
        '<div class="admin-chart">' +
          '<div class="admin-chart-options">' +
            '<div class="admin-toggle admin-metrics" role="group" aria-label="Graph">' +
              '<button type="button" data-metric="registrations">Registrations</button>' +
              '<button type="button" data-metric="active">Active Users</button>' +
            '</div>' +
            '<div class="admin-toggle admin-ranges" role="group" aria-label="Time frame">' +
              [['7d', '1W'], ['14d', '2W'], ['30d', '30D'], ['6m', '6M'], ['1y', '1Y'], ['all', 'All']].map(function(range) {
                return '<button type="button" data-range="' + range[0] + '">' + range[1] + '</button>';
              }).join('') +
            '</div>' +
          '</div>' +
          '<p id="admin_chart_readout" class="admin-chart-readout" aria-live="polite"></p>' +
          '<div id="admin_chart"><p class="admin-muted">Loading…</p></div>' +
        '</div>' +
        // Active users over the latest complete day, week and month, whatever
        // the graph shows.
        '<div id="admin_summary" class="admin-summary"></div>' +
      '</section>' +
      '<section data-section="signups" class="admin-section admin-analytics-section">' +
        '<h4 class="admin-section-heading">Sign-Up Sources <span id="admin_signup_total" class="admin-muted admin-section-summary"></span></h4>' +
        // The same time frames, laid out the same, as the Accounts graph.
        '<div class="admin-chart-options">' +
          '<div class="admin-toggle admin-signup-ranges" role="group" aria-label="Time frame">' +
            [['7d', '1W'], ['14d', '2W'], ['30d', '30D'], ['6m', '6M'], ['1y', '1Y'], ['all', 'All']].map(function(range) {
              return '<button type="button" data-signup-range="' + range[0] + '">' + range[1] + '</button>';
            }).join('') +
          '</div>' +
        '</div>' +
        '<div id="admin_signups" class="admin-signups"><p class="admin-muted">Loading…</p></div>' +
      '</section>' +
      '<p class="admin-group-label">Engagement</p>' +
      // Embeds (embed.php): Embed Code copied, and embeds shown on other
      // sites, with the sites showing them most.
      '<section data-section="embeds" class="admin-section admin-analytics-section admin-activity" data-activity="embeds">' +
        '<h4 class="admin-section-heading">Embeds <span class="admin-muted admin-section-summary admin-embeds-total"></span></h4>' +
        '<div class="admin-chart">' +
          '<div class="admin-chart-options">' +
            '<div class="admin-toggle admin-metrics" role="group" aria-label="Graph">' +
              '<button type="button" data-metric="embed_copies">Codes Copied</button>' +
              '<button type="button" data-metric="embed_views">Embed Views</button>' +
            '</div>' +
            '<div class="admin-toggle admin-ranges" role="group" aria-label="Time frame">' +
              [['7d', '1W'], ['14d', '2W'], ['30d', '30D'], ['6m', '6M'], ['1y', '1Y'], ['all', 'All']].map(function(range) {
                return '<button type="button" data-range="' + range[0] + '">' + range[1] + '</button>';
              }).join('') +
            '</div>' +
          '</div>' +
          '<p class="admin-chart-readout" aria-live="polite"></p>' +
          '<div class="admin-activity-chart"><p class="admin-muted">Loading…</p></div>' +
        '</div>' +
        '<div class="admin-summary admin-activity-summary"></div>' +
        '<div class="admin-embeds-detail"></div>' +
      '</section>' +
      // Devices signed up for push notifications.
      '<section data-section="push" class="admin-section admin-analytics-section admin-activity" data-activity="push">' +
        '<h4 class="admin-section-heading">Push Notifications <span class="admin-muted admin-section-summary admin-push-total"></span></h4>' +
        '<div class="admin-chart">' +
          '<div class="admin-chart-options">' +
            '<div class="admin-toggle admin-ranges" role="group" aria-label="Time frame">' +
              [['7d', '1W'], ['14d', '2W'], ['30d', '30D'], ['6m', '6M'], ['1y', '1Y'], ['all', 'All']].map(function(range) {
                return '<button type="button" data-range="' + range[0] + '">' + range[1] + '</button>';
              }).join('') +
            '</div>' +
          '</div>' +
          '<p class="admin-chart-readout" aria-live="polite"></p>' +
          '<div class="admin-activity-chart"><p class="admin-muted">Loading…</p></div>' +
        '</div>' +
        '<div class="admin-summary admin-activity-summary"></div>' +
      '</section>' +
      '<section data-section="markers" class="admin-section admin-analytics-section admin-activity" data-activity="markers">' +
        '<h4 class="admin-section-heading">Completes &amp; Bookmarks <span class="admin-muted admin-section-summary admin-activity-total"></span></h4>' +
        '<div class="admin-chart">' +
          '<div class="admin-chart-options">' +
            '<div class="admin-toggle admin-metrics" role="group" aria-label="Graph">' +
              '<button type="button" data-metric="completes">Completes</button>' +
              '<button type="button" data-metric="bookmarks">Bookmarks</button>' +
            '</div>' +
            '<div class="admin-toggle admin-ranges" role="group" aria-label="Time frame">' +
              [['7d', '1W'], ['14d', '2W'], ['30d', '30D'], ['6m', '6M'], ['1y', '1Y'], ['all', 'All']].map(function(range) {
                return '<button type="button" data-range="' + range[0] + '">' + range[1] + '</button>';
              }).join('') +
            '</div>' +
          '</div>' +
          '<p class="admin-chart-readout" aria-live="polite"></p>' +
          '<div class="admin-activity-chart"><p class="admin-muted">Loading…</p></div>' +
        '</div>' +
        '<div class="admin-summary admin-activity-summary"></div>' +
        '<div class="admin-top-markers"></div>' +
      '</section>' +
      '<section data-section="editing" class="admin-section admin-analytics-section admin-activity" data-activity="editing">' +
        '<h4 class="admin-section-heading">Community Editing <span class="admin-muted admin-section-summary admin-editing-total"></span></h4>' +
        '<div class="admin-chart">' +
          '<div class="admin-chart-options">' +
            '<div class="admin-toggle admin-metrics" role="group" aria-label="Graph">' +
              '<button type="button" data-metric="edits">Edits</button>' +
              '<button type="button" data-metric="beta">Beta Sign-Ups</button>' +
            '</div>' +
            '<div class="admin-toggle admin-ranges" role="group" aria-label="Time frame">' +
              [['7d', '1W'], ['14d', '2W'], ['30d', '30D'], ['6m', '6M'], ['1y', '1Y'], ['all', 'All']].map(function(range) {
                return '<button type="button" data-range="' + range[0] + '">' + range[1] + '</button>';
              }).join('') +
            '</div>' +
          '</div>' +
          '<p class="admin-chart-readout" aria-live="polite"></p>' +
          '<div class="admin-activity-chart"><p class="admin-muted">Loading…</p></div>' +
        '</div>' +
        '<div class="admin-summary admin-activity-summary"></div>' +
      '</section>' +
      ['yeahs','comments'].map(function(metric) {
        return '<section data-section="'+metric+'" class="admin-section admin-analytics-section admin-activity" data-activity="'+metric+'">'+
          '<h4 class="admin-section-heading">'+(metric==='yeahs'?'Yeahs':'Comments')+' <span class="admin-muted admin-section-summary admin-community-total"></span></h4>'+
          '<div class="admin-chart"><div class="admin-chart-options"><div class="admin-toggle admin-ranges" role="group" aria-label="Time frame">'+
          [['7d','1W'],['14d','2W'],['30d','30D'],['6m','6M'],['1y','1Y'],['all','All']].map(function(range) {
            return '<button type="button" data-range="'+range[0]+'">'+range[1]+'</button>';
          }).join('')+'</div></div><p class="admin-chart-readout" aria-live="polite"></p><div class="admin-activity-chart"><p class="admin-muted">Loading…</p></div></div>'+
          '<div class="admin-summary admin-activity-summary"></div></section>';
      }).join('')+
      '<section data-section="offline" class="admin-section admin-analytics-section admin-activity" data-activity="offline">' +
        '<h4 class="admin-section-heading">Offline Maps <span class="admin-muted admin-section-summary admin-offline-total"></span></h4>' +
        '<div class="admin-chart">' +
          '<div class="admin-chart-options">' +
            '<div class="admin-toggle admin-ranges" role="group" aria-label="Time frame">' +
              [['7d', '1W'], ['14d', '2W'], ['30d', '30D'], ['6m', '6M'], ['1y', '1Y'], ['all', 'All']].map(function(range) {
                return '<button type="button" data-range="' + range[0] + '">' + range[1] + '</button>';
              }).join('') +
            '</div>' +
          '</div>' +
          '<p class="admin-chart-readout" aria-live="polite"></p>' +
          '<div class="admin-activity-chart"><p class="admin-muted">Loading…</p></div>' +
        '</div>' +
        '<div class="admin-summary admin-activity-summary"></div>' +
        '<div class="admin-offline-games"></div>' +
      '</section>' +
      '</div>' +
      '<div class="admin-panel" id="admin_panel_users" role="tabpanel" aria-labelledby="admin_tab_users" data-admin-panel="users">' +
      '<section class="admin-section">' +
        '<form id="admin_search_form" class="admin-search" role="search">' +
          '<div class="form-group"><div class="input-group">' +
            '<span class="input-group-addon"><i class="fas fa-search" aria-hidden="true"></i></span>' +
            '<input id="admin_search" type="search" class="form-control" placeholder="Username, name, email or id" aria-label="Search users" ' +
              'autocapitalize="none" autocorrect="off" spellcheck="false" autocomplete="off" enterkeyhint="search" />' +
          '</div></div>' +
        '</form>' +
        // Role, status, where they signed up, and order: pills like the graphs',
        // folded away behind a Filters button that says what's applied.
        '<div class="admin-filter-box">' +
        '<button id="admin_filters_toggle" type="button" class="admin-filters-toggle" aria-expanded="false" aria-controls="admin_filters">' +
          '<i class="fas fa-sliders-h" aria-hidden="true"></i><span class="admin-filters-toggle-label">Filters</span>' +
          '<span class="admin-filters-summary"></span>' +
          '<i class="fas fa-chevron-down admin-chevron" aria-hidden="true"></i>' +
        '</button>' +
        '<div id="admin_filters" class="admin-filters" hidden>' +
          [['role', 'Role', [['', 'All'], ['admin', 'Admins'], ['moderator', 'Moderators'], ['contributor', 'Contributors'], ['user', 'Users']]],
           ['status', 'Status', [['', 'All'], ['active', 'Active'], ['disabled', 'Disabled'], ['banned', 'Banned'], ['deleted', 'Deleted']]],
           ['source', 'Signed Up From', [['', 'All'], ['bookmark', 'Bookmark'], ['complete', 'Complete'], ['account', 'Account'], ['editing_beta', 'Editing Beta'], ['unknown', 'Untracked']]],
           ['sort', 'Sort', [['newest', 'Newest'], ['oldest', 'Oldest'], ['seen', 'Last Seen'], ['name', 'Username']]]
          ].map(function(filter) {
            return '<div class="admin-filter">' +
              '<span class="admin-filter-label" id="admin_filter_' + filter[0] + '">' + filter[1] + '</span>' +
              '<div class="admin-chart-options"><div class="admin-toggle" role="group" aria-labelledby="admin_filter_' + filter[0] + '">' +
                filter[2].map(function(option) {
                  return '<button type="button" data-filter="' + filter[0] + '" data-value="' + option[0] + '">' + option[1] + '</button>';
                }).join('') +
              '</div></div>' +
            '</div>';
          }).join('') +
          '<button id="admin_filters_clear" type="button" class="admin-filters-clear" hidden>Clear Filters</button>' +
        '</div>' +
        '</div>' +
        '<p id="admin_results_count" class="admin-muted" role="status" aria-live="polite"></p>' +
        '<ul id="admin_results" class="admin-results"></ul>' +
        '<button id="admin_more" type="button" class="infoWindowIcn form-action-button" hidden>Load More</button>' +
      '</section>' +
      '</div>' +
    '</div>',
    'adminPage'
  );
  this._lockWhileOffline('#admin', {
    dim: '.admin-section',
    message: 'You\'re offline. Connect to the internet to use the admin tools.'
  });

  // What going back to this page restores.
  var state = this._adminState = saved || {
    graph: { metric: 'registrations', range: '30d' },
    signupRange: '30d',
    activity: { markers: { metric: 'completes', range: '30d' }, editing: { metric: 'edits', range: '30d' }, offline: { metric: 'downloads', range: '30d' } },
    query: '', users: [], total: null, offset: 0, scrollTop: 0,
    tab: 'analytics', tabScroll: {},
    filters: { role: '', status: '', source: '', sort: 'newest' }
  };
  state.filters = state.filters || { role: '', status: '', source: '', sort: 'newest' };
  state.tabScroll = state.tabScroll || {};

  // Each tab keeps its own place.
  var showTab = function(tab, restoreScroll) {
    var contents = _this.mapControl._contents;
    if(state.tab && state.tab !== tab) state.tabScroll[state.tab] = contents.scrollTop;
    state.tab = tab;
    $('#admin [data-admin-tab]').each(function() {
      var selected = this.getAttribute('data-admin-tab') === tab;
      this.setAttribute('aria-selected', String(selected));
      this.tabIndex = selected ? 0 : -1;
    });
    $('#admin [data-admin-panel]').each(function() {
      this.hidden = this.getAttribute('data-admin-panel') !== tab;
    });
    if(restoreScroll !== false) contents.scrollTop = state.tabScroll[tab] || 0;
    if(tab === 'reports' && _this._loadAdminReports) _this._loadAdminReports();
    if(tab === 'settings') _this._loadSiteSettings();
  };
  $('#admin [data-admin-tab]').on('click', function() {
    showTab(this.getAttribute('data-admin-tab'));
  }).on('keydown', function(e) {
    if(e.key !== 'ArrowLeft' && e.key !== 'ArrowRight') return;
    e.preventDefault();
    var tabs = siteSettings ? ['analytics', 'users', 'reports', 'settings'] : ['analytics', 'users', 'reports'];
    var next = tabs[(tabs.indexOf(state.tab) + (e.key === 'ArrowRight' ? 1 : tabs.length - 1)) % tabs.length];
    showTab(next);
    $('#admin [data-admin-tab="' + next + '"]').trigger('focus');
  });
  showTab(state.tab === 'settings' && !siteSettings ? 'analytics' : state.tab || 'analytics', false);
  // How many reports are waiting, on the Reports tab.
  if(state.tab !== 'reports') this._wikiGet('admin_reports', { status: 'open' }).done(function(data) {
    if(data.success && _this._setAdminReportCount) _this._setAdminReportCount(data.openCount);
  });


  var statsRequest = 0;
  var showStats = function(data) {
    var monthly = data.summary && data.summary.monthly ? data.summary.monthly.current : null;
    $('#admin_total').text(data.total.toLocaleString() + ' total' +
      (monthly !== null ? ' · ' + monthly.toLocaleString() + ' active this month' : ''));
    $('#admin_chart').empty().append(_this._adminChart(data.buckets, data.metric, $('#admin_chart_readout')));
    $('#admin_summary').empty().append(_this._adminSummary(data.summary));
  };
  var loadStats = function() {
    var requestId = ++statsRequest;
    $.getJSON('ajax.php?command=admin_get_stats', state.graph, function(data) {
      if(requestId !== statsRequest) return;
      if(!data.success) return $('#admin_chart').html('<p class="admin-muted"></p>').find('p').text(data.msg || 'Unable to load stats.');
      state.stats = data;
      showStats(data);
    }).fail(function() {
      if(requestId === statsRequest) $('#admin_chart').html('<p class="admin-muted">Unable to load stats. Try again.</p>');
    });
  };
  var showGraphOptions = function() {
    $('#admin_chart').closest('.admin-chart').find('.admin-chart-options button').each(function() {
      var button = $(this);
      var pressed = button.data('metric') ? button.data('metric') === state.graph.metric : button.data('range') === state.graph.range;
      button.attr('aria-pressed', String(pressed));
    });
  };
  $('#admin_chart').closest('.admin-chart').find('.admin-chart-options button').click(function() {
    var button = $(this);
    if(button.data('metric')) state.graph.metric = button.data('metric');
    if(button.data('range')) state.graph.range = button.data('range');
    showGraphOptions();
    loadStats();
  });
  showGraphOptions();
  // Going back: the last graph at once, so the page is its full height when
  // the scroll position returns, then fresh numbers.
  if(saved && saved.stats) showStats(saved.stats);
  loadStats();

  // Completes & Bookmarks and Offline Maps: a graph with the Accounts
  // graph's options, boxes beneath, and for offline maps their games.
  state.activity = state.activity || { markers: { metric: 'completes', range: '30d' }, editing: { metric: 'edits', range: '30d' }, offline: { metric: 'downloads', range: '30d' } };
  state.activity.editing = state.activity.editing || { metric: 'edits', range: '30d' };
  ['yeahs','comments'].forEach(function(metric) {state.activity[metric]=state.activity[metric] || {metric:metric,range:'30d'};});
  state.activity.embeds = state.activity.embeds || { metric: 'embed_copies', range: '30d' };
  state.activity.push = state.activity.push || { metric: 'push', range: '30d' };
  $('#admin .admin-activity').each(function() {
    var section = $(this);
    var key = section.attr('data-activity');
    var graph = state.activity[key];
    var request = 0;
    var show = function(data) {
      section.find('.admin-activity-chart').empty().append(_this._adminChart(data.buckets, data.metric, section.find('.admin-chart-readout')));
      section.find('.admin-activity-summary').empty().append(_this._adminActivitySummary(data));
      if(key === 'markers') {
        section.find('.admin-top-markers').empty().append(_this._adminTopMarkers(data, graph.range));
        // Completes have no all-time total (admin_get_activity.php).
        section.find('.admin-activity-total').text(data.summary.total
          ? data.summary.total.current.toLocaleString() + ' ' + (_this.ADMIN_CHART_NOUNS[data.metric] || ['saved'])[0]
          : '');
      }
      if(key === 'editing') {
        section.find('.admin-editing-total').text(data.summary.total
          ? data.summary.total.current.toLocaleString() + ' ' + (_this.ADMIN_CHART_NOUNS[data.metric] || ['edits'])[0]
          : '');
      }
      if(key==='yeahs' || key==='comments') {
        section.find('.admin-community-total').text(data.summary.total ? data.summary.total.current.toLocaleString()+' '+_this.ADMIN_CHART_NOUNS[data.metric][0] : '');
      }
      if(key === 'embeds' || key === 'push') {
        // All time, and how many people (sites, for embed views) that is.
        var total = data.summary.total ? data.summary.total.current : 0;
        section.find(key === 'embeds' ? '.admin-embeds-total' : '.admin-push-total').text(data.summary.total
          ? total.toLocaleString() + ' ' + _this.ADMIN_CHART_NOUNS[data.metric][0] +
            (data.people ? ' · ' + data.people.toLocaleString() + ' ' + (data.people !== 1 ? data.peopleNoun : data.peopleNoun === 'people' ? 'person' : data.peopleNoun.replace(/s$/, '')) : '')
          : '');
        if(key === 'embeds') section.find('.admin-embeds-detail').empty().append(_this._adminEmbedsDetail(data));
      }
      if(key === 'offline') {
        var offline = data.offline || {};
        section.find('.admin-offline-total').text(offline.people
          ? offline.people.toLocaleString() + (offline.people === 1 ? ' person' : ' people') + ' with maps saved'
          : 'No maps saved yet');
        section.find('.admin-offline-games').empty().append(_this._adminOfflineGames(data));
      }
    };
    var showOptions = function() {
      section.find('.admin-chart-options button').each(function() {
        var button = $(this);
        var pressed = button.data('metric') ? button.data('metric') === graph.metric : button.data('range') === graph.range;
        button.attr('aria-pressed', String(pressed));
      });
    };
    var load = function() {
      var requestId = ++request;
      $.getJSON('ajax.php?command=admin_get_activity', graph, function(data) {
        if(requestId !== request) return;
        if(!data.success) {
          section.find('.admin-activity-chart').html('<p class="admin-muted"></p>').find('p').text(data.msg || 'Unable to load stats.');
          section.find('.admin-activity-summary, .admin-offline-games, .admin-top-markers, .admin-embeds-detail').empty();
          return;
        }
        graph.data = data;
        show(data);
      }).fail(function() {
        if(requestId !== request) return;
        section.find('.admin-activity-chart').html('<p class="admin-muted">Unable to load stats. Try again.</p>');
      });
    };
    section.find('.admin-chart-options button').click(function() {
      var button = $(this);
      if(button.data('metric')) graph.metric = button.data('metric');
      if(button.data('range')) graph.range = button.data('range');
      showOptions();
      load();
    });
    showOptions();
    if(graph.data) show(graph.data);
    load();
  });

  var signupRequest = 0;
  var showSignups = function(data) {
    var rangeLabel = { '7d': '1W', '14d': '2W', '30d': '30D', '6m': '6M', '1y': '1Y', all: 'all time' }[data.range] || '';
    $('#admin_signup_total').text(data.total.toLocaleString() + (data.total === 1 ? ' sign-up' : ' sign-ups') +
      (rangeLabel ? ' · ' + rangeLabel : ''));
    $('#admin_signups').empty().append(_this._adminSignupSources(data));
  };
  var showSignupRange = function() {
    $('#admin .admin-signup-ranges button').each(function() {
      this.setAttribute('aria-pressed', String(this.getAttribute('data-signup-range') === state.signupRange));
    });
  };
  var loadSignups = function() {
    var requestId = ++signupRequest;
    $.getJSON('ajax.php?command=admin_get_signups', { range: state.signupRange }, function(data) {
      if(requestId !== signupRequest) return;
      if(!data.success) return $('#admin_signups').html('<p class="admin-muted"></p>').find('p').text(data.msg || 'Unable to load sign-ups.');
      state.signups = data;
      showSignups(data);
    }).fail(function() {
      if(requestId !== signupRequest) return;
      $('#admin_signups').html('<p class="admin-muted">Unable to load stats. Try again.</p>');
    });
  };
  $('#admin .admin-signup-ranges button').click(function() {
    state.signupRange = this.getAttribute('data-signup-range');
    showSignupRange();
    loadSignups();
  });
  showSignupRange();
  if(saved && saved.signups) showSignups(saved.signups);
  loadSignups();

  var request = 0;
  var showResults = function() {
    var list = $('#admin_results').empty();
    state.users.forEach(function(account) { list.append(_this._adminUserRow(account)); });
    if(state.total !== null) {
      $('#admin_results_count').text(state.total.toLocaleString() + (state.total === 1 ? ' user' : ' users') +
        (state.filters && (state.filters.role || state.filters.status || state.filters.source) ? ' matching these filters' : ''));
    }
    $('#admin_more').prop('hidden', state.total === null || state.offset >= state.total);
  };
  var search = function(append) {
    var requestId = ++request;
    if(!append) state.offset = 0;
    $.getJSON('ajax.php?command=admin_search_users', Object.assign({ q: state.query, offset: state.offset }, state.filters), function(data) {
      if(requestId !== request) return;
      if(!data.success) return $('#admin_results_count').text(data.msg || 'Unable to load users.');
      state.users = append ? state.users.concat(data.users) : data.users;
      state.total = data.total;
      state.offset = data.offset + data.users.length;
      showResults();
    });
  };
  var searchTimer = null;
  $('#admin_search').val(state.query).on('input', function() {
    state.query = this.value.trim();
    window.clearTimeout(searchTimer);
    searchTimer = window.setTimeout(function() { search(false); }, 250);
  });
  $('#admin_search_form').on('submit', function(e) {
    e.preventDefault();
    // Search now, and put the phone keyboard away to show the results.
    window.clearTimeout(searchTimer);
    search(false);
    $('#admin_search').blur();
  });
  $('#admin_more').click(function() { search(true); });

  var filtered = function() {
    return !!(state.filters.role || state.filters.status || state.filters.source);
  };
  var showFilters = function() {
    var applied = [];
    $('#admin .admin-filters [data-filter]').each(function() {
      var name = this.getAttribute('data-filter');
      var pressed = state.filters[name] === this.getAttribute('data-value');
      this.setAttribute('aria-pressed', String(pressed));
      if(pressed && this.getAttribute('data-value') !== '' && !(name === 'sort' && this.getAttribute('data-value') === 'newest')) {
        applied.push(name === 'sort' ? 'by ' + this.textContent : this.textContent);
      }
    });
    $('#admin_filters_clear').prop('hidden', !applied.length);
    $('#admin_filters_toggle').toggleClass('active', !!applied.length)
      .find('.admin-filters-summary').text(applied.join(' · '));
    $('#admin_filters_toggle').attr('aria-expanded', String(!!state.filtersOpen))
      .closest('.admin-filter-box').toggleClass('open', !!state.filtersOpen);
    $('#admin_filters').prop('hidden', !state.filtersOpen);
  };
  $('#admin_filters_toggle').click(function() {
    state.filtersOpen = !state.filtersOpen;
    showFilters();
  });
  $('#admin .admin-filters [data-filter]').click(function() {
    state.filters[this.getAttribute('data-filter')] = this.getAttribute('data-value');
    showFilters();
    search(false);
  });
  $('#admin_filters_clear').click(function() {
    state.filters = { role: '', status: '', source: '', sort: 'newest' };
    showFilters();
    search(false);
  });
  showFilters();

  if(saved && saved.users.length) {
    showResults();
    this.mapControl._contents.scrollTop = saved.scrollTop;
  } else {
    search(false);
  }
};

// How long ago, from the server's count of seconds: "just now", "12 min
// ago", "5 hr ago" within a day, then the date and time in the viewer's time
// zone. opts.dateOnly leaves out the time for older dates.
ZMap.prototype._adminTime = function(ago, opts) {
  if(ago === null || ago === undefined || ago < 0) return null;
  if(ago < 60) return 'just now';
  if(ago < 3600) return Math.floor(ago / 60) + ' min ago';
  if(ago < 86400) {
    var hours = Math.floor(ago / 3600);
    return hours + (hours === 1 ? ' hour ago' : ' hours ago');
  }
  var date = new Date(Date.now() - ago * 1000);
  var format = { month: 'short', day: 'numeric', year: 'numeric' };
  if(!(opts && opts.dateOnly)) {
    format.hour = 'numeric';
    format.minute = '2-digit';
  }
  return date.toLocaleString(undefined, format);
};

// The graph's buckets as an inline SVG bar chart. Hovering, tapping or
// dragging across it shows a bar's count in readout; otherwise it shows the
// latest bar.
ZMap.prototype.ADMIN_CHART_NOUNS = {
  yeahs: ['yeahs','Yeahs'],
  comments: ['comments','Comments'],
  registrations: ['new accounts', 'New accounts'],
  active: ['active users', 'Active users'],
  completes: ['completes', 'Completed markers'],
  bookmarks: ['bookmarks', 'Bookmarks'],
  downloads: ['downloads', 'Offline map downloads'],
  edits: ['edits', 'Community edits'],
  beta: ['beta testers', 'Editing beta sign-ups'],
  embed_copies: ['codes copied', 'Embed codes copied'],
  embed_views: ['views', 'Embed views'],
  push: ['devices', 'Push notification sign-ups']
};

ZMap.prototype._adminChart = function(buckets, metric, readout) {
  var nouns = this.ADMIN_CHART_NOUNS[metric] || this.ADMIN_CHART_NOUNS.registrations;
  var noun = nouns[0];
  var width = 320, height = 120, top = 8, bottom = 18;
  var max = Math.max.apply(null, buckets.map(function(b) { return b.count; })) || 1;
  var step = width / buckets.length, gap = Math.min(2, step * .2);
  var svg = '<svg viewBox="0 0 ' + width + ' ' + height + '" role="img" aria-label="' +
    nouns[1] + ' over time">';
  buckets.forEach(function(b, i) {
    var barHeight = b.count ? Math.max(1, (height - top - bottom) * b.count / max) : 0;
    // A full-height strip behind each bar, so short and empty bars are as easy
    // to tap as tall ones.
    svg += '<rect class="admin-chart-hit" x="' + (i * step).toFixed(2) + '" y="0" width="' + step.toFixed(2) + '" height="' + (height - bottom) + '"></rect>';
    svg += '<rect class="admin-chart-bar" x="' + (i * step).toFixed(2) + '" y="' + (height - bottom - barHeight).toFixed(2) +
      '" width="' + Math.max(.5, step - gap).toFixed(2) + '" height="' + barHeight.toFixed(2) + '" rx="1"></rect>';
  });
  // Up to five evenly spaced labels, always including the first and last.
  var labels = Math.min(5, buckets.length);
  for(var n = 0; n < labels; n++) {
    var i = labels === 1 ? 0 : Math.round(n * (buckets.length - 1) / (labels - 1));
    var anchor = n === 0 ? 'start' : n === labels - 1 ? 'end' : 'middle';
    var x = n === 0 ? 0 : n === labels - 1 ? width : i * step + step / 2;
    svg += '<text x="' + x.toFixed(2) + '" y="' + (height - 4) + '" text-anchor="' + anchor + '">' + buckets[i].label + '</text>';
  }
  svg += '<text x="0" y="' + (top + 2) + '" class="admin-chart-max">' + max.toLocaleString() + '</text>';
  var chart = $(svg + '</svg>');
  var bars = chart.find('.admin-chart-bar');

  var show = function(index, chosen) {
    var bucket = buckets[index];
    if(!bucket) return;
    bars.removeClass('active');
    if(chosen) bars.eq(index).addClass('active');
    readout.text(bucket.label + ': ' + bucket.count.toLocaleString() + ' ' + noun);
  };
  var indexAt = function(event) {
    var rect = chart[0].getBoundingClientRect();
    if(!rect.width) return -1;
    var ratio = (event.clientX - rect.left) / rect.width;
    return Math.max(0, Math.min(buckets.length - 1, Math.floor(ratio * buckets.length)));
  };
  var latest = function() { show(buckets.length - 1, false); };
  var scrubbing = false;
  chart.on('pointerdown', function(e) {
    scrubbing = true;
    // Keep following a finger that slides off the chart while scrubbing.
    try { this.setPointerCapture(e.originalEvent.pointerId); } catch(error) {}
    show(indexAt(e), true);
  }).on('pointermove', function(e) {
    // Mouse hover, or a finger dragging across the bars.
    if(e.pointerType === 'mouse' || e.originalEvent.pointerType === 'mouse' || scrubbing) show(indexAt(e), true);
  }).on('pointerup pointercancel', function() {
    // A tapped bar stays showing until another is chosen.
    scrubbing = false;
  }).on('pointerleave', function(e) {
    if(e.originalEvent.pointerType === 'mouse') latest();
  });
  latest();
  return chart;
};

// Daily, weekly and monthly active users, each with its change.
ZMap.prototype._adminSummary = function(summary) {
  var boxes = $();
  [['daily', 'Daily Active', 'yesterday vs. the day before'],
   ['weekly', 'Weekly Active', 'last 7 days vs. the 7 before'],
   ['monthly', 'Monthly Active', 'last 30 days vs. the 30 before']].forEach(function(item) {
    var stat = summary[item[0]], change = stat.current - stat.previous;
    var percent = stat.previous ? Math.round(change / stat.previous * 100) : null;
    var box = $('<div class="admin-stat"><span class="admin-stat-label"></span><span class="admin-stat-value"></span>' +
      '<span class="admin-stat-change"></span></div>');
    box.attr('title', item[2]);
    box.find('.admin-stat-label').text(item[1]);
    box.find('.admin-stat-value').text(stat.current.toLocaleString());
    box.find('.admin-stat-change')
      .addClass(change > 0 ? 'up' : change < 0 ? 'down' : '')
      .text((change > 0 ? '▲ ' : change < 0 ? '▼ ' : '') + Math.abs(change).toLocaleString() +
        (percent !== null ? ' (' + Math.abs(percent) + '%)' : ''));
    boxes = boxes.add(box);
  });
  return boxes;
};

// One card per place registration is offered: its sign-ups and share of
// them, then the prompt's funnel (shown, tapped Register, signed up) and the
// other ways out.
ZMap.prototype._adminSignupSources = function(data) {
  var self = this;
  var nodes = $();
  var percent = function(part, whole) { return whole ? Math.round(part / whole * 100) + '%' : '–'; };
  var number = function(n) { return Number(n || 0).toLocaleString(); };
  if(!data.available) {
    return $('<p class="admin-muted">Run the track_signups migration to see where sign-ups come from.</p>');
  }
  var sources = data.sources.slice().sort(function(a, b) { return b.registrations - a.registrations; });
  var tracked = sources.reduce(function(sum, s) { return sum + s.registrations; }, 0);
  sources.forEach(function(source) {
    var e = source.events;
    var card = $('<div class="admin-signup"></div>');
    var head = $('<div class="admin-signup-head"><span class="admin-signup-name"></span>' +
      '<span class="admin-signup-count"></span></div>');
    head.find('.admin-signup-name').text(source.label);
    head.find('.admin-signup-count').text(number(source.registrations) + ' · ' + percent(source.registrations, tracked));
    card.append(head);
    card.append($('<div class="admin-signup-bar"><span></span></div>').find('span')
      .css('width', (tracked ? source.registrations / tracked * 100 : 0) + '%').end());
    if(source.feature === 'account') {
      card.append('<p class="admin-muted">Registered from the Account button, without a prompt.</p>');
    } else {
      var funnel = $('<div class="admin-funnel"></div>');
      [['Prompt shown', e.prompt_shown, null],
       ['Tapped Register', e.prompt_register, e.prompt_shown],
       ['Signed up', source.registrations, e.prompt_shown]].forEach(function(step) {
        var item = $('<div class="admin-funnel-step"><span class="admin-funnel-value"></span>' +
          '<span class="admin-funnel-label"></span></div>');
        item.find('.admin-funnel-value').text(number(step[1]));
        item.find('.admin-funnel-label').text(step[0] + (step[2] !== null ? ' · ' + percent(step[1], step[2]) : ''));
        funnel.append(item);
      });
      card.append(funnel);
      card.append($('<p class="admin-muted admin-signup-outs"></p>').text(
        'Maybe Later ' + number(e.prompt_later) + ' · Signed in instead ' + number(e.signed_in)
      ));
      // Complete's later reminders, and their A/B test.
      if(source.feature === 'complete' && data.experiment && data.experiment.length) {
        card.append(self._adminReminderTest(data.experiment));
      }
      if(source.feature === 'complete') {
        card.append($('<p class="admin-muted admin-signup-outs"></p>').text(
          'Reminders: shown ' + number(e.reminder_shown) +
          ' · Register ' + number(e.reminder_register) + ' (' + percent(e.reminder_register, e.reminder_shown) + ')' +
          ' · Maybe Later ' + number(e.reminder_dismiss)
        ));
      }
    }
    nodes = nodes.add(card);
  });
  var notes = [];
  if(data.untracked) notes.push(number(data.untracked) + ' sign-up' + (data.untracked === 1 ? '' : 's') + ' in this range came before sources were recorded.');
  if(data.trackingSince) {
    notes.push('Prompt counts start ' + new Date(data.trackingSince.replace(' ', 'T'))
      .toLocaleDateString(undefined, { month: 'short', day: 'numeric', year: 'numeric' }) + '.');
  }
  if(notes.length) nodes = nodes.add($('<p class="admin-muted admin-signup-note"></p>').text(notes.join(' ')));
  return nodes;
};

// Total, then the last 30 days, 7 days and 24 hours against the period
// before each, like the Active boxes.
ZMap.prototype._adminActivitySummary = function(data) {
  var boxes = $();
  var noun = (this.ADMIN_CHART_NOUNS[data.metric] || ['items'])[0];
  [['total', 'Total', 'all time'],
   ['month', '30 Days', 'last 30 days vs. the 30 before'],
   ['week', '1 Week', 'last 7 days vs. the 7 before'],
   ['day', '1 Day', 'last 24 hours vs. the 24 before']].forEach(function(item) {
    var stat = data.summary[item[0]];
    if(!stat) return;
    var box = $('<div class="admin-stat"><span class="admin-stat-label"></span><span class="admin-stat-value"></span>' +
      '<span class="admin-stat-change"></span></div>');
    box.attr('title', item[2]);
    box.find('.admin-stat-label').text(item[1]);
    box.find('.admin-stat-value').text(stat.current.toLocaleString());
    if(stat.previous === null) {
      // (People, or sites for embed views; nobody, for anonymous counts.)
      var noun = data.peopleNoun || 'people';
      box.find('.admin-stat-change').text(data.people === null || data.people === undefined ? 'all time' :
        data.people.toLocaleString() + ' ' + (data.people === 1 ? (noun === 'people' ? 'person' : noun.replace(/s$/, '')) : noun));
    } else {
      var change = stat.current - stat.previous;
      var percent = stat.previous ? Math.round(change / stat.previous * 100) : null;
      box.find('.admin-stat-change')
        .addClass(change > 0 ? 'up' : change < 0 ? 'down' : '')
        .text((change > 0 ? '▲ ' : change < 0 ? '▼ ' : '') + Math.abs(change).toLocaleString() +
          (percent !== null ? ' (' + Math.abs(percent) + '%)' : ''));
    }
    box.attr('aria-label', item[1] + ': ' + stat.current.toLocaleString() + ' ' + noun);
    boxes = boxes.add(box);
  });
  return boxes;
};

// Most completed or most bookmarked markers over the graph's time frame,
// by how many people saved each. Tapping one opens it (in its own game).
ZMap.prototype._adminTopMarkers = function(data, range) {
  var _this = this;
  var completes = data.metric === 'completes';
  var rangeNames = { '7d': 'this week', '14d': 'the last 2 weeks', '30d': 'the last 30 days', '6m': 'the last 6 months', '1y': 'the last year', all: 'all time' };
  var nodes = $('<div class="admin-offline"></div>');
  nodes.append($('<h4 class="admin-offline-heading"></h4>').text(
    (completes ? 'Most Completed' : 'Most Bookmarked') + ' · ' + (rangeNames[range] || '')
  ));
  var top = data.top || [];
  if(!top.length) {
    nodes.append($('<p class="admin-muted centered-empty-state"></p>').text(completes ? 'No markers completed in this time frame.' : 'No markers bookmarked in this time frame.'));
  } else {
    var max = top[0].people || 1;
    var list = $('<ol class="admin-offline-list admin-top-list"></ol>');
    top.forEach(function(marker, index) {
      var row = $('<li class="admin-offline-game admin-top-marker" role="button" tabindex="0">' +
        '<div class="admin-signup-head"><span class="admin-signup-name"><span class="admin-top-rank"></span><span class="admin-top-title"></span></span>' +
        '<span class="admin-signup-count"></span></div>' +
        '<div class="admin-signup-bar"><span></span></div>' +
        '<p class="admin-muted admin-offline-detail"></p>' +
      '</li>');
      row.find('.admin-top-rank').text((index + 1) + '. ');
      row.find('.admin-top-title').text(marker.title || ('Marker #' + marker.markerId));
      row.find('.admin-signup-count').text(marker.people.toLocaleString() + (marker.people === 1 ? ' person' : ' people'));
      row.find('.admin-signup-bar span').css('width', (marker.people / max * 100) + '%');
      row.find('.admin-offline-detail').text(
        [marker.gameName, marker.category, marker.visible ? null : 'Deleted', '#' + marker.markerId].filter(Boolean).join(' · ')
      );
      row.on('click keydown', function(e) {
        if(e.type === 'keydown' && e.key !== 'Enter' && e.key !== ' ') return;
        e.preventDefault();
        if(_this.cachedMarkersById[marker.markerId]) {
          _this.navigateToMarker(marker.markerId);
        } else if(marker.game) {
          var url = new URL(window.location.href.split('?')[0]);
          url.searchParams.set('game', marker.game);
          url.searchParams.set('marker', marker.markerId);
          url.searchParams.set('zoom',6);
          _this.openGameURL(url.href);
        }
      });
      list.append(row);
    });
    nodes.append(list);
  }
  if(data.droppedPins) {
    nodes.append($('<p class="admin-muted admin-signup-note"></p>').text(
      'Plus ' + data.droppedPins.toLocaleString() + ' bookmarked dropped pin' + (data.droppedPins === 1 ? '' : 's') + ' in this time frame.'
    ));
  }
  return nodes;
};

// Games by how many people have them saved now, with downloads all time and
// in the last 30 days.
ZMap.prototype._adminOfflineGames = function(data) {
  var games = data.games || [];
  var offline = data.offline || {};
  var size = function(bytes) {
    if(bytes >= 1e9) return (bytes / 1e9).toFixed(1) + ' GB';
    if(bytes >= 1e6) return Math.round(bytes / 1e6) + ' MB';
    return bytes ? Math.max(1, Math.round(bytes / 1e3)) + ' KB' : '0 MB';
  };
  var nodes = $('<div class="admin-offline"></div>');
  nodes.append('<h4 class="admin-offline-heading">Most Saved Games</h4>');
  if(!games.length) {
    nodes.append('<p class="admin-muted centered-empty-state">No offline maps downloaded yet.</p>');
    return nodes;
  }
  var max = Math.max.apply(null, games.map(function(g) { return g.people; })) || 1;
  var list = $('<ol class="admin-offline-list"></ol>');
  games.forEach(function(game) {
    var row = $('<li class="admin-offline-game">' +
      '<div class="admin-signup-head"><span class="admin-signup-name"></span><span class="admin-signup-count"></span></div>' +
      '<div class="admin-signup-bar"><span></span></div>' +
      '<p class="admin-muted admin-offline-detail"></p>' +
    '</li>');
    row.find('.admin-signup-name').text(game.name);
    row.find('.admin-signup-count').text(game.people.toLocaleString() + (game.people === 1 ? ' person' : ' people'));
    row.find('.admin-signup-bar span').css('width', (game.people / max * 100) + '%');
    row.find('.admin-offline-detail').text(
      game.downloads.toLocaleString() + ' download' + (game.downloads === 1 ? '' : 's') +
      ' · ' + game.recent.toLocaleString() + ' in 30 days' +
      (game.people ? ' · ' + size(game.bytes) + ' saved' : '') +
      (game.failed ? ' · ' + game.failed.toLocaleString() + ' failed' : '') +
      (game.removed ? ' · ' + game.removed.toLocaleString() + ' removed' : '')
    );
    list.append(row);
  });
  nodes.append(list);
  var finished = offline.started ? Math.round(data.summary.total.current / offline.started * 100) : null;
  nodes.append($('<p class="admin-muted admin-signup-note"></p>').text(
    offline.packs.toLocaleString() + ' saved game' + (offline.packs === 1 ? '' : 's') + ' on devices, ' + size(offline.bytes) + ' in all.' +
    (finished !== null ? ' ' + finished + '% of downloads started finish.' : '') +
    ' Counts start when downloads began being recorded; browsers clearing storage on their own isn\'t seen.'
  ));
  return nodes;
};

// The reminder-timing A/B test: each group's devices, reminders, sign-ups
// and conversion side by side, and whether the difference is likely real
// (a two-proportion z-test at 95%).
ZMap.prototype._adminReminderTest = function(groups) {
  var number = function(n) { return Number(n || 0).toLocaleString(); };
  var rate = function(g) { return g.devices ? g.registrations / g.devices : 0; };
  var percent = function(r) { return (Math.round(r * 1000) / 10) + '%'; };
  var box = $('<div class="admin-test"></div>');
  box.append('<p class="admin-test-title">Reminder Timing Test</p>');
  var table = $('<table class="admin-test-table"><thead><tr><th></th></tr></thead><tbody></tbody></table>');
  groups.forEach(function(g) { table.find('thead tr').append($('<th></th>').text(g.label)); });
  [['Devices', function(g) { return number(g.devices); }],
   ['Reminders shown', function(g) { return number(g.reminders); }],
   ['Per device', function(g) { return g.devices ? (Math.round(g.reminders / g.devices * 10) / 10).toLocaleString() : '–'; }],
   ['Tapped Register', function(g) { return number(g.register); }],
   ['Maybe Later', function(g) { return number(g.later); }],
   ['Signed up', function(g) { return number(g.registrations); }],
   ['Conversion', function(g) { return g.devices ? percent(rate(g)) : '–'; }]
  ].forEach(function(row) {
    var tr = $('<tr></tr>').append($('<th scope="row"></th>').text(row[0]));
    groups.forEach(function(g) { tr.append($('<td></td>').text(row[1](g))); });
    table.find('tbody').append(tr);
  });
  box.append(table);
  var a = groups[0], b = groups[1], verdict;
  var smallest = Math.min(a.devices, b.devices);
  if(smallest < 100) {
    verdict = 'Too early to tell: each group needs at least 100 devices (the smaller has ' + number(smallest) + ').';
  } else {
    var pooled = (a.registrations + b.registrations) / (a.devices + b.devices);
    var se = Math.sqrt(pooled * (1 - pooled) * (1 / a.devices + 1 / b.devices));
    var z = se ? (rate(a) - rate(b)) / se : 0;
    if(Math.abs(z) < 1.96) {
      verdict = 'No clear winner yet: the difference could still be chance.';
    } else {
      var winner = z > 0 ? a : b, loser = z > 0 ? b : a;
      var lift = rate(loser) ? Math.round((rate(winner) / rate(loser) - 1) * 100) : null;
      verdict = winner.label + ' converts better' + (lift !== null ? ', by about ' + lift + '%' : '') + '. This is unlikely to be chance (95% confidence).';
    }
  }
  box.append($('<p class="admin-muted admin-test-verdict"></p>').text(verdict));
  return box;
};

// Under the Embeds graph: what the codes copied over its time frame were
// for, or the sites that showed embeds most (ajax/admin_get_activity.php).
ZMap.prototype._adminEmbedsDetail = function(data) {
  var embeds = data.embeds || {};
  if(embeds.byTarget) {
    var labels = { marker: ['marker', 'markers'], pin: ['dropped pin', 'dropped pins'], path: ['path', 'paths'], map: ['map', 'maps'] };
    var parts = Object.keys(embeds.byTarget).filter(function(k) { return embeds.byTarget[k]; })
      .map(function(k) { var n = embeds.byTarget[k]; return n.toLocaleString() + ' ' + labels[k][n === 1 ? 0 : 1]; });
    return parts.length ? $('<p class="admin-muted admin-embed-split"></p>').text('For ' + parts.join(' · ')) : $();
  }
  if(!embeds.topSites || !embeds.topSites.length) return $();
  var list = $('<ol class="admin-embed-sites"></ol>');
  embeds.topSites.forEach(function(site) {
    var row = $('<li><span class="admin-embed-site"></span><span class="admin-muted"></span></li>');
    row.find('.admin-embed-site').text(site.host);
    row.find('.admin-muted').text(site.views.toLocaleString() + (site.views === 1 ? ' view' : ' views'));
    list.append(row);
  });
  return list;
};

ZMap.prototype._adminRoleLabel = function(level) {
  var role = this.adminRoles.find(function(r) { return r.level == level; });
  return role ? role.label : 'Level ' + level;
};

// Deleted, Banned or Disabled, or null for an account in use.
ZMap.prototype._adminStatus = function(account) {
  if(account.deleted) return 'Deleted';
  if(account.banned) return 'Banned';
  if(account.disabled) return 'Disabled';
  return null;
};

ZMap.prototype._adminUserRow = function(account) {
  var _this = this;
  var row = $('<li><button type="button" class="admin-user">' +
    '<span class="admin-user-name"></span><span class="admin-user-role"></span>' +
    '<span class="admin-user-detail admin-muted"></span>' +
    '<span class="admin-user-times admin-muted"></span>' +
  '</button></li>');
  var status = this._adminStatus(account);
  row.find('.admin-user-name').text(account.deleted ? 'Deleted account' : displayUserName(account.username));
  row.find('.admin-user-role')
    .text(status || this._adminRoleLabel(account.level))
    .toggleClass('admin-badge-warning', !!status)
    .toggleClass('admin-badge-admin', !status && account.level >= 10);
  row.find('.admin-user-detail').text('#' + account.id + (account.email && !account.deleted ? ' · ' + account.email : ''));
  var joined = this._adminTime(account.createdAgo);
  var seen = account.deleted ? null : this._adminTime(account.lastSeenAgo);
  row.find('.admin-user-times').text(
    (joined ? 'Joined ' + joined : '') + (seen ? (joined ? ' · ' : '') + 'Seen ' + seen : '')
  );
  row.find('button').click(function() {
    _this._adminState.scrollTop = _this.mapControl._contents.scrollTop;
    _this._createAdminUserPage(account);
  });
  return row;
};

// One account: when it joined and was last seen, how much it uses the site,
// an editor, disabling and banning, and the changes admins have made. Deleted accounts
// have been wiped, so they only show what's left.
ZMap.prototype._createAdminUserPage = function(account) {
  var _this = this;
  this.mapControl.setContent(
    '<div id="admin_user">' +
      '<h3 class="text-center"></h3>' +
      '<p class="admin-user-status-badge" hidden></p>' +
      '<section class="admin-section admin-user-overview">' +
        '<dl class="admin-facts"></dl>' +
        '<div class="admin-summary admin-user-stats"></div>' +
      '</section>' +
      '<form id="admin_user_form" class="leaflet-control-layers-list">' +
        '<label for="admin_user_username">Username</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-user" aria-hidden="true"></i></span>' +
          '<input id="admin_user_username" name="username" class="form-control" required ' +
          'autocapitalize="none" autocorrect="off" spellcheck="false" autocomplete="off" /></div></div>' +
        '<label for="admin_user_name">Full Name</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-id-card" aria-hidden="true"></i></span>' +
          '<input id="admin_user_name" name="name" class="form-control" required ' +
          'autocapitalize="words" autocorrect="off" spellcheck="false" autocomplete="off" /></div></div>' +
        '<label for="admin_user_email">Email</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-envelope" aria-hidden="true"></i></span>' +
          '<input id="admin_user_email" name="email" type="email" inputmode="email" class="form-control" required ' +
          'autocapitalize="none" autocorrect="off" spellcheck="false" autocomplete="off" /></div></div>' +
        '<label for="admin_user_level">Role</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-user-shield" aria-hidden="true"></i></span>' +
          '<select id="admin_user_level" name="level" class="form-control"></select>' +
        '</div></div>' +
        '<label for="admin_user_password">New Password</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-lock" aria-hidden="true"></i></span>' +
          '<input id="admin_user_password" name="password" type="password" class="form-control" placeholder="Leave blank to keep the current password" autocomplete="new-password" />' +
        '</div></div>' +
        '<button type="submit" class="infoWindowIcn form-action-button">Save Changes</button>' +
        '<p id="admin_user_status" class="admin-user-status" role="status" aria-live="polite"></p>' +
      '</form>' +
      '<section class="admin-section admin-account-actions">' +
        '<h4>Account Access</h4>' +
        '<p class="admin-muted admin-access-note"></p>' +
        '<p id="admin_access_status" class="admin-user-status" role="status" aria-live="polite"></p>' +
        '<button id="admin_access_btn" type="button" class="infoWindowIcn form-action-button"></button>' +
        // Banning goes further than disabling: it needs a reason, and blocks
        // the email from signing up again.
        '<div class="admin-ban">' +
          '<p class="admin-muted admin-ban-note"></p>' +
          '<button id="admin_ban_btn" type="button" class="infoWindowIcn form-action-button"></button>' +
          '<form id="admin_ban_form" class="admin-ban-form" hidden>' +
            '<label for="admin_ban_reason">Reason</label>' +
            '<div class="form-group"><div class="input-group">' +
              '<span class="input-group-addon"><i class="fas fa-comment-alt" aria-hidden="true"></i></span>' +
              '<textarea id="admin_ban_reason" class="form-control" rows="3" maxlength="500" required ' +
                'placeholder="Why they\'re banned. Admins see this; they don\'t."></textarea>' +
            '</div></div>' +
            '<label class="admin-check" hidden><input id="admin_ban_hide" type="checkbox" /><span></span></label>' +
            '<p id="admin_ban_status" class="admin-user-status" role="status" aria-live="polite"></p>' +
            '<div class="admin-ban-buttons">' +
              '<button id="admin_ban_cancel" type="button" class="infoWindowIcn form-action-button">Cancel</button>' +
              '<button type="submit" class="infoWindowIcn form-action-button bad">Ban Account</button>' +
            '</div>' +
          '</form>' +
        '</div>' +
      '</section>' +
      '<section class="admin-section">' +
        '<h4>Change Log</h4>' +
        '<ul id="admin_log" class="admin-log"><li class="admin-muted">Loading…</li></ul>' +
      '</section>' +
    '</div>',
    'adminUserPage'
  );
  this._lockWhileOffline('#admin_user', {
    dim: '#admin_user_form, .admin-account-actions',
    message: 'You\'re offline. Connect to the internet to make changes to accounts.'
  });

  var me = this.getUser();
  var isSelf = me && String(me.id) === String(account.id);
  var levelSelect = $('#admin_user_level');
  // Staff give only roles below their own, and change only the roles of
  // accounts below theirs (ajax/admin_update_user.php); Super Admin shows
  // only for one already (it's given at the database).
  var myLevel = me ? Number(me.level) : 0, theirs = Number(account.level);
  this.adminRoles.forEach(function(role) {
    if(role.level >= _this.SUPER_ADMIN_LEVEL && theirs !== role.level) return;
    levelSelect.append($('<option></option>').val(role.level).text(role.label)
      .prop('disabled', role.level !== theirs && role.level >= _this.WIKI_ADMIN_LEVEL && role.level >= myLevel));
  });
  if(!isSelf && theirs >= this.WIKI_ADMIN_LEVEL && theirs >= myLevel) levelSelect.prop('disabled', true).attr('title', 'Only a higher role can change this one.');
  if(!this.adminRoles.some(function(r) { return r.level == account.level; })) {
    levelSelect.prepend($('<option></option>').val(account.level).text('Level ' + account.level));
  }

  var stats = null, log = [], logAvailable = true;
  var render = function() {
    var status = _this._adminStatus(account);
    $('#admin_user h3').text(account.deleted ? 'Deleted account' : displayUserName(account.username));
    $('#admin_user .admin-user-status-badge').prop('hidden', !status).text(status || '');

    var facts = $('#admin_user .admin-facts').empty();
    var fact = function(label, value) {
      if(!value) return;
      facts.append($('<dt></dt>').text(label), $('<dd></dd>').text(value));
    };
    // Exact times here; "time ago" alongside within the last day.
    var when = function(ago) {
      var text = _this._adminTime(ago);
      if(ago === null || ago === undefined) return null;
      if(ago >= 86400) return text;
      return text + ' (' + new Date(Date.now() - ago * 1000).toLocaleString(undefined, { hour: 'numeric', minute: '2-digit' }) + ')';
    };
    fact('Account', '#' + account.id + ' · ' + _this._adminRoleLabel(account.level));
    fact('Joined', when(account.createdAgo));
    if(!account.deleted) fact('Last seen', when(account.lastSeenAgo));
    if(account.deleted) fact('Deleted', when(account.deletedAgo) || account.deleted.slice(0, 10));
    if(account.banned) fact('Banned', when(account.bannedAgo) || 'Yes');
    if(account.banned && account.banReason) fact('Reason', account.banReason);
    if(account.disabled) fact('Disabled', when(account.disabledAgo) || 'Yes');

    var statBoxes = $('#admin_user .admin-user-stats').empty();
    if(stats) {
      [['Active Days', stats.activeDays30, 'Days used in the last 30'],
       ['Completed', stats.completedMarkers, 'Markers marked complete'],
       ['Bookmarks', stats.bookmarks, 'Markers bookmarked']].forEach(function(item) {
        if(item[1] === null || item[1] === undefined) return;
        var box = $('<div class="admin-stat"><span class="admin-stat-label"></span><span class="admin-stat-value"></span></div>');
        box.attr('title', item[2]);
        box.find('.admin-stat-label').text(item[0]);
        box.find('.admin-stat-value').text(item[1].toLocaleString());
        statBoxes.append(box);
      });
    }

    // A deleted account's details are gone, so there's nothing to edit.
    $('#admin_user_form').prop('hidden', !!account.deleted);
    $('#admin_user .admin-account-actions').prop('hidden', !!account.deleted);
    if(!account.deleted) {
      $('#admin_user_username').val(account.username);
      $('#admin_user_name').val(account.name || '');
      $('#admin_user_email').val(account.email || '');
      levelSelect.val(String(account.level));
      $('#admin_user .admin-access-note').text(account.disabled
        ? 'This account can\'t sign in. Enabling it lets them sign in again with their current password.'
        : isSelf
          ? 'You can\'t disable your own account.'
          : 'Disabling signs them out everywhere and stops them signing in. Nothing is deleted.');
      $('#admin_access_btn')
        .text(account.disabled ? 'Enable Account' : 'Disable Account')
        .toggleClass('bad', !account.disabled)
        .prop('disabled', !account.disabled && isSelf);
      // A ban already stops them signing in, so it's lifted first.
      $('#admin_user .admin-access-note, #admin_access_btn').prop('hidden', !!account.banned);
      $('#admin_user .admin-ban-note').text(account.banned
        ? 'They can\'t sign in, and their email can\'t be used to sign up again. Unbanning lifts both.'
        : 'Banning also stops their email being used to sign up again, and needs a reason.');
      $('#admin_ban_btn')
        .text(account.banned ? 'Unban Account' : 'Ban Account…')
        .toggleClass('bad', !account.banned)
        .prop('hidden', !account.banned && (isSelf || !$('#admin_ban_form').prop('hidden')));
      $('#admin_user .admin-ban-note').prop('hidden', !account.banned && isSelf);
      if(account.banned) $('#admin_ban_form').prop('hidden', true);
      var markers = stats && stats.visibleMarkers;
      $('#admin_ban_form .admin-check').prop('hidden', !markers)
        .find('span').text('Also hide the ' + (markers || 0).toLocaleString() +
          (markers === 1 ? ' marker they\'ve added to the map' : ' markers they\'ve added to the map'));
    }

    var list = $('#admin_log').empty();
    if(!logAvailable) {
      list.append($('<li class="admin-muted"></li>').text('The change log needs the admin_accounts migration.'));
    } else if(!log.length) {
      list.append($('<li class="admin-muted centered-empty-state"></li>').text('No changes by admins yet.'));
    }
    log.forEach(function(entry) {
      var item = $('<li><span class="admin-log-what"></span><span class="admin-log-when admin-muted"></span></li>');
      item.find('.admin-log-what').text(_this._adminLogText(entry));
      item.find('.admin-log-when').text((entry.adminName ? displayUserName(entry.adminName) : 'Admin #' + entry.adminId) +
        ' · ' + _this._adminTime(entry.ago));
      list.append(item);
    });
  };

  var loadDetails = function() {
    $.getJSON('ajax.php?command=admin_get_user', { id: account.id }, function(data) {
      if(!data.success || !$('#admin_user').length) return;
      Object.assign(account, data.user);
      stats = data.stats;
      log = data.log || [];
      logAvailable = data.logAvailable !== false;
      render();
    });
  };
  render();
  loadDetails();

  $('#admin_user_form').submit(function(e) {
    e.preventDefault();
    var newLevel = Number(levelSelect.val());
    // A mis-tap on a phone shouldn't change someone's access.
    if(newLevel !== Number(account.level) && !window.confirm(
      'Change ' + displayUserName(account.username) + ' from ' + _this._adminRoleLabel(account.level) +
      ' to ' + _this._adminRoleLabel(newLevel) + '?'
    )) {
      levelSelect.val(String(account.level));
      return;
    }
    var status = $('#admin_user_status').removeClass('error success').text('Saving…');
    var button = $(this).find('button[type="submit"]').prop('disabled', true);
    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=admin_update_user',
      data: $(this).serialize() + '&id=' + encodeURIComponent(account.id),
      success: function(data) {
        status.addClass(data.success ? 'success' : 'error').text(data.msg || (data.success ? 'Saved.' : 'Unable to save.'));
        if(!data.success) return;
        Object.assign(account, data.user);
        $('#admin_user_password').val('');
        loadDetails();
      },
      error: function(xhr) {
        status.addClass('error').text(xhr.responseJSON && xhr.responseJSON.msg || 'Unable to save.');
      },
      complete: function() { button.prop('disabled', false); }
    });
  });

  $('#admin_access_btn').click(function() {
    var disable = !account.disabled;
    if(disable && !window.confirm(
      'Disable ' + displayUserName(account.username) + '? They\'ll be signed out and won\'t be able to sign in until the account is enabled again.'
    )) return;
    var status = $('#admin_access_status').removeClass('error success').text(disable ? 'Disabling…' : 'Enabling…');
    var button = $(this).prop('disabled', true);
    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=admin_set_disabled',
      data: { id: account.id, disabled: disable ? '1' : '0' },
      success: function(data) {
        status.addClass(data.success ? 'success' : 'error').text(data.msg || (data.success ? 'Done.' : 'Unable to change access.'));
        if(!data.success) return;
        account.disabled = data.disabled;
        loadDetails();
      },
      error: function(xhr) {
        status.addClass('error').text(xhr.responseJSON && xhr.responseJSON.msg || 'Unable to change access.');
      },
      complete: function() {
        button.prop('disabled', false);
        render();
      }
    });
  });

  var setBan = function(data, busyText) {
    // Unbanning reports beside its button; banning inside the open form.
    var status = $(data.banned === '1' ? '#admin_ban_status' : '#admin_access_status')
      .removeClass('error success').text(busyText);
    var buttons = $('#admin_user .admin-ban button').prop('disabled', true);
    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=admin_set_ban',
      data: Object.assign({ id: account.id }, data),
      success: function(result) {
        status.addClass(result.success ? 'success' : 'error').text(result.msg || (result.success ? 'Done.' : 'Unable to change the ban.'));
        if(!result.success) return;
        account.banned = data.banned === '1' ? 'now' : null;
        $('#admin_ban_form').prop('hidden', true)[0].reset();
        // The form's closed now, so say it where it can be seen.
        $('#admin_access_status').removeClass('error').addClass('success').text(result.msg);
        loadDetails();
      },
      error: function(xhr) {
        status.addClass('error').text(xhr.responseJSON && xhr.responseJSON.msg || 'Unable to change the ban.');
      },
      complete: function() {
        buttons.prop('disabled', false);
        render();
      }
    });
  };
  $('#admin_ban_btn').click(function() {
    if(account.banned) {
      if(window.confirm('Unban ' + displayUserName(account.username) + '? They can sign in again, and their email can be used to sign up.')) {
        setBan({ banned: '0' }, 'Unbanning…');
      }
      return;
    }
    $('#admin_access_status, #admin_ban_status').removeClass('error success').text('');
    $('#admin_ban_form').prop('hidden', false);
    render();
    $('#admin_ban_reason').focus();
  });
  $('#admin_ban_cancel').click(function() {
    $('#admin_ban_form').prop('hidden', true)[0].reset();
    render();
  });
  $('#admin_ban_form').submit(function(e) {
    e.preventDefault();
    var reason = $('#admin_ban_reason').val().trim();
    if(!reason) {
      $('#admin_ban_status').removeClass('success').addClass('error').text('Enter a reason for the ban.');
      $('#admin_ban_reason').focus();
      return;
    }
    setBan({ banned: '1', reason: reason, hideMarkers: $('#admin_ban_hide').prop('checked') ? '1' : '0' }, 'Banning…');
  });
};

// The site's settings (Admins and up), as the admin page's Settings shows
// them: each a switch, saved as it's changed, for everyone from their next
// page load. (lib/common/site_settings.php; index.php gives them to pages.)
ZMap.prototype.ADMIN_ROLE_LEVEL = 15;
ZMap.prototype.SITE_SETTINGS = [
  { name: 'gameSwitch', label: 'Switch games without reloading',
    description: 'Changing games happens in place, without loading the page again. Off: each game loads as a new page, as before (staff can still try it in their own browser, from Settings).' },
  { name: 'browserBack', label: 'Experimental back button support',
    description: 'The browser\'s Back button (and the phone back gesture) goes back through the sidebar\'s pages and closes them, like their own Back and close buttons. Off: Back leaves the page, as before (staff can still try it in their own browser, from Settings).' }
];
ZMap.prototype._loadSiteSettings = function() {
  var _this = this, panel = $('#admin_panel_settings');
  if(!panel.length || panel.data('loaded')) return;
  panel.data('loaded', true);
  panel.html(
    '<section class="admin-section admin-site-settings">' +
      '<h4 class="admin-section-heading">Site Settings</h4>' +
      '<p class="admin-muted admin-site-settings-note">For everyone on the site, from their next page load.</p>' +
      this.SITE_SETTINGS.map(function(setting) {
        return '<label class="notification-switch admin-site-setting"><span><strong>' + _this._wikiEscape(setting.label) + '</strong>' +
          '<small>' + _this._wikiEscape(setting.description) + '</small></span>' +
          '<input type="checkbox" data-site-setting="' + setting.name + '" disabled></label>';
      }).join('') +
      '<p class="admin-site-settings-status" aria-live="polite"></p>' +
    '</section>'
  );
  var status = panel.find('.admin-site-settings-status');
  var show = function(data) {
    var settings = (data && data.settings) || {};
    panel.find('[data-site-setting]').each(function() {
      this.checked = !!settings[this.getAttribute('data-site-setting')];
      this.disabled = !(data && data.success);
    });
    status.removeClass('error').text(data && !data.success ? data.msg || '' : '');
  };
  this._wikiGet('admin_site_settings').done(show).fail(function(xhr) { status.addClass('error').text(_this._wikiError(xhr)); });
  panel.on('change', '[data-site-setting]', function() {
    var input = this, name = input.getAttribute('data-site-setting'), on = input.checked;
    var setting = _this.SITE_SETTINGS.find(function(s) { return s.name === name; });
    input.disabled = true;
    _this._wikiPost('admin_site_settings', { name: name, value: on ? '1' : '0' }).done(function(data) {
      show(data);
      if(data && data.success) status.removeClass('error').text((setting ? setting.label : name) + ' is ' + (on ? 'on' : 'off') + ' for everyone, from their next page load.');
    }).fail(function(xhr) {
      input.checked = !on;
      input.disabled = false;
      status.addClass('error').text(_this._wikiError(xhr));
    });
  });
};

// A change log entry as a sentence, e.g. "Role: User → Admin, email changed".
ZMap.prototype._adminLogText = function(entry) {
  var _this = this;
  var details = entry.details || {};
  if(entry.action === 'site_setting') {
    var setting = this.SITE_SETTINGS.find(function(s) { return s.name === details.name; });
    return 'Turned “' + (setting ? setting.label : details.name) + '” ' + (details.value ? 'on' : 'off') + ' for everyone';
  }
  if(entry.action === 'disable') return 'Disabled the account';
  if(entry.action === 'enable') return 'Enabled the account';
  if(entry.action === 'unban') return 'Unbanned the account';
  if(entry.action === 'ban') {
    var hidden = details.hiddenMarkers;
    return 'Banned: ' + (details.reason || 'no reason given') +
      (hidden && hidden.length ? ' (hid ' + hidden.length + (hidden.length === 1 ? ' marker)' : ' markers)') : '');
  }
  var parts = Object.keys(details).map(function(field) {
    var change = details[field];
    if(field === 'password') return 'Set a new password';
    if(field === 'level') return 'Role: ' + _this._adminRoleLabel(change[0]) + ' → ' + _this._adminRoleLabel(change[1]);
    var label = { username: 'Username', name: 'Name', email: 'Email' }[field] || field;
    return label + ': ' + change[0] + ' → ' + change[1];
  });
  return parts.length ? parts.join('; ') : 'Updated the account';
};

// While offline, shows a notice under the page's title and dims and
// disables the controls that need the server, restoring them once back
// online. opts: controls (selector, default every form control), keep
// (selector to leave usable), dim (selector to dim instead of the controls),
// message, onChange(offline).
ZMap.prototype._lockWhileOffline = function(rootSelector, opts) {
  opts = opts || {};
  var root = $(rootSelector);
  if(!root.length) return;
  var notice = $('<p>', { class: 'offline-notice', role: 'status' })
    .text(opts.message || 'You\'re offline. Connect to the internet to make changes to your account.')
    .hide();
  var title = root.find('h3').first();
  if(title.length) notice.insertAfter(title);
  else notice.prependTo(root);

  var update = function() {
    if(!root[0].isConnected) {
      window.removeEventListener('online', update);
      window.removeEventListener('offline', update);
      return;
    }
    var offline = !navigator.onLine;
    notice.toggle(offline);
    var controls = root.find(opts.controls || 'input, button, select, textarea');
    if(opts.keep) controls = controls.not(opts.keep);
    controls.each(function() {
      var control = $(this);
      if(offline && !control.data('offlineLocked')) {
        control.data('offlineLocked', true).data('offlineWasDisabled', this.disabled);
        this.disabled = true;
      } else if(!offline && control.data('offlineLocked')) {
        this.disabled = !!control.data('offlineWasDisabled');
        control.removeData('offlineLocked offlineWasDisabled');
      }
    });
    (opts.dim ? root.find(opts.dim) : controls).toggleClass('offline-dimmed', offline);
    if(opts.onChange) opts.onChange(offline);
  };
  this._onPage(window, 'online', update);
  this._onPage(window, 'offline', update);
  // After the page's own setup, which may enable some controls.
  Promise.resolve().then(update);
};

ZMap.prototype._createAccountForm = function(user) {
  var _this = this;
  var profilePicture = user.profilePicture || 'images/default-avatar.png';

  this.mapControl.setContent(
     '<div id="account">' +
      '<h3 class="text-center">' +
        this.langMsgs.ACCOUNT_TITLE +
      '</h3>' +
      '<div class="account-profile-section">' +
        '<div class="account-profile-preview-container">' +
        '<img id="account_profile_preview" class="account-profile-preview" src="' + profilePicture + '" alt="Your profile picture" />' +
          '<button id="account_profile_choose" type="button" class="button account-profile-edit" aria-label="Change profile picture" title="Change profile picture"><i class="fas fa-pencil-alt" aria-hidden="true"></i></button>' +
        '</div>' +
        '<form id="account_profile_form" enctype="multipart/form-data">' +
          '<input id="account_profile_input" name="profile_picture" type="file" accept="image/jpeg,image/png,image/webp,image/gif" style="display:none" />' +
          '<p id="account_profile_status" class="account-profile-status" role="status" aria-live="polite"></p>' +
        '</form>' +
      '</div>' +
      '<div class="modal-footer">' +
         // Admins' tools first, on their own.
         (user.level >= 10 ? '<section class="account-section"><button id="account_admin_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-shield-alt account-nav-icon" aria-hidden="true"></i>Admin</button></section>' : '') +
         // Community editing (scripts/zbeta.js).
         '<section class="account-section">' +
           '<h4 class="account-section-title">Community Editing Beta</h4>' +
           // Everyone has Profile: for anyone not editing, a preview (scripts/zbeta.js).
           '<button id="account_profile_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-id-badge account-nav-icon" aria-hidden="true"></i>Profile</button>' +
           (user.level >= 5 ? '<button id="account_notifications_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-bell account-nav-icon" aria-hidden="true"></i>Notifications<span class="account-nav-count" hidden></span></button>' : '') +
           '<hr class="account-divider">' +
           // Recent Edits, on All Changes (every game); the category list's
           // opens on Current Game (zbeta.js). One page either way.
           '<button id="account_all_changes_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-history account-nav-icon" aria-hidden="true"></i>All Changes</button>' +
           // Paths (scripts/services/PathEditor.js): admins only while they're built.
           (this._pathsMakeable && this._pathsMakeable() ? '<button id="account_community_paths_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-map-signs account-nav-icon" aria-hidden="true"></i>Community Paths</button>' : '') +
           '<a id="account_discord_link" class="infoWindowIcn account-nav-button account-discord-link" href="' + this.DISCORD_URL + '" target="_blank" rel="noopener"><i class="fab fa-discord account-nav-icon" aria-hidden="true"></i>Zelda Maps Community Discord</a>' +
           (user.betaEditor ? '<button id="account_leave_beta_btn" type="button" class="account-text-link">Leave Editing Beta</button>'
             : user.level < 5 ? '<button id="account_join_beta_btn" type="button" class="account-text-link">Join the Editing Beta</button>' : '') +
         '</section>' +
         '<section class="account-section">' +
           '<h4 class="account-section-title">Map Features</h4>' +
           '<button id="account_bookmarks_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-bookmark account-nav-icon" aria-hidden="true"></i>Bookmarks</button>' +
           '<button id="account_offline_maps_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-download account-nav-icon" aria-hidden="true"></i>Download Offline Maps</button>' +
           '<button id="account_clear_completed_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-undo account-nav-icon" aria-hidden="true"></i>Reset Completed Markers</button>' +
         '</section>' +
         '<section class="account-section">' +
           '<h4 class="account-section-title">Account Preferences</h4>' +
           '<button id="account_information_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-user account-nav-icon" aria-hidden="true"></i>Account Information</button>' +
           '<button id="log_out_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-sign-out-alt account-nav-icon" aria-hidden="true"></i>Log Out</button>' +
         '</section>' +
         '<p class="account-credit">Made with <img class="account-credit-heart" src="images/icons/HeartPiece.svg" alt="love"> by <a href="https://zeldauniverse.net" target="_blank" rel="noopener">Zelda Universe</a></p>' +
      '</div>' +
    '</div>',
    'accountPage'
  );

  var selectedPreviewURL = null;
  $('#account_clear_completed_btn').prop('disabled', completedMarkers.length === 0);
  this._lockWhileOffline('#account', {
    controls: '#account_profile_choose, #account_admin_btn, #account_clear_completed_btn, #log_out_btn, #account_delete_btn',
    message: 'You\'re offline. Some features will be unavailable until you reconnect to the internet.'
  });
  $('#account_admin_btn').click(function() {
    _this._createAdminPage();
  });
  $('#account_notifications_btn').click(function() {
    _this._openNotificationsPage(_this._wikiBackToAccount());
  });
  if (this.setNotificationCount) this.setNotificationCount(this.notificationCount);
  $('#account_profile_btn').click(function() {
    var back = _this._wikiBackToAccount();
    if(_this.getUser() && _this.getUser().level >= 5) _this._openUserProfile({ id: user.id }, back);
    else _this._openProfilePreview(back);
  });
  $('#account_information_btn').click(function() {
    _this._createAccountInformationForm();
  });
  $('#account_all_changes_btn').click(function() {
    _this._openRecentChanges(null, _this._wikiBackToAccount());
  });
  $('#account_community_paths_btn').click(function() {
    _this.openCommunityPaths(_this._wikiBackToAccount());
  });
  $('#account_join_beta_btn').click(function() {
    _this._showEditingBetaAlert();
  });
  $('#account_leave_beta_btn').click(function() {
    _this._confirmLeaveEditingBeta();
  });
  $('#account_profile_choose').click(function() {
    $('#account_profile_input').trigger('click');
  });

  $('#account_profile_input').change(function() {
    var file = this.files && this.files[0];
    if(!file) return;
    if(selectedPreviewURL) URL.revokeObjectURL(selectedPreviewURL);
    selectedPreviewURL = URL.createObjectURL(file);
    $('#account_profile_preview').attr('src', selectedPreviewURL);
    $('#account_profile_status').removeClass('error success').text(file.name);
    $('#account_profile_form').trigger('submit');
  });

  $('#account_profile_form').submit(function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var status = $('#account_profile_status');
    status.removeClass('error success').text('Uploading…');
    $('#account_profile_choose, #account_profile_input').prop('disabled', true);

    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=update_profile_picture',
      data: formData,
      processData: false,
      contentType: false,
      success: function(data) {
        if(!data.success) {
          status.addClass('error').text(data.msg || 'The profile picture could not be updated.');
          return;
        }
        if(selectedPreviewURL) {
          URL.revokeObjectURL(selectedPreviewURL);
          selectedPreviewURL = null;
        }
        user.profilePicture = data.profilePicture;
        $('#account_profile_preview').attr('src', data.profilePicture);
        status.addClass('success').text(data.msg);
        _this.notifyUserChanged();
      },
      error: function(data) {
        var message = data.responseJSON && data.responseJSON.msg;
        status.addClass('error').text(message || 'The profile picture could not be updated.');
      },
      complete: function() {
        $('#account_profile_choose, #account_profile_input').prop('disabled', false);
        $('#account_profile_input').val('');
      }
    });
  });

  $("#account_clear_completed_btn").click(function(e) {
     _this._createDialogDeleteAllMarkers();
     e.preventDefault();
  });


  $("#account_bookmarks_btn").click(function(e) {
     _this._createBookmarksPage();
     e.preventDefault();
  });

  $("#account_offline_maps_btn").click(function(e) {
     _this._createOfflineMapsForm();
     e.preventDefault();
  });


  $("#log_out_btn").click(function(e) {
    _this.logout();
    e.preventDefault();
  });
}

ZMap.prototype._createAccountInformationForm = function() {
  var map = this;
  this.mapControl.setContent(
    '<div id="account_information">' +
      '<h3 class="text-center">Account Information</h3>' +
      '<form id="account_information_form">' +
        '<label for="account_username">Username</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-user"></i></span>' +
          '<input id="account_username" name="username" class="form-control" autocomplete="username" required minlength="3" maxlength="45" />' +
          '<span id="username_validation_icon" aria-hidden="true"></span>' +
        '</div></div>' +
        '<p id="username_availability" role="status" aria-live="polite"></p>' +
        '<label for="account_name">Full Name</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-id-card"></i></span>' +
          '<input id="account_name" name="name" class="form-control" autocomplete="name" required maxlength="255" />' +
        '</div></div>' +
        '<label for="account_email">Email</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-envelope"></i></span>' +
          '<input id="account_email" name="email" type="email" class="form-control" autocomplete="email" required maxlength="254" />' +
        '</div></div>' +
        '<label for="account_current_password">Change Password</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-lock"></i></span>' +
          '<input id="account_current_password" name="currentpassword" type="password" class="form-control" autocomplete="current-password" placeholder="Current password" />' +
          '<span class="password-validation-icon" aria-hidden="true"></span>' +
        '</div></div>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-lock"></i></span>' +
          '<input id="account_new_password" name="newpassword" type="password" class="form-control" autocomplete="new-password" placeholder="New password (optional)" />' +
          '<span class="password-validation-icon" aria-hidden="true"></span>' +
        '</div></div>' +
        '<p id="account_password_error" role="status" aria-live="polite"></p>' +
        '<button type="submit" class="infoWindowIcn form-action-button" disabled>Save Changes</button>' +
        '<p id="account_information_status" class="account-profile-status" role="status" aria-live="polite"></p>' +
        '<label class="account-danger-label">Danger Zone</label>' +
        '<button id="account_delete_btn" type="button" class="infoWindowIcn form-action-button bad">Delete Account</button>' +
      '</form>' +
    '</div>', 'accountInformationPage'
  );
  $('#account_username').val(user.username);
  $('#account_name').val(user.name || '');
  $('#account_email').val(user.email || '');
  this._lockWhileOffline('#account_information', { dim: '#account_information_form' });
  $('#account_delete_btn').on('click',function() {map._createAccountDeleteForm();});
  var savingAccountInformation = false;
  var usernameAvailable = true;
  var usernameCheckTimer;
  var usernameCheckVersion = 0;
  var passwordValid = true;
  var passwordCheckTimer;
  var passwordCheckVersion = 0;
  function updateSaveChangesState() {
    var name = $('#account_name').val().trim();
    var changed = $('#account_username').val().trim() !== user.username ||
      name !== (user.name || '') ||
      $('#account_email').val().trim() !== (user.email || '') ||
      $('#account_new_password').val() !== '';
    $('#account_information_form button[type="submit"]').prop('disabled', savingAccountInformation || !changed || !name || !usernameAvailable || !passwordValid);
  }
  $('#account_information_form input').on('input change', updateSaveChangesState);
  $('#account_current_password, #account_new_password').on('input', function() {
    var version = ++passwordCheckVersion;
    clearTimeout(passwordCheckTimer);
    $('#account_current_password, #account_new_password').removeAttr('aria-invalid').closest('.input-group').removeClass('password-invalid');
    $('#account_current_password, #account_new_password').closest('.input-group').removeClass('password-valid');
    $('.password-validation-icon').empty();
    $('#account_password_error').removeClass('checking').text('');
    var current = $('#account_current_password').val();
    var next = $('#account_new_password').val();
    passwordValid = next === '';
    updateSaveChangesState();
    if(passwordValid) return;
    function passwordFeedback(valid, message) {
      passwordValid = valid;
      $('#account_current_password, #account_new_password').attr('aria-invalid', !valid).closest('.input-group').addClass(valid ? 'password-valid' : 'password-invalid');
      $('.password-validation-icon').html(valid ? '<i class="fas fa-check"></i>' : '<i class="fas fa-times"></i>');
      $('#account_password_error').removeClass('checking').text(message);
      updateSaveChangesState();
    }
    if(!current || !next) {
      passwordFeedback(false, !current ? 'Enter your current password.' : 'Enter a new password.');
      return;
    }
    if(new TextEncoder().encode(next).length > 72) {
      passwordFeedback(false, 'The new password must be at most 72 bytes.');
      return;
    }
    $('#account_password_error').addClass('checking').text('Checking password…');
    passwordCheckTimer = window.setTimeout(function() {
      $.ajax({ type: 'POST', url: 'ajax.php?command=check_account_password', data: { currentpassword: current } })
        .done(function(data) {
          if(version !== passwordCheckVersion) return;
          passwordFeedback(!!(data.success && data.valid), data.valid ? '' : 'Current password is incorrect.');
        }).fail(function() {
          if(version !== passwordCheckVersion) return;
          passwordFeedback(false, 'Unable to check password. Please try again.');
        });
    }, 500);
  });
  $('#account_username').on('input change', function() {
    var name = this.value.trim();
    var version = ++usernameCheckVersion;
    clearTimeout(usernameCheckTimer);
    var group = $(this).closest('.input-group').removeClass('username-valid username-invalid');
    var message = $('#username_availability').text('').removeClass('success error');
    var icon = $('#username_validation_icon').empty();
    $(this).removeAttr('aria-invalid');
    usernameAvailable = name === user.username;
    updateSaveChangesState();
    if(usernameAvailable) return;
    if(!/^[A-Za-z0-9][A-Za-z0-9_.-]{2,44}$/.test(name)) {
      group.addClass('username-invalid');
      $(this).attr('aria-invalid', 'true');
      message.addClass('error').text('Use 3–45 letters, numbers, periods, underscores, or hyphens.');
      icon.html('<i class="fas fa-times"></i>');
      return;
    }
    message.text('Checking username…');
    usernameCheckTimer = window.setTimeout(function() {
      $.getJSON('ajax.php?command=check_username', { username: name }).done(function(data) {
        if(version !== usernameCheckVersion) return;
        usernameAvailable = !!(data.success && data.valid && data.available);
        group.addClass(usernameAvailable ? 'username-valid' : 'username-invalid');
        $('#account_username').attr('aria-invalid', !usernameAvailable);
        message.addClass(usernameAvailable ? 'success' : 'error').text(
          data.success ? (usernameAvailable ? 'Username available' : 'Username unavailable') : 'Unable to check username.'
        );
        icon.html(usernameAvailable ? '<i class="fas fa-check"></i>' : '<i class="fas fa-times"></i>');
        updateSaveChangesState();
      }).fail(function() {
        if(version !== usernameCheckVersion) return;
        message.addClass('error').text('Unable to check username. Please try again.');
      });
    }, 300);
  });
  $('#account_information_form').submit(function(event) {
    event.preventDefault();
    if($(this).find('button[type="submit"]').prop('disabled')) return;
    savingAccountInformation = true;
    var button = $(this).find('button[type="submit"]').prop('disabled', true);
    var status = $('#account_information_status').removeClass('success error').text('Saving…');
    var accountFormData = $(this).serializeArray();
    if(!$('#account_new_password').val()) {
      accountFormData = accountFormData.filter(function(field) {
        return field.name !== 'currentpassword' && field.name !== 'newpassword';
      });
    }
    $.ajax({
      type: 'POST', url: 'ajax.php?command=change_username', data: accountFormData,
      success: function(data) {
        if(data.success) {
          user.username = data.username;
          user.name = data.name;
          user.email = data.email;
          $('#account_current_password, #account_new_password').val('');
          map.notifyUserChanged();
          status.addClass('success').text(data.msg);
        } else {
          if(data.field === 'password') {
            status.text('');
            $('#account_current_password, #account_new_password').attr('aria-invalid', 'true').closest('.input-group').addClass('password-invalid');
            $('.password-validation-icon').html('<i class="fas fa-times"></i>');
            $('#account_password_error').text(data.msg);
          } else {
            status.addClass('error').text(data.msg || 'Account changes could not be saved.');
          }
        }
      },
      error: function() { status.addClass('error').text('Account changes could not be saved. Please try again.'); },
      complete: function() {
        savingAccountInformation = false;
        updateSaveChangesState();
      }
    });
  });
};

// Downloaded map packs: one cache of tiles and map data per game, plus a
// record in localStorage of its status and tile version.
var ZMapOfflinePacks = {
  assetsVersion: 1,
  embeddedImageURLs: function(data, baseURL) {
    var urls = new Set();
    function add(value) {
      if(!value) return;
      try {
        var url = new URL(value, baseURL);
        if(!/^https?:$/.test(url.protocol) || url.username || url.password) return;
        url.hash = '';
        urls.add(url.href);
      } catch(error) {}
    }
    function visit(value) {
      if(value && typeof value === 'object') { Object.values(value).forEach(visit); return; }
      if(typeof value !== 'string' || !/<(?:img|picture|source|image)\b|url\(/i.test(value)) return;
      var template = document.createElement('template');
      template.innerHTML = value;
      template.content.querySelectorAll('img, picture source, image').forEach(function(image) {
        ['src', 'data-src', 'data-original', 'href', 'xlink:href'].forEach(function(attr) { add(image.getAttribute(attr)); });
        ['srcset', 'data-srcset'].forEach(function(attr) {
          (image.getAttribute(attr) || '').split(',').forEach(function(candidate) { add(candidate.trim().split(/\s+/)[0]); });
        });
      });
      template.content.querySelectorAll('[style]').forEach(function(element) {
        var pattern = /url\(\s*['"]?([^'"\)]+)['"]?\s*\)/gi;
        var match;
        while((match = pattern.exec(element.getAttribute('style')))) add(match[1].trim());
      });
    }
    visit(data);
    return Array.from(urls);
  },
  // A game's name for downloads. The page knows the OoT remake as OoTR, but
  // its downloads (and get_offline_maps) have always used OoT.
  gameId: function(shortName) {
    return isOcarina(shortName) ? 'OoT' : shortName;
  },
  cacheName: function(gameId) {
    return 'zeldamaps-offline-' + gameId;
  },
  // Where an update to a game's map is saved until it's all there, apart
  // from the map, which stays as it was until then (OfflineDownloads.js).
  updateCacheName: function(gameId) {
    return this.cacheName(gameId) + '-update';
  },
  // Whether a game's map is saved whole (an update may be on its way).
  isComplete: function(record) {
    return !!(record && (record.status === 'downloaded' || (!record.status && record.downloadedAt)));
  },
  // A game's paths as anyone sees them, saved with its downloaded map
  // (OfflineDownloads.js).
  pathsURL: function(gameId) {
    return 'ajax.php?command=get_paths&game=' + encodeURIComponent(gameId) + '&path=';
  },
  // Those, from the game's downloaded map: a promise of the list, or null.
  // (Its pack is named by its offline id, OoT, not the container id the
  // page asks with: the address, unique to the game, finds it.)
  savedPaths: function(gameId) {
    if(!window.caches) return Promise.resolve(null);
    var url = new URL(this.pathsURL(gameId), window.location.href).href;
    return caches.match(url)
      .then(function(response) { return response ? response.json() : null; })
      .catch(function() { return null; });
  },
  storageKey: function(gameId) {
    return 'zeldamapsOfflineMap-' + gameId;
  },
  // Each saved tile's size and modified time, to tell which ones an update
  // replaces. Kept in the pack's own cache.
  indexURL: 'offline-pack-index.json',
  // Which tiles are saved as another, the same image (service-worker.js).
  aliasesURL: 'offline-pack-aliases.json',
  read: function(gameId) {
    try {
      var value = localStorage.getItem(this.storageKey(gameId));
      return value ? JSON.parse(value) : null;
    } catch(error) {
      return null;
    }
  },
  write: function(gameId, record) {
    try {
      localStorage.setItem(this.storageKey(gameId), JSON.stringify(record));
    } catch(error) {
      // CacheStorage remains authoritative if localStorage is unavailable.
    }
  },
  remove: function(gameId) {
    try {
      localStorage.removeItem(this.storageKey(gameId));
    } catch(error) {}
  },
  // The ids of games downloaded in full on this device.
  downloadedGameIds: function() {
    var ids = [];
    try {
      for(var i = 0; i < localStorage.length; i++) {
        var key = localStorage.key(i);
        if(key.indexOf('zeldamapsOfflineMap-') !== 0) continue;
        var gameId = key.slice('zeldamapsOfflineMap-'.length);
        if(this.isComplete(this.read(gameId))) ids.push(gameId);
      }
    } catch(error) {}
    return ids;
  },
  // A download made before tile versions existed counts as out of date.
  needsUpdate: function(record, game) {
    return !!(record && game && game.available &&
      (record.assetsVersion !== this.assetsVersion || (game.version && record.version !== game.version)));
  },
  updateKey: function(game) {
    return String(game.version || '') + ':assets-' + this.assetsVersion;
  }
};

// When signed in and online, offers to update downloaded maps whose tiles
// have changed. Each new version is offered until updated or declined.
ZMap.prototype.checkOfflineMapUpdates = function() {
  var _this = this;
  if(!this._offlineUpdateListener) {
    this._offlineUpdateListener = true;
    this._onPage(window, 'online', function() { _this.checkOfflineMapUpdates(); });
    // (Updates waiting for Wi-Fi start on reaching it.)
    if(navigator.connection && navigator.connection.addEventListener) {
      this._onPage(navigator.connection, 'change', function() { _this.checkOfflineMapUpdates(); });
    }
  }
  if(!this.getUser() || !navigator.onLine || !('caches' in window)) return;
  if(this._checkingOfflineUpdates) return;
  var gameIds = sortGames(ZMapOfflinePacks.downloadedGameIds());
  if(!gameIds.length) return;
  this._checkingOfflineUpdates = true;

  // Only packs the browser still has.
  Promise.all(gameIds.map(function(gameId) {
    return caches.has(ZMapOfflinePacks.cacheName(gameId)).then(function(has) { return has ? gameId : null; });
  })).then(function(ids) {
    ids = ids.filter(Boolean);
    if(!ids.length) return null;
    return $.getJSON('ajax.php?command=get_offline_maps&mode=versions&games=' + encodeURIComponent(ids.join(',')));
  }).then(function(data) {
    if(!data || !data.success) return;
    var outdated = (data.games || []).filter(function(game) {
      var record = ZMapOfflinePacks.read(game.id);
      return ZMapOfflinePacks.needsUpdate(record, game) && record.dismissedUpdate !== ZMapOfflinePacks.updateKey(game) &&
        !_this.offlineDownloadFor(game.id);
    });
    var cellular = _this._onCellular();
    // Those someone chose to update on Wi-Fi: started once on it, and not
    // asked about again until then.
    outdated = outdated.filter(function(game) {
      var record = ZMapOfflinePacks.read(game.id);
      if(record.waitForWifi !== ZMapOfflinePacks.updateKey(game)) return true;
      if(!cellular) {
        delete record.waitForWifi;
        ZMapOfflinePacks.write(game.id, record);
        _this.startOfflineDownload(game, { update: true, cellular: false });
      }
      return false;
    });
    if(!outdated.length || document.getElementById('offline-map-update-alert')) return;
    function escape(text) { return $('<span>').text(text).html(); }
    // What each is now, and how much bigger or smaller than what's saved.
    var description;
    if(outdated.length === 1) {
      var size = _this._offlineUpdateSizeText(outdated[0]);
      description = ['There is an update for your offline ' + escape(outdated[0].name) + ' map' +
        (size ? ': ' + escape(size) : '') + '.'];
    } else {
      description = ['There are updates for your offline maps:'].concat(outdated.map(function(game) {
        var size = _this._offlineUpdateSizeText(game, true);
        return '<b>' + escape(game.name) + '</b>' + (size ? ': ' + escape(size) : '');
      }));
    }
    description.push('Only what\'s changed is downloaded.' +
      (cellular ? ' You\'re on cellular data.' : ' Download ' + (outdated.length > 1 ? 'them' : 'it') + ' now?'));
    function update() {
      _this.openOfflineMapsPage({ autoUpdate: outdated.map(function(game) { return game.id; }) });
    }
    var actions = [{ label: cellular ? 'Update Now' : 'Update', onSelect: update }];
    // (Only where the browser says it's on cellular data: not iPhones.)
    if(cellular) {
      actions.push({
        label: 'Wait for Wi-Fi',
        onSelect: function() {
          outdated.forEach(function(game) {
            var record = ZMapOfflinePacks.read(game.id);
            if(!record) return;
            record.waitForWifi = ZMapOfflinePacks.updateKey(game);
            ZMapOfflinePacks.write(game.id, record);
          });
        }
      });
    }
    _this._showAlert({
      id: 'offline-map-update-alert',
      title: outdated.length > 1 ? 'Map Updates Available' : 'Map Update Available',
      description: description,
      actions: actions.concat([
        {
          label: 'Not Now',
          className: 'bookmark-registration-cancel',
          cancel: true,
          onSelect: function() {
            outdated.forEach(function(game) {
              var record = ZMapOfflinePacks.read(game.id);
              if(!record) return;
              record.dismissedUpdate = ZMapOfflinePacks.updateKey(game);
              ZMapOfflinePacks.write(game.id, record);
            });
          }
        }
      ])
    });
  }).catch(function() {}).then(function() {
    _this._checkingOfflineUpdates = false;
  });
};

// Shows the Offline Maps page from anywhere, e.g. an alert.
ZMap.prototype.openOfflineMapsPage = function(opts) {
  var control = this.mapControl;
  if(!control.viewStyleBottomSlide && this.settingsControl && this.settingsControl.isMinimalUI()) {
    this.settingsControl.setMinimalUI(false);
  } else if(!control.viewStyleBottomSlide && control.options.collapsed) {
    control._expand();
  }
  this._createOfflineMapsForm(opts);
  if(control.viewStyleBottomSlide) control.openDrawerLarge();
};

// opts.autoUpdate: game ids to update as soon as the page knows they need it.
// Routes call this with the user, which has no autoUpdate.
ZMap.prototype._createOfflineMapsForm = function(opts) {
  var _this = this;
  var autoUpdate = opts && Array.isArray(opts.autoUpdate) ? opts.autoUpdate : [];
  this.mapControl.setContent(
    '<div id="offline_maps" class="offline-maps-page">' +
      '<h3 class="text-center">Offline Maps</h3>' +
      '<p class="offline-maps-intro">Download full maps and marker information to this device for use without an internet connection.</p>' +
      '<div id="offline_maps_list" class="offline-maps-list">' +
        '<p class="offline-maps-loading">Loading maps…</p>' +
      '</div>' +
    '</div>',
    'offlineMapsPage'
  );
  // Downloads need the connection; removing a saved map doesn't.
  this._lockWhileOffline('#offline_maps', {
    controls: '.offline-map-none',
    message: 'You\'re offline. Connect to the internet to download or update maps.',
    onChange: function() {
      $('#offline_maps .offline-map-card').each(function() {
        var card = $(this);
        if(card.data('game') && card.find('.offline-map-download').text().slice(-1) !== '…') {
          setPackState(card, card.data('game'), card.data('packState') || null);
        }
      });
    }
  });

  function formatBytes(bytes) {
    if(!bytes) return '0 MB';
    var units = ['B', 'KB', 'MB', 'GB'];
    var unitIndex = Math.min(Math.floor(Math.log(bytes) / Math.log(1024)), units.length - 1);
    var value = bytes / Math.pow(1024, unitIndex);
    return value.toFixed(unitIndex >= 2 && value < 10 ? 1 : 0) + ' ' + units[unitIndex];
  }

  var packCacheName = ZMapOfflinePacks.cacheName.bind(ZMapOfflinePacks);
  var readPackRecord = ZMapOfflinePacks.read.bind(ZMapOfflinePacks);
  var writePackRecord = ZMapOfflinePacks.write.bind(ZMapOfflinePacks);
  var removePackRecord = ZMapOfflinePacks.remove.bind(ZMapOfflinePacks);

  function setPackState(card, game, packState) {
    // (A download running or waiting shows that instead.)
    var job = _this.offlineDownloadFor(game.id);
    if(job && job.phase !== 'done' && job.phase !== 'failed') {
      card.data('packState', packState).data('game', game);
      showDownload(card, job);
      return;
    }
    var downloadButton = card.find('.offline-map-download');
    // (Remove, for a map that isn't downloading: Cancel while it is.)
    var deleteButton = card.find('.offline-map-delete').text('Remove').prop('disabled', false);
    var status = card.find('.offline-map-status');
    card.data('packState', packState).data('game', game);
    status.removeClass('success error');
    if(packState === 'downloaded') {
      // The saved size is known even before this game's size has loaded.
      var savedSize = game.size != null ? game.size : (readPackRecord(game.id) || {}).size;
      downloadButton.text('Downloaded').prop('disabled', true).addClass('downloaded');
      deleteButton.show();
      status.text(formatBytes(savedSize) + ' saved on this device.').addClass('success');
    } else if(packState === 'update') {
      // (An update stopped part way: the map is still the one saved.)
      var paused = (readPackRecord(game.id) || {}).pendingUpdate;
      var updateSize = _this._offlineUpdateSizeText(game);
      downloadButton.text(paused ? 'Resume Update' : 'Update').prop('disabled', false).removeClass('downloaded');
      deleteButton.show();
      status.text((paused ? 'Update paused. The map on this device works as before until it\'s done' :
        'An update is available for this map') + (updateSize ? ': ' + updateSize : '') + '.');
    } else if(packState === 'partial') {
      var updating = (readPackRecord(game.id) || {}).pendingUpdate;
      downloadButton.text(updating ? 'Resume Update' : 'Resume').prop('disabled', false).removeClass('downloaded');
      deleteButton.show();
      status.text(updating
        ? 'Update paused. Resume to finish updating this map.'
        : 'Download paused. Resume to continue with the remaining tiles.');
    } else {
      downloadButton.text('Download').prop('disabled', !game.available).removeClass('downloaded');
      deleteButton.hide();
      // Until the size loads, availability isn't known yet.
      status.text(game.available === false ? 'Map files are not available for download.' : '');
    }
    if(!navigator.onLine) downloadButton.prop('disabled', true);
  }

  function reportOfflineEvent(game, event, bytes) { _this._reportOfflineEvent(game, event, bytes); }

  // A card shows its game's download as it goes: the download runs apart
  // from this page, carrying on when it's left (OfflineDownloads.js).
  function showDownload(card, job) {
    var game = card.data('game') || job.game;
    var progress = card.find('.offline-map-progress');
    var progressLabel = card.find('.offline-map-progress-label');
    var status = card.find('.offline-map-status');
    var downloadButton = card.find('.offline-map-download');
    status.removeClass('success error');
    if(job.phase === 'done') {
      progress.hide();
      progressLabel.hide();
      game.version = job.game.version;
      setPackState(card, game, 'downloaded');
      return;
    }
    if(job.phase === 'failed') {
      progress.hide();
      progressLabel.hide();
      if(job.cancelled) return;
      var record = readPackRecord(game.id);
      var message = job.error && job.error.message && !(job.error instanceof TypeError) ? job.error.message
        : (job.isUpdate ? 'The map update was interrupted.' : 'The map download was interrupted.');
      if(!/[.!?]$/.test(message)) message += '.';
      var carriesOn = job.error && job.error.waitingForWifi ? ' It carries on when you\'re on Wi-Fi, or tap Resume.'
        : ' It carries on when you\'re back online, or tap Resume.';
      if(ZMapOfflinePacks.isComplete(record)) {
        // A stopped update: the map's still the one saved.
        setPackState(card, game, ZMapOfflinePacks.needsUpdate(record, game) ? 'update' : 'downloaded');
        status.addClass('error').text(message + (job.error && job.error.fatal ? '' : carriesOn));
      } else if(record && record.status === 'partial') {
        setPackState(card, game, 'partial');
        status.addClass('error').text(message + (job.error && job.error.fatal ? '' : carriesOn));
      } else {
        setPackState(card, game, null);
        status.addClass('error').text(message);
      }
      return;
    }
    // Running, or waiting its turn.
    card.find('.offline-map-delete').text('Cancel').show();
    if(job.phase === 'queued') {
      downloadButton.prop('disabled', true).removeClass('downloaded').text('Waiting…');
      progress.hide();
      progressLabel.hide();
      status.text('Starts once the download before it finishes.');
      return;
    }
    downloadButton.prop('disabled', true).removeClass('downloaded').text(job.isUpdate ? 'Updating…' : 'Downloading…');
    var total = job.totalBytes > 0 ? job.totalBytes : Math.max(job.totalFiles, 1);
    var done = job.totalBytes > 0 ? job.completedBytes : job.completedFiles;
    progress.show();
    progressLabel.show();
    if(job.phase === 'images' || job.phase === 'finishing') {
      progress.removeAttr('value');
      progressLabel.text(job.phase === 'images' ? 'Saving marker images · ' + job.completedFiles + ' of ' + job.totalFiles + ' files' : 'Finishing…');
    } else {
      progress.attr('max', total).val(Math.min(done, total));
      progressLabel.text(Math.min(100, Math.floor(done / total * 100)) + '% · ' + job.completedFiles + ' of ' + job.totalFiles + ' files');
    }
    status.text(job.phase === 'preparing' ? (job.isUpdate ? 'Preparing update…' : 'Preparing download…') :
      'Keeps going while you use the map.');
  }

  // (One listener for every Offline Maps page: the cards showing now.)
  _this._offlineCardRenderer = function(job) {
    $('#offline_maps .offline-map-card').each(function() {
      var card = $(this);
      if((card.data('game') || {}).id === job.game.id) showDownload(card, job);
    });
  };
  if(!_this._offlineCardListening) {
    _this._offlineCardListening = true;
    _this.onOfflineDownloadChange(function(job) { if(_this._offlineCardRenderer) _this._offlineCardRenderer(job); });
  }

  function downloadTiles(game, card) {
    _this.startOfflineDownload(game, { update: card.data('packState') === 'update' });
  }

  function renderGame(game) {
    var card = $('<section>', { class: 'offline-map-card' });
    var heading = $('<div>', { class: 'offline-map-heading' });
    var gameInfo = Object.values(games || {}).find(function(entry) {
      return ZMapOfflinePacks.gameId(entry.shortName) == game.id;
    });
    if(gameInfo) {
      heading.append(new CategoryIcon({ iconClass: gameInfo.img, color: gameInfo.color }).domNode
        .addClass('offline-map-game-icon').attr('aria-hidden', 'true'));
    }
    heading.append($('<h4>').text(game.name));
    heading.append($('<span>', { class: 'offline-map-size' }).append(
      $('<span>', { class: 'offline-map-spinner', role: 'status', 'aria-label': 'Loading size' })
    ));
    card.append(heading);
    card.append($('<progress>', { class: 'offline-map-progress', value: 0, max: 1 }).hide());
    card.append($('<p>', { class: 'offline-map-progress-label' }).hide());
    card.append($('<p>', { class: 'offline-map-status', role: 'status', 'aria-live': 'polite' }));

    var actions = $('<div>', { class: 'offline-map-actions' });
    var downloadButton = $('<button>', {
      class: 'infoWindowIcn offline-map-download',
      type: 'button',
      text: 'Download'
    });
    var deleteButton = $('<button>', {
      class: 'infoWindowIcn bad offline-map-delete',
      type: 'button',
      text: 'Remove'
    }).hide();
    actions.append(downloadButton, deleteButton);
    card.append(actions);

    var packRecord = readPackRecord(game.id);
    setPackState(card, game, null);
    // What this device has saved: 'downloaded', 'partial' or null.
    var savedState = caches.has(packCacheName(game.id)).then(function(hasCache) {
      if(!packRecord || !hasCache) {
        removePackRecord(game.id);
        if(hasCache) caches.delete(packCacheName(game.id));
        caches.delete(ZMapOfflinePacks.updateCacheName(game.id)).catch(function() {});
        return null;
      }
      var state = (
        packRecord.status === 'downloaded' ||
        (!packRecord.status && packRecord.downloadedAt)
      ) ? 'downloaded' : 'partial';
      setPackState(card, game, state);
      // Browsers remove a site's saved files all at once, not one by one,
      // and a download saves its index last: a pack with its index is
      // whole. (Not by listing its files: for a game as large as TotK,
      // that took more memory than Safari allows a tab.)
      return caches.open(packCacheName(game.id)).then(function(cache) {
        return cache.match(ZMapOfflinePacks.indexURL);
      }).then(function(index) {
        if(!index && state === 'downloaded') {
          packRecord.status = 'partial';
          writePackRecord(game.id, packRecord);
          state = 'partial';
          setPackState(card, game, state);
        }
        return state;
      });
    }).catch(function() { return null; });

    var sizeLoaded = $.getJSON('ajax.php?command=get_offline_maps&game=' + encodeURIComponent(game.id)).then(function(data) {
      var size = card.find('.offline-map-size');
      if(!data.success || !data.game) {
        size.text('Size unavailable');
        return false;
      }
      game.size = data.game.size;
      game.tileCount = data.game.tileCount;
      game.available = data.game.available;
      game.version = data.game.version;
      size.text(game.available ? formatBytes(game.size) : 'Unavailable');
      return true;
    }, function() {
      card.find('.offline-map-size').text('Size unavailable');
      return false;
    });

    // Once both are known, show whether the saved map is out of date.
    Promise.all([savedState, sizeLoaded]).then(function(results) {
      var packState = results[0];
      if(!results[1]) return;
      // A download in progress sets its own state.
      if(card.find('.offline-map-download').text().slice(-1) === '…') return;
      if(packState === 'downloaded' && ZMapOfflinePacks.needsUpdate(readPackRecord(game.id), game)) {
        packState = 'update';
      }
      setPackState(card, game, packState);
      // Opened from the update alert: start right away.
      if(autoUpdate.indexOf(game.id) !== -1 && (packState === 'update' || packState === 'partial')) {
        downloadTiles(game, card);
      }
    });

    downloadButton.click(function() {
      if(game.available) downloadTiles(game, card);
    });
    deleteButton.click(function() {
      var job = _this.offlineDownloadFor(game.id);
      // Cancel: an update leaves the map as it was; a first download goes.
      if(job && job.phase !== 'done' && job.phase !== 'failed') {
        var hadMap = ZMapOfflinePacks.isComplete(readPackRecord(game.id));
        if(!window.confirm(hadMap
          ? 'Stop updating ' + game.name + '? The map on this device stays as it is.'
          : 'Stop downloading ' + game.name + '? What\'s downloaded so far will be removed.')) return;
        deleteButton.prop('disabled', true);
        _this.cancelOfflineDownload(game.id).then(function(result) {
          var record = readPackRecord(game.id);
          setPackState(card, game, result === 'kept'
            ? (ZMapOfflinePacks.needsUpdate(record, game) ? 'update' : 'downloaded') : null);
        });
        return;
      }
      if(!window.confirm('Remove the downloaded ' + game.name + ' maps from this device?')) return;
      Promise.all([
        caches.delete(packCacheName(game.id)),
        caches.delete(ZMapOfflinePacks.updateCacheName(game.id)).catch(function() {})
      ]).then(function() {
        removePackRecord(game.id);
        setPackState(card, game, null);
        reportOfflineEvent(game, 'removed');
      });
    });
    return card;
  }

  if(!('caches' in window)) {
    $('#offline_maps_list').html('<p class="offline-map-status error">Offline map downloads are not supported by this browser.</p>');
    return;
  }

  // Cards for the games the site already knows, straight away, so the page
  // slides in at its full height (and works offline). The server's list then
  // adds or removes any that differ.
  var list = $('#offline_maps_list');
  var cards = {};
  var knownGames = sortGames(Object.values(games || {})).map(function(game) {
    return { id: ZMapOfflinePacks.gameId(game.shortName), name: game.name };
  });
  if(knownGames.length) {
    list.empty();
    knownGames.forEach(function(game) {
      cards[game.id] = renderGame(game);
      list.append(cards[game.id]);
    });
  }

  $.getJSON('ajax.php?command=get_offline_maps&mode=list', function(data) {
    if(!data.success || !data.games || !data.games.length) {
      list.empty().append('<p class="offline-map-status error centered-empty-state">No offline maps are currently available.</p>');
      return;
    }
    if(!knownGames.length) list.empty();
    var listed = {};
    data.games.forEach(function(game, index) {
      listed[game.id] = true;
      if(!cards[game.id]) {
        cards[game.id] = renderGame(game);
        var next = data.games.slice(index + 1).map(function(later) { return cards[later.id]; }).find(Boolean);
        if(next) cards[game.id].insertBefore(next);
        else list.append(cards[game.id]);
      }
    });
    Object.keys(cards).forEach(function(id) {
      if(!listed[id]) cards[id].remove();
    });
  }).fail(function() {
    if(!knownGames.length) {
      list.html(navigator.onLine
        ? '<p class="offline-map-status error">Offline maps could not be loaded.</p>'
        : '');
    }
  });
};
//****************************************************************************//
//*************                                                  *************//
//*************                END - CONTEXT MENU                *************//
//*************                                                  *************//
//****************************************************************************//


//****************************************************************************//
//*************                                                  *************//
//*************                  BEGIN - GO TO                   *************//
//*************                                                  *************//
//****************************************************************************//

/**
 * Go To a submap, layer or marker
 *
 * @param vGoTo.map             - Map ID (Unique)
 * @param vGoTo.subMap          - Submap ID (Unique)
 * @param vGoTo.marker          - Marker to be opened (Takes precedence over subMap and Layer)
 **/
// Explicit marker links share camera and drawer behavior. Internal selection
// and Back restoration still use goTo directly to preserve the previous view.
// A marker opened from the site (a link, Go to Marker, a list, a search, a
// bookmark): on the map already showing, the map pans and zooms there
// (_setViewAtMarkerInVisibleArea), so it shows where it is from here; on
// another (a dungeon, a floor), it switches. opts.animate overrides.
ZMap.prototype.navigateToMarker = function(markerId, opts) {
  var marker=this.cachedMarkersById[markerId];
  if(marker && marker.categoryTypeId==3) return this.navigateToArea(marker);
  var current=this.mapControl && this.mapControl.getCurrentMap && this.mapControl.getCurrentMap();
  var animate=(opts && 'animate' in opts ? opts.animate :
    marker && current && String(current.subMapId)===String(marker.submapId)) ? 'move' : false;
  this.goTo({marker:markerId,zoom:Math.max(this.map.getZoom(),6),
    centerInVisibleArea:true,panTo:false,animate:animate},true);
};

ZMap.prototype.goTo = function(vGoTo, notByInput) {
   if (vGoTo.hideOthers || ZConfig.getConfig('hideOthers') == 'true') {
      for (var i = 0; i < markers.length; i++) {
         markers[i].visible = false;
      }
      _this.refreshMap();
   }

  if (vGoTo.marker) {
    _this._openMarker(
      vGoTo.marker,
      vGoTo.zoom,
      !vGoTo.hidePin,
      vGoTo.panTo !== false,
      notByInput,
      !!vGoTo.centerInVisibleArea,
      vGoTo.showPopup !== false,
      !!vGoTo.preserveView,
      vGoTo.animate || false // 'move' or 'fly' (MapMotion.js)
    );
    // Open Marker already does a change map, so it takes precedence

    return;
  }

  if (vGoTo.map || (vGoTo.map && vGoTo.subMap)) {
    this.mapControl.changeMap(vGoTo.map, vGoTo.subMap);
  }
}

/**
 * Go To and Open popup of the markerId informed
 *
 * @param vMarkerID             - Marker ID to be opened
 **/
ZMap.prototype._openMarker = function(
  vMarkerId,
  vZoom,
  vPin = ZConfig.getConfig('hidePin') == 'true',
  vPanTo = false,
  notByInput,
  centerInVisibleArea = false,
  showPopup = true,
  preserveView = false,
  animate = false
) {
  var marker = this.cachedMarkersById[vMarkerId];
  if (marker) {
    // The view this move leaves, remembered before the map may change (there
    // is no "before" across a map switch): the page's Back restores it while
    // the map is still at the marker, as the category and area pages do.
    this._rememberMarkerReturnView();
    if (notByInput === true) {
      this.mapControl.changeMapToMarker(marker);
    } else {
      this.mapControl.changeMapToMarker(marker);
    }

     marker.visible = true;

     if (!vZoom) {
        vZoom = this.map.getZoom();
     }
     if (vZoom > this.map.getMaxZoom()) {
        vZoom = this.map.getMaxZoom();
     }

     /*
      0 = 256
      1 = 128
      2 = 64
      3 = 32
      4 = 16
      5 = 8
      6 = 4
     */
     var latlng = L.latLng(marker.getLatLng().lat, marker.getLatLng().lng);
     if(showPopup) _this._createMarkerPopup(marker, centerInVisibleArea);
     // The arrival is read only after the map switch, right before the move:
     // a listener attached earlier would be consumed by the switch's own
     // settling (the baselayer change settles the map before we move it).
     this._recordMarkerReturnArrival();
     if(preserveView) {
       // Talk navigation changes the sidebar, not the map camera. Moving
       // here races its animated sidebar bounds and causes a visible recoil.
     } else if(centerInVisibleArea) {
       this._setViewAtMarkerInVisibleArea(marker, vZoom,
         showPopup && this.mapControl.viewStyleBottomSlide && this.mapControl._partialDrawerMode ? this.mapControl.options.softOpenTo : undefined, animate);
     } else {
       this.map.setView(latlng, vZoom);
     }
     if (vPin && (!newMarker || newMarker.markerId != marker.id)) {
         this._closeNewMarker();
         newMarker = this._createPin(marker._latlng, marker).addTo(this.map);
         newMarker.markerId = marker.id;
         newMarker.markerPos = marker.pos;
     }

     //$('#mkrDiv'+vMarkerId).unslider({arrows:false});
     if (vPanTo) {
        this.map.panTo(marker.getLatLng());
     }
     return;
   }

   toastr.error(_this.langMsgs.GO_TO_MARKER_ERROR.format(vMarkerId));
}

// The map view before a marker's navigation moved it, and where the move
// actually landed (the artwork's bounds can clamp it after the set): the
// page's Back restores the earlier view while the map is still at the marker,
// as the category and area pages do (_rememberCategoryReturnView in
// scripts/services/CategoryPage.js, _rememberAreaReturnView in
// scripts/services/AreaSearch.js). A pan or zoom in the meantime is the user's
// own and stays where it is.
ZMap.prototype._rememberMarkerReturnView = function() {
  var current = this.mapControl.getCurrentMap();
  this._markerReturnView = {
    mapId: current.mapId, subMapId: current.subMapId,
    center: this.map.getCenter(), zoom: this.map.getZoom(),
    arrived: null
  };
};

ZMap.prototype._recordMarkerReturnArrival = function(arrival) {
  var zmap = this, view = this._markerReturnView;
  if(!view) return;
  var map = this.map;
  // Where the map ends up, and on which map: a marker can live on another
  // map (OoT's and LA's dungeons), and \"hasn't moved\" must include the map.
  var record = function() {
    var current = zmap.mapControl.getCurrentMap();
    view.arrived = { center: map.getCenter(), zoom: map.getZoom(),
      mapId: current.mapId, subMapId: current.subMapId };
  };
  if(arrival) {
    var current = zmap.mapControl.getCurrentMap();
    view.arrived = { center: arrival.center, zoom: arrival.zoom,
      mapId: current.mapId, subMapId: current.subMapId };
  } else {
    record();
  }
  // The set can be clamped once it lands (the artwork's bounds, the drawer
  // and ad insets), or the map size can still be settling on phones: where
  // the map actually ends up is where \"hasn't moved\" is measured from. A
  // once-only listener: a later move of the user's is not it.
  var settle = function() {
    map.off('moveend', settle);
    map.off('zoomend', settle);
    if(zmap._markerReturnView !== view) return; // consumed or superseded
    record();
  };
  map.once('moveend', settle);
  map.once('zoomend', settle);
};

// Called as the marker page closes. Returns true when it moved the map back
// to the view the marker was opened from. A marker on another map (OoT's and
// LA's dungeons) switched the map too, and the switch is undone as well —
// but only while the map is still the one the marker is on; a map the user
// chose of their own (by switching, or by an area page) is kept.
ZMap.prototype.restoreMarkerReturnView = function() {
  var view = this._markerReturnView, map = this.map;
  this._markerReturnView = null;
  if(!view || !view.arrived) return false;
  var current = this.mapControl.getCurrentMap();
  var sameMap = current.mapId == view.mapId && current.subMapId == view.subMapId;
  if(!sameMap && (current.mapId != view.arrived.mapId || current.subMapId != view.arrived.subMapId)) return false;
  var moved = map.latLngToContainerPoint(map.getCenter()).distanceTo(map.latLngToContainerPoint(view.arrived.center));
  if(Math.abs(map.getZoom() - view.arrived.zoom) > 0.01 || moved > 2) return false;
  if(!sameMap) this.mapControl.changeMapOnly(view.mapId, view.subMapId); // the menu follows the layer swap
  this._animateView(view.center, view.zoom, 'move');
  return true;
};

// An embedded marker in a small frame (zmain.lib.js finalLoadContent): zoomed
// out from its link's zoom, so there's enough around it to tell where it is:
// a level out for every halving of the map left to see below 640px.
ZMap.prototype.EMBED_ROOM = 640;
ZMap.prototype._fitEmbedMarker = function(markerId) {
  var marker = this.cachedMarkersById && this.cachedMarkersById[markerId];
  if(!marker || !this.map) return;
  var map = this.map, zmap = this;
  // (Not mid-way through a zoom the page's start-up began: it'd carry on past it.)
  if(map._animatingZoom) { map.once('zoomend', function() { setTimeout(function() { zmap._fitEmbedMarker(markerId); }, 0); }); return; }
  var visible = this._visibleMapRoom();
  if(!visible.room || visible.room >= this.EMBED_ROOM) return;
  var zoom = Math.max(map.getMinZoom(), map.getZoom() + Math.log2(visible.room / this.EMBED_ROOM));
  this._setViewAtMarkerInVisibleArea(marker, zoom, visible.target, false);
};

// How much map there is to see past the drawer (above it, on a phone, at
// its partial height, where it rests): {room: the smaller side in pixels,
// target: that drawer height, for _setViewAtMarkerInVisibleArea}.
ZMap.prototype._visibleMapRoom = function() {
  var map = this.map, control = this.mapControl;
  var rect = map.getContainer().getBoundingClientRect(), drawer = control._container.getBoundingClientRect();
  var width = rect.width, height = rect.height, target;
  if(control.viewStyleBottomSlide) {
    target = control.options.softOpenTo;
    var base = Number.isFinite(control._mobileDrawerBaseTop) ? control._mobileDrawerBaseTop :
      drawer.top - (Number.parseFloat(control._container.style.top) || 0);
    height = Math.max(0, base + target - rect.top);
  } else if(window.getComputedStyle(control._container).display !== 'none') {
    width = Math.max(0, rect.right - drawer.right);
  }
  return {room: Math.min(width, height), target: target};
};

ZMap.prototype._setViewAtMarkerInVisibleArea = function(marker, zoom, drawerTargetTop, animate) {
  var mapRect = this.map.getContainer().getBoundingClientRect();
  var mapSize = this.map.getSize();
  var visibleLeft = 0;
  var visibleRight = mapRect.width;
  var visibleTop = 0;
  var visibleBottom = mapRect.height;

  if(this.mapControl.viewStyleBottomSlide) {
    var mobileDrawerRect = this.mapControl._container.getBoundingClientRect();
    var drawerTop=mobileDrawerRect.top;
    if(Number.isFinite(drawerTargetTop)) {
      var base=Number.isFinite(this.mapControl._mobileDrawerBaseTop) ? this.mapControl._mobileDrawerBaseTop :
        mobileDrawerRect.top-(Number.parseFloat(this.mapControl._container.style.top)||0);
      drawerTop=base+drawerTargetTop;
    }
    visibleBottom = Math.max(
      0,
      Math.min(mapRect.height, drawerTop - mapRect.top)
    );
  } else if(
    window.getComputedStyle(this.mapControl._container).display !== 'none'
  ) {
    var desktopDrawerRect = this.mapControl._container.getBoundingClientRect();
    var drawerWidth = Math.min(
      mapRect.width,
      Math.max(
        desktopDrawerRect.width,
        this.mapControl.options.width || 0
      )
    );
    var drawerEdge = this.mapControl.options.position.endsWith('left')
      ? desktopDrawerRect.left - mapRect.left
      : desktopDrawerRect.right - mapRect.left;
    if(this.mapControl.options.position.endsWith('left')) {
      visibleLeft = drawerEdge + drawerWidth;
    } else {
      visibleRight = drawerEdge - drawerWidth;
    }
  }

  if(visibleRight <= visibleLeft || visibleBottom <= visibleTop) return;

  var visibleCenter = L.point(
    (visibleLeft + visibleRight) / 2,
    (visibleTop + visibleBottom) / 2
  );
  var mapCenter = L.point(mapSize.x / 2, mapSize.y / 2);
  var markerPoint = this.map.project(marker.getLatLng(), zoom);
  var centerPoint = markerPoint.add(mapCenter).subtract(visibleCenter);

  // animate: 'move' (or true), 'fly', or none (MapMotion.js).
  this._animateView(this.map.unproject(centerPoint, zoom), zoom, animate);
};

ZMap.prototype.getMarkers = function() {
  return markers;
};
//****************************************************************************//
//*************                                                  *************//
//*************                    END - GO TO                   *************//
//*************                                                  *************//
//****************************************************************************//


// Analytics loaded once the map is up rather than at once (index.php), for
// admins to try, in this browser only. Off by default: analytics loads at
// once, as always.
ZMap.prototype.ANALYTICS_AFTER_MAP_KEY = 'zeldamapsAnalyticsAfterMap';
ZMap.prototype._addAnalyticsTimingSetting = function() {
  var settings = this.settingsControl, user = this.getUser && this.getUser();
  if(!settings || !settings.addCheckbox || this._analyticsTimingCheckbox || !user || Number(user.level) < 15) return;
  var key = this.ANALYTICS_AFTER_MAP_KEY, on = false;
  try { on = localStorage.getItem(key) === 'on'; } catch(e) {}
  this._analyticsTimingCheckbox = settings.addCheckbox('Load analytics after the map (staff test)', on, function(checked) {
    try { if(checked) localStorage.setItem(key, 'on'); else localStorage.removeItem(key); } catch(e) {}
    toastr.info(checked ? 'Analytics will load once the map is up, from the next page load, in this browser.' : 'Analytics loads straight away again, from the next page load.');
  });
};

// Whether something is being edited that a reload would lose: what (for
// a log), or null. (GameSwitch.js, and index.php's update reload.)
ZMap.prototype._editingSomething = function() {
  if(window.tinymce && tinymce.editors && tinymce.editors.length) return 'editing';
  if(this._pathEditing) return 'editing a path';
  var type = this.mapControl && this.mapControl.getContentType && this.mapControl.getContentType() || '';
  if(/^(markerEdit|newMarker|pathEditor|pathPinEditor|mapSettings|areaNameEdit|regionEdit|accountInformation)/.test(type)) return 'editing';
  return null;
};

ZMap.prototype.updateUrl = function() {
   // (An embed's address stays as it was embedded: reloading it starts it
   // over, and Open on Zelda Maps opens what was embedded.)
   if (this.isFramed()) return;
   var url = new URL(window.location.toString());
   var markerContent = /^m(\d+)$/.exec(this.mapControl.getContentType() || '');
   if (markerContent) {
      url.searchParams.set("marker", markerContent[1]);
   } else {
      url.searchParams.delete("marker");
   }
   url.searchParams.set("map", this.mapControl.getCurrentMap().mapId);
   url.searchParams.set("subMap", this.mapControl.getCurrentMap().subMapId);
   url.searchParams.set("zoom", this.map.getZoom());
   url.searchParams.set("x", Math.floor(this.map.getCenter().lng));
   url.searchParams.set("y", Math.floor(this.map.getCenter().lat));
   // Replace, not push: map positions aren't navigation, and Back doesn't
   // move the map. Safari also throws once a page changes history more than
   // 100 times in 10 seconds, which would break whatever moved the map.
   try {
      history.replaceState(Object.assign({}, history.state), "", url);
   } catch(error) {
      console.warn('Could not update the URL: ' + error.message);
   }
}

// Panning and zooming end a move every frame; update the URL once the map
// settles.
ZMap.prototype.scheduleUrlUpdate = function() {
   clearTimeout(this._urlUpdateTimer);
   this._urlUpdateTimer = setTimeout(this.updateUrl.bind(this), 300);
}

ZMap.prototype.addLanguage = function(lang) {
    _this.lang = lang;
}

ZMap.prototype.pad = function(num, size) {
    var newNum = num;
    if (num < 0) {
        newNum = num *-1;
    }

    newNum = newNum.toString();
    newNum = ("000"+newNum).slice(-1 * size);
    if (num < 0) {
        newNum = '-' + newNum;
    }
    return newNum;

}

// Dungeons open showing the whole map: on every game, any map with its own
// limits except an overworld (OoT's Hyrule keeps the view it's given).
ZMap.prototype._fitsWhenOpened = function(layer) {
  return !!(layer && layer.mapBounds && layer.mapKind !== 'world');
};

// Show the whole of a layer's limits. The furthest zoom out for them is only
// worked out once a running zoom animation ends (_updateMinZoom), so fit
// then: fitting first used the last map's limit. While the page is still
// starting up, a view set from the address can land after the fit: check
// shortly after and fit again if so.
ZMap.prototype._fitToMapBounds = function(layer) {
  var zmap = this, map = this.map;
  var fit = function() {
    if(zmap.mapControl.currentMapLayer !== layer) return;
    if(zmap._updateMinZoom) zmap._updateMinZoom(true);
    map.setView(L.latLngBounds(layer.mapBounds).getCenter(), map.getMinZoom(), {animate: false});
  };
  var settle = function() {
    fit();
    // (Unless someone has moved the map in the meantime.)
    var moved = false, mark = function() { moved = true; };
    map.once('dragstart', mark); map.once('zoomstart', mark);
    setTimeout(function() {
      map.off('dragstart', mark); map.off('zoomstart', mark);
      // Nor if the page chose a view of its own meanwhile (a path's link).
      if(!zmap._viewChosen && Math.abs(map.getZoom() - map.getMinZoom()) > .01) fit();
    }, 400);
  };
  if(map._animatingZoom) map.once('zoomend', settle); else settle();
};

// OoT's Hyrule map is a wide rectangle, not the square the dungeon floors use:
// keep the view, and the furthest zoom out, to the current map's own limits.
ZMap.prototype.applyOotMapBounds = function() {
  var layer=this.mapControl && this.mapControl.currentMapLayer;
  if(!this.map || !this.map.options.maxBounds) return;
  if(!this._defaultMaxBounds) this._defaultMaxBounds=L.latLngBounds(this.map.options.maxBounds);
  var next=layer && layer.mapBounds ? L.latLngBounds(layer.mapBounds) : this._defaultMaxBounds;
  if(L.latLngBounds(this.map.options.maxBounds).equals(next)) return;
  this.map.setMaxBounds(next);
  if(this._updateMinZoom) this._updateMinZoom(true);
};
