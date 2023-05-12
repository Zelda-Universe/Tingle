// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

function ZLogger(opts) {
  opts = opts || {};
  if(opts.notification === undefined) opts.notification = true;
  if(opts.console === undefined) opts.console = false;

  this.notification = opts.notification;
  this.console = opts.console;
};


[
  "info",
  "warning",
  "success",
  "error",
  "exception",
  "debug"
].forEach(function(methodName) {
  // Why are there double definitions sometimes.
  // All unloaded with page refresh, so updating res js minified file should not be a trigger, right?
  if(ZLogger.prototype[methodName]) {
    console.error("ZLogger.prototype's \""+methodName+"\" already defined.");
  } else {
    Object.defineProperty(
      ZLogger.prototype,
      methodName,
      {
        value: function(opts) {
          opts = opts || {};

          var returnVal;

          if (
            this.notification && (
              opts.notification === undefined ||
              opts.notification
            )
          )
            returnVal = toastr[methodName].apply(toastr, arguments)

          if (
            this.console && (
              opts.console === undefined ||
              opts.console
            )
          )
            console[methodName].apply(console, arguments)

          return returnVal;
        }
      }
    );
  }
});
// Alias to add in order to prevent missing function errors
// and complicated logic within the custom logging methods.
toastr.debug = toastr.info;
toastr.exception = toastr.error;
console.success = console.log;
console.warning = console.warn;

var zlogger = new ZLogger();
