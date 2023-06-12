// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Main config set-up with defaults

// Direct Settings
// "exact", "focus" (ZU default)
ZConfig.setConfig("categorySelectionMethod"   , "focus" );
ZConfig.setConfig("changelog"                 , 'true'  );
ZConfig.setConfig("collapsed"                 , 'false' );
ZConfig.getConfig("codetrace-methodsToIgnore" , '{}'    );
ZConfig.setConfig("codetrace-targetClasses"   , '[]'    );
ZConfig.setConfig("errorTileUrl"              , ''      );
ZConfig.setConfig("markerClusters"            , 'false' );
ZConfig.setConfig(
  "layersHeight",
  Math.max(window.innerHeight - 250, 250) + 'px'
);
ZConfig.setConfig(
  "layersBottomHeightOptionsDefaults",
  JSON.stringify({
    position: 'topleft',
    delay: 0,
    //openTo: 78,
    openTo: 150,
    softOpenBottom: 250,
    softOpenTo: 0 // REVERSE
}));
ZConfig.setConfig("layersBottomHeightOptionsOverrides", '{}');

//https://fusejs.io/api/options.html
ZConfig.setConfig("searchDefaults-markers"    , JSON.stringify({
  // pattern must be within (distance * threshold) number of characters away from location
  distance          : 20  ,
  findAllMatches    : true,
  includeScore      : true,
  includeMatches    : true,
  keys              : [
    'name'        ,
    'description' ,
    'tabText'
  ]                       ,
  // content starting offset for pattern
  location          : 0   ,
  maxPatternLength  : 32  ,
  minMatchCharLength: 3   ,
  shouldSort        : true,
  // 0.0 perfect match, 1.0 any match
  threshold         : 0.6
}));
ZConfig.setConfig("searchOverrides-markers"   , '{}'    );
ZConfig.setConfig('searchTargetIndexEnd-markers'  , null);
ZConfig.setConfig('searchTargetIndexStart-markers', null);

ZConfig.setConfig("showInfoControls"          , 'false' );
ZConfig.setConfig("tilesBaseURL"              , "https://zeldamaps.com/tiles/");
ZConfig.setConfig("tileAxisDirectories"       , 'false' );
ZConfig.setConfig("tileZoomDirectories"       , 'false' );

// Potentially Derived Settings
ZConfig.setConfig("tileNameFormat"  , (
  (ZConfig.getConfig("tileAxisDirectories") == 'true')
  ? '{z}/{x}/{y}'
  : (ZConfig.getConfig("tileZoomDirectories") == 'true')
    ? '{z}/{x}_{y}'
    : '{z}_{x}_{y}'
));
ZConfig.setConfig("verbose"                 , 'false' );
