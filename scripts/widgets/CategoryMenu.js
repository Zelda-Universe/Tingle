// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

/*
Code TraceExample:

codeTrace-targetClasses  : [ "CategoryMenu" ]
codeTrace-methodsToIgnore: {
  "CategoryMenu": [
    "_addCategoryEntry"   ,
    "_initDOMElements"    ,
    "_initSettings"       ,
    "_setDebugNames"      ,
    "updateCategorySelection"
  ]
}
*/

function CategoryMenu(opts) {
  this._setDebugNames();
  this._initSettings(opts);
  this._initDOMElements();
};

CategoryMenu.prototype._setDebugNames = function() {
  // this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
  this.name = 'CategoryMenu' + "[" + L.Util.stamp(this) + "]";
  this._debugName = this.name;
};

CategoryMenu.prototype._initSettings = function(opts) {
  this.buildActionGroup = (
    Object.pop(opts, 'buildActionGroup')
  );
  this._categories = Object.pop(opts, 'categories');
  this.categoryButtonOptions = Object.pop(opts, 'categoryButtonOptions') || {};
  this.categoryButtonParents = [];
  this.categoryButtons = [];
  this.categorySelectionMethod = getSetOrDefaultValue(
    Object.pop(opts, 'categorySelectionMethod'),
    ZConfig.getConfig('categorySelectionMethod')
  );
  this._categoryTree = Object.pop(opts, 'categoryTree' );
  if(this._categoryTree) { // for this._categoryTreeArr
    this._categoryTreeArr = [];
    recurseTree.call(
      this,
      function(category) {
        this._categoryTreeArr.push(category);
      },
      this._categoryTree
    );
  }
  if(opts.defaultToggledState !== undefined) {
    this.defaultToggledState = Object.pop(opts, 'defaultToggledState');
  }
  this.updateCategorySelectionFn = getSetOrDefaultValues([
    Object.pop(opts, 'updateCategorySelectionFn'),
    // CategoryMenu.prototype.updateCategorySelection
    CategoryMenu.prototype.updateCategorySelectionFocus
  ]);

  // Derived

  this.modeAutomatic = (
    this._categoryTreeArr && !this.computeHasUncheck()
  ); // True for all checked.
  if(!this._categories) {
    // this._categories = this._categoryTree;
    this._categories = [];
    recurseCatTree(function(category) {
      this._categories.push(category);
    }, this._categoryTree);
  }
  // this.categoryButtonOptions.beforeToggle combining
  {
    var handlersUCS = [];

    // Extra external function(s).
    var cBOBT = Object.pop(this.categoryButtonOptions, 'beforeToggle');
    if (cBOBT) {
      // Addl: Check if array too?
      // handlersUCS.push(cBOAT);
      handlersUCS.push(cBOBT);
    }

    // Main selection mode functions.
    if(this.categorySelectionMethod == 'focus') {
      var _catMenu = this;
      var uCSFUsingScopeFn = function() {
        return _catMenu.updateCategorySelectionFn(this);
      };
      handlersUCS.push(uCSFUsingScopeFn);

      this.categoryButtonOptions.beforeToggle = handlersUCS;
    } else { // CSM 'exact' or other,
      // for using the simple method.
      // Helps with later decoupling category logic from button control class.
      var updateCategoryFn = function() {
        var category = this.category;
        var checked = this.toggledOn;

        category.checked = checked;
        this._toggle(checked);
        var affectedCategories = [ category ];

        if(this.childCategoryButtons.length > 0) {
          for(childCategoryButton of this.childCategoryButtons) {
            childCategoryButton.category.checked = checked;
            childCategoryButton._toggle(checked);
          }

          affectedCategories.push(category.childrenArr);
        }

        if(verbose) verboseFirst = true;
        zMap.refreshMap(affectedCategories);
      };
      handlersUCS.push(updateCategoryFn);

      this.categoryButtonOptions.afterToggle = handlersUCS;
    }
  }
};

