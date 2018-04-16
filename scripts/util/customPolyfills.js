// Primitive Data Type Library Additions
// Class/Static Methods are created.
// If they were instance/object methods,
// they might accidentally be enumerated.
// For example: We shouldn't enumerate Arrays
// using `for..in`, rather iterate them using
// `for` or `forEach`.  Even then, jQuery had
// some troubles, say, when receving ajax
// responses weirdly enough, with how it
// handled the data or something else.

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

// http://www.jacklmoore.com/notes/rounding-in-javascript/
Number.roundDecimal = function(value, decimals) {
  return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
};

Array.flatten = function(array) {
  return $.map(array, function recurs(item) {
    return ($.isArray(item) ? $.map(item, recurs) : item);
  });
};
