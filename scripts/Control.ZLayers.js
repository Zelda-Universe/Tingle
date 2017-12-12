L.Control.ZLayers = L.Control.Layers.extend({
	options: {
		collapsed: true,
		position: 'topleft',
		autoZIndex: false,
      headerHeight: 80,
	},
	 _categoryMenu: null,
   contentType: 'category', // category, marker

	initialize: function (baseLayers, categoryTree, options) {
		L.Util.setOptions(this, options);

      this.options.width = 360;
      this.options.scrollbarWidth = 18; // IE / FF

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

      this.currentMap;
      this.currentSubMap;

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


      L.DomEvent
          .on(container, 'click', this._expand, this)
          //.on(container, 'mouseout', this._collapse, this)
      ;

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

      // TODO keyboard accessibility
      if (this.options.collapsed) {
         //this._map.on('movestart', this._collapse, this);
         //this._map.on('click', this._collapse, this);
      } else {
         this._expand();
      }



      form1.style.width = '360px';
			/*
      var shrinkButton = L.DomUtil.create('a', 'button icon-shrink', form1);
      shrinkButton.innerHTML = '';
      shrinkButton.href="#close";
      L.DomEvent
         .on(shrinkButton, 'click', L.DomEvent.stopPropagation)
         .on(shrinkButton, 'click', function(e) {
             // Open
             this._collapse();
             _this._closeNewMarker();
             e.preventDefault();
         }, this)
				 */
      // Currently unused, but could be effective.
      // TODO: Would be more awesome if this worked if the ordering for fetching
      // potential user info came earlier since it is depended on by more
      // component code locations, rather than creating the form now and hiding
      // it later on, but hey
      var createLoginControl = !zMap.getUser();
      var largerSearchArea = !createLoginControl;

      var headerDiv = L.DomUtil.create('div', 'row vertical-divider row-header', form1);

      // var barsButton = L.DomUtil.create('a', 'button icon-bars', headerDivLeft);
      // barsButton.innerHTML = '';
      // barsButton.href="#close";
      // L.DomEvent
      //    .on(barsButton, 'click', L.DomEvent.stopPropagation)
      //    .on(barsButton, 'click', function(e) {
      //        // Open
      //        this._collapse();
      //        _this._closeNewMarker();
      //        e.preventDefault();
      //    }, this);

      if(createLoginControl) {
        var headerDivLeft = L.DomUtil.create('div', 'col-xs-2', headerDiv);
        var loginButton = L.DomUtil.create('a', 'button icon-fa-user login-button', headerDivLeft);
          loginButton.href="#login";
          L.DomEvent.on(loginButton, 'click', zMap._createLoginForm, zMap);
      }

      var headerDivMid = L.DomUtil.create(
        'div',
        ((largerSearchArea) ? 'col-xs-10': 'col-xs-8'),
        headerDiv
			);

			var markerSearchField = new MarkerSearchField({
				incrementalSearch: false,
				updateProgressTotalStepsAmount: 15
			});
			$(markerSearchField.domNode).appendTo(headerDivMid);

			var markerListView = new MarkerListView();

			var searchMarkerHandler = new SearchMarkerHandler({
				markerSearchField: markerSearchField,
				markerListView: markerListView,
				markers: zMap.getMarkers()
			});

      L.DomEvent.disableClickPropagation(headerDivMid);
      L.DomEvent.on(headerDivMid, 'click', L.DomEvent.stopPropagation);

      var headerDivRight = L.DomUtil.create('div', 'col-xs-2', headerDiv);
      var shrinkButton = L.DomUtil.create('a', 'button icon-shrink', headerDivRight);
      shrinkButton.innerHTML = '';
      shrinkButton.href="#close";
      L.DomEvent
         .on(shrinkButton, 'click', L.DomEvent.stopPropagation)
         .on(shrinkButton, 'click', function(e) {
             // Open
             this._collapse();
             _this._closeNewMarker();
             e.preventDefault();
         }, this);

      this._separator = L.DomUtil.create('div', className + '-separator', form1);

      var logoDiv = L.DomUtil.create('img', 'img-responsive center-block', form1);
      logoDiv.src  = 'images/zmaps_white.png';
      logoDiv.style.height = (this.options.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator
      logoDiv.style.textAlign = 'center';

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
   },

   setContent: function(vContent, vType) {
      this._contents.innerHTML = '';

      var closeButton = L.DomUtil.create('a', 'button icon-close', this._contents);
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
      content.innerHTML = vContent;
      content.className = 'menu-cat-content-inner';
      this._expand();
      this.contentType = vType;
      $("#menu-cat-content").animate({ scrollTop: 0 }, "fast");
   },

   resetContent() {
      //@TODO: New Marker should be from the map!
      if (newMarker != null) {
         map.removeLayer(newMarker);
      }

			$(this._contents).empty();
			$(this._contents).append(this._categoryMenu.domNode);
      this.contentType = 'category';
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
      return this.expand();
   },

   getContentType() {
      return this.contentType;
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
