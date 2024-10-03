// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

function ZLogger(options) {
  $.extend(true, this, {
    tui: {
      enabled: ZConfig.getConfig('zLogger.tui') == 'true'
    },
    gui: {
      enabled: ZConfig.getConfig('zLogger.gui') == 'true'
    }
  }, (options || {}));

  this.functionMappings = {
    toastr: {
      debug     : 'info',
      exception : 'error'
    },
    console: {
      success: 'log',
      warning: 'warn'
    }
  };
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
    // console.error(`ZLogger.prototype's "${methodName}" already defined.`);
    console.error("ZLogger.prototype's \""+methodName+"\" already defined.");
    return;
  }

  ZLogger.prototype[methodName] = function(message, title, options) {
    zLogOptions = $.extend(
      true            ,
      (options || {}) ,
      (({gui, tui}) => ({gui, tui}))(this)
    );

    otherOptions = Object.omit(options, 'gui', 'tui');

    [
      {
        argumentCount : 3,
        mechanism     : toastr  ,
        mechanismName : 'toastr',
        type          : 'gui'
      },
      {
        argumentCount : 1,
        mechanism     : console   ,
        mechanismName : 'console' ,
        type          : 'tui'
      }
    ].forEach(function({ argumentCount, mechanism, mechanismName, type }) {
      if(!zLogOptions[type].enabled) return;

      if(!mechanism) {
        let message = `${mechanismName} not loaded but required!`;

        if(mechanismName == 'console') message;
        else console.error(message);

        return;
      }

      while(!mechanism[methodName]) {
        methodName = this.functionMappings[mechanismName][methodName];

        if(!methodName) {
          let message = `${mechanismName}[${methodName}] alternative method does not exist but required!`;

          if(mechanismName == 'console' && methodName == 'error') message;
          else console.error(message);

          return;
        }
      }

      var messageTx = (
          ( zLogOptions[type].messageTx)
          ? zLogOptions[type].messageTx(message)
          : message
      );
      
      mechanism[methodName].apply(
        this, [
        messageTx,
        title,
        otherOptions
      ].slice(0, argumentCount));
    }, this);
  }
});

var zLogger = new ZLogger();

$.extend(
  true,
  toastr.options,
  JSON.parse(ZConfig.getConfig('toastr') || '{}')
);
