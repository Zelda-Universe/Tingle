// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

// CategoryButton
// - opts: [Object]
//   - category: [Object] - A single category from the database API.
//     - id: [String]
//     - name: [String]
//     - color: [String]
//     - img: [String] - Class name suffix for child category icon selection.
//     - childCategoryButtons: [Array [Object]] - List of child objects to
//   - toggledOn: [Boolean] Initial state of the button.

/*
Code TraceExample:

codeTrace-targetClasses  : [ "CategoryButton" ]
codeTrace-methodsToIgnore: {
  "CategoryButton": [
    "addChild"                ,
    "addHandler"              ,
    "_attachHandlers"         ,
    "clear"                   ,
    "_initDOMElements"        ,
    "_initHandlers"           ,
    "_initSettings"           ,
    "_setDebugNames"          ,
    "_setupUserInputListener" ,
    "_toggle"                 ,
    "toggle"                  ,
    "toString"                ,
    "_triggerHandler"         ,
    "_updateGUIState"         ,
    "_updateState"
  ]
}
*/

function CategoryButton(opts) {
  this.handlerRootNames = [
    'initSettings',
    '_toggle',
    'toggle'
  ];

  this._setDebugNames();
  this._initHandlers();
  this._initSettings(opts);
  this._initDOMElements();
  this._setupUserInputListener();

  this._updateState();
};

CategoryButton.prototype._setDebugNames = function() {
  this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
  this._debugName = this.name;
};

CategoryButton.prototype._initSettings = function(opts) {
  this.options = {}; // Convert to using more?
  this.options = this.options; // Fixes `hasOwnProperty` issue in `setOptions` to be `true` now....
  L.Util.setOptions(this, opts); // Same as L.setOptions in the Leaflet doc.  I like using this namespace better.  Shows intent more clearly.

  this._attachHandlers();

  this.addlClasses = opts.addlClasses;
  this.category = getSetOrDefaultValues([
    opts.category,
    {}
  ]);
  if(!this._triggerHandler("beforeInitSettings", opts)) return;

  this.categoryMenu = opts.categoryMenu;

  this.title = getSetOrDefaultValues([
      opts.label,
      opts.name,
      opts.title,
      this.category.label,
      this.category.name,
      this.category.title
    ],
    ''
  );
  this.childCategoryButtons = getSetOrDefaultValues([
    opts.childCategoryButtons,
    []
  ]);
  this.disabled = getSetOrDefaultValues([
    this.disabled,
    opts.disabled,
    false
  ]);
  this.icon = opts.icon;
  this.iconClass = getSetOrDefaultValues([
    opts.iconClass,
    this.category.img, // Move to separate specific category class
    'cross' // ideally wanted 'question-mark'
  ]);
  if(opts.iconURLFn) { // For iconURL
    this.iconURL = opts.iconURLFn();
  }
  this.showIcon = getSetOrDefaultValues([
    opts.showIcon,
    true
  ]);
  this.showProgress = getSetOrDefaultValues([
    opts.showProgress,
    false
  ]);
  this.toggledOn = getSetOrDefaultValues(
    [
      opts.toggledOn,
      this.category.checkedUser // Move to separate specific category sclass
    ],
    false
  );

  this.visible = getSetOrDefaultValues([
    opts.visible,
    true
  ]);

  if(this.showIcon && (this.icon || this.iconClass || this.iconURL)) {
    this.categoryIcon = (
      (this.icon) ? this.icon : new CategoryIcon({
        color: this.category.color,
        iconTitle: this.title,
        iconClass: this.iconClass,
        iconURL: this.iconURL
      })
    );
  }

  if(!this._triggerHandler("afterInitSettings", opts)) return;
};

CategoryButton.prototype._initDOMElements = function() {
  this.domNodeTemplate = '' +
    '<a class="category-button clickable leaflet-bottommenu-a">' +
      '<div class="icon-container">' +
      '</div>' +
      '<p class="label"></p>' +
    '</a>'
  ;
  this.domNode = $(this.domNodeTemplate);
  if(this.addlClasses) {
    this.domNode.addClass(this.addlClasses);
  }
  this.domNodeIconCont = jQuery('.icon-container', this.domNode)

  if (this.categoryIcon) {
    this.domNodeIconCont.append(this.categoryIcon.domNode);
  }

  this.labelNode = this.domNode.find('.label');
  this.labelNode.text(this.title);
};

CategoryButton.prototype._initHandlers = function() {
  if(!this.handlers)
    this.handlers = {};

  Array.flatten(this.handlerRootNames.map(function(handlerRootName) {
    return ['before', 'after'].map(function(handlerPrefix) {
      return "" +
        handlerPrefix +
        handlerRootName[0].toUpperCase() +
        handlerRootName.substr(1)
      ;
    });
  })).forEach(function(handlerName) {
    if(!this.handlers[handlerName]) {
      this.handlers[handlerName] = [];
    }
  }, this);
};

