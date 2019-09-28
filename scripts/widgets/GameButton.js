// GameButton
// - opts: [Object]
//   - onToggle: [Function] To call when the button is clicked.
//   - showCompleted: [Boolean] Initial state of the button.  Passes to 'toggledOn'.

function GameButton(opts) {
  CategoryButton.call(this, $.extend(true, {
    icon: new CategoryIcon({img: mapOptions.icon, color: "#4a92e4"}),
    toggledOn: true
  }, opts));
};

GameButton.prototype = Object.create(CategoryButton.prototype);
GameButton.prototype.constructor = GameButton;

GameButton.prototype._initDOMElements = function(opts) {
  CategoryButton.prototype._initDOMElements.call(this, opts);

  this.domNode.addClass('completed-button');
  this.domNode.addClass('menu-header-button');

  this.labelNode.append($(' \
    <span class="">Switch Games</span> \
  '));
};

GameButton.prototype.toggle = function(toggledOn) {
  this.toggledOn = true;
  this._updateState();
  this.onToggle(this.toggledOn, this.category);
  // this.domNode.trigger('toggle', this.category); // Alternative?
};
