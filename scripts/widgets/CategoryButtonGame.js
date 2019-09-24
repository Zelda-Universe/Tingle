// CategoryButtonCompleted
// - opts: [Object]
//   - onToggle: [Function] To call when the button is clicked.
//   - showCompleted: [Boolean] Initial state of the button.  Passes to 'toggledOn'.

function CategoryButtonCompleted(opts) {
  CategoryButton.call(this, $.extend(true, {
    icon: new CategoryIconCompleted(),
    toggledOn: Object.pop(opts, "showCompleted")
  }, opts));
};

CategoryButtonCompleted.prototype = Object.create(CategoryButton.prototype);
CategoryButtonCompleted.prototype.constructor = CategoryButtonCompleted;

CategoryButtonCompleted.prototype._initDOMElements = function(opts) {
  CategoryButton.prototype._initDOMElements.call(this, opts);

  this.domNode.addClass('completed-button');

  this.labelNode.append($(' \
    <span class="completed-label-hide">Hide Completed</span> \
    <span class="completed-label-show">Show Completed</span> \
  '));
};