CategoryButton.prototype._attachHandlers = function() {
  for(handlerClientName in this.handlers) {
    [
      this[handlerClientName],
      this.options[handlerClientName]
    ].forEach(function(handlerOrArr) {
      if(handlerOrArr) {
        if($.type(handlerOrArr) === 'array') {
          handlerOrArr.forEach(function(handler) {
            this.addHandler(handlerClientName, handler);
          }, this);
        } else if($.type(handlerOrArr) === 'function') {
          this.addHandler(handlerClientName, handlerOrArr);
        }
      }
    }, this);
  }
};

CategoryButton.prototype.addHandler = function(eventName, handleFunction) {
  if(handleFunction) {
    this.handlers[eventName].push(handleFunction.bind(this));
  }
};

CategoryButton.prototype._triggerHandler = function(handleName) {
  var handlerArgs = Array.prototype.slice.call(arguments, 1);

  var stop = false;
  this.handlers[handleName].forEach(function(handler) {
    if(stop) return;
    var result = handler.apply(this, handlerArgs);
    if(result === false) stop = true;
  });
  // return !this.handlers[handleName].some(function(handler) {
  //   // var result = !handler.apply(this, handlerArgs);
  //   var result = handler.apply(this, handlerArgs);
  //   return result;
  // }, this);

  return !stop;
};

CategoryButton.prototype._setupUserInputListener = function() {
  this.domNode.on('click', function(e) {
    if (!this.disabled) {
      e.preventDefault();
      this.toggle();
    }
  }.bind(this));
  this.domNode.on('mouseenter', function(e) {
    if (!this.disabled) {
      e.preventDefault();
      if(this.showProgress) this.mouseEnter.call(this);
    }
  }.bind(this));
  this.domNode.on('mouseleave', function(e) {
    if (!this.disabled) {
      e.preventDefault();
      if(this.showProgress) this.mouseLeave.call(this);
    }
  }.bind(this));
};

CategoryButton.prototype._updateState = function() {
  if (this.disabled) {
     this.toggledOn = false;
  }

  this._updateGUIState();
};

CategoryButton.prototype._updateGUIState = function() {
  if (this.disabled) {
    this.domNode.addClass('disabled');
  } else {
    this.domNode.removeClass('disabled');
  }

  // Only need 1 class? None??
  if (this.toggledOn) {
    this.domNode.removeClass('toggledOff');
    this.domNode.addClass('toggledOn');
  } else {
    this.domNode.removeClass('toggledOn');
    this.domNode.addClass('toggledOff');
  }
  if (this.visible) {
    this.domNode.removeClass('hidden');
  } else {
    this.domNode.addClass('hidden');
  }
};

CategoryButton.prototype.addChildren = function(childCategoryButtons) {
  this.childCategoryButtons.concat(childCategoryButtons);
};
CategoryButton.prototype.addChild = function(childCategoryButton) {
  this.childCategoryButtons.push(childCategoryButton);
};
CategoryButton.prototype.addCategoryButton = CategoryButton.prototype.addChild;
CategoryButton.prototype.addChildCategoryButton = CategoryButton.prototype.addChild;

// For any use, but only directly by automated systems,
// not through user interaction.
CategoryButton.prototype._toggle = function(toggledOn) {
  this.toggledOn = getSetOrDefaultValue(toggledOn, !this.toggledOn);
  this._updateState();

  this.childCategoryButtons.forEach(function(childCategoryButton) {
    childCategoryButton._toggle(this.toggledOn);
  }, this);
};
// Only for explicit interaction
CategoryButton.prototype.toggle = function(toggledOn) {
  if(!this._triggerHandler('beforeToggle', toggledOn)) return;
  this._toggle();
  this._triggerHandler('afterToggle', toggledOn);
};

CategoryButton.prototype.clear = function() {
  // Not explicit, so simpler to not trigger events
  this._toggle(false);
};


CategoryButton.prototype.mouseEnter = function() {
  this.labelNode.html(this.categoryMenu._categories[this.category.id].complete+'/'+this.categoryMenu._categories[this.category.id].total + (this.labelNode[0].clientHeight == 24 ? "<BR><BR>" : ""));

};

CategoryButton.prototype.mouseLeave = function() {
  this.labelNode.text(this.categoryMenu._categories[this.category.id].name);
};

CategoryButton.prototype._className = "CategoryButton";

CategoryButton.prototype.toString = function() {
  return `${this._className}(${this.title})`;
};
