// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

ZConfig = {
  options: {},
  getConfig: function(propertyName) {
    return this.options[propertyName];
  },
  setConfig: function(propertyName, defaultValue) {
    this.options[propertyName] = getSetOrDefaultValues([
        getUrlParam(propertyName),
        localStorage[propertyName],
        getCookie(propertyName),
      ],
      defaultValue
    );
  }
};

// Main config set-up with defaults

// Direct Settings
// "exact", "focus" (ZU default)
ZConfig.setConfig("categorySelectionMethod" , "focus" );
ZConfig.setConfig("changelog"               , 'true'  );
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
