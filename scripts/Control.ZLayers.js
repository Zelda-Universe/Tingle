L.Control.ZLayers = L.Control.Layers.extend({
	options: {
		collapsed: true,
		position: 'topleft',
		autoZIndex: false,
      headerHeight: 80,
	},
	 _categoryMenu: null,
   _contentType: 'category', // category, marker, search

	initialize: function (baseLayers, categoryTree, options) {
		L.Util.setOptions(this, options);

      this.options.width = 360;
      this.options.scrollbarWidth = 18; // IE / FF

	 		this._categoryMenu = new CategoryMenu({
	 			showCompleted: mapOptions.showCompleted,
	 			categoryTree: categoryTree,
				onCategoryToggle: function(toggledOn, category) {
					zMap.updateCategoryVisibility2(category, toggledOn);
				}, // TODO: Have a handler pass in the zMap's method from even higher above, for this function and others?!
				onCompletedToggle: function(showCompleted) {
					zMap.toggleCompleted(showCompleted);
				} // Where should the cookie code come from.... some config object with an abstracted persistence layer?
	 		});

		$(document).on('keydown', function(e) {
			if(e.key == "Escape") {
				if(this._contentType != 'category') {
					this.resetContent();
				} else {
	        this.toggle();
				}
      }
		}.bind(this));
	},

	_initLayout: function () {
		var className = 'leaflet-control-layers';
      var container = this._container = L.DomUtil.create('div', className);

      if (!this.options.showMapControl) {
         container.style.display = 'none';
         container.style.marginTop = '0px';
      }

		if (!L.Browser.touch) {
			L.DomEvent.disableClickPropagation(container);
		} else {
			L.DomEvent.on(container, 'click', L.DomEvent.stopPropagation);
		}

		var form1 = this._form = L.DomUtil.create('form', className + '-list');
		var form2 = this._form2 = L.DomUtil.create('form', className + '-list');

		// Why did we need the expand click iteraction at least?
		// This was getting in the way of having a nice default focus
		// into the search area.
      // L.DomEvent
      //     .on(container, 'click', this._expand, this)
      //     //.on(container, 'mouseout', this._collapse, this)
      // ;

      var link = this._layersLink = L.DomUtil.create('a', className + '-toggle', container);
      link.href = '#';
      link.title = 'Layers';

      L.DomEvent
          .on(container, 'click', L.DomEvent.stopPropagation)
          //.on(container, 'click', L.DomEvent.preventDefault)
          .on(container, 'dblclick', L.DomEvent.stopPropagation)
          .on(container, 'dblclick', L.DomEvent.preventDefault);

      if (L.Browser.touch) {
         L.DomEvent
            /*.on(link, 'click', L.DomEvent.stopPropagation)
             .on(link, 'click', L.DomEvent.preventDefault)*/
             .on(link, 'click', this._expand, this);
      }
      else {
         L.DomEvent.on(link, 'focus', this._expand, this);
      }

      form1.style.width = '360px';

			this.headerBar = new HeaderBar({
				parent: form1,
				mapControl: this,
				shrinkButton: true
			});

      this._separator = L.DomUtil.create('div', className + '-separator', form1);

			var logo = new Logo({
				parent: form1,
				headerHeight: this.options.headerHeight
			});

      this._separator = L.DomUtil.create('div', className + '-separator', form1);

      this._contents = L.DomUtil.create('div', 'main-content ' + className + '-list');

      L.DomEvent.disableClickPropagation(this._contents);
      L.DomEvent.on(this._contents, 'mousewheel', L.DomEvent.stopPropagation);
      this._contents.id = 'menu-cat-content';
			$(this._contents).empty();
			$(this._contents).append(this._categoryMenu.domNode);
      this._contents.style.clear = 'both';
      this._contents.style.maxHeight = (window.innerHeight>250?window.innerHeight  - 250:250) + 'px';
      this._contents.style.width = '360px';

		container.appendChild(form1);
      container.appendChild(this._contents);

      // TODO keyboard accessibility
      if (this.options.collapsed) {
         //this._map.on('movestart', this._collapse, this);
         //this._map.on('click', this._collapse, this);
      } else {
         this._expand();
      }
   },

	 setDefaultFocus: function() {
		 this.headerBar.focus(); // Had to disable since the dialog wants to expand on every click, and having this would steal input from any forms and place it in the search box.  It's annoying so disabling this for now
	 },

	beforeSetContent: function(vContent, vType) {},

   setContent: function(vContent, vType) {
		 	this.beforeSetContent(vContent, vType);

      this._contents.innerHTML = '';

      var closeButton = L.DomUtil.create('a', 'button icon-close2', this._contents);
      closeButton.innerHTML = '×';
      closeButton.href="#close";
      L.DomEvent
         .on(closeButton, 'click', L.DomEvent.stopPropagation)
         .on(closeButton, 'click', function(e) {
             // Open
             this.resetContent();
             e.preventDefault();
         }, this)
      var content = L.DomUtil.create('div', '', this._contents);
			$(content).append(vContent);
      content.className = 'menu-cat-content-inner';

      this._contentType = vType;
      $("#menu-cat-content").animate({ scrollTop: 0 }, "fast");

			this.afterSetContent(vContent, vType);
   },

	 afterSetContent: function(vContent, vType) {
		this._expand();
	 },

	 // Sets it to the default category selector scene.
   resetContent: function() {
      //@TODO: New Marker should be from the map!
      if (newMarker != null) {
         map.removeLayer(newMarker);
      }

			$(this._contents).empty();
			$(this._contents).append(this._categoryMenu.domNode);
      this._contentType = 'category';
      $("#menu-cat-content").animate({ scrollTop: 0 }, "fast");
   },

	onRemove: function (map) {

	},

	_removeLayers: function() {
	},


	_addLayer: function (layer, name, overlay, instanceLayer) {
	},

	_updateLayerControl: function(obj) {
	},


	_update: function () {
	},

	_addItem: function (obj, vInputClick) {
	},

  isCollapsed: function () {
    return this.options.collapsed;
  },

   _collapse: function() {
		  $(this._contents).empty();
			$(this._contents).append(this._categoryMenu.domNode);
      this.options.collapsed = true;
      return this.collapse();
   },

   _expand: function() {
      if (this._contents != undefined) {
         this._contents.style.maxHeight = (window.innerHeight>250?window.innerHeight  - 250:250) + 'px';
      }

      this.options.collapsed = false;
      this.expand();

			this.setDefaultFocus();
   },

	 toggle: function() {
		 (this.isCollapsed()) ? this._expand() : this._collapse();
	 },

   getContentType() {
      return this._contentType;
   },

   _checkDisabledLayers: function () {

   },


   getCurrentMap: function() {
      return {mapId: this.currentMap, subMapId: this.currentSubMap}
   },
   setCurrentMap: function(vMap, vSubMap) {
      this.currentMap = vMap;
      this.currentSubMap = vSubMap;
   },
	// Needs improvements
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

            this.currentMap = mapId;
            this.currentSubMap = subMapId;
				return;
			}
		}

	},

   isMobile: function() {
      return false;
   }
});

L.control.zlayers = function (baseLayers, overlays, options) {
	return new L.Control.ZLayers(baseLayers, overlays, options);
};
