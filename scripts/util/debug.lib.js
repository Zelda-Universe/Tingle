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

// https://stackoverflow.com/a/38581438/1091943
function inject(clazz, beforeFn) {
  let classPrototype = clazz.prototype;

  for (let propName of Object.getOwnPropertyNames(classPrototype)) {
    let prop = classPrototype[propName];
    if (Object.prototype.toString.call(prop) === '[object Function]') {
      classPrototype[propName] = (function(fnName) {
        return function() {
          beforeFn.call(this, clazz.name, fnName, arguments);
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
