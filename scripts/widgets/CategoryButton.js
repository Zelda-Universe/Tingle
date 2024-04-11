// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

// CategoryButton
// - opts: [Object]
//   - category: [Object] - A single category from the database API.
//     - id: [String]
//     - name: [String]
//     - color: [String]
//     - img: [String] - Class name suffix for child category icon selection.
//   - onToggle: [Function] To call when the button is clicked.
//   - toggledOn: [Boolean] Initial state of the button.

function CategoryButton(opts) {
  this._setDebugNames();
  this._initSettings(opts);
  this._initTemplate();
  this._initDOMElements(opts);
  this._setupUserInputListener(opts);
  this._updateState();
};

CategoryButton.prototype._setDebugNames = function() {
  this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
  this._debugName = this.name;
};

CategoryButton.prototype._initSettings = function(opts) {
  if(!opts.category) opts.category = {};
  if(opts.showIcon == undefined) opts.showIcon = true;
  if(opts.showProgress == undefined) opts.showProgress = false;

  this.showIcon = opts.showIcon;

  this.category = opts.category;
  this.onToggle = opts.onToggle || $.noop;

  this.toggledOn = getSetOrDefaultValues([opts.toggledOn, this.category.userChecked], false);
  this.automaticToggle = getSetOrDefaultValue(opts.automaticToggle, true);
};

CategoryButton.prototype._initTemplate = function() {
  this.domNodeTemplate = '' +
    '<a class="category-button leaflet-bottommenu-a" href="#">' +
      '<p class="label">' +
      '</p>' +
    '</a>';
};

CategoryButton.prototype._initDOMElements = function(opts) {
  this.domNode = $(this.domNodeTemplate);

  this.categoryIcon = ((opts.icon) ? opts.icon : new CategoryIcon(opts.category));
  if (this.showIcon) {
     this.domNode.prepend(this.categoryIcon.domNode);
  }

  this.labelNode = this.domNode.find('.label');
  if(opts.category.name) this.labelNode.text(opts.category.label || opts.category.name);
};

CategoryButton.prototype._setupUserInputListener = function(opts) {
  this.domNode.on('click', function(e) {
    e.preventDefault();
    if(this.automaticToggle) this.toggle();
    else if(opts.customToggle) opts.customToggle.call(this);
  }.bind(this));
  this.domNode.on('mouseenter', function(e) {
    e.preventDefault();
    if(opts.showProgress) this.mouseEnter.call(this);
  }.bind(this));
  this.domNode.on('mouseleave', function(e) {
    e.preventDefault();
    if(opts.showProgress) this.mouseLeave.call(this);
  }.bind(this));
};

CategoryButton.prototype._updateState = function() {
  this.domNode.removeClass(((this.toggledOn) ? "toggledOff" : "toggledOn" ));
  this.domNode.addClass(   ((this.toggledOn) ? "toggledOn"  : "toggledOff"));
};

CategoryButton.prototype.toggle = function(toggledOn) {
  this.toggledOn = getSetOrDefaultValue(toggledOn, !this.toggledOn);
  this._updateState();
  this.onToggle(this.toggledOn, this.category);
  // this.domNode.trigger('toggle', this.category); // Alternative?
};


CategoryButton.prototype.mouseEnter = function() {
  this.labelNode.html(categories[this.category.id].complete+'/'+categories[this.category.id].total + (this.labelNode[0].clientHeight == 24 ? "<BR><BR>" : ""));

};

CategoryButton.prototype.mouseLeave = function() {
  this.labelNode.text(categories[this.category.id].name);
};

CategoryButton.prototype._className = "CategoryButton";
