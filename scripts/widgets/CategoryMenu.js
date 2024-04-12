// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

function CategoryMenu(opts) {
  this._setDebugNames();
  this._initSettings(opts);
  this._initDOMElements(opts);
};

CategoryMenu.prototype._setDebugNames = function() {
  this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
  this._debugName = this.name;
};

CategoryMenu.prototype._initSettings = function(opts) {
  this.defaultToggledState = getSetOrDefaultValue(opts.defaultToggledState, false);

  this.categorySelectionMethod = getSetOrDefaultValue(opts.categorySelectionMethod, ZConfig.getConfig("categorySelectionMethod"));
  this.automaticToggle = getSetOrDefaultValue(opts.automaticToggle, !(this.categorySelectionMethod == "focus"));
  this._categoryTree = opts.categoryTree;
  this._categories = opts.categories;
};

CategoryMenu.prototype._initDOMElements = function(opts) {
   var completedButtonBlock = new CategoryButtonCompletedBlock({
      toggledOn: mapOptions.showCompleted,
      onToggle: function(showCompleted) {
         zMap.toggleCompleted(showCompleted);
      } // Where should the cookie code come from.... some config object with an abstracted persistence layer?,
   });
   //$(form1).append(completedButtonBlock.domNode);

  this.domNode = $('' +
    '<ul class="category-selection-list">' +
    '</ul>'
  );
  this.domNode.prepend(completedButtonBlock.domNode);
  this.menuEntryContainerTemplate = '' +
    '<li class="category-selector">' +
    '</li>'
  ;

  this._categoryTree.forEach(function(category) {
    this._addCategoryEntry(category, opts);
  }, this);
};

CategoryMenu.prototype._addCategoryEntry = function(category, opts) {
  var categoryButton = new CategoryButton({
           category: category,
           onToggle: opts.onCategoryToggle,
          toggledOn: getSetOrDefaultValue(
            this.defaultToggledState,
            category.checked
          ),
    automaticToggle: this.automaticToggle,
       customToggle: this.customToggle,
       categoryMenu: this
  });
  category._button = categoryButton;
  if(this._categories && this._categories[category.id]) {
    this._categories[category.id]._button = category._button;
  }
  
  if(category.children) {
    category.children.forEach(function(childCategory) {
      categoryButton.addChild(
        this._addCategoryEntry(childCategory, opts)
      );
    }, this);
  } else {
    var menuEntry = $(this.menuEntryContainerTemplate);
    menuEntry.append(categoryButton.domNode);
    this.domNode.append(menuEntry);
  }
  
  return categoryButton;
};

CategoryMenu.prototype.customToggle = function() {
  this.onToggle(this.toggledOn, this.category);
  this.categoryMenu._categories.forEach(function(category) {
     if (category._button) {
         category._button.toggledOn = ((hasUserCheck) ? category.userChecked : category.checked);
         category._button._updateState();
     }
  });
  zMap.refreshMap(categories);
};
