// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Link
// - opts: [Object]
//   - content: [String or Function] - The content to copy when clicked.
//   - title: [String]

function Link(opts) {
  this._initSettings(opts);
  this._initDOMElements();
};

Link.prototype._initSettings = function(opts) {
  this.content = opts.content;
  this.classNames = "icon-go";
  this.title = opts.title || "Navigate";
};

Link.prototype._initDOMElements = function() {
  this.domNode = L.DomUtil.create('a', 'link ' + this.classNames);
  this.domNode.href = 'javascript:;';
  this.domNode.title = this.title;

  L.DomEvent.on(this.domNode, 'click', this.action.bind(this));
};

Link.prototype.action = function() {
  zlogger.info("Navigating browser...");

  window.location = this._getContent();
};

Link.prototype._getContent = function() {
  if($.isFunction(this.content)) {
    return this.content();
  } else {
    return this.content;
  }
};
