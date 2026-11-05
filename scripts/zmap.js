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

      RESET_PASSWORD_WELCOME: "Choose a New Password",
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
    document.documentElement.classList.toggle('oot-asset-preview', !!vMapOptions.assetPreview);
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

ZMap.prototype.addMap = function(vMap) {
   // If there is no subMap, we can't add to the map
   if (vMap.subMap.length == 0) {
      console.log("No subMap configured for \"" + vMap.name + "\"!!!");
      return;
   }
   var tileBaseURL = vMap.subMap[0].tileBaseURL || this.tilesBaseURL;
   if(this.mapOptions.assetPreview && this.mapOptions.shortName === 'OoT') {
     // Each supplied floor/age/state is independently selectable. Do not use
     // the legacy blank-base overlay path, which cannot expose these variants.
     vMap.subMap.forEach(function(submap) {
       var title = vMap.name + (vMap.subMap.length > 1 ? ' — ' + submap.name : '');
       var layer = L.tileLayer((submap.tileBaseURL || tileBaseURL) + submap.tileURL + this.tileNameFormat + '.' + submap.tileExt, {
         maxZoom: Number(this.mapOptions.maxZoom), maxNativeZoom: Number(submap.maxZoom || vMap.maxZoom),
         minZoom: 0, noWrap: true, tileSize: Number(this.mapOptions.tileSize), keepBuffer: 2,
         attribution: vMap.mapCopyright, label: title, iconURL: submap.iconURL
       });
       layer.id = 'mID' + vMap.id + 's' + submap.id;
       layer.originalId = vMap.id;
       layer.defaultSubMapId = submap.id;
       layer.title = title;
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
    var tLayer = L.tileLayer(
      tileBaseURL
      + vMap.subMap[0].tileURL
      + this.tileNameFormat
      + '.'
      + vMap.subMap[0].tileExt
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
        , iconURL           : vMap.subMap[0].iconURL || this.defaultIconURL
          + vMap.subMap[0].tileURL
          + 'icon.'
          + vMap.subMap[0].tileExt
        , errorTileUrl      : this.errorTileUrl
      }
    );

    tLayer.id               = 'mID' + vMap.id   ;
    tLayer.originalId       = vMap.id           ;
    tLayer.title            = vMap.name         ;
    tLayer._overlayMap      = []                ;
    tLayer.defaultSubMapId  = vMap.subMap[0].id ;

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
                                             , iconURL:           vMap.subMap[0].iconURL || this.defaultIconURL + vMap.subMap[0].tileURL + 'icon.' + vMap.subMap[0].tileExt
                                             }
      );

    tLayer.id          = 'mID' + vMap.id;
    tLayer.originalId  = vMap.id;
    tLayer.title       = vMap.name;
    tLayer._overlayMap = [];
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
                                            , iconURL:           vMap.subMap[i].iconURL || this.defaultIconURL + vMap.subMap[i].tileURL + 'icon.' + vMap.subMap[i].tileExt
                                          }
       );

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
                                                                       , iconURL:           this.defaultIconURL + vMap.subMap.tileURL + 'icon.' + vMap.subMap.tileExt
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

  this.handlers["markersAdded"].forEach(function(handler) {
    handler(vMarkers); // or markers..
  }, this);
  if(this.mapControl) this.mapControl._categoryMenu.categoryButtons.forEach(function(button) {
    button.updateCategoryLabel();
  });
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
      marker = new L.marker([vMarker.y,vMarker.x], { opacity: 0.01 }); //opacity may be set to zero
      marker.bindTooltip(vMarker.name, {permanent: true, className: this.mapOptions.shortName + "-label",direction: 'center', offset: [0, 0] });
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
    // On desktop the marker loads into the hidden sidebar, so Minimal UI stays.
    if (_this.mapControl.options.collapsed && _this.mapControl.viewStyleBottomSlide) {
      _this.mapControl.toggle();
    }

    if (newMarker == null || (newMarker.markerId != marker.id)) {
      _this._createMarkerPopup(marker);

      _this._closeNewMarker();
      newMarker = L.marker(marker._latlng).addTo(_this.map);
      newMarker.markerId = marker.id;
      newMarker.markerPos = marker.pos;
      _this._panMarkerIntoVisibleMapArea(marker, true);
      //map.panTo(marker.getLatLng());
    }
   });

   marker.on('contextmenu',function(e){
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

ZMap.prototype._createMarkerPopup = function(marker, openDrawerImmediately) {
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
    var content = "<h2 class='popupTitle'>" + title + "</h2>" +
      "<p class='marker-coordinate-pill'>" + coordinateText + "</p>" +
      "<div class='marker-actions-row marker-actions-row-four'>" +
        "<button type='button' id='check" + marker.id + "' class='marker-action-button infoWindowIcn " + (!marker.complete ? "unchecked" : "checked") + "' onclick=\"var button = document.getElementById('check" + marker.id + "'); var complete = button.classList.contains('unchecked'); button.classList.toggle('unchecked', !complete); button.classList.toggle('checked', complete); _this._setMarkerDone(" + marker.id + ", complete); return false\">" +
          "<span class='marker-action-icon'><i class='icon-" + (!marker.complete ? "checkbox-unchecked" : "checkmark") + "'></i></span>" +
          "<span class='marker-action-label'>" + (!marker.complete ? "Complete" : "Completed") + "</span>" +
        "</button>" +
        this._bookmarkButtonHTML() +
        "<button type='button' class='marker-action-button infoWindowIcn' onclick='_this._copyToClipboard(" + marker.id + "); return false'>" +
          "<span class='marker-action-icon'><i class='fas fa-link'></i></span>" +
          "<span class='marker-action-label'>Copy Link</span>" +
        "</button>" +
        "<button type='button' class='marker-action-button infoWindowIcn' onclick='_this._copyToClipboardEmbed(" + marker.id + "); return false'>" +
          "<span class='marker-action-icon'><i class='icon-embed2'></i></span>" +
          "<span class='marker-action-label'>Embed Code</span>" +
        "</button>" +
      "</div>";
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

	if (marker.gameData == null) {
		//content = content + "<hr>";

		for (var i = 0; i < marker.tabText.length; i++) {
		   content = content + marker.tabText[i].replace(
         /<p\b(?=[^>]*\bname\s*=\s*(['"])coord\1)[^>]*>[\s\S]*?<\/p>/gi,
         ''
       );
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
  this._refreshMarkerEditorTools(marker);
  var openImmediatelyMobile = (
    !!openDrawerImmediately &&
    this.mapControl.viewStyleBottomSlide
  );
  this.mapControl.openDrawerSmall(
    openImmediatelyMobile,
    openImmediatelyMobile
  );
}

ZMap.prototype._getDisplayZoom = function() {
   return Math.round(this.map.getZoom());
}

ZMap.prototype._createMarkerIcon = function(vCatId, vComplete) {
   var poiStyle = getPOIStyle(this.categories[vCatId]);
   var poiClass = poiStyle ? ' poi-badge poi-' + poiStyle : '';
   if(poiStyle && String(this.categories[vCatId].container_id) === '22') poiClass += ' poi-eow';
   if (this._getDisplayZoom() > this.mapOptions.switchIconsAtZoom) {
      return new markerIconMedium({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-medium" + poiClass + "' style='background-color: " + this.categories[vCatId].color + "; "
                                                                      + "border-color: " + this.categories[vCatId].color + "'>"
                                       + "<span class='icon-" + this.categories[vCatId].img + " icnText-medium'></span>"
                                       + (vComplete?"<span class='icon-checkmark completeMarker completeMarker-Medium'></span>":"")
                                 + "</div>"
      });
   } else {
      return new markerIconSmall({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-small" + poiClass + "' style='background-color: " + this.categories[vCatId].color + "; "
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
ZMap.prototype._copyToClipboardEmbed = function(vMarkerId) {
   var href = window.location.href.split("?");
   var clipboardParams = this._getClipboardParams(href);

   window.prompt("Copy to clipboard: Ctrl+C, Enter", "<iframe src=\"" + href[0] + "?" + clipboardParams + "marker=" + vMarkerId + "&zoom=" + this.map.getZoom() + "&hideOthers=true&showMapControl=true&hidePin=false\" frameborder=\"0\" allowfullscreen></iframe>");
}
ZMap.prototype._copyToClipboard = function(vMarkerId) {
   var href = window.location.href.split("?");
   var clipboardParams = this._getClipboardParams(href);
   window.prompt("Copy to clipboard: Ctrl+C, Enter", href[0] + "?" + clipboardParams + "marker=" + vMarkerId + "&zoom=" + this.map.getZoom());
}

ZMap.prototype.addMarkerToCategoryCache = function(marker) {
  if(!this.cachedMarkersByCategory[marker.categoryId]) this.cachedMarkersByCategory[marker.categoryId] = [];
  this.cachedMarkersByCategory[marker.categoryId].push(marker);
};

ZMap.prototype.refreshMapCompleted = function() {
  this.refreshMap(null, true);
}

ZMap.prototype.focusSingleMapCategory = function(category) {
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
    this.mapControl.changeMapOnly(first.mapId, first.submapId);
    this.mapControl.setCurrentMap(first.mapId, first.submapId);
    this.refreshMap();
  }
  var fit = function() {
    if(navigationRequest !== this._categoryNavigationRequest || !category.checked) return;
    var rect = this.map.getContainer().getBoundingClientRect();
    var drawer = this.mapControl._container.getBoundingClientRect();
    var topLeft = [32, 72], bottomRight = [32, 32];
    if(this.mapControl.viewStyleBottomSlide) {
      bottomRight[1] += Math.max(0, rect.bottom - drawer.top);
    } else if(!this.mapControl.options.collapsed) {
      if(this.mapControl.options.position.endsWith('left')) topLeft[0] += drawer.width;
      else bottomRight[0] += drawer.width;
    }
    var bounds = L.latLngBounds(candidates.map(function(m) { return m.getLatLng(); }));
    this.map.fitBounds(bounds, { paddingTopLeft: topLeft, paddingBottomRight: bottomRight,
      maxZoom: stayOnCurrentMap ? previousZoom : this.map.getMaxZoom(), animate: true });
  }.bind(this);
  if(this.mapControl.viewStyleBottomSlide && this.mapControl._open && !this.mapControl._partialDrawerMode) {
    this.mapControl.openDrawerDefaultPartial();
    window.setTimeout(fit, 400);
  } else fit();
};

ZMap.prototype.refreshMap = function(affectedCategories, completedChanged) {
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

  markers.forEach(function(marker) {
    this._updateMarkerPresence(marker);
  }, this);
  verboseFirst = true;
};

ZMap.prototype._updateMarkerPresence = function(marker) {
  mapBounds = this.map.getBounds().pad(0.15);

  if (
       this.mapControl.getCurrentMap().mapId    != marker.mapId
    || this.mapControl.getCurrentMap().subMapId != marker.submapId
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
      marker.setIcon(_this._createMarkerIcon(marker.categoryId, marker.complete));
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
    return marker.visible
    && this.mapOptions.showPoiLabels !== false
    && markerCategory.checked
    && (ignoreBounds || mapBounds.contains(marker.getLatLng()))  // Is in the Map Bounds (PERFORMANCE)
    && (
      (!markerCategory._respectZoomThreshold && (
        this.mapOptions.categorySelectionMethod != "focus"
        || !this.mapControl._categoryMenu.modeAutomatic
      ))
      || markerCategory.visible_zoom <= this._getDisplayZoom()
    ) // Check if we should show for the category, and at this zoom level, for focus modes
    && (
      this.mapOptions.showCompleted == true || (
        this.mapOptions.showCompleted == false
        && marker.complete != true
      )
    ); // Should we show completed markers?
  } else if (marker.categoryTypeId == 3) {
    return marker.visible
      // @TODO: HARDCODE for TotK Release, need better handling
      && (ignoreBounds || mapBounds.contains(marker.getLatLng()))  // Is in the Map Bounds (PERFORMANCE)
      && (
        (
         this.mapOptions.categorySelectionMethod == "focus"
         && this.categories[marker.categoryId].visible_zoom <= this._getDisplayZoom()
         && (
               (
               (marker.categoryId == 2163 && this._getDisplayZoom() <= 3)
               || (marker.categoryId == 2164 && this._getDisplayZoom() > 3 && this._getDisplayZoom() <= 5)
               || (marker.categoryId == 2165 && this._getDisplayZoom() > 5 && this._getDisplayZoom() <= 6)
               || (marker.categoryId == 2166 && this._getDisplayZoom() > 6 && this._getDisplayZoom() <= 8)
               )
            )
        )
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

    var viewportTop = window.visualViewport
      ? window.visualViewport.offsetTop
      : 0;
    var height = Math.max(
      window.innerHeight,
      window.screen.height - viewportTop
    );
    document.documentElement.style.setProperty('--mobile-map-height', height + 'px');
  };
  var invalidateMapSize = function() {
    updateMobileMapHeight();
    window.requestAnimationFrame(function() {
      if(this.map === map) map.invalidateSize({ pan: false });
    }.bind(this));
  }.bind(this);
  window.addEventListener('resize', invalidateMapSize);
  if(window.visualViewport) {
    window.visualViewport.addEventListener('resize', invalidateMapSize);
  }
  if(window.ResizeObserver) {
    this._mapSizeObserver = new window.ResizeObserver(invalidateMapSize);
    this._mapSizeObserver.observe(mainEl);
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
        if (mapBounds.contains(m.getLatLng())) {
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
  this.settingsControl = L.control.settings({
    zMap: this,
    mapControl: this.mapControl
  }).addTo(this.map);
  if(this._updateMinZoom) this._updateMinZoom();
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
    _this.mapControl.setCurrentMap(parseInt(e.originalId), parseInt(defaultSubMapId));
    _this.refreshMap();
    _this._closeNewMarker();
    //this.mapControl.resetContent();

    _this.map.setView(new L.LatLng(
      _this.mapOptions.centerY,
      _this.mapOptions.centerX
    ), _this.map.getZoom());
  });
  if(this.mapOptions.assetPreview) {
    var requestedMap = ZConfig.getConfig('map');
    if(requestedMap) this.mapControl.changeMapOnly(requestedMap, ZConfig.getConfig('subMap'));
  }

  $(document).on('keydown', function(e) {
    if(e.key == "Escape") {
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
  }.bind(this.mapControl));

  this.map.on('moveend', function(e) {
    _this.refreshMap();
    if (
      newMarker != null
      && newMarker.markerPos != null
      && !_this.map.hasLayer(markers[newMarker.markerPos])
      // Markers are culled outside the viewport; only deselect when hidden.
      && !_this._shouldShowMarker(markers[newMarker.markerPos], true)
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
  container.addEventListener('touchstart', function(event) {
    tap = null;
    if(event.touches.length !== 1) return;
    var icon = event.target.closest && event.target.closest('.leaflet-marker-icon');
    var target = icon && map._targets[L.Util.stamp(icon)];
    if(!target || !target.markerId && !target.id) return;
    var touch = event.touches[0];
    tap = { target: target, x: touch.clientX, y: touch.clientY, time: Date.now() };
  }, { capture: true, passive: true });
  container.addEventListener('touchmove', function(event) {
    if(!tap) return;
    if(event.touches.length !== 1 ||
      Math.hypot(event.touches[0].clientX - tap.x, event.touches[0].clientY - tap.y) > 12) tap = null;
  }, { capture: true, passive: true });
  container.addEventListener('touchcancel', function() { tap = null; }, { passive: true });
  container.addEventListener('touchend', function(event) {
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

  container.addEventListener('touchstart', function(event) {
    tap = null;
    if(event.touches.length !== 1) { lastTap = null; return; }
    if(event.target.closest && event.target.closest('.leaflet-marker-icon, .leaflet-control, .leaflet-popup')) return;
    var touch = event.touches[0];
    tap = { x: touch.clientX, y: touch.clientY, time: Date.now() };
  }, { capture: true, passive: true });
  container.addEventListener('touchmove', function(event) {
    if(tap && (event.touches.length !== 1 ||
      Math.hypot(event.touches[0].clientX - tap.x, event.touches[0].clientY - tap.y) > 12)) {
      tap = lastTap = null;
    }
  }, { capture: true, passive: true });
  container.addEventListener('touchcancel', function() { tap = lastTap = null; }, { passive: true });
  container.addEventListener('touchend', function(event) {
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
  return href[0] + "?" + clipboardParams +
    "map=" + this.mapControl.getCurrentMap().mapId +
    "&subMap=" + this.mapControl.getCurrentMap().subMapId +
    "&zoom=" + this.map.getZoom() +
    "&x=" + latlng.lng.toFixed(4) +
    "&y=" + latlng.lat.toFixed(4) +
    "&droppedPin=true";
};

ZMap.prototype._openDroppedPin = function(latlng) {
  this._closeNewMarker();
  newMarker = L.marker(latlng).addTo(this.map);
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
    "<div class='popupContent'></div>";

  this.mapControl.setContent(content, 'droppedPin-' + L.Util.stamp(newMarker));
  this.mapControl.openDrawerSmall();

  $('#copy_dropped_pin_link').on('click', function() {
    window.prompt("Copy to clipboard: Ctrl+C, Enter", link);
    return false;
  });
  $('#copy_dropped_pin_embed').on('click', function() {
    window.prompt("Copy to clipboard: Ctrl+C, Enter", "<iframe src=\"" + embedLink + "\" frameborder=\"0\" allowfullscreen></iframe>");
    return false;
  });
};

ZMap.prototype._createDroppedPinEmbedLink = function(latlng) {
  return this._createDroppedPinLink(latlng) + "&showMapControl=true";
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
    if(target.markerId != null) return bookmark.markerId == target.markerId;
    return bookmark.markerId == null &&
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
        data: target.markerId != null
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
  if(this.getUser()) return;
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
// until closed: toastr's timeOut is 0 in ZConfig.js), with the count and a
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

  var entries = (this.bookmarks || []).map(function(bookmark) {
    return bookmark.markerId != null
      ? _this._createMarkerBookmarkEntry(bookmark)
      : _this._createPinBookmarkEntry(bookmark);
  }).filter(Boolean);

  if(!entries.length) {
    list.append('<li class="bookmarks-empty"><div class="bookmarks-empty-title">No Bookmarks</div>' +
      '<p>Bookmark POIs and dropped pins to find them here.</p></li>');
    return;
  }

  list.append('<div class="leaflet-control-layers-separator search-result-separator"></div>');
  entries.forEach(function(entry) {
    list.append(entry);
    list.append('<div class="leaflet-control-layers-separator search-result-separator"></div>');
  });
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

  if(marker) {
    this.goTo({ marker: marker.id, panTo: false }, true);
    latlng = marker.getLatLng();
  } else {
    this.mapControl.changeMapOnly(bookmark.mapId, bookmark.submapId);
    latlng = L.latLng(bookmark.y, bookmark.x);
    this._openDroppedPin(latlng);
  }

  if(this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerSmall(true);
  this._centerInVisibleAreaWhenSettled(latlng);
};

ZMap.prototype._centerInVisibleAreaWhenSettled = function(latlng) {
  var attempts = 0;
  var center = function() {
    if(attempts++ < 20 && this.mapControl._drawerAnimationTimeout) {
      window.setTimeout(center, 100);
      return;
    }
    this._setViewAtMarkerInVisibleArea({ getLatLng: function() { return latlng; } }, this.map.getZoom());
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
  var bounds = L.latLngBounds(map.options.maxBounds);
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
        if(adRect.height) bottomEdge = Math.min(bottomEdge, adRect.top);
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
      map.latLngToContainerPoint(bounds.getNorthWest()).multiplyBy(-1)
        .add(L.point(insets.left, insets.top)),
      map.latLngToContainerPoint(bounds.getSouthEast()).multiplyBy(-1)
        .add(map.getSize()).subtract(L.point(insets.right, insets.bottom))
    );
  });

  var update = function() {
    var size = map.getSize();
    if(!size.x || !size.y) return;
    var next = measureInsets();
    var moved = ['top', 'right', 'bottom', 'left'].some(function(side) {
      return Math.abs(next[side] - insets[side]) > .5;
    });
    insets = next;
    // Not getBoundsZoom(), which never returns less than the current minimum,
    // so the limit could never be lowered again.
    var free = size.subtract(L.point(
      insets.left + insets.right + 2 * margin, insets.top + insets.bottom + 2 * margin
    ));
    var current = map.getZoom() || 0;
    var mapSize = L.bounds(map.project(bounds.getNorthWest(), current), map.project(bounds.getSouthEast(), current)).getSize();
    if(free.x <= 0 || free.y <= 0 || !mapSize.x || !mapSize.y) return;
    var zoom = map.getScaleZoom(Math.min(free.x / mapSize.x, free.y / mapSize.y), current);
    if(Number.isFinite(zoom)) map.setMinZoom(Math.max(0, Math.min(zoom, Number(map.getMaxZoom()))));
    if(moved && map._loaded) map.panInsideBounds(bounds, { animate: false });
  };
  this._updateMinZoom = update;
  update();
  map.on('resize', update);
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
    if(image.complete && image.naturalWidth) {
      // Place the texture's center on the map bounds' center at each zoom.
      var center = map.project(gridCenter, coords.z);
      var offsetX = ((coords.x * 256 - center.x + image.width / 2) % image.width + image.width) % image.width;
      var offsetY = ((coords.y * 256 - center.y + image.height / 2) % image.height + image.height) % image.height;
      context.translate(-offsetX, -offsetY);
      context.fillStyle = context.createPattern(image, 'repeat');
      context.fillRect(-image.width, -image.height, image.width * 2 + 256, image.height * 2 + 256);
    }
    return tile;
  };
  image.onload = function() {
    layer.redraw();
    mainElBackground();
  };
  function mainElBackground() {
    map.getContainer().style.backgroundImage = 'none';
  }
  image.src = 'images/zelda-maps-bg-tile.png';
  layer.addTo(map);
  this._mapGridBackground = layer;
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
  var usingDownloadedTiles = false;
  if('serviceWorker' in navigator) navigator.serviceWorker.addEventListener('message', function(event) {
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
  window.addEventListener('online', refresh);
  window.addEventListener('offline', refresh);
  window.addEventListener('resize', function() {
    positionMessage();
    if(window.requestAnimationFrame) window.requestAnimationFrame(positionMessage);
  });
  window.addEventListener('pageshow', refresh);
  document.addEventListener('visibilitychange', refresh);
  this._refreshOfflineMapMessage = refresh;
  if(window.visualViewport) window.visualViewport.addEventListener('resize', positionMessage);
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
   // Signed out: remove the account's offline data from this device.
   if(user == null) ZOfflineSync.clear();
   _this._buildContextMenu();
   if (this._watchWikiUser) this._watchWikiUser();
   this.notifyUserChanged();
   if (this._watchNotifications) this._watchNotifications();

   if (user != null) {
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
ZMap.prototype._createMarkerForm = function(vMarker, vLatLng, vPoly) {
  var _this = this;
  if (user == null) {
    toastr.error(_this.langMsgs.GENERAL_ERROR.format('You are not logged!'));
    return;
  }
  if (window.tinymce) tinymce.remove();

  var editing = vMarker != null;
  var isEditor = user.level >= 5;
  var esc = this._wikiEscape.bind(this);
  var field = function(icon, control) {
    return '<div class="form-group"><div class="input-group">' +
      '<span class="input-group-addon"><i class="fas ' + icon + '" aria-hidden="true"></i></span>' +
      control + '</div></div>';
  };
  var categoryOptions = this.categoriesArr.map(function(entry) {
    return '<option value="' + esc(entry.id) + '">' + esc(entry.name) + '</option>';
  }).join('');
  var coordinate = function(axis, id, name, required) {
    return '<div class="form-group"><div class="input-group">' +
      '<span class="input-group-addon marker-edit-axis" aria-hidden="true">' + axis + '</span>' +
      '<input type="number" step="any" inputmode="decimal" class="form-control" id="' + id + '" name="' + name + '"' +
        (required ? ' required' : ' placeholder="Optional"') + ' aria-label="' + axis + '" />' +
    '</div></div>';
  };
  // Some markers (from TotK's import) keep their in-game coordinates in a
  // hidden line of their content instead of a Z. The fields take its place.
  var coordMarkup = /<p\b(?=[^>]*\bname\s*=\s*(['"])coord\1)[^>]*>([\s\S]*?)<\/p>/i;
  var markupZ = null;
  (editing && vMarker.tabText || []).some(function(text) {
    var match = coordMarkup.exec(text || '');
    if (!match) return false;
    var parts = match[2].replace(/<[^>]*>/g, '').split('|');
    if (parts.length > 2 && parts[2].trim() !== '' && isFinite(Number(parts[2]))) markupZ = Number(parts[2]);
    return true;
  });
  var submapId = editing && vMarker.submapId != null ? vMarker.submapId : this.mapControl.getCurrentMap().subMapId;

  var html =
    '<div id="marker_edit" class="wiki-page">' +
      '<h3 class="text-center">' + (editing ? 'Edit Marker' : 'New Marker') + '</h3>' +
      (editing ? '<p class="wiki-subtitle">' + esc(vMarker.title) + '</p>' : '') +
      '<form id="newMarkerForm" class="leaflet-control-layers-list marker-edit-form" autocomplete="off">' +
        '<label for="markerTitle">Title</label>' +
        field('fa-heading', '<input type="text" class="form-control" id="markerTitle" name="markerTitle" required maxlength="255" placeholder="What is it?" />') +
        // Where it is: X and Y place it on the map; Z (height) is optional.
        '<label for="markerX">Coordinates</label>' +
        '<div class="marker-edit-coords">' +
          coordinate('X', 'markerX', 'lng', true) +
          coordinate('Y', 'markerY', 'lat', true) +
          coordinate('Z', 'markerZ', 'z', false) +
        '</div>' +
        '<label for="categoryId">Category</label>' +
        field('fa-tag', '<select class="form-control" name="categoryId" id="categoryId">' + categoryOptions + '</select>') +
        '<label>Content</label>' +
        '<div class="divTabBody marker-edit-sections"></div>' +
        '<button id="add_field_button" type="button" class="marker-edit-add"><i class="fas fa-plus" aria-hidden="true"></i>Add Section</button>' +
        '<label for="markerDescription">Internal Notes</label>' +
        field('fa-sticky-note', '<textarea class="form-control" id="markerDescription" name="markerDescription" rows="2" placeholder="For editors. Not shown on the map."></textarea>') +
        '<div class="marker-edit-options">' +
          '<label class="admin-check"><input type="checkbox" id="isGlobal" name="isGlobal" />' +
            '<span>Show on every map of this game<small>For example, in both the Light World and Dark World.</small></span></label>' +
          (editing && user.level >= 10
            ? '<label class="admin-check"><input type="checkbox" id="isVisible" name="isVisible" />' +
              '<span>Visible<small>Hidden markers stay in History and can be shown again.</small></span></label>'
            : '') +
        '</div>' +
        (editing && isEditor
          ? '<label for="markerSummary">Edit Summary</label>' +
            field('fa-comment-alt', '<input type="text" class="form-control" id="markerSummary" name="summary" maxlength="255" placeholder="What did you change? (optional)" />')
          : '') +
        '<input type="hidden" name="game" value="' + esc(this.mapOptions.id) + '" />' +
        '<input type="hidden" name="userId" value="' + esc(user.id) + '" />' +
        (editing ? '<input type="hidden" name="markerId" value="' + esc(vMarker.id) + '" />' : '') +
        '<input type="hidden" name="submapId" value="' + esc(submapId) + '" />' +
        '<p class="admin-user-status" role="status" aria-live="polite"></p>' +
        '<button type="submit" class="infoWindowIcn form-action-button">' + (editing ? 'Save Changes' : 'Add Marker') + '</button>' +
      '</form>' +
    '</div>';

  // The pin follows the coordinate fields, and goes back if the edit isn't saved.
  var pin = editing ? vMarker : newMarker;
  var originalLatLng = pin && pin.getLatLng ? pin.getLatLng() : null;
  var restorePin = function() {
    if (pin && originalLatLng && pin.setLatLng) pin.setLatLng(originalLatLng);
  };
  var backToMarker = editing ? this._wikiBackToMarker(vMarker.id) : null;
  var formType = editing ? 'markerEdit-' + vMarker.id : 'newMarker';
  // Leaving the editor any other way puts the pin back too.
  this._pendingPinRestore = { type: formType, restore: restorePin };
  if (!this._pinRestoreWatched) {
    this._pinRestoreWatched = true;
    this.mapControl.addHandler('afterSetContent', function(vContent, vType) {
      var pending = _this._pendingPinRestore;
      if (!pending || vType === pending.type) return;
      _this._pendingPinRestore = null;
      pending.restore();
    });
  }
  this.mapControl._nextPageBack = editing ? function() { restorePin(); backToMarker(); } : null;
  this.mapControl._navigatingForward = true;
  this.mapControl.setContent(html, editing ? 'markerEdit-' + vMarker.id : 'newMarker');
  if (this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerLarge();

  var form = $('#newMarkerForm');
  form.find('#markerTitle').val(editing ? vMarker.title : '');
  // Clicked spots get two decimals; saved ones keep what they have.
  var initial = function(value) { return editing ? String(value) : String(Math.round(value * 100) / 100); };
  form.find('#markerX').val(initial(vLatLng.lng));
  form.find('#markerY').val(initial(vLatLng.lat));
  var initialZ = editing && vMarker.z != null && vMarker.z !== '' ? vMarker.z : markupZ;
  form.find('#markerZ').val(initialZ != null ? String(initialZ) : '');
  form.find('#markerX, #markerY').on('input', function() {
    var x = Number(form.find('#markerX').val());
    var y = Number(form.find('#markerY').val());
    if (!pin || !pin.setLatLng || form.find('#markerX').val() === '' || form.find('#markerY').val() === '' ||
        !isFinite(x) || !isFinite(y)) return;
    pin.setLatLng([y, x]);
  });
  if (editing) form.find('#categoryId').val(String(vMarker.categoryId));
  form.find('#markerDescription').val(editing ? (vMarker.description || '') : '');
  form.find('#isGlobal').prop('checked', editing && vMarker.globalMarker == 1);
  form.find('#isVisible').prop('checked', editing && vMarker.dbVisible == 1);

  var sections = form.find('.marker-edit-sections');
  var editorOptions = {
    skin: 'oxide-dark',
    content_css: 'dark',
    menubar: false,
    statusbar: false,
    branding: false,
    plugins: 'lists link image media table code autoresize paste',
    toolbar: 'bold italic | bullist numlist | link image media | table | removeformat code',
    toolbar_mode: 'wrap',
    min_height: 160,
    max_height: 520,
    autoresize_bottom_margin: 12,
    // Keep links and uploads as written: 'uploads/…', not '../uploads/…'.
    convert_urls: false,
    image_dimensions: false,
    content_style:
      'body { margin: 12px; background: #1e1e20; color: #fff; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; font-size: 15px; line-height: 1.45; }' +
      'a { color: #8fd8ff; }' +
      'img { max-width: 100%; height: auto; }'
  };
  if (isEditor) {
    editorOptions.automatic_uploads = true;
    editorOptions.images_file_types = 'jpeg,jpg,png,gif,webp';
    editorOptions.images_upload_handler = function(blobInfo, success, failure) {
      var upload = new FormData();
      upload.append('file', blobInfo.blob(), blobInfo.filename());
      $.ajax({
        type: 'POST', url: 'ajax.php?command=upload_marker_image', data: upload,
        processData: false, contentType: false, dataType: 'json'
      }).done(function(result) {
        if (result.success) success(result.location);
        else failure(result.msg || 'The image could not be uploaded.', { remove: true });
      }).fail(function(xhr) {
        failure(_this._wikiError(xhr, 'The image could not be uploaded.'), { remove: true });
      });
    };
  }
  var renumber = function() {
    var all = sections.children('.marker-edit-section');
    all.each(function(i) {
      $(this).find('.marker-edit-section-name').text(all.length > 1 ? 'Section ' + (i + 1) : 'Section');
      $(this).find('.marker-edit-section-remove').prop('hidden', all.length < 2);
    });
  };
  var sectionCount = 0;
  var addSection = function(content) {
    var id = 'tabText' + (sectionCount++);
    var section = $(
      '<div class="marker-edit-section">' +
        '<div class="marker-edit-section-head"><span class="marker-edit-section-name"></span>' +
          '<button type="button" class="marker-edit-section-remove" aria-label="Remove section"><i class="fas fa-times" aria-hidden="true"></i></button></div>' +
        '<textarea class="tabText" name="tabText[]" id="' + id + '"></textarea>' +
      '</div>'
    );
    section.find('textarea').val(content || '');
    sections.append(section);
    renumber();
    if (window.tinymce) tinymce.init(Object.assign({ target: section.find('textarea')[0] }, editorOptions));
    section.find('.marker-edit-section-remove').on('click', function() {
      var editor = window.tinymce && tinymce.get(id);
      var empty = !editor || !editor.getContent().trim();
      if (!empty && !window.confirm('Remove this section and its content?')) return;
      if (editor) editor.remove();
      section.remove();
      renumber();
    });
  };
  var tabs = editing && vMarker.tabText && vMarker.tabText.length ? vMarker.tabText : [''];
  tabs = tabs.map(function(text) {
    return (text || '').replace(new RegExp(coordMarkup.source, 'gi'), '');
  });
  tabs.forEach(addSection);
  $('#add_field_button').on('click', function(e) {
    e.preventDefault();
    addSection('');
  });

  var status = form.find('.admin-user-status');
  form.on('submit', function(e) {
    e.preventDefault();
    if (window.tinymce) tinymce.triggerSave();
    var submit = form.find('button[type="submit"]').prop('disabled', true);
    status.removeClass('error success').text('Saving…');
    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=add_marker',
      data: form.serialize(),
      dataType: 'json'
    }).done(function(data) {
      submit.prop('disabled', false);
      if (!data.success) {
        status.addClass('error').text(data.msg || 'The marker could not be saved.');
        return;
      }
      if (window.tinymce) tinymce.remove();
      _this._pendingPinRestore = null;
      if (user.level < 5) {
        _this.mapControl.resetContent();
        toastr.success(_this.langMsgs.MARKER_ADD_SUCCESS_RESTRICTED);
        return;
      }
      var saved = jQuery.parseJSON(data.marker)[0];
      if (data.action != "ADD") {
        for (var i = 0; i < markers.length; i++) {
          if (markers[i].id == saved.id) {
            _this.map.removeLayer(markers[i]);
            markers[i].id = -1;
            markers[i].visible = 0;
            markers[i].categoryId = -1;
          }
        }
        delete _this.cachedMarkersById[saved.id];
      }
      _this.addMarker(saved);
      _this.map.addLayer(markers[markers.length - 1]);
      _this.mapControl._navigatingBack = editing;
      _this._createMarkerPopup(markers[markers.length - 1]);
      if (editing) toastr.success('Saved your changes to marker ' + saved.id + '.');
      else toastr.success(_this.langMsgs.MARKER_ADD_SUCCESS.format(saved.id));
    }).fail(function(xhr) {
      submit.prop('disabled', false);
      status.addClass('error').text(_this._wikiError(xhr, 'The marker could not be saved. Check your connection.'));
    });
  });
};
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
    window.addEventListener('online', function() { _this.syncOfflineChanges(); });
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
   completedMarkers = vComplete;
};

ZMap.prototype._setMarkerDone = function(vID, vComplete) {
  if (vComplete) {
    _this._doSetMarkerDoneAndCookie(zMap.cachedMarkersById[vID]);
  } else {
    _this._doSetMarkerUndoneAndCookie(zMap.cachedMarkersById[vID]);
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
   vMarker.setIcon(_this._createMarkerIcon(vMarker.categoryId, vComplete));
}

ZMap.prototype._doSetMarkerDoneAndCookie = function(vMarker) {
  if (completedMarkers.some((cMId) => cMId == vMarker.id)) {
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
      }
    });
  } else {
    this._completeSetMarkerDoneAndCookie(vMarker);
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
    _this.mapControl.resetContent();
    _this.refreshMap();
  }
}

ZMap.prototype._doSetMarkerUndoneAndCookie = function(vMarker) {
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
      }
    });
  } else {
    vMIdx = completedMarkers.indexOf(vMarker.id);
    if (vMIdx >= 0) completedMarkers.splice(vMIdx, 1);
    _this._doSetMarkerDoneIcon(vMarker, false);
    setCookie('completedMarkers', JSON.stringify(completedMarkers));
    _this.categories[vMarker.categoryId].complete--;
  }
  vMarker.complete = false;
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
    newMarker = new L.marker(e.latlng).addTo(this.map);
    _this.map.contextmenu.hide();
    _this.map.panTo(e.latlng);
    _this._createMarkerForm(null, e.latlng);
  }

   function login() {
      _this._createLoginForm();
   }

   // Create context options
   var contextMenu;

   if (user == null) {
      contextMenu = [{
         text: 'Login',
         hideOnSelect: true,
         callback: login
      }];
   } else {
      contextMenu = [{
         text: 'Add Marker',
         hideOnSelect: true,
         callback: addMarker
      }];
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

  if (user != null) {
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
   var registrationSource = completeTarget ? 'complete' : (this._pendingBookmarkRegistration ? 'bookmark' : 'account');
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
                                    '<button type="submit" class="infoWindowIcn form-action-button">' + (completeTarget ? 'Register &amp; Save Markers' : registrationTarget ? 'Register &amp; Add Bookmark' : 'Register') + '</button>'+
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

ZMap.prototype._createLostPasswordForm = function() {
   this.mapControl.setContent('<div id="lostpassword">'+
                        '<h3 class="text-center">' + this.langMsgs.LOST_PASSWORD_WELCOME + '</h3>'+
                        '<form class="leaflet-control-layers-list" role="lostpasswordform" id="lostpasswordform" enctype="multipart/form-data">'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="fas fa-envelope" aria-hidden="true"></i></span>'+
                                   '<input type="text" class="form-control" name="email" id="email" required="" placeholder="Enter your email address"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="modal-footer">'+
                                 '<div>'+
                                    '<button type="submit" class="infoWindowIcn form-action-button">Reset Password</button>'+
                                 '</div>'+
                               '</div>'+
                        '</form>'+
                     '</div>'
   , 'lostPasswordForm');


   $("#lostpasswordform").submit(function(e) {
      $.ajax({
        type: "POST",
        async: false,
        url: "ajax.php?command=lost_password",
        data: $("#lostpasswordform").serialize(), // serializes the form's elements.
        success: function(data) {
          //data = jQuery.parseJSON(data);
          if (data.success) {
            toastr.success(_this.langMsgs.LOST_PASSWORD_SUCCESS);
            _this.mapControl.resetContent();
          } else {
            toastr.error(_this.langMsgs.LOST_PASSWORD_ERROR.format(data.msg));
          }
        }
      });

      e.preventDefault();
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
                        '<p class="text-center" id="resetpassword_status">' + this.langMsgs.RESET_PASSWORD_CHECKING + '</p>'+
                        '<form class="leaflet-control-layers-list" role="resetpasswordform" id="resetpasswordform" hidden>'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                   '<input type="password" class="form-control" name="password" id="resetpassword_new" required="" minlength="8" maxlength="72" placeholder="Enter a new password (8+ characters)" autocomplete="new-password"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="form-group">'+
                             '<div class="cols-sm-10">'+
                                '<div class="input-group">'+
                                   '<span class="input-group-addon"><i class="icon-fa-lock fa-lg" aria-hidden="true"></i></span>'+
                                   '<input type="password" class="form-control" name="confirm" id="resetpassword_confirm" required="" minlength="8" maxlength="72" placeholder="Enter it again" autocomplete="new-password"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="modal-footer">'+
                             '<div>'+
                                '<button type="submit" class="infoWindowIcn form-action-button">Change Password</button>'+
                             '</div>'+
                           '</div>'+
                        '</form>'+
                        '<div class="modal-footer" id="resetpassword_expired" hidden>'+
                           '<div>'+
                              '<button id="resetpassword_again_btn" type="button" class="infoWindowIcn form-action-button">Request a New Link</button>'+
                           '</div>'+
                        '</div>'+
                     '</div>'
   , 'resetPasswordForm');
   this._lockWhileOffline('#resetpassword', { dim: '#resetpasswordform' });

   var showExpired = function() {
      $('#resetpassword_status').text(_this.langMsgs.RESET_PASSWORD_INVALID);
      $('#resetpasswordform').prop('hidden', true);
      $('#resetpassword_expired').prop('hidden', false);
   };

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
      $('#resetpassword_status').prop('hidden', true);
      $('#resetpasswordform').prop('hidden', false);
      $('#resetpassword_new').trigger('focus');
   }).fail(function() {
      $('#resetpassword_status').text(_this.langMsgs.GENERAL_ERROR.format(''));
   });

   $('#resetpasswordform').submit(function(e) {
      e.preventDefault();
      var password = $('#resetpassword_new').val();
      if(password !== $('#resetpassword_confirm').val()) {
         toastr.error(_this.langMsgs.RESET_PASSWORD_MISMATCH);
         $('#resetpassword_confirm').trigger('focus');
         return;
      }
      var button = $('#resetpasswordform button[type="submit"]').prop('disabled', true);
      $.ajax({
        type: 'POST',
        url: 'ajax.php?command=reset_password',
        data: { token: token, password: password }
      }).done(function(data) {
         if(data.success) {
            forgetToken();
            toastr.success(_this.langMsgs.RESET_PASSWORD_SUCCESS);
            _this._createLoginForm();
         } else if(data.field === 'password') {
            toastr.error(_this.langMsgs.RESET_PASSWORD_ERROR.format(data.msg));
            button.prop('disabled', false);
         } else {
            // The link was used or expired between the check and now.
            showExpired();
         }
      }).fail(function() {
         toastr.error(_this.langMsgs.RESET_PASSWORD_ERROR.format(''));
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
                                  'Save bookmarks &amp; dropped pins', 'Suggest edits to maps (coming soon!)'
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
  if(!this._drawerRoutingReady) return;
  var url = new URL(window.location.href);
  var page = this.drawerPageRoutes[contentType];
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

ZMap.prototype.restoreDrawerPage = function(page) {
  this._drawerRoutingReady = true;
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
  var authenticatedRoutes = {
    account: '_createAccountForm',
    'account-information': '_createAccountInformationForm',
    'offline-maps': '_createOfflineMapsForm',
    bookmarks: '_createBookmarksPage',
    admin: '_createAdminPage',
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
  { level: 10, label: 'Admin' }
];

// opts.restore: coming back from an account, so show the search, results and
// scroll position as they were instead of starting over.
ZMap.prototype._createAdminPage = function(opts) {
  var _this = this;
  var saved = opts && opts.restore ? this._adminState : null;
  this.mapControl.setContent(
    '<div id="admin">' +
      '<h3 class="text-center">Admin</h3>' +
      // Two tabs: the stats, and finding and managing accounts.
      '<div class="admin-tabs" role="tablist" aria-label="Admin">' +
        '<button type="button" role="tab" id="admin_tab_analytics" aria-controls="admin_panel_analytics" data-admin-tab="analytics">' +
          '<i class="fas fa-chart-bar" aria-hidden="true"></i>Analytics</button>' +
        '<button type="button" role="tab" id="admin_tab_users" aria-controls="admin_panel_users" data-admin-tab="users">' +
          '<i class="fas fa-users" aria-hidden="true"></i>Users</button>' +
      '</div>' +
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
      '<section data-section="usage" class="admin-section admin-analytics-section">' +
        '<h4 class="admin-section-heading">Feature Adoption <span id="admin_usage_total" class="admin-muted admin-section-summary"></span></h4>' +
        '<div id="admin_usage" class="admin-usage"><p class="admin-muted">Loading…</p></div>' +
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
          [['role', 'Role', [['', 'All'], ['admin', 'Admins'], ['contributor', 'Contributors'], ['user', 'Users']]],
           ['status', 'Status', [['', 'All'], ['active', 'Active'], ['disabled', 'Disabled'], ['banned', 'Banned'], ['deleted', 'Deleted']]],
           ['source', 'Signed Up From', [['', 'All'], ['bookmark', 'Bookmark'], ['complete', 'Complete'], ['account', 'Account'], ['unknown', 'Untracked']]],
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
    activity: { markers: { metric: 'completes', range: '30d' }, offline: { metric: 'downloads', range: '30d' } },
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
  };
  $('#admin [data-admin-tab]').on('click', function() {
    showTab(this.getAttribute('data-admin-tab'));
  }).on('keydown', function(e) {
    if(e.key !== 'ArrowLeft' && e.key !== 'ArrowRight') return;
    e.preventDefault();
    var next = state.tab === 'analytics' ? 'users' : 'analytics';
    showTab(next);
    $('#admin [data-admin-tab="' + next + '"]').trigger('focus');
  });
  showTab(state.tab || 'analytics', false);


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
  state.activity = state.activity || { markers: { metric: 'completes', range: '30d' }, offline: { metric: 'downloads', range: '30d' } };
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
        section.find('.admin-activity-total').text(data.summary.total.current.toLocaleString() + ' ' +
          (_this.ADMIN_CHART_NOUNS[data.metric] || ['saved'])[0]);
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
          section.find('.admin-activity-summary, .admin-offline-games, .admin-top-markers').empty();
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
    $('#admin_usage').empty().append(_this._adminFeatureUsage(data));
    var most = (data.usage || []).slice().sort(function(a, b) { return (b.people || 0) - (a.people || 0); })[0];
    $('#admin_usage_total').text(most && most.people ? 'Most used: ' + most.label : '');
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
      $('#admin_signups, #admin_usage').html('<p class="admin-muted">Unable to load stats. Try again.</p>');
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
  registrations: ['new accounts', 'New accounts'],
  active: ['active users', 'Active users'],
  completes: ['completes', 'Completed markers'],
  bookmarks: ['bookmarks', 'Bookmarks'],
  downloads: ['downloads', 'Offline map downloads']
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
    var box = $('<div class="admin-stat"><span class="admin-stat-label"></span><span class="admin-stat-value"></span>' +
      '<span class="admin-stat-change"></span></div>');
    box.attr('title', item[2]);
    box.find('.admin-stat-label').text(item[1]);
    box.find('.admin-stat-value').text(stat.current.toLocaleString());
    if(stat.previous === null) {
      box.find('.admin-stat-change').text(data.people.toLocaleString() + (data.people === 1 ? ' person' : ' people'));
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
    nodes.append($('<p class="admin-muted"></p>').text(completes ? 'No markers completed in this time frame.' : 'No markers bookmarked in this time frame.'));
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
          _this.goTo({ marker: marker.markerId });
        } else if(marker.game) {
          var url = new URL(window.location.href.split('?')[0]);
          url.searchParams.set('game', marker.game);
          url.searchParams.set('marker', marker.markerId);
          window.location.href = url.href;
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
    nodes.append('<p class="admin-muted">No offline maps downloaded yet.</p>');
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

ZMap.prototype._adminFeatureUsage = function(data) {
  var grid = $('<div class="admin-usage-grid"></div>');
  (data.usage || []).forEach(function(item) {
    var tile = $('<div class="admin-stat"><span class="admin-stat-label"></span><span class="admin-stat-value"></span>' +
      '<span class="admin-stat-change"></span></div>');
    tile.find('.admin-stat-label').text(item.label);
    tile.find('.admin-stat-value').text(Number(item.people || 0).toLocaleString());
    tile.find('.admin-stat-change').text(
      (item.people === 1 ? 'person' : 'people') + ' · ' + Number(item.items || 0).toLocaleString() + ' ' + item.unit +
      (data.accounts ? ' · ' + Math.round((item.people || 0) / data.accounts * 1000) / 10 + '% of accounts' : '')
    );
    grid.append(tile);
  });
  if(!grid.children().length) return $('<p class="admin-muted">Nothing to show yet.</p>');
  return grid;
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
  this.adminRoles.forEach(function(role) {
    levelSelect.append($('<option></option>').val(role.level).text(role.label));
  });
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
      list.append($('<li class="admin-muted"></li>').text('No changes by admins yet.'));
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

// A change log entry as a sentence, e.g. "Role: User → Admin, email changed".
ZMap.prototype._adminLogText = function(entry) {
  var _this = this;
  var details = entry.details || {};
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
  window.addEventListener('online', update);
  window.addEventListener('offline', update);
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
         '<div>' +
           (user.level >= 5 ? '<button id="account_notifications_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-bell account-nav-icon" aria-hidden="true"></i>Notifications<span class="account-nav-count" hidden></span></button>' : '') +
           (user.level >= 5 ? '<button id="account_profile_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-id-badge account-nav-icon" aria-hidden="true"></i>Profile</button>' : '') +
           (user.level >= 10 ? '<button id="account_admin_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-shield-alt account-nav-icon" aria-hidden="true"></i>Admin</button>' : '') +
           '<button id="account_information_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-user account-nav-icon" aria-hidden="true"></i>Account Information</button>' +
           '<button id="account_bookmarks_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-bookmark account-nav-icon" aria-hidden="true"></i>Bookmarks</button>' +
           '<button id="account_offline_maps_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-download account-nav-icon" aria-hidden="true"></i>Download Offline Maps</button>' +
           '<button id="account_clear_completed_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-undo account-nav-icon" aria-hidden="true"></i>Reset Completed Markers</button>' +
           '<button id="log_out_btn" type="button" class="infoWindowIcn account-nav-button"><i class="fas fa-sign-out-alt account-nav-icon" aria-hidden="true"></i>Log Out</button>' +
           '<button id="account_delete_btn" type="button" class="infoWindowIcn bad">Delete Account</button>' +
         '</div>' +
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
    _this._openNotificationsPage(function() { _this._createAccountForm(_this.getUser()); });
  });
  if (this.setNotificationCount) this.setNotificationCount(this.notificationCount);
  $('#account_profile_btn').click(function() {
    _this._openUserProfile({ id: user.id }, function() { _this._createAccountForm(_this.getUser()); });
  });
  $('#account_information_btn').click(function() {
    _this._createAccountInformationForm();
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


  $("#account_delete_btn").click(function(e) {
     _this._createAccountDeleteForm();
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
      '</form>' +
    '</div>', 'accountInformationPage'
  );
  $('#account_username').val(user.username);
  $('#account_name').val(user.name || '');
  $('#account_email').val(user.email || '');
  this._lockWhileOffline('#account_information', { dim: '#account_information_form' });
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
  cacheName: function(gameId) {
    return 'zeldamaps-offline-' + gameId;
  },
  storageKey: function(gameId) {
    return 'zeldamapsOfflineMap-' + gameId;
  },
  // Each saved tile's size and modified time, to tell which ones an update
  // replaces. Kept in the pack's own cache.
  indexURL: 'offline-pack-index.json',
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
        var record = this.read(gameId);
        if(record && (record.status === 'downloaded' || (!record.status && record.downloadedAt))) ids.push(gameId);
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
    window.addEventListener('online', function() { _this.checkOfflineMapUpdates(); });
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
      return ZMapOfflinePacks.needsUpdate(record, game) && record.dismissedUpdate !== ZMapOfflinePacks.updateKey(game);
    });
    if(!outdated.length || document.getElementById('offline-map-update-alert')) return;
    var names = outdated.map(function(game) { return game.name; });
    var nameList = names.length > 1
      ? names.slice(0, -1).join(', ') + ' and ' + names[names.length - 1]
      : names[0];
    _this._showAlert({
      id: 'offline-map-update-alert',
      title: outdated.length > 1 ? 'Map Updates Available' : 'Map Update Available',
      description: 'There ' + (outdated.length > 1 ? 'are updates' : 'is an update') +
        ' for your offline ' + $('<span>').text(nameList).html() + ' ' +
        (outdated.length > 1 ? 'maps' : 'map') + '. Download ' +
        (outdated.length > 1 ? 'them' : 'it') + ' now?',
      actions: [
        {
          label: 'Update',
          onSelect: function() { _this.openOfflineMapsPage({ autoUpdate: outdated.map(function(game) { return game.id; }) }); }
        },
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
      ]
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
    var downloadButton = card.find('.offline-map-download');
    var deleteButton = card.find('.offline-map-delete');
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
      downloadButton.text('Update').prop('disabled', false).removeClass('downloaded');
      deleteButton.show();
      status.text('An update is available for this map.');
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

  // What happened to a download, for Admin's Offline Maps stats.
  function reportOfflineEvent(game, event, bytes) {
    try {
      var data = { game: game.id, event: event };
      if(bytes > 0) data.bytes = Math.round(bytes);
      $.post('ajax.php?command=offline_map_event', data);
    } catch(e) {}
  }

  function downloadTiles(game, card) {
    var progress = card.find('.offline-map-progress');
    var progressLabel = card.find('.offline-map-progress-label');
    var status = card.find('.offline-map-status');
    var downloadButton = card.find('.offline-map-download');
    var cacheName = packCacheName(game.id);
    var completedTiles = 0;
    var completedBytes = 0;
    var totalTiles = game.tileCount;
    var totalBytes = game.size;
    var existingRecord = readPackRecord(game.id);
    // An update replaces only tiles whose size or modified time changed.
    var isUpdate = !!existingRecord && (
      existingRecord.pendingUpdate || card.data('packState') === 'update'
    );
    var oldIndex = null;
    var newIndex = {};
    var newVersion = null;
    var dataURLs = [];
    var embeddedImages = new Set();
    var savingEmbeddedImages = false;
    function collectImages(data) {
      ZMapOfflinePacks.embeddedImageURLs(data, document.baseURI).forEach(function(url) { embeddedImages.add(url); });
    }
    // Marker images often live on other sites. One that's missing or slow
    // is left out (its marker shows no image offline) rather than failing
    // the whole download.
    var EMBEDDED_IMAGE_TIMEOUT = 20000;
    function skipEmbeddedImage(cache, url) {
      delete newIndex[url];
      return cache.delete(url).catch(function() {});
    }
    function verifyEmbeddedImage(cache, url) {
      if(!savingEmbeddedImages) return Promise.resolve();
      // Cross-origin fetch responses are opaque: a 404 can look successful.
      // Decode from the saved pack before counting the image as downloaded.
      return new Promise(function(resolve) {
        var image = new Image();
        var timer = window.setTimeout(failed, EMBEDDED_IMAGE_TIMEOUT);
        function failed() {
          window.clearTimeout(timer);
          image.onload = image.onerror = null;
          image.src = '';
          skipEmbeddedImage(cache, url).then(resolve);
        }
        image.onload = function() { window.clearTimeout(timer); resolve(); };
        image.onerror = failed;
        image.src = url;
      });
    }
    // fetch() has no time limit of its own: an unreachable host can hold a
    // download until the browser gives up minutes later.
    function fetchEmbeddedImage(url, options) {
      var controller = typeof AbortController === 'function' ? new AbortController() : null;
      var timer;
      var timeout = new Promise(function(resolve, reject) {
        timer = window.setTimeout(function() {
          if(controller) controller.abort();
          reject(new Error('Timed out'));
        }, EMBEDDED_IMAGE_TIMEOUT);
      });
      var request = fetch(url, controller ? Object.assign({ signal: controller.signal }, options) : options);
      return Promise.race([request, timeout]).finally(function() { window.clearTimeout(timer); });
    }

    downloadButton.prop('disabled', true).text(isUpdate ? 'Updating…' : 'Downloading…');
    progress.attr('max', Math.max(totalBytes, 1)).val(0).show();
    progressLabel.text('0%').show();
    status.removeClass('success error').text(isUpdate ? 'Preparing update…' : 'Preparing download…');

    function updateProgress(tileSize) {
      completedTiles += 1;
      completedBytes += tileSize || 0;
      if(savingEmbeddedImages) {
        progress.removeAttr('value');
        progressLabel.text('Saving marker images · ' + completedTiles + ' of ' + totalTiles + ' files');
        return;
      }
      var fraction = totalBytes > 0
        ? completedBytes / totalBytes
        : completedTiles / Math.max(totalTiles, 1);
      var percent = Math.min(100, Math.round(fraction * 100));
      progress.val(totalBytes > 0 ? completedBytes : completedTiles);
      progress.attr('max', totalBytes > 0 ? totalBytes : Math.max(totalTiles, 1));
      progressLabel.text(percent + '% · ' + completedTiles + ' of ' + totalTiles + ' files');
    }

    function downloadBatch(cache, tiles) {
      var index = 0;
      var workerCount = Math.min(6, tiles.length);
      var workers = [];
      function worker() {
        if(index >= tiles.length) return Promise.resolve();
        var tile = tiles[index++];
        // Tiles have absolute paths; marker images are relative to the site.
        var absoluteURL = new URL(tile.url, document.baseURI).href;
        var sameOrigin = new URL(absoluteURL).origin === window.location.origin;
        var signature = tile.size + ':' + tile.m;
        newIndex[absoluteURL] = signature;
        // Revalidate, so a replaced tile isn't served from the HTTP cache.
        var fetchOptions = sameOrigin
          ? {
              credentials: 'same-origin',
              redirect: 'follow',
              cache: 'no-cache'
            }
          : {
              mode: 'no-cors',
              credentials: 'omit',
              redirect: 'follow',
              cache: 'no-cache'
            };
        return cache.match(absoluteURL, { ignoreVary: true }).then(function(cachedResponse) {
          var unchanged = !isUpdate || (oldIndex && oldIndex[absoluteURL] === signature);
          if(cachedResponse && unchanged) {
            return (/\.json(?:\?|$)/i.test(absoluteURL) && cachedResponse.type !== 'opaque'
              ? cachedResponse.clone().json().then(collectImages) : Promise.resolve())
              .then(function() { return verifyEmbeddedImage(cache, absoluteURL); })
              .then(function() { updateProgress(tile.size); });
          }
          if(savingEmbeddedImages) {
            return fetchEmbeddedImage(absoluteURL, fetchOptions).then(function(response) {
              if(!response.ok && response.type !== 'opaque') throw new Error('Not found');
              return cache.put(absoluteURL, response.clone())
                .then(function() { return verifyEmbeddedImage(cache, absoluteURL); });
            }).catch(function() {
              return skipEmbeddedImage(cache, absoluteURL);
            }).then(function() { updateProgress(0); });
          }
          return fetch(absoluteURL, fetchOptions).then(function(response) {
            if(!response.ok && response.type !== 'opaque') {
              throw new Error('A map tile could not be downloaded.');
            }
            var inspect = /\.json(?:\?|$)/i.test(absoluteURL) && response.type !== 'opaque'
              ? response.clone().json().then(collectImages) : Promise.resolve();
            return inspect.then(function() { return cache.put(absoluteURL, response.clone()); })
              .then(function() { return verifyEmbeddedImage(cache, absoluteURL); }).then(function() {
              updateProgress(tile.size);
            });
          });
        }).then(worker);
      }
      for(var i = 0; i < workerCount; i++) workers.push(worker());
      return Promise.all(workers);
    }

    function downloadPage(cache, offset) {
      return fetch(
        'ajax.php?command=get_offline_maps&mode=manifest&game=' +
        encodeURIComponent(game.id) + '&offset=' + offset + '&limit=250'
      ).then(function(response) {
        if(!response.ok) throw new Error('The map manifest could not be loaded.');
        return response.json();
      }).then(function(data) {
        if(!data.success) throw new Error(data.msg || 'The map manifest could not be loaded.');
        totalTiles = data.total;
        totalBytes = data.totalBytes;
        newVersion = data.version || null;
        return downloadBatch(cache, data.tiles).then(function() {
          var nextOffset = offset + data.tiles.length;
          if(nextOffset < data.total) return downloadPage(cache, nextOffset);
        });
      });
    }

    reportOfflineEvent(game, 'started', totalBytes);
    var persistenceRequest = navigator.storage && navigator.storage.persist
      ? navigator.storage.persist().catch(function() { return false; })
      : Promise.resolve(false);
    var storageCheck = persistenceRequest.then(function() {
      return navigator.storage && navigator.storage.estimate
        ? navigator.storage.estimate()
        : null;
    });

    storageCheck.then(function(estimate) {
      if(
        !existingRecord &&
        estimate && estimate.quota && estimate.usage + totalBytes * 1.1 > estimate.quota
      ) {
        throw new Error('This device does not have enough available browser storage for this map.');
      }
      return caches.open(cacheName);
    }).then(function(cache) {
      writePackRecord(game.id, {
        status: 'partial',
        size: totalBytes,
        tileCount: totalTiles,
        version: existingRecord && existingRecord.version,
        pendingUpdate: isUpdate,
        updatedAt: Date.now()
      });
      var indexRead = isUpdate
        ? cache.match(ZMapOfflinePacks.indexURL).then(function(response) {
            return response ? response.json() : null;
          }).then(function(index) { oldIndex = index && index.tiles; }).catch(function() {})
        : Promise.resolve();
      var containerURL = 'ajax.php?command=get_container&game=' + encodeURIComponent(game.id);
      dataURLs.push(containerURL);
      return indexRead.then(function() {
        return fetch(containerURL, { cache: 'no-cache' });
      }).then(function(response) {
        if(!response.ok) throw new Error('The offline map data could not be saved.');
        return response.json().then(function(containers) {
          if(!containers[0]) throw new Error('The offline map data could not be loaded.');
          return cache.put(containerURL, new Response(JSON.stringify(containers), {
            headers: { 'Content-Type': 'application/json' }
          })).then(function() {
            var saves = ['get_map', 'get_categories', 'get_markers'].map(function(command) {
              var url = 'ajax.php?command=' + command + '&game=' + containers[0].id;
              dataURLs.push(url);
              return fetch(url, { cache: 'no-cache' }).then(function(dataResponse) {
                if(!dataResponse.ok) throw new Error('The offline map data could not be saved.');
                return dataResponse.clone().json().then(collectImages).then(function() { return cache.put(url, dataResponse); });
              });
            });
            // The page itself, so switching to this game works offline.
            var pageURL = './?game=' + encodeURIComponent(game.id);
            dataURLs.push(pageURL);
            saves.push(fetch(pageURL, { cache: 'no-cache', credentials: 'same-origin' }).then(function(pageResponse) {
              if(pageResponse.ok) return cache.put(pageURL, pageResponse);
            }));
            return Promise.all(saves);
          });
        });
      }).then(function() {
        return downloadPage(cache, 0);
      }).then(function() {
        var images = Array.from(embeddedImages).filter(function(url) { return !newIndex[url]; });
        if(!images.length) return;
        savingEmbeddedImages = true;
        totalTiles += images.length;
        status.text('Saving embedded marker images…');
        return downloadBatch(cache, images.map(function(url) { return { url: url, size: 0, m: 0 }; }));
      }).then(function() {
        // Remove tiles the map no longer uses, then save the new index.
        var keep = {};
        dataURLs.concat(ZMapOfflinePacks.indexURL).forEach(function(url) {
          keep[new URL(url, window.location.href).href] = true;
        });
        return cache.keys().then(function(requests) {
          return Promise.all(requests.filter(function(request) {
            return !keep[request.url] && !newIndex[request.url];
          }).map(function(request) { return cache.delete(request); }));
        }).then(function() {
          return cache.put(ZMapOfflinePacks.indexURL, new Response(
            JSON.stringify({ version: newVersion, tiles: newIndex }),
            { headers: { 'Content-Type': 'application/json' } }
          ));
        });
      });
    }).then(function() {
      writePackRecord(game.id, {
        status: 'downloaded',
        assetsVersion: ZMapOfflinePacks.assetsVersion,
        size: totalBytes,
        tileCount: totalTiles,
        version: newVersion,
        downloadedAt: Date.now()
      });
      game.version = newVersion;
      progress.hide();
      progressLabel.hide();
      setPackState(card, game, 'downloaded');
      reportOfflineEvent(game, isUpdate ? 'updated' : 'downloaded', totalBytes);
    }).catch(function(error) {
      reportOfflineEvent(game, 'failed', completedBytes);
      progress.hide();
      progressLabel.hide();
      caches.open(cacheName).then(function(cache) {
        return cache.keys();
      }).then(function(cachedTiles) {
        if(cachedTiles.length > 0) {
          writePackRecord(game.id, {
            status: 'partial',
            size: totalBytes,
            tileCount: totalTiles,
            version: existingRecord && existingRecord.version,
            pendingUpdate: isUpdate,
            updatedAt: Date.now()
          });
          setPackState(card, game, 'partial');
          var interrupted = isUpdate ? 'The map update was interrupted.' : 'The map download was interrupted.';
          var message = error instanceof TypeError || !error.message ? interrupted : error.message;
          if(!/[.!?]$/.test(message)) message += '.';
          status.addClass('error').text(message + ' Tap Resume to continue.');
        } else {
          caches.delete(cacheName);
          removePackRecord(game.id);
          setPackState(card, game, null);
          status.addClass('error').text(
            error.message || 'The map download could not be started.'
          );
        }
      });
    });
  }

  function renderGame(game) {
    var card = $('<section>', { class: 'offline-map-card' });
    var heading = $('<div>', { class: 'offline-map-heading' });
    var gameInfo = Object.values(games || {}).find(function(entry) {
      return entry.shortName == game.id;
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
        return null;
      }
      var state = (
        packRecord.status === 'downloaded' ||
        (!packRecord.status && packRecord.downloadedAt)
      ) ? 'downloaded' : 'partial';
      setPackState(card, game, state);
      return caches.open(packCacheName(game.id)).then(function(cache) {
        return cache.keys();
      }).then(function(requests) {
        // Saved files (tiles and marker images) have no query string.
        var tileCount = requests.filter(function(request) {
          var url = new URL(request.url);
          return !url.search && url.pathname.slice(-ZMapOfflinePacks.indexURL.length) !== ZMapOfflinePacks.indexURL;
        }).length;
        // The browser removed some files.
        if(tileCount < packRecord.tileCount) {
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
      if(!window.confirm('Remove the downloaded ' + game.name + ' maps from this device?')) return;
      caches.delete(packCacheName(game.id)).then(function() {
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
    return { id: game.shortName, name: game.name };
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
      list.empty().append('<p class="offline-map-status error">No offline maps are currently available.</p>');
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
      !!vGoTo.centerInVisibleArea
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
  centerInVisibleArea = false
) {
  var marker = this.cachedMarkersById[vMarkerId];
  if (marker) {
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
     _this._createMarkerPopup(marker, centerInVisibleArea);
     if(centerInVisibleArea) {
       this._setViewAtMarkerInVisibleArea(marker, vZoom);
     } else {
       this.map.setView(latlng, vZoom);
     }
     if (vPin) {
         newMarker = L.marker(marker._latlng).addTo(this.map);
     }

     //$('#mkrDiv'+vMarkerId).unslider({arrows:false});
     if (vPanTo) {
        this.map.panTo(marker.getLatLng());
     }
     return;
   }

   toastr.error(_this.langMsgs.GO_TO_MARKER_ERROR.format(vMarkerId));
}

ZMap.prototype._setViewAtMarkerInVisibleArea = function(marker, zoom) {
  var mapRect = this.map.getContainer().getBoundingClientRect();
  var mapSize = this.map.getSize();
  var visibleLeft = 0;
  var visibleRight = mapRect.width;
  var visibleTop = 0;
  var visibleBottom = mapRect.height;

  if(this.mapControl.viewStyleBottomSlide) {
    var mobileDrawerRect = this.mapControl._container.getBoundingClientRect();
    visibleBottom = Math.max(
      0,
      Math.min(mapRect.height, mobileDrawerRect.top - mapRect.top)
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

  this.map.setView(this.map.unproject(centerPoint, zoom), zoom, {
    animate: false
  });
};

ZMap.prototype.getMarkers = function() {
  return markers;
};
//****************************************************************************//
//*************                                                  *************//
//*************                    END - GO TO                   *************//
//*************                                                  *************//
//****************************************************************************//


ZMap.prototype.updateUrl = function() {
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
