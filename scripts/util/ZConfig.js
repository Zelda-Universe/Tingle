// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

ZConfig = {
  options: {},
  getConfig: function(propertyName, propertyType="String") {
    return this._castValue(
        getSetOrDefaultValues([
          window[propertyName],
          getUrlParam(propertyName),
          localStorage[propertyName],
          getCookie(propertyName)
        ],
        this.options[propertyName]
      ),
      propertyType
    );
  },
  _castValue: function(stringValue, type) {
    switch(true) {
      case new RegExp("^bool(?:ean)?", "i").test(type):
      case type == Boolean:
        return (
          new RegExp("^true$", "i")
          .test(stringValue)
        );
        break;
      case type === undefined:
      case type === null:
      case new RegExp("^(?:str(?:ing)?)|(?:te?xt)", "i").test(type):
      case type == String:
      default:
        return stringValue;
        break;
    }
  },
  setConfig: function(propertyName, value) {
    this.options[propertyName] = value;
  }
};
["Boolean", "String"].forEach(function(type) {
  ZConfig["get"+type+"Config"] = function(propertyName) {
    return this.getConfig(propertyName, type);
  };
});

// Main config set-up with defaults

// Direct Settings
// "exact", "focus" (ZU default)
ZConfig.setConfig("categorySelectionMethod" , "focus" );
ZConfig.setConfig("changelog"               , 'false' );
ZConfig.setConfig("collapsed"               , 'false' );
ZConfig.setConfig("errorTileUrl"            , ''      );
ZConfig.setConfig("markerClusters"          , 'false' );
ZConfig.setConfig("showInfoControls"        , 'false' );
ZConfig.setConfig("tilesBaseURL"            , "https://zeldamaps.com/tiles/");
ZConfig.setConfig("tileAxisDirectories"     , 'false' );
ZConfig.setConfig("tileZoomDirectories"     , 'false' );

// Potentially Derived Settings
ZConfig.setConfig("tileNameFormat"  , (
  (ZConfig.getConfig("tileAxisDirectories") == 'true')
  ? '{z}/{x}/{y}'
  : (ZConfig.getConfig("tileZoomDirectories") == 'true')
    ? '{z}/{x}_{y}'
    : '{z}_{x}_{y}'
));
