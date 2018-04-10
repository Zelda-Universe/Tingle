var isDebugMode = false;

var objectsToTrace = [];

if(isDebugMode) {
  applyFunctionTraceToObjects(
    objectsToTrace,
    { abbvFn: true }
  );
}
