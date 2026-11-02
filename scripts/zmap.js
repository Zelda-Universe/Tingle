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

      LOGIN_WELCOME  : "Hey, listen!<br />Welcome back!",
      LOGIN_SUCCESS : "Hey, listen! Welcome back, %1!",
      LOGIN_ERROR   : "I AM ERROR. %1",

      ACCOUNT_TITLE  : "Account",

      REGISTER_WELCOME  : "It's dangerous to go alone! We're glad you're here with us.",
      REGISTER_SUCCESS : "Excuuuuse me, %1! Your account has been successfully created!",
      REGISTER_ERROR   : "I AM ERROR! %1",

      LOST_PASSWORD_WELCOME: "Let's fill out Saria's<br />password recovery form!",
      LOST_PASSWORD_SUCCESS: "Saria sent a new password to your email!",
      LOST_PASSWORD_ERROR: "I AM ERROR. You ended up back at the beginning! %1",

      CHANGE_PASSWORD_WELCOME: "Change Your Password",
      CHANGE_PASSWORD_SUCCESS: "Excuuuuse me, %1! Your password has been successfully updated!",
      CHANGE_PASSWORD_ERROR: "I AM ERROR. Could not update password. Try again.  %1",

      DELETE_ACCOUNT_WELCOME: "Delete your account",
      DELETE_ACCOUNT_SUCCESS: "Account has been deleted.",
      DELETE_ACCOUNT_ERROR: "Account could not be deleted: %1",

      MARKER_COMPLETE_WARNING : "You're not logged in, so your completed markers will be stored in a cookie. Log in or create an account to save your markers in our database.",

      MARKER_ADD_COMPLETE_ERROR : "I AM ERROR. This marker couldn’t be saved to our database. %1",
      MARKER_DEL_COMPLETE_ERROR : "I AM ERROR. This marker couldn’t be deleted from our database. %1",
      MARKER_COMPLETE_TRANSFER_ERROR : "I AM ERROR. There seems to be a problem moving your completed markers from cookies to our database. We'll automatically try again later. %1",
      MARKER_COMPLETE_TRANSFER_SUCCESS : "All of your completed markers were moved from cookies to our database and tied to your account.",
      MARKER_COMPLETE_TRANSFER_PARTIAL_SUCCESS : "We tried moving your completed markers from cookies to our database and tied to your account, but an error occurred. We try again the next time you login.",
      MARKER_DEL_ALL_COMPLETE_SUCCESS : "You have an amazing wisdom and power! All completed markers have been successfully reset.",
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

   // If only one submap exists, we just add it without any overlay
  if (
        vMap.subMap.length == 1
    &&  vMap.subMap[0].submapLayer.length == 0
  ) {
    var tLayer = L.tileLayer(
      this.tilesBaseURL
      + vMap.subMap[0].tileURL
      + this.tileNameFormat
      + '.'
      + vMap.subMap[0].tileExt
      , {
          maxZoom           : vMap.maxZoom
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
        , iconURL           : this.defaultIconURL
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
      var tLayer = L.tileLayer(this.tilesBaseURL + vMap.subMap[0].tileURL + 'blank.png'
                                           , { maxZoom:           vMap.maxZoom
                                             , noWrap:            true
                                             , tileSize:          this.mapOptions.tileSize
                                             , updateWhenIdle:    false
                                             , updateWhenZooming: true
                                             , keepBuffer:        4
                                             , label:             vMap.name
                                             , iconURL:           this.defaultIconURL + vMap.subMap[0].tileURL + 'icon.' + vMap.subMap[0].tileExt
                                             }
      );

    tLayer.id          = 'mID' + vMap.id;
    tLayer.originalId  = vMap.id;
    tLayer.title       = vMap.name;
    tLayer._overlayMap = [];
    tLayer.defaultSubMapId = vMap.subMap[0].id;

    // Add all the submaps to the overlay array (including the first submap for control purposes)
    for (var i = 0; i < vMap.subMap.length; i++) {
       var overlay = L.tileLayer(this.tilesBaseURL + vMap.subMap[i].tileURL + this.tileNameFormat + '.' + vMap.subMap[i].tileExt
                                          , { maxZoom:           vMap.maxZoom
                                            , attribution:       vMap.mapCopyright + ', ' + vMap.subMap[i].mapMapper
                                            , opacity:           vMap.subMap[i].opacity
                                            , noWrap:            true
                                            , tileSize:          this.mapOptions.tileSize
                                            , updateWhenIdle:    false
                                            , updateWhenZooming: true
                                            , keepBuffer:        4
                                            , label:             vMap.name
                                            , iconURL:           this.defaultIconURL + vMap.subMap[i].tileURL + 'icon.' + vMap.subMap[i].tileExt
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

             var overlay2 = L.tileLayer(this.tilesBaseURL + submap.tileURL + '{z}_{x}_{y}.' + submap.tileExt
                                                                     , { maxZoom:           submap.maxZoom
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
};

ZMap.prototype.addMarker = function(vMarker) {
   if (vMarker == null) {
      return;
   }

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
   marker.tabUserName     = vMarker.tabUserName.split('<|>');
   marker.userId          = vMarker.userId;
   marker.userName        = vMarker.userName;
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
    if (_this.mapControl.options.collapsed) {
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

    var content = "<h2 class='popupTitle'>" + title + "</h2>" +
      "<p class='marker-coordinate-pill'>" + coordinateText + "</p>" +
      "<div class='marker-actions-row'>" +
        "<button type='button' id='check" + marker.id + "' class='marker-action-button infoWindowIcn " + (!marker.complete ? "unchecked" : "checked") + "' onclick=\"var button = document.getElementById('check" + marker.id + "'); var complete = button.classList.contains('unchecked'); button.classList.toggle('unchecked', !complete); button.classList.toggle('checked', complete); _this._setMarkerDone(" + marker.id + ", complete); return false\">" +
          "<span class='marker-action-icon'><i class='icon-" + (!marker.complete ? "checkbox-unchecked" : "checkmark") + "'></i></span>" +
          "<span class='marker-action-label'>" + (!marker.complete ? "Mark Complete" : "Completed") + "</span>" +
        "</button>" +
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

   if (user != null) {
      if (user.level >= 10 || (user.level >= 5 && marker.userId == user.id)) {
         content +=  "<p style='text-align: left; float:left; margin-right: 10px;'>Marker ID no. " + marker.id + "</p>"
                   + "<p style='text-align: right; float: right'>Added by " + marker.userName + "</p>"
                   + "<br style='height:0pt; clear:both;'>"
                     + "<span class=\"icon-pencil infoWindowIcn\" onclick=\"_this.editMarker("+marker.id+"); return false\"></span>"
                     + "<span class=\"icon-cross infoWindowIcn\" onclick=\"_this.deleteMarker("+marker.id+"); return false\"></span>";
      }
   }


  this.mapControl.setContent(content, 'm'+marker.id);
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
   if (this._getDisplayZoom() > this.mapOptions.switchIconsAtZoom) {
      return new markerIconMedium({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-medium ' style='background-color: " + this.categories[vCatId].color + "; "
                                                                      + "border-color: " + this.categories[vCatId].color + "'>"
                                       + "<span class='icon-" + this.categories[vCatId].img + " icnText-medium'></span>"
                                       + (vComplete?"<span class='icon-checkmark completeMarker completeMarker-Medium'></span>":"")
                                 + "</div>"
      });
   } else {
      return new markerIconSmall({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-small' style='background-color: " + this.categories[vCatId].color + "; "
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

ZMap.prototype._shouldShowMarker = function(marker) {
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
    && mapBounds.contains(marker.getLatLng())  // Is in the Map Bounds (PERFORMANCE)
    && (
      this.mapOptions.categorySelectionMethod != "focus"
      || !this.mapControl._categoryMenu.modeAutomatic
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
      && mapBounds.contains(marker.getLatLng())  // Is in the Map Bounds (PERFORMANCE)
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
  this._setupDroppedPinGesture();

  // TODO keyboard accessibility

  this.map.on('baselayerchange', function(e) {
    //@TODO: Fix this null value - (for light / dark) - this is when a layer updates
    //       Defaulting to the first layer for now - workaround!!!!!
    var defaultSubMapId;
    var i;
    for (i = 0; i < _this.maps.length; i++) {
      if (_this.maps[i].originalId == e.originalId) {
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

  $(document).on('keydown', function(e) {
    if(e.key == "Escape") {
      if(_this.mapControl._contentType != _this.mapControl.options.defaultContentType) {
        _this.mapControl.resetContent();
        _this._closeNewMarker()
      } else {
        _this.mapControl.toggle();
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
    ) {
      _this._closeNewMarker();
      _this.mapControl.resetContent();
    }

    if (
          ZConfig.getConfig('autoUpdateUrl'     ) != 'false'
      &&  ZConfig.getConfig('autoUpdateUrlMove' ) != 'false'
    ) {
		_this.updateUrl();
	  }
  });
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

ZMap.prototype._createDroppedPinLink = function(latlng) {
  var url = new URL(window.location.href);
  url.searchParams.delete('marker');
  url.searchParams.set('map', this.mapControl.getCurrentMap().mapId);
  url.searchParams.set('subMap', this.mapControl.getCurrentMap().subMapId);
  url.searchParams.set('zoom', this.map.getZoom());
  url.searchParams.set('x', latlng.lng.toFixed(4));
  url.searchParams.set('y', latlng.lat.toFixed(4));
  url.searchParams.set('droppedPin', 'true');
  return url.toString();
};

ZMap.prototype._openDroppedPin = function(latlng) {
  this._closeNewMarker();
  newMarker = L.marker(latlng).addTo(this.map);
  newMarker.droppedPin = true;

  var x = latlng.lng.toFixed(2);
  var y = latlng.lat.toFixed(2);
  var link = this._createDroppedPinLink(latlng);
  var content = '' +
    '<div class="dropped-pin-page">' +
      '<h3 class="text-center">Dropped Pin</h3>' +
      '<p class="dropped-pin-coordinates"><strong>Coordinates</strong><br>X: ' + x + '<br>Y: ' + y + '</p>' +
      '<button id="copy_dropped_pin_link" type="button" class="infoWindowIcn form-action-button">' +
        '<i class="fas fa-link" aria-hidden="true"></i> Copy Link to Pin' +
      '</button>' +
      '<p id="dropped_pin_copy_status" class="dropped-pin-copy-status" role="status" aria-live="polite"></p>' +
    '</div>';

  this.mapControl.setContent(content, 'droppedPin-' + L.Util.stamp(newMarker));
  this.mapControl.openDrawerSmall();

  $('#copy_dropped_pin_link').on('click', function() {
    var status = $('#dropped_pin_copy_status');
    if(navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(link).then(function() {
        status.text('Link copied.');
      }).catch(function() {
        window.prompt('Copy this link:', link);
      });
    } else {
      window.prompt('Copy this link:', link);
    }
  });
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
   _this._buildContextMenu();
   this.notifyUserChanged();

   if (user != null) {
      // Transfer cookies completed markers to database
      var cookieCompletedMarkers = getCookie('completedMarkers');
      if (cookieCompletedMarkers != undefined && cookieCompletedMarkers != null && cookieCompletedMarkers != "") {
         _this.transferCompletedMarkersToDB();
      } else {
         _this.getUserCompletedMarkers();
      }

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
    url: "ajax/del_marker.php",
    data: {markerId: vMarkerId, userId: user.id},
    success: function(data) {
      data = jQuery.parseJSON(data);
      if (data.success) {
        for (var i = 0; i < markers.length; i++) {
          // Just hide the marker on the marker array ... on reaload, query won't get it.
          if (markers[i].id == vMarkerId) {
            markers[i].visible = 0;
            markers[i].categoryId = -1;
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
        //alert(data.msg);
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

ZMap.prototype._createMarkerForm = function(vMarker, vLatLng, vPoly) {
   if (user == null) {
      toastr.error(_this.langMsgs.GENERAL_ERROR.format('You are not logged!'));
      return;
   }

   // Clean TinyMCE
   tinymce.remove();

   var catSelection = "";
   this.categoriesArr.forEach(function(entry) {
      catSelection = catSelection + '<option class="icon-BotW_Points-of-Interest" style="font-size: 14px;" value="'+ entry.id +'"' + (vMarker!=null&&vMarker.categoryId==entry.id?"selected":"") + '> ' + entry.name + '</option>';
   });

   var popupContent = '<h2 class="text-center popupTitle">'+ (vMarker!=null?vMarker.title:'New Marker') +'</h2>';

   if (user.level >= 5) {
      popupContent = popupContent +
         '<iframe id="form_target" name="form_target" style="display:none"></iframe>'+
         '<form id="imageUploadForm" action="content/upload.php" target="form_target" method="post" enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">'+
             '<input name="image" type="file" onchange="$(\'#imageUploadForm\').submit();this.value=\'\';">'+
             '<input style="display: none;" type="text" id="game" name="game" value="'+this.mapOptions.shortName+'" />'+
             '<input style="display: none;" type="text" id="userId" name="userId" value="' + user.id + '" />'+
         '</form>'
      ;
   }

   popupContent = popupContent +
         '<div id="markerForm">'+
            '<form class="leaflet-control-layers-list" role="newMarkerForm" id="newMarkerForm" enctype="multipart/form-data">'
   ;

   if (vMarker!=null && user!=null && user.level >= 10) {
      popupContent = popupContent +
               '<div id="isVisible" class="checkbox">'+
                  '<label>'+
                     '<input type="checkbox" id="isVisible" name="isVisible" '+(vMarker!=null&&vMarker.dbVisible==1?' checked':'')+'> Visible?'+
                  '</label>'+
               '</div>'
      ;
   }

   popupContent = popupContent +
               '<div class="form-group">'+
                  '<label for="categoryId" class="control-label">Category</label>'+
                     '<select class="form-control" name="categoryId" id="categoryId">'+ catSelection +'</select>'+
                  '<span class="help-block"></span>'+
               '</div>'+
               '<div class="form-group">'+
                  '<label for="markerTitle" class="control-label">Title</label>'+
                  '<input type="text" class="form-control" id="markerTitle" name="markerTitle" value="'+ (vMarker!=null?vMarker.title:'') + '" required="" title="Please enter a title for the marker" placeholder="Title of Marker">'+
                  '<span class="help-block"></span>'+
               '</div>'+
               '<div class="form-group">'+
                  '<label for="markerDescription" class="control-label">Description</label>'+
                  '<textarea type="text" class="form-control" id="markerDescription" name="markerDescription" value="" title="Please enter a description for the marker" placeholder="Internal Description (not visible to viewers)">'+ (vMarker!=null?vMarker.description:'') + '</textarea>'+
                  '<span class="help-block"></span>'+
               '</div>'+
               '<div id="isGlobal" class="checkbox">'+
                  '<label>'+
                     '<input type="checkbox" id="isGlobal" name="isGlobal" '+(vMarker!=null&&vMarker.globalMarker==1?' checked':'')+'> Global? (Ex: Appears on both Light World / Dark World)'+
                  '</label>'+
               '</div>'+
               '<input style="display: none;" type="text" id="game" name="game" value="' + this.mapOptions.id + '" />'+
               '<input style="display: none;" type="text" id="lat" name="lat" value="' + vLatLng.lat + '" />'+
               '<input style="display: none;" type="text" id="lng" name="lng" value="' + vLatLng.lng + '" />'+
               '<input style="display: none;" type="text" id="userId" name="userId" value="' + user.id + '" />'+
               (vMarker!=null ? '<input style="display: none;" type="text" id="markerId" name="markerId" value="'+vMarker.id+'" />' : '')+
               '<input style="display: none;" type="text" id="submapId" name="submapId" value="'+this.mapControl.getCurrentMap().subMapId+'" />'+
               '<div class="divTabBody">'
   ;

                        /*
                           '<div class="divTableRow">' +
                           '<div class="divTableCell"><label class="control-label col-sm-5"><strong>Tab Title (1): </strong></label></div>'+
                           '<div class="divTableCell tabTitle"><input size="38" type="string" placeholder="Title of Tab Content - Optional" class="form-control" id="tabTitle[]" name="tabTitle[]"></div>'+
                        '</div>'+
                        */
   if (vMarker!=null&&vMarker.tabText!=null) {
      for (var i = 0; i < vMarker.tabText.length; i++) {

         popupContent = popupContent +
                  '<div class="form-group">'+
                     '<label for="tabText'+i+'" class="control-label">Tab Text (' + (i+1) + ')</label>'+
                     '<textarea type="text" class="form-control tabText" name="tabText[]" id="tabText'+i+'" value="" placeholder="Please describe the marker">'+ (vMarker!=null?vMarker.tabText[i]:'') + '</textarea>'+
                     '<span class="help-block"></span>'+
                  '</div>';
      }
   } else {
      popupContent = popupContent +
                  '<div class="form-group">'+
                     '<label for="tabText0" class="control-label">Tab Text (1)</label>'+
                     '<textarea type="text" class="form-control tabText" name="tabText[]" id="tabText0" value="" placeholder="Please describe the marker"></textarea>'+
                     '<span class="help-block"></span>'+
                  '</div>';
   }

   popupContent = popupContent +
               '</div>'+
               '<div class="form-group">'+
                  '<div>'+
                     '<button id="add_field_button" type="button" class="infoWindowIcn form-action-button">Add more</button>'+
                  '</div>'+
               '</div>'+
               '<div class="modal-footer">'+
                  '<div>'+
                     '<button type="submit" class="infoWindowIcn form-action-button">Submit</button>'+
                  '</div>'+
               '</div>'
   ;

   popupContent = popupContent +
            '</form>'+
         '</div>'
   ;

   /*
   popupContent = popupContent +
                        if (vMarker!=null&&vMarker.tabText!=null) {
                           for (var i = 0; i < vMarker.tabText.length; i++) {
   popupContent = popupContent +
                        '<p style="vertical-align:top"><label class="control-label col-sm-5"><strong>Tab Text (' + (i+1) + '): </strong></label></p>'+
                        '<p><textarea id="tabText'+i+'" name="tabText[]" class="tabText" cols=40 rows=5>'+ (vMarker!=null?vMarker.tabText[i]:'')+'</textarea></p>'
                           }
                        } else {
   popupContent = popupContent +
                           '<p style="vertical-align:top"><label class="control-label col-sm-5"><strong>Tab Text (1): </strong></label></p>'+
                           '<p><textarea id="tabText0" name="tabText[]" class="tabText" cols=40 rows=5></textarea></p>'
                        }
   */
   this.mapControl.setContent(popupContent, 'newMarker');

   function initEditor() {
      var toolbarButtons = ['undo redo | styleselect | bullist numlist outdent indent | bold italic | link image media | fullscreen code'];
      var toolbarPlugins = ['lists link image anchor code','media table contextmenu paste fullscreen code'];
      if (user.level >= 5) {
         tinymce.init({selector:'textarea.tabText',
                     menubar: false,
                     plugins: [toolbarPlugins],
                     file_browser_callback: function(field_name, url, type, win) {
                        if (type=='image') $('#imageUploadForm input').click();
                     },
                     toolbar: toolbarButtons,
                     content_css: '//www.tinymce.com/css/codepen.min.css'
         });
      } else {
         tinymce.init({selector:'textarea.tabText',
                     menubar: false,
                     plugins: [toolbarPlugins],
                     toolbar: toolbarButtons,
                     content_css: '//www.tinymce.com/css/codepen.min.css'
         });
      }
   }
   initEditor();

   var wrapper         = $(".divTabBody"); //Fields wrapper
   var add_button      = $("#add_field_button"); //Add button ID

   $(add_button).click(function(e){ //on add input button click
      e.preventDefault();

      var c = ($('.tabText').length+1);
      $(wrapper).append(
               '<div class="form-group">'+
                  '<label for="tabText'+c+'" class="control-label">Tab Text (' + c + ')</label>'+
                  '<textarea type="text" class="form-control tabText" id="tabText'+c+'" name="tabText[]" value="" placeholder="Please describe the marker"></textarea>'+
                  '<span class="help-block"></span>'+
               '</div>'
                        );
      initEditor();
   });

   $("#newMarkerForm").submit(function(e) {
      $.ajax({
        type: "POST",
        url: "ajax.php?command=add_marker",
        data: $("#newMarkerForm").serialize(), // serializes the form's elements.
        success: function(data) {
          //data = jQuery.parseJSON(data);
          if (data.success) {
            if (user.level < 5) {
              tinymce.remove();
              _this.mapControl.resetContent();
              toastr.success(_this.langMsgs.MARKER_ADD_SUCCESS_RESTRICTED);
            } else {
              marker = jQuery.parseJSON(data.marker)[0];
              tinymce.remove();

              if (data.action == "ADD") {
                 _this.addMarker(marker);
              } else {
                 for (var i = 0; i < markers.length; i++) {
                    // Just hide the marker on the marker array ... on reaload, query won't get it.
                    if (markers[i].id == marker.id) {
                       markers[i].id = -1;
                       markers[i].visible = 0;
                       markers[i].categoryId = -1;
                    }
                 }
                 _this.addMarker(marker);
              }
              _this.map.addLayer(markers[markers.length - 1]);
              _this._createMarkerPopup(markers[markers.length - 1]);
              toastr.success(_this.langMsgs.MARKER_ADD_SUCCESS.format(marker.id));
            }
          } else {
            console.log(data.msg);
            toastr.error(_this.langMsgs.MARKER_ADD_ERROR.format(data.msg));
          }
        }
      });

      e.preventDefault(); // avoid to execute the actual submit of the form.
  });
}
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
                     toastr.success(_this.langMsgs.MARKER_DEL_ALL_COMPLETE_SUCCESS);
                  } else {
                     toastr.error(_this.langMsgs.MARKER_DEL_ERROR.format(data.msg));
                     //alert(data.msg);
                  }
              }
            });
   }

   for (var i = 0; i < markers.length; i++) {
      _this._doSetMarkerDoneIcon(markers[i], false);
   }
   _this.refreshMap();
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
                           toastr.success(_this.langMsgs.MARKER_COMPLETE_TRANSFER_SUCCESS);
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
   $.getJSON("ajax.php?command=get_user_completed_markers&game=" + gameId + "&userId=" + user.id, function(vResults) {
      $.each(vResults, function(i,marker){

         for (var i = 0; i < markers.length; i++) {
            if (markers[i].id == marker.markerId) {
               completedMarkers.push(marker.markerId);

               _this.categories[markers[i].categoryId].complete++;
               _this._doSetMarkerDoneIcon(markers[i], true);
               break;
            }
         }
         _this.refreshMap();
      });
   });
}

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
      vComplete ? "Completed" : "Mark Complete";
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
    $.ajax({
      type: "POST",
      url: "ajax.php?command=add_complete_marker",
      data: { markerId: vMarker.id, userId: user.id },
      success: function(data) {
        if (data.success) {
          _this._completeSetMarkerDoneAndCookie(vMarker);
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

    if (!userWarnedAboutLogin) {
      toastr.warning(_this.langMsgs.MARKER_COMPLETE_WARNING);
      userWarnedAboutLogin = true;
    }
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
    $.ajax({
      type: "POST",
      url: "ajax.php?command=del_complete_marker",
      data: { markerId: vMarker.id, userId: user.id },
      success: function(data) {
        if (data.success) {
          vMIdx = completedMarkers.indexOf(vMarker.id);
          if (vMIdx >= 0) completedMarkers.splice(vMIdx, 1);
          _this._doSetMarkerDoneIcon(vMarker, false);
          _this.categories[vMarker.categoryId].complete--;
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
    if (!userWarnedAboutLogin) {
      toastr.warning(_this.langMsgs.MARKER_COMPLETE_WARNING);
      userWarnedAboutLogin = true;
    }
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
  $.ajax({
    type: "POST",
    url: "ajax.php?command=logout",
    success: function(data) {
      if(data.success) {
        toastr.success(_this.langMsgs.LOGOUT_SUCCESS.format(user.username));
        _this.setUser(null);
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
                                       '<input type="password" s="form-control" class="form-control" name="password" id="password" required="" placeholder="Create a password"/>'+
                                    '</div>'+
                                 '</div>'+
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
                                       '<span class="input-group-addon"><i class="icon-fa-envelope fa" aria-hidden="true"></i></span>'+
                                       '<input type="text" class="form-control" name="email" id="email" required="" placeholder="Your email address"/>'+
                                    '</div>'+
                                 '</div>'+
                              '</div>'+

                              '<div class="modal-footer">'+
                                 '<div>'+
                                    '<button type="submit" class="infoWindowIcn form-action-button">Register</button>'+
                                    '<button id="register_back_btn" type="button" class="infoWindowIcn form-action-button">Back</button>'+
                                 '</div>'+
                               '</div>'+
                        '</form>'+
                     '</div>'
   , 'registerForm');


   $("#newuserform").submit(function(e) {
      $.ajax({
        type: "POST",
        async: false,
        url: "ajax.php?command=user_add",
        data: $("#newuserform").serialize(), // serializes the form's elements.
        success: function(data) {
            //data = jQuery.parseJSON(data);
            if (data.success) {
               var successMessage = _this.langMsgs.REGISTER_SUCCESS.format($("#user")[0].value)
                 + " Please log in.";
               _this._createLoginForm(successMessage);
            } else {
               console.log(data.msg);
               toastr.error(_this.langMsgs.REGISTER_ERROR.format(data.msg));
            }
        }
      });

      e.preventDefault();
   });

   $("#register_back_btn").click(function(e) {
      _this._createLoginForm();
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
                                   '<span class="input-group-addon"><i class="icon-fa-envelope fa" aria-hidden="true"></i></span>'+
                                   '<input type="text" class="form-control" name="email" id="email" required="" placeholder="Enter your email address"/>'+
                                '</div>'+
                             '</div>'+
                          '</div>'+
                          '<div class="modal-footer">'+
                                 '<div>'+
                                    '<button type="submit" class="infoWindowIcn form-action-button">Reset Password</button>'+
                                    '<button id="lost_password_back_btn" type="button" class="infoWindowIcn form-action-button">Back</button>'+
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

   $("#lost_password_back_btn").click(function(e) {
      if(user) {
         _this._createAccountForm(user);
      } else {
         _this._createLoginForm();
      }
      e.preventDefault();
   });
}

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
      _this._createAccountForm(user);
      e.preventDefault();
   });
}

ZMap.prototype._createAccountDeleteForm = function() {
  this.mapControl.setContent(
    '<div id="deleteaccount">' +
      '<h3 class="text-center">' + this.langMsgs.DELETE_ACCOUNT_WELCOME + '</h3>' +
      '<div class="alert alert-danger delete-account-warning" role="alert">' +
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
                '<input type="password" s="form-control" class="form-control" name="currentpassword" id="currentpassword" required="" placeholder="Enter your current password"/>' +
              '</div>' +
           '</div>' +
        '</div>' +
        '<div class="modal-footer">' +
           '<div>' +
              '<button type="submit" class="infoWindowIcn form-action-button bad">Permanently Delete Account</button>' +
              '<button id="delete_account_back_btn" type="button" class="infoWindowIcn form-action-button">Back</button>' +
           '</div>' +
         '</div>' +
      '</form>' +
    '</div>'
  , 'deleteAccountForm'
  );

  var _this = this;

  $("#delete_account_back_btn").click(function(e) {
    _this._createAccountForm(user);
    e.preventDefault();
  });

  $("#deleteaccountform").submit(function(e) {
    $.ajax({
      type: "POST",
      async: false,
      url: "ajax.php?command=delete_account",
      data: $("#deleteaccountform").serialize(),
      success: function(data) {
        if(data.success) {
          toastr.success(_this.langMsgs.DELETE_ACCOUNT_SUCCESS);
          _this.logout();
          _this.mapControl.resetContent();
        } else {
          toastr.error(_this.langMsgs.DELETE_ACCOUNT_ERROR.format(data.msg));
        }
      },
      error: function(data) {
        toastr.error(_this.langMsgs.DELETE_ACCOUNT_ERROR.format(data.msg));
      }
    });

    e.preventDefault();
  });
}

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
                           '<div id="remember" class="checkbox">'+
                              '<label>'+
                                 '<input type="checkbox" id="remember" name="remember" checked> Remember me'+
                              '</label>'+
                           '</div>'+
                           '<div class="modal-footer">'+
                              '<div>'+
                                 '<button type="submit" class="infoWindowIcn form-action-button">Login</button>'+
                              '</div>'+
                              '<div>'+
                                '<button id="login_lost_btn" type="button" class="infoWindowIcn form-action-button" disabled="true">Lost Password?</button>'+
                                '<button id="login_register_btn" type="button" class="infoWindowIcn form-action-button">Register</button>'+
                              '</div>'+
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
            _this.setUser(data.user);
            updateAdState();
            toastr.success(_this.langMsgs.LOGIN_SUCCESS.format(user.username));

            if (_this.mapControl.isMobile) {
               _this.mapControl.closeDrawer();
            } else {
              _this.mapControl.resetContent();
            }
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

ZMap.prototype._createAccountForm = function(user) {
  var _this = this;
  var profilePicture = user.profilePicture || 'images/default-avatar.svg';

  this.mapControl.setContent(
     '<div id="account">' +
      '<h3 class="text-center">' +
        this.langMsgs.ACCOUNT_TITLE +
      '</h3>' +
      '<p>' +
        'Username: ' + user.username + '<br />' +
        ((user.level >= 5) ? 'Level: ' + user.level + '<br />' : "") +
      '</p>' +
      '<div class="account-profile-section">' +
        '<img id="account_profile_preview" class="account-profile-preview" src="' + profilePicture + '" alt="Your profile picture" />' +
        '<form id="account_profile_form" enctype="multipart/form-data">' +
          '<input id="account_profile_input" name="profile_picture" type="file" accept="image/jpeg,image/png,image/webp,image/gif" style="display:none" />' +
          '<button id="account_profile_choose" type="button" class="infoWindowIcn">Change Profile Picture</button>' +
          '<button id="account_profile_save" type="submit" class="infoWindowIcn" style="display:none">Save Profile Picture</button>' +
          '<p id="account_profile_status" class="account-profile-status" role="status" aria-live="polite"></p>' +
        '</form>' +
      '</div>' +
      '<div class="modal-footer">' +
         '<div>' +
           '<button id="account_clear_completed_btn" type="button" class="infoWindowIcn">Reset Completed Markers</button>' +
           '<button id="account_offline_maps_btn" type="button" class="infoWindowIcn">Download Offline Maps</button>' +
           '<button id="account_reset_btn" type="button" class="infoWindowIcn">Reset Password</button>' +
           '<button id="account_change_btn" type="button" class="infoWindowIcn">Change Password</button>' +
           '<button id="log_out_btn" type="button" class="infoWindowIcn">Log out</button>' +
           '<button id="account_delete_btn" type="button" class="infoWindowIcn bad">Delete Account</button>' +
         '</div>' +
      '</div>' +
    '</div>',
    'accountPage'
  );

  var selectedPreviewURL = null;
  $('#account_profile_choose').click(function() {
    $('#account_profile_input').trigger('click');
  });

  $('#account_profile_input').change(function() {
    var file = this.files && this.files[0];
    if(!file) return;
    if(selectedPreviewURL) URL.revokeObjectURL(selectedPreviewURL);
    selectedPreviewURL = URL.createObjectURL(file);
    $('#account_profile_preview').attr('src', selectedPreviewURL);
    $('#account_profile_save').show();
    $('#account_profile_status').removeClass('error success').text(file.name);
  });

  $('#account_profile_form').submit(function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var status = $('#account_profile_status');
    status.removeClass('error success').text('Uploading…');
    $('#account_profile_save').prop('disabled', true);

    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=update_profile_picture',
      data: formData,
      processData: false,
      contentType: false,
      success: function(data) {
        if(!data.success) {
          status.addClass('error').text(data.msg || 'The profile picture could not be updated.');
          $('#account_profile_save').prop('disabled', false);
          return;
        }
        if(selectedPreviewURL) {
          URL.revokeObjectURL(selectedPreviewURL);
          selectedPreviewURL = null;
        }
        user.profilePicture = data.profilePicture;
        $('#account_profile_preview').attr('src', data.profilePicture);
        $('#account_profile_save').hide().prop('disabled', false);
        status.addClass('success').text(data.msg);
        _this.notifyUserChanged();
      },
      error: function(data) {
        var message = data.responseJSON && data.responseJSON.msg;
        status.addClass('error').text(message || 'The profile picture could not be updated.');
        $('#account_profile_save').prop('disabled', false);
      }
    });
  });

  $("#account_clear_completed_btn").click(function(e) {
     _this._createDialogDeleteAllMarkers();
     _this.categoriesArr.forEach(function(category) {
       category.complete = 0;
     }, this);
     _this.mapControl.resetContent();
     e.preventDefault();
  });

  $("#account_reset_btn").click(function(e) {
     _this._createLostPasswordForm();
     e.preventDefault();
  });

  $("#account_offline_maps_btn").click(function(e) {
     _this._createOfflineMapsForm();
     e.preventDefault();
  });

  $("#account_change_btn").click(function(e) {
     _this._createChangePasswordForm();
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

ZMap.prototype._createOfflineMapsForm = function() {
  var _this = this;
  this.mapControl.setContent(
    '<div id="offline_maps" class="offline-maps-page">' +
      '<h3 class="text-center">Download Offline Maps</h3>' +
      '<p class="offline-maps-intro">Save complete maps to this device for use without an internet connection. Downloads can be large and may be removed by your browser when storage is low.</p>' +
      '<div id="offline_maps_list" class="offline-maps-list">' +
        '<p class="offline-maps-loading">Calculating download sizes…</p>' +
      '</div>' +
      '<button id="offline_maps_back_btn" type="button" class="infoWindowIcn form-action-button">Back</button>' +
    '</div>',
    'offlineMapsPage'
  );

  $('#offline_maps_back_btn').click(function(e) {
    _this._createAccountForm(user);
    e.preventDefault();
  });

  function formatBytes(bytes) {
    if(!bytes) return '0 MB';
    var units = ['B', 'KB', 'MB', 'GB'];
    var unitIndex = Math.min(Math.floor(Math.log(bytes) / Math.log(1024)), units.length - 1);
    var value = bytes / Math.pow(1024, unitIndex);
    return value.toFixed(unitIndex >= 2 && value < 10 ? 1 : 0) + ' ' + units[unitIndex];
  }

  function packCacheName(gameId) {
    return 'zeldamaps-offline-' + gameId;
  }

  function packStorageKey(gameId) {
    return 'zeldamapsOfflineMap-' + gameId;
  }

  function readPackRecord(gameId) {
    try {
      return localStorage.getItem(packStorageKey(gameId));
    } catch(error) {
      return null;
    }
  }

  function writePackRecord(gameId, record) {
    try {
      localStorage.setItem(packStorageKey(gameId), JSON.stringify(record));
    } catch(error) {
      // CacheStorage remains authoritative if localStorage is unavailable.
    }
  }

  function removePackRecord(gameId) {
    try {
      localStorage.removeItem(packStorageKey(gameId));
    } catch(error) {}
  }

  function setDownloadedState(card, game, downloaded) {
    var downloadButton = card.find('.offline-map-download');
    var deleteButton = card.find('.offline-map-delete');
    var status = card.find('.offline-map-status');
    if(downloaded) {
      downloadButton.text('Downloaded').prop('disabled', true).addClass('downloaded');
      deleteButton.show();
      status.text(formatBytes(game.size) + ' saved on this device.').addClass('success');
    } else {
      downloadButton.text('Download').prop('disabled', !game.available).removeClass('downloaded');
      deleteButton.hide();
      status.text(game.available ? '' : 'Map files are not available for download.').removeClass('success error');
    }
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

    downloadButton.prop('disabled', true).text('Downloading…');
    progress.attr('max', Math.max(totalBytes, 1)).val(0).show();
    progressLabel.text('0%').show();
    status.removeClass('success error').text('Preparing download…');

    function updateProgress(tileSize) {
      completedTiles += 1;
      completedBytes += tileSize || 0;
      var fraction = totalBytes > 0
        ? completedBytes / totalBytes
        : completedTiles / Math.max(totalTiles, 1);
      var percent = Math.min(100, Math.round(fraction * 100));
      progress.val(totalBytes > 0 ? completedBytes : completedTiles);
      progress.attr('max', totalBytes > 0 ? totalBytes : Math.max(totalTiles, 1));
      progressLabel.text(percent + '% · ' + completedTiles + ' of ' + totalTiles + ' tiles');
    }

    function downloadBatch(cache, tiles) {
      var index = 0;
      var workerCount = Math.min(6, tiles.length);
      var workers = [];
      function worker() {
        if(index >= tiles.length) return Promise.resolve();
        var tile = tiles[index++];
        var absoluteURL = new URL(tile.url, window.location.origin).href;
        return fetch(absoluteURL, {
          headers: { 'X-ZeldaMaps-Offline-Pack': '1' },
          credentials: 'same-origin'
        }).then(function(response) {
          if(!response.ok) throw new Error('A map tile could not be downloaded.');
          return cache.put(absoluteURL, response.clone()).then(function() {
            updateProgress(tile.size);
          });
        }).then(worker);
      }
      for(var i = 0; i < workerCount; i++) workers.push(worker());
      return Promise.all(workers);
    }

    function downloadPage(cache, offset) {
      return fetch(
        'ajax.php?command=get_offline_maps&mode=manifest&game=' +
        encodeURIComponent(game.id) + '&offset=' + offset + '&limit=100'
      ).then(function(response) {
        if(!response.ok) throw new Error('The map manifest could not be loaded.');
        return response.json();
      }).then(function(data) {
        if(!data.success) throw new Error(data.msg || 'The map manifest could not be loaded.');
        totalTiles = data.total;
        totalBytes = data.totalBytes;
        return downloadBatch(cache, data.tiles).then(function() {
          var nextOffset = offset + data.tiles.length;
          if(nextOffset < data.total) return downloadPage(cache, nextOffset);
        });
      });
    }

    var persistenceRequest = navigator.storage && navigator.storage.persist
      ? navigator.storage.persist().catch(function() { return false; })
      : Promise.resolve(false);
    var storageCheck = persistenceRequest.then(function() {
      return navigator.storage && navigator.storage.estimate
        ? navigator.storage.estimate()
        : null;
    });

    storageCheck.then(function(estimate) {
      if(estimate && estimate.quota && estimate.usage + totalBytes * 1.1 > estimate.quota) {
        throw new Error('This device does not have enough available browser storage for this map.');
      }
      return caches.delete(cacheName);
    }).then(function() {
      return caches.open(cacheName);
    }).then(function(cache) {
      return downloadPage(cache, 0);
    }).then(function() {
      writePackRecord(game.id, {
        size: totalBytes,
        tileCount: totalTiles,
        downloadedAt: Date.now()
      });
      progress.hide();
      progressLabel.hide();
      setDownloadedState(card, game, true);
    }).catch(function(error) {
      caches.delete(cacheName);
      removePackRecord(game.id);
      progress.hide();
      progressLabel.hide();
      setDownloadedState(card, game, false);
      status.addClass('error').text(error.message || 'The map download could not be completed.');
    });
  }

  function renderGame(game) {
    var card = $('<section>', { class: 'offline-map-card' });
    var heading = $('<div>', { class: 'offline-map-heading' });
    heading.append($('<h4>').text(game.name));
    heading.append($('<span>', { class: 'offline-map-size' }).text(
      game.available ? formatBytes(game.size) : 'Unavailable'
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
      text: 'Delete'
    }).hide();
    actions.append(downloadButton, deleteButton);
    card.append(actions);

    var hasPackRecord = !!readPackRecord(game.id);
    setDownloadedState(card, game, false);
    caches.has(packCacheName(game.id)).then(function(hasCache) {
      if(hasPackRecord && hasCache) {
        setDownloadedState(card, game, true);
      } else {
        removePackRecord(game.id);
        if(hasCache) caches.delete(packCacheName(game.id));
      }
    });

    downloadButton.click(function() {
      if(game.available) downloadTiles(game, card);
    });
    deleteButton.click(function() {
      if(!window.confirm('Remove the downloaded ' + game.name + ' maps from this device?')) return;
      caches.delete(packCacheName(game.id)).then(function() {
        removePackRecord(game.id);
        setDownloadedState(card, game, false);
      });
    });
    return card;
  }

  if(!('caches' in window)) {
    $('#offline_maps_list').html('<p class="offline-map-status error">Offline map downloads are not supported by this browser.</p>');
    return;
  }

  $.getJSON('ajax.php?command=get_offline_maps', function(data) {
    var list = $('#offline_maps_list').empty();
    if(!data.success || !data.games || !data.games.length) {
      list.append('<p class="offline-map-status error">No offline maps are currently available.</p>');
      return;
    }
    data.games.forEach(function(game) {
      list.append(renderGame(game));
    });
  }).fail(function() {
    $('#offline_maps_list').html('<p class="offline-map-status error">Download sizes could not be loaded.</p>');
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
   history.pushState({}, "", url);
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
