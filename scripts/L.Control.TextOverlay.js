(function() {
    console.info("TextOverlay Version 1.00");
    var DEFAULT_OPTIONS = {
        _map: null,
        text: "",
        subtext: "",
        initialZoom: 3,
        maxZoom: 8,
        minZoom: 0,
        visible: true
    };

    var TextOverlay = L.Layer.extend({

        options: new Object(DEFAULT_OPTIONS),

        initialize: function(latlng, opts) {
            // save position of the layer or any options from the constructor
            this._latlng = latlng;
            this._popup = null;
            L.Util.setOptions(this, opts);
        },

        getLatLng: function() {
            return this._latlng;
        },

        onAdd: function(map) {
            var self = this;
            this._map = map;

            // create a DOM element and put it into one of the map panes
            this._el = L.DomUtil.create('div', 'leaflet-textoverlay leaflet-zoom-hide leaflet-interactive');

            this._el.addEventListener("click", function(e) {
                if (!window.user) return;
                e.stopPropagation();
                e.preventDefault();
                self.openPopup();
                return false;
            });

            this._el.innerHTML = '<span class="leaflet-textoverlay-top">' + this.options.text.replace(/ /g, "&nbsp;") + '</span><br /><span class="leaflet-textoverlay-bottom">' + this.options.subtext + '</span>';

            map.getPanes().overlayPane.appendChild(this._el);

            // add a viewreset event listener for updating layer's position, do the latter
            map.on('viewreset', this._reset, this);
            map.on('move', this._reset, this);
            this._reset();
        },

        onRemove: function(map) {
            // remove layer's DOM elements and listeners
            map.getPanes().overlayPane.removeChild(this._el);
            map.off('viewreset', this._reset, this);
            map.off('move', this._reset, this);
        },

        bindPopup: function(popup) {
            this._popup = popup;
        },

        openPopup: function() {
            console.info(this._popup);
            if (this._popup instanceof L.Popup) {
                this._popup.setLatLng(this._latlng);
                this._map.openPopup(this._popup);
            } else if ((this._popup instanceof HTMLElement) || typeof(this._popup) == "string") {
                this._map.openPopup(this._popup, this._latlng);
            }
        },

        _reset: function() {
            console.info(this.options.text);
            this._el.style.pointerEvents = window.user ? "all" : "none";

            var rPos = this._map.latLngToContainerPoint(this._latlng);

            //this._el.style.display="none";
            var scale = ((this._map.getZoom() - this.options.minZoom) / (this.options.maxZoom - this.options.minZoom)) * 0.75 + 0.25;
            var pos = this._map.latLngToLayerPoint(this._latlng);
            L.DomUtil.setTransform(this._el, pos, scale);

            var inBounds = (rPos.x + this._el.clientWidth > 0) && (rPos.x - this._el.clientWidth < document.documentElement.scrollWidth) &&
                (rPos.y + this._el.scrollHeight > 0) && (rPos.y - this._el.scrollHeight < document.documentElement.scrollHeight);

            var isVisible = this.options.visible && (this._map.getZoom() >= this.options.minZoom) && (this._map.getZoom() <= this.options.maxZoom) && inBounds;
            this._el.style.display = isVisible ? "block" : "none";

            var offX = 0;

            this._el.style.textAlign = "center";

            if (this._el.classList.contains("leaflet-textoverlay-arrow-left")) {
                this._el.classList.remove("leaflet-textoverlay-arrow-left");
            }
            if (this._el.classList.contains("leaflet-textoverlay-arrow-right")) {
                this._el.classList.remove("leaflet-textoverlay-arrow-right");
            }

            if (rPos.x - this._el.scrollWidth / 2 - 5 <= 0) {
                this._el.style.textAlign = "left";
                offX = -(rPos.x - this._el.scrollWidth / 2) + 5;
                if (rPos.x < 0) {
                    this._el.classList.add("leaflet-textoverlay-arrow-left");
                }
            } else if (rPos.x + this._el.scrollWidth / 2 + 5 >= document.documentElement.scrollWidth) {
                this._el.style.textAlign = "right";
                offX = document.documentElement.scrollWidth - (rPos.x + this._el.scrollWidth / 2) - 5;
                if (rPos.x > document.documentElement.scrollWidth) {
                    this._el.classList.add("leaflet-textoverlay-arrow-right");
                }
            }

            // update layer's position
            pos = this._map.latLngToLayerPoint(this._latlng); //this._map.project(this._latlng)._round()._subtract(this._map._getNewPixelOrigin(this._map.getCenter()));
            console.info(this._map.project(this._latlng)._round(), this._map.getPixelOrigin(), pos);
            pos.x -= this._el.clientWidth / 2 - offX;
            pos.y -= this._el.clientHeight / 2;
            //this._el.style[L.DomUtil.TRANSFORM]=(L.Browser.ie3d?"translate("+pos.x+"px,"+pos.y+"px)":"translate3d("+pos.x+"px,"+pos.y+"px,0)")+" scale("+scale+")"
            L.DomUtil.setTransform(this._el, pos, scale);
        }
    });

    L.TextOverlay = TextOverlay;
})();