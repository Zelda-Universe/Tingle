// This script sets OSName variable as follows:
// "Windows"    for all versions of Windows
// "MacOS"      for all versions of Macintosh OS
// "Linux"      for all versions of Linux
// "UNIX"       for all other UNIX flavors
// "Unknown OS" indicates failure to detect the OS

var OSName="Unknown OS";
if (navigator.appVersion.indexOf("Win")!=-1) OSName="Windows";
if (navigator.appVersion.indexOf("Mac")!=-1) OSName="MacOS";
if (navigator.appVersion.indexOf("X11")!=-1) OSName="UNIX";
if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux";

function getUrlParam(vParam) {

   vParam = vParam.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");

   var regexS = "[\\?&]"+vParam+"=([^&#]*)";
   var regex = new RegExp(regexS);
   var vResults = regex.exec(window.location.href);

   if (vResults == null) {
      return "";
   } else {
      return vResults[1];
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
   document.cookie = cname + "=" + cvalue + ";" + expires;
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

function getMapCategories() {

   $.getJSON("ajax.php?command=get_categories&game=" + gameId, function(vResults){
      $.each(vResults, function(i,category){
         zMap.addCategory(category);
      });
   });

};

function getMapCategoriesTree() {

   $.getJSON("ajax.php?command=get_category_tree&game=" + gameId, function(vResults){
      zMap.buildCategoryMenu(vResults);
   });

};

function getMaps() {

   $.getJSON("ajax.php?command=get_map&game=" + gameId, function(vResults){
      $.each(vResults, function(i,map){
         zMap.addMap(map);
      });

      getMarkers();
   });

};

function getUserInfo() {
   $.getJSON("ajax.php?command=get_user_info", function(vResults) {
    if(vResults.user) {
      zMap.setUser(vResults.user);
      hideLoginControls();
    }
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

function getMarkers(){
   $.getJSON("ajax.php?command=get_markers&game=" + gameId, function(vResults) {
      zMap.buildMap();
      zMap.addMarkers(vResults);
      getUserInfo();
      zMap.refreshMap();
      zMap.goTo({ map        : getUrlParamValue('map', null)
                , subMap     : getUrlParamValue('subMap', null)
                , marker     : getUrlParamValue('marker', null)
                , zoom       : getUrlParamValue('zoom', 4)
      });

   });
};

zMap = new ZMap();
var gameId = getUrlParam("game");

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

function KeyPress(e) {
      var evtobj = window.event? event : e

      if (evtobj.key == 'z' && (
           ((OSName != 'MacOS') && evtobj.ctrlKey) ||
           ((OSName == 'MacOS') && evtobj.metaKey)
         )) {
         zMap.undoMarkerComplete();
      }
}

$(document).on('keydown', KeyPress);

// Initial Load
//  Get map that we want to load (the game ID)
$.getJSON("ajax.php?command=get_container&game=" + gameId, function(vResults){

   // Should only get only one map
   $.each(vResults, function(i, vContainer) {

      vContainer.showMapControl             = getUrlParamValue('showMapControl', vContainer.showMapControl);
      vContainer.collapsed                  = getUrlParamValue('collapsed', false);
      vContainer.showCategoryControl        = getUrlParamValue('showCategoryControl', true);//vContainer.showCategoryControl);
      if (getCookie('isCategoryOpen') == '') {
         setCookie('isCategoryOpen',"true");
      }
      vContainer.showCategoryControlOpened  = getUrlParamValue('showCategoryControlOpened', getCookie('isCategoryOpen')=="true");//vContainer.showCategoryControl);
      vContainer.showZoomControl            = getUrlParamValue('showZoomControl', vContainer.showZoomControl);

      vContainer.zoom                       = getUrlParamValue('zoom', 4); /*@TODO: Check if there is a zoom parameter. If not, use the one we got from the DB*/
      vContainer.zoomSnap                   = parseFloat(getUrlParamValue('zoomSnap', 1)); /*@TODO: Check if there is a zoomSnap parameter. If not, use the one we got from the DB*/
      vContainer.zoomDelta                  = parseFloat(getUrlParamValue('zoomDelta', 1)); /*@TODO: Check if there is a zoomDelta parameter. If not, use the one we got from the DB*/
      if (vContainer.zoom > vContainer.maxZoom) {
         vContainer.zoom = vContainer.maxZoom;
      }
      vContainer.centerX                    = getUrlParamValue('x', vContainer.centerX);
      vContainer.centerY                    = getUrlParamValue('y', vContainer.centerY);
      vContainer.bgColor                    = getUrlParamValue('bgColor', vContainer.bgColor);
      
      /* fitBounds entered as a csv to display/fit an area of the map on load */
      vContainer.fitBounds                  = getUrlParamValue('fitBounds', false);

      if (vContainer.fitBounds) {
         var fitBoundsCoordinates = vContainer.fitBounds.split(','); // 0,0,0,0 -> [0,0,0,0]
         for (var i=0; i<4; i++) {
            var ordinate = parseFloat(fitBoundsCoordinates[i]);
            if (ordinate != NaN) {
               vContainer.fitBounds[Math.floor(i/2)][i%2] = ordinate;
            } else {
               vContainer.fitBounds = false;
               break;
            }
         }
      }
      
      vContainer.help                       = getUrlParamValue('help', true);

      if (vContainer.bgColor[0] != '#') {
         vContainer.bgColor = '#' + vContainer.bgColor;
      }

      var showCompleted = getCookie('showCompleted');
      if (showCompleted == '') {
         setCookie('showCompleted',"true");
         vContainer.showCompleted = true;
      } else {
         vContainer.showCompleted = (showCompleted == 'true');
      }

      zMap.constructor(vContainer);

      gameId = vContainer.id;

      getMapCategories();

      if (vContainer.showCategoryControl) {
         getMapCategoriesTree();
      }


      var completedMarkers = getCookie('completedMarkers');
      if (completedMarkers != undefined && completedMarkers != null && completedMarkers != "") {
         zMap.addCompletedMarkers(JSON.parse(completedMarkers));
      }

      getMaps();

      $("#map").css("background-color", vContainer.bgColor);
      $("body").css("background-color", vContainer.bgColor);
      $("html").css("background-color", vContainer.bgColor);

   });

});
