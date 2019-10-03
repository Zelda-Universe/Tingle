function MapsMenu(opts) {
  this._initSettings(opts);
  this._initDOMElements(opts);
};

MapsMenu.prototype._initSettings = function(opts) {
  this.defaultToggledState = getSetOrDefaultValue(opts.defaultToggledState, false);

  this.categorySelectionMethod = getSetOrDefaultValue(opts.categorySelectionMethod, ZConfig.getConfig("categorySelectionMethod"));
  this.automaticToggle = getSetOrDefaultValue(opts.automaticToggle, !(this.categorySelectionMethod == "focus"));
  this._categoryTree = opts.categoryTree;
};

MapsMenu.prototype._initDOMElements = function(opts) {
  this.domNode = $('' +
    '<ul class="category-selection-list game-selection-list" style="margin-top: 20px;">' +
    '</ul>'
  );
  this.menuEntryContainerTemplate = '' +
    '<li class="category-selector maps-selector">' +
    '</li>'
  ;

  var currentCategoryParentButton;
  
  this._categoryTree.forEach(function(category) {
      category.name = category.title;
      currentCategoryParentButton = new CategoryButtonMap({
         category: category,
         onToggle: opts.onCategoryToggle,
         toggledOn: getSetOrDefaultValue(this.defaultToggledState, category.checked),
         automaticToggle: this.automaticToggle,
         customToggle: this.customToggle
      });
    category._button = currentCategoryParentButton;
    //console.log(currentCategoryParentButton);
//    categories[category.id]._button = currentCategoryParentButton;

    this._addMapsMenuEntry(currentCategoryParentButton);

  }, this);
};

MapsMenu.prototype._addMapsMenuEntry = function(categoryButton) {
  var menuEntry = $(this.menuEntryContainerTemplate);
  menuEntry.append(categoryButton.domNode);
  this.domNode.append(menuEntry);
};

MapsMenu.prototype.customToggle = function() {
  this.onToggle(this.toggledOn, this.category);
};
