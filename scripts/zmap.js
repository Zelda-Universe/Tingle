function ZMap() {
   var _this;

   // Now that we have the changelog system using the database
   // with a field for each number, let's use 3 numbers and no
   // letters in the version.
   this.version = '0.7.0';

   this.maps = [];
   this.games = [];
   this._overlayMap = [];
   this.map;
   this.mapControl;
   this.currentMap;
   this.currentOverlaypMap;

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

   this.hasUserCheck;
   this.userWarnedAboutMarkerQty;
   this.userWarnedAboutLogin;

   this.completedMarkers;

   this.currentIcon;

   this.langMsgs = {
      GENERAL_ERROR   : "I AM ERROR. %1",

      LOGOUT_SUCCESS : "May the Goddess smile upon you, %1!",
      LOGOUT_ERROR   : "I AM ERROR! Could not log out. Please try clearing your cache and restarting your browser to safely log out.",

      LOGIN_WELCOME  : "Hey, listen! Welcome back!",
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
     markersAdded: []
   };
};


//****************************************************************************//
//*************                                                  *************//
//*************                BEGIN  -  AUXILIARY               *************//
//*************                                                  *************//
//****************************************************************************//

// Format string like java
// http://stackoverflow.com/questions/16371871/replacing-1-and-2-in-my-javascript-string
String.prototype.format = function() {
  var args=arguments;
  return this.replace(/%(\d+)/g, function(_,m) {
    return args[--m];
  });
}

// Remove elements from array
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
if (!Array.prototype.filter) {
  Array.prototype.filter = function(fun/*, thisArg*/) {
    'use strict';

    if (this === void 0 || this === null) {
      throw new TypeError();
    }

    var t = Object(this);
    var len = t.length >>> 0;
    if (typeof fun !== 'function') {
      throw new TypeError();
    }

    var res = [];
    var thisArg = arguments.length >= 2 ? arguments[1] : void 0;
    for (var i = 0; i < len; i++) {
      if (i in t) {
        var val = t[i];

        // NOTE: Technically this should Object.defineProperty at
        //       the next index, as push can be affected by
        //       properties on Object.prototype and Array.prototype.
        //       But that method's new, and collisions should be
        //       rare, so use the more-compatible alternative.
        if (fun.call(thisArg, val, i, t)) {
          res.push(val);
        }
      }
    }

    return res;
  };
}
//****************************************************************************//
//*************                                                  *************//
//*************                 END  -  AUXILIARY                *************//
//*************                                                  *************//
//****************************************************************************//



ZMap.prototype.constructor = function(vMapOptions) {
  toastr.options.preventDuplicates = true;
  // toastr.options.progressBar = true;

  _this = this;

  hasUserCheck = false;
  userWarnedAboutMarkerQty = false;
  userWarnedAboutLogin = false;
  mapOptions = {};

  games = [];
  maps = [];
  markers = [];
  categoryTree = [];
  categories = [];
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
    mapOptions = vMapOptions;
  }

  if(!mapOptions.categorySelectionMethod)
  mapOptions.categorySelectionMethod =
  ZConfig.getConfig("categorySelectionMethod");

  if(ZConfig.getConfig("markerClusters") == 'true') {
    markerCluster = new L.MarkerClusterGroup({
      maxClusterRadius: mapOptions.clusterGridSize,
      disableClusteringAtZoom: mapOptions.clusterMaxZoom
    });
  }

  markerIconMedium = L.DivIcon.extend({
    options: {
      iconSize: [
        mapOptions.iconWidth,
        mapOptions.iconHeight
      ]
      , iconAnchor: [
        Math.floor(mapOptions.iconWidth   / 2),
        Math.floor(mapOptions.iconHeight  / 2)
      ]
      , popupAnchor: [0,0]
    }
  });
  markerIconSmall = L.DivIcon.extend({
    options: {
      iconSize: [
        mapOptions.iconSmallWidth,
        mapOptions.iconSmallHeight
      ]
      , iconAnchor: [
        Math.floor(mapOptions.iconSmallWidth  / 2),
        Math.floor(mapOptions.iconSmallHeight / 2)
      ]
      , popupAnchor: [0,0]
    }
  });

  if (mapOptions.defaultZoom > mapOptions.switchIconsAtZoom) {
    currentIcon = 'Medium';
  } else {
    currentIcon = 'Small';
  }
};

