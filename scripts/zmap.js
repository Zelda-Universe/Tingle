function ZMap() {
   var _this;
   
   this.version = '0.01';
   
   this.mapOptions = {};
   
   this.maps = [];
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
   this.markerIcon;
   
   this.categoryActions = [];
   
   //this.defaultTilesURL = 'tiles/'; // Local
   this.defaultTilesURL = 'https://zeldamaps.com/tiles/';

   this.catCtrl;
   
   this.newMarker = null;
   
   this.user;
   
   this.curCatVisible = null;
   this.bottomMenu;
};


/** 
 * Constructor of ZMap
 *
 * @param vMapOptions.markerURL        - URL of markers icons
 * @param vMapOptions.markerExt        - File extesion of marker icons 
 * @param vMapOptions.bgColor          - Background color of the map  (can be overidden by URL parameter - bgColor)
 * @param vMapOptions.showStreeView    - NOT USED BY LEAFLET
 * @param vMapOptions.showMapControl   - Shows/Hides map control (can be overidden by URL parameter - showMapControl
 * @param vMapOptions.showPanControl   - NOT USED BY LEAFLET
 * @param vMapOptions.showZoomControl  - Show/Hides zoom control (can be overidden by URL parameter - showZoomControl)
 * @param vMapOptions.centerX          - Initial center of map on the X axis, Longitude (can be overidden by URL parameter - x)
 * @param vMapOptions.centerY          - Initial center of map on the Y axis, Latitude (can be overidden by URL parameter - y)
 * @param vMapOptions.clusterMaxZoom   - Max zoom that the markers will be clustered
 * @param vMapOptions.clusterGridSize  - Grid size of clusters
 * @param vMapOptions.tileSize         - Tile Size of the map tiles
 **/
ZMap.prototype.constructor = function(vMapOptions) {
   
   _this = this;
   mapOptions = {};
   
   // Check if a option was passed
   if (vMapOptions == null) {
      alert("Need to pass options to map constructor");
      return false;
   } else {
      mapOptions = vMapOptions;
   }
   
   maps = [];
   _overlayMap=[];
   markers = [];
   categories = [];
   categoryTree = [];
   markerCluster = new L.MarkerClusterGroup({maxClusterRadius: mapOptions.clusterGridSize, disableClusteringAtZoom: mapOptions.clusterMaxZoom});
   currentMap = 0;
   currentOverlaypMap = -1;
   markerIcon = L.DivIcon.extend({options:{ iconSize:    [32,32]
                                      , iconAnchor:  [16,16]
                                      , popupAnchor: [0,0]
                                      }
                             });

   /*
   markerIcon = L.Icon.extend({options:{ iconSize:    [32,32]
                                      , iconAnchor:  [16,16]
                                      , popupAnchor: [0,0]
                                      }
                             });
                             
   labelIcon = L.DivIcon.extend({options:{ iconSize:    [121,49]
                                          , iconAnchor:  [60,25]
                                          , popupAnchor: [0,0]
                                      }
                             });
   */
   newMarker = null;
   user = null;
};

// Add a map category
ZMap.prototype.addCategory = function(category) {
   categories[category.id]          = new Object();
   categories[category.id].id       = category.id;
   categories[category.id].parentId = category.parentId;
   categories[category.id].checked  = (category.checked==1?true:false);
   categories[category.id].name     = category.name;
   categories[category.id].img      = category.img;
   categories[category.id].color    = category.color;
   categories[category.id].markerCategoryTypeId = category.markerCategoryTypeId;
};

// Add a map category
ZMap.prototype.setUser = function(vUser) {
   user = vUser;
   _this._buildContextMenu();
   _this._rebuildMarkerPopup();
};

/** 
 * Add a map passed through as a parameter
 *  A map can be an overlay, meaning that one map can be on top of another (not changing maps)
 *  This is useful for same area maps (Light World / Dark World or Present / Future Maps)
 * 
 * Overlay maps MUST be an overlay of itself, so it shows up on the controls
 *
 * @param vMap.id               - Map ID (Unique)
 * @param vMap.mapTypeName      - Map Type (FlatMap = Games) - NOT USED //@TODO: Treat different map types!
 * @param vMap.googleDefault    - If it's a google default (used for real world maps) - NOT USED //@TODO: Treat different map types!
 * @param vMap.name             - Name of the map
 * @param vMap.tileURL          - URL of directory of the tiles corresponding to this map
 * @param vMap.tileExt          - File extension of the tiles
 * @param vMap.mapOverlayId     - ID of the map that this will be show on top of
 *                                Ex: Light World (ID 1) will have an overlay_id of 1 (itself, for controls)
 *                                    Dark World (ID 2) will have an overlay_id of 1 (the light world, so it will show on top of it)
 *                                    Temple 1 (ID 3) will have an overlay_id of null, since it won't show on top of anything, and nothing will be on top of it
 * @param vMap.mapOverlayName   - Name of the overlay map (may be different, this is used on the overlay controls). Most of the time, it will be the same
 * @param vMap.maxZoom         - Max Zoom this map can go (overlay maps should have the same max zoom)
 * @param vMap.mapCopyright     - Copyright info of the map
 * @param vMap.mapMapper        - The person whom put this map together
 * @param vMap.isDefault        - The default map (not used)
 * @param vMap.default_zoom     - The initial zoom level when the map loads
 * @param vMap.img404           - Image to show when no tile image is found
 * @param vMap.empty_map        - If it's a empty map
 *
 **/
