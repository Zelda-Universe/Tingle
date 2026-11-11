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
  if(this._categoryTree) this._buildListView();
  // The editing beta's notice goes at the top (scripts/zbeta.js).
  $(document).trigger('zm:categoryMenuBuilt', [this]);
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
      var categories=group.categories.filter(function(c) {return c.visible===undefined || !!Number(c.visible);});
      var focused=!this.modeAutomatic && categories.every(function(c) {return !!c.checked;});
      this._focusListCategories(categories,!focused);
    }.bind(this));
    list.append(heading);
    group.categories.forEach(function(category) {
      var button = this.categoryButtons.find(function(b) { return String(b.category.id) === String(category.id); });
      if(button) {
        if(!category.parent_id) {
          button._directMarkersOnly = true;
          button.childCategoryButtons = [];
          button.domNode.closest('li').removeClass('poi-original-category');
        }
        // "Other POIs", "Dragon's Tears" (scripts/util/poiStyle.js).
        var menuName = getPOIMenuName(category, Object.values(this._categories));
        if(menuName !== category.name) button.displayTitle = menuName;
        if(button.displayTitle) button.labelNode.text(button.displayTitle);
        list.append(button.domNode.closest('li'));
      }
    }, this);
  }, this);
  this.updateCategoryGroupControls();
};

CategoryMenu.prototype.updateCategoryGroupControls = function() {
  var menu=this;
  (this.poiCategoryGroups || []).forEach(function(group) {
    var categories=group.categories.filter(function(c) {return c.visible===undefined || !!Number(c.visible);});
    var focused=!menu.modeAutomatic && categories.length>0 && categories.every(function(c) {return !!c.checked;});
    group.toggle.text('Focus').attr({'aria-label':'Focus '+group.title,'aria-pressed':focused?'true':'false'});
  });
  if(this.listViewNode) this._syncListView();
};

CategoryMenu.prototype._buildListView = function() {
  var menu=this;
  this.listViewNode=$('<div class="category-list-view" hidden></div>');
  this.listChecks=[];
  function checkbox(categories,title) {
    var control=$('<label class="marker-list-completion-control"><input type="checkbox" class="marker-list-completion"><i class="fas fa-check" aria-hidden="true"></i></label>');
    var input=control.find('input').attr('aria-label','Focus '+title);
    menu.listChecks.push({input:input,categories:categories});
    input.on('change',function() {menu._focusListCategories(categories,this.checked);});
    return control;
  }
  var groups=this.poiCategoryGroups || [];
  if(!groups.length) groups=[{title:'Categories',categories:this.categoryButtons.filter(function(b) {return !b.category.parent_id && b.category.marker_category_type_id!=3;}).map(function(b) {return b.category;})}];
  groups.forEach(function(group) {
    var categories=group.categories.filter(function(c) {return c.visible===undefined || !!Number(c.visible);});
    if(!categories.length) return;
    var section=$('<section class="category-list-section"></section>');
    section.append($('<div class="category-list-heading"></div>').append(checkbox(categories,group.title),$('<h3></h3>').text(group.title)));
    categories.forEach(function(category) {
      var button=menu.categoryButtons.find(function(b) {return b.category.id==category.id;});
      var title=button && button.displayTitle || category.name;
      var row=$('<div class="category-list-row"></div>').append(checkbox([category],title));
      var link=$('<button type="button" class="category-list-link"></button>');
      if(zMap._mapSettingsBadge) link.append(zMap._mapSettingsBadge(category));
      else if(button) link.append(button.domNode.find('.icon-container').clone());
      link.append($('<span class="category-list-name"></span>').text(title),'<i class="fas fa-chevron-right" aria-hidden="true"></i>');
      link.on('click',function() {if(button) button.domNode.trigger('click');});
      section.append(row.append(link));
    });
    menu.listViewNode.append(section);
  });
  this.domNode.append(this.listViewNode);
  var mode='icons';
  try {mode=localStorage.getItem('zm-category-view') || mode;} catch(e) {}
  this.setCategoryView(mode);
};

CategoryMenu.prototype.setCategoryView = function(mode) {
  this.categoryView=mode==='list' ? 'list' : 'icons';
  this.domNodeCategorySelectionList.prop('hidden',this.categoryView==='list');
  if(this.listViewNode) this.listViewNode.prop('hidden',this.categoryView!=='list');
  this.domNode.find('[data-category-view]').each(function() {
    $(this).attr('aria-pressed',this.getAttribute('data-category-view')===mode?'true':'false');
  });
  this._syncListView();
  try {localStorage.setItem('zm-category-view',this.categoryView);} catch(e) {}
};

CategoryMenu.prototype._syncListView = function() {
  var automatic=this.modeAutomatic;
  (this.listChecks || []).forEach(function(check) {
    var count=automatic ? 0 : check.categories.filter(function(c) {return !!c.checked;}).length;
    check.input.prop('checked',count===check.categories.length && count>0).prop('indeterminate',count>0 && count<check.categories.length);
  });
};

CategoryMenu.prototype._focusListCategories = function(categories,checked) {
  if(this.modeAutomatic) this.toggleAll(false);
  this.modeAutomatic=false;
  zMap._categoryNavigationRequest=(zMap._categoryNavigationRequest || 0)+1;
  categories.forEach(function(category) {
    category.checked=checked;
    category._respectZoomThreshold=false;
  });
  if(!this.categoryButtons.some(function(b) {return !!b.category.checked;})) {
    this.modeAutomatic=true;
    this.toggleAll(true);
  }
  this.categoryButtons.forEach(function(button) {button._toggle(!!button.category.checked);});
  this.updateCategoryGroupControls();
  zMap.refreshMap(this._categoryTreeArr || this._categories);
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
