// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

var callLevel = 0;

function debugPrint() {
  if(debugMode) {
    console.debug(arguments);
  }
};

function applyFunctionTraceToObjects(objectsToTrace, options) {
  objectsToTrace.forEach(function(objectToTrace) {
    inject(objectToTrace, logFnCall, options);
  });
};

function generateReplacementFunction(extraFn, objectName, fnName, prop, options) {
  return function() {
    extraFn.call(
      this,
      true,
      objectName,
      fnName,
      options,
      arguments
    );

    let returnValue = prop.apply(this, arguments);

    extraFn.call(
      this,
      false,
      objectName,
      fnName,
      options,
      arguments,
      returnValue
    );

    return returnValue;
  };
};

// Inspiration: https://stackoverflow.com/a/38581323/1091943
// TODO: Would we want to debug instance methods (added after instantiation?) along with the class' prototype's methods as well?
// If so, refactor into a function doing 2 passes, 1 for each set.
// https://stackoverflow.com/a/38581438/1091943
function inject(object, extraFn, options = {}) {
  let objectPrototype = object.prototype;
  let objectName = (
    objectPrototype._className ||
    object._className ||
    object._debugName ||
    object.displayName ||
    objectPrototype.constructor.name || // Is this right/better b/w the class and instance?
    object.name
  );

  var targetPropertyNames = (
    (
      options.targetPropertyNames &&
      options.targetPropertyNames[objectName]
    )
    || Object.getOwnPropertyNames(objectPrototype)
  );

  for (let propName of targetPropertyNames) {
    let prop = objectPrototype[propName];
    if(typeof prop === "function" && (
      !(
        options.ignore &&
        options.ignore[objectName] &&
        options.ignore[objectName].includes(propName)
      ) &&
      !(
        options.ignore["_all"] &&
        options.ignore["_all"].includes(propName)
      )
    )) {
      objectPrototype[propName] = generateReplacementFunction(extraFn, objectName, propName, prop, options);
    }
  }
};

function logFnCall(before, className, fnName, options = {}, args, returnValue) {
  if(options.abbvFn === undefined) options.abbvFn = true;
  if(options.argNewLines === undefined) options.argNewLines = false;
  if(options.colors === undefined) options.colors = true;
  if(options.stringMax === undefined) options.stringMax = 20;

  let colors = {
    position: {
      before: "green",
      after: "brown"
    },
    obj: "yellow",
    class: "orange",
    fn: "skyblue",
    punct: "dark-grey",
    term: "white"
  };

  if(callLevel == 0 && before) {
    quickColorLog('%c--- %cStart of Monitored Execution %c---', colors.punct, colors.fn, colors.punct);
  }

  var colorList = [];

  let positionText = ( (before)
    ? "%cEntering %c>>>"
    : "%cLeaving  %c<<<"
  );
  colorList = colorList.concat([
    ((before) ? colors.position.before : colors.position.after),
    colors.punct
  ]);

  let objectName = (
    this._debugName ||
    this.displayName ||
    this.name
  );

  if(before) callLevel++;

  let headerString = '' +
    '(' + callLevel + ') ' +
    positionText + ' ' +
    '%c' + objectName + '%c: ' +
    '%c' + className + '.' +
    '%c' + fnName + '%c('
  ;
  colorList = colorList.concat([
    colors.obj,
    colors.punct,
    colors.class,
    colors.fn,
    colors.punct
  ]);

  if(!before) callLevel--;

  let argsString = Array.prototype.map.call(args, function(arg) {
    let result;

    colorList.push(colors.term); // For the leading color

    if(typeof arg === "function" && options.abbvFn) {
      result = Object.prototype.toString.call(arg);
    } else {
      result = String(arg);
      if(result.length > options.stringMax) {
        result = result.substr(0, options.stringMax - 3) + "..."; // Took away punct color string.  Ellipsis could go either way to match the term or the punct.
        // colorList.push(colors.punct);
      }
    }

    colorList.push(colors.punct); // For the joined comma below.

    return '%c' + result;
  }).join('%c, ');

  if(argsString) {
    colorList.pop();

    if(options.argNewLines) {
      argsString = '\n\t' + argsString + '\n';
    }
  }

  let footerString = '%c)';
  colorList.push(colors.punct);

  if(!before) {
    footerString += ':%c ' + returnValue;
    colorList.push(colors.term);
  }

  let finalString = '' +
    headerString +
    argsString +
    footerString
  ;

  if(!options.colors) finalString.replace("%c", ' ');

  quickColorLog.apply(console, [finalString].concat(colorList));

  if(callLevel == 0 && !before) {
    quickColorLog('%c---  %cEnd  of Monitored Execution %c---', colors.punct, colors.fn, colors.punct);
  }
};

function quickColorLog() {
  console.log.apply(
    console,
    [arguments[0]].concat(
      Array.prototype.slice.call(arguments, 1).map(function(color) {
        return "color: " + color + ";";
      })
    )
  );
};
