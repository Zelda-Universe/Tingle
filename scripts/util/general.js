// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// Phone-sized viewports use the mobile drawer. All current iPad viewports,
// including the 744px-wide iPad mini in portrait, use the desktop layout.
var MOBILE_LAYOUT_BREAKPOINT = 600;

// The order games are listed in, most played first; others follow in their
// existing order. Matches GAME_ORDER in lib/common/game_order.php.
var GAME_ORDER = ['OoT', 'TotK', 'BotW', 'EoW', 'LA'];

// The Ocarina of Time remake. Its database short name is OoTR; offline
// downloads and older links call it OoT. Use this rather than comparing names.
function isOcarina(shortName) {
  return /^ootr?$/i.test(shortName || '');
}

// The name search engines know a game by: the remake is searched for as
// "Ocarina of Time Remake", though the site shows "Ocarina of Time (2026)".
function seoGameName(game) {
  return isOcarina(game && game.shortName) ? 'Ocarina of Time Remake' : (game && game.name);
}

// A sorted copy of a list of games, or of their short names when getName is
// omitted and the items are strings.
function sortGames(list, getName) {
  getName = getName || function(item) { return item.shortName || item.id || item; };
  var rank = function(item) {
    var name=getName(item);
    var index = GAME_ORDER.indexOf(isOcarina(name) ? 'OoT' : name);
    return index === -1 ? GAME_ORDER.length : index;
  };
  return list
    .map(function(item, position) { return { item: item, position: position }; })
    .sort(function(a, b) { return rank(a.item) - rank(b.item) || a.position - b.position; })
    .map(function(entry) { return entry.item; });
};

function getMobileLayoutMediaQuery() {
  return window.matchMedia(
    '(max-width: ' + MOBILE_LAYOUT_BREAKPOINT + 'px)'
  );
};

function isMobile() {
  return (
    ZConfig.getConfig('forceMobile') == 'true'
    || getMobileLayoutMediaQuery().matches
  );
};

function watchMobileLayoutBreakpoint() {
  var mediaQuery = getMobileLayoutMediaQuery();
  var reloadLayout = function() {
    if(ZConfig.getConfig('forceMobile') != 'true') {
      if(typeof zMap !== 'undefined' && zMap && zMap.mapControl) {
        zMap.mapControl.setResponsiveLayout(isMobile());
      }
    }
  };

  if(mediaQuery.addEventListener) {
    mediaQuery.addEventListener('change', reloadLayout);
  } else {
    mediaQuery.addListener(reloadLayout);
  }
};

watchMobileLayoutBreakpoint();

// In landscape, an iPhone's Dynamic Island sits on one side only, but the
// safe-area insets are the same on both. Mark which side it's on, so the
// other side can use the space (styles/zmain.css). Turned counter-clockwise
// (90°) puts it on the left; clockwise (270° or -90°) on the right.
function updateNotchSide() {
  var angle = screen.orientation && typeof screen.orientation.angle === 'number'
    ? screen.orientation.angle
    : Number(window.orientation) || 0;
  angle = ((angle % 360) + 360) % 360;
  var root = document.documentElement;
  root.classList.toggle('zm-notch-left', angle === 90);
  root.classList.toggle('zm-notch-right', angle === 270);
};

updateNotchSide();
if(screen.orientation && screen.orientation.addEventListener) {
  screen.orientation.addEventListener('change', updateNotchSide);
}
window.addEventListener('orientationchange', updateNotchSide);
window.addEventListener('resize', updateNotchSide);

function getSetOrDefaultValue(value, defaultValue) {
  return (
    (value === undefined)
    ? defaultValue
    : value
  );
};

function getSetOrDefaultValues(arrayOfValues, defaultValue, addlCondition) {
  var valueFound;

  arrayOfValues.some(function(value) {
    var valueProcessed = getSetOrDefaultValue(value);

    if (
      valueProcessed !== undefined
      && valueProcessed !== null
      && valueProcessed !== ''
      && ((addlCondition) ? addlCondition(value) : true)
    ) {
      valueFound = valueProcessed;
      return true;
    }
  });

  return getSetOrDefaultValue(valueFound, defaultValue);
};

// https://stackoverflow.com/a/31689499/1091943
// Params:
// - [Array [Object]] arrayOfObjects
// - [String] or [Function] groupPropertyName
// - [Function] groupNameFormatter
// - [Function] objectFormatter
// - [Function] groupFormatter
function groupObjects(opts) {
  var groupsObject = opts.arrayOfObjects.reduce(function (groupsObj, object) {
    var groupName = (
      (typeof opts.groupPropertyName == "function")
      ? opts.groupPropertyName(object)
      : object[opts.groupPropertyName]);

    groupsObj[groupName] = groupsObj[groupName] || [];
    groupsObj[groupName].push((
      (opts.objectFormatter)
      ? opts.objectFormatter(object)
      : object
    ));
    return groupsObj;
  }, {});

  if(opts.groupFormatter) {
    for(var groupName in groupsObject) {
      groupsObject[groupName] = opts.groupFormatter(groupsObject[groupName]);
    }
  }

  return groupsObject;
};

// https://github.com/krisk/Fuse/issues/6#issuecomment-191937490
// Does not account for overlapping highlighted regions, if that exists at all O_o..
function generateHighlightedText(text, regions) {
  if(!regions) return text;

  var content = '', nextUnhighlightedRegionStartingIndex = 0;

  regions.forEach(function(region) {
    content += '' +
      text.substring(nextUnhighlightedRegionStartingIndex, region[0]) +
      '<span class="highlight">' +
        text.substring(region[0], region[1] + 1) +
      '</span>' +
    '';
    nextUnhighlightedRegionStartingIndex = region[1] + 1;
  });

  content += text.substring(nextUnhighlightedRegionStartingIndex);

  return content;
};

function recurseTree(callback, tree) {
  Object
  .entries(tree)
  .forEach(
    function([treeChildId, treeChild]) {
      recurseTreeAction.call(this, callback, treeChild);
    },
    this
  );
};

function recurseTreeAction(callback, treeChild) {
  callback.call(this, treeChild);

  if(treeChild.children) {
    Object
    .entries(treeChild.children)
    .forEach(
      function([treeChildId, treeChild]) {
        recurseTreeAction.call(this, callback, treeChild);
      },
      this
    );
  }
};
