// ClickHist
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.Mouse.ClickHist = L.Control.InfoBox.Mouse.extend({
  options: {
    title: "Click Coordinates",
    className: "bounds clickhist"
  },

  _initSettings: function() {
    L.Control.InfoBox.Mouse.prototype._initSettings.call(this);

    this.hist = [];
    this.rows = {};
    this.pos = {};
    this.cnt = 0;
    //this.sw = {};
  },

  getContent: function(parent) {
    this._buildActionGroup(parent);

    //this.createColumn("South West", this.sw, parent);
    this.createColumn("#", this.pos, parent);
    this.createColumn("Coordinate", this.rows, parent);
  },

  createColumn: function(titleText, rootObject, parent) {
    var column = L.DomUtil.create('div', 'column', parent);

    if(titleText) {
      var header = L.DomUtil.create('div', 'row header', column);
      header.append(titleText);

      L.DomUtil.create('div', 'infobox-separator', column);
    }

    var row1 = this.createRow('Pos: ', column);
    rootObject.row1ValueCell = $('.value', row1);
    var row2 = this.createRow('Pos: ', column);
    rootObject.row2ValueCell = $('.value', row2);
    var row3 = this.createRow('Pos: ', column);
    rootObject.row3ValueCell = $('.value', row3);
    var row4 = this.createRow('Pos: ', column);
    rootObject.row4ValueCell = $('.value', row4);
    var row5 = this.createRow('Pos: ', column);
    rootObject.row5ValueCell = $('.value', row5);
  },

  _buildActionGroup: function(parent) {
    var actionGroup = L.DomUtil.create('div', 'action-group');

    var copyLink = new CopyLink({ content: this.generateLink.bind(this) });
    $(actionGroup).append(copyLink.domNode);

    $(parent).append(actionGroup);
  },

  _updateCoordsInfo: function(mouse) {
     
  },
  _updateCoordsInfoClick: function(mouse) {
     if (mouse != undefined) {
        
         this.hist.push({id: ++this.cnt, lat: mouse.lat, lng: mouse.lng});
         if (this.hist.length > 5) {
            this.hist.shift();
         }
         //console.log(this.hist);
         //var mouse = this._map.getMouse();
         if (this.hist[0]) {
            this.rows.row1ValueCell.text(this.hist[0].lat + " / " + this.hist[0].lng);
            this.pos.row1ValueCell.text(this.hist[0].id);     
         }                                                    
         if (this.hist[1]) {                                  
            this.rows.row2ValueCell.text(this.hist[1].lat + " / " + this.hist[1].lng);
            this.pos.row2ValueCell.text(this.hist[1].id);     
         }                                                    
         if (this.hist[2]) {                                  
            this.rows.row3ValueCell.text(this.hist[2].lat + " / " + this.hist[2].lng);
            this.pos.row3ValueCell.text(this.hist[2].id);     
         }                                                    
         if (this.hist[3]) {                                  
            this.pos.row4ValueCell.text(this.hist[3].id);     
            this.rows.row4ValueCell.text(this.hist[3].lat + " / " + this.hist[3].lng);
         }                                                    
         if (this.hist[4]) {                                  
            this.pos.row5ValueCell.text(this.hist[4].id);     
            this.rows.row5ValueCell.text(this.hist[4].lat + " / " + this.hist[4].lng);
         }
         
         //this.rows.row2ValueCell.text(this.hist[1]);
      }
    //var bounds = this._map.getClickHist();
    //var ne = bounds.getNorthEast();
    //var sw = bounds.getSouthWest();

    //this.rows.latValueCell.text(ne.lat.toFixed(this.options.precision));
    //this.rows.lngValueCell.text(ne.lng.toFixed(this.options.precision));
    //this.sw.latValueCell.text(sw.lat.toFixed(this.options.precision));
    //this.sw.lngValueCell.text(sw.lng.toFixed(this.options.precision));
  },

  generateLink: function() {
      var text = "click,lat,lng|";
      for (var i = 0; i < this.hist.length; i++) {
         text += this.hist[i].id + "," + this.hist[i].lat + "," + this.hist[i].lng + "|";
      }
      return text;
    
    /*var bounds = this._map.getClickHist();
    var coordsString = "" +
    bounds.getSouth().toFixed(this.options.precision) + "," +
      bounds.getWest().toFixed(this.options.precision) + "," +
      bounds.getNorth().toFixed(this.options.precision) + "," +
      bounds.getEast().toFixed(this.options.precision)
    ;

    if(getUrlParam("startArea")) {
      return window.location.href.replace(
        new RegExp("(startArea=).*?(&|$)"),
        "$1" + coordsString + "$2"
      );
    } else {
      return window.location.href + "&startArea=" + coordsString;
    }*/
  }
});

L.Control.InfoBox.Mouse.ClickHist.prototype._className = "L.Control.InfoBox.Mouse.ClickHist";

L.control.infoBox.mouse.clickhist = function (opts) {
	return new L.Control.InfoBox.Mouse.ClickHist(opts);
};
