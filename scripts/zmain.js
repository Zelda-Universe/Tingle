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
      var expires="";
   }
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
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
   
      getMakers();
   });
   
};

function getUserInfo() {
   $.getJSON("ajax.php?command=get_user_info", function(vResults) {
      zMap.setUser(vResults.user);
   });
};

function getMakers(){
   $.getJSON("ajax.php?command=get_markers&game=" + gameId, function(vResults){
      
      zMap.buildMap();
      $.each(vResults,function(i, marker){
         zMap.addMarker(marker);
      });
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
      if (vContainer.zoom > vContainer.maxZoom) {
         vContainer.zoom = vContainer.maxZoom;
      }
      vContainer.centerX                    = getUrlParamValue('x', vContainer.centerX);
      vContainer.centerY                    = getUrlParamValue('y', vContainer.centerY);
      vContainer.bgColor                    = getUrlParamValue('bgColor', vContainer.bgColor);

      vContainer.help                       = getUrlParamValue('help', true);
      
      if (vContainer.bgColor[0] != '#') {
         vContainer.bgColor = '#' + vContainer.bgColor;
      }
      
      zMap.constructor(vContainer);
      
      gameId = vContainer.id;
      
      getMapCategories();
      
      if (vContainer.showCategoryControl) {
         getMapCategoriesTree();
      }
      getMaps();

      getUserInfo();

      $("#map").css("background-color", vContainer.bgColor);
      $("body").css("background-color", vContainer.bgColor);
      $("html").css("background-color", vContainer.bgColor);
      
   });
   
});