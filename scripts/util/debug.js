// Configure below

var isDebugMode = false;

var objectsToTrace = [
  L.Control.ZLayers,
  L.Control.ZLayersBottom
];

var methodsToIgnore = {
  "L.Control.ZLayersBottom": [
    "_animate",
    "drawerTop"
  ]
};

var debugOptions = {
  abbvFn: true,
  argNewLines: false,
  stringMax: 20,
  ignore: methodsToIgnore
};

// Configure above

if(isDebugMode) {
  applyFunctionTraceToObjects(
    objectsToTrace,
    debugOptions
  );
}
