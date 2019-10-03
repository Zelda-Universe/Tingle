function GameMenu(opts) {
  this._initSettings(opts);
  this._initDOMElements(opts);
};

GameMenu.prototype._initSettings = function(opts) {
  this.defaultToggledState = getSetOrDefaultValue(opts.defaultToggledState, false);

  this.categorySelectionMethod = getSetOrDefaultValue(opts.categorySelectionMethod, ZConfig.getConfig("categorySelectionMethod"));
  this.automaticToggle = getSetOrDefaultValue(opts.automaticToggle, !(this.categorySelectionMethod == "focus"));
  this._categoryTree = opts.categoryTree;
};

GameMenu.prototype._initDOMElements = function(opts) {
  this.domNode = $('' +
    '<ul class="category-selection-list">' +
    '</ul>'
  );
  this.menuEntryContainerTemplate = '' +
    '<li class="category-selector">' +
    '</li>'
  ;

  var currentCategoryParentButton;
  this._categoryTree.forEach(function(category) {
      currentCategoryParentButton = new CategoryParentButton({
         category: category,
         onToggle: opts.onCategoryToggle,
         toggledOn: getSetOrDefaultValue(this.defaultToggledState, category.checked),
         automaticToggle: this.automaticToggle,
         customToggle: this.customToggle
      });
      category._button = currentCategoryParentButton;
//    categories[category.id]._button = currentCategoryParentButton;

      this._addGameMenuEntry(currentCategoryParentButton);

  }, this);
};

GameMenu.prototype._addGameMenuEntry = function(categoryButton) {
  var menuEntry = $(this.menuEntryContainerTemplate);
  menuEntry.append(categoryButton.domNode);
  this.domNode.append(menuEntry);
};

GameMenu.prototype.customToggle = function() {
  this.onToggle(this.toggledOn, this.category);
  categories.forEach(function(category) {
    category._button.toggledOn = ((hasUserCheck) ? category.userChecked : category.checked);
    category._button._updateState();
  });
  zMap.refreshMap(categories);
};
