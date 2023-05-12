// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// CategoryMenu - Pulls the buttons together to control the categories ineither method.
// - opts:
//   - onCategoryToggle: [Boolean]
// - Config:
//   - categorySelectionMethod: [String] The different methods for interpreting user input for the categories.  Currently supports "exact" (any other really) and "focus" (Jason's wanted wacky/'intelligent' style).
//   - automaticToggle: [Boolean]
//   - defaultToggledState: [Boolean]

function CategoryMenu(opts) {
  this._initSettings(opts);
  this._initDOMElements(opts);
  this._addCategoryMenuEntries();

  this.eventNames = ["categoriesChanged"];
  this._initHandlers();
  this.addEventHandler(
    "categoriesChanged",
    this.checkActiveCategoryAmount.bind(this)
  );
};
$.extend(CategoryMenu.prototype, EventHandlersMixin.prototype);

CategoryMenu.prototype._initSettings = function(opts) {
  this.categorySelectionMethod = getSetOrDefaultValues(
    [
      opts.categorySelectionMethod,
      ZConfig.getConfig("categorySelectionMethod")
    ],
    "focus"
  );
  this.defaultToggledState = getSetOrDefaultValue(
    opts.defaultToggledState,
    (this.categorySelectionMethod == "focus")
  );
  this.automaticToggle = getSetOrDefaultValue(
    opts.automaticToggle,
    !(this.categorySelectionMethod == "focus")
  );
  this._categoryTree = opts.categoryTree;
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
};

CategoryMenu.prototype._addCategoryMenuEntries = function() {
  var currentCategoryParentButton;
  this._categoryTree.forEach(function(category) {
    currentCategoryParentButton = new CategoryParentButton({
      category: category,
      onToggle: this.onCategoryToggle.bind(this),
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
        onToggle: this.onCategoryToggle.bind(this),
        toggledOn: getSetOrDefaultValue(this.defaultToggledState, childCategory.checked),
        automaticToggle: this.automaticToggle,
        customToggle: this.customToggle,
        showProgress: true,
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

CategoryMenu.prototype.onCategoryToggle = function(toggledOn, category) {
  var prevHasUserCheck = hasUserCheck;
  var affectedCategories = (
    (this.categorySelectionMethod == "focus")
    ? this.updateCategoryVisibility
    : this.updateCategoryVisibility2
  ).call(this, category, toggledOn);

  this.checkActiveCategoryAmount();

  if(
    this.categorySelectionMethod == "focus" &&
    prevHasUserCheck != hasUserCheck
  ) affectedCategories = categories;

  this.triggerEventHandlers("categoriesChanged", affectedCategories, toggledOn);
};

CategoryMenu.prototype.updateCategoryVisibility = function(targetCategory, vChecked) {
  var affectedCategories = [targetCategory];
  // if(hasUserCheck) affectedCategories = [targetCategory];
  // else affectedCategories = categories;
  // Change the category visibility of the targetCategory parameter
  var previousUserCheck;

  Object.values(categories).forEach(function(category) {
    if (category.id == targetCategory.id) {
       category.userChecked = !category.userChecked;

       if (category.parentId == undefined) {
         previousUserCheck = category.userChecked;
       } else {
         return;
       }
    }

    if (category.parentId == targetCategory.id) {
       if(hasUserCheck) category.userChecked = previousUserCheck;
       affectedCategories.push(category);
    }
  });

  // this.triggerEventHandlers("categoriesChanged", affectedCategories, vChecked);

  // _this.refreshMap(category); // Doing in CategoryMenu for now since that has the knowledge of all category changes for now, we'll try to be efficient there.

  return affectedCategories;
};

CategoryMenu.prototype.updateCategoryVisibility2 = function(targetCategory, vChecked) {
  var affectedCategories = [targetCategory];
  affectedCategories.concat(targetCategory.children); // Still not recursive, but does handle 1 level below any target category's level
     // categoryTree.filter((categoryRoot) => categoryRoot.id == targetCategory.id) // Doesn't support recursion even more.
   affectedCategories.forEach((affectedCategory) => {
     affectedCategory.userChecked = vChecked;
     categories[affectedCategory.id].userChecked = vChecked;
     // this.triggerEventHandlers("categoryChanged", affectedCategory, vChecked);
   });

   // _this.refreshMap();
   // this.triggerEventHandlers("categoriesChanged", affectedCategories, vChecked);

   // this.checkWarnUserSeveralEnabledCategories();
   // _this.refreshMap(category); // Doing in CategoryMenu for now since that has the knowledge of all category changes for now, we'll try to be efficient there.
   // _this.refreshMap(affectedCategories);

   return affectedCategories;
};

CategoryMenu.prototype.checkActiveCategoryAmount = function() {
  var count = 0;
  for (category in categories) {
    if (category.userChecked) count++;
  }
  // After change the parameter category visibility, just check if we have any category checked
  hasUserCheck = !!count;

  if (count > 5 && !userWarnedAboutMarkerQty) {
    toastr.warning('Combining a lot of categories might impact performance.');
    userWarnedAboutMarkerQty = true;
  }
};

// ZMap.prototype.checkWarnUserSeveralEnabledCategories = function() {
//   if(!userWarnedAboutMarkerQty) {
//     if(categories.reduce(
//       function(sum, category) {
//         return sum + ((category.userChecked) ? 1 : 0);
//       }, 0) > 5
//     ) {
//       toastr.warning('Combining a lot of categories might impact performance.');
//       userWarnedAboutMarkerQty = true;
//     }
//   }
// };

CategoryMenu.prototype.customToggle = function() {
  this.onToggle(this.toggledOn, this.category);
  categories.forEach(function(category) {
     if (category._button) {
         category._button.toggledOn = ((hasUserCheck) ? category.userChecked : category.checked);
         category._button._updateState();
     }
  });
  // zMap.refreshMap(categories);
};
