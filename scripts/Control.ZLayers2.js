L.Control.ZLayers2 = L.Control.Layers.extend({
	options: {
		collapsed: true,
		position: 'topright',
		autoZIndex: false
	},

	initialize: function (baseLayers, overlays, options) {
		L.Util.setOptions(this, options);

		this._layers = {};
		this.baseLayers = baseLayers;
		this._lastZIndex = (options && options.zIndex ? options.zIndex : 0);
		
		this.bgZIndex = this._backgroundInitialZIndex = 100;
		this.itZIndex = this._instancesInitialZIndex = 200;
		this.fgZIndex = this._foregroundInitialZIndex = 300;
		
		this.frmCurrClicked = -1;
		this.frm2CurrClicked;
      
      this.currentMap;
      this.currentSubMap;
		
		for (var i in baseLayers) {
			if (baseLayers.hasOwnProperty(i)) {
				this._addLayer(baseLayers[i], i, false, false);
			}
		}
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
      
      if (this.options.collapsed) {
         L.DomEvent
             .on(container, 'mouseover', this._expand, this)
             .on(container, 'mouseout', this._collapse, this);

         var link = this._layersLink = L.DomUtil.create('a', className + '-toggle', container);
         link.href = '#';
         link.title = 'Layers';

         if (L.Browser.touch) {
            L.DomEvent
                .on(link, 'click', L.DomEvent.stopPropagation)
                .on(link, 'click', L.DomEvent.preventDefault)
                .on(link, 'click', this._expand, this);
         }
         else {
            L.DomEvent.on(link, 'focus', this._expand, this);
         }

         this._map.on('movestart', this._collapse, this);
         // TODO keyboard accessibility
      } else {
         this._expand();
      }

		this._baseLayersList = L.DomUtil.create('div', className + '-base', form1);
		this._separator = L.DomUtil.create('div', className + '-separator', form1);
		this._baseLayersInstanceList = L.DomUtil.create('div', className + '-base', form2);
		this._separator2 = L.DomUtil.create('div', className + '-separator', form2);
		this._overlaysList = L.DomUtil.create('div', className + '-overlays', form2);

		container.appendChild(form1);
		container.appendChild(form2);
	},	
	
	onRemove: function (map) {
		var i, input, obj,
		    inputs = this._form.getElementsByTagName('input'),
		    inputsLen = inputs.length,
		    baseLayer;

		for (i = 0; i < inputsLen; i++) {
			input = inputs[i];
			obj = this._layers[input.layerId];

//			if (input.checked && map.hasLayer(obj.layer)) {
				map.removeLayer(obj.layer);
//			}
		}
	},	
	
	_removeLayers: function() {/*
		var i, input, obj
		    inputs = this._form2.getElementsByTagName('input');
			
		for (i = 0; i < inputs.length; i++) {
			input = inputs[i];

			obj = this._layers[input.layerId];
			if (this._map.hasLayer(obj.layer)) {
				this._map.removeLayer(obj);
			}
//			this._layers[input.layerId] = null;
			delete this._layers[input.layerId];
		}		*/
	},
	
	
	_addLayer: function (layer, name, overlay, instanceLayer) {
		var zIndex = (!overlay && !instanceLayer ? this._lastZIndex++ : (instanceLayer || layer.type == undefined ? this.itZIndex++ : (layer.type == "B" ? this.bgZIndex++ : this.fgZIndex++)));
		
		var id = L.Util.stamp(layer);
		this._layers[id] = {
			layer: layer,
			name: name,
			overlay: overlay,
			instanceLayer: instanceLayer,
		};

		layer.setZIndex(zIndex);
//		for (var i in layer) {
//			alert(i);
//		};
//		if (this.options.autoZIndex && layer.setZIndex) {
//			this._lastZIndex++;
//			layer.setZIndex((!instanceLayer ? 0 : (overlay ? this.itZIndex : (layer.type == 'B' ? this.bgZIndex : this.fgZIndex))));
//		} else {
//		}
	},
	
	_updateLayerControl: function(obj) {
		if (!obj) {
			return;
		}
		this.bgZIndex = this._backgroundInitialZIndex;
		this.itZIndex = this._instancesInitialZIndex;
		this.fgZIndex = this._foregroundInitialZIndex;
		
		var checkedId = 0;
		for (j = 0; j < obj._overlayMap.length; j++) {
			var vLayer = obj._overlayMap[j];
			
			this._addLayer(vLayer, vLayer.title, false, true);
			
			if (vLayer.isDefault == 1) {
				checkedId = j;
				this._updateLayerControlCheckBoxs(vLayer);
			}
		}
		this._update2();
		if (this._form2.getElementsByTagName('input')[checkedId]) {
			this.frm2CurrClicked = checkedId;
			this._form2.getElementsByTagName('input')[checkedId].checked = true;
		}
	},
	
	_updateLayerControlCheckBoxs: function(obj) {
		if (!obj || !obj.layers) {
			return;
		}
		this.bgZIndex = this._backgroundInitialZIndex;
		this.fgZIndex = this._foregroundInitialZIndex;
		
		for (z = 0; z < obj.layers.length; z++) {
			this._addLayer(obj.layers[z], obj.layers[z].title, true, false);
		}
	},
	
	_update3: function() {		
		this._overlaysList.innerHTML = '';

		var overlaysPresent = false;

		for (var i in this._layers) {
			if (this._layers.hasOwnProperty(i)) {
				var obj = this._layers[i];
				if (obj.overlay) {
					this._addItem(obj, obj.overlay);
				}
				overlaysPresent = overlaysPresent || obj.overlay;
			}
		}
      this._separator2.style.display = (overlaysPresent ? '' : 'none');	
	},	

	_update2: function() {		
		this._baseLayersList.innerHTML = '';
		this._baseLayersInstanceList.innerHTML = '';
		this._overlaysList.innerHTML = '';

		var baseLayersPresent = false,
			baseLayersInstancePresent = false,
		    overlaysPresent = false;

		for (var i in this._layers) {
			if (this._layers.hasOwnProperty(i)) {
				var obj = this._layers[i];
				this._addItem(obj, obj.instanceLayer || obj.overlay);
				overlaysPresent = overlaysPresent || obj.overlay;
				baseLayersInstancePresent = baseLayersInstancePresent || obj.instanceLayer;
				baseLayersPresent = baseLayersPresent || (!obj.overlay && !obj.instanceLayer);
			}
		}

		this._separator.style.display = (baseLayersInstancePresent && baseLayersPresent ? '' : 'none');
		this._separator2.style.display = (overlaysPresent && baseLayersInstancePresent ? '' : 'none');	
	},
	
	_update: function () {
		if (!this._container) {
			return;
		}
		
		for (var i in this.baseLayers) {
			for (j = 0; j < this.baseLayers[i]._overlayMap.length; j++) {
				var vLayer = this.baseLayers[i]._overlayMap[j];
				this._addLayer(vLayer, vLayer.title, false, true);
				
				if (vLayer.isDefault == 1 && vLayer.layers) {
					for (z = 0; z < vLayer.layers.length; z++) {
						this._addLayer(vLayer.layers[z], vLayer.layers[z].title, true, false);
					}
				}				
			}
			break;
		}
	
		this._update2();
		
		this._form.getElementsByTagName('input')[0].checked = true;
		this._onInputClick();
	},

	_addItem: function (obj, vInputClick) {
		var label = document.createElement('label'),
		    input,
		    checked = this._map.hasLayer(obj.layer) || (obj.layer.controlChecked && obj.layer.controlChecked == 1 ? true : false) ;

		
		if (obj.overlay) {
			input = document.createElement('input');
			input.type = 'checkbox';
			input.className = 'leaflet-control-layers-selector';
			input.defaultChecked = checked;
		} else {
			input = this._createRadioElement('leaflet-base-layers', checked);
		}

		input.mapId = obj.layer.id;
		input.layerId = L.Util.stamp(obj.layer);

		if (vInputClick) {
			L.DomEvent.on(input, 'click', (input.type == 'checkbox' ? this._onInputClick3 : this._onInputClick2), this);
		} else {
			L.DomEvent.on(input, 'click', this._onInputClick, this);
		}

		var name = document.createElement('span');
		name.innerHTML = ' ' + obj.name;
      if (checked) {
         name.style.fontWeight = 'Bold';
      }

		label.appendChild(input);
		label.appendChild(name);

		var container = (!obj.overlay && !obj.instanceLayer ? this._baseLayersList : (obj.overlay ? this._overlaysList : this._baseLayersInstanceList) );
		container.appendChild(label);
	},
	
	_onInputClick: function () {
		
		var i, input, obj, iClicked,
		    inputs = this._form2.getElementsByTagName('input'),
		    inputsLen = inputs.length,
		    baseLayer;
			
		if (this.frmCurrClicked != -1 && this._form.getElementsByTagName('input')[this.frmCurrClicked].checked) {
			//alert("click repetido");
			return;
		}

		//this.frm2CurrClicked = -1;

		for (i = 0; i < inputs.length; i++) {
			input = inputs[i];

			obj = this._layers[input.layerId];
			
			if (obj == undefined) {
				continue;
			}
			
			if (this._map.hasLayer(obj.layer)) {
            input.parentNode.lastChild.style.fontWeight = 'Normal';
				this._map.removeLayer(obj.layer);
			}
			delete this._layers[input.layerId];
		}	
		


		// Mudando o mapa base
		inputs = this._form.getElementsByTagName('input');
		inputsLen = inputs.length;
		
		for (i = 0; i < inputsLen; i++) {
			input = inputs[i];
			obj = this._layers[input.layerId];

			if (input.checked && !this._map.hasLayer(obj.layer)) {
				if (input.type != 'checkbox') {
               input.parentNode.lastChild.style.fontWeight = 'Bold';
					this.frmCurrClicked = i;
               this.currentMap = obj.layer.originalId;
				}
				this._map.addLayer(obj.layer);
				if (!obj.overlay && !obj.instanceLayer) {
					baseLayer = obj.layer;
					if (this.inputClick) {
						this.inputClick(i, null);
					}					
				}
				iClicked = obj.layer;
			} else if (!input.checked && this._map.hasLayer(obj.layer)) {
            input.parentNode.lastChild.style.fontWeight = 'Normal';
				this._map.removeLayer(obj.layer);
			} 
		}
      
		// Limpando as camadas
		this._baseLayersInstanceList.innerHTML = '';
		this._overlaysList.innerHTML = '';
      
		this._updateLayerControl(iClicked);
		this._onInputClick2();
		//this._onInputClick3();
	},
	_onInputClick2: function () {
	
		var i, input, obj, iClicked,
		    inputs = this._form2.getElementsByTagName('input'),
		    inputsLen = inputs.length,
		    baseLayer;
		
//		if (this.frmCurrClicked != -1 && this.frm2CurrClicked != -1 && inputs[this.frm2CurrClicked] && inputs[this.frm2CurrClicked].checked) {
//			alert("click repetido");
//			return;
//		}
		
		// Removing all layers
		for (i = 0; i < inputs.length; i++) {
			input = inputs[i];

			obj = this._layers[input.layerId];
		
			if (this._map.hasLayer(obj.layer)) {
            input.parentNode.lastChild.style.fontWeight = 'Normal';
				this._map.removeLayer(obj.layer);
			}
			
			if (input.type == 'checkbox'){
				delete this._layers[input.layerId];
			}
			
			if (input.checked && input.type != 'checkbox') {
				iClicked = obj.layer;
			}
		}

		this._updateLayerControlCheckBoxs(iClicked);
		this._update3();
		
		inputs = this._form2.getElementsByTagName('input');
		inputsLen = inputs.length;
		
		for (i = 0; i < inputsLen; i++) {
			input = inputs[i];
			obj = this._layers[input.layerId];

			if (input.checked && input.type != 'checkbox') {
            input.parentNode.lastChild.style.fontWeight = 'Bold';
				this.frm2CurrClicked = i;
            this.currentSubMap = obj.layer.originalId;
			}
			if (input.checked && !this._map.hasLayer(obj.layer)) {
				this._map.addLayer(obj.layer);
				if (this.inputClick && input.type != 'checkbox') {
               input.parentNode.lastChild.style.fontWeight = 'Bold';
					this.frm2CurrClicked = i;
					this.inputClick(null, i);
				}				
				if (!obj.overlay) {
					baseLayer = obj.layer;
				}
			} else if (!input.checked && this._map.hasLayer(obj.layer)) {
				this._map.removeLayer(obj.layer);
			}

		}		

		if (baseLayer) {
			this._map.fire('baselayerchange', {layer: baseLayer});
		}
	},	

	_onInputClick3: function () {
		var i, input, obj,
		    inputs = this._form2.getElementsByTagName('input'),
		    inputsLen = inputs.length,
		    baseLayer;
		
		inputs = this._form2.getElementsByTagName('input'),
		inputsLen = inputs.length;
				
		for (i = 0; i < inputsLen; i++) {
			input = inputs[i];
			obj = this._layers[input.layerId];

			if (input.checked && !this._map.hasLayer(obj.layer)) {
            input.parentNode.lastChild.style.fontWeight = 'Bold';
				this._map.addLayer(obj.layer);
				if (obj.instanceLayer) {
					baseLayer = obj.layer;
				}
			} else if (!input.checked && this._map.hasLayer(obj.layer)) {
            input.parentNode.lastChild.style.fontWeight = 'Normal';
				this._map.removeLayer(obj.layer);
			}
		}
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
   
   getCurrentMap: function() {
      return {mapId: this.currentMap, subMapId: this.currentSubMap}
   }
	
});

L.control.zlayers2 = function (baseLayers, overlays, options) {
	return new L.Control.ZLayers2(baseLayers, overlays, options);
};