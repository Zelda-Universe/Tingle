// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// Main config set-up with defaults
// todo: change to 'define' and add desc field?
// Direct Settings(?)
ZConfig.setDefault('autoUpdateUrl'            , 'true' );
ZConfig.setDefault('autoUpdateUrlMapsMenu'    , 'true' );
ZConfig.setDefault('autoUpdateUrlMove'        , 'true' );

ZConfig.setDefault('boundTopX'                , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('boundTopY'                , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('boundBottomX'             , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('boundBottomY'             , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('breaktime'                , 'false' ); // For development investigations

ZConfig.setDefault('categoriesSelectedIds'    , '[]'    );
// "exact", "focus" (ZU default)
ZConfig.setDefault('categorySelectionMethod'  , 'focus' );
ZConfig.setDefault('centerX'                  , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('centerY'                  , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('changelog'                , 'true'  );
ZConfig.setDefault('changelogForce'           , 'false' );
ZConfig.setDefault('codetrace-methodsToIgnore', '{}'    );
ZConfig.setDefault('codetrace-targetClasses'  , '[]'    );

ZConfig.setDefault('collapsed'                , 'false' );

ZConfig.setDefault('contextmenu'              , 'true'  );
ZConfig.setDefault('contextmenuWidth'         , '140'   );

ZConfig.setDefault('enforceMaxBounds'         , 'true'  );
ZConfig.setDefault('errorTileUrl'             , ''      );
ZConfig.setDefault('hideOthers'               , 'false' );
ZConfig.setDefault('hidePin'                  , 'false' );
ZConfig.setDefault(
  'layersBottomHeightOptionsDefaults',
  JSON.stringify({
    position: 'topleft',
    delay: 0,
    //openTo: 78,
    openTo: 150,
    softOpenBottom: 250,
    softOpenTo: 0 // REVERSE
}));
ZConfig.setDefault('layersBottomHeightOptionsOverrides', '{}');
ZConfig.setDefault(
  'layersHeight',
  Math.max(window.innerHeight - 250, 250) + 'px'
);
ZConfig.setDefault('map'                      , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('marker'                   , ''      );
ZConfig.setDefault('markerClusters'           , 'false' );
ZConfig.setDefault('maxBoundsViscosity'       , '1.0'   );

//https://fusejs.io/api/options.html
ZConfig.setDefault('searchDefaults-markers'   , JSON.stringify({
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
ZConfig.setDefault('searchOverrides-markers'        , '{}');
ZConfig.setDefault('searchTargetIndexEnd-markers'   , ''  );
ZConfig.setDefault('searchTargetIndexStart-markers' , ''  );

ZConfig.setDefault('showInfoControls'         , 'false' );
ZConfig.setDefault('startTracing'             , 'false' );
ZConfig.setDefault('subMap'                   , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('tileAxisDirectories'      , 'false' );
ZConfig.setDefault('tilesBaseURL'             , 'https://zeldamaps.com/tiles/');
ZConfig.setDefault('tileZoomDirectories'      , 'false' );
ZConfig.setDefault('tileNameFormat'           , (
  (ZConfig.getConfig('tileAxisDirectories') == 'true')
  ? '{z}/{x}/{y}'
  : (ZConfig.getConfig('tileZoomDirectories') == 'true')
    ? '{z}/{x}_{y}'
    : '{z}_{x}_{y}'
));
// https://github.com/CodeSeven/toastr/blob/master/README.md#other-options
// https://codeseven.github.io/toastr/demo.html
ZConfig.setDefault('toastr', JSON.stringify({
  extendedTimeOut : 0,
  closeButton     : true,
  newestOnTop     : true,
  positionClass   : 'toast-top-full-width',
  timeOut         : 0
}));
ZConfig.setDefault('verbose'                  , 'false' );
ZConfig.setDefault('x'                        , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('y'                        , ''      ); // Also suffix with `-${gameId}`
ZConfig.setDefault('zLogger.gui'              , 'true'  ); // Enabled default for simple usage as this is can inform users of problems during regular application operation.
ZConfig.setDefault('zLogger.tui'              , 'false' ); // Disabled default for simple usage as this is mainly a development pathway.
// ZConfig.setDefault('zoom'                     , '0'     ); // Also suffix with `-${gameId}`
ZConfig.setDefault('zoomControl'              , 'false' );
ZConfig.setDefault('zoomDelta'                , '1'     );
ZConfig.setDefault('zoomSnap'                 , '1'     );

// debugPrint('ZConfig.defaults:');
// debugPrint(JSON.stringify(ZConfig.defaults, null, 2));
// debugPrint(ZConfig.defaults);
