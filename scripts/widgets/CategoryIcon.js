// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

// CategoryIcon
// - opts: [Object]
//   - color: [String]
//   - img: [String] - Class name suffix for child category icon selection.

function CategoryIcon(opts) {
  opts = opts || {};

  this._initSettings(opts);
  this._initDOMElements(opts);
};

CategoryIcon.prototype._initSettings = function(opts) {
  this.category = opts;
};

CategoryIcon.prototype._initDOMElements = function(opts) {
  this.domNode = $('' +
    '<span class="icon-background circle category-icon icon-' + opts.img + '">' +
    '</span>'
  );

  this.domNode.css('background-color', opts.color);
  this.domNode.css('border-color', opts.color);
};
