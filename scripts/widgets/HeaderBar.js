// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Header
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - mapControl: [Object] The drawer menu that will render the list of searched markers.
//   - accountButton: [Boolean] Whether to show this control or not.
//   - largerSearchArea: [Boolean] Whether to show
//   - shrinkButton: [Boolean] Whether to show this control or not.

function HeaderBar(opts) {
  opts = opts || {};

  this._initSettings(opts);
  this._initDOMElements(opts);
};

HeaderBar.prototype._initSettings = function(opts) {
  this.parent = opts.parent;

  // Currently unused, but could be effective.
  // TODO: Would be more awesome if this worked if the ordering for fetching
  // potential user info came earlier since it is depended on by more
  // component code locations, rather than creating the form now and hiding
  // it later on, but hey
  this.accountButton = getSetOrDefaultValue(opts.accountButton, !zMap.getUser());
  this.actuallyCreateSearchArea = getSetOrDefaultValue(opts.actuallyCreateSearchArea, false);
  this.classNameParent = getSetOrDefaultValue(opts.classNameParent, '');
  this.isolated = getSetOrDefaultValue(opts.isolated, false);
  this.largerSearchArea = getSetOrDefaultValue(opts.largerSearchArea, !this.accountButton);

  this.shrinkButton = opts.shrinkButton;

  this.mapControl = opts.mapControl;
};

HeaderBar.prototype._initDOMElements = function(opts) {
  var parentDiv, headerDiv;
  if(this.isolated) {
    parentDiv = L.DomUtil.create('div', 'header-bar mobile-header-bar leaflet-control', this.parent); // Maybe make full control later and remove this redundant addition then....
    headerDiv = L.DomUtil.create('div', 'row vertical-divider row-header', parentDiv);
  } else {
    parentDiv = headerDiv = L.DomUtil.create('div', 'row vertical-divider row-header', this.parent);
    L.DomUtil.create('div', this.classNameParent + '-separator', this.parent);
  }
  this.domNode = parentDiv;

  if(this.accountButton) {
    var headerDivLeft = L.DomUtil.create('div', 'col-xs-2 full-icon-space-container', headerDiv);
    this.createAccountButton(headerDivLeft);
  }

  var headerDivMid = L.DomUtil.create(
    'div',
    (
      (this.accountButton && this.shrinkButton)
      ? 'col-xs-8'
      : (
          (this.accountButton || this.shrinkButton)
          ? 'col-xs-10'
          : 'col-xs-12'
        )
    ),
    headerDiv
  );
  if(this.actuallyCreateSearchArea) {
    this.createSearchArea(headerDivMid, opts.name, opts.categories);
  } else {
    var sdEl = L.DomUtil.create('div', 'search-disabled', headerDivMid);
    sdEl.innerText = 'Search Disabled';
  }

  if(this.shrinkButton) {
   var headerDivRight = L.DomUtil.create('div', 'col-xs-2 full-icon-space-container', headerDiv);
   this.createShrinkButton(headerDivRight);
  }
};

HeaderBar.prototype.createActionsButton = function(parent) {
  var barsButton = L.DomUtil.create('a', 'button icon-bars full-icon-space', parent);
  // barsButton.innerHTML = '';
  L.DomEvent
    .on(barsButton, 'click', L.DomEvent.stopPropagation)
    .on(barsButton, 'click', function(e) {
      // Open
      this._collapse();
      _this._closeNewMarker();
      e.preventDefault();
    }, this.mapControl)
  ;
};

HeaderBar.prototype.createAccountButton = function(parent) {
  var accountButton = new AccountButton({ mapControl: this.mapControl });
  $(parent).append(accountButton.domNode);
};

HeaderBar.prototype.createSearchArea = function(parent, name, categories) {
  this.searchArea = new SearchArea({
    parent: parent,
    markerListViewBuiltHandler: function(markerListView) {
      this.mapControl.setContent(markerListView.domNode, 'search');
    }.bind(this),
    name: name,
    categories: categories
  });
};

HeaderBar.prototype.createShrinkButton = function(parent) {
  var shrinkButton = L.DomUtil.create('a', 'button icon-shrink full-icon-space', parent);
  // shrinkButton.innerHTML = '';
  L.DomEvent
    .on(shrinkButton, 'click', L.DomEvent.stopPropagation)
    .on(shrinkButton, 'click', function(e) {
      // Open
      this._collapse();
      _this._closeNewMarker();
      e.preventDefault();
    }, this.mapControl);
};

HeaderBar.prototype.focus = function() {
  if(this.searchArea) {
    this.searchArea.focus();
  }
};
