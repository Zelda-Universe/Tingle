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
    this._partialDrawerMode = false;

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
    {
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
      {
        var grabber = L.DomUtil.create('div', 'grabber', headerMenu);
        grabber.setAttribute('role', 'button');
        grabber.setAttribute('tabindex', '0');
        grabber.setAttribute('aria-label', 'Partially open drawer');
        var grabberPress = null;
        var advanceGrabber = function() {
          if(!this._open) {
            this.openDrawerSmall(true);
          } else if(this.drawerTop() > this.options.openTo + 2) {
            this.openDrawerLarge();
          } else {
            this.closeDrawer();
          }
        }.bind(this);
        L.DomEvent.on(grabber, 'pointerdown', function(e) {
          grabberPress = { x: e.clientX, y: e.clientY };
        });
        L.DomEvent.on(grabber, 'click', function(e) {
          L.DomEvent.stop(e);
          if(grabberPress && Math.hypot(e.clientX - grabberPress.x, e.clientY - grabberPress.y) >= 8) return;
          advanceGrabber();
        }, this);
        L.DomEvent.on(grabber, 'keydown', function(e) {
          if(e.key === 'Enter' || e.key === ' ') {
            L.DomEvent.stop(e);
            advanceGrabber();
          }
        }, this);
      }

      this._mapsButton = new CategoryButton({
        addlClasses: 'completed-button menu-header-button',
        afterToggle: function() {
          if (this.toggledOn) {
            // console.log('_mapsButton - afterToggle - this.toggledOn');
            var drawerWasOpen = _thisLayer._open;
            var previousDrawerTop = _thisLayer.drawerTop();
            _thisLayer.setContent(_thisLayer._mapsMenu.domNode, "maps");
            if(_thisLayer.viewStyleBottomSlide) {
              if(_thisLayer._headerPageParent) _thisLayer._openSwitchMenuAtParentHeight();
              else if(drawerWasOpen) _thisLayer.openDrawerManual(previousDrawerTop);
              else _thisLayer.openDrawerDefaultPartial();
            } else {
              _thisLayer.openDrawerLarge();
            }
          } else {
            // console.log('_mapsButton - afterToggle - !this.toggledOn');
            if(_thisLayer.viewStyleBottomSlide) {
              if(
                _thisLayer._preserveContentOnClose &&
                !_thisLayer._open &&
                _thisLayer._contentType === 'maps'
              ) {
                this._toggle(true);
                _thisLayer.openDrawerDefaultPartial();
              } else {
                if(_thisLayer._switchMenuReturnMarker || _thisLayer._switchMenuReturnsToCategories) _thisLayer._returnFromSwitchMenu();
                else _thisLayer.closeDrawer();
              }
            } else {
              _thisLayer._returnFromSwitchMenu();
            }
          }
        },
        iconClass: 'General_Map',
        label: 'Switch Map',
        toggledOn: false
      });


      this._gamesButton = new CategoryButton({
        addlClasses: 'completed-button menu-header-button',
        afterToggle: function() {
          if (this.toggledOn) {
            var drawerWasOpen = _thisLayer._open;
            var previousDrawerTop = _thisLayer.drawerTop();
            _thisLayer.setContent(_thisLayer._gameMenu.domNode, "games");
            if(_thisLayer.viewStyleBottomSlide) {
              if(_thisLayer._headerPageParent) _thisLayer._openSwitchMenuAtParentHeight();
              else if(drawerWasOpen) _thisLayer.openDrawerManual(previousDrawerTop);
              else _thisLayer.openDrawerDefaultPartial();
            } else {
              _thisLayer.openDrawerLarge();
            }
          } else {
            if(_thisLayer.viewStyleBottomSlide) {
              if(
                _thisLayer._preserveContentOnClose &&
                !_thisLayer._open &&
                _thisLayer._contentType === 'games'
              ) {
                this._toggle(true);
                _thisLayer.openDrawerDefaultPartial();
              } else {
                if(_thisLayer._switchMenuReturnMarker || _thisLayer._switchMenuReturnsToCategories) _thisLayer._returnFromSwitchMenu();
                else _thisLayer.closeDrawer();
              }
            } else {
              _thisLayer._returnFromSwitchMenu();
            }
          }
        },
        iconClass: this.zMap.mapOptions.icon,
        label: 'Switch Game',
        toggledOn: false
      });
      $(headerMenu).append(this._mapsButton.domNode, this._gamesButton.domNode);
      this._syncSwitchButtonOrder();
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

      {
        window.requestAnimationFrame(function() {
          if(this.viewStyleBottomSlide) this._refreshMobileDrawerLayout();
          else this._refreshDesktopDrawerLayout();
        }.bind(this));
        var refreshMobileLayout = function() {
          if(!this.viewStyleBottomSlide) {
            this._refreshDesktopDrawerLayout();
            return;
          }
          if(this._keyboardDrawerViewport) {
            var baseline = this._keyboardDrawerViewport;
            var active = document.activeElement;
            var editing = active && active.matches('input:not([type="checkbox"]):not([type="radio"]):not([type="button"]):not([type="submit"]), textarea, [contenteditable="true"]');
            var height = window.visualViewport ? window.visualViewport.height : window.innerHeight;
            if(Math.abs(window.innerWidth - baseline.width) < 80 && (editing || height < baseline.height - 80)) return;
            this._keyboardDrawerViewport = null;
          }
          this._refreshMobileDrawerLayout();
        }.bind(this);
        document.addEventListener('focusin', function(e) {
          if(!this._keyboardDrawerViewport && e.target.matches('input:not([type="checkbox"]):not([type="radio"]):not([type="button"]):not([type="submit"]), textarea, [contenteditable="true"]')) {
            this._keyboardDrawerViewport = {
              height: this._viewportHeight(), bottom: this._viewportBottom(), width: window.innerWidth
            };
          }
        }.bind(this));
        document.addEventListener('focusout', function() {
          window.setTimeout(refreshMobileLayout, 350);
        });
        window.addEventListener('resize', refreshMobileLayout);
        if(window.visualViewport) {
          window.visualViewport.addEventListener('resize', refreshMobileLayout);
        }
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
    if(!this.viewStyleBottomSlide) return;
    if(e.target.closest && e.target.closest('.marker-actions-row')) return;

    var point = e.type.startsWith('touch') ? e.touches[0] : e;
    this._clearDrawerClickSuppression();
    this._drawerXDown = point.clientX;
    this._drawerYDown = point.clientY;
    this._drawerStartTop = this.drawerTop();
    this._refreshMobileDrawerDetents();
    this._drawerDragging = false;
    this._drawerVelocity = 0;
    this._drawerLastY = point.clientY;
    this._drawerLastMoveTime = performance.now();

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
    if(!this._drawerDragging) {
      // Real touch taps contain a few pixels of movement. Do not consume
      // their click or snap the drawer until an intentional vertical drag.
      if(Math.abs(yDelta) < 8 || Math.abs(xDelta) > Math.abs(yDelta)) return;
      // A header-button tap must not cancel the drawer's resize. Only take
      // over once this interaction has actually become a vertical drag.
      this._drawerStartTop = this.drawerTop();
      this._drawerAnimationId++;
      if(this._drawerAnimationTimeout) {
        window.clearTimeout(this._drawerAnimationTimeout);
        this._drawerAnimationTimeout = null;
      }
      this._drawerClosing = false;
      if(this._drawerGeometryAnimation) {
        this._drawerGeometryAnimation.cancel();
        this._drawerGeometryAnimation = null;
      }
      this._container.style.transition = 'none';
      this._container.style.top = this._drawerStartTop + 'px';
      if(this._contents) this._contents.style.transition = 'none';
      if(this._drawerHeaderSeparator) this._drawerHeaderSeparator.style.transition = 'none';
    }
    if(yDelta === 0) return;

    this._drawerDragging = true;
    var now = performance.now();
    var elapsed = now - this._drawerLastMoveTime;
    if(elapsed > 0) {
      // Smoothed px/ms so a single jittery sample doesn't decide the snap.
      var sample = (point.clientY - this._drawerLastY) / elapsed;
      this._drawerVelocity = this._drawerVelocity * 0.6 + sample * 0.4;
    }
    this._drawerLastY = point.clientY;
    this._drawerLastMoveTime = now;
    var nextTop = Math.min(this._startPosition, this._drawerStartTop + yDelta);
    // Past fully open, stretch like iOS scrolling: the further the finger
    // goes, the less the drawer follows. Releasing snaps back to fully open.
    if(nextTop < this.options.openTo) {
      // iOS's rubber-band curve; DRAWER_STRETCH is the most it can ever give.
      var DRAWER_STRETCH = 200;
      var overshoot = this.options.openTo - nextTop;
      nextTop = this.options.openTo -
        (1 - 1 / (overshoot * 0.55 / DRAWER_STRETCH + 1)) * DRAWER_STRETCH;
    }
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
      this._settleDrawerDrag();
    }
    this._drawerXDown = null;
    this._drawerYDown = null;
    this._drawerStartTop = null;
    this._drawerDragging = false;
    this._drawerPointerId = null;
  },

  // Snap a released drag to closed, partially open or fully open, whichever
  // is nearest to where the drawer would coast at its release velocity.
  _settleDrawerDrag: function() {
    var currentTop = this.drawerTop();
    if(currentTop === this._drawerStartTop) return;

    // A pause before lifting the finger means no fling.
    var velocity = performance.now() - this._drawerLastMoveTime > 80
      ? 0
      : this._drawerVelocity;
    var travel = currentTop - this._drawerStartTop;
    // Small, fast movements should not fling the drawer through detents.
    var projectedTop = currentTop + (Math.abs(travel) >= 48
      ? Math.max(-1.5, Math.min(1.5, velocity)) * 80 : 0);

    this._refreshMobileDrawerDetents();
    var partialTop = this.options.softOpenTo;
    var detents = [this.options.openTo, this._startPosition];
    // Skip the partial stop on full-only pages, or when it would sit on top of
    // another detent.
    if(
      this._partialDrawerAvailable &&
      partialTop - this.options.openTo > 60 &&
      this._startPosition - partialTop > 60
    ) {
      detents.push(partialTop);
    }
    var target = detents.reduce(function(best, top) {
      return Math.abs(top - projectedTop) < Math.abs(best - projectedTop) ? top : best;
    });
    // Any drag moves at least one stop in its direction, never back.
    if(Math.abs(travel) >= 48 && (Math.abs(target - this._drawerStartTop) < 1 || (target - this._drawerStartTop) * travel < 0)) {
      var startTop = this._drawerStartTop;
      var ahead = detents.filter(function(top) {
        return travel < 0 ? top < startTop - 1 : top > startTop + 1;
      });
      if(ahead.length) {
        target = travel < 0 ? Math.max.apply(null, ahead) : Math.min.apply(null, ahead);
      }
    }

    if(target === this._startPosition) {
      this.closeDrawer(true);
    } else if(target === this.options.openTo) {
      this.openDrawerManual(this.options.openTo);
    } else {
      this.openDrawerSmall(true);
    }
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
    if(!this._usesPhysicalMobileScreen()) return 0;

    // Browsers do not expose the physical screen radius. The home-indicator
    // safe area scales with the rounded device enclosure and is the closest
    // per-device measurement available to mobile browsers and installed apps.
    // Some Simulator Safari versions expose a desktop user agent and no touch
    // points, so this must follow the mobile drawer rather than UA detection.
    var safeAreaBottom = this._safeAreaBottom() || 34;
    return Math.max(28, Math.min(52, safeAreaBottom * 1.4));
  },

  _safariPageTopInset: function() {
    var screenHeight = window.screen.height;
    if(!Number.isFinite(screenHeight)) return 0;
    if(screenHeight >= 852) return 59;
    if(screenHeight >= 812) return 47;
    return 20;
  },

  _usesPhysicalMobileScreen: function() {
    if(document.documentElement.classList.contains('zm-standalone')) return true;

    var navigator = window.navigator;
    var hasIOSStandaloneAPI = typeof navigator.standalone === 'boolean';
    var touchMac = navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1;
    var simulatorSafari = navigator.vendor === 'Apple Computer, Inc.' &&
      window.screen.width <= 600 && window.screen.height <= 1000;
    return hasIOSStandaloneAPI || touchMac || simulatorSafari;
  },

  _viewportHeight: function() {
    if(this._keyboardDrawerViewport) return this._keyboardDrawerViewport.height;
    return window.visualViewport
      ? window.visualViewport.height
      : window.innerHeight;
  },

  _viewportBottom: function() {
    if(this._keyboardDrawerViewport) return this._keyboardDrawerViewport.bottom;
    return window.visualViewport
      ? window.visualViewport.offsetTop + window.visualViewport.height
      : window.innerHeight;
  },

  _mobileDrawerProgress: function(top) {
    var travel = this._startPosition - this.options.openTo;
    if(!Number.isFinite(travel) || travel <= 0) return this._open ? 1 : 0;
    return Math.max(0, Math.min(1, (this._startPosition - top) / travel));
  },

  // Like _mobileDrawerProgress, but only counts travel above the partial stop,
  // so the drawer stays a floating card until it heads for fully open.
  _mobileDrawerExpansionProgress: function(top) {
    // A drawer resting partially open stays a floating card, even if the
    // viewport (e.g. Safari's toolbar) has moved the partial stop under it.
    if(this._partialDrawerMode && !this._drawerDragging) return 0;
    var fromTop = this._partialDrawerAvailable && Number.isFinite(this.options.softOpenTo)
      ? this.options.softOpenTo
      : this._startPosition;
    var travel = fromTop - this.options.openTo;
    if(!Number.isFinite(travel) || travel <= 0) return this._mobileDrawerProgress(top);
    return Math.max(0, Math.min(1, (fromTop - top) / travel));
  },

  _updateMobileDrawerPresentation: function(top) {
    if(!this.viewStyleBottomSlide) return;

    var progress = this._mobileDrawerProgress(top);
    var expansion = this._mobileDrawerExpansionProgress(top);
    var edgeInset = 12 * (1 - progress);
    var topRadius = 28;
    var expandedBottomRadius = this._deviceBottomCornerRadius();
    var bottomRadius = expandedBottomRadius > 0
      ? 28 + ((expandedBottomRadius - 28) * expansion)
      : 28 * (1 - expansion);
    var fullWidth = this.options.width || window.innerWidth;
    // Fade the contents in over the travel to the first stop above closed, so
    // they're fully settled when a drawer comes to rest partially open.
    var fadeProgress = progress;
    var partialTravel = this._startPosition - this.options.softOpenTo;
    if(this._partialDrawerAvailable && partialTravel > 0) {
      fadeProgress = Math.min(1, (this._startPosition - top) / partialTravel);
    }
    var contentProgress = Math.max(0, Math.min(1, (fadeProgress - 0.08) / 0.42));
    // Match positionAds(): lifted means more than 1px above the closed stop.
    document.documentElement.style.setProperty('--mobile-drawer-notice-opacity', top < this._startPosition - 1 ? '0' : '1');
    // While closing, the contents ride down with the drawer as they were
    // when it was released, instead of fading out ahead of it.
    if(this._drawerClosing && Number.isFinite(this._closingContentProgress)) {
      contentProgress = this._closingContentProgress;
    }

    this._container.style.left = edgeInset + 'px';
    this._container.style.width = Math.max(0, fullWidth - (edgeInset * 2)) + 'px';
    this._container.style.borderRadius =
      topRadius + 'px ' + topRadius + 'px ' +
      bottomRadius + 'px ' + bottomRadius + 'px';

    if(this._contents) {
      // Between closed and the partial stop, hold the contents at the partial
      // drawer's width, offset against the widening edges, so wrapped text
      // doesn't reflow while it opens. Above the partial stop the contents
      // follow the drawer's width out to fully open. Pages without a partial
      // stop stay at the fully open width throughout.
      var settledInset = 0;
      if(this._partialDrawerAvailable) {
        settledInset = top < this.options.softOpenTo
          ? edgeInset
          : 12 * (1 - this._mobileDrawerProgress(this.options.softOpenTo));
      }
      this._contents.style.width = Math.max(0, fullWidth - (settledInset * 2)) + 'px';
      this._contents.style.opacity = contentProgress;
      this._contents.style.transform =
        'translate(' + (settledInset - edgeInset) + 'px, ' + (8 * (1 - contentProgress)) + 'px)';
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
    var visibleBottom = this._viewportBottom() - this._safeAreaBottom();
    var progress = this._mobileDrawerExpansionProgress(top);
    var bottomGap = 10 * (1 - progress);
    var isStandalone = document.documentElement.classList.contains('zm-standalone');
    var usesPhysicalScreen = this._usesPhysicalMobileScreen();
    var expandedBottom = usesPhysicalScreen && Number.isFinite(window.screen.height)
      ? window.screen.height - (isStandalone ? 0 : this._safariPageTopInset())
      : this._viewportBottom();

    // iPhone Safari and standalone apps extend behind system chrome to the
    // device edge. Other narrow/desktop-emulated browsers stop at their
    // viewport edge. The exterior floating gap tracks the opening gesture.
    // Remove the floating gap early so it cannot remain beneath an open sheet.
    return visibleBottom + ((expandedBottom - visibleBottom) * progress) - bottomGap;
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

  _mobileDrawerPeekHeight: function() {
    if(!this._contents) return null;

    var content = this._contents.querySelector('.menu-cat-content-inner');
    if(!content) return null;

    var title = content.querySelector('.popupTitle, h1, h2, h3, h4, h5, h6');
    var actions = content.querySelectorAll('.marker-actions-row .marker-action-button');
    if(!title || !actions.length) return null;

    var actionCount = Math.min(3, actions.length);
    var lastAction = actions[actionCount - 1];
    var containerTop = this._container.getBoundingClientRect().top;
    var popupContent = content.querySelector('.popupContent');
    // Measure the resting layout, not the 8px entrance offset the contents
    // carry while fading in on a first open.
    var contentsShift = new DOMMatrixReadOnly(
      window.getComputedStyle(this._contents).transform
    ).m42;
    var contentBottom = Math.max(
      lastAction.getBoundingClientRect().bottom - contentsShift,
      popupContent ? popupContent.getBoundingClientRect().bottom - contentsShift : containerTop
    );
    if(contentBottom <= containerTop) return null;

    return Math.max(
      this._form.getBoundingClientRect().height,
      contentBottom - containerTop
    );
  },

  _mobileDrawerContentHeight: function() {
    if(!this._contents || !this._form) return null;

    var content = this._contents.querySelector('.menu-cat-content-inner');
    if(!content) return null;

    var contentsOffset = Number.isFinite(this._mobileDrawerContentsOffset)
      ? this._mobileDrawerContentsOffset
      : this._contents.getBoundingClientRect().top -
        this._container.getBoundingClientRect().top;

    var switchMenu = content.querySelector('.switch-menu');
    if(switchMenu) {
      // Measure the menu itself, not the wrapper's scrollHeight: on Safari
      // the wrapper includes a toolbar-clearance ::after spacer. Counting
      // that spacer as menu content feeds extra space into the partial stop.
      return contentsOffset + switchMenu.getBoundingClientRect().bottom -
        this._contents.getBoundingClientRect().top;
    }

    return Math.max(
      this._form.getBoundingClientRect().height,
      contentsOffset + content.offsetTop + content.scrollHeight
    );
  },

  _mobileDrawerMaxPartialHeight: function() {
    return this._viewportHeight() * 0.5;
  },

  // Height of the partially open drawer for the current page, or null when the
  // page only opens fully (account pages, menus, forms). Partial drawers fit
  // their page's content up to the maximum; the category list always uses it.
  _mobileDrawerPartialHeight: function() {
    var type = this._contentType || 'category';
    var maxHeight = this._mobileDrawerMaxPartialHeight();
    var height;
    if(type === 'category') {
      height = maxHeight;
    } else if(/^m\d+$/.test(type) || /^droppedPin-/.test(type)) {
      height = this._mobileDrawerPeekHeight() || this._mobileDrawerContentHeight();
    } else if(type === 'games' || type === 'maps') {
      height = this._mobileDrawerContentHeight();
    } else {
      return null;
    }
    return Math.min(height || maxHeight, maxHeight);
  },

  // Recompute the partial stop for the page currently in the drawer.
  _refreshMobileDrawerDetents: function() {
    if(!this.viewStyleBottomSlide || !this._form) return;
    var currentCssTop = Number.parseFloat(this._container.style.top) || 0;
    this._updateMobileDrawerSoftOpenTo(
      Number.isFinite(this._mobileDrawerBaseTop)
        ? this._mobileDrawerBaseTop
        : this._container.getBoundingClientRect().top - currentCssTop
    );
  },

  _updateMobileDrawerSoftOpenTo: function(baseScreenTop) {
    var peekHeight = this._mobileDrawerPartialHeight();
    this._partialDrawerAvailable = !!peekHeight;
    if(!peekHeight) peekHeight = this._mobileDrawerMaxPartialHeight();

    this.options.softOpenTo = Math.max(
      this.options.openTo,
      this._viewportBottom() -
        this._safeAreaBottom() -
        10 -
        peekHeight -
        baseScreenTop
    );
  },

  _refreshMobileDrawerLayout: function() {
    if(!this.viewStyleBottomSlide || !this._form) return;
    if(this._keyboardDrawerViewport) return;
    if(document.activeElement && document.activeElement.matches('.marker-search')) return;
    this._map.invalidateSize({ pan: false });
    this.options.width = this._map.getContainer().getBoundingClientRect().width || window.innerWidth;
    // Use the measured map width instead of a percentage. The Leaflet corner
    // wrapper is shrink-to-fit, so a percentage creates a circular width
    // calculation when the expanded drawer is resized.
    this._container.style.width = this.options.width + 'px';
    this._form.style.width = '100%';
    this.options.height = this._viewportHeight();
    var collapsedHeight = this._form.getBoundingClientRect().height || this.options.headerHeight + 20;
    var currentTop = this.drawerTop();
    var currentCssTop = Number.parseFloat(this._container.style.top) || 0;
    var containerRect = this._container.getBoundingClientRect();
    var contentsRect = this._contents.getBoundingClientRect();
    this._mobileDrawerBaseTop = containerRect.top - currentCssTop;
    this._mobileDrawerContentsOffset = contentsRect.top - containerRect.top;
    var baseScreenTop = this._mobileDrawerBaseTop;
    this._updateMobileDrawerSoftOpenTo(baseScreenTop);
    var desiredTop = this._viewportBottom() - collapsedHeight - 10
      - this._safeAreaBottom() - baseScreenTop;
    this._container.style.top = desiredTop + 'px';
    this._startPosition = desiredTop;
    // How far out the map zooms depends on where the drawer rests.
    if(this.zMap && this.zMap._updateMinZoom) this.zMap._updateMinZoom();
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
    // Mid-transition the drawer's height is animated, so its padding below
    // the list can't be measured; lay out once the transition ends.
    if(this._pageTransitionCleanup) {
      this._desktopLayoutPending = true;
      return;
    }
    this._desktopLayoutPending = false;
    // Measured, as Leaflet's cached size lags a window resize.
    var mapHeight = this._map.getContainer().clientHeight;
    var maxHeight = mapHeight - 250;
    // Once the ads are settled, run down to the bottom of the map: clear of the
    // space reserved for a banner, which can slide underneath, or with the
    // same margin as at the top when there is none.
    if(this._bottomReserve !== undefined) {
      var mapTop = this._map.getContainer().getBoundingClientRect().top;
      var container = this._container.getBoundingClientRect();
      var contents = this._contents.getBoundingClientRect();
      var bottomMargin = this._bottomReserve || container.top - mapTop;
      maxHeight = mapHeight - bottomMargin
        - (contents.top - mapTop) - (container.bottom - contents.bottom);
    }
    // Portrait tablets: at most 60% of the height, which leaves the map
    // (and the banner below the sidebar) room.
    if(mapHeight > this._map.getContainer().clientWidth) {
      var drawer = this._container.getBoundingClientRect();
      var list = this._contents.getBoundingClientRect();
      maxHeight = Math.min(maxHeight,
        mapHeight * .6 - (list.top - drawer.top) - (drawer.bottom - list.bottom));
    }
    this._contents.style.maxHeight = Math.max(maxHeight, 250) + 'px';
  },

  setBottomReserve: function(height) {
    if(this._bottomReserve === height) return;
    this._bottomReserve = height;
    this._refreshDesktopDrawerLayout();
  },

  _syncSwitchButtonOrder: function() {
    var maps = this._mapsButton.domNode[0] || this._mapsButton.domNode;
    var games = this._gamesButton.domNode[0] || this._gamesButton.domNode;
    var parent = maps.parentNode;
    if(!parent) return;
    // Mobile uses float:right; desktop uses flex. Keep the visual order
    // Map, Game in both layouts, including every rotation/breakpoint change.
    (this.viewStyleBottomSlide ? [games, maps] : [maps, games]).forEach(function(button) {
      parent.appendChild(button);
    });
  },

  setResponsiveLayout: function(mobile) {
    if(this.viewStyleBottomSlide === mobile) return;
    var scrollTop = this._contents.scrollTop;
    if(this.viewStyleBottomSlide) this._layoutMobileState = { open: this._open, partial: this._partialDrawerMode };
    if(this._pageTransitionCleanup) this._pageTransitionCleanup();
    this._drawerAnimationId++;
    if(this._drawerGeometryAnimation) this._drawerGeometryAnimation.cancel();
    this._drawerGeometryAnimation = null;
    if(this._drawerAnimationTimeout) window.clearTimeout(this._drawerAnimationTimeout);
    this._drawerAnimationTimeout = null;
    this.isMobile = this.viewStyleBottomSlide = mobile;
    this._syncSwitchButtonOrder();
    this._keyboardDrawerViewport = null;
    this._mobileDrawerBaseTop = this._mobileDrawerContentsOffset = null;
    this._container.removeAttribute('style');
    this._contents.removeAttribute('style');
    this._contents.style.clear = 'both';
    var header = this.headerBar;
    if(mobile) {
      L.DomUtil.addClass(this._container, 'leaflet-control-layers-mobile');
      if(!header.isolated) {
        var row = header.domNode;
        var separator = row.nextElementSibling;
        if(separator && separator.classList.contains(this.options.className + '-separator')) separator.remove();
        var wrapper = L.DomUtil.create('div', 'header-bar mobile-header-bar leaflet-control', this._map._controlCorners.topleft);
        // Match the initial mobile DOM order. Appending after the floating
        // drawer makes Leaflet's clear:both push the search header below it.
        this._map._controlCorners.topleft.insertBefore(wrapper, this._container);
        wrapper.appendChild(row);
        header.domNode = wrapper;
      }
      header.isolated = true;
      header.ensureMobileSearchResultsPanel();
      this._form.style.width = '100%';
      this._container.style.margin = '0';
      this._container.style.border = '0';
      L.DomUtil.addClass(this._contents, 'bottommenu');
      var state = this._layoutMobileState || { open: true, partial: true };
      this._open = false;
      this._refreshMobileDrawerLayout();
      if(state.open) {
        if(state.partial) this.openDrawerDefaultPartial();
        else this.openDrawerLarge();
      }
    } else {
      L.DomUtil.removeClass(this._container, 'leaflet-control-layers-mobile');
      if(header.isolated) {
        var wrapper = header.domNode;
        var row = wrapper.querySelector('.row-header');
        this._form.insertBefore(row, this._form.firstChild);
        this._form.insertBefore(L.DomUtil.create('div', this.options.className + '-separator'), row.nextSibling);
        wrapper.remove();
        header.domNode = row;
      }
      header.isolated = false;
      header.hideMobileSearchResults();
      this.options.width = 360;
      this._form.style.width = '360px';
      this._contents.style.width = '360px';
      L.DomUtil.removeClass(this._contents, 'bottommenu');
      this.options.collapsed = false;
      L.DomUtil.addClass(this._container, 'leaflet-control-layers-expanded');
      this._refreshDesktopDrawerLayout();
    }
    var settings = this.zMap.settingsControl;
    if(settings) {
      settings.container.classList.toggle('settings-control-mobile-floating', mobile);
      if(settings.minimalCheckbox) settings.minimalCheckbox.parentNode.style.display = mobile ? 'none' : '';
    }
    this._contents.scrollTop = scrollTop;
    this._map.invalidateSize({ pan: false });
    if(this.zMap && this.zMap._updateMinZoom) this.zMap._updateMinZoom();
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
    var surfaceBottom = this._mobileDrawerSurfaceBottom(drawerTop);
    var drawerBottom = Number.isFinite(targetTop)
      ? surfaceBottom
      : Math.min(containerRect.bottom, surfaceBottom);
    var availableHeight = Math.max(0, drawerBottom - contentsTop);
    this._contents.style.maxHeight = availableHeight + 'px';
    this._contents.style.minHeight = availableHeight + 'px';
    this._contents.style.paddingBottom = '0px';
    this._contents.style.scrollPaddingBottom = '0px';
    // Keep the scrolling surface behind Safari's translucent toolbar, but
    // provide enough scroll-end room to lift the final row above it.
    var safariScrollInset = document.documentElement.classList.contains('zm-ios-safari')
      ? Math.max(0, drawerBottom - this._viewportBottom()) + 16
      : 0;
    if(['games', 'maps'].includes(this._contentType)) {
      this._contents.style.setProperty('--drawer-scroll-end-inset', '0px');
      var switchMenu = this._contents.querySelector('.switch-menu');
      if(switchMenu && contentsTop + switchMenu.offsetTop + switchMenu.offsetHeight <= this._viewportBottom()) {
        safariScrollInset = 0;
      }
    }
    this._contents.style.setProperty('--drawer-scroll-end-inset', safariScrollInset + 'px');
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
    var gameMenu = new CategoryMenu({
      categories: sortGames(games.filter(Boolean)),
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
    gameMenu.domNode.addClass('switch-menu');
    gameMenu.domNode.prepend(
      '<h2 class="popupTitle switch-menu-title">Switch Game</h2>'
    );
    return gameMenu;
  },

  createMapsMenu: function() {
    var layers = this;
    var disableFn = function() {
      this.disabled = (layers.currentMapLayer.id === this.category.id)

      return true;
    };

    var mapsMenu = new CategoryMenu({
      categoryButtonOptions: {
        afterToggle: function () {
          layers._map.removeLayer(layers.currentMapLayer);
          layers._map.addLayer(this.category);
          layers.currentMapLayer = this.category;
          layers.currentMapLayer.bringToBack();
          layers._map.fire("baselayerchange", layers.currentMapLayer);

          layers._mapsMenu.updateCategorySelectionFn.call(
            layers._mapsMenu,
            this
          );
          if(layers.viewStyleBottomSlide) {
            layers.openDrawerDefaultPartial();
          }

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
    mapsMenu.domNode.addClass('switch-menu maps-menu');
    mapsMenu.domNode.prepend(
      '<h2 class="popupTitle switch-menu-title">Switch Map</h2>'
    );
    return mapsMenu;
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
    var previousContentType = this._contentType;
    var siblingPages = ['games', 'maps', 'accountPage', 'loginForm'];
    var swappingSiblingPages = siblingPages.includes(previousContentType) && siblingPages.includes(vType);
    if(siblingPages.includes(vType) && !this._navigatingBack && !swappingSiblingPages &&
      (previousContentType === 'category' || /^m\d+$/.test(previousContentType || ''))) {
      this._headerPageParent = (!this.viewStyleBottomSlide || this._open) ? {
        type: previousContentType, top: this.drawerTop()
      } : null;
    }
    if(siblingPages.includes(vType)) {
      // All header destinations are siblings: retain the original parent
      // rather than building a history through Account and the switch menus.
      var headerParent = this._headerPageParent;
      this._mobileAccountParent = headerParent;
      this._desktopAccountReturnMarker = headerParent && /^m\d+$/.test(headerParent.type)
        ? headerParent.type.substring(1) : null;
      this._switchMenuReturnMarker = this._desktopAccountReturnMarker;
      this._switchMenuReturnsToCategories = !!headerParent && headerParent.type === 'category';
      this._switchMenuParentTop = headerParent ? headerParent.top : null;
      this._switchMenuReturnAccount = false;
      this._switchMenuReturnLogin = false;
    }
    var switchingBetweenPOIs = /^m\d+$/.test(previousContentType || '') && /^m\d+$/.test(vType || '');
    if(switchingBetweenPOIs && this._pageTransitionCleanup) this._pageTransitionCleanup();
    var switchingMenu = ['games', 'maps'].includes(previousContentType) || ['games', 'maps'].includes(vType);
    var desktopMenuFromCategories = (!this.viewStyleBottomSlide || this._switchMenuReturnsToCategories) && previousContentType === 'category' && ['games', 'maps'].includes(vType);
    var desktopMenuToCategories = (!this.viewStyleBottomSlide || this._switchMenuReturnsToCategories) && vType === 'category' && ['games', 'maps'].includes(previousContentType);
    var desktopMenuPOINavigation = (
      (['games', 'maps'].includes(vType) && /^m\d+$/.test(previousContentType || '')) ||
      (['games', 'maps'].includes(previousContentType) && /^m\d+$/.test(vType || ''))
    );
    var accountSwitchNavigation =
      (['accountPage', 'loginForm'].includes(previousContentType) && ['games', 'maps'].includes(vType)) ||
      (['accountPage', 'loginForm'].includes(vType) && ['games', 'maps'].includes(previousContentType));
    var switchToAccountWithParent = ['games', 'maps'].includes(previousContentType) &&
      ['accountPage', 'loginForm'].includes(vType) &&
      (!!this._switchMenuReturnMarker || this._switchMenuReturnsToCategories ||
        this._switchMenuReturnAccount || this._switchMenuReturnLogin);
    if(switchingMenu && this._pageTransitionCleanup) this._pageTransitionCleanup();
    var shouldSlide = !swappingSiblingPages && !this._restoringInitialPage && (this._navigatingBack || (!switchToAccountWithParent && (!switchingMenu || desktopMenuFromCategories || desktopMenuToCategories || desktopMenuPOINavigation || accountSwitchNavigation) && !switchingBetweenPOIs)) && previousContentType && previousContentType !== vType &&
      (!this.viewStyleBottomSlide || this._open) &&
      !window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    var outgoingPage;
    var outgoingBounds;
    var outgoingDrawerHeight;
    if(shouldSlide && this._contents.animate) {
      if(this._pageTransitionCleanup) this._pageTransitionCleanup();
      if(!this.viewStyleBottomSlide) outgoingDrawerHeight = this._container.getBoundingClientRect().height;
      outgoingBounds = {
        top: this._contents.offsetTop,
        left: this._contents.offsetLeft,
        width: this._contents.getBoundingClientRect().width,
        height: this._contents.getBoundingClientRect().height
      };
      var outgoingScrollTop = this._contents.scrollTop;
      // Reusable menus must stay available to their owning widgets. Other
      // pages can move intact, preserving CSS and avoiding computed-style
      // reads/writes for every descendant before the animation begins.
      var reusableMenu = ['category', 'games', 'maps'].includes(previousContentType);
      outgoingPage = this._contents.cloneNode(reusableMenu);
      if(!reusableMenu) {
        $(outgoingPage).append($(this._contents).children().detach());
      }
      outgoingPage.removeAttribute('id');
      outgoingPage.setAttribute('aria-hidden', 'true');
      outgoingPage.inert = true;
      outgoingPage.scrollTop = this._contents.scrollTop;
    }
    this._triggerHandler("beforeSetContent", vContent, vType);
    this._setContent(vContent, vType);
    this._triggerHandler("afterSetContent", vContent, vType);
    if(outgoingPage) {
      var depths = {
        category: 0, search: 1, games: 1, maps: 1, loginForm: 1, accountPage: 1,
        registerForm: 2, lostPasswordForm: 2, accountInformationPage: 2,
        offlineMapsPage: 2, bookmarksPage: 2, deleteAccountForm: 2, changePasswordForm: 3,
        adminPage: 2, adminUserPage: 3
      };
      var pageDepth = function(type) {
        if(depths[type] !== undefined) return depths[type];
        // Marker detail pages sit above the category list and search results.
        if(/^m\d+$/.test(type) || /^droppedPin-/.test(type) || type === 'newMarker') return 2;
        return 0;
      };
      var backward = this._navigatingBack || pageDepth(vType) < pageDepth(previousContentType);
      if(desktopMenuPOINavigation) backward = ['games', 'maps'].includes(previousContentType);
      if(accountSwitchNavigation) backward = ['games', 'maps'].includes(previousContentType);
      if(((/^m\d+$/.test(previousContentType || '') && ['accountPage', 'loginForm'].includes(vType)) ||
         (/^m\d+$/.test(vType || '') && ['accountPage', 'loginForm'].includes(previousContentType)))) {
        backward = /^m\d+$/.test(vType || '');
      }
      // Explicit Back actions take precedence over inferred page depths.
      if(this._navigatingBack) backward = true;
      var width = this._contents.getBoundingClientRect().width;
      outgoingPage.style.position = 'absolute';
      outgoingPage.style.top = outgoingBounds.top + 'px';
      outgoingPage.style.left = outgoingBounds.left + 'px';
      outgoingPage.style.boxSizing = 'border-box';
      outgoingPage.style.margin = '0';
      outgoingPage.style.width = outgoingBounds.width + 'px';
      outgoingPage.style.height = outgoingBounds.height + 'px';
      outgoingPage.style.minHeight = outgoingBounds.height + 'px';
      outgoingPage.style.maxHeight = outgoingBounds.height + 'px';
      outgoingPage.style.pointerEvents = 'none';
      outgoingPage.style.zIndex = backward ? '2' : '0';
      var previousZIndex = this._contents.style.zIndex;
      this._contents.style.zIndex = '1';
      this._contents.parentNode.appendChild(outgoingPage);
      outgoingPage.scrollTop = outgoingScrollTop;
      var timing = { duration: 400, easing: 'cubic-bezier(.35,.91,.33,.97)' };
      var entering = this._contents.animate([
        { transform: 'translateX(' + (backward ? -width * .3 : width) + 'px)', opacity: 1,
          clipPath: backward ? 'inset(0 70% 0 0)' : 'inset(0 0 0 0)' },
        { transform: 'translateX(0)', opacity: 1, clipPath: 'inset(0 0 0 0)' }
      ], timing);
      var leaving = outgoingPage.animate([
        { transform: 'translateX(0)', opacity: 1, clipPath: 'inset(0 0 0 0)' },
        { transform: 'translateX(' + (backward ? width : -width * .3) + 'px)', opacity: 0,
          clipPath: backward ? 'inset(0 0 0 0)' : 'inset(0 70% 0 0)' }
      ], timing);
      // Keep the incoming desktop page at its natural height. Giving its
      // scrolling region the outgoing menu's height creates blank space and
      // changes clipping until the temporary height animation is cancelled.
      // The outgoing snapshot already retains its own measured height.
      var drawerResizing;
      var previousDrawerOverflow = this._container.style.overflow;
      if(!this.viewStyleBottomSlide && typeof this._container.animate === 'function') {
        var incomingDrawerHeight = this._container.getBoundingClientRect().height;
        var drawerStyle = window.getComputedStyle(this._container);
        var verticalExtras = drawerStyle.boxSizing === 'border-box' ? 0 :
          (Number.parseFloat(drawerStyle.paddingTop) || 0) +
          (Number.parseFloat(drawerStyle.paddingBottom) || 0) +
          (Number.parseFloat(drawerStyle.borderTopWidth) || 0) +
          (Number.parseFloat(drawerStyle.borderBottomWidth) || 0);
        if(Math.abs(incomingDrawerHeight - outgoingDrawerHeight) > .5) {
          this._container.style.overflow = 'hidden';
          drawerResizing = this._container.animate([
            { height: Math.max(0, outgoingDrawerHeight - verticalExtras) + 'px' },
            { height: Math.max(0, incomingDrawerHeight - verticalExtras) + 'px' }
          ], timing);
        }
        // A page that fills in while sliding in (e.g. a list loaded from the
        // server) changes its height: head for the new height from wherever
        // the drawer is, rather than finishing at the old one and jumping.
        if(typeof ResizeObserver === 'function') {
          var transitionStart = performance.now();
          var incomingContentsHeight = this._contents.getBoundingClientRect().height;
          var retarget = function() {
            var contentsHeight = this._contents.getBoundingClientRect().height;
            if(Math.abs(contentsHeight - incomingContentsHeight) <= .5) return;
            incomingContentsHeight = contentsHeight;
            var currentHeight = this._container.getBoundingClientRect().height;
            if(drawerResizing) drawerResizing.cancel();
            var targetHeight = this._container.getBoundingClientRect().height;
            drawerResizing = null;
            if(Math.abs(targetHeight - currentHeight) <= .5) return;
            this._container.style.overflow = 'hidden';
            drawerResizing = this._container.animate([
              { height: Math.max(0, currentHeight - verticalExtras) + 'px' },
              { height: Math.max(0, targetHeight - verticalExtras) + 'px' }
            ], {
              duration: Math.max(150, timing.duration - (performance.now() - transitionStart)),
              easing: timing.easing
            });
          }.bind(this);
          var contentsObserver = new ResizeObserver(retarget);
          contentsObserver.observe(this._contents);
        }
      }
      var cleanup = function() {
        entering.cancel();
        leaving.cancel();
        if(contentsObserver) contentsObserver.disconnect();
        if(drawerResizing) {
          drawerResizing.cancel();
          this._container.style.overflow = previousDrawerOverflow;
        }
        outgoingPage.remove();
        this._contents.style.zIndex = previousZIndex;
        if(this._pageTransitionCleanup === cleanup) this._pageTransitionCleanup = null;
        if(this._desktopLayoutPending && !this._pageTransitionCleanup) this._refreshDesktopDrawerLayout();
      }.bind(this);
      this._pageTransitionCleanup = cleanup;
      entering.onfinish = cleanup;
    }
    this._navigatingBack = false;
    if(this.zMap && this.zMap.syncDrawerPageURL) this.zMap.syncDrawerPageURL(vType);
    if(
      /^m\d+$/.test(previousContentType || '') ||
      /^m\d+$/.test(vType || '')
    ) {
      this.zMap.updateUrl();
    }
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

    // On mobile, top-level pages opened from the map or header dismiss the
    // drawer, so they get a close button. On desktop the panel stays open and
    // returns to the category list, so they keep a back button.
    var isMapPage = /^m\d+$/.test(vType) || /^droppedPin-/.test(vType);
    var closesPage = isMapPage || ['accountPage', 'games', 'maps'].includes(vType);
    // A POI or pin opened from a list (e.g. Bookmarks) can also go back to it.
    var returnsTo = null;
    if(this.viewStyleBottomSlide && ['accountPage', 'loginForm'].includes(vType) && this._mobileAccountParent) {
      var accountBackButton = L.DomUtil.create('a', 'button back-button', this._contents);
      accountBackButton.innerHTML = '<i class="fas fa-chevron-left"></i>';
      accountBackButton.setAttribute('aria-label', 'Back');
      L.DomEvent.on(accountBackButton, 'click', function(e) {
        L.DomEvent.stop(e);
        this._returnFromMobileAccount();
      }, this);
    }
    if(isMapPage) {
      returnsTo = this._nextPageReturnsTo;
      this._nextPageReturnsTo = null;
    }
    if(returnsTo === 'bookmarks') {
      var returnButton = L.DomUtil.create('a', 'button back-button', this._contents);
      returnButton.innerHTML = '<i class="fas fa-chevron-left"></i>';
      returnButton.setAttribute('aria-label', 'Back to Bookmarks');
      L.DomEvent
        .on(returnButton, 'click', L.DomEvent.stopPropagation)
        .on(returnButton, 'click', function(e) {
          e.preventDefault();
          this.zMap._closeNewMarker();
          this._navigatingBack = true;
          this.zMap._createBookmarksPage();
          if(this.viewStyleBottomSlide) this.openDrawerLarge();
        }, this);
    }
    if(closesPage) {
      if(this.viewStyleBottomSlide && ['games', 'maps'].includes(vType) && this._switchMenuReturnsToCategories) {
        var categoryBackButton = L.DomUtil.create('a', 'button back-button', this._contents);
        categoryBackButton.innerHTML = '<i class="fas fa-chevron-left"></i>';
        categoryBackButton.setAttribute('aria-label', this._switchMenuReturnLogin ? 'Back to Login' : (this._switchMenuReturnAccount ? 'Back to Account' : 'Back to categories'));
        L.DomEvent.on(categoryBackButton, 'click', function(e) {
          L.DomEvent.stop(e);
          this._returnFromSwitchMenu();
        }, this);
      }
      var desktopAccountBack = !this.viewStyleBottomSlide && vType === 'accountPage';
      var desktopSwitchBack = ['games', 'maps'].includes(vType) && (!this.viewStyleBottomSlide || !!this._switchMenuReturnMarker);
      var hasAccountParent = this.viewStyleBottomSlide && vType === 'accountPage' && this._mobileAccountParent;
      if(!hasAccountParent) {
      var dismissButton = L.DomUtil.create(
        'a',
        (desktopSwitchBack || desktopAccountBack) ? 'button back-button' : 'button back-button close-button',
        this._contents
      );
      dismissButton.innerHTML = (desktopSwitchBack || desktopAccountBack) ? '<i class="fas fa-chevron-left"></i>' : '<i class="fas fa-times"></i>';
      dismissButton.setAttribute('aria-label', (desktopSwitchBack || desktopAccountBack) ? 'Back' : 'Close');
      L.DomEvent
        .on(dismissButton, 'click', L.DomEvent.stopPropagation)
        .on(dismissButton, 'click', function(e) {
          e.preventDefault();
          if(desktopAccountBack) {
            this._returnFromDesktopAccount();
            return;
          }
          if(desktopSwitchBack) {
            this._returnFromSwitchMenu();
            return;
          }
          this.closePage();
        }, this);
      }
    } else if(!closesPage &&
      vType != 'category' &&
      !(this.viewStyleBottomSlide && vType === 'loginForm' && this._mobileAccountParent) &&
      !(vType == 'search' && !this.viewStyleBottomSlide)
    ) {
      var closeButton = L.DomUtil.create('a', 'button back-button', this._contents);
      var isMobileLogin = this.viewStyleBottomSlide && vType === 'loginForm';
      if(isMobileLogin) L.DomUtil.addClass(closeButton, 'close-button');
      closeButton.innerHTML = isMobileLogin
        ? '<i class="fas fa-times"></i>'
        : '<i class="fas fa-chevron-left"></i>';
      closeButton.setAttribute('aria-label', isMobileLogin ? 'Close login' : 'Back');
      L.DomEvent
        .on(closeButton, 'click', L.DomEvent.stopPropagation)
        .on(closeButton, 'click', function(e) {
          e.preventDefault();
          if(isMobileLogin) {
            this.closeDrawer();
          } else {
            this._navigatingBack = true;
          if(vType === 'registerForm') {
            if(this._registrationReturnMarker) {
              this.zMap._pendingBookmarkRegistration = null;
              // Restore the existing POI without reselecting its map or
              // requesting an immediate drawer opening through goTo().
              // Both bypass the normal page/height transition.
              var registrationMarker = this.zMap.cachedMarkersById[this._registrationReturnMarker];
              if(this.viewStyleBottomSlide && typeof this._registrationParentPartial === 'boolean') {
                this._partialDrawerMode = this._registrationParentPartial;
              }
              if(registrationMarker) this.zMap._createMarkerPopup(registrationMarker);
              else this.resetContent();
              if(this.viewStyleBottomSlide && this._registrationParentPartial === false) this.openDrawerLarge();
            } else {
              this.zMap._createLoginForm();
            }
          } else if(vType === 'lostPasswordForm') {
            this.zMap._createLoginForm();
          } else if(vType === 'loginForm') {
            this._returnFromDesktopAccount();
          } else if(vType === 'changePasswordForm' && this.zMap.getUser()) {
            this.zMap._createAccountInformationForm();
          } else if(vType === 'adminUserPage' && this.zMap.getUser()) {
            this.zMap._createAdminPage();
          } else if(['offlineMapsPage', 'accountInformationPage', 'bookmarksPage', 'deleteAccountForm', 'adminPage'].includes(vType) && this.zMap.getUser()) {
            this.zMap._createAccountForm(this.zMap.getUser());
          } else {
            this.reset();
          }
          }
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
    var wasPartiallyOpen = this.viewStyleBottomSlide && this._partialDrawerMode;
    // Open
    this.resetContent();
    // Issue 232 https://github.com/Zelda-Universe/Zelda-Maps/issues/232
    // Need to reset the current marker open
    zMap._closeNewMarker();
    this.headerBar.searchArea.markerSearchField.clear();
    this._mapsButton.clear();
    this._gamesButton.clear();
    if(wasPartiallyOpen) this.openDrawerDefaultPartial();
  },

  // The next POI or dropped pin page shown gets a back button to this page.
  returnNextPageTo: function(page) {
    this._nextPageReturnsTo = page;
  },

  // Dismiss a top-level page (POI, dropped pin, account, game/map switcher): deselect it and, on
  // mobile, close the drawer; the category list is restored once it's closed.
  _returnFromDesktopAccount: function() {
    this._navigatingBack = true;
    var marker = this._desktopAccountReturnMarker && this.zMap.cachedMarkersById[this._desktopAccountReturnMarker];
    if(marker) this.zMap._createMarkerPopup(marker);
    else this.resetContent();
  },

  _returnFromMobileAccount: function() {
    var parent = this._mobileAccountParent;
    if(!parent) return;
    this._navigatingBack = true;
    if(/^m\d+$/.test(parent.type)) {
      var marker = this.zMap.cachedMarkersById[parent.type.substring(1)];
      if(marker) this.zMap._createMarkerPopup(marker);
      else this.resetContent();
    } else {
      this.resetContent();
    }
    this._partialDrawerMode = parent.top > this.options.openTo + 1;
    this.openDrawerManual(parent.top);
  },

  _openSwitchMenuAtParentHeight: function() {
    if(this._headerPageParent.top > this.options.openTo + 1) {
      this.openDrawerDefaultPartial();
    } else {
      this.openDrawerLarge();
    }
  },

  _returnFromSwitchMenu: function() {
    var currentDrawerTop = this.drawerTop();
    if(this.viewStyleBottomSlide && this._headerPageParent) {
      this._returnFromMobileAccount();
      return;
    }
    var marker = this._switchMenuReturnMarker && this.zMap.cachedMarkersById[this._switchMenuReturnMarker];
    this._navigatingBack = true;
    if(marker) {
      this.zMap._createMarkerPopup(marker);
      if(this.viewStyleBottomSlide) this.openDrawerSmall();
    }
    else {
      this.resetContent();
      if(this.viewStyleBottomSlide) this.openDrawerManual(currentDrawerTop);
    }
  },

  closePage: function() {
    if(/^m\d+$/.test(this._contentType || '')) {
      this._dismissPOIOnClose = true;
      this._preserveContentOnClose = false;
      this._headerPageParent = this._mobileAccountParent = null;
      this._desktopAccountReturnMarker = this._switchMenuReturnMarker = null;
      this.zMap._closeNewMarker();
      var url = new URL(window.location.href);
      url.searchParams.delete('marker');
      var state = Object.assign({}, window.history.state);
      delete state.drawerReloadParent;
      window.history.replaceState(state, '', url.href);
    }
    if(!this.viewStyleBottomSlide) {
      this.reset();
      return;
    }
    if(!/^m\d+$/.test(this._contentType || '')) zMap._closeNewMarker();
    this.headerBar.searchArea.markerSearchField.clear();
    this.closeDrawer();
  },

  // Open to the current page's partial stop, or fully if it has none.
  openDrawerDefaultPartial: function() {
    this._contents.scrollTop = 0;
    this._refreshMobileDrawerDetents();
    if(!this._partialDrawerAvailable) {
      this.openDrawerLarge();
      return;
    }
    this._partialDrawerMode = true;
    this.openDrawerManual(this.options.softOpenTo);
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
    this._refreshMobileDrawerDetents();
    var animationId = ++this._drawerAnimationId;
    this._animate(menu, from, to, isOpen, animationId);
    this._triggerHandler("after_animateStart", menu, from, to, isOpen);
  },

  _animate: function(menu, from, to, isOpen, animationId) {
    if(animationId !== this._drawerAnimationId) return;
    var opensFullyFromPartial = (
      this.viewStyleBottomSlide &&
      isOpen &&
      this._partialDrawerMode &&
      to <= this.options.openTo
    );
    // console.log(`_animate(${menu}, ${from}, ${to}, ${isOpen})`);
    this._drawerClosing = !isOpen;
    this._closingContentProgress = (!isOpen && this.viewStyleBottomSlide && this._contents)
      ? Number.parseFloat(window.getComputedStyle(this._contents).opacity)
      : null;
    if(isOpen) this._preserveContentOnClose = false;
    var resizingPartialDrawer = this.viewStyleBottomSlide &&
      isOpen &&
      this._partialDrawerMode &&
      to > this.options.openTo;
    // A drawer stretched past fully open (see _drawerMove) springs back down.
    var springingBack = this.viewStyleBottomSlide && isOpen && from < this.options.openTo;
    if ((isOpen && from < to && !resizingPartialDrawer && !springingBack) || (!isOpen && from > to)) {
      from = to;
    }

    if(this._drawerAnimationTimeout) {
      window.clearTimeout(this._drawerAnimationTimeout);
      this._drawerAnimationTimeout = null;
    }

    // Freeze the rendered geometry before changing detents. The partial-mode
    // flag already describes the destination; applying it to the starting
    // position would instantly shrink a full sheet into a floating card.
    var renderedStyle = window.getComputedStyle(menu);
    var renderedGeometry = {};
    ['top', 'height', 'left', 'width', 'borderRadius'].forEach(function(property) {
      renderedGeometry[property] = renderedStyle[property];
    });
    if(this._drawerGeometryAnimation) {
      this._drawerGeometryAnimation.cancel();
      this._drawerGeometryAnimation = null;
    }
    menu.style.transition = 'none';
    if(this.viewStyleBottomSlide && this._contents) {
      this._contents.style.transition = 'none';
    }
    if(this.viewStyleBottomSlide && this._drawerHeaderSeparator) {
      this._drawerHeaderSeparator.style.transition = 'none';
    }
    if(this.viewStyleBottomSlide && isOpen && from !== to) {
      Object.keys(renderedGeometry).forEach(function(property) {
        menu.style[property] = renderedGeometry[property];
      });
    } else {
      menu.style.top = from + "px";
      if(this.viewStyleBottomSlide) this._applyMobileDrawerViewport(from);
    }

    if(from === to) {
      if(opensFullyFromPartial) this._partialDrawerMode = false;
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
      var explicitGeometry = this.viewStyleBottomSlide;
      menu.style.transition = explicitGeometry ? 'none' :
        'top ' + duration + 'ms ' + timing + ', ' +
        'height ' + duration + 'ms ' + timing + ', ' +
        'left ' + duration + 'ms ' + timing + ', ' +
        'width ' + duration + 'ms ' + timing + ', ' +
        'border-radius ' + duration + 'ms ' + timing;
      if(this.viewStyleBottomSlide && this._contents) {
        this._contents.style.transition =
          'opacity ' + Math.min(duration, 240) + 'ms ease-out, ' +
          'transform ' + duration + 'ms ' + timing + ', ' +
          'width ' + duration + 'ms ' + timing;
      }
      if(this.viewStyleBottomSlide && this._drawerHeaderSeparator) {
        this._drawerHeaderSeparator.style.transition =
          'opacity ' + Math.min(duration, 200) + 'ms ease-out';
      }
      if(opensFullyFromPartial) this._partialDrawerMode = false;
      menu.style.top = to + 'px';
      if(this.viewStyleBottomSlide) {
        this._applyMobileDrawerViewport(to);
        // Grow the contents up front when the drawer rises. When it lowers
        // (to partial or closed), keep their current height so they ride down
        // with the drawer instead of shrinking on the first frame; they're
        // resized once the animation ends.
        if(isOpen && to <= from) this.updateContentsHeight(to);
      }
      var finish = function() {
        if(animationId !== this._drawerAnimationId) return;
        menu.style.transition = '';
        if(this._contents) this._contents.style.transition = '';
        if(this._drawerHeaderSeparator) {
          this._drawerHeaderSeparator.style.transition = '';
        }
        this._drawerAnimationTimeout = null;
        if(!isOpen) this._partialDrawerMode = false;
        if(isOpen) this.updateContentsHeight();
        else this._finishDrawerClose();
      }.bind(this);
      if(explicitGeometry) {
        // Use the same geometry updates as dragging. This avoids Safari
        // interpolating top/height/corners on a separately composited sheet.
        var cancelled = false;
        var geometryAnimation = { cancel: function() { cancelled = true; } };
        this._drawerGeometryAnimation = geometryAnimation;
        this._contents.style.transition = 'none';
        if(this._drawerHeaderSeparator) this._drawerHeaderSeparator.style.transition = 'none';
        var startTop = Number.parseFloat(renderedGeometry.top);
        var started = performance.now();
        var debugResize = new URLSearchParams(window.location.search).has('drawerDebug');
        var frameCount = 0, lastFrame = started, maxFrameGap = 0;
        var debugBadge;
        var geometrySamples = [];
        var sampleGeometry = function(phase, expectedTop) {
          if(!debugResize) return;
          var rect = menu.getBoundingClientRect();
          var contentsRect = this._contents.getBoundingClientRect();
          geometrySamples.push({
            phase: phase, ms: Math.round(performance.now() - started),
            top: rect.top, height: rect.height, bottom: rect.bottom,
            cssTop: Number.parseFloat(window.getComputedStyle(menu).top),
            expectedTop: expectedTop, contentsHeight: contentsRect.height,
            viewportBottom: this._viewportBottom()
          });
        }.bind(this);
        if(debugResize) {
          debugBadge = document.getElementById('drawer-animation-debug');
          if(!debugBadge) {
            debugBadge = document.createElement('div');
            debugBadge.id = 'drawer-animation-debug';
            debugBadge.style.cssText = 'position:fixed;top:130px;left:12px;z-index:100000;background:#000;color:#fff;padding:8px;font:12px monospace;pointer-events:none;white-space:pre';
            document.body.appendChild(debugBadge);
          }
          debugBadge.textContent = 'Drawer diagnostic v2: measuring…';
          geometrySamples.push({ phase: 'before', ms: 0,
            height: Number.parseFloat(renderedGeometry.height) });
        }
        var tick = function(now) {
          if(cancelled || animationId !== this._drawerAnimationId) return;
          if(now > lastFrame) {
            frameCount++;
            maxFrameGap = Math.max(maxFrameGap, now - lastFrame);
            lastFrame = now;
          }
          var progress = Math.min(1, Math.max(0, (now - started) / duration));
          // Invert the x component of cubic-bezier(.32,.72,0,1).
          var low = 0, high = 1, t = progress;
          for(var i = 0; i < 14; i++) {
            t = (low + high) / 2;
            var x = 3 * (1 - t) * (1 - t) * t * .32 + t * t * t;
            if(x < progress) low = t; else high = t;
          }
          var eased = progress === 0 ? 0 : (progress === 1 ? 1 :
            3 * (1 - t) * (1 - t) * t * .72 + 3 * (1 - t) * t * t + t * t * t);
          var top = startTop + (to - startTop) * eased;
          menu.style.top = top + 'px';
          this._applyMobileDrawerViewport(top);
          this.updateContentsHeight(top);
          // Commit this frame's drawer geometry before yielding. The on-device
          // measurement test was smooth with this layout read; keep it when
          // diagnostics are disabled as well.
          menu.getBoundingClientRect();
          sampleGeometry('frame', top);
          if(progress < 1) window.requestAnimationFrame(tick);
          else {
            this._drawerGeometryAnimation = null;
            sampleGeometry('before cleanup', to);
            finish();
            if(debugBadge) {
              sampleGeometry('after cleanup', to);
              window.setTimeout(function() {
                if(animationId !== this._drawerAnimationId) return;
                sampleGeometry('settled', to);
                window.zmDrawerGeometrySamples = geometrySamples;
                var frames = geometrySamples.filter(function(s) { return s.phase === 'frame'; });
                var heights = frames.filter(function(s, i) { return i % 4 === 0 || i === frames.length - 1; })
                  .map(function(s) { return Math.round(s.height); });
                var pre = geometrySamples.find(function(s) { return s.phase === 'before cleanup'; });
                var post = geometrySamples.find(function(s) { return s.phase === 'after cleanup'; });
                var settled = geometrySamples[geometrySamples.length - 1];
                var maxStep = 0, maxError = 0;
                frames.forEach(function(s, i) {
                  if(i) maxStep = Math.max(maxStep, Math.abs(s.height - frames[i - 1].height));
                  maxError = Math.max(maxError, Math.abs(s.cssTop - s.expectedTop));
                });
                debugBadge.textContent = 'Drawer diagnostic v2\n' +
                  frameCount + ' frames / ' + Math.round(now - started) + ' ms\n' +
                  'Longest frame: ' + Math.round(maxFrameGap) + ' ms\n' +
                  'Height: ' + heights.join(' → ') + '\n' +
                  'Largest height step: ' + Math.round(maxStep) + ' px\n' +
                  'Position error: ' + Math.round(maxError) + ' px\n' +
                  'Cleanup height: ' + Math.round(pre.height) + ' → ' + Math.round(post.height) + '\n' +
                  'Settled height: ' + Math.round(settled.height) + '\n' +
                  'Bottom drift: ' + Math.round(settled.bottom - pre.bottom) + ' px';
              }.bind(this), 250);
            }
          }
        }.bind(this);
        tick(started);
      } else {
        this._drawerAnimationTimeout = window.setTimeout(finish, duration + 20);
      }
    }.bind(this));
  },

  _finishDrawerClose: function() {
    this._drawerClosing = false;
    this._closingContentProgress = null;
    // Hide and resize the contents now the drawer has closed over them.
    if(this.viewStyleBottomSlide) {
      this._updateMobileDrawerPresentation(this.drawerTop());
      this.updateContentsHeight();
    }
    if(!this._preserveContentOnClose) {
      this._gamesButton.clear();
      this._mapsButton.clear();
      this.resetContent();
    }
    this._dismissPOIOnClose = false;
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
    // Inline top is the destination during a CSS transition, not the visible
    // position. New animations and drags must start at the rendered position.
    var top = Number.parseFloat(window.getComputedStyle(this._container).top);
    return Number.isFinite(top) ? top : (Number.parseFloat(this._container.style.top) || 0);
  },

  openDrawerSmall: function(forcePartial, immediate) {
    // console.log(`openDrawerSmall`);
    var currentCssTop = Number.parseFloat(this._container.style.top) || 0;
    var containerTop = this._container.getBoundingClientRect().top;
    var baseScreenTop = Number.isFinite(this._mobileDrawerBaseTop)
      ? this._mobileDrawerBaseTop
      : containerTop - currentCssTop;
    this._updateMobileDrawerSoftOpenTo(baseScreenTop);
    if(!this._partialDrawerAvailable) {
      this.openDrawerLarge();
      return;
    }
    if(forcePartial || this._partialDrawerMode || this.drawerTop() >= this.options.softOpenTo) {
      this._partialDrawerMode = true;
      if(immediate) {
        this._drawerAnimationId++;
        if(this._drawerGeometryAnimation) {
          this._drawerGeometryAnimation.cancel();
          this._drawerGeometryAnimation = null;
        }
        if(this._drawerAnimationTimeout) {
          window.clearTimeout(this._drawerAnimationTimeout);
          this._drawerAnimationTimeout = null;
        }
        this._container.style.transition = 'none';
        this._contents.style.transition = 'none';
        this._drawerHeaderSeparator.style.transition = 'none';
        this._container.style.top = this.options.softOpenTo + 'px';
        this._open = true;
        this._drawerClosing = false;
        this._preserveContentOnClose = false;
        this._applyMobileDrawerViewport(this.options.softOpenTo);
        this.updateContentsHeight(this.options.softOpenTo);
        window.requestAnimationFrame(function() {
          this._container.style.transition = '';
          this._contents.style.transition = '';
          this._drawerHeaderSeparator.style.transition = '';
        }.bind(this));
      } else {
        this.openDrawerManual(this.options.softOpenTo);
      }
    }
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
    if(['accountPage', 'loginForm'].includes(this._contentType)) {
      var closedPageURL = new URL(window.location.href);
      closedPageURL.searchParams.delete('page');
      window.history.replaceState(window.history.state, '', closedPageURL.href);
    }
    this._gamesButton.clear();
    this._mapsButton.clear();
    $('.account-button').parent().removeClass('highlighted');
    // console.log(`closeDrawer`);
    var hasSelectedPOI = !this._dismissPOIOnClose && (/^m\d+$/.test(this._contentType || '') ||
      (this._headerPageParent && /^m\d+$/.test(this._headerPageParent.type || '')));
    this._preserveContentOnClose = !!preserveContent || !!hasSelectedPOI || (
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
