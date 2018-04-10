function debugPrint() {
  if(isDebugMode) {
    console.debug(arguments);
  }
};


function applyFunctionTraceToObjects(objectsToTrace, options) {
  objectsToTrace.forEach(function(objectToTrace) {
    inject(objectToTrace, logFnCall, options);
  });
};

// TODO: Would we want to debug instance methods along with the class' prototype's methods as well?
// If so, refactor into a function doing 2 passes, 1 for each set.
// https://stackoverflow.com/a/38581438/1091943
function inject(object, beforeFn, options) {
  let objectPrototype = object.prototype;

  for (let propName of Object.getOwnPropertyNames(objectPrototype)) {
    let prop = objectPrototype[propName];
    if(typeof prop === "function") {
      objectPrototype[propName] = (function(fnName) {
        return function() {
          beforeFn.call(
            this,
            (
              objectPrototype._className ||
              object._className ||
              object._debugName ||
              object.displayName ||
              object.name
            ),
            fnName,
            options,
            arguments
          );
          return prop.apply(this, arguments);
        };
      })(propName);
    }
  }
};

function logFnCall(className, name, options, args) {
  if(!options) options = {};
  if(options.abbvFn === undefined) options.abbvFn = true;

  let objectName = (
    this._debugName ||
    this.displayName ||
    this.name
  );

  let headerString = objectName + ': ' + className + '.' + name + '(';

  let argsString = Array.prototype.map.call(args, function(arg) {
    if(typeof arg === "function" && options.abbvFn)
      return Object.prototype.toString.call(arg);
    else
      return String(arg);
  }).join(', ');
  
  if(argsString) argsString = '\n\t' + argsString + '\n';

  let footerString = ')';

  console.log(headerString + argsString + footerString);
};
