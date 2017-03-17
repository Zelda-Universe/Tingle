L.Control.SlideMenu = L.Control.extend({
    options: {
        position: 'topleft',
        width: '300px',
        height: '100%',
        delay: '10'
    },

    initialize: function (innerHTML, options) {
        L.Util.setOptions(this, options);
        this._innerHTML = innerHTML;
        this._startPosition = -(parseInt(this.options.width, 10));
        this._isLeftPosition = this.options.position == 'topleft' ||
        this.options.position == 'bottomleft' ? true : false;
    },

    onAdd: function (map) {
        this._container = L.DomUtil.create('div', 'leaflet-control-slidemenu leaflet-bar leaflet-control');
        var link = L.DomUtil.create('a', 'leaflet-bar-part leaflet-bar-part-single', this._container);
        link.title = 'Menu';
        L.DomUtil.create('span', 'fa fa-bars', link);

        this._menu = L.DomUtil.create('div', 'leaflet-menu', map._container);
        this._menu.style.width = this.options.width;
        this._menu.style.height = this.options.height;

        var closeButton = L.DomUtil.create('button', 'leaflet-menu-close-button fa', this._menu);

        if (this._isLeftPosition) {
            this._menu.style.left = '-' + this.options.width;
            closeButton.style.float = 'right';
            L.DomUtil.addClass(closeButton, 'fa-chevron-left');
        }
        else {
            this._menu.style.right = '-' + this.options.width;
            closeButton.style.float = 'left';
            L.DomUtil.addClass(closeButton, 'fa-chevron-right');
        }

        this._contents = L.DomUtil.create('div', 'leaflet-menu-contents', this._menu);
        this._contents.innerHTML = this._innerHTML;
        this._contents.style.clear = 'both';

        L.DomEvent.disableClickPropagation(this._menu);
        L.DomEvent
            .on(link, 'click', L.DomEvent.stopPropagation)
            .on(link, 'click', function() {
                // Open
                this._animate(this._menu, this._startPosition, 0, true);
            }, this)
            .on(closeButton, 'click', L.DomEvent.stopPropagation)
            .on(closeButton, 'click', function() {
                // Close
                this._animate(this._menu, 0, this._startPosition, false);
            }, this);
        /** 001 - BEGIN **/
        // Add mouse wheel 
        L.DomEvent.on(this._contents, 'mousewheel', L.DomEvent.stopPropagation);
        /** 001 - END **/
            
        

        return this._container;
    },

    onRemove: function(map){
        //Remove sliding menu from DOM
        map._container.removeChild(this._menu);
        delete this._menu;
    },


    setContents: function(innerHTML) {
        this._innerHTML = innerHTML;
        this._contents.innerHTML = this._innerHTML;
    },
    
    /** 001 - BEGIN **/
    show: function() {
       this._animate(this._menu, this._startPosition, 0, true);
    },
    /** 001 - END **/

    _animate: function(menu, from, to, isOpen) {

        if(isOpen ? from > to : from < to) {
            return;
        }

        if (this._isLeftPosition) {
            menu.style.left = from + "px";
        }
        else {
            menu.style.right = from + "px";
        }

        setTimeout(function(slideMenu) {
            var value = isOpen ? from + 10 : from - 10;
            slideMenu._animate(slideMenu._menu, value, to, isOpen);
        }, this.options.delay, this);
    }
});

L.control.slideMenu = function(innerHTML, options) {
    return new L.Control.SlideMenu(innerHTML, options);
};
