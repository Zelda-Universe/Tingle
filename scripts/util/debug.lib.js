function debugPrint() {
  if(isDebugMode) {
    console.debug(arguments);
  }
};


function applyFunctionTraceToObjects() {
  objectsToTrace.forEach(function(objectToTrace) {
    inject(objectToTrace, logFnCall);
  });
};

// TODO: Would we want to debug instance methodsa along with the class' prototype's methods as well?
// If so, refactor into a function doing 2 passes, 1 for each set.
// https://stackoverflow.com/a/38581438/1091943
function inject(object, beforeFn) {
  let objectPrototype = object.prototype;

  for (let propName of Object.getOwnPropertyNames(objectPrototype)) {
    let prop = objectPrototype[propName];
    if (Object.prototype.toString.call(prop) === '[object Function]') {
      objectPrototype[propName] = (function(fnName) {
        return function() {
          beforeFn.call(this, object.name, fnName, arguments);
          return prop.apply(this, arguments);
        };
      })(propName);
    }
  }
};
function logFnCall(objName, name, args) {
    let s = objName + ': ' + name + '(';
    for (let i = 0; i < args.length; i++) {
        if (i > 0)
            s += ', ';
        s += String(args[i]);
    }
    s += ')';
    console.log(s);
};
