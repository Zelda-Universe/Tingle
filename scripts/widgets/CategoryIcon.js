// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// CategoryIcon

function CategoryIcon(opts) {
  Icon.call(this, opts);
  this._initDOMElements(opts);
};
CategoryIcon.prototype = Object.create(Icon.prototype);
CategoryIcon.prototype.constructor = CategoryIcon;

CategoryIcon.prototype._initDOMElements = function(opts) {
  Icon.prototype._initDOMElements.call(this, opts);
  this.domNode.addClass('category-icon circle');
};
