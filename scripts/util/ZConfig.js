// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Main config set-up with defaults

// Direct Settings
ZConfig.setDefault('autoUpdateUrl'            , 'false' );
ZConfig.setDefault('autoUpdateUrlMapsMenu'    , 'false' );
ZConfig.setDefault('autoUpdateUrlMove'        , 'false' );
// "exact", "focus" (ZU default)
ZConfig.setDefault("categorySelectionMethod"   , "focus" );
ZConfig.setDefault("changelog"                 , 'true'  );
ZConfig.setDefault("changelogForce"            , 'false' );
ZConfig.setDefault("collapsed"                 , 'false' );
ZConfig.setDefault("codetrace-methodsToIgnore" , '{}'    );
ZConfig.setDefault("codetrace-targetClasses"   , '[]'    );
ZConfig.setDefault("errorTileUrl"              , ''      );
ZConfig.setDefault("markerClusters"            , 'false' );
ZConfig.setDefault(
  "layersHeight",
  Math.max(window.innerHeight - 250, 250) + 'px'
);
ZConfig.setDefault(
  "layersBottomHeightOptionsDefaults",
  JSON.stringify({
    position: 'topleft',
    delay: 0,
    //openTo: 78,
    openTo: 150,
    softOpenBottom: 250,
    softOpenTo: 0 // REVERSE
}));
ZConfig.setDefault("layersBottomHeightOptionsOverrides", '{}');

//https://fusejs.io/api/options.html
ZConfig.setDefault("searchDefaults-markers"    , JSON.stringify({
  ignoreLocation    : true,
  includeScore      : true,
  includeMatches    : true,
  keys              : [
    'name'        ,
    'description' ,
    'tabText'
  ]                       ,
  maxPatternLength  : 32  ,
  minMatchCharLength: 3   ,
  // 0.0 perfect match, 1.0 any match
  threshold         : 0.4 // default: 0.6
}));
ZConfig.setDefault("searchOverrides-markers"   , '{}'    );
ZConfig.setDefault('searchTargetIndexEnd-markers'  , null);
ZConfig.setDefault('searchTargetIndexStart-markers', null);

ZConfig.setDefault("showInfoControls"          , 'false' );
ZConfig.setDefault("tilesBaseURL"              , "https://zeldamaps.com/tiles/");
ZConfig.setDefault("tileAxisDirectories"       , 'false' );
ZConfig.setDefault("tileZoomDirectories"       , 'false' );

// https://github.com/CodeSeven/toastr/blob/master/README.md#other-options
// https://codeseven.github.io/toastr/demo.html
ZConfig.setDefault('toastr', JSON.stringify({
  extendedTimeOut : 0,
  closeButton     : true,
  newestOnTop     : true,
  positionClass   : "toast-top-full-width",
  timeOut         : 0
}));
ZConfig.setDefault("tileNameFormat"  , (
  (ZConfig.getConfig("tileAxisDirectories") == 'true')
  ? '{z}/{x}/{y}'
  : (ZConfig.getConfig("tileZoomDirectories") == 'true')
    ? '{z}/{x}_{y}'
    : '{z}_{x}_{y}'
));
ZConfig.setDefault("verbose"                  , 'false' );
ZConfig.setDefault('zLogger.tui'              , 'false' );
ZConfig.setDefault('zLogger.gui'              , 'true'  );
