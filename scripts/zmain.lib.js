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
      vContainer.collapsed                  = getUrlParamValue('collapsed', L.Browser.mobile);
      vContainer.showCategoryControl        = getUrlParamValue('showCategoryControl', true);//vContainer.showCategoryControl);
      if (getCookie('isCategoryOpen') == '') {
         setCookie('isCategoryOpen',"true");
      }
      vContainer.showCategoryControlOpened  = getUrlParamValue('showCategoryControlOpened', getCookie('isCategoryOpen')=="true");//vContainer.showCategoryControl);
      vContainer.showZoomControl            = getUrlParamValue('showZoomControl', vContainer.showZoomControl);

      vContainer.zoom                       = getUrlParamValue('zoom', vContainer.defaultZoom);
      vContainer.zoomSnap                   = parseFloat(getUrlParamValue('zoomSnap', 1)); /*@TODO: Check if there is a zoomSnap parameter. If not, use the one we got from the DB*/
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

    [ '#map', 'body', 'html' ].forEach(function (selector) {
      $(selector).css('background-color', vContainer.bgColor);
    });
 });
}

function getMapCategories(categoriesSelectedIdPairsObject) {
  $.getJSON(
    "ajax.php?command=get_categories&game=" + gameId,
    function(vResults) {
      $.each(vResults, function(i, category) {
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
  );
};

function getGames() {
   $.getJSON("ajax.php?command=get_games", function(vResults) {
      if (vResults.success === false || vResults.length === 0) {
        zLogger.error('No games provided to switch between!');
        return 4;
      }

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

    getMarkers();
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

      finalLoad();
    }.bind(this, gameId)
  );
};

function finalLoad() {
  var marker = ZConfig.getConfig('marker');
  if(marker) {
    zMap.goTo({ marker: marker });
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

function updateAdState() {
  var authenticated = !!user;
  var mobileAds = document.getElementById("mobileAds");
  if(mobileAds) {
    $(mobileAds).toggleClass("hidden", (
      !isMobile() || authenticated
    ));
  }
  var desktopAds = document.getElementById("desktopAds");
  if(desktopAds) {
    $(desktopAds).toggleClass("hidden", (
      isMobile() || authenticated
    ));
  }
};

function isMobile() {
  return (
    L.Browser.mobile
    && window.innerWidth < 768
  )
}



/**** LANG *****/
function getLang(shortName) {

   $.getJSON("data/" + shortName + "/lang/en-us.json", function(vResults){
		zMap.addLanguage(vResults);
   });

};
