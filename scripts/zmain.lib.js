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

function getGames() {
   $.getJSON("ajax.php?command=get_games", function(vResults) {
      if (vResults.success === false || vResults.length === 0) return;

      $.each(vResults, function(i,map){
        zMap.addGame(map);
      });
   });
};

function getMaps() {
  $.getJSON("ajax.php?command=get_map&game=" + gameId, function(vResults) {
    $.each(vResults, function(i, map) {
      zMap.addMap(map);
    });

    if (maps.length > 0) getMarkers();
  });
};

function getUserInfo() {
   $.getJSON("ajax.php?command=get_user_info", function(vResults) {
    if(vResults.user) zMap.setUser(vResults.user);
    updateAdState();
    if(ZConfig.getConfig("changelog") == 'true')
      checkChangelog(vResults.user);
   });
};

function checkChangelog(user) {
   var lastSeenVersion = getCookie(seenChangelogVersionCookieName);
   if (lastSeenVersion == null || lastSeenVersion == "") {
      lastSeenVersion = '0.0.0';
   }

   new ChangelogHandler({
    user: user,
    seenChangelogVersion: lastSeenVersion,
    version: zMap.version
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

function getMarkers() {
  $.getJSON("ajax.php?command=get_markers&game=" + gameId, function(vResults) {
    zMap.buildMap();
    getUserInfo();
    zMap.addMarkers(vResults);
    zMap.refreshMap();
    zMap.goToStart();
    zMap.goTo({
      map        : getUrlParamValue('map'       , null  )
    , subMap     : getUrlParamValue('subMap'    , null  )
    , marker     : getUrlParamValue('marker'    , null  )
    , zoom       : getUrlParamValue('zoom'      , 4     )
    , hideOthers : getUrlParamValue('hideOthers', false )
    , hidePin    : getUrlParamValue('hidePin'   , false )
    });
  });
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
    zlogger.error("Map parameter is invalid: \"" + input + "\".  Ignoring, and continuing to load the map with the default view.");
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

function updateAdState() {
  var authenticated = !!user;
  var mobileAds = document.getElementById("mobileAds");
  if(mobileAds) $(mobileAds).toggleClass("hidden", (!mapControl.isMobile() || authenticated));
  var desktopAds = document.getElementById("desktopAds");
  if(desktopAds) $(desktopAds).toggleClass("hidden", (mapControl.isMobile() || authenticated));
};

function notifyFatal(message) {
  zlogger.error(
    message, {
    closeButton: true,
    positionClass: "toast-top-full-width",
    timeOut: 0,
    extendedTimeOut: 0
  });
};
