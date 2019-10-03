// CategoryButtonCompletedBlock
// - opts: [Object]
//   - onToggle: [Function] To call when the button is clicked.
//   - showCompleted: [Boolean] Initial state of the button.  Passes to 'toggledOn'.

function CategoryButtonCompletedBlock(opts) {
  CategoryButton.call(this, $.extend(true, {
    showIcon: false,
    toggledOn: Object.pop(opts, "showCompleted")
  }, opts));
};

CategoryButtonCompletedBlock.prototype = Object.create(CategoryButton.prototype);
CategoryButtonCompletedBlock.prototype.constructor = CategoryButtonCompletedBlock;

CategoryButtonCompletedBlock.prototype._initDOMElements = function(opts) {
  CategoryButton.prototype._initDOMElements.call(this, opts);

  this.domNode.addClass('infoWindowIcn');

  this.labelNode.append($(' \
    <span class="completed-label-hide">Hide Completed</span> \
    <span class="completed-label-show">Show Completed</span> \
  '));
};
