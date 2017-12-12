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
  this._initSettings(opts);
  this._initTemplate();
  this._initDOMElements(opts);
  this._setupUserInputListener(opts);
  this._updateState();
};

CategoryButton.prototype._initSettings = function(opts) {
  if(!opts.category) opts.category = {};

  this.category = opts.category;
  this.onToggle = opts.onToggle;

  this.toggledOn = getSetOrDefaultValue(opts.toggledOn, true);
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
  this.domNode.prepend(this.categoryIcon.domNode);

  this.labelNode = this.domNode.find('.label');
  if(opts.category.name) this.labelNode.text(opts.category.label || opts.category.name);
};

CategoryButton.prototype._setupUserInputListener = function(opts) {
  this.domNode.on('click', function(e) {
    e.preventDefault();
    this.toggle();
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
