// Logo
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - headerHeight: [Number]

function Logo(opts) {
  this._initDOMElements(opts);
};

Logo.prototype._initDOMElements = function(opts) {
  this.domNode = $('' +
    '<ul class="category-selection-list">' +
    '</ul>'
  );
  this.menuEntryContainerTemplate = '' +
    '<li class="category-selector">' +
    '</li>'
  ;

  this._addCategoryMenuEntry(
    new CategoryButtonCompleted({
        onToggle: opts.onCompletedToggle,
        toggledOn: opts.showCompleted
      }
    )
  );
  // this.categoryButtonCompleted.domNode.on('toggle', opts.onCompletedToggle.bind(this.categoryButtonCompleted));

  var currentCategoryParentButton;
  categoryTree.forEach(function(category) {
    currentCategoryParentButton = new CategoryParentButton({
      category: category,
      onToggle: opts.onCategoryToggle
    });

    this._addCategoryMenuEntry(currentCategoryParentButton);

    category.children.forEach(function(childCategory) {
      currentChildCategoryButton = new CategoryButton({
        category: childCategory,
        onToggle: opts.onCategoryToggle
      });

      this._addCategoryMenuEntry(currentChildCategoryButton);
      currentCategoryParentButton.addChild(currentChildCategoryButton);
    }, this);
  }, this);
	
  var logoDiv = L.DomUtil.create('img', 'img-responsive center-block', opts.parent);
  logoDiv.src  = 'images/zmaps_white.png';
  logoDiv.style.height = (opts.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator
};

Logo.prototype._addCategoryMenuEntry = function(categoryButton) {
  var menuEntry = $(this.menuEntryContainerTemplate);
  menuEntry.append(categoryButton.domNode);
  this.domNode.append(menuEntry);
};
