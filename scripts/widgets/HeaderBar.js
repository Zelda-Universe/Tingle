// MIT Licensed
// by Pysis(868)
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
    var headerDivLeft = L.DomUtil.create('div', 'col-xs-2 full-icon-space-container account-button-container', headerDiv);
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
  L.DomUtil.addClass(headerDivMid, 'header-search-container');
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
  this.ensureMobileSearchResultsPanel();

  this.searchArea = new SearchArea({
    parent: parent,
    markerListViewBuiltHandler: function(markerListView) {
      if(this.mapControl.viewStyleBottomSlide) {
        this.showMobileSearchResults(markerListView);
      } else {
        this.rememberSearchSelection();
        this._searchListView = markerListView;
        this.mapControl.setContent(markerListView.domNode, 'search');
      }
    }.bind(this),
    markerSearchClick: this.selectSearchMarker.bind(this),
    resultsFocusedHandler: this.reopenMobileSearchResults.bind(this),
    resultsClearedHandler: function() {
      this.hideMobileSearchResults();
      this.restoreSearchSelection();
    }.bind(this),
    name: name,
    categories: categories
  });
};

HeaderBar.prototype.rememberSearchSelection = function() {
  var control=this.mapControl,type=control.getContentType();
  if(type==='search') return;
  this._searchSelection=null;
  if(!/^m\d+$/.test(type || '') && !/^area-/.test(type || '') && !/^category-\d+$/.test(type || '')) return;
  var page=control._contents.querySelector('.menu-cat-content-inner');
  if(!page) return;
  this._searchSelection={type:type,content:$(page).children().clone(true,true),
    scrollTop:control._contents.scrollTop,area:control.zMap.selectedArea,
    category:control.zMap.selectedCategory,
    backButton:control._contents.querySelector(':scope > a.back-button[aria-label^="Back to"]')};
};

HeaderBar.prototype.restoreSearchSelection = function() {
  var control=this.mapControl,selection=this._searchSelection;
  this._searchSelection=null;
  if(control.getContentType()!=='search') return;
  if(!selection) {control.resetContent();return;}
  control.zMap.selectedArea=selection.area;
  control.zMap.selectedCategory=selection.category;
  if(/^category-\d+$/.test(selection.type)) control._nextPageBack=control.zMap._categoryPageBackAction(control);
  control._skipNextSlide=true;
  control.setContent(selection.content,selection.type);
  if(selection.backButton) control._contents.insertBefore(selection.backButton,control._contents.firstChild);
  if(/^area-/.test(selection.type) || /^category-\d+$/.test(selection.type)) control._contents.querySelector('.menu-cat-content-inner').classList.add('area-detail-page');
  control._contents.scrollTop=selection.scrollTop;
  control.zMap.updateUrl();
};

HeaderBar.prototype.ensureMobileSearchResultsPanel = function() {
  if(this.mapControl.viewStyleBottomSlide && !this.mobileSearchResultsPanel) {
    this.mobileSearchResultsPanel = L.DomUtil.create(
      'div',
      'mobile-search-results-panel',
      this.mapControl._map._controlCorners.topleft
    );
    this.mobileSearchResultsPanel.setAttribute('aria-label', 'Search results');
    L.DomEvent.disableClickPropagation(this.mobileSearchResultsPanel);
    L.DomEvent.disableScrollPropagation(this.mobileSearchResultsPanel);
    L.DomEvent.on(
      this.mobileSearchResultsPanel,
      'touchstart touchmove',
      L.DomEvent.stopPropagation
    );
  }

};

HeaderBar.prototype.showMobileSearchResults = function(markerListView) {
  if(!this.mobileSearchResultsPanel) return;
  if(markerListView.domNode[0].parentNode !== this.mobileSearchResultsPanel) {
    $(this.mobileSearchResultsPanel).empty().append(markerListView.domNode);
  }
  L.DomUtil.addClass(this.mobileSearchResultsPanel, 'open');
};

HeaderBar.prototype.reopenMobileSearchResults = function() {
  if(
    !this.mobileSearchResultsPanel ||
    !this.searchArea.markerSearchField._getQuery().trim() ||
    !this.mobileSearchResultsPanel.querySelector('.marker-list-entry')
  ) return;
  L.DomUtil.addClass(this.mobileSearchResultsPanel, 'open');
};

HeaderBar.prototype.hideMobileSearchResults = function() {
  if(!this.mobileSearchResultsPanel) return;
  L.DomUtil.removeClass(this.mobileSearchResultsPanel, 'open');
};

HeaderBar.prototype.selectSearchMarker = function(marker) {
  this._searchSelection=null;
  this.hideMobileSearchResults();
  if(this.searchArea) this.searchArea.markerSearchField.searchInput.blur();
  this._returnToSearchResults();

  if(marker.areaDestination || marker.markerCategoryTypeId == 3 || marker.categoryTypeId == 3) {
    zMap.navigateToArea(marker);
    return;
  }

  zMap.navigateToMarker(marker.id);
};

// On desktop the results are a page in the sidebar, which the marker's (or
// area's) page replaces: it gets a Back button to them (ZLayers _setContent).
// Changing pages empties the sidebar with jQuery, which also drops the result
// rows' click handlers, so the list is detached and kept, not rebuilt.
HeaderBar.prototype._returnToSearchResults = function() {
  var control = this.mapControl, list = this._searchListView;
  if(control.viewStyleBottomSlide || control.getContentType() !== 'search' || !list) return;
  var scrollTop = control._contents.scrollTop;
  $(list.domNode).detach();
  control.returnNextPageTo({ search: { list: list, scrollTop: scrollTop } });
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
