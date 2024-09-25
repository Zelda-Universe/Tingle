/*
Code TraceExample:

codeTrace-targetClasses  : [ "L.Control.ZLayers" ]
codeTrace-methodsToIgnore: {
  "L.Control.ZLayers": [
    "addHandler"        ,
    "after_expand"      ,
    "afterResetContent" ,
    "_animate"          ,
    "_animateStart"     ,
    "_attachHandlers"   ,
    "_addLayer"         ,
    "callInitHooks"     ,
    "_clearContent"     ,
    "closeDrawer"       ,
    "_collapse"         ,
    "createCategoryMenu",
    "createGameMenu"    ,
    "createMapsMenu"    ,
    "_drawerMove"       ,
    "_drawerStart"      ,
    "drawerTop"         ,
    "_expand"           ,
    "expand"            ,
    "getCurrentMap"     ,
    "_initContainer"    ,
    "_initHandlers"     ,
    "initialize"        ,
    "_initLayout"       ,
    "openDrawerLarge"   ,
    "openDrawerManual"  ,
    "openDrawerSmall"   ,
    "reset"             ,
    "_resetContent"     ,
    "resetContent"      ,
    "_setContent"       ,
    "setContent"        ,
    "setCurrentMap"     ,
    "setCurrentMapLayer",
    "_setDebugNames"    ,
    "setDefaultFocus"   ,
    "_setDrawerState"   ,
    "toggleContent"     ,
    "_triggerHandler"   ,
    "_update"           ,
    "updateContentsHeight"
  ]
}
*/

