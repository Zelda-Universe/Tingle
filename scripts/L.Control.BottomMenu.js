L.Control.BottomMenu = L.Control.extend({
    options: {
        position: 'topleft',
        width: window.innerWidth,
        height: window.innerHeight,
        delay: '10',
    },
    _category: '',
    _open: false,

    initialize: function (innerHTML, categoryTree, options) {

      L.Util.setOptions(this, options);
        
      if (L.Browser.mobile) {
         this.options.mobile = true;
      } else {
         this.options.mobile = false;
         this.options.width = 360;
         this.options.height = 500;
      }
      
      
      this._innerHTML = innerHTML;
      this._startPosition = (parseInt(this.options.height, 10)) -100;
      this._isLeftPosition = this.options.position == 'topleft' ||
      this.options.position == 'bottomleft' ? true : false;
        

      this.options.iconQty = 4;
      this.options.iconSize = 80;
      this.options.iconSpace = Math.floor((this.options.width - (this.options.iconQty * this.options.iconSize)) / (this.options.iconQty + 1));
        
      var contents = "";
      contents += '<ul class="leaflet-bottommenu-ul">';
      for (var i = 0; i < categoryTree.length; i++) {
         contents += '<li style="margin-left: ' + this.options.iconSpace + 'px !important; width: ' + this.options.iconSize + 'px !important"><a id="catMenuMobile' + categoryTree[i].id + '" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(' + categoryTree[i].id +  ');event.preventDefault();"><div class="circle" style="background-color: ' + categoryTree[i].color + '; border-color: ' + categoryTree[i].color + '"><span class="icon-' + categoryTree[i].img + '"></span></div><p>' + categoryTree[i].name + '</p></a></li>';
         if (categoryTree[i].children.length > 0) {
            for (var j = 0; j < categoryTree[i].children.length; j++) {
               contents += '<li style="margin-left: ' + this.options.iconSpace + 'px !important; width: ' + this.options.iconSize + 'px !important"><a id="catMenuMobile' + categoryTree[i].children[j].id + '" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(' + categoryTree[i].children[j].id +  ');event.preventDefault();"><div class="circle" style="background-color: ' + categoryTree[i].color + '; border-color: ' + categoryTree[i].color + '"><span class="icon-' + categoryTree[i].children[j].img + '"></span></div><p>' + categoryTree[i].children[j].name + '</p></a></li>';
            }
         }
      }
      contents += '</ul>';
      this._category = contents;
         
    },
    
    createIcon: function(container, img, name, color) {
       var li = L.DomUtil.create('li', 'leaflet-bottommenu-ul', container);
       li.style.marginLeft = this.options.iconSpace + 'px';
       li.style.width = this.options.iconSize + 'px';
       
       var a = L.DomUtil.create('a', 'leaflet-bottommenu-a', li);
       a.id = 'catMenuMobile' + categoryTree[i].id;
       a.href = "#";
       
       var circle = L.DomUtil.create('div', 'circle', a);
       circle.style.backgroundColor = categoryTree[i].color;
       circle.style.borderColor = categoryTree[i].color;
       
       var span = L.DomUtil.create('span', 'icon-' + categoryTree[i].children[j].img, circle);
       
       var p = L.DomUtil.create('p', '', a);
       p.innerHTML = categoryTree[i].children[j].name;
    },
    
    onAdd: function (map) {

        var OPEN_TO = 100;
        var containerClass;
        
        this._menu;
        // If mobile, render the menu directy on the map container
        if (this.options.mobile) {
           this._container = L.DomUtil.create('div', 'leaflet-control-layers leaflet-control-layers-expanded leaflet-control leaflet-bottommenu'); //leaflet-control-layers leaflet-control-layers-expanded leaflet-control
           this._menu = L.DomUtil.create('div', 'leaflet-bottommenu', map._container);
        } else {
           this._container = L.DomUtil.create('div', 'leaflet-control-layers leaflet-control-layers-expanded leaflet-control leaflet-bottommenu'); //leaflet-control-layers leaflet-control-layers-expanded leaflet-control
           this._menu = L.DomUtil.create('div', '', this._container);
           this._container.style.padding = '0px';
        }
        
        
        this._menu.style.width = this.options.width + 'px';
        this._menu.style.height = (this.options.height - OPEN_TO) + 'px';
       
        var headerMenu = L.DomUtil.create('header', 'ex1', this._menu);
        var xDown = null;                                                        
        var yDown = null;
        
        if( this.options.mobile) {
            L.DomEvent
               .on(headerMenu, 'click', L.DomEvent.stopPropagation)
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
                           if( !this._open)
                           {
                               this._animate(this._menu, this._startPosition, OPEN_TO, true);
                               this._open = true;
                           }  
                       } else { // swipe down
                           //console.log('swipe down');
                           //console.log( this._open);
                           if( this._open)
                           {
                               this._animate(this._menu, OPEN_TO, this._startPosition, false);
                               this._open = false;
                           }
                       }                       
                   }
                      
                   /* reset values */
                   xDown = null;
                   yDown = null;  
               }, this);
        }
        
        // Left Header Div
        /*
        var leftText = 'Categories';
        var leftDiv = L.DomUtil.create('div', 'header-right', headerMenu);
        leftDiv.style.marginRight = '40px';
        var leftDivLink = L.DomUtil.create('a', 'leaflet-bottommenu-a', leftDiv);
        leftDivLink.title = leftText;
        L.DomUtil.create('span', 'leaflet-bottommenu-header-icon icon-BotW_Weapons', leftDivLink);
        L.DomUtil.create('br', '', leftDivLink);
        var leftDivLinkText = L.DomUtil.create('p', '', leftDivLink);
        leftDivLinkText.innerHTML = leftText;
        L.DomEvent
            .on(leftDivLink, 'click', L.DomEvent.stopPropagation)
            .on(leftDivLink, 'click', function() {
                // Open
                this._open = !this._open;
                if (this._open) {
                  this._animate(this._menu, this._startPosition, OPEN_TO, this._open);
                } else {
                   this._animate(this._menu, OPEN_TO, this._startPosition, this._open);
                }
            }, this);
        
        // Right Header Div
        var rightText = 'Game';
        var rightDiv = L.DomUtil.create('div', 'header-right', headerMenu);
        var rightDivLink = L.DomUtil.create('a', 'leaflet-bottommenu-a', rightDiv);
        rightDivLink.title = rightText;
        L.DomUtil.create('span', 'leaflet-bottommenu-header-icon icon-BotW_Weapons', rightDivLink);
        L.DomUtil.create('br', '', rightDivLink);
        var rightDivLinkText = L.DomUtil.create('p', '', rightDivLink);
        rightDivLinkText.innerHTML = rightText;
        L.DomEvent
            .on(rightDivLink, 'click', L.DomEvent.stopPropagation)
            .on(rightDivLink, 'click', function() {
                // Open
                this._open = !this._open;
                if (this._open) {
                  this._animate(this._menu, this._startPosition, OPEN_TO, this._open);
                } else {
                   this._animate(this._menu, OPEN_TO, this._startPosition, this._open);
                }
            }, this);
        */
            
        // Logo
        var logoDiv = L.DomUtil.create('div', 'logo', headerMenu);
        var imgLogo = L.DomUtil.create('img', '', logoDiv);
        imgLogo.src  = 'images/zmaps_white.png';
        imgLogo.style.height = '100px';

        L.DomUtil.create('hr', '', this._menu);

        
        L.DomEvent.disableClickPropagation(this._menu);
        /** 001 - BEGIN **/
        // Add mouse wheel 
        L.DomEvent.on(this._menu, 'mousewheel', L.DomEvent.stopPropagation);
        /** 001 - END **/
        if (this.options.mobile) {
            var closeButton = L.DomUtil.create('button', 'leaflet-bottommenu-close-button fa', this._menu);

            if (this._isLeftPosition) {
               this._menu.style.top = this._startPosition + 'px';
               closeButton.style.float = 'right';
               L.DomUtil.addClass(closeButton, 'fa-chevron-left');
            }
            else {
               this._menu.style.right = '-' + this.options.width;
               closeButton.style.float = 'left';
               L.DomUtil.addClass(closeButton, 'fa-chevron-right');
            }
            
            L.DomEvent
               .on(closeButton, 'click', L.DomEvent.stopPropagation)
               .on(closeButton, 'click', function() {
                   // Close
                   this._animate(this._menu, OPEN_TO, this._startPosition, false);
                   this._open = false;
               }, this);
            
         }
        
         this._contents = L.DomUtil.create('div', 'leaflet-bottommenu-contents', this._menu);
         //this._contents.innerHTML = '<ul class="leaflet-bottommenu-ul"><li><a id="catMenu1911" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(1911);event.preventDefault();"><span class="leaflet-bottommenu-icon icon-BotW_Meat"></span><br><p>Food (Beef)</p></a></li><li><a id="catMenu1912" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(1912);event.preventDefault();"><span class="leaflet-bottommenu-icon icon-BotW_Fish"></span><br><p>Food (Fish)</p></a></li><li><a id="catMenu1913" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(1913);event.preventDefault();"><span class="leaflet-bottommenu-icon icon-BotW_Herb"></span><br><p>Herbs</p></a></li><li><a id="catMenu1914" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(1914);event.preventDefault();"><span class="leaflet-bottommenu-icon icon-BotW_Mushroom"></span><br><p>Mushrooms</p></a></li><li><a id="catMenu1915" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(1915);event.preventDefault();"><span class="leaflet-bottommenu-icon icon-BotW_Materials"></span><br><p>Materials</p></a></li><li><a id="catMenu1916" class="leaflet-bottommenu-a" href="#" onclick="_this._updateCategoryVisibility(1916);event.preventDefault();"><span class="leaflet-bottommenu-icon icon-BotW_Korok-Seeds"></span><br><p>Korok Seeds</p></a></li></ul>';
         this._contents.innerHTML = this._category;
         this._contents.style.clear = 'both';
         if (this.options.mobile) {
            this._contents.style.height = (this.options.height - OPEN_TO - 100 - 20) + 'px';
         } else {
            this._contents.style.height = (this.options.height - OPEN_TO - 100) + 'px';
         }
         
         // @TODO: Temp dev
         logoDiv.style.margin = 'auto';
         logoDiv.style.height = '100px';
        
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
    show() {
       this._animate(this._menu, this._startPosition, 0, true);
    },
    
    isMobile() {
       return this.options.mobile;
    },
    /** 001 - END **/

    _animate: function(menu, from, to, isOpen) {
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
           return;
        }

        setTimeout(function(bottomMenu) {
            var value = isOpen ? from - 10 : from + 10;
            if (isOpen && from < to) {
               value = to;
            }
            bottomMenu._animate(bottomMenu._menu, value, to, isOpen);
        }, this.options.delay, this);
    }
});

L.control.bottomMenu = function(innerHTML, options) {
    return new L.Control.BottomMenu(innerHTML, options);
}
