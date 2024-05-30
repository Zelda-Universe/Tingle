// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Config:
// Prefix: codeTrace-
// - startTracing (Boolean): Automatically enable tracing.

// Example:
// startTracing           : true

if(ZConfig.getConfig('codeTrace-startTracing') == 'true') {
  startTracing();
}