L.Control.ZLayers = L.Control.Layers.extend({
  options: $.extend(
    true,
    {
      className: "leaflet-control-layers",
      handlerRootNames: [
        '_animateStart' ,
        '_expand'       ,
        'setContent'    ,
        'resetContent'
      ],
      collapsed: true,
      position: 'topleft',
      autoZIndex: false,
      headerHeight: 80,
      defaultContentType: 'category',
      categorySelectionMethod: ZConfig.getConfig("categorySelectionMethod")
    },
    JSON.parse(ZConfig.getConfig("layersBottomHeightOptionsDefaults"  ) || '{}'),
    JSON.parse(ZConfig.getConfig("layersBottomHeightOptionsOverrides" ) || '{}')
  ),
  _categoryMenu: null,
  _contentType: null,
  // Currently existing modes/types:
  // - category
  // - m<markerId>
  // - newMarker
  // - registerForm
  // - lostPasswordForm
  // - changePasswordForm
  // - loginForm
  // - accountPage
  // - search

  after_expand: function() {
    if(!this.viewStyleBottomSlide) {
      this.setDefaultFocus();
    }
  },
  afterResetContent: function() {
    if(this.viewStyleBottomSlide) {
      this.updateContentsHeight();
    }
  },

  _setDebugNames: function() {
    // this._className = "L.Control.ZLayers";
    this.name = this.__proto__._className + "[" + L.Util.stamp(this) + "]";
    this._debugName = this.name;
  },

  initialize: function (baseLayers, overlays, options) {
    L.Control.Layers.prototype.initialize.call(
      this,
      baseLayers,
      overlays,
      L.Util.setOptions(this, options)
    );

    this._layers = [];
    this.zMap = options.zMap;
    this._maps = this.zMap.maps;
    this._setDebugNames();
    this.options = this.options; // Fixes `hasOwnProperty` issue in `setOptions` to be `true` now....
    L.Util.setOptions(this, options); // Same as L.setOptions in the Leaflet doc.  I like using this namespace better.  Shows intent more clearly.

    this._initHandlers();
    this._attachHandlers();

    this.isMobile = ( L.Browser.mobile && window.innerWidth < 768 );
    this.isMobileForced = ( ZConfig.getConfig('forceMobile') == 'true' );
    if(this.isMobile || this.isMobileForced) {
      this.viewStyleBottomSlide = true;
    } else {
      this.viewStyleBottomSlide = false;
    }

    if(this.viewStyleBottomSlide) {
      this._open = false;

      this.options.width  = window.innerWidth ;
      this.options.height = window.innerHeight;

      if (L.Browser.webkit) {
        this.options.scrollbarWidth = 0; // Chrome / Safari
      } else {
        this.options.scrollbarWidth = 18; // IE / FF
      }

      this._startPosition = (parseInt(this.options.height)) - this.options.headerHeight - 73;
      this._isLeftPosition = this.options.position.endsWith("left");
    } else {
      this.options.width = 360;
      this.options.scrollbarWidth = 18; // IE / FF
    }

    this._initContainer();
  },

  _initHandlers: function() {
    if(!this.handlers)
      this.handlers = {};

    Array.flatten(this.options.handlerRootNames.map(function(handlerRootName) {
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
  },

  _attachHandlers: function() {
    for(handlerClientName in this.handlers) {
      [
        this[handlerClientName],
        this.options[handlerClientName]
      ].forEach(function(handler) {
        if(handler) this.addHandler(handlerClientName, handler);
      }, this);
    }
  },

  _initContainer: function(t) {
    this._container = L.DomUtil.create('div', this.options.className);
  },

	_initLayout: function () {
    var container = this._container;

    if(this.viewStyleBottomSlide) {
      container.style.margin = 0;
      container.style.border = 0;
      if (this.options.showMapControl) {
        container.style.top = this._startPosition + 'px';
      }

      this.options.softOpenTo = this.options.height - this.options.softOpenBottom;
    }

    if (!this.options.showMapControl) {
       container.style.display = 'none';
       container.style.marginTop = '0px';
    }

		if (this.viewStyleBottomSlide) {
      L.DomEvent.on(container, 'click', L.DomEvent.stopPropagation);
		} else {
      L.DomEvent.disableClickPropagation(container);
		}

		var form1 = this._form = L.DomUtil.create('form', this.options.className + '-list');
		var form2 = this._form2 = L.DomUtil.create('form', this.options.className + '-list');

		// Why did we need the expand click iteraction at least?
		// This was getting in the way of having a nice default focus
		// into the search area.
    // L.DomEvent
    //     .on(container, 'click', this._expand, this)
    //     //.on(container, 'mouseout', this._collapse, this)
    // ;

    var link = this._layersLink = L.DomUtil.create(
      'a',
      'button ' + this.options.className + '-toggle',
      container
    );
    link.title = 'Layers';

    // Control event passing
    if(!this.viewStyleBottomSlide) {
      L.DomEvent
        .on(container, 'click', L.DomEvent.stopPropagation)
        //.on(container, 'click', L.DomEvent.preventDefault)
    }
    L.DomEvent
      .on(container, 'dblclick', L.DomEvent.stopPropagation)
      .on(container, 'dblclick', L.DomEvent.preventDefault);

    // Expand behavior
    if (!this.viewStyleBottomSlide) {
      L.DomEvent
        // .on(link, 'click', L.DomEvent.stopPropagation)
        // .on(link, 'click', L.DomEvent.preventDefault)
        .on(link, 'click', this._expand, this);
    } else {
       L.DomEvent.on(link, 'focus', this._expand, this);
    }

    // form style width
    if(this.viewStyleBottomSlide) {
      form1.style.width = this.options.width + 'px';
    } else {
      form1.style.width = '360px';
    }

    // Header bar container
    {
      var headerBarParent;
      if(this.viewStyleBottomSlide) {
        headerBarParent = this._map._controlCorners.topleft
      } else {
        headerBarParent = form1;
      }
      this.headerBar = new HeaderBar({
        categories: this.zMap.categories,
        isolated: this.viewStyleBottomSlide,
        mapControl: this,
        name: this.zMap.mapOptions.name,
        parent: headerBarParent,
        shrinkButton: !this.viewStyleBottomSlide
      });

      var headerMenu = L.DomUtil.create('header', 'ex1', form1);
      headerMenu.style.height = (this.options.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator
    }

    // Mobile touch interaction
    if(this.viewStyleBottomSlide) {
      this._drawerXDown = null;
      this._drawerYDown = null;

      L.DomEvent.disableClickPropagation(headerMenu);
      L.DomEvent
        .on(headerMenu, 'click', L.DomEvent.stopPropagation )
        .on(headerMenu, 'click', L.DomEvent.preventDefault  )
      ;
      if (L.Browser.pointer) {
        // console.log('Adding drawer pointer event monitoring...');
        L.DomEvent
          .on(headerMenu, 'pointerdown', this._drawerStart, this)
        ;
      } else {
        // console.log('Adding drawer touch event monitoring...');
        L.DomEvent
          .on(headerMenu, 'touchstart', this._drawerStart , this)
          .on(headerMenu, 'touchmove' , this._drawerMove  , this)
        ;
      }
    }

    var logo = new Logo({ parent: headerMenu });

    // Menus
    {
      _thisLayer = this;
      this._gameMenu = this.createGameMenu();
      this._mapsMenu = this.createMapsMenu();

      // Add mobile grabber element
      if(this.viewStyleBottomSlide) {
        L.DomUtil.create('div', 'grabber', headerMenu);
      }

      this._mapsButton = new CategoryButton({
        addlClasses: 'completed-button menu-header-button',
        afterToggle: function() {
          if (this.toggledOn) {
            // console.log('_mapsButton - afterToggle - this.toggledOn');
            _thisLayer.setContent(_thisLayer._mapsMenu.domNode, "maps");
            _thisLayer.openDrawerLarge();
          } else {
            // console.log('_mapsButton - afterToggle - !this.toggledOn');
            _thisLayer.resetContent();
            if(_thisLayer.viewStyleBottomSlide) {
              _thisLayer.closeDrawer();
            }
          }
        },
        iconClass: 'General_Map',
        label: 'Switch Maps',
        toggledOn: false
      });

      $(headerMenu).append(this._mapsButton.domNode);

      this._gamesButton = new CategoryButton({
        addlClasses: 'completed-button menu-header-button',
        afterToggle: function() {
          if (this.toggledOn) {
            _thisLayer.setContent(_thisLayer._gameMenu.domNode, "games");
            _thisLayer.openDrawerLarge();
          } else {
            _thisLayer.resetContent();
            if(_thisLayer.viewStyleBottomSlide) {
              _thisLayer.closeDrawer();
            }
          }
        },
        iconClass: this.zMap.mapOptions.icon,
        label: 'Switch Games',
        toggledOn: false
      });
      $(headerMenu).append(this._gamesButton.domNode);
    }

    this._separator = L.DomUtil.create('div', this.options.className + '-separator', form1);

    // Contents
    {
      this._contents = L.DomUtil.create(
        'div',
        'main-content ' + (
          (this.viewStyleBottomSlide)
          ? 'bottommenu'
          : (this.options.className + '-list')
        )
        );
      L.DomEvent.disableClickPropagation(this._contents);
      L.DomEvent.on(this._contents, 'wheel', L.DomEvent.stopPropagation);
      this._contents.id = 'menu-cat-content';

      this._categoryMenuMarkerSettingArea = $(
        '<div class="category-menu-marker-setting-area"></div>'
      );

      var completedButtonBlock = new CategoryButtonCompletedBlock({ //rename..
        addlClasses: 'button-completed-visibility',
        afterToggle: zMap.toggleCompleted,
        toggledOn: this.zMap.mapOptions.showCompleted
      });
      this._categoryMenuMarkerSettingArea.append(completedButtonBlock.domNode);

      this._categoryMenu = this.createCategoryMenu();
      this._categoryMenuMarkerSettingArea.append(this._categoryMenu.domNode);

      // Platform specific reset code
      if(this.viewStyleBottomSlide) {
        this._resetContent(false);
      } else {
        this.resetContent();
      }

      this._contents.style.clear = 'both';
      if(this.viewStyleBottomSlide) {
        this.updateContentsHeight();
      } else {
        this._contents.style.maxHeight = ZConfig.getConfig("layersHeight");
        this._contents.style.width = '360px';
      }

      // update contents height
      if(this.viewStyleBottomSlide) {
        this.updateContentsHeight();
      }

  		container.appendChild(form1);
  		container.appendChild(this._contents);
    }

    // Collapse or (keep) open
    if (
          this.options.collapsed
      ||  ZConfig.getConfig("collapsed") == 'true'
    ) {
      //this._map.on('movestart', this._collapse, this);
      //this._map.on('click', this._collapse, this);
    } else {
      this._expand();
    }
  },

  _drawerStart: function(e) {
    if (e.type.startsWith('touch')) {
      this._drawerXDown = e.touches[0].clientX;
      this._drawerYDown = e.touches[0].clientY;
    } else {
      // console.log('Adding drawer pointer up event monitoring...');
      L.DomEvent
        .on(document.documentElement, 'pointermove', this._drawerMove, this)
      ;
      this._drawerXDown = e.clientX;
      this._drawerYDown = e.clientY;
    }
    // console.log('xDown: ' + this._drawerXDown);
    // console.log('yDown: ' + this._drawerYDown);
  },

  _drawerMove: function(e) {
    if (e.type.startsWith('pointer')) {
      // console.log('Removing drawer pointer up event monitoring...');
      L.DomEvent
        .off(document.documentElement, 'pointermove', this._drawerMove)
      ;
    }
    // console.log('xDown: ' + this._drawerXDown);
    // console.log('yDown: ' + this._drawerYDown);
    if ( ! this._drawerXDown || ! this._drawerYDown ) {
      // console.log('return - ! xDown || ! yDown');
      return;
    }

    var xUp = null;
    var yUp = null;
    if (e.type.startsWith('touch')) {
      var xUp = e.touches[0].clientX;
      var yUp = e.touches[0].clientY;
    } else {
      var xUp = e.clientX;
      var yUp = e.clientY;
    }
    // console.log('xUp: ' + xUp);
    // console.log('yUp: ' + yUp);

    var xDiff = this._drawerXDown - xUp;
    var yDiff = this._drawerYDown - yUp;
    // console.log('xDiff: ' + xDiff);
    // console.log('yDiff: ' + yDiff);

    // ensures y movement is more significant
    if ( Math.abs( xDiff ) < Math.abs( yDiff ) ) {
       if ( yDiff > 0 ) { // swipe up
          // console.log('swipe up');

          this.openDrawerLarge();
          this.updateContentsHeight();
       } else { // swipe down
          // console.log('swipe down');
          // console.log('this._open: ' + this._open);
          if(this._open) {
            this.closeDrawer();
            //TODO reset contents
          }
       }
    }

    /* reset values */
    this._drawerXDown = null;
    this._drawerYDown = null;
  },

  updateContentsHeight: function() {
    this._contents.style.maxHeight = (
      window.innerHeight -
      this.options.openTo -
      this.options.headerHeight -
      40 // Paddings, margins, and things.  Mostly from '.category-selection-list'?
    ) + 'px';
    this._contents.style.minHeight = this._contents.style.maxHeight;
  },

  rebuildMapsMenu: function () {
    this._mapsMenu = this.createMapsMenu();
  },

  createCategoryMenu: function() {
    return new CategoryMenu({
      buildActionGroup: true,
      categories: this.zMap.categories,
      categoryTree: this.zMap.categoryRoots,
      categorySelectionMethod: this.options.categorySelectionMethod,
      defaultToggledState: this.options.defaultToggledState
    });
  },

  createGameMenu: function() {
    return new CategoryMenu({
      categories: games,
      categorySelectionMethod: this.options.categorySelectionMethod,
      defaultToggledState: true,
      categoryButtonOptions: {
        beforeInitSettings: function() {
          this.disabled = ( gameId == this.category.id )

          return true;
        },
        beforeToggle: function() {
          window.location.replace(
            location.protocol + '//' + location.host +
            location.pathname + "?game=" + this.category.shortName
          );

          return false;
        } // TODO: Have a handler pass in the zMap's method from even higher above, for this function and others?!
      },
      updateCategorySelectionFn: function() {}
   });
  },

  createMapsMenu: function() {
    var layers = this;
    var disableFn = function() {
      this.disabled = (layers.currentMapLayer.id === this.category.id)

      return true;
    };

    return new CategoryMenu({
      categoryButtonOptions: {
        afterToggle: function () {
          layers._map.removeLayer(layers.currentMapLayer);
          layers._map.addLayer(this.category);
          layers.currentMapLayer = this.category;
          layers.currentMapLayer.bringToBack();
          layers._map.fire("baselayerchange", layers.currentMapLayer);

          layers.reset();

          return true;
        },
        beforeInitSettings: disableFn,
        beforeToggle: function() {
          disableFn.call(this);

          return true;
        }, // TODO: Have a handler pass in the zMap's method from even higher above, for this function and others?! or better, attach to layer events....
        iconURLFn: function() { return this.category.options.iconURL; }
      },
      updateCategorySelectionFn: function(categoryButton) {
        this.categoryButtons.forEach(function (catButt) {
          if( catButt.toggledOn != this.defaultToggledState
            && (
              catButt.category.id != categoryButton.category.id
            )
          ) {
            // enable, and disable could both be funcs in the class, but would that not have much code?
            catButt.disabled = false;
            catButt.toggledOn = this.defaultToggledState;
            catButt._updateState();
          }
        }, this);
        // disable, and enable could both be funcs in the class, but would that not have much code?
        categoryButton.disabled = true;
        categoryButton.toggledOn = false;
        categoryButton._updateState();

        return true;
      },
      categories: this._maps,
      defaultToggledState: true
   });
  },

  setDefaultFocus: function() {
    this.headerBar.focus();
  },

  addHandler: function(eventName, handleFunction) {
    if(handleFunction) {
      this.handlers[eventName].push(handleFunction.bind(this));
    }
  },

  _triggerHandler: function(handleName) {
    var handlerArgs = Array.prototype.slice.call(arguments, 1);
    this.handlers[handleName].forEach(function(handler) {
      handler.apply(null, handlerArgs);
    }, this);
  },

  setContent: function(vContent, vType) {
    this._triggerHandler("beforeSetContent", vContent, vType);
    this._setContent(vContent, vType);
    this._triggerHandler("afterSetContent", vContent, vType);
  },

  // To be used directly by internal functions and avoid
  // unecessary handlers being triggered, as otherwise
  // it may be seen as an action setting content worth
  // opening and focusing on, when they are really only
  // initializing or cleaning up the widget, and should
  // be ignored.
  _setContent: function(vContent, vType) {
    if(this._contentType === vType) return;

    this._clearContent();

    if(vType != 'category') {
      var closeButton = L.DomUtil.create('a', 'button back-button', this._contents);
      closeButton.innerHTML = '<i class="fas fa-chevron-left"></i>';
      L.DomEvent
        .on(closeButton, 'click', L.DomEvent.stopPropagation)
        .on(closeButton, 'click', function(e) {
          e.preventDefault();
          this.reset();
        }, this)
    }

    var content = L.DomUtil.create('div', '', this._contents);
    $(content).append(vContent);
    content.className = 'menu-cat-content-inner';

    this._contentType = vType;
    // $("#menu-cat-content").animate({ scrollTop: 0 }, "fast");
  },

  _clearContent: function() {
    // Our fix for re-using the CategoryMenu not just for
    // more efficient code style, but also to retain the event
    // listeners set-up during intialization.
    if(this._contentType == 'category') {// in the future when everything is a widget with re-usable DOM elements, we won't need the check here, or even detach, as we should be hiding!
      $(this._categoryMenuMarkerSettingArea).detach();
    }
    if(this._contentType == 'games') {// in the future when everything is a widget with re-usable DOM elements, we won't need the check here, or even detach, as we should be hiding!
      this._gamesButton.clear();
      $(this._gameMenu.domNode).detach();
    }
    if(this._contentType == 'maps') {// in the future when everything is a widget with re-usable DOM elements, we won't need the check here, or even detach, as we should be hiding!
      this._mapsButton.clear();
      $(this._mapsMenu.domNode).detach();
    }
    $(this._contents).empty();
  },

  // To category/default state?
  _resetContent: function(runNestedHooks = true) {
    //@TODO: New Marker should be from the map!
    if (newMarker != null) {
      this._map.removeLayer(newMarker);
    }

    ((runNestedHooks)
      ? (this.setContent)
      : (this._setContent)
    ).call(
      this,
      this._categoryMenuMarkerSettingArea,
      this.options.defaultContentType
    );
    // $("#menu-cat-content").animate({ scrollTop: 0 }, "fast");
  },

  reset: function() {
    // Open
    this.resetContent();
    // Issue 232 https://github.com/Zelda-Universe/Zelda-Maps/issues/232
    // Need to reset the current marker open
    zMap._closeNewMarker();
    this.headerBar.searchArea.markerSearchField.clear();
    this._mapsButton.clear();
    this._gamesButton.clear();
  },

  // Sets it to the default category selector scene,
  // or whatever is set as the intended default scene.
  resetContent: function() {
    this._triggerHandler("beforeResetContent");
    this._resetContent();
    this._triggerHandler("afterResetContent");
  },

  onRemove: function (map) {},

  _removeLayers: function() {},

  _addLayer: function (layer, name, overlay, instanceLayer) {},

  _updateLayerControl: function(obj) {},

  _update: function () {},

  _addItem: function (obj, vInputClick) {},

  _collapse: function() {
    this.resetContent();
    this.options.collapsed = true;
    return this.collapse();
  },

  _expand: function() {
    // console.log(`_expand`);
    this._triggerHandler("before_expand");
    if (this._contents != undefined) {
      this._contents.style.maxHeight = ZConfig.getConfig("layersHeight");
    }

    this.options.collapsed = false;
    this.expand();
    this._triggerHandler("after_expand");
  },

  toggle: function() {
    if(this.viewStyleBottomSlide) {
      (this._open) ? this.closeDrawer() : this.openDrawerLarge();
    } else {
      (this.options.collapsed) ? this._expand() : this._collapse();
    }
  },

  getContentType: function() {
    return this._contentType;
  },
  getCurrentMap: function() {
    return { mapId: this.currentMap, subMapId: this.currentSubMap }
  },
  setCurrentMap: function(vMap, vSubMap) {
    this.currentMap = vMap;
    this.currentSubMap = vSubMap;
  },
  setCurrentMapLayer: function(vMap) {
    this.currentMapLayer = vMap;
  },

	// Needs improvements
  // yea..
	changeMap: function(mapId, subMapId) {
		inputs = this._form.getElementsByTagName('input'),
		inputsLen = inputs.length;

    for (i = 0; i < inputsLen; i++) {
			input = inputs[i];

			if ('mID' + mapId == input.mapId) {
				if (!input.checked) {
					input.checked = true;
					this._onInputClick(subMapId);
				}

				inputs = this._form2.getElementsByTagName('input'),
				inputsLen = inputs.length;
				for (j = 0; j < inputsLen; j++) {
					input = inputs[j];
					if ('mID' + subMapId == input.mapId) {
						input.checked = true;
						this._onInputClick2();
                  this.currentMap = mapId;
                  this.currentSubMap = subMapId;
						return;
					}
				}

        this.setCurrentMap(mapId, subMapId);

				return;
			}
		}

	},
  // Default function relies on map control input elemens to contain a value.
  // Creating separate functions for other consuming code without that dependency expectation, like selecting a search result.
  changeMapOnly: function(mapId, subMapId) {
    var newMap = this._maps.find((map) => map.originalId == mapId);
    if (newMap && this.currentMapLayer.id != newMap.id) {
      this._map.removeLayer(this.currentMapLayer);
      this._map.addLayer(newMap);
      this.currentMapLayer = newMap;
      this.currentMapLayer.bringToBack();
      this._map.fire("baselayerchange", this.currentMapLayer);

      this.setCurrentMap(mapId, subMapId);
    }
  },
  changeMapToMarker: function(marker) {
    this.changeMapOnly(marker.mapId, marker.submapId);
  },

  toggleContent: function(targetContentType, setContentFunction) {
    if(this._contentType == targetContentType) {
      this.resetContent();
    } else {
      setContentFunction();
    }
  },

	// @method expand(): this
	// Expand the control container if collapsed.
	expand: function () {
    // console.log(`expand`);
		L.DomUtil.addClass(
      this._container,
      'leaflet-control-layers-expanded'
    );
    if (this._section) {
      this._section.style.height = null;
      var acceptableHeight = this._map.getSize().y - (this._container.offsetTop + 50);
      if (acceptableHeight < this._section.clientHeight) {
        DomUtil.addClass(this._section, 'leaflet-control-layers-scrollbar');
        this._section.style.height = acceptableHeight + 'px';
      } else {
        DomUtil.removeClass(this._section, 'leaflet-control-layers-scrollbar');
      }
    }
		this._checkDisabledLayers();
		return this;
	},

  _animateStart: function(menu, from, to, isOpen) {
    // console.log(`_animateStart(${menu}, ${from}, ${to}, ${isOpen})`);
    this._triggerHandler("before_animateStart", menu, from, to, isOpen);
    this._animate(menu, from, to, isOpen);
    this._triggerHandler("after_animateStart", menu, from, to, isOpen);
  },

  _animate: function(menu, from, to, isOpen) {
    // console.log(`_animate(${menu}, ${from}, ${to}, ${isOpen})`);
    if ((isOpen && from < to) || (!isOpen && from > to)) {
      from = to;
    }

    menu.style.top = from + "px";

    if (from == to) {
      if (!isOpen) {
        //this._contents.style.display = 'none';
        //this._contentsCat.style.display = '';
        // this.resetContent(); // Actually might not want this..
      } else {
        this.updateContentsHeight();
      }
      return;
    }

    setTimeout(function(zlayers) {
      var value = isOpen ? from - 10 : from + 10;
      if (isOpen && from < to) {
        value = to;
      }
      zlayers._animate(zlayers._container, value, to, isOpen);
    }, this.options.delay, this);
  },

  _setDrawerState: function(newState, newPosition) {
    // console.log(`_setDrawerState(${newState}, ${newPosition})`);
    if(newState === undefined) newState = !this._open;

    this._animateStart(
      this._container,
      this.drawerTop(),
      newPosition,
      newState
    );

    // console.log("DEBUG: this._open: " + this._open);
    this._open = newState;
    // console.log("DEBUG: this._open changed to: " + this._open);
  },

  drawerTop: function() {
    return parseInt(this._container.style.top.replace('px',''));
  },

  openDrawerSmall: function() {
    // console.log(`openDrawerSmall`);
    if(this.drawerTop() >= this.options.softOpenTo)
      this.openDrawerManual(this.options.softOpenTo);
  },

  openDrawerLarge: function() {
    // console.log(`openDrawerLarge`);
    if(this.drawerTop() >= this.options.openTo)
      this.openDrawerManual(this.options.openTo);
  },

  openDrawerManual: function(newPosition) {
    // console.log(`openDrawerManual`);
    this._setDrawerState(true, newPosition);
  },

  closeDrawer: function() {
    // console.log(`closeDrawer`);
    if(this._open) {
      this._setDrawerState(false, this._startPosition);
      this._gamesButton.clear();
      this._mapsButton.clear();
      this.resetContent(); // TODO: Preference
    }
  }
});

L.Control.ZLayers._className = "L.Control.ZLayers"; // Test
L.Control.ZLayers.prototype._className = "L.Control.ZLayers";

L.Control.ZLayers.addInitHook(function() {
  this._area = this.options.width * this.options.length;
});

L.control.zlayers = function (baseLayers, overlays, options) {
	return new L.Control.ZLayers(baseLayers, overlays, options);
};
