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

    this.isMobile = isMobile();
    this.viewStyleBottomSlide = this.isMobile;
    this._drawerAnimationId = 0;

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

    // The drawer is application chrome, not draggable page content. Prevent
    // images (especially the Zelda Maps logo) and labels from starting native
    // browser drag operations while leaving drawer gestures and controls intact.
    L.DomEvent.on(container, 'dragstart', L.DomEvent.preventDefault);

    if(this.viewStyleBottomSlide) {
      container.style.margin = 0;
      container.style.border = 0;
      L.DomUtil.addClass(container, 'leaflet-control-layers-mobile');
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
      form1.style.width = '100%';
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
        actuallyCreateSearchArea: this.zMap.categoryCount > 0,
        categories: this.zMap.categories,
        classNameParent: this.options.className,
        isolated: this.viewStyleBottomSlide,
        mapControl: this,
        name: this.zMap.mapOptions.name,
        parent: headerBarParent,
        shrinkButton: false
      });

      var headerMenu = L.DomUtil.create('header', 'ex1', form1);
      this._drawerHeader = headerMenu;
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
          .on(headerMenu, 'touchstart', this._drawerStart, this)
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
            if(_thisLayer.viewStyleBottomSlide) {
              if(
                _thisLayer._preserveContentOnClose &&
                !_thisLayer._open &&
                _thisLayer._contentType === 'maps'
              ) {
                this._toggle(true);
                _thisLayer.openDrawerLarge();
              } else {
                _thisLayer.closeDrawer();
              }
            } else {
              _thisLayer.resetContent();
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
            if(_thisLayer.viewStyleBottomSlide) {
              if(
                _thisLayer._preserveContentOnClose &&
                !_thisLayer._open &&
                _thisLayer._contentType === 'games'
              ) {
                this._toggle(true);
                _thisLayer.openDrawerLarge();
              } else {
                _thisLayer.closeDrawer();
              }
            } else {
              _thisLayer.resetContent();
            }
          }
        },
        iconClass: this.zMap.mapOptions.icon,
        label: 'Switch Games',
        toggledOn: false
      });
      $(headerMenu).append(this._gamesButton.domNode);
    }

    this._drawerHeaderSeparator = L.DomUtil.create(
      'div',
      this.options.className + '-separator',
      form1
    );

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

      if(this.viewStyleBottomSlide) {
        window.requestAnimationFrame(function() {
          this._refreshMobileDrawerLayout();
        }.bind(this));
        var refreshMobileLayout = this._refreshMobileDrawerLayout.bind(this);
        window.addEventListener('resize', refreshMobileLayout);
        if(window.visualViewport) {
          window.visualViewport.addEventListener('resize', refreshMobileLayout);
        }
      } else {
        this._refreshDesktopDrawerLayout();
        window.addEventListener('resize', this._refreshDesktopDrawerLayout.bind(this));
      }
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
    var point = e.type.startsWith('touch') ? e.touches[0] : e;
    this._clearDrawerClickSuppression();
    if(this._drawerClosing) {
      if(this._drawerAnimationTimeout) {
        window.clearTimeout(this._drawerAnimationTimeout);
        this._drawerAnimationTimeout = null;
      }
      this._finishDrawerClose();
    }
    this._container.style.transition = 'none';
    if(this._contents) this._contents.style.transition = 'none';
    if(this._drawerHeaderSeparator) {
      this._drawerHeaderSeparator.style.transition = 'none';
    }
    this._drawerXDown = point.clientX;
    this._drawerYDown = point.clientY;
    this._drawerStartTop = this.drawerTop();
    this._drawerDragging = false;
    this._drawerAnimationId++;

    if(e.type.startsWith('touch')) {
      L.DomEvent
        .on(document.documentElement, 'touchmove', this._drawerMove, this)
        .on(document.documentElement, 'touchend touchcancel', this._drawerEnd, this);
    } else {
      this._drawerPointerId = e.pointerId;
      L.DomEvent
        .on(document.documentElement, 'pointermove', this._drawerMove, this)
        .on(document.documentElement, 'pointerup pointercancel', this._drawerEnd, this);
    }
  },

  _drawerMove: function(e) {
    if(this._drawerYDown === null) return;
    if(e.type.startsWith('pointer') && e.pointerId !== this._drawerPointerId) return;

    var point = e.type.startsWith('touch') ? e.touches[0] : e;
    var xDelta = point.clientX - this._drawerXDown;
    var yDelta = point.clientY - this._drawerYDown;
    if(!this._drawerDragging && Math.abs(xDelta) > Math.abs(yDelta)) return;
    if(yDelta === 0) return;

    this._drawerDragging = true;
    var nextTop = Math.max(
      this.options.openTo,
      Math.min(this._startPosition, this._drawerStartTop + yDelta)
    );
    this._container.style.top = nextTop + 'px';
    this._applyMobileDrawerViewport(nextTop);
    this.updateContentsHeight(nextTop);
    if(e.cancelable) e.preventDefault();
  },

  _drawerEnd: function(e) {
    if(e.type.startsWith('touch')) {
      L.DomEvent
        .off(document.documentElement, 'touchmove', this._drawerMove, this)
        .off(document.documentElement, 'touchend touchcancel', this._drawerEnd, this);
    } else {
      L.DomEvent
        .off(document.documentElement, 'pointermove', this._drawerMove, this)
        .off(document.documentElement, 'pointerup pointercancel', this._drawerEnd, this);
    }

    if(this._drawerDragging) {
      this._suppressNextDrawerClick();
      var currentTop = this.drawerTop();
      if(currentTop < this._drawerStartTop) {
        this.openDrawerManual(this.options.openTo);
      } else if(currentTop > this._drawerStartTop) {
        this.closeDrawer(true);
      }
    }
    this._drawerXDown = null;
    this._drawerYDown = null;
    this._drawerStartTop = null;
    this._drawerDragging = false;
    this._drawerPointerId = null;
  },

  _clearDrawerClickSuppression: function() {
    var header = this._drawerHeader;
    if(header && this._drawerClickSuppressHandler) {
      header.removeEventListener('click', this._drawerClickSuppressHandler, true);
      this._drawerClickSuppressHandler = null;
    }
    if(this._drawerClickSuppressTimeout) {
      window.clearTimeout(this._drawerClickSuppressTimeout);
      this._drawerClickSuppressTimeout = null;
    }
  },

  _suppressNextDrawerClick: function() {
    var header = this._drawerHeader;
    if(!header) return;

    this._clearDrawerClickSuppression();
    var suppressClick = function(e) {
      var target = e.target;
      var button = target && target.closest
        ? target.closest('.category-button')
        : null;
      if(!button || !header.contains(button)) return;

      this._clearDrawerClickSuppression();
      e.preventDefault();
      e.stopPropagation();
      e.stopImmediatePropagation();
    }.bind(this);

    this._drawerClickSuppressHandler = suppressClick;
    header.addEventListener('click', suppressClick, true);
    this._drawerClickSuppressTimeout = window.setTimeout(function() {
      this._clearDrawerClickSuppression();
    }.bind(this), 500);
  },

  _safeAreaBottom: function() {
    return Number.parseFloat(
      getComputedStyle(document.documentElement).getPropertyValue('--safe-area-bottom')
    ) || 0;
  },

  _deviceBottomCornerRadius: function() {
    var isIOS = /iPad|iPhone|iPod/.test(window.navigator.userAgent) ||
      (window.navigator.platform === 'MacIntel' && window.navigator.maxTouchPoints > 1);
    var isStandalone = document.documentElement.classList.contains('zm-standalone');
    if(!isStandalone && !isIOS) return 0;

    // Browsers do not expose the physical screen radius. The home-indicator
    // safe area scales with the rounded device enclosure and is the closest
    // per-device measurement available to iOS Safari and installed web apps.
    var safeAreaBottom = this._safeAreaBottom() || 34;
    return Math.max(28, Math.min(52, safeAreaBottom * 1.4));
  },

  _viewportHeight: function() {
    return window.visualViewport
      ? window.visualViewport.height
      : window.innerHeight;
  },

  _viewportBottom: function() {
    return window.visualViewport
      ? window.visualViewport.offsetTop + window.visualViewport.height
      : window.innerHeight;
  },

  _mobileDrawerProgress: function(top) {
    var travel = this._startPosition - this.options.openTo;
    if(!Number.isFinite(travel) || travel <= 0) return this._open ? 1 : 0;
    return Math.max(0, Math.min(1, (this._startPosition - top) / travel));
  },

  _updateMobileDrawerPresentation: function(top) {
    if(!this.viewStyleBottomSlide) return;

    var progress = this._mobileDrawerProgress(top);
    var edgeInset = 12 * (1 - progress);
    var topRadius = 22 + (6 * (1 - progress));
    var expandedBottomRadius = this._deviceBottomCornerRadius();
    var bottomRadius = expandedBottomRadius > 0
      ? 28 + ((expandedBottomRadius - 28) * progress)
      : 28 * (1 - progress);
    var fullWidth = this.options.width || window.innerWidth;
    var contentProgress = Math.max(0, Math.min(1, (progress - 0.08) / 0.42));

    this._container.style.left = edgeInset + 'px';
    this._container.style.width = Math.max(0, fullWidth - (edgeInset * 2)) + 'px';
    this._container.style.borderRadius =
      topRadius + 'px ' + topRadius + 'px ' +
      bottomRadius + 'px ' + bottomRadius + 'px';

    if(this._contents) {
      this._contents.style.opacity = contentProgress;
      this._contents.style.transform =
        'translateY(' + (8 * (1 - contentProgress)) + 'px)';
      this._contents.style.pointerEvents = contentProgress > 0.95 ? '' : 'none';
    }
    if(this._drawerHeaderSeparator) {
      this._drawerHeaderSeparator.style.opacity = Math.max(
        0,
        Math.min(1, (progress - 0.18) / 0.32)
      );
    }
  },

  _mobileDrawerSurfaceBottom: function(top) {
    var viewportBottom = this._viewportBottom();
    var collapsedBottom = viewportBottom - this._safeAreaBottom();
    var mapBottom = this._map.getContainer().getBoundingClientRect().bottom;
    var progress = this._mobileDrawerProgress(top);
    var bottomGap = 10 * (1 - progress);
    var isStandalone = document.documentElement.classList.contains('zm-standalone');
    var expandedBottom = isStandalone ? mapBottom : viewportBottom;

    // Standalone sheets grow to the physical device edge. In Safari, stop at
    // the current visual viewport so browser chrome cannot make the sheet
    // appear to continue far below the usable page.
    return collapsedBottom + ((expandedBottom - collapsedBottom) * progress) - bottomGap;
  },

  _applyMobileDrawerViewport: function(top) {
    var currentTop = Number.parseFloat(this._container.style.top) || 0;
    var baseScreenTop = Number.isFinite(this._mobileDrawerBaseTop)
      ? this._mobileDrawerBaseTop
      : this._container.getBoundingClientRect().top - currentTop;
    var surfaceBottom = this._mobileDrawerSurfaceBottom(top);
    var availableHeight = Math.max(
      0,
      surfaceBottom - baseScreenTop - top
    );
    this._container.style.height = availableHeight + 'px';
    this._container.style.maxHeight = 'none';
    this._container.style.overflow = 'hidden';
    this._updateMobileDrawerPresentation(top);
  },

  _refreshMobileDrawerLayout: function() {
    if(!this.viewStyleBottomSlide || !this._form) return;
    this._map.invalidateSize({ pan: false });
    this.options.width = this._map.getContainer().getBoundingClientRect().width || window.innerWidth;
    // Use the measured map width instead of a percentage. The Leaflet corner
    // wrapper is shrink-to-fit, so a percentage creates a circular width
    // calculation when the expanded drawer is resized.
    this._container.style.width = this.options.width + 'px';
    this._form.style.width = '100%';
    if(this._contents) this._contents.style.width = '100%';
    this.options.height = this._viewportHeight();
    this.options.softOpenTo = this.options.height - this.options.softOpenBottom;
    var collapsedHeight = this._form.getBoundingClientRect().height || this.options.headerHeight + 20;
    var currentTop = this.drawerTop();
    var currentCssTop = Number.parseFloat(this._container.style.top) || 0;
    var containerRect = this._container.getBoundingClientRect();
    var contentsRect = this._contents.getBoundingClientRect();
    this._mobileDrawerBaseTop = containerRect.top - currentCssTop;
    this._mobileDrawerContentsOffset = contentsRect.top - containerRect.top;
    var baseScreenTop = this._mobileDrawerBaseTop;
    var desiredTop = this._viewportBottom() - collapsedHeight - 10
      - this._safeAreaBottom() - baseScreenTop;
    this._container.style.top = desiredTop + 'px';
    this._startPosition = desiredTop;
    if(!this._open && !this._drawerDragging) {
      this._container.style.top = this._startPosition + 'px';
      this._container.style.height = collapsedHeight + 'px';
      this._container.style.maxHeight = collapsedHeight + 'px';
      this._container.style.overflow = 'hidden';
      this._updateMobileDrawerPresentation(this._startPosition);
    } else {
      this._container.style.top = currentTop + 'px';
      this._applyMobileDrawerViewport(this.drawerTop());
      this.updateContentsHeight();
    }
  },

  _refreshDesktopDrawerLayout: function() {
    if(this.viewStyleBottomSlide || !this._contents || !this._map) return;
    this._contents.style.maxHeight = Math.max(
      this._map.getSize().y - 250,
      250
    ) + 'px';
  },

  updateContentsHeight: function(targetTop) {
    var containerRect = this._container.getBoundingClientRect();
    var currentCssTop = Number.parseFloat(this._container.style.top) || 0;
    var baseScreenTop = Number.isFinite(this._mobileDrawerBaseTop)
      ? this._mobileDrawerBaseTop
      : containerRect.top - currentCssTop;
    var contentsOffset = Number.isFinite(this._mobileDrawerContentsOffset)
      ? this._mobileDrawerContentsOffset
      : this._contents.getBoundingClientRect().top - containerRect.top;
    var drawerTop = Number.isFinite(targetTop) ? targetTop : currentCssTop;
    var contentsTop = baseScreenTop + drawerTop + contentsOffset;
    var bottomGap = 10 * (1 - this._mobileDrawerProgress(drawerTop));
    var visibleBottom = this._viewportBottom() - this._safeAreaBottom() - bottomGap;
    var surfaceBottom = this._mobileDrawerSurfaceBottom(drawerTop);
    var drawerBottom = Number.isFinite(targetTop)
      ? surfaceBottom
      : Math.min(containerRect.bottom, surfaceBottom);
    var availableHeight = Math.max(0, drawerBottom - contentsTop);
    var scrollEndInset = Math.max(0, surfaceBottom - visibleBottom);
    if(scrollEndInset > 0) scrollEndInset += 16;
    this._contents.style.maxHeight = availableHeight + 'px';
    this._contents.style.minHeight = availableHeight + 'px';
    this._contents.style.paddingBottom = scrollEndInset + 'px';
    this._contents.style.scrollPaddingBottom = scrollEndInset + 'px';
  },

  rebuildMapsMenu: function () {
    this._mapsMenu = this.createMapsMenu();
  },

  createCategoryMenu: function() {
    return new CategoryMenu({
      buildActionGroup: this.zMap.categoryCount > 0,
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
      if(this.viewStyleBottomSlide) {
        this._contents.style.maxHeight = ZConfig.getConfig("layersHeight");
      } else {
        this._refreshDesktopDrawerLayout();
      }
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
    var animationId = ++this._drawerAnimationId;
    this._animate(menu, from, to, isOpen, animationId);
    this._triggerHandler("after_animateStart", menu, from, to, isOpen);
  },

  _animate: function(menu, from, to, isOpen, animationId) {
    if(animationId !== this._drawerAnimationId) return;
    // console.log(`_animate(${menu}, ${from}, ${to}, ${isOpen})`);
    this._drawerClosing = !isOpen;
    if(isOpen) this._preserveContentOnClose = false;
    if ((isOpen && from < to) || (!isOpen && from > to)) {
      from = to;
    }

    if(this._drawerAnimationTimeout) {
      window.clearTimeout(this._drawerAnimationTimeout);
      this._drawerAnimationTimeout = null;
    }

    menu.style.transition = 'none';
    if(this.viewStyleBottomSlide && this._contents) {
      this._contents.style.transition = 'none';
    }
    if(this.viewStyleBottomSlide && this._drawerHeaderSeparator) {
      this._drawerHeaderSeparator.style.transition = 'none';
    }
    menu.style.top = from + "px";
    if(this.viewStyleBottomSlide) this._applyMobileDrawerViewport(from);

    if(from === to) {
      menu.style.transition = '';
      if(isOpen) this.updateContentsHeight();
      else this._finishDrawerClose();
      return;
    }

    void menu.offsetHeight;
    window.requestAnimationFrame(function() {
      if(animationId !== this._drawerAnimationId) return;
      var reducedMotion = window.matchMedia &&
        window.matchMedia('(prefers-reduced-motion: reduce)').matches;
      var duration = reducedMotion ? 1 : 360;
      var timing = 'cubic-bezier(0.32, 0.72, 0, 1)';
      menu.style.transition =
        'top ' + duration + 'ms ' + timing + ', ' +
        'height ' + duration + 'ms ' + timing + ', ' +
        'left ' + duration + 'ms ' + timing + ', ' +
        'width ' + duration + 'ms ' + timing + ', ' +
        'border-radius ' + duration + 'ms ' + timing;
      if(this.viewStyleBottomSlide && this._contents) {
        this._contents.style.transition =
          'opacity ' + Math.min(duration, 240) + 'ms ease-out, ' +
          'transform ' + duration + 'ms ' + timing;
      }
      if(this.viewStyleBottomSlide && this._drawerHeaderSeparator) {
        this._drawerHeaderSeparator.style.transition =
          'opacity ' + Math.min(duration, 200) + 'ms ease-out';
      }
      menu.style.top = to + 'px';
      if(this.viewStyleBottomSlide) {
        this._applyMobileDrawerViewport(to);
        this.updateContentsHeight(to);
      }
      this._drawerAnimationTimeout = window.setTimeout(function() {
        if(animationId !== this._drawerAnimationId) return;
        menu.style.transition = '';
        if(this._contents) this._contents.style.transition = '';
        if(this._drawerHeaderSeparator) {
          this._drawerHeaderSeparator.style.transition = '';
        }
        this._drawerAnimationTimeout = null;
        if(isOpen) this.updateContentsHeight();
        else this._finishDrawerClose();
      }.bind(this), duration + 20);
    }.bind(this));
  },

  _finishDrawerClose: function() {
    this._drawerClosing = false;
    if(!this._preserveContentOnClose) {
      this._gamesButton.clear();
      this._mapsButton.clear();
      this.resetContent();
    }
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

  closeDrawer: function(preserveContent) {
    // console.log(`closeDrawer`);
    this._preserveContentOnClose = !!preserveContent || (
      this._drawerClosing && this._preserveContentOnClose
    );
    if(this._open || this.drawerTop() < this._startPosition) {
      this._setDrawerState(false, this._startPosition);
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
