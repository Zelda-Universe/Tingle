// MapButton
// - opts: [Object]
//   - onToggle: [Function] To call when the button is clicked.
//   - showCompleted: [Boolean] Initial state of the button.  Passes to 'toggledOn'.

function MapButton(opts) {
  CategoryButton.call(this, $.extend(true, {
    icon: new CategoryIcon({img: 'General_Map', color: "red"}),
    toggledOn: true
  }, opts));
};

MapButton.prototype = Object.create(CategoryButton.prototype);
MapButton.prototype.constructor = MapButton;

MapButton.prototype._initDOMElements = function(opts) {
  CategoryButton.prototype._initDOMElements.call(this, opts);

  this.domNode.addClass('completed-button');
  this.domNode.addClass('menu-header-button');

  this.labelNode.append($(' \
    <span class="">Switch Maps</span> \
  '));
};

MapButton.prototype.toggle = function(toggledOn) {
  this.toggledOn = true;
  this._updateState();
  this.onToggle(this.toggledOn, this.category);
  // this.domNode.trigger('toggle', this.category); // Alternative?
};

