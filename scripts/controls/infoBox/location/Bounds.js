// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Bounds
// - opts: [Object]
//   - precision: [Number]

L.Control.InfoBox.Location.Bounds = L.Control.InfoBox.Location.extend({
  options: {
    title: "Bounds Coordinates",
    className: "bounds"
  },

  _initSettings: function() {
    L.Control.InfoBox.Location.prototype._initSettings.call(this);

    this.ne = {};
    this.sw = {};
  },

  getContent: function(parent) {
    this._buildActionGroup(parent);

    this.createColumn("South West", this.sw, parent);
    this.createColumn("North East", this.ne, parent);
  },

  createColumn: function(titleText, rootObject, parent) {
    var column = L.DomUtil.create('div', 'column', parent);

    if(titleText) {
      var header = L.DomUtil.create('div', 'row header', column);
      header.append(titleText);

      L.DomUtil.create('div', 'infobox-separator', column);
    }

    var latRow = this.createRow('Latitude: ', column);
    rootObject.latValueCell = $('.value', latRow);
    var lngRow = this.createRow('Longitude: ', column);
    rootObject.lngValueCell = $('.value', lngRow);
  },

  _buildActionGroup: function(parent) {
    var actionGroup = L.DomUtil.create('div', 'action-group');

    var copyLink = new CopyLink({ content: this.generateLink.bind(this) });
    $(actionGroup).append(copyLink.domNode);

    var link = new Link({ content: this.generateLink.bind(this) });
    $(actionGroup).append(link.domNode);

    $(parent).append(actionGroup);
  },

  _updateCoordsInfo: function() {
    var bounds = this._map.getBounds();
    var ne = bounds.getNorthEast();
    var sw = bounds.getSouthWest();

    this.ne.latValueCell.text(ne.lat.toFixed(this.options.precision));
    this.ne.lngValueCell.text(ne.lng.toFixed(this.options.precision));
    this.sw.latValueCell.text(sw.lat.toFixed(this.options.precision));
    this.sw.lngValueCell.text(sw.lng.toFixed(this.options.precision));
  },

  generateLink: function() {
    var bounds = this._map.getBounds();
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
    }
  }
});

L.Control.InfoBox.Location.Bounds.prototype._className = "L.Control.InfoBox.Location.Bounds";

L.control.infoBox.location.bounds = function (opts) {
	return new L.Control.InfoBox.Location.Bounds(opts);
};