CategoryMenu.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<div class="category-menu"></div>'
  );

  this.domNodeCategorySelectionList = $(
    '<ul class="category-selection-list">' +
    '</ul>'
  );
  this.domNode.append(this.domNodeCategorySelectionList);

  if(this.buildActionGroup) {
    this._buildActionGroup(this.domNode);
  }

  this.menuEntryContainerTemplate = '' +
    '<li class="category-selector">' +
    '</li>'
  ;

  if (this._categoryTree) {
    // console.log('CategoryMenu - _initDOMElements - this._categoryTree');

    Object
    .entries(this._categoryTree)
    .forEach(function([categoryId, category]) {
      // console.log('categoryId: '+categoryId);

      var categoryButton = this._addCategoryEntry(category);

      if (!category.parent_id) {
        this.categoryButtonParents.push(categoryButton);
      }

      if(category.children) {
        // console.log('CategoryMenu - _initDOMElements - this._categoryTree - children');

        Object
        .entries(category.children)
        .forEach(function([categoryId, category]) {
          // console.log('categoryId: '+categoryId);

          categoryButton.addChild(
            this._addCategoryEntry(category, false)
          );
        }, this);
      }
    }, this);
  } else {
    // console.log('CategoryMenu - _initDOMElements - this._categories');

    this._categories.forEach(function(category) {
      // console.log('category.id: '+category.id);

      this._addCategoryEntry(category);
    }, this);
  }
  if(this._categoryTree) this.organizePOICategories();
  if(Object.values(this._categories || {}).some(function(c) { return String(c.container_id) === '64'; })) {
    this.domNode.prepend($('<div class="oot-preview-notice" role="status"><span class="complete-reminder-icon" aria-hidden="true"><i class="fas fa-exclamation-triangle"></i></span><div><strong>Map Under Construction</strong><p></p></div></div>').find('p').text(
      "We're currently working on this map, so some things might be missing. We'll be updating the Ocarina of Time Remake map frequently, so keep checking back!"
    ).end());
  }
};

CategoryMenu.prototype.organizePOICategories = function() {
  var groups = getPOICategoryGroups(this._categories);
  if(!groups) return;
  var list = this.domNodeCategorySelectionList;
  this.poiCategoryGroups = [];
  this.domNode.addClass('poi-category-groups');
  this.categoryButtons.forEach(function(button) {
    if(!button.category.parent_id || String(button.category.marker_category_type_id) === '3' ||
        ['2162', '2204'].includes(String(button.category.parent_id))) {
      button.domNode.closest('li').addClass('poi-original-category');
    }
  });
  groups.forEach(function(group) {
    if(!group.categories.length) return;
    var heading = $('<li class="poi-category-heading"><h3></h3></li>');
    heading.find('h3').text(group.title);
    var toggle = $('<button type="button" class="poi-category-toggle"></button>');
    heading.append(toggle);
    this.poiCategoryGroups.push({ categories: group.categories, toggle: toggle, title: group.title });
    toggle.on('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      var checked = !group.categories.every(function(c) { return !!c.checked; });
      this.modeAutomatic = false;
      zMap._categoryNavigationRequest = (zMap._categoryNavigationRequest || 0) + 1;
      group.categories.forEach(function(category) {
        category.checked = checked;
        category._respectZoomThreshold = true;
        var button = this.categoryButtons.find(function(b) { return String(b.category.id) === String(category.id); });
        if(button) button._toggle(checked);
      }, this);
      this.updateCategoryGroupControls();
      zMap.refreshMap(group.categories);
    }.bind(this));
    list.append(heading);
    group.categories.forEach(function(category) {
      var button = this.categoryButtons.find(function(b) { return String(b.category.id) === String(category.id); });
      if(button) {
        if(!category.parent_id) {
          button._directMarkersOnly = true;
          button.childCategoryButtons = [];
          button.domNode.closest('li').removeClass('poi-original-category');
          button.displayTitle = category.name === 'Point of Interest' ? 'Other POIs' : 'Other ' + category.name;
        }
        if(String(category.id) === '2134') button.displayTitle = "Dragon's Tears";
        if(String(category.container_id) === '4' && String(category.id) === '1968') button.displayTitle = 'Bosses';
        if(button.displayTitle) button.labelNode.text(button.displayTitle);
        list.append(button.domNode.closest('li'));
      }
    }, this);
  }, this);
  this.updateCategoryGroupControls();
};

CategoryMenu.prototype.updateCategoryGroupControls = function() {
  (this.poiCategoryGroups || []).forEach(function(group) {
    var allShown = group.categories.every(function(c) { return !!c.checked; });
    var action = allShown ? 'Hide All' : 'Show All';
    group.toggle.text(action).attr('aria-label', action + ' ' + group.title);
  });
};

CategoryMenu.prototype._buildActionGroup = function(parent) {
  var actionGroup = L.DomUtil.create('div', 'action-group');

  var copyLink = new CopyLink({ content: this.generateLink.bind(this) });
  $(actionGroup).append(copyLink.domNode);

  var link = new Link({ content: this.generateLink.bind(this) });
  $(actionGroup).append(link.domNode);

  $(parent).append(actionGroup);
};

