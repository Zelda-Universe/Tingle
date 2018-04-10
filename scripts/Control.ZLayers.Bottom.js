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

    this._startPosition = (parseInt(this.options.height, 10)) - this.options.headerHeight;
    console.log("start position: " + this._startPosition);
    this._isLeftPosition = this.options.position.endsWith("left");
    console.log("is left position: " + this._isLeftPosition);
    console.log("options after after: " + JSON.stringify(options));
  },

  beforeSetContent: function(vContent, vType) {
    if (vType != 'newMarker' && newMarker != null) {
      map.removeLayer(newMarker);
     }
    if (vType == 'newMarker') {
      // this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
      // this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
      this._open = true;
      this._animate(this._container, parseInt(this._container.style.top.replace('px','')), this.options.openTo, true);
    }
  },

  afterSetContent: function(vContent, vType) {
    //this._expand();

    var containerTop = parseInt(this._container.style.top.replace('px',''));
    if (containerTop >= this.options.softOpenTo) {
      // this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
      // this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';

      this._animate(
        this._container,
        containerTop,
        this.options.softOpenTo,
        true
      );

      this._open = true;
    }
  },

  afterResetContent: function() {
    this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
    this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
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

      this._expand();


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
                  //console.log( this._open);
                  this._animate(this._container, parseInt(this._container.style.top.replace('px','')), this.options.openTo, true);
                  this._open = true;
                  this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
                  this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';

               } else { // swipe down
                  //console.log('swipe down');
                  //console.log( this._open);
                  if(this._open) {
                     this._animate(this._container, parseInt(this._container.style.top.replace('px','')), this._startPosition, false);
                     this._open = false;
                     //TODO reset contents
                  }
               }
            }

            /* reset values */
            xDown = null;
            yDown = null;
         }, this);


      var logoDiv = L.DomUtil.create('img', 'img-responsive center-block', headerMenu);
      logoDiv.src  = 'images/zmaps_white.png';
      logoDiv.style.height = (this.options.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator

      L.DomUtil.create('div', 'grabber', headerMenu);

      this._separator = L.DomUtil.create('div', this.options.className + '-separator', form1);

      this._contents = L.DomUtil.create('div', 'main-content bottommenu');
      L.DomEvent.disableClickPropagation(this._contents);
      L.DomEvent.on(this._contents, 'mousewheel', L.DomEvent.stopPropagation);
      this._contents.id = 'menu-cat-content';

      this._categoryMenu = new CategoryMenu({
        defaultToggledState: false,
         showCompleted: mapOptions.showCompleted,
         categoryTree: categoryTree,
        onCategoryToggle: function(toggledOn, category) {
          zMap.updateCategoryVisibility2(category, toggledOn);
        }, // TODO: Have a handler pass in the zMap's method from even higher above, for this function and others?!
        onCompletedToggle: function(showCompleted) {
          zMap.toggleCompleted(showCompleted);
        } // Where should the cookie code come from.... some config object with an abstracted persistence layer?
      });
      this.resetContent();
      this._contents.style.clear = 'both';
      this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
      this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';

   	container.appendChild(form1);
      container.appendChild(this._contents);
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
               this.resetContent();
            } else {
               this._contents.style.maxHeight = (window.innerHeight-from-this.options.headerHeight) + 'px';
               this._contents.style.minHeight = (window.innerHeight-from-this.options.headerHeight) + 'px';
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

   _expand: function() {
      if (this._contents != undefined) {
         this._contents.style.maxHeight = (window.innerHeight>250?window.innerHeight  - 250:250) + 'px';
      }

      this.options.collapsed = false;
      this.expand();

      // this.setDefaultFocus();
   },
   // TODO: Implement drawer sliding open and closed logic
   // here, possibly using animate and other mobile-specific
   // methods and attributes.
   toggle: function() {
     // (this.isCollapsed()) ? this._expand() : this._collapse();
   },

   isMobile: function() {
      return true;
   },

   closeDrawer: function() {
    this._animate(
      this._container,
      parseInt(this._container.style.top.replace('px','')),
      this._startPosition,
      false
    );
   }
});

L.Control.ZLayersBottom.prototype._className = "L.Control.ZLayersBottom";

L.control.zlayersbottom = function (baseLayers, overlays, options) {
	return new L.Control.ZLayersBottom(baseLayers, overlays, options);
};
