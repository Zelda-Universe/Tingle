// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

ZConfig = {
  // Variables

  // Intended to keep empty, and eventually only flat,
  // having consuming code create each category as necessary.
  defaults: {},
  handlers: {},
  // types   : {},

  // Functions

  addHandler      : function(handleName, handleFunction) {
    if(!this.handlers[handleName]) {
      this.handlers[handleName] = [];
    }
    this.handlers[handleName].push(handleFunction);
  },
  addHandlers     : function(handleNames, handleFunction) {
    handleNames.forEach((handleName) =>
      this.addHandler(
        handleName,
        handleFunction
      )
    );
  },
  triggerHandler  : function(handleName) {
    if(!this.handlers[handleName]) return 1;
    this.handlers[handleName].forEach(function(handler) {
      var handlerArgs = Array.prototype.slice.call(arguments, 1);
      handler.apply(null, handlerArgs);
    }, this);
  },
  getConfig       : function(propertyName) {
    return getSetOrDefaultValues([
        getUrlParam(propertyName) ,
        localStorage[propertyName],
        getCookie(propertyName)
      ],
      this.defaults[propertyName]
    );
  },
  setDefault      : function(propertyName, defaultValue) {
    this.defaults[propertyName] = defaultValue;
  },
  removeDefault   : function(propertyName) {
    if(!this.defaults.hasOwnProperty(propertyName)) return;

    delete this.defaults[propertyName];
  }
};
