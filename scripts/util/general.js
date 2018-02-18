function getSetOrDefaultValue(valueOrArray, defaultValue) {
  var valuesArray;
  if(!$.isArray(valueOrArray)) {
    valuesArray = [valueOrArray];
  } else {
    valuesArray = valueOrArray;
  }

  return valuesArray.some(function(value) {
    if(value !== undefined) {
      return value;
    }
  }) || defaultValue;
};

// https://stackoverflow.com/a/31689499/1091943
function groupObjects(arrayOfObjects, groupPopertyName, objectFormatter, groupFormatter) {
  groupFormatter = groupFormatter || function(group) { return group; };

  var groupsObject = arrayOfObjects.reduce(function (groupsObj, object) {
    var groupName = Object.pop(object, groupPopertyName);
    groupsObj[groupName] = groupsObj[groupName] || [];
    groupsObj[groupName].push(((objectFormatter) ? objectFormatter(object) : object));
    return groupsObj;
  }, {});

  for(var groupName in groupsObject) {
    groupsObject[groupName] = groupFormatter(groupsObject[groupName]);
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
