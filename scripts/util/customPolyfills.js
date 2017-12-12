Object.try = function(hash, pathElements) {
  var value = hash || {};
  pathElements.forEach(function(pathElement) {
    if(value === undefined) return;
    if(typeof value != "object") {
      value = undefined;
      return;
    } else {
      value = value[pathElement];
    }
  });

  return value;
};

Object.pop = function(hash, propertyName, defaultValue) {
  var value = getSetOrDefaultValue(hash[propertyName], defaultValue);
  hash[propertyName] = null;
  return value;
};