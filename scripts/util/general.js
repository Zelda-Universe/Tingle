// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// Phone-sized viewports use the mobile drawer. All current iPad viewports,
// including the 744px-wide iPad mini in portrait, use the desktop layout.
var MOBILE_LAYOUT_BREAKPOINT = 600;

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
