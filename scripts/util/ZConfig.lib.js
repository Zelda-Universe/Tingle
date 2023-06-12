// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

ZConfig = {
  // Variables

  // Intended to keep empty, and eventually only flat,
  // having consuming code create each category as necessary.
  defaults: {},
  handlers: {},
  options : {},
  // types   : {},

  // Functions

  addHandler    : function(handleName, handleFunction) {
    if(!this.handlers[handleName]) {
      this.handlers[handleName] = [];
    }
    this.handlers[handleName].push(handleFunction);
  },
  triggerHandler: function(handleName) {
    if(!this.handlers[handleName]) return 1;
    this.handlers[handleName].forEach(function(handler) {
      var handlerArgs = Array.prototype.slice.call(arguments, 1);
      handler.apply(null, handlerArgs);
    }, this);
  },
  getConfig     : function(propertyName) {
    return this.options[propertyName];
  },
  setConfig     : function(propertyName, defaultValue) {
    if(this.defaults[propertyName] === undefined) {
      this.defaults[propertyName] = defaultValue;
    }

    this.options[propertyName] = getSetOrDefaultValues([
        getUrlParam(propertyName) ,
        localStorage[propertyName],
        getCookie(propertyName)
      ],
      this.defaults[propertyName]
    );
  },
  resetConfigValue: function(propertyName) {
    if(!this.options.hasOwnProperty(propertyName)) return;

    delete this.options[propertyName];
  }
};