// Add a map category
ZMap.prototype.addCategory = function(category) {
  category.checked = ((category.checked==1) ? true : false);
  category.userChecked = false;
  category.complete = 0;
  category.total = 0;
  categories[category.id] = category;
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
        , tileSize          : mapOptions.tileSize
        , updateWhenIdle    : true
        , updateWhenZooming : false
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

    maps.push(tLayer);
  } else {
    // Create the base map
    //  We create it as an empty map, so different sized overlay maps won't show on top
    //  We could create based on first submap of the array, but then we would need to change the controller to not redisplay the first submap
    /* TODO: Improve this to use no tile at all (remove tile border)*/
    var tLayer = L.tileLayer(this.tilesBaseURL + vMap.subMap[0].tileURL + 'blank.png'
                                         , { maxZoom:           vMap.maxZoom
                                           , noWrap:            true
                                           , tileSize:          mapOptions.tileSize
                                           , updateWhenIdle:    true
                                           , updateWhenZooming: false
                                           , label:             vMap.name
                                           , iconURL:           this.defaultIconURL + vMap.subMap[i].tileURL + 'icon.' + vMap.subMap[i].tileExt
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
                                            , tileSize:          mapOptions.tileSize
                                            , updateWhenIdle:    true
                                            , updateWhenZooming: false
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
                                                                       , tileSize:          mapOptions.tileSize
                                                                       , opacity:           submap.opacity
                                                                       , updateWhenIdle:    false
                                                                       , updateWhenZooming: false
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

    maps.push(tLayer);
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
      marker = new L.Marker([vMarker.y,vMarker.x], { title: vMarker.name
                                                   , icon: _this._createMarkerIcon(vMarker.markerCategoryId)
                                                   });

   marker.id              = vMarker.id;
   marker.title           = vMarker.name;
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
   marker.visible         = true;            // Used by the application to hide / show markers (everything is starting as visible) @TODO: might need to change this
   marker.dbVisible       = vMarker.visible; // This is used in the database to check if a marker is deleted or not... used by the grid
   marker.draggable       = true; // @TODO: not working ... maybe marker cluster is removing the draggable event
   marker.complete        = false;
   categories[marker.categoryId].total++;
   for (var i = 0; i < completedMarkers.length; i++) {
      if (marker.id == completedMarkers[i]) {
         categories[marker.categoryId].complete++;
         _this._doSetMarkerDoneIcon(marker, true);
         break;
      }
   }

   markers.push(marker);
   this.addMarkerToCategoryCache(marker);
   this.cachedMarkersById[marker.id] = marker;
   marker.pos = markers.length - 1;

   marker.on('click',function() {
      if (mapControl.isCollapsed()) {
         mapControl.toggle();
      }

      if (newMarker == null || (newMarker.markerId != marker.id)) {
         _this._createMarkerPopup(marker);

         _this._closeNewMarker();
         newMarker = L.marker(marker._latlng).addTo(map);
         newMarker.markerId = marker.id;
         newMarker.markerPos = marker.pos;
         //map.panTo(marker.getLatLng());
      }
   });

   marker.on('contextmenu',function(e){
      if (!marker.complete) {
        _this._doSetMarkerDoneAndCookie(marker);
      } else {
        _this._doSetMarkerUndoneAndCookie(marker);
      }
      if (!mapControl.isCollapsed()) {
         if (
              mapControl.getContentType() == 'm'
           +  marker.id
           && mapOptions.showCompleted    == true
         ) {
            //@TODO: Improve to not show marker content if this was not being displayed
            _this._createMarkerPopup(marker);
         } else {
            //mapControl.resetContent();
         }
      }
      if (newMarker == null || (newMarker.markerId != marker.id)) {

         //map.panTo(marker.getLatLng());
      }

   });
};

ZMap.prototype._closeNewMarker = function() {
   if (newMarker != null) {
      map.removeLayer(newMarker);
      newMarker = null;
   }
}


ZMap.prototype._createMarkerPopup = function(marker) {
   var content = "<h2 class='popupTitle'>" + marker.title + "</h2>";
   content = content + "<div class='popupContent'>";
   for (var i = 0; i < marker.tabText.length; i++) {
      content = content + marker.tabText[i];
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
                   + "<span id='check" + marker.id + "' class=\"" + (!marker.complete?"un":"") + "checked infoWindowIcn\" onclick=\"var span = document.getElementById('check" + marker.id + "'); if (span.className == 'unchecked infoWindowIcn') { span.className = 'checked infoWindowIcn'; _this._setMarkerDone("+marker.id+", true); } else { span.className = 'unchecked infoWindowIcn'; _this._setMarkerDone("+marker.id+", false); }; return false\"><i class=\"icon-checkbox-" + (!marker.complete?"un":"") + "checked\"></i>" + (!marker.complete?"Mark as Complete":"Completed") + "</span>"
                   + "<span class=\"infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"><i class=\"fas fa-link\"></i> Copy Link</span>"
                   + "<span class=\"infoWindowIcn\" onclick=\"_this._copyToClipboardEmbed("+marker.id+"); return false\"><i class=\"icon-embed2\"></i> Copy Embed Link</span>"
                     + "<span class=\"icon-pencil infoWindowIcn\" onclick=\"_this.editMarker("+marker.id+"); return false\"></span>"
                     + "<span class=\"icon-cross infoWindowIcn\" onclick=\"_this.deleteMarker("+marker.id+"); return false\"></span>"
                + "</div>";
      } else {
         content += "<span id='check" + marker.id + "' class=\"" + (!marker.complete?"un":"") + "checked infoWindowIcn\" onclick=\"var span = document.getElementById('check" + marker.id + "'); if (span.className == 'unchecked infoWindowIcn') { span.className = 'checked infoWindowIcn'; _this._setMarkerDone("+marker.id+", true); } else { span.className = 'unchecked infoWindowIcn'; _this._setMarkerDone("+marker.id+", false); }; return false\"><i class=\"icon-checkbox-" + (!marker.complete?"un":"") + "checked\"></i>" + (!marker.complete?"Mark as Complete":"Completed") + "</span>"
                     + "<span class=\"infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"><i class=\"fas fa-link\"></i> Copy Link</span>"
                     + "<span class=\"infoWindowIcn\" onclick=\"_this._copyToClipboardEmbed("+marker.id+"); return false\"><i class=\"icon-embed2\"></i> Copy Embed Link</span>"
                + "</div>";
      }
   } else {
      content += "<span id='check" + marker.id + "' class=\"" + (!marker.complete?"un":"") + "checked infoWindowIcn\" onclick=\"var span = document.getElementById('check" + marker.id + "'); if (span.className == 'unchecked infoWindowIcn') { span.className = 'checked infoWindowIcn'; _this._setMarkerDone("+marker.id+", true); } else { span.className = 'unchecked infoWindowIcn'; _this._setMarkerDone("+marker.id+", false); }; return false\"><i class=\"icon-checkbox-" + (!marker.complete?"un":"") + "checked\"></i>" + (!marker.complete?"Mark as Complete":"Completed") + "</span>"
                  + "<span class=\"infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"><i class=\"fas fa-link\"></i> Copy Link</span>"
                  + "<span class=\"infoWindowIcn\" onclick=\"_this._copyToClipboardEmbed("+marker.id+"); return false\"><i class=\"icon-embed2\"></i> Copy Embed Link</span>"
             + "</div>";
   }


   mapControl.setContent(content, 'm'+marker.id);
}

ZMap.prototype._createMarkerIcon = function(vCatId, vComplete) {
   if (map.getZoom() > mapOptions.switchIconsAtZoom) {
      return new markerIconMedium({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-medium ' style='background-color: " + categories[vCatId].color + "; "
                                                                      + "border-color: " + categories[vCatId].color + "'>"
                                       + "<span class='icon-" + categories[vCatId].img + " icnText-medium'></span>"
                                       + (vComplete?"<span class='icon-checkmark completeMarker completeMarker-Medium'></span>":"")
                                 + "</div>"
      });
   } else {
      return new markerIconSmall({className: 'map-icon-svg'
                            ,html: "<div class='circle circleMap-small' style='background-color: " + categories[vCatId].color + "; "
                                                                      + "border-color: " + categories[vCatId].color + "'>"
                                       + "<span class='icon-" + categories[vCatId].img + " icnText-small'></span>"
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

   window.prompt("Copy to clipboard: Ctrl+C, Enter", "<iframe src=\"" + href[0] + "?" + clipboardParams + "marker=" + vMarkerId + "&zoom=" + map.getZoom() + "&hideOthers=true&showMapControl=true&hidePin=false\" frameborder=\"0\" allowfullscreen></iframe>");
}
ZMap.prototype._copyToClipboard = function(vMarkerId) {
   var href = window.location.href.split("?");
   var clipboardParams = this._getClipboardParams(href);
   window.prompt("Copy to clipboard: Ctrl+C, Enter", href[0] + "?" + clipboardParams + "marker=" + vMarkerId + "&zoom=" + map.getZoom());
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

    affectedCategories.forEach(function(affectedCategory) {
      this._updateMarkersPresence(this.cachedMarkersByCategory[affectedCategory.id]);
    }, this);
  } else {
    if(completedChanged) {
      this._updateMarkersPresence(
        completedMarkers.map(function(completedMarkerId) {
          return this.cachedMarkersById[completedMarkerId];
        }, this)
      );
    } else {
      this._updateMarkersPresence(markers);
    }
  }
};

ZMap.prototype._updateMarkersPresence = function(markers) {
  if(!markers) return;

  markers.forEach(function(marker) {
    this._updateMarkerPresence(marker);
  }, this);
};

ZMap.prototype._updateMarkerPresence = function(marker) {
  mapBounds = map.getBounds().pad(0.15);

  if (mapControl.getCurrentMap().mapId != marker.mapId
         || mapControl.getCurrentMap().subMapId != marker.submapId
     )
   {
     map.removeLayer(marker);
     return;
  }
  if(this._shouldShowMarker(marker)) {
    marker.setIcon(_this._createMarkerIcon(marker.categoryId, marker.complete));
    map.addLayer(marker);
  } else {
    map.removeLayer(marker);
  }
};

ZMap.prototype._shouldShowMarker = function(marker) {
  return marker.visible
    && mapBounds.contains(marker.getLatLng())  // Is in the Map Bounds (PERFORMANCE)
    && (
      (
        mapOptions.categorySelectionMethod == "focus"
        && !hasUserCheck
        && categories[marker.categoryId].visibleZoom <= map.getZoom()
      )
      || categories[marker.categoryId].userChecked
    ) // Check if we should show for the category, and at this zoom level
    && (
      mapOptions.showCompleted == true || (
        mapOptions.showCompleted == false
        && marker.complete != true
      )
    ) // Should we show completed markers?
  ;
}

ZMap.prototype.buildCategoryMenu = function(vCategoryTree) {
   categoryTree = vCategoryTree;
   // disabling for refactored category button UI, focus selection style, or both?
   // $.each(categoryTree, function(parentCategoryId, parentCategory) {
   //   parentCategory.userChecked = parentCategory.checked;
   //   $.each(parentCategory.children, function(index, childCategory) {
   //     childCategory.userChecked = childCategory.checked;
   //   });
   // });
}

ZMap.prototype.buildMap = function() {
  // console.log("Leaflet Version: "    + L.version     );
  // console.log("Zelda Maps Version: " + _this.version );

  if (!L.CRS.Simple) {
    L.CRS.Simple = L.Util.extend({}, L.CRS, {
        projection:     L.Projection.LonLat
      , transformation: new L.Transformation(1,0,1,0)
    });
  }

  if(maps[0]) {
    map = L.map('map', {
        center:             new L.LatLng(
          mapOptions.centerY,
          mapOptions.centerX
        )
      , zoom:               0
      , zoomSnap:           mapOptions.zoomSnap
      , zoomDelta:          mapOptions.zoomDelta
      , zoomControl:        false
      , crs:                L.CRS.Simple
      , layers:             [maps[0]]
      , maxBounds:          new L.LatLngBounds(
        new L.LatLng(
          mapOptions.boundTopX,
          mapOptions.boundTopY
        ),
        new L.LatLng(
          mapOptions.boundBottomX,
          mapOptions.boundBottomY
        )
      )
      , maxBoundsViscosity: 1.0
      , contextmenu:        true
      , contextmenuWidth:   140
    });
  }

  // Get all the base maps
  var baseMaps = {};
  for (var i = 0; i < maps.length; i++) {
    baseMaps[maps[i].title] = maps[i];
  }

  var mapControlOptions = $.extend(
    mapOptions, {
    "zIndex": 0,
    "collapsed": ZConfig.getConfig("collapsed")
  });

  if (L.Browser.mobile && window.innerWidth < 768) {
    mapControl =  L.control.zlayersbottom(
      baseMaps,
      categoryTree,
      mapControlOptions
    );
    headerBar =   L.control.zmobileheaderbar({
      mapControl: mapControl
    });
    headerBar.addTo(map);
  } else {
    mapControl =  L.control.zlayers(
      baseMaps,
      {},
      mapControlOptions
    );
    L.control.zoom({ position: 'bottomright' }).addTo(map);
    if (
          mapOptions.showInfoControls
      ||  ZConfig.getConfig("showInfoControls") == 'true'
    ) {
      $('.leaflet-container').css('cursor','crosshair');
      var posBL = { position: 'bottomleft' };
      L.control.infoBox.mouse.clickhist (posBL).addTo(map);
      L.control.infoBox.mouse.move      (posBL).addTo(map);
      L.control.infoBox.location.center (posBL).addTo(map);
      L.control.infoBox.location.bounds (posBL).addTo(map);
    }
  }

  //@TODO: REDO!
  mapControl.setCurrentMap(parseInt(maps[0].originalId), parseInt(maps[0].defaultSubMapId));
  mapControl.setCurrentMapLayer(maps[0]);
  //console.log(mapControl.getCurrentMap());
  mapControl.addTo(map);

  // TODO keyboard accessibility
  if (
        mapControlOptions.collapsed
    ||  ZConfig.getConfig("collapsed") == 'true'
  ) {
    //mapControl._map.on('movestart', mapControl._collapse, mapControl);
    //mapControl._map.on('click', mapControl._collapse, mapControl);
  } else {
    mapControl._expand();
  }

  //map.addLayer(markerCluster);

  //Change visible region to that specified by the corner coords if relevant query strings are present
  if (mapOptions.startArea) {
    map.fitBounds(mapOptions.startArea);
  }

  map.on('moveend', function(e) {
    _this.refreshMap();
    if (newMarker != null && newMarker.markerPos != null && !map.hasLayer(markers[newMarker.markerPos])) {
         _this._closeNewMarker();
         mapControl.resetContent();
      }
  });

  map.on('zoomend', function() {
    if (map.getZoom() > 5 && currentIcon == 'Small') {
      currentIcon = 'Medium';
    } else if (map.getZoom() > 5 && currentIcon == 'Small') {
      currentIcon = 'Small';
    } else {
      return;
    }

    var mapBounds = map.getBounds().pad(0.15);

    for (var i = markers.length -1; i >= 0; i--) {
      var m = markers[i];
      if (mapBounds.contains(m.getLatLng())) {
        m.setIcon(_this._createMarkerIcon(m.categoryId, m.complete));
      }
    }
  });

  map.on('baselayerchange', function(e) {
    //@TODO: Fix this null value - (for light / dark) - this is when a layer updates
    //       Defaulting to the first layer for now - workaround!!!!!
    var defaultSubMapId;
    var i;
    for (i = 0; i < maps.length; i++) {
      if (maps[i].originalId == e.originalId) {
            defaultSubMapId = maps[i].defaultSubMapId;
            break;
         }
    }
    // END OF WORKAROUND!!!
    //console.log(e.originalId + " " + defaultSubMapId);
    mapControl.setCurrentMap(parseInt(e.originalId), parseInt(defaultSubMapId));
    _this.refreshMap();
    _this._closeNewMarker();
    //mapControl.resetContent();

    map.setView(new L.LatLng(
      mapOptions.centerY,
      mapOptions.centerX
    ), map.getZoom());
  });

 $(document).on('keydown', function(e) {
    if(e.key == "Escape") {
      if(mapControl._contentType != mapControl.options.defaultContentType) {
        mapControl.resetContent();
        _this._closeNewMarker()
      } else {
        mapControl.toggle();
      }
    }
  }.bind(mapControl));

  _this._buildContextMenu();
};

ZMap.prototype.goToStart = function() {
   map.setView(new L.LatLng(mapOptions.centerY,mapOptions.centerX), mapOptions.zoom);
}

ZMap.prototype.setUser = function(vUser) {
   user = vUser;
   _this._buildContextMenu();

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

ZMap.prototype.getUser = function() {
  return user;
};

// TODO: Make this a generic mixin, probably automatically included in all
// widgets, or even use a JS framework that provides this functionality already!!
ZMap.prototype.addHandler = function(eventName, handleFunction) {
  this.handlers[eventName].push(handleFunction);
};

//************* CATEGORY MENU *************//
ZMap.prototype.toggleCompleted = function(showCompleted) {
  mapOptions.showCompleted = showCompleted;
  setCookie('showCompleted', showCompleted);
  zMap.refreshMapCompleted();
};

ZMap.prototype.checkWarnUserSeveralEnabledCategories = function() {
  if(!userWarnedAboutMarkerQty) {
    if(categories.reduce(
      function(sum, category) {
        return sum + ((category.userChecked) ? 1 : 0);
      },
      0
    ) > 5) {
      toastr.warning('Combining a lot of categories might impact performance.');
      userWarnedAboutMarkerQty = true;
    }
  }
};

ZMap.prototype.updateCategoryVisibility = function(category, vChecked) {
  vCatId = category.id;
   // Change the category visibility of the category parameter
   // var previousUserCheck;

   function forEachCatUserChecked(category, index, array) {
      if (category.id == vCatId) {
         category.userChecked = !category.userChecked;

         if (category.parentId != undefined) {
            return;
         } else {
            previousUserCheck = category.userChecked;
         }
      }

      if (category.parentId == vCatId) {
         category.userChecked = previousUserCheck;
      }
   }
   categories.forEach(forEachCatUserChecked);


   // After change the parameter category visibility, just check if we have any category checked
   hasUserCheck = false;
   var c = 0;
   function forEachCat(element, index, array) {
      if (element.userChecked == true) {
         hasUserCheck = true;
         c++;
      }
   }
   categories.forEach(forEachCat);

   if (c > 5 && !userWarnedAboutMarkerQty) {
      toastr.warning('Combining a lot of categories might impact performance.');
      userWarnedAboutMarkerQty = true;
   }
   // _this.refreshMap(category); // Doing in CategoryMenu for now since that has the knowledge of all category changes for now, we'll try to be efficient there.
};

ZMap.prototype.updateCategoryVisibility2 = function(category, vChecked) {
  var targetCategories = [category];
  if(category.children) targetCategories.concat(category.children);

  targetCategories.forEach(function(category) {
    categories[category.id].userChecked = vChecked;
  }, this);


  this.checkWarnUserSeveralEnabledCategories();

  _this.refreshMap(targetCategories);
};

ZMap.prototype.updateMarkerVisibility = function(vCatId, vVisible) {

   for (var i = 0; i < markers.length; i++) {
      if (markers[i].categoryId == vCatId) {
         markers[i].visible = vVisible;
      }
   }

   _this.refreshMap();

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
                        if (mapControl.isMobile()) {
                           mapControl.closeDrawer();
                        } else {
                           mapControl.resetContent();
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

   map.closePopup(); // Safe coding

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
   categories.forEach(function(entry) {
      catSelection = catSelection + '<option class="icon-BotW_Points-of-Interest" style="font-size: 14px;" value="'+ entry.id +'"' + (vMarker!=null&&vMarker.categoryId==entry.id?"selected":"") + '> ' + entry.name + '</option>';
   });

   var popupContent = '<h2 class="text-center popupTitle">'+ (vMarker!=null?vMarker.title:'New Marker') +'</h2>';

   if (user.level >= 5) {
      popupContent = popupContent +
         '<iframe id="form_target" name="form_target" style="display:none"></iframe>'+
         '<form id="imageUploadForm" action="content/upload.php" target="form_target" method="post" enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">'+
             '<input name="image" type="file" onchange="$(\'#imageUploadForm\').submit();this.value=\'\';">'+
             '<input style="display: none;" type="text" id="game" name="game" value="'+mapOptions.shortName+'" />'+
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
               '<input style="display: none;" type="text" id="game" name="game" value="' + mapOptions.id + '" />'+
               '<input style="display: none;" type="text" id="lat" name="lat" value="' + vLatLng.lat + '" />'+
               '<input style="display: none;" type="text" id="lng" name="lng" value="' + vLatLng.lng + '" />'+
               '<input style="display: none;" type="text" id="userId" name="userId" value="' + user.id + '" />'+
               (vMarker!=null ? '<input style="display: none;" type="text" id="markerId" name="markerId" value="'+vMarker.id+'" />' : '')+
               '<input style="display: none;" type="text" id="submapId" name="submapId" value="'+mapControl.getCurrentMap().subMapId+'" />'+
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
                     '<button id="add_field_button" type="button" class="btn btn-link">Add more</button>'+
                  '</div>'+
               '</div>'+
               '<div class="modal-footer">'+
                  '<div>'+
                     '<button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>'+
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
   mapControl.setContent(popupContent, 'newMarker');

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
              url: "ajax/add_marker.php",
              data: $("#newMarkerForm").serialize(), // serializes the form's elements.
              success: function(data) {
                  data = jQuery.parseJSON(data);
                  if (data.success) {
                     if (user.level < 5) {
                        tinymce.remove();
                        mapControl.resetContent();
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
                        map.addLayer(markers[markers.length - 1]);
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
   categories.forEach(function(category) {
      categories[category.id].complete = 0;
   }, this);

   //@TODO: Use gameID from zmap, not zmain
   $.getJSON("ajax.php?command=get_user_completed_markers&game=" + gameId + "&userId=" + user.id, function(vResults) {
      $.each(vResults, function(i,marker){

         for (var i = 0; i < markers.length; i++) {
            if (markers[i].id == marker.markerId) {
               completedMarkers.push(marker.markerId);

               categories[markers[i].categoryId].complete++;
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
   for (var i = 0; i < markers.length; i++) {
      if (markers[i].id == vID) {
         if (vComplete) {
            _this._doSetMarkerDoneAndCookie(markers[i]);
         } else {
            _this._doSetMarkerUndoneAndCookie(markers[i]);
         }
         break;
      }
   }
}

ZMap.prototype._doSetMarkerDoneIcon = function(vMarker, vComplete) {
   vMarker.complete = vComplete;
   vMarker.setIcon(_this._createMarkerIcon(vMarker.categoryId, vComplete));
}

ZMap.prototype._doSetMarkerDoneAndCookie = function(vMarker) {
   for (var i = 0; i < completedMarkers.length; i++) {
      if (completedMarkers[i] == vMarker.id) {
         return;
      }
   }
   completedMarkers.push(vMarker.id);
   _this._doSetMarkerDoneIcon(vMarker, true);
   if (user != null || user != undefined) {
      $.ajax({
              type: "POST",
              url: "ajax.php?command=add_complete_marker",
              data: {markerId: vMarker.id, userId: user.id},
              success: function(data) {
                  //data = jQuery.parseJSON(data);
                  if (data.success) {
                     categories[vMarker.categoryId].complete++;
                  } else {
                     toastr.error(_this.langMsgs.MARKER_ADD_COMPLETE_ERROR.format(data.msg));
                     //alert(data.msg);
                  }
              }
            });
   } else {
      categories[vMarker.categoryId].complete++;
      setCookie('completedMarkers', JSON.stringify(completedMarkers));
      if (!userWarnedAboutLogin) {
         toastr.warning(_this.langMsgs.MARKER_COMPLETE_WARNING);
         userWarnedAboutLogin = true;
      }
   }
   if (!mapOptions.showCompleted) {
      // If we need to hide completed markers, remove the pin on top of the marker and reset the content of the map control
      // Issue: https://github.com/Zelda-Universe/Zelda-Maps/issues/231
      _this._closeNewMarker();
      mapControl.resetContent();
      _this.refreshMap();
   }
}


if (!Array.prototype.filter) {
  Array.prototype.filter = function(fun/*, thisArg*/) {
    'use strict';

    if (this === void 0 || this === null) {
      throw new TypeError();
    }

    var t = Object(this);
    var len = t.length >>> 0;
    if (typeof fun !== 'function') {
      throw new TypeError();
    }

    var res = [];
    var thisArg = arguments.length >= 2 ? arguments[1] : void 0;
    for (var i = 0; i < len; i++) {
      if (i in t) {
        var val = t[i];

        // NOTE: Technically this should Object.defineProperty at
        //       the next index, as push can be affected by
        //       properties on Object.prototype and Array.prototype.
        //       But that method's new, and collisions should be
        //       rare, so use the more-compatible alternative.
        if (fun.call(thisArg, val, i, t)) {
          res.push(val);
        }
      }
    }

    return res;
  };
}

ZMap.prototype._doSetMarkerUndoneAndCookie = function(vMarker) {
   completedMarkers = completedMarkers.filter(function(item) {
      return item !== vMarker.id;
   });
   _this._doSetMarkerDoneIcon(vMarker, false);

   if (user != null || user != undefined) {
      $.ajax({
              type: "POST",
              url: "ajax.php?command=del_complete_marker",
              data: {markerId: vMarker.id, userId: user.id},
              success: function(data) {
                  //data = jQuery.parseJSON(data);
                  if (data.success) {
                     categories[vMarker.categoryId].complete--;
                  } else {
                     toastr.error(_this.langMsgs.MARKER_DEL_COMPLETE_ERROR.format(data.msg));
                     //alert(data.msg);
                  }
              }
            });
   } else {
      setCookie('completedMarkers', JSON.stringify(completedMarkers));
      categories[vMarker.categoryId].complete--;
      if (!userWarnedAboutLogin) {
         toastr.warning(_this.langMsgs.MARKER_COMPLETE_WARNING);
         userWarnedAboutLogin = true;
      }
   }
   vMarker.complete = false;
   if (!mapOptions.showCompleted) {
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
                           //data = jQuery.parseJSON(data);
                           if (data.success) {
                              categories[vMarker.categoryId].complete--;
                           } else {
                              toastr.error(_this.langMsgs.MARKER_DEL_COMPLETE_ERROR.format(data.msg));
                              //alert(data.msg);
                           }
                       }
                     });

            } else {
               categories[markers[i].categoryId].complete--;
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
   if (map == null || map.contextmenu == null) {
      return;
   }

   function addMarker(e) {

      map.closePopup(); // Safe coding

      if (newMarker != null) {
         map.removeLayer(newMarker);
      }
      newMarker = new L.marker(e.latlng).addTo(map);
      map.contextmenu.hide();
      map.panTo(e.latlng);
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
         callback: function(e) { map.panTo(e.latlng); }
      }, '-', {
         text: 'Zoom in',
         //icon: 'images/zoom-in.png',
         callback: function() {map.zoomIn()}
      }, {
         text: 'Zoom out',
         //icon: 'images/zoom-out.png',
         callback: function() {map.zoomOut()}
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
   map.contextmenu.removeAllItems();
   for (var i = 0; i < contextMenu.length; i++) {
      map.contextmenu.addItem(contextMenu[i]);
   }
}

ZMap.prototype.logout = function() {
   $.ajax({
      type: "POST",
      url: "ajax.php?command=logout",
      success: function(data) {
         //data = jQuery.parseJSON(data);
         if (data.success) {
            toastr.success(_this.langMsgs.LOGOUT_SUCCESS.format(user.username));
            user = null;
            updateAdState();
            _this._buildContextMenu();
            mapControl.resetContent();
            showLoginControls();
         } else {
            toastr.error(_this.langMsgs.LOGOUT_ERROR.format(data.msg));
         }
      }
   });
};


ZMap.prototype._createRegisterForm = function() {
   mapControl.setContent('<div id="newuser">'+
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
                                    '<button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>'+
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
               toastr.success(_this.langMsgs.REGISTER_SUCCESS.format($("#user")[0].value));
               _this._createLoginForm();
            } else {
               console.log(data.msg);
               toastr.error(_this.langMsgs.REGISTER_ERROR.format(data.msg));
            }
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
   mapControl.setContent('<div id="lostpassword">'+
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
                                    '<button type="submit" class="btn btn-primary btn-lg btn-block">Reset Password</button>'+
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
               mapControl.resetContent();
            } else {
               console.log(data.msg);
               toastr.error(_this.langMsgs.LOST_PASSWORD_ERROR.format(data.msg));
            }
        }
      });

      e.preventDefault();
   });
}

ZMap.prototype._createChangePasswordForm = function() {
   mapControl.setContent('<div id="changepassword">'+
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
                                '<button type="submit" class="btn btn-primary btn-lg btn-block">Change Password</button>'+
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
               mapControl.resetContent();
            } else {
               console.log(data.msg);
               toastr.error(_this.langMsgs.CHANGE_PASSWORD_ERROR.format(data.msg));
            }
        }
      });

      e.preventDefault();
   });
}

ZMap.prototype._createLoginForm = function() {
   mapControl.setContent('<div id="login">'+
                           '<h3 class="text-center">' + this.langMsgs.LOGIN_WELCOME + '</h3>'+
                           '<form class="leaflet-control-layers-list" role="loginform" id="loginform" enctype="multipart/form-data">'+
                           '<div class="form-group">'+
                              '<div class="cols-sm-10">'+
                                 '<div class="input-group">'+
                                    '<span class="input-group-addon"><i class="fa-user fa" aria-hidden="true"></i></span>'+
                                    '<input type="text" class="form-control" name="user" id="user" required="" placeholder="Username"/>'+
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
                                 '<button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>'+
                              '</div>'+
                              '<div>'+
                                '<button id="login_lost_btn" type="button" class="btn btn-link">Lost Password?</button>'+
                                '<button id="login_register_btn" type="button" class="btn btn-link">Register</button>'+
                              '</div>'+
                           '</div>'+
                           '</form>'+
                        '</div>', 'loginForm');

   $("#loginform").submit(function(e) {
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
               mapControl.resetContent();
            } else {
               console.log(data.msg);
               toastr.error(_this.langMsgs.LOGIN_ERROR.format(data.msg));
            }
        }
      });
      e.preventDefault();
   });

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
  mapControl.setContent(
     '<div id="account">' +
      '<h3 class="text-center">' +
        this.langMsgs.ACCOUNT_TITLE +
      '</h3>' +
      '<p>' +
        'Username: ' + user.username + '<br />' +
        ((user.level >= 5) ? 'Level: ' + user.level + '<br />' : "") +
      '</p>' +
      '<div class="modal-footer">' +
         '<div>' +
           '<button id="account_clear_completed_btn" type="button" class="infoWindowIcn">Reset Completed Markers</button>' +
           '<button id="account_reset_btn" type="button" class="infoWindowIcn">Reset Password</button>' +
           '<button id="account_change_btn" type="button" class="infoWindowIcn">Change Password</button>' +
           '<button id="log_out_btn" type="button" class="infoWindowIcn">Log out</button>' +
         '</div>' +
      '</div>' +
    '</div>',
    'accountPage'
  );

  $("#account_clear_completed_btn").click(function(e) {
     _this._createDialogDeleteAllMarkers();
     categories.forEach(function(category) {
       category.complete = 0;
     }, this);
     mapControl.resetContent();
     e.preventDefault();
  });

  $("#account_reset_btn").click(function(e) {
     _this._createLostPasswordForm();
     e.preventDefault();
  });

  $("#account_change_btn").click(function(e) {
     _this._createChangePasswordForm();
     e.preventDefault();
  });

  $("#log_out_btn").click(function(e) {
     this.logout();
     e.preventDefault();
  }.bind(this));
}
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
ZMap.prototype.goTo = function(vGoTo) {
   if (vGoTo.hideOthers) {
      for (var i = 0; i < markers.length; i++) {
         markers[i].visible = false;
      }
      _this.refreshMap();
   }

   if (vGoTo.marker) {
      _this._openMarker(vGoTo.marker, vGoTo.zoom, !vGoTo.hidePin, true);
      // Open Marker already does a change map, so it takes precedence

      return;
   }

   if (vGoTo.map || (vGoTo.map && vGoTo.subMap)) {
      mapControl.changeMap(vGoTo.map, vGoTo.subMap);
   }
}