ZMap.prototype.addMap = function(vMap) {
   
   // If there is no subMap, we can't add to the map
   if (vMap.subMap.length == 0) {
      console.log("No subMap configured for \"" + vMap.name + "\"!!!");
      return;
   }
   
   // If only one submap exists, we just add it without any overlay
   if (vMap.subMap.length == 1 && vMap.subMap[0].submapLayer.length == 0) {
      
      var tLayer = L.tileLayer(this.defaultTilesURL + vMap.subMap[0].tileURL + '{z}_{x}_{y}.' + vMap.subMap[0].tileExt
                                           , { maxZoom:         vMap.maxZoom
                                             , attribution:     vMap.mapCopyright + ', ' + vMap.subMap[0].mapMapper
                                             , opacity:         vMap.subMap[0].opacity
                                             , noWrap:          true
//                                             , continuousWorld: false  // default is false
                                             , tileSize:        mapOptions.tileSize
                                             }
      );
                                               
      tLayer.id          = 'mID' + vMap.id;
      tLayer.originalId  = vMap.id;
      tLayer.title       = vMap.name;
      tLayer._overlayMap = [];
      maps.push(tLayer);
      
   } else {
      
      // Create the base map 
      //  We create it as an empty map, so different sized overlay maps won't show on top
      //  We could create based on first submap of the array, but then we would need to change the controller to not redisplay the first submap
      /* TODO: Improve this to use no tile at all (remove tile border)*/
      var tLayer = L.tileLayer(this.defaultTilesURL + vMap.subMap[0].tileURL + 'blank.png'
                                           , { maxZoom:         vMap.maxZoom
                                             // Attibution will be on the overlay!
                                             //, attribution:     vMap.mapCopyright + ", Mapper: " + vMap.subMap[0].mapMapper
                                             //, opacity:         vMap.subMap[0].opacity
                                             , noWrap:          true
                                             , tileSize:        mapOptions.tileSize
                                             }
      );
                                               
      tLayer.id          = 'mID' + vMap.id;
      tLayer.originalId  = vMap.id;
      tLayer.title       = vMap.name;
      tLayer._overlayMap = [];
      
      // Add all the submaps to the overlay array (including the first submap for control purposes)
      for (var i = 0; i < vMap.subMap.length; i++) {
         var overlay = L.tileLayer(this.defaultTilesURL + vMap.subMap[i].tileURL + '{z}_{x}_{y}.' + vMap.subMap[i].tileExt
                                            , { maxZoom:  vMap.maxZoom
                                              , attribution:     vMap.mapCopyright + ', ' + vMap.subMap[i].mapMapper
                                              , opacity:         vMap.subMap[i].opacity
                                              , noWrap:   true
                                              , tileSize: mapOptions.tileSize
                                            }
         );

         overlay.id          = 'mID' + vMap.subMap[i].id;
         overlay.originalId  = vMap.subMap[i].id;
         overlay.title       = vMap.subMap[i].name;
         overlay.isDefault   = vMap.subMap[i].isDefault;
         if (currentOverlaypMap == -1 && overlay.isDefault == 1) {
            currentOverlaypMap = tLayer._overlayMap.length;
         }
         
         if (vMap.subMap[i].submapLayer.length > 0) {
            
            overlay.layers = [];
            var bgZIdx = _this.backgroundZIndex;
            var fgZIdx = _this.foregroundZIndex;
   
            for (var j = 0; j < vMap.subMap[i].submapLayer.length; j++) {
               
               var submap = vMap.subMap[i].submapLayer[j];
               
               var overlay2 = L.tileLayer(this.defaultTilesURL + submap.tileURL + '{z}_{x}_{y}.' + submap.tileExt
                                                                       , { maxZoom:  submap.maxZoom
                                                                         , noWrap:   true
                                                                         , attribution: submap.mapMapper
                                                                         , zIndex:   (submap.type == 'B' ? bgZIdx++ : fgZIdx++)
                                                                         , tileSize: mapOptions.tileSize
                                                                         , opacity: submap.opacity
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
   
   if (currentOverlaypMap < 0) {
      currentOverlaypMap = 0;
   }
}

ZMap.prototype.addMarker = function(vMarker) {
   if (vMarker == null) {
      return;
   } else if (categories[vMarker.markerCategoryId] == null) {
      console.log("Wrong marker category. Marker ID: " + vMarker.id);
      return;
   }
   

   var marker;
   
   // != 3 means it's not a label
   if (vMarker.markerCategoryTypeId != 3) {
      marker = new L.Marker([vMarker.y,vMarker.x], { title: vMarker.name
                                                   //, icon: new markerIcon({iconUrl: mapOptions.markerURL + categories[vMarker.markerCategoryId].img + '.' + mapOptions.markerExt})
                                                   , icon: new markerIcon({className: 'map-icon-svg' 
                                                                          ,html: "<i class='icon-Button' style='color: " + categories[vMarker.markerCategoryId].color + ";'></i><div style='position: absolute;' class='icon-marker icon-" + categories[vMarker.markerCategoryId].img + "'></div>"
                                                                           })
                                                   });
   } else {
      marker = new L.Marker([vMarker.y,vMarker.x], { zIndexOffset: -1000
                                                   , icon: new L.DivIcon({ className: 'labelText'
                                                                         , html: vMarker.name})
/*
                                                                         , html:      '<div class="labelContainer" style="background-image: url('
                                                                                      + mapOptions.markerURL
                                                                                      + '_'
                                                                                      + categories[vMarker.markerCategoryId].img
                                                                                      + '.' + mapOptions.markerExt
                                                                                      + ')"><div class="labelText">'
                                                                                      + vMarker.name
                                                                                      + '</div></div>'
                                                                         })
*/
                                                   });

   }
   
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
   
   _this._createMarkerPopup(marker);
   
   markers.push(marker);
};

//@TODO: Use L.DOM.UTIL instead of plain html
ZMap.prototype._createMarkerPopup = function(marker) {
   
   // Type 1 = Normal popup
   if (marker.categoryTypeId == 1) {
     
      if (!bottomMenu.isMobile()) {
         var div = document.createElement('DIV');
         div.id = 'divP' + marker.id;
         div.className = 'banner';
         
         var content = "<h2 class='popupTitle'>" + marker.title + "</h2>";
         
         content = content + "<div class='popupContent' style='overflow-y: auto; max-height:" + (L.Browser.mobile?400:400)+"px;'>";
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
         }
         
         if (user != null) {
            if (user.level >= 10 || (user.level >= 5 && marker.userId == user.id)) {
               content +=  "<p style='text-align: left; float:left; margin-right: 10px;'><B> ID:</b> " + marker.id + "</p>"
                         + "<p style='text-align: right; float: right'><b>Sent By:</b> " + marker.userName + "</p>"
                         + "<br style='height:0pt; clear:both;'>"
                         + "<p style=\"float: right;\">"
                           + "<span class=\"icon-link infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"></span>"
                           + "<span class=\"icon-pencil infoWindowIcn\" onclick=\"_this.editMarker("+marker.id+"); return false\"></span>"
                           + "<span class=\"icon-cross infoWindowIcn\" onclick=\"_this.deleteMarker("+marker.id+"); return false\"></span>"
                         + "</p>"
                      + "</div>";
            } else {
               content += "<p style=\"float: right;\">"
                           + "<span class=\"icon-link infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"></span>"
                         + "</p>"
                      + "</div>";
            }
         } else {
            content += "<p style=\"float: right;\">"
                        + "<span class=\"icon-link infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"></span>"
                      + "</p>"
                   + "</div>";
         }
         div.innerHTML = content;   
         
         var popup;
         if (!L.Browser.mobile) {
            popup = L.popup({
               maxWidth: 400,
               offset: L.point(0, -10),
               className: (marker.tabText.length>1?'multiTab':'singleTab')
            });
            
         } else { // mobile
            popup = L.popup({
               maxWidth: 400,
               offset: L.point(0, -10),
               className: (marker.tabText.length>1?'multiTab':'singleTab')
            });
         }
         
         popup.setContent(div);
         
         
          marker.bindPopup(popup);
      } else {
         marker.on('click',function() {
            var content = "<h2 class='popupTitle'>" + marker.title + "</h2>";
            content = content + "<div>";
            if (marker.tabText.length > 1) {
               var ul = "<ul>";
               for (var i = 0; i < marker.tabText.length; i++) {
                  if (i == 0) {
                     ul = ul + "<li style=\"minHeight: 120px;\"><div class='popup-div-content' style='font: 12px/1.5 \"Helvetica Neue\", Arial, Helvetica, sans-serif;'>" + marker.tabText[i] + "</div></li>";   
                  } else {
                     ul = ul + "<li id='citem-" + i + "' style='display: none'><div class='popup-div-content' style='font: 12px/1.5 \"Helvetica Neue\", Arial, Helvetica, sans-serif;'>" + marker.tabText[i] + "</div></li>";
                  }
               }
               ul = ul + "</ul>";
               content = content + ul;
            } else if (marker.tabText.length == 1 && marker.tabText[0] != "") {
               content = content  + "<div class='popup-div-content'>" + marker.tabText[0] + "</div>";
            }
            
            content = content + "<div class='popup-div-content'>";
            if (user != null && user.level >= 5) {
               content +=  "<p style='text-align: left; float:left; margin-right: 10px;'><B> ID:</b> " + marker.id + "</p>"
                         + "<p style='text-align: right; float: right'><b>Sent By:</b> " + marker.userName + "</p>"
                         + "<br style='height:0pt; clear:both;'>"
                         + "<p style=\"float: right;\">"
                           + "<span class=\"icon-link infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"></span>"
                           + "<span class=\"icon-pencil infoWindowIcn\" onclick=\"_this.editMarker("+marker.id+"); return false\"></span>"
                           + "<span class=\"icon-cross infoWindowIcn\" onclick=\"_this.deleteMarker("+marker.id+"); return false\"></span>"
                         + "</p>"
                      + "</div>";
            } else {
               content += "<p style=\"float: right;\">"
                           + "<span class=\"icon-link infoWindowIcn\" onclick=\"_this._copyToClipboard("+marker.id+"); return false\"></span>"
                         + "</p>"
                      + "</div>";
            }
            content = content + "</div>";
            
            bottomMenu.setContents(content); 
            if (!bottomMenu._open) {
               bottomMenu.show();
            }
         });
      }
      
   }
   
   // Type 2 = Gateway to other marker
   if (marker.categoryTypeId == 2) {
      marker.on('click',function() {
         // Search the marker that we want to "jump" to
         for (var i = 0; i < markers.length; i++) {
            // If we find the marker to jump to, we do a change map (in case is a different map), go to it, and then show pop (if any)
            if (marker.jumpMarkerId == markers[i].id) {
               mapControl.changeMap(markers[i].mapId, markers[i].submapId);
               map.panTo(markers[i].getLatLng());
               markers[i].openPopup();
            }
         }
      })
   }
}

ZMap.prototype._rebuildMarkerPopup = function() {
   for (var i = 0; i < markers.length; i++) {
      _this._createMarkerPopup(markers[i]);
   }
}

ZMap.prototype.updateMarkerVisibility = function(vCatId, vVisible) {
   
   for (var i = 0; i < markers.length; i++) {
      if (markers[i].categoryId == vCatId) {
         markers[i].visible = vVisible;
      }
   }
   
   _this.refreshMap();
   
};

ZMap.prototype.refreshMap = function() {
   if (maps.length == 0) {
      return; //TODO: alert error
   }
   var oMap = maps[currentMap]._overlayMap;
   for (var i = 0; i < markers.length; i++) {
      if (markers[i].visible
            && ( (oMap && oMap[currentOverlaypMap] && oMap[currentOverlaypMap].id == 'mID' + markers[i].submapId && markers[i].mapOverlayId==null)
                 || (oMap && maps[currentMap].id == 'mID' + markers[i].submapId && oMap[currentOverlaypMap] && oMap[currentOverlaypMap].id == 'mID' + markers[i].mapOverlayId)
                 || (oMap == undefined && maps[currentMap].id == 'mID' + markers[i].submapId)
                 || (maps[currentMap].id == 'mID' + markers[i].mapId && markers[i].globalMarker==1)
               )
      ) {
         markerCluster.addLayer(markers[i]);
      } else {
         if (markerCluster.hasLayer(markers[i])) {
            markerCluster.removeLayer(markers[i]);
         }
      }
   }
};

ZMap.prototype.buildCategoryMenu = function(vCategoryTree) {
   categoryTree = vCategoryTree;
   return;
   
   /* A sub-action which completes as soon as it is activated.
   * Sub-actions receive their parent action as an argument to
   * their `initialize` function. We save a reference to this
   * parent action so we can disable it as soon as the sub-action
   * completes.
   */
   var immediateSubAction = L.ToolbarAction.extend({
      initialize: function(map, myAction) {
          this.map = map;
          this.myAction = myAction;
          L.ToolbarAction.prototype.initialize.call(this);                
      },
      addHooks: function() {
          this.myAction.disable();
      }
   });
   
   for (var i = 0; i < categoryTree.length; i++) {
      var categorySubActions = [];
      for (var j = 0; j < categoryTree[i].children.length; j++) {
        var subAction = immediateSubAction.extend({
                           options: {
                              toolbarIcon: {
                                 //TODO: Do logic for opacity
                                 html: '<span class="icon-' + categoryTree[i].children[j].img + '"></span>',//'<i class="fa fa-question" aria-hidden="true"></i>',
                                 tooltip: categoryTree[i].children[j].name
                              },
                              categoryId: categoryTree[i].children[j].id,
                              checked: categoryTree[i].children[j].checked
                           },
                           addHooks: function () {
                              this.options.checked = !this.options.checked;
                              if (this.options.checked) {
                                 this._icon.className = "icn";
                              } else {
                                 this._icon.className = "icnChecked";
                              }
                              _this.updateMarkerVisibility(this.options.categoryId, this.options.checked);
                              //immediateSubAction.prototype.addHooks.call(this);                                 
                              
                           }

                       });
        categorySubActions.push(subAction);
      }
      
      var customAction = L.ToolbarAction.extend({
                           options: {
                              toolbarIcon: {
                                 html: '<span class="icon-' + categoryTree[i].img + '"></span>',//'<i><img src="' + mapOptions.markerURL + categoryTree[i].img + '-ui.' + mapOptions.markerExt + '"></i>',
                                 tooltip: categoryTree[i].name
                              },
                              subToolbar: new L.Toolbar({ 
                                 actions: categorySubActions
                              })
                           }
      });
      
      this.categoryActions.push(customAction);
   }
   
   /* 
   if (mapOptions.help) {
      var helpText = this._createHelpText(categoryTree, true);
      var customAction = L.ToolbarAction.extend({
                           options: {
                              toolbarIcon: {
                                 html: '<i class="fa fa-question" aria-hidden="true"></i>',
                                 tooltip: 'Help'
                              }
                           },
                           content: 111,
                           addHooks: function () {
                              var helpPopup = L.popup({minWidth: (L.Browser.mobile?'200':'400'), className: 'credits' }).setContent(
                                 helpText.join("")
                              );
                              helpPopup.setLatLng([map.getCenter().lat - (Math.pow(2,map.getMaxZoom()+2-map.getZoom())/2), map.getCenter().lng]).openOn(map);
                           }
      });

      this.categoryActions.push(customAction);
      
      var helpText2 = this._createHelpText(categoryTree, false);
      var customAction = L.ToolbarAction.extend({
                           options: {
                              toolbarIcon: {
                                 html: '<i class="fa fa-question" aria-hidden="true"></i>',
                                 tooltip: 'Help'
                              }
                           },
                           content: 111,
                           addHooks: function () {
                              var helpPopup = L.popup({minWidth: (L.Browser.mobile?'200':'400'), className: 'credits' }).setContent(
                                 helpText2.join("")
                              );
                              helpPopup.setLatLng([map.getCenter().lat - (Math.pow(2,map.getMaxZoom()+2-map.getZoom())/2), map.getCenter().lng]).openOn(map);
                           }
      });

      this.categoryActions.push(customAction);
   }*/
}

ZMap.prototype._createHelpText = function(categoryTree, showCategoryHead) {
   var helpText = [];
   var cellCount = (L.Browser.mobile?2:4);
   
   if (showCategoryHead) {
      for (var i = 0; i < categoryTree.length; i++) {
         helpText.push('<div class="divTable"><div class="divTableHead"><img src="' + mapOptions.markerURL + categoryTree[i].img + '-ui.' + mapOptions.markerExt + '">' + categoryTree[i].name + '<img src="' + mapOptions.markerURL + categoryTree[i].img + '-ui.' + mapOptions.markerExt + '"></div>');
         helpText.push('<div class="divTableBody">');
         for (var j = 0; j < categoryTree[i].children.length; j++) {
            var divContent = '<div class="divTableCell" style="width: ' + (100/cellCount) + '%;"><img src="' + mapOptions.markerURL + categoryTree[i].children[j].img + '-ui.' + mapOptions.markerExt + '">' + categoryTree[i].children[j].name + '</div>';
            if (j % cellCount == 0) {
               helpText.push('<div class="divTableRow">');
               helpText.push(divContent);
            } else if ((j % cellCount) == cellCount - 1) {
               helpText.push(divContent);
               helpText.push('</div>');
            } else {
               helpText.push(divContent);
            }
         }
         for (var j = categoryTree[i].children.length % cellCount; j < cellCount; j++) {
               helpText.push('<div class="divTableCell" style="width: ' + (100/cellCount) + '%;">&nbsp;</div>');
            }
            helpText.push('</div>');
         
         helpText.push("</div></div>");
      }
   } else {
      var z = 0;
      helpText.push('<div class="divTable"><div class="divTableHead">Icons</div>');
      helpText.push('<div class="divTableBody">');
      for (var i = 0; i < categoryTree.length; i++) {
         for (var j = 0; j < categoryTree[i].children.length; j++) {
            var divContent = '<div class="divTableCell" style="width: ' + (100/cellCount) + '%;"><img src="' + mapOptions.markerURL + categoryTree[i].children[j].img + '-ui.' + mapOptions.markerExt + '">' + categoryTree[i].children[j].name + '</div>';
            if (z % cellCount == 0) {
               helpText.push('<div class="divTableRow">');
               helpText.push(divContent);
            } else if ((z % cellCount) == cellCount - 1) {
               helpText.push(divContent);
               helpText.push('</div>');
            } else {
               helpText.push(divContent);
            }
            z++;
         }
      }
      for (var j = z % cellCount; j < cellCount; j++) {
         helpText.push('<div class="divTableCell" style="width: ' + (100/cellCount) + '%;">&nbsp;</div>');
      }
      helpText.push('</div>');
      helpText.push("</div></div>");
   }
   return helpText;
}

ZMap.prototype.buildMap = function() {
   console.log("Leaflet Version: " + L.version);
   console.log("Zelda Maps Version: " + _this.version);
   if (maps.length == 0) {
      console.log("ERROR: Incorrect Map Configuration");
//      return; //TODO: Print error
   }

   
   if (!L.CRS.Simple) {
      L.CRS.Simple = L.Util.extend({}, L.CRS, { projection:     L.Projection.LonLat
                                              , transformation: new L.Transformation(1,0,1,0)
                                              });
   }

   bounds = new L.LatLngBounds(new L.LatLng(-50, 35), new L.LatLng(-206, 221));
   

   //map = L.map('map', { center:      new L.LatLng(mapOptions.centerX - 128,mapOptions.centerY + 128)
   map = L.map('map', { center:      new L.LatLng(mapOptions.centerY,mapOptions.centerX)
                      , zoom:        mapOptions.zoom
                      , zoomControl: false
                      , crs:         L.CRS.Simple
                      , maxBounds:   bounds
                      , maxBoundsViscosity: 1.0
                      , contextmenu: true
                      , contextmenuWidth: 140
//                      , contextmenuItems: _this._buildContextMenu()
   });
   
   // Get all the base maps
   var baseMaps = {};
   for (var i = 0; i < maps.length; i++) {
      baseMaps[maps[i].title] = maps[i];
   }
   
   
   // MAP CONTROL!
   var overlayMaps = {};

   for (var i = 0; i < maps[0]._overlayMap.length; i++) {
      overlayMaps[maps[0]._overlayMap[i].title] = maps[0]._overlayMap[i];
   }
   
   mapControl = L.control.zlayers2(baseMaps, null, {"collapsed": mapOptions.collapsed, "showMapControl": mapOptions.showMapControl, "zIndex": 0});
   mapControl.addTo(map);
   
   map.addLayer(markerCluster);
   
   
   
   bottomMenu = L.control.bottomMenu("bottom", categoryTree);
   bottomMenu.addTo(map);

   if (!bottomMenu.isMobile()) {
      _this._buildContextMenu();
   
      if (mapOptions.showZoomControl) {
         L.control.zoom({position:'bottomright'}).addTo(map);
      }

      var x = document.getElementsByClassName("leaflet-control-layers");
      for (var i = 0; i < x.length; i++) {
          x[i].style.display = "none";
      }
      var x = document.getElementsByClassName("leaflet-control-attribution");
      for (var i = 0; i < x.length; i++) {
          x[i].style.display = "none";
      }  
      var x = document.getElementsByClassName("leaflet-bottommenu");
      for (var i = 0; i < x.length; i++) {
          x[i].style.display = "";
      }
      
      document.getElementById("mobileAds").style.display = 'none';
      
   } else {
      var x = document.getElementsByClassName("leaflet-control-layers");
      for (var i = 0; i < x.length; i++) {
          x[i].style.display = "none";
      }
         
      var x = document.getElementsByClassName("leaflet-control-attribution");
      for (var i = 0; i < x.length; i++) {
          x[i].style.display = "none";
      }
      
      document.getElementById("desktopAds").style.display = 'none';
   }
   
   function showChangeLog() {
      if (!getCookie('showChangeLogV0.2')) {
         var win = L.control.window(map,{title:'Changelog',closeButton:false,maxWidth:400,modal: true,'prompt.buttonCancel':''})
                   .content("<p>New to version alpha 0.2</p>"
                           +"<p>- You can now add your own markers! Right click on the map and log in / create an account to start adding (best suited for desktop).</p>"
                           +"<p>- Optimizations for mobile devices.</p>"
                           +"<p>- Tons of new markers everyday!</p>"
                   ).prompt({buttonOK: 'Don\'t show this again!'
                            , buttonCancel: 'Close'
                            , callback:function(e){
                                 setCookie('showChangeLogV0.2', false);
                              }
                           })
                   .show();
      }
   }
   
   // INTRODUCTORY / WELCOME TEXT
   if (!getCookie('showWelcome')) {
      setTimeout(function () {
         map.closePopup();
         if (!bottomMenu.isMobile()) {
            var win = L.control.window(map,{title:'Welcome to Zelda Maps!',closeButton:false,maxWidth:400,modal: true,'prompt.buttonCancel':''})
                      .content("<p>Hello there!</p>"
                              +"<p>I have always been fascinated with game maps, especially those from <i>The Legend of Zelda</i>. I started by drawing maps in my notebook while playing the first <i>Zelda</i> games. Then, I created ASCII maps for <i>Ocarina of Time</i>. While playing more recent <i>Zelda</i> games, I used screenshots to piece together complete maps.</p>"
                              +"<p>Now, we are finally at a point where we can easily create interactive maps to share with other fans. This project is a <b>partnership</b> between <a href='https://www.zelda.com.br' target='new_'>Hyrule Legends</a> and <a href='http://zeldauniverse.net' target='new_'>Zelda Universe</a>, and we hope to create maps for every <i>Legend of Zelda</i> game.</p>"
                              +"<p>Right now, our hands are full playing <i>Breath of the Wild</i>, but we are constantly updating and adding new features. So keep checking in on us.</p>"
                              +"<div style='float: right'>May the Goddess smile upon you.</div><br style='clear:both'>"
                              +"<div style='float: right'>Danilo Passos.</div>"
                      ).prompt({buttonOK: 'Don\'t show this again!'
                               , buttonCancel: 'Close'
                               , callback:function(e){
                                    setCookie('showWelcome', false);
                                    showChangeLog();
                                 }
                               , cancelCallback:function(e){
                                    showChangeLog()
                               }
                              })
                      .show();
         } else {
            var win = L.control.window(map,{title:'Welcome to Zelda Maps!',closeButton:false,maxWidth:400,modal: true,'prompt.buttonCancel':''})
                      .content("<p>This project is a <b>partnership</b> between <a href='https://www.zelda.com.br' target='new_'>Hyrule Legends</a> and <a href='http://zeldauniverse.net' target='new_'>Zelda Universe</a>. We hope to create maps for every <i>Legend of Zelda</i> game.</p>"
                              +"<p>Right now, our hands are full playing <i>Breath of the Wild</i>, but we are constantly updating and adding new features. So keep checking in on us.</p>"
                              +"<div style='float: right'>May the Goddess smile upon you.</div><br style='clear:both'>"
                      ).prompt({buttonOK: 'Don\'t show this again!'
                               , buttonCancel: 'Close'
                               , callback:function(e){
                                    setCookie('showWelcome', false);
                                    showChangeLog();
                                 }
                               , cancelCallback:function(e){
                                    showChangeLog()
                               }
                              })
                      .show();
         }
         
      }, 500);
   } else {
      setTimeout(function () {
         showChangeLog();
      }, 500);
   }
   
   //map.on('click', function(e) { alert(1);console.log("Lat, Lon : " + e.latlng.lat + ", " + e.latlng.lng) });
   
   map.on('popupclose', function(e) {
      _this._closeNewMarker();
   });
   
   map.on('popupopen', function(e) {
      if (newMarker != null) {
         var wrapper         = $(".divTabBody"); //Fields wrapper
         var add_button      = $(".add_field_button"); //Add button ID
         
         var toolbarButtons = ['bold', 'italic', 'underline', 'strikeThrough', 'fontFamily', 'fontSize', '|', 'specialCharacters', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', 'insertHR', '-', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html'];
         $(add_button).click(function(e){ //on add input button click
            e.preventDefault();
            var c = ($('.tabText').length+1);
            $(wrapper).append(/*'<div class="divTableRow">' +
                                 '<div class="divTableCell"><label class="control-label col-sm-5"><strong>Tab Title (' + ($('.tabTitle').length+1) + '): </strong></label></div>'+
                                 '<div class="divTableCell tabTitle"><input size=38 type="string" placeholder="Title of Tab Content - Optional" class="form-control" id="tabTitle[]" name="tabTitle[]"></div>'+
                              '</div>'+*/
                              '<p style="vertical-align:top"><label class="control-label col-sm-5"><strong>Tab Text (' + c + '): </strong></label></p>'+
                              '<p><textarea id="tabText'+c+'" name="tabText[]" class="tabText" cols=40 rows=5></textarea></p>'
                              ); 
            //$('#tabText' + c).froalaEditor({imageDefaultWidth: '100%', theme: 'zmaps-froala', toolbarButtons});
            tinymce.init({selector:'textarea.tabText',
                           menubar: false,
                           plugins: [
                              'advlist autolink lists link image charmap print preview anchor',
                              'searchreplace visualblocks code fullscreen',
                              'insertdatetime media table contextmenu paste code'
                           ],
                           toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image fullscreen code',
                           content_css: '//www.tinymce.com/css/codepen.min.css'
            });
         });
         
         for (var i = 0; i < $('.tabText').length; i++) {
            //$('#tabText' + i).froalaEditor({imageDefaultWidth: '100%', theme: 'zmaps-froala', toolbarButtons});
         }
         tinymce.init({selector:'textarea.tabText',
                        menubar: false,
                        plugins: [
                           'advlist autolink lists link image charmap print preview anchor',
                           'searchreplace visualblocks code fullscreen',
                           'insertdatetime media table contextmenu paste code'
                        ],
                        toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image fullscreen code',
                        content_css: '//www.tinymce.com/css/codepen.min.css'
         });
         
         $("#form").submit(function(e) {
            $.ajax({
                    type: "POST",
                    url: "ajax/add_marker.php",
                    data: $("#form").serialize(), // serializes the form's elements.
                    success: function(data) {
                        data = jQuery.parseJSON(data);
                        if (data.success) {
                           if (user.level < 5) {
                              tinymce.remove();
                              _this._closeNewMarker();
                              alert("Thank you for your contribution!\n\nYour marker is pending review and, if approved, it will show up shortly.");
                           } else {
                              marker = jQuery.parseJSON(data.marker)[0];
                              
                              tinymce.remove();
                              _this._closeNewMarker();
                              if (data.action == "ADD") {
                                 _this.addMarker(marker);
                                 _this.refreshMap();
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
                                 _this.refreshMap();
                                 markers[markers.length - 1].openPopup();
                              }
                           }
                        } else {
                           console.log(data.msg);
                           alert("Ops, something went wrong!");
                        }
                    }
                  });

             e.preventDefault(); // avoid to execute the actual submit of the form.
         });
      } else if ((e.popup.getContent().innerHTML)!=null){
         if ((e.popup.getContent().innerHTML).search("<ul>") >= 0 || (e.popup.getContent().innerHTML).search("<ul class=") >= 0) {
            var slider = $('#' + e.popup.getContent().id).unslider({keys: false,               //  Enable keyboard (left, right) arrow shortcuts
                                                                    dots: true,               //  Display dot navigation
                                                                    arrows: true,
                                                                    fluid: true,
                                                                    });
            $.each( $("li[id^='citem-']"), function () {
               $(this).show();
            });
            slider.unslider('initSwipe');
         }
         var px = map.project(e.popup._latlng); // find the pixel location on the map where the popup anchor is
         px.y -= e.popup._container.clientHeight/2 // find the height of the popup container, divide by 2, subtract from the Y axis of marker location
         map.panTo(map.unproject(px),{animate: true}); 
      }
   });
   
    var inputClick = function(vMap, vOverlayMap) {
      _this._closeNewMarker();
      
      if (vMap != null) {
         currentMap = vMap;
      }
      if (vOverlayMap != null) {
         currentOverlaypMap = vOverlayMap;
      }
      _this.refreshMap();
      //drawnItems.removeFrom(map);
   };
   
   
   mapControl.inputClick = inputClick;
   setTimeout(_this.refreshMap, 300);
};

/** 
 * Go To a submap, layer or marker
 *
 * @param vGoTo.map             - Map ID (Unique)
 * @param vGoTo.subMap          - Submap ID (Unique)
 * @param vGoTo.marker          - Marker to be opened (Takes precedence over subMap and Layer)
 **/
ZMap.prototype.goTo = function(vGoTo) {
   
   if (vGoTo.marker) {
      _this._openMarker(vGoTo.marker, vGoTo.zoom);
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
   for (var i = 0; i < markers.length; i++) {
      if (markers[i].id == vMarkerId) {
         
         mapControl.changeMap(markers[i].mapId, markers[i].submapId);
         
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
         var latlng = L.latLng(markers[i].getLatLng().lat, markers[i].getLatLng().lng);
         map.setView(latlng, vZoom);
         
         // Check if the marker at the zoom level is inside cluster... if it's, we need to open cluster before popup
         try {
            if (markerCluster.getVisibleParent(markers[i])) {
               markerCluster.getVisibleParent(markers[i]).spiderfy();            
            } 
         } catch (err) {
            // Do nothing, since the parent can`t spiderfy
         }
         markers[i].openPopup();         
         
         // Check if popup was opened. Sometimes, it may not due to leaflet lazy loading on mobile devices
         if (markers[i].getPopup().getLatLng() == undefined) {
            setTimeout(_this._openMarker(vMarkerId, vZoom), 300);
         } else {
            $('#mkrDiv'+vMarkerId).unslider({arrows:false});
         }
         return;
         
      }
   }
}

  /************ NEW MARKER **********************/
   
 ZMap.prototype._closeNewMarker = function() {  
   if (newMarker != null) {
      tinymce.remove();
      $("#form").remove();
      map.removeLayer(newMarker);
      newMarker = null;
   }
}

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
                     }
                  }
                  _this.refreshMap();
               } else {
                  alert(data.msg);
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
   
   map.closePopup();
   
   //return;
/*   newMarker = new L.Marker(vMarker._latlng, { title: vMarker.name
                                                   //, icon: new markerIcon({iconUrl: mapOptions.markerURL + categories[vMarker.categoryId].img + '.' + mapOptions.markerExt})
                                                   , icon: new markerIcon({className: 'map-icon-svg icon-' + categories[vMarker.categoryId].img})
                                             }).addTo(map);
*/
      newMarker = new L.Marker(vMarker._latlng, { title: vMarker.name
                                                , icon: new markerIcon({className: 'map-icon-svg' 
                                                                       ,html: "<i class='icon-Button' style='color: " + categories[vMarker.categoryId].color + ";'></i><div style='position: absolute;' class='icon-marker icon-" + categories[vMarker.categoryId].img + "'></div>"
                                                                        })
                                                }).addTo(map);
                                             
   var popupContent = _this._createPopupNewMarker(vMarker, vMarker._latlng);
   
   newMarker.bindPopup(popupContent,{
      //minWidth: 400,
      minWidth: $(document).width() / 2,
      maxHeight: $(document).height() / 2,
      minHeight: $(document).height() / 2,
      offset: L.point(0, -10)
   }).openPopup();

}

ZMap.prototype._createPopupNewMarker = function(vMarker, vLatLng) {  
      if (user == null) {
         alert('You are not logged!');
         return;
      }
      var catSelection = "";
      var catSelection2 = "";
      
      categories.forEach(function(entry) {
         //@History - 2017-02-13 - Removed validation if the parent id is null , so parent categories can be added as markers per Joshua's request 
         //if (entry.markerCategoryTypeId == 3) {
         //   catSelection2 = catSelection + '<option class="icon-BotW_Points-of-Interest" style="font-size: 14px;" value="'+ entry.id +'"> ' + entry.name + '</option>';
         //}
         // 
         //if (entry.parentId != null) {
            catSelection = catSelection + '<option class="icon-BotW_Points-of-Interest" style="font-size: 14px;" value="'+ entry.id +'"' + (vMarker!=null&&vMarker.categoryId==entry.id?"selected":"") + '> ' + entry.name + '</option>';
         //}
      });
      catSelection = catSelection + catSelection2;
      var popupContent = '<h2 class="popupTitle">'+ (vMarker!=null?vMarker.title:'New Marker') +'</h2><div class="popupContent" style="overflow-y: auto; max-height:400px;">'+
                  '<form role="form" id="form" enctype="multipart/form-data" class="form-horizontal">'+
                     '<div class="divTable">' +
                           '<div class="divTableRow">' +
                              '<p class="divTableCell"><label class="control-label col-sm-5"><strong>Category: </strong></label></p>'+
                              '<p class="divTableCell">' +
                                 '<select name="categoryId" id="categoryId">'+
                                 catSelection +
                                 '</select>'+
                              '</p>'+
                           '</div>'+
                        '<div class="divTableBody">';
      if (vMarker!=null && user!=null && user.level >= 10) {
      popupContent = popupContent +
                           '<div class="divTableRow">' +
                              '<p class="divTableCell" style="vertical-align:top"><label class="control-label col-sm-5"><strong>Visible? </strong></label></p>'+
                              '<p class="divTableCell"><input type="checkbox" placeholder="Visible?" class="form-control" id="isVisible" name="isVisible"'+(vMarker!=null&&vMarker.dbVisible==1?' checked':'')+'></p>'+
                           '</div>';
      }
      popupContent = popupContent +
                           '<div class="divTableRow">' +
                              '<p class="divTableCell"><label class="control-label col-sm-5"><strong>Title: </strong></label></p>'+
                              '<p class="divTableCell"><input type="string" placeholder="Title of Marker - Required" class="form-control" id="markerTitle" name="markerTitle"'+ (vMarker!=null?' value="' + vMarker.title + '"':'') +'></p>'+
                           '</div>'+

                           '<div class="divTableRow">' +
                              '<p class="divTableCell" style="vertical-align:top"><label class="control-label col-sm-5"><strong>Description: </strong></label></p>'+
                              '<p class="divTableCell"><textarea placeholder="Internal Description - Not visible to user" class="form-control" rows="3" cols=30 id="markerDescription" name="markerDescription">' + (vMarker!=null?vMarker.description:'') + '</textarea></p>'+
                           '</div>'+
                           '<div class="divTableRow">' +
                              '<p class="divTableCell" style="vertical-align:top"><label class="control-label col-sm-5"><strong>Global? </strong></label></p>'+
                              '<p class="divTableCell"><input type="checkbox" placeholder="Title of Marker - Required" class="form-control" id="isGlobal" name="isGlobal"'+(vMarker!=null&&vMarker.globalMarker==1?' checked':'')+'> (Ex: Appears on both Light World / Dark World)</p>'+
                           '</div>'+
/*                           '<div class="divTableRow">' +
                              '<div class="divTableCell"><label class="control-label col-sm-5"><strong>Tab Title (1): </strong></label></div>'+
                              '<div class="divTableCell tabTitle"><input size="38" type="string" placeholder="Title of Tab Content - Optional" class="form-control" id="tabTitle[]" name="tabTitle[]"></div>'+
                           '</div>'+
*/
                        '</div>'+
                     '</div>'+
                     '<div class="divTabBody">'
;
                           if (vMarker!=null) {
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

      popupContent = popupContent + '</div>';
                     //...
                     if (vMarker!=null) {
                        popupContent = popupContent +
                        '<input style="display: none;" type="text" id="markerId" name="markerId" value="'+vMarker.id+'" />';
                     }
      popupContent = popupContent +
                     '<input style="display: none;" type="text" id="game" name="game" value="'+mapOptions.id+'" />'+
                     '<input style="display: none;" type="text" id="lat" name="lat" value="' + vLatLng.lat + '" />'+
                     '<input style="display: none;" type="text" id="lng" name="lng" value="' + vLatLng.lng + '" />'+
                     '<input style="display: none;" type="text" id="userId" name="userId" value="' + user.id + '" />'+
                     '<input style="display: none;" type="text" id="submapId" name="submapId" value="'+mapControl.getCurrentMap().subMapId+'" />'+
                     '<br>' +
                     '<div class="divTableRow">'+
                        '<p style="text-align:center;" class="divTableCell"><button class="add_field_button">Add More</button></p>'+
                        '<p style="text-align:center;" class="divTableCell"><button type="submit" value="submit" class="submit" style="margin-left: 20px;">Submit</button></p>'+
                     '</div>'+
                     '<br>' +
                     '</form></div>';
   return popupContent;
}

ZMap.prototype._copyToClipboard = function(vMarkerId) {  
   var href = window.location.href.split("?");
   
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
   window.prompt("Copy to clipboard: Ctrl+C, Enter", href[0] + "?" + clipboardParams + "marker=" + vMarkerId + "&zoom=" + map.getZoom());
}

ZMap.prototype._updateCategoryVisibility = function(vCatId, vChecked) {
   
   var toogle = false;
   if (this.curCatVisible == vCatId) {
      toogle = true;
      this.curCatVisible = null;
   } else {
      this.curCatVisible = vCatId;
   }
   
   // @TODO: Improve logic... done in a hurry
   if (categories[vCatId].parentId != null) {
      function forEachCat(element, index, array) {
         
         if (element.id == vCatId) {
            categories[element.id].checked = true;
         } else {
            categories[element.id].checked = toogle;
         }
         _this.updateMarkerVisibility(element.id, categories[element.id].checked);
      }
      categories.forEach(forEachCat);
   }
      
   if (categories[vCatId].parentId == null) {
      function forEachCat(element, index, array) {
         
         if (element.parentId != null && element.parentId != vCatId) {
            categories[element.id].checked = toogle;
         }
         if (element.parentId == null && element.id != vCatId) {
            categories[element.id].checked = toogle;
         }
         if (element.parentId != null && element.parentId == vCatId) {
            categories[element.id].checked = true;
         }
         if (element.parentId == null && element.id == vCatId) {
            categories[element.id].checked = true;
         }
         _this.updateMarkerVisibility(element.id, categories[element.id].checked);
      }
      categories.forEach(forEachCat);
   }
   
   function forEachCat2(element, index, array) {
      var catMenu = document.getElementById("catMenu" + element.id);
      if (catMenu) { 
      
         if (categories[element.id].checked) {
            catMenu.style.opacity = 1;
         } else {
            catMenu.style.opacity = 0.35;
         }
      }
      var catMenuMobile = document.getElementById("catMenuMobile" + element.id);
      if (catMenuMobile) { 
         if (categories[element.id].checked) {
            catMenuMobile.style.opacity = 1;
         } else {
            catMenuMobile.style.opacity = 0.35;
         }
      }
   }
   categories.forEach(forEachCat2);
}

ZMap.prototype._buildContextMenu = function() {
   
   // Check if map and/or context was built
   if (map == null || map.contextmenu == null) {
      return;
   }
   
   function addMarker(e) {
      //alert(e.latlng);
      map.closePopup();
      _this._closeNewMarker();
      newMarker = new L.marker(e.latlng).addTo(map);
      
      var popupContent = _this._createPopupNewMarker(null, e.latlng);
      
      newMarker.bindPopup(popupContent,{
         //minWidth: 400,
         //maxHeight: 240,
         minWidth: $(document).width() / 2,
         maxHeight: $(document).height() / 2,
         minHeight: $(document).height() / 2,
      }).openPopup();
      
      map.contextmenu.hide();
   }

   function login() {
      
      L.control.window(map,{title:'Login', closeButton:false, modal: true, 'prompt.buttonCancel':''})
                  .content('<div id="login" class="popupContent" style="overflow-y: auto; max-height:400px;">'+
                           '<form role="loginform" id="loginform" enctype="multipart/form-data" class="form-horizontal">'+
                              '<div class="divTable">' +
                                 '<div class="divTableBody">' +
                                    '<div class="divTableRow">' +
                                       '<p class="divTableCell"><label class="control-label col-sm-5"><strong>User: </strong></label></p>'+
                                       '<p class="divTableCell"><input type="string" placeholder="Username" class="form-control" id="user" name="user"></p>'+
                                    '</div>'+
                                    '<div class="divTableRow">' +
                                       '<p class="divTableCell"></p>'+
                                       '<p class="divTableCell"><span class=\"infoWindowIcn\" style="float: right;" onclick=\"_this._createRegisterForm(); return false\">New user?</span></p>'+
                                    '</div>'+
                                    '<br>'+
                                    '<div class="divTableRow">' +
                                       '<p class="divTableCell"><label class="control-label col-sm-5"><strong>Password: </strong></label></p>'+
                                       '<p class="divTableCell"><input type="password" placeholder="Password" class="form-control" id="password" name="password"></p>'+
                                    '</div>'+
                                    '<br>'+
                                    '<div class="divTableRow">' +
                                       '<p class="divTableCell"><label class="control-label col-sm-5"><strong>Remember me: </strong></label></p>'+
                                       '<p class="divTableCell"><input type="checkbox" s="form-control" id="remember" name="remember"></p>'+
                                    '</div>'+
                                 '</div>'+
                              '</div>'+
                           '</form>'+
                        '</div>'
                  ).prompt({buttonOK: 'Login'
                         , buttonCancel: 'Cancel'
                         , callback:function(e){
                              var result = false;
                              $.ajax({
                                type: "POST",
                                async: false,
                                url: "ajax/login.php",
                                data: $("#loginform").serialize(), // serializes the form's elements.
                                success: function(data) {
                                    data = jQuery.parseJSON(data);
                                    if (data.success) {
                                       user = data.user;
                                       _this._buildContextMenu();
                                       map.closePopup();
                                       _this._rebuildMarkerPopup();
                                       result = true;
                                    } else {
                                       console.log(data.msg);
                                       alert(data.msg);
                                    }
                                }
                              });
                              return result;
                           }
                        })
                  .show();
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
//         callback: alert(1)
      }, {        
         text: 'Log Out',
         callback: function() {
            $.ajax({
               type: "POST",
               url: "ajax/logout.php",
               success: function(data) {
                  user = null;
                  _this._buildContextMenu();
                  map.closePopup();
                  _this._rebuildMarkerPopup();
               }
            });            
         }
      });
   }
   
   // Rebuild Context Menu by removing all items and adding them back together
   map.contextmenu.removeAllItems();
   for (var i = 0; i < contextMenu.length; i++) {
      map.contextmenu.addItem(contextMenu[i]);
   }
}
   
ZMap.prototype._createRegisterForm = function() {
   
   L.control.window(map,{title:'Create User', closeButton:false, modal: true, 'prompt.buttonCancel':''})
               .content('<div id="newuser" class="popupContent" style="overflow-y: auto; max-height:400px;">'+
                        '<form role="newuserform" id="newuserform" enctype="multipart/form-data" class="form-horizontal">'+
                           '<div class="divTable">' +
                              '<div class="divTableBody">' +
                                 '<div class="divTableRow">' +
                                    '<p class="divTableCell"><label class="control-label col-sm-5"><strong>User: </strong></label></p>'+
                                    '<p class="divTableCell"><input type="string" placeholder="Username" class="form-control" id="user" name="user"></p>'+
                                 '</div>'+
                                 '<br>'+
                                 '<div class="divTableRow">' +
                                    '<p class="divTableCell"><label class="control-label col-sm-5"><strong>Password: </strong></label></p>'+
                                    '<p class="divTableCell"><input type="password" placeholder="Password" class="form-control" id="password" name="password"></p>'+
                                 '</div>'+
                                 '<br>'+
                                 '<div class="divTableRow">' +
                                    '<p class="divTableCell"><label class="control-label col-sm-5"><strong>Name: </strong></label></p>'+
                                    '<p class="divTableCell"><input type="string" placeholder="John Smith" class="form-control" id="name" name="name"></p>'+
                                 '</div>'+
                                 '<br>'+
                                 '<div class="divTableRow">' +
                                    '<p class="divTableCell"><label class="control-label col-sm-5"><strong>Email: </strong></label></p>'+
                                    '<p class="divTableCell"><input type="string" placeholder="example@email.com" class="form-control" id="email" name="email"></p>'+
                                 '</div>'+
                              '</div>'+
                           '</div>'+
                        '</form>'+
                     '</div>'
               ).prompt({buttonOK: 'Create'
                      , buttonCancel: 'Cancel'
                      , callback:function(e){
                           var result = false;
                           $.ajax({
                             type: "POST",
                             async: false,
                             url: "ajax/user_add.php",
                             data: $("#newuserform").serialize(), // serializes the form's elements.
                             success: function(data) {
                                 data = jQuery.parseJSON(data);
                                 if (data.success) {
                                    alert(data.msg);
                                    result = true;
                                 } else {
                                    console.log(data.msg);
                                    alert(data.msg);
                                 }
                             }
                           });
                           return result;
                        }
                     })
               .show();
}