// CategoryButtonMap
// - opts: [Object]
//   - category: [Object] - A single category from the database API.
//     - id: [String]
//     - name: [String]
//     - color: [String]
//     - img: [String] - Class name suffix for child category icon selection.
//   - onToggle: [Function] To call when the button is clicked.
//   - toggledOn: [Boolean] Initial state of the button.

function CategoryButtonMap(opts) {
  this._setDebugNames();
  this._initSettings(opts);
  this._initTemplate();
  this._initDOMElements(opts);
  this._setupUserInputListener(opts);
  this._updateState();
};

CategoryButtonMap.prototype._setDebugNames = function() {
  this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
  this._debugName = this.name;
};

CategoryButtonMap.prototype._initSettings = function(opts) {
  if(!opts.category) opts.category = {};
  if(opts.showIcon == undefined) opts.showIcon = true;
   
  this.showIcon = opts.showIcon;
   
  this.category = opts.category;
  this.onToggle = opts.onToggle || $.noop;

  this.toggledOn = getSetOrDefaultValues([opts.toggledOn, this.category.userChecked], false);
  this.automaticToggle = getSetOrDefaultValue(opts.automaticToggle, true);
};

CategoryButtonMap.prototype._initTemplate = function() {
   console.log();
   this.domNodeTemplate = '' +
    '<a class="category-button leaflet-bottommenu-a" href="#">' +
      '<img class="" src="' + this.category.options.iconURL + '" title="' + this.category.name + '">' +
      '<p class="label">' +
      '</p>' +
    '</a>';
};

CategoryButtonMap.prototype._initDOMElements = function(opts) {
  this.domNode = $(this.domNodeTemplate);

  this.categoryIcon = ((opts.icon) ? opts.icon : new CategoryIcon(opts.category));
  if (this.showIcon) {
//     this.domNode.prepend(this.categoryIcon.domNode);
  }

  this.labelNode = this.domNode.find('.label');
  if(opts.category.name) this.labelNode.text(opts.category.label || opts.category.name);
};

CategoryButtonMap.prototype._setupUserInputListener = function(opts) {
  this.domNode.on('click', function(e) {
    e.preventDefault();
    if(this.automaticToggle) this.toggle();
    else if(opts.customToggle) opts.customToggle.call(this);
  }.bind(this));
};

CategoryButtonMap.prototype._updateState = function() {
  this.domNode.removeClass(((this.toggledOn) ? "toggledOff" : "toggledOn" ));
  this.domNode.addClass(   ((this.toggledOn) ? "toggledOn"  : "toggledOff"));
};

CategoryButtonMap.prototype.toggle = function(toggledOn) {
  this.toggledOn = getSetOrDefaultValue(toggledOn, !this.toggledOn);
  this._updateState();
  this.onToggle(this.toggledOn, this.category);
  // this.domNode.trigger('toggle', this.category); // Alternative?
};

CategoryButtonMap.prototype._className = "CategoryButtonMap";
