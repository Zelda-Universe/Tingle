// ClickHist
// - opts: [Object]

L.Control.InfoBox.MouseClickHist = L.Control.InfoBox.extend({
  options: {
    className: "mouse clickhist",
    rowsNum: 5,
    title: "Click Map Coordinates"
  },

  initialize: function(opts) {
    L.Control.InfoBox.prototype.initialize.call(this, opts);

    this.hist = [];
    this.rows = {};
    this.pos  = {};

    this.cnt  = 0;
  },

  onAdd: function(map) {
    var container = L.Control.InfoBox.prototype.onAdd.call(this, map);

    this._buildActionGroup(container);

    this.createColumn("#"           , this.pos , container);
    this.createColumn("Coordinates" , this.rows     , container);

    this._addMapHandler(map);

    return container;
  },

  createColumn: function(titleText, rootObject, container) {
    var column = L.DomUtil.create('div', 'column', container);

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

  _addMapHandler: function(map) {
    L.DomEvent.on(map, 'click', function(event) {
      this._addCoords(event.latlng);
    }.bind(this));
  },

  _buildActionGroup: function(container) {
    var actionGroup = L.DomUtil.create('div', 'action-group');

    var copyLink = new CopyLink({ content: this.generateLink.bind(this) });
    $(actionGroup).append(copyLink.domNode);

    $(container).append(actionGroup);
  },

  _addCoords: function(coords) {
    if (!coords) return;

    this.hist.push({id: ++this.cnt, lat: coords.lat, lng: coords.lng});
    if (this.hist.length > 5) {
      this.hist.shift();
    }

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
  },

  generateLink: function() {
    var text = "click,lat,lng|";
    for (var i = 0; i < this.hist.length; i++) {
       text += this.hist[i].id + "," + this.hist[i].lat + "," + this.hist[i].lng + "|";
    }
    return text;
  }
});

L.Control.InfoBox.MouseClickHist.prototype._className = "L.Control.InfoBox.MouseClickHist";

L.control.infoBox.mouseClickHist = function (opts) {
	return new L.Control.InfoBox.MouseClickHist(opts);
};
