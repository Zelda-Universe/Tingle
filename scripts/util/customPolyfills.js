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

// Remove elements from array
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
if (!Array.prototype.filter) {
  Array.prototype.filter = function(fun/*, thisArg*/) {
    'use strict';

    if (this === void 0 || this === null) {
      throw new TypeError();
    }

    var t = Object(this);
    var len = t.length >>> 0;
    if (typeof fun !== 'function') {
      throw new TypeError();
    }

    var res = [];
    var thisArg = arguments.length >= 2 ? arguments[1] : void 0;
    for (var i = 0; i < len; i++) {
      if (i in t) {
        var val = t[i];

        // NOTE: Technically this should Object.defineProperty at
        //       the next index, as push can be affected by
        //       properties on Object.prototype and Array.prototype.
        //       But that method's new, and collisions should be
        //       rare, so use the more-compatible alternative.
        if (fun.call(thisArg, val, i, t)) {
          res.push(val);
        }
      }
    }

    return res;
  };
}

Array.flatten = function(array) {
  return $.map(array, function recurs(item) {
    return ($.isArray(item) ? $.map(item, recurs) : item);
  });
};

// http://www.jacklmoore.com/notes/rounding-in-javascript/
Number.roundDecimal   = function(value, decimals) {
  return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
};

// Object.dig = Object.try; // Below

// https://stackoverflow.com/questions/17781472/how-to-get-a-subset-of-a-javascript-objects-properties
Object.inclusivePick  = function (hash = {}, ...keys) {
  return Object.fromEntries(
    keys.map(key => [key, hash[key]])
  );
}

Object.omit = function(hash = {}, ...keys) {
  return Object.fromEntries(
    Object.entries(hash)
    .filter(([key]) => !keys.includes(key))
  );
}

Object.pop  = function(hash = {}, propertyName, defaultValue) {
  var value = getSetOrDefaultValue(hash[propertyName], defaultValue);
  delete hash[propertyName];
  return value;
};

Object.pick = function(hash = {}, ...keys) {
  return Object.fromEntries(
    keys
    .filter(key => key in hash)
    .map(key => [key, hash[key]])
  );
}

// https://dev.to/obahareth/are-there-functions-similar-to-ruby-s-dig-in-other-languages-4c08
// https://github.com/joe-re/object-dig
Object.try  = function(hash = {}, pathElements) {
  return pathElements.reduce(function(value, pathElement) {
    // console.log('value: '+value);
    // console.log('pathElement: '+pathElement);
    if(value === undefined) return;
    // console.log('after undef return');
    // console.log('returning value[pathElement]');
    return value[pathElement];
  }, hash);
};
Object.dig = Object.try;

// Format string like java
// http://stackoverflow.com/questions/16371871/replacing-1-and-2-in-my-javascript-string
String.prototype.format = function() {
  var args=arguments;
  return this.replace(/%(\d+)/g, function(_,m) {
    return args[--m];
  });
}