CategoryMenu.prototype.generateLink = function() {
  var categoriesSelectedIdsString = `[${(
    zMap.categoriesArr
      .filter ((category) => category.checked )
      .map    ((category) => category.id      )
      .join(',')
  )}]`;

  if(getUrlParam("categoriesSelectedIds")) {
    return window.location.href.replace(
      new RegExp("(categoriesSelectedIds=).*?(&|$)"),
      "$1" + categoriesSelectedIdsString + "$2"
    );
  } else {
    return '' +
      `${window.location.href}&categoriesSelectedIds=${
        categoriesSelectedIdsString
      }`
    ;
  }
}

CategoryMenu.prototype._addCategoryEntry = function(category) {
  var categoryButton = new CategoryButton(
    $.extend(
      true,
      {
                 category: category,
                toggledOn: getSetOrDefaultValue(
                  this.defaultToggledState,
                  category.checked
                ),
             categoryMenu: this // to clean..
      },
      this.categoryButtonOptions
    )
  );
  this.categoryButtons.push(categoryButton);

  var menuEntry = $(this.menuEntryContainerTemplate);
  if(category.visible !== undefined && !category.visible) {
    menuEntry.addClass('hidden');
  }
  menuEntry.append(categoryButton.domNode);
  this.domNodeCategorySelectionList.append(menuEntry);

  return categoryButton;
};

CategoryMenu.prototype.computeAndGetChecks = function() {
  var counts = {
    checked: 0,
    unchecked: 0
  };

  this._categoryTreeArr.forEach(
    function(category) {
      if(category.checked) {
        counts.checked++  ;
      } else {
        counts.unchecked++;
      }
    }
  );

  return counts;
};

CategoryMenu.prototype.computeHasCheck = function() {
  return this._categoryTreeArr.some(
    (category) => category.checked
  );
  // return this._categoryTreeArr.some(
  //   ([categoryId, category]) => category.checked
  // );
};

CategoryMenu.prototype.computeHasUncheck = function() {
  return this._categoryTreeArr.some(
    (category) => !category.checked
  );
  // return this._categoryTreeArr.some(
  //   ([categoryId, category]) => !category.checked
  // );
};

CategoryMenu.prototype.toggleAll = function(checked) {
  // for(cBP of this._categoryTreeArr) {
  // for(cBP of this.categoryButtonParents) {
  for(cBP of this.categoryButtons) {
    cBP.category.checked = checked;
    cBP._toggle(checked);
  }
};

CategoryMenu.prototype.updateCategorySelectionFocus = function(categoryButton) {
  if(verbose) verboseFirst = true;

  if(categoryButton.toggledOn) {
    if(!this.computeHasUncheck()) { // All checked,
      // selecting individually, disable auto mode.
      this.modeAutomatic = false;
      this.toggleAll(false);

      categoryButton.category.checked = true;
      categoryButton._toggle(true);

      if(categoryButton.childCategoryButtons.length > 0) {
        for(childCategoryButton of categoryButton.childCategoryButtons) {
          childCategoryButton.category.checked = true;
          childCategoryButton._toggle(true);
        }
      }
    } else { // Are, at least some, unchecked.
      categoryButton.category.checked = false;
      categoryButton._toggle(false);

      if(categoryButton.childCategoryButtons.length > 0) {
        for(childCategoryButton of categoryButton.childCategoryButtons) {
          childCategoryButton.category.checked = false;
          childCategoryButton._toggle(false);
        }
      }

      if(!this.computeHasCheck()) { // None checked
        this.modeAutomatic = true;
        this.toggleAll(true);
      } // Were originally, none checked.

      // There were some checked, and the modification to turn this
      // button and associated category, was already completed, since it
      // aids the previous, simplified, conditional statement, to see if all
      // are unchecked, thus needing to enable all to automatic mode.

    } // Were originally, at least some, unchecked.

    zMap.refreshMap(this._categoryTreeArr);
  } else { // Toggled off
    categoryButton.category.checked = true;
    categoryButton._toggle(true);

    var affectedCategories = [ categoryButton.category ];
    if(!categoryButton._directMarkersOnly && categoryButton.category.childrenArr.length > 0) {
      categoryButton.category.childrenArr.forEach(function(category) {
        category.checked = true;
        affectedCategories.push(category);
      });
    }

    zMap.refreshMap(affectedCategories);
  }

  return false;
};
