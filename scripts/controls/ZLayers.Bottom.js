L.Control.ZLayersBottom = L.Control.ZLayers.extend({
  options: {
    position: 'topleft',
    delay: 0,
    openTo: 78,
    softOpenBottom: 250,
    softOpenTo: 0 // REVERSE
  },
  _open: false,

  initialize: function(baseLayers, categoryTree, options) {
    L.Control.ZLayers.prototype.initialize.call(
      this,
      baseLayers,
      categoryTree,
      L.Util.setOptions(this, options)
    );

    this.options.width = window.innerWidth;
    this.options.height = window.innerHeight;
    if (L.Browser.webkit) {
      this.options.scrollbarWidth = 0; // Chrome / Safari
    } else {
      this.options.scrollbarWidth = 18; // IE / FF
    }

    this._startPosition = (parseInt(this.options.height)) - this.options.headerHeight - 73;
    this._isLeftPosition = this.options.position.endsWith("left");
  },

  beforeSetContent: function(vContent, vType) {
    if (vType != 'newMarker') {
      if (newMarker != null) {
        map.removeLayer(newMarker);
      }
    } else {
      // this.updateContentsHeight();
      this.openDrawerLarge();
    }
  },

  afterSetContent: function(vContent, vType) {
    //this._expand();
    if(/^m\d+$/.test(vType)) {
      this.openDrawerSmall();
    } else {
      // this.updateContentsHeight();

      this.openDrawerLarge();
    }
  },

  afterResetContent: function() {
    this.updateContentsHeight();
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

	_initLayout: function () {
    var container = this._container;

      container.style.margin = 0;
      container.style.border = 0;
      container.style.top = this._startPosition + 'px';

      this.options.softOpenTo = this.options.height - this.options.softOpenBottom;

		var form1 = this._form = L.DomUtil.create('form', this.options.className + '-list');
		var form2 = this._form2 = L.DomUtil.create('form', this.options.className + '-list');


      var link = this._layersLink = L.DomUtil.create('a', this.options.className + '-toggle', container);
      link.href = '#';
      link.title = 'Layers';

     // L.DomEvent
         // .on(container, 'click', L.DomEvent.stopPropagation)
          //.on(container, 'click', L.DomEvent.preventDefault)

      form1.style.width = this.options.width + 'px';

      var headerMenu = L.DomUtil.create('header', 'ex1', form1);
      headerMenu.style.height = (this.options.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator
      var xDown = null;
      var yDown = null;
      L.DomEvent.disableClickPropagation(headerMenu);
      L.DomEvent
         .on(headerMenu, 'click', L.DomEvent.stopPropagation)
         .on(headerMenu, 'click', L.DomEvent.preventDefault)

         .on( headerMenu, 'touchstart', function( e) {
            xDown = e.touches[0].clientX;
            yDown = e.touches[0].clientY;
         }, this)
         .on( headerMenu, 'touchmove', function( e) {
            if ( ! xDown || ! yDown ) {
               return;
            }

            var xUp = e.touches[0].clientX;
            var yUp = e.touches[0].clientY;

            var xDiff = xDown - xUp;
            var yDiff = yDown - yUp;

            // ensures y movement is more significant
            if ( Math.abs( xDiff ) < Math.abs( yDiff ) ) {/*most significant*/
               if ( yDiff > 0 ) { // swipe up
                  //console.log('swipe up');
                  this.openDrawerLarge();
                  this.updateContentsHeight();

               } else { // swipe down
                  //console.log('swipe down');
                  if(this._open) {
                     this.closeDrawer();
                     //TODO reset contents
                  }
               }
            }

            /* reset values */
            xDown = null;
            yDown = null;
         }, this);

      var logo = new Logo({ parent: headerMenu });

      L.DomUtil.create('div', 'grabber', headerMenu);

      var completedButton = new CategoryButtonCompleted({
        toggledOn: mapOptions.showCompleted,
        onToggle: function(showCompleted) {
	        zMap.toggleCompleted(showCompleted);
	      } // Where should the cookie code come from.... some config object with an abstracted persistence layer?,
      });
      // this.categoryButtonCompleted.domNode.on('toggle', opts.onCompletedToggle.bind(this.categoryButtonCompleted));
      $(headerMenu).append(completedButton.domNode);

      this._separator = L.DomUtil.create('div', this.options.className + '-separator', form1);

      this._contents = L.DomUtil.create('div', 'main-content bottommenu');
      L.DomEvent.disableClickPropagation(this._contents);
      L.DomEvent.on(this._contents, 'mousewheel', L.DomEvent.stopPropagation);
      this._contents.id = 'menu-cat-content';

      this._categoryMenu = new CategoryMenu({
        defaultToggledState: false,
        categoryTree: categoryTree,
        onCategoryToggle: function(toggledOn, category) {
          zMap.updateCategoryVisibility2(category, toggledOn);
        } // TODO: Have a handler pass in the zMap's method from even higher above, for this function and others?!
      });
      this._resetContent(false);
      this._contents.style.clear = 'both';
    this.updateContentsHeight();

   	container.appendChild(form1);
      container.appendChild(this._contents);

    // Doesn't make sense to read, but changes the logo
    // Remove forcing true later to not need this called in all cases,
    // and make expand match openDrawer expectations.
    if (true || !this.options.collapsed) this._expand();
   },

    _animate: function(menu, from, to, isOpen) {
      // console.log(from + ' ' + to + ' ' + isOpen);

        if ((isOpen && from < to) || (!isOpen && from > to)) {
            from = to;
        }

        if (this._isLeftPosition) {
            menu.style.top = from + "px";
        }
        else {
            menu.style.top = from + "px";
        }

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

        setTimeout(function(zlayersbottom) {
            var value = isOpen ? from - 10 : from + 10;
            if (isOpen && from < to) {
               value = to;
            }
            zlayersbottom._animate(zlayersbottom._container, value, to, isOpen);
        }, this.options.delay, this);
    },

  after_expand: function() {
    // this.setDefaultFocus();
  },

  toggle: function() {
    (this._open) ? this.closeDrawer() : this.openDrawerLarge();
  },

  _setDrawerState: function(newState, newPosition) {
    if(newState === undefined) newState = !this._open;

    this._animate(
      this._container,
      this.drawerTop(),
      newPosition,
      newState
    );

    // console.log("DEBUG: this._open: " + this._open);
    this._open = newState;
    // console.log("DEBUG: this._open changed to: " + this._open);
  },

   isMobile: function() {
      return true;
   },

  drawerTop: function() {
    return parseInt(this._container.style.top.replace('px',''));
  },

  openDrawerSmall: function() {
    if(this.drawerTop() >= this.options.softOpenTo)
      this.openDrawerManual(this.options.softOpenTo);
  },

  openDrawerLarge: function() {
    if(this.drawerTop() >= this.options.openTo)
      this.openDrawerManual(this.options.openTo);
  },

  openDrawerManual: function(newPosition) {
    this._setDrawerState(true, newPosition);
  },

  closeDrawer: function() {
    if(this._open)
      this._setDrawerState(false, this._startPosition);
  }
});

L.Control.ZLayersBottom.prototype._className = "L.Control.ZLayersBottom";

L.control.zlayersbottom = function (baseLayers, overlays, options) {
	return new L.Control.ZLayersBottom(baseLayers, overlays, options);
};
