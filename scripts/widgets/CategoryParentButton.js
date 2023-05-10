// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// CategoryParentButton
// - opts: [Object]
//   - category: [Object] - A single category from the database API.
//     - id: [String]
//     - name: [String]
//     - color: [String]
//     - img: [String] - Class name suffix for child category icon selection.
//     - childCategoryButtons: [Array [Object]] - List of child objects to control

function CategoryParentButton(opts) {
  CategoryButton.call(this, opts);
};

CategoryParentButton.prototype = Object.create(CategoryButton.prototype);
CategoryParentButton.prototype.constructor = CategoryParentButton;

CategoryButton.prototype._setDebugNames = function() {
  this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
  this._debugName = this.name;
};

CategoryParentButton.prototype._initSettings = function(opts) {
  CategoryButton.prototype._initSettings.call(this, opts);

  this.childCategoryButtons = opts.childCategoryButtons || [];
};

CategoryParentButton.prototype.addChild = function(childCategoryButton) {
  this.childCategoryButtons.push(childCategoryButton);
};
CategoryParentButton.prototype.addCategoryButton = CategoryParentButton.prototype.addChild;
CategoryParentButton.prototype.addChildCategoryButton = CategoryParentButton.prototype.addChild;

CategoryParentButton.prototype.toggle = function(toggledOn) {
  CategoryButton.prototype.toggle.call(this, toggledOn);

  this.childCategoryButtons.forEach(function(childCategoryButton) {
    childCategoryButton.toggle(this.toggledOn, this.category);
  }, this);
};

CategoryParentButton.prototype._className = "CategoryParentButton";