/**
 * Go To and Open popup of the markerId informed
 *
 * @param vMarkerID             - Marker ID to be opened
 **/
ZMap.prototype._openMarker = function(vMarkerId, vZoom) {
   _openMarker(vMarkerId, vZoom, true, false);
}

ZMap.prototype._openMarker = function(vMarkerId, vZoom, vPin, vPanTo) {
   var marker = this.cachedMarkersById[vMarkerId];
   if(marker) {
     mapControl.changeMap(marker.mapId, marker.submapId);
     marker.visible = true;

     if (!vZoom) {
        vZoom = map.getZoom();
     }
     if (vZoom > map.getMaxZoom()) {
        vZoom = map.getMaxZoom();
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
     map.setView(latlng, vZoom);
     _this._createMarkerPopup(marker);
     if (vPin) {
         newMarker = L.marker(marker._latlng).addTo(map);
     }

     //$('#mkrDiv'+vMarkerId).unslider({arrows:false});
     if (vPanTo) {
        map.panTo(marker.getLatLng());
     }
     return;
   }

   toastr.error(_this.langMsgs.GO_TO_MARKER_ERROR.format(vMarkerId));
}

ZMap.prototype.getMarkers = function() {
  return markers;
};
//****************************************************************************//
//*************                                                  *************//
//*************                    END - GO TO                   *************//
//*************                                                  *************//
//****************************************************************************//
