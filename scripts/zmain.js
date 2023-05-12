zMap = new ZMap();

var gameId = getUrlParam("game");

$(document).on('keydown', globalKeyPressHandler);

// Initial Load
//  Get map that we want to load (the game ID)
$.getJSON(
  "ajax.php?command=get_container&game=" + gameId,
  function(vResults) {
     // Should only get only one map
   $.each(vResults, function(i, vContainer) {
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

      /* startArea entered as a csv to display/fit an area of the map on load */
      vContainer.startArea                  = getUrlParamValue('startArea', "-168,102,-148,122");

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

      getGames();
      getMaps();

      $("#map").css("background-color", vContainer.bgColor);
      $("body").css("background-color", vContainer.bgColor);
      $("html").css("background-color", vContainer.bgColor);

   });
});

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
  if(mobileAds) $(mobileAds).toggleClass("hidden", (!L.Browser.mobile || authenticated));
  var desktopAds = document.getElementById("desktopAds");
  if(desktopAds) $(desktopAds).toggleClass("hidden", (L.Browser.mobile || authenticated));
};
