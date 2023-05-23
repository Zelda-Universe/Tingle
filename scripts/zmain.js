zMap = new ZMap();
var gameId = getUrlParam("game");

$(document).on('keydown', globalKeyPressHandler);

// Initial Load
//  Get map that we want to load (the game ID)
$.getJSON(
  "ajax.php?command=get_container&game=" + gameId,
  function(vResults) {
    // Should only get only one map

    // if (vResults.success === false) { # Bad condition, or overlap???? false without msg???????? no success, or no vR at alll, must not be empty cont list success, no db conn at least perm/constr has msg, so what else.....
    //   notifyFatal('Container response provided!');
    //   return 1;
    // }
    if (vResults.success === false) {
      notifyFatal(vResults.msg);
      return 2;
    }

    if (vResults.length == 0 || !vResults.every((vC)=>vC)) {
      notifyFatal('No containers provided to load!');
      return 3;
    }

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
	  // @TODO: Validate this logic. It was breaking mobile + bad hardcode
      //vContainer.startArea                  = getUrlParamValue('startArea', "-168,102,-148,122");

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
