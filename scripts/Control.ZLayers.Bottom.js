L.Control.ZLayersBottom = L.Control.Layers.extend({
	options: {
		collapsed: true,
		position: 'topleft',
		autoZIndex: false,
      delay: 0,
      openTo: 78,
      softOpenBottom: 250,
      softOpenTo: 0, // REVERSE
      headerHeight: 80,
	},
   _category: '',
   _open: false,
   contentType: 'category', // category, marker
   
	initialize: function (baseLayers, categoryTree, options) {
		L.Util.setOptions(this, options);
      
      this.options.width = window.innerWidth;
      this.options.height = window.innerHeight;
      this.options.iconQty = 4;
      this.options.iconSize = 80;
      if (L.Browser.webkit ) {
         this.options.scrollbarWidth = 0; // Chrome / Safari
      } else {
         this.options.scrollbarWidth = 18; // IE / FF
      }
      
      this.options.iconSpace = Math.floor((this.options.width - (this.options.iconQty * this.options.iconSize)) / (this.options.iconQty + 1)
                                                              - (this.options.scrollbarWidth / (this.options.iconQty+1)));
      this._category = this._buildCategoryMenu(categoryTree);

      this._startPosition = (parseInt(this.options.height, 10)) - this.options.headerHeight;
      this._isLeftPosition = this.options.position == 'topleft' ||
      this.options.position == 'bottomleft' ? true : false;


      this.currentMap;
      this.currentSubMap;
      
	},
	
	_initLayout: function () {
		var className = 'leaflet-control-layers';
      var container = this._container = L.DomUtil.create('div', className);

      container.style.margin = 0;
      container.style.border = 0;
      container.style.top = this._startPosition + 'px';

      this.options.softOpenTo = this.options.height - this.options.softOpenBottom;

		var form1 = this._form = L.DomUtil.create('form', className + '-list');
		var form2 = this._form2 = L.DomUtil.create('form', className + '-list');
      
      
      var link = this._layersLink = L.DomUtil.create('a', className + '-toggle', container);
      link.href = '#';
      link.title = 'Layers';

//      L.DomEvent
//          .on(container, 'click', L.DomEvent.stopPropagation)
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
      
      this._separator = L.DomUtil.create('div', className + '-separator', form1);
      
      this._contents = L.DomUtil.create('div', 'main-content bottommenu');
      L.DomEvent.disableClickPropagation(this._contents);
      L.DomEvent.on(this._contents, 'mousewheel', L.DomEvent.stopPropagation);
      this._contents.id = 'menu-cat-content';
      this._contents.innerHTML = this._category;
      this._contents.style.clear = 'both';
      this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
      this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';

   	container.appendChild(form1);
      container.appendChild(this._contents);
   },	

    _animate: function(menu, from, to, isOpen) {
      //console.log(from + ' ' + to + ' ' + isOpen);

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
    }
    ,
   
   setContent: function(vContent, vType) {
      if (vType != 'newMarker' && newMarker != null) {
         map.removeLayer(newMarker);
      }
      if (vType == 'newMarker') {
//         this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
//         this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
         this._open = true;
         this._animate(this._container, parseInt(this._container.style.top.replace('px','')), this.options.openTo, true);
      }
      this._contents.innerHTML = '';

      var closeButton = L.DomUtil.create('a', 'button', this._contents);
      closeButton.innerHTML = '×';
      closeButton.href="#close";
      L.DomEvent
         .on(closeButton, 'click', L.DomEvent.stopPropagation)
         .on(closeButton, 'click', function(e) {
             // Open
             //this.resetContent();
             e.preventDefault();
             this._animate(this._container, parseInt(this._container.style.top.replace('px','')), this._startPosition, false);
         }, this)
      //this._contents.innerHTML = this._contents.innerHTML + content;
      var content = L.DomUtil.create('div', '', this._contents);
      content.innerHTML = vContent;
      content.id = 'menu-cat-content-inner';
      //this._expand();

      if (parseInt(this._container.style.top.replace('px','')) >=  this.options.softOpenTo) {

//         this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
//         this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';

         this._animate(this._container, parseInt(this._container.style.top.replace('px','')), this.options.softOpenTo, true);
         this._open = true;
      }
      

      this.contentType = vType;
      $("#menu-cat-content").animate({ scrollTop: 0 }, "fast");
   },
   
   resetContent() {
      //@TODO: New Marker should be from the map!
      if (newMarker != null) {
         map.removeLayer(newMarker);
      }


      this._contents.style.maxHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';
      this._contents.style.minHeight = (window.innerHeight-this.options.openTo - this.options.headerHeight) + 'px';

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
      return true;
   },

   closeDrawer: function() {
      this._animate(this._container, parseInt(this._container.style.top.replace('px','')), this._startPosition, false);
   }
});

L.control.zlayersbottom = function (baseLayers, overlays, options) {
	return new L.Control.ZLayersBottom(baseLayers, overlays, options);
};