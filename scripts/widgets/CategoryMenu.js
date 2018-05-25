function CategoryMenu(opts) {
  this._initDOMElements(opts);
};

CategoryMenu.prototype._initDOMElements = function(opts) {
  this.domNode = $('' +
    '<ul class="category-selection-list">' +
    '</ul>'
  );
  this.menuEntryContainerTemplate = '' +
    '<li class="category-selector">' +
    '</li>'
  ;

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
};

CategoryMenu.prototype._addCategoryMenuEntry = function(categoryButton) {
  var menuEntry = $(this.menuEntryContainerTemplate);
  menuEntry.append(categoryButton.domNode);
  this.domNode.append(menuEntry);
};
