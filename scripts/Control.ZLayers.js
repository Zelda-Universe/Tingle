L.Control.ZLayers = L.Control.Layers.extend({
	options: {
		collapsed: true,
		position: 'topleft',
		autoZIndex: false,
      headerHeight: 80,
	},
   _category: '',
   contentType: 'category', // category, marker
   
	initialize: function (baseLayers, categoryTree, options) {
		L.Util.setOptions(this, options);
      
      this.options.width = 360;
      this.options.iconQty = 4;
      this.options.iconSize = 80;
      this.options.scrollbarWidth = 18; // IE / FF
      this.options.iconSpace = Math.floor((this.options.width - (this.options.iconQty * this.options.iconSize)) / (this.options.iconQty + 1)
                                                              - (this.options.scrollbarWidth / (this.options.iconQty+1)));
      this._category = this._buildCategoryMenu(categoryTree);

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
/*             .on(link, 'click', L.DomEvent.stopPropagation)
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
      var headerDiv = L.DomUtil.create('div', 'row vertical-divider row-header', form1);

      var headerDivLeft = L.DomUtil.create('div', 'col-xs-2', headerDiv);
      var barsButton = L.DomUtil.create('a', 'button icon-bars', headerDivLeft);
      barsButton.innerHTML = '';
      barsButton.href="#close";
      L.DomEvent
         .on(barsButton, 'click', L.DomEvent.stopPropagation)
         .on(barsButton, 'click', function(e) {
             // Open
             this._collapse();
             _this._closeNewMarker();
             e.preventDefault();
         }, this);

      var headerDivMid = L.DomUtil.create('div', 'col-xs-8', headerDiv);
      headerDivMid.innerHTML = '<div class="form-group"><div class="icon-addon addon-sm"><input type="text" placeholder="Ex: Oman Au Shrine" class="form-control marker-search" id="marker-search"><label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="email"></label></div></div>';

      
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
      this._contents.innerHTML = this._category;
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
      //this._contents.innerHTML = this._contents.innerHTML + content;
      var content = L.DomUtil.create('div', '', this._contents);
      content.innerHTML = vContent;
      content.id = 'menu-cat-content-inner';
      this._expand();
      this.contentType = vType;
      $("#menu-cat-content").animate({ scrollTop: 0 }, "fast");
   },
   
   resetContent() {
      //@TODO: New Marker should be from the map!
      if (newMarker != null) {
         map.removeLayer(newMarker);
      }

      this._contents.innerHTML = this._category;
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
      this._contents.innerHTML = this._category;
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

   _buildCategoryMenu(categoryTree) {
      var contents = "";
      contents += '<ul class="category-selection-ul">';
      //@TODO: improve!!!!!!
      contents += '<li style="margin-left: ' + this.options.iconSpace + 'px !important; width: ' + this.options.iconSize + 'px !important"><a id="catMenuMobile-1" class="leaflet-bottommenu-a" href="#" onclick="_this._toogleCompleted();event.preventDefault();"><div class="circle" style="background-color: purple; border-color: purple"><span id="catCheckMark" class="icon-checkmark"' + (mapOptions.showCompleted?' style="color: gold; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;"':' style="color: white; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;"')+ '></span></div><p id="lblComplete">' + (mapOptions.showCompleted?'Hide Completed':'Show Completed') + '</p></a></li>';
      for (var i = 0; i < categoryTree.length; i++) {
         contents += '<li style="margin-left: ' + this.options.iconSpace + 'px !important; width: ' + this.options.iconSize + 'px !important"><a id="catMenuMobile' + categoryTree[i].id + '" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(' + categoryTree[i].id +  ');mapControl._category = document.getElementById(\'menu-cat-content\').innerHTML; event.preventDefault();"><div class="circle" style="background-color: ' + categoryTree[i].color + '; border-color: ' + categoryTree[i].color + '"><span class="icon-' + categoryTree[i].img + '"></span></div><p>' + categoryTree[i].name + '</p></a></li>';
         if (categoryTree[i].children.length > 0) {
            for (var j = 0; j < categoryTree[i].children.length; j++) {
               contents += '<li style="margin-left: ' + this.options.iconSpace + 'px !important; width: ' + this.options.iconSize + 'px !important"><a id="catMenuMobile' + categoryTree[i].children[j].id + '" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(' + categoryTree[i].children[j].id +  ');mapControl._category = document.getElementById(\'menu-cat-content\').innerHTML; event.preventDefault();"><div class="circle" style="background-color: ' + categoryTree[i].color + '; border-color: ' + categoryTree[i].color + '"><span class="icon-' + categoryTree[i].children[j].img + '"></span></div><p>' + categoryTree[i].children[j].name + '</p></a></li>';
            }
         }
      }
      contents += '</ul>';
      return contents;
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