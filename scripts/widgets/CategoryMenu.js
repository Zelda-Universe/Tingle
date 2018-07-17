function CategoryMenu(opts) {
  this._initSettings(opts);
  this._initDOMElements(opts);
};

CategoryMenu.prototype._initSettings = function(opts) {
  this.defaultToggledState = getSetOrDefaultValue(opts.defaultToggledState, false);

  this.categorySelectionMethod = getSetOrDefaultValue(opts.categorySelectionMethod, ZConfig.getConfig("categorySelectionMethod"));
  this.automaticToggle = getSetOrDefaultValue(opts.automaticToggle, !(this.categorySelectionMethod == "focus"));
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
      onToggle: opts.onCategoryToggle,
      toggledOn: getSetOrDefaultValue(this.defaultToggledState, category.checked),
      automaticToggle: this.automaticToggle,
      customToggle: this.customToggle
    });
    category._button = currentCategoryParentButton;
    categories[category.id]._button = currentCategoryParentButton;

    this._addCategoryMenuEntry(currentCategoryParentButton);

    category.children.forEach(function(childCategory) {
      currentChildCategoryButton = new CategoryButton({
        category: childCategory,
        onToggle: opts.onCategoryToggle,
        toggledOn: getSetOrDefaultValue(this.defaultToggledState, childCategory.checked),
        automaticToggle: this.automaticToggle,
        customToggle: this.customToggle
      });
      category._button = currentChildCategoryButton;
      categories[childCategory.id]._button = currentChildCategoryButton;
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

CategoryMenu.prototype.customToggle = function() {
  this.onToggle(this.toggledOn, this.category);
  categories.forEach(function(category) {
    category._button.toggledOn = ((hasUserCheck) ? category.userChecked : category.checked);
    category._button._updateState();
  });
  zMap.refreshMap(categories);
};
