// Logo
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - headerHeight: [Number]

function Logo(opts) {
    this._setDebugNames();
  this._initSettings(opts);
  this._initTemplate();
  this._initDOMElements(opts);
  this._setupUserInputListener(opts);
  this._updateState();
};

Logo.prototype._initDOMElements = function(opts) {
  this.domNode = $('' +
    '<ul class="category-selection-list">' +
    '</ul>'
  );
  this.menuEntryContainerTemplate = '' +
    '<li class="category-selector">' +
    '</li>'
  ;
	
  var logoDiv = L.DomUtil.create('img', 'img-responsive center-block', opts.parent);
  logoDiv.src  = 'images/zmaps_white.png';
  logoDiv.style.height = (opts.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator
  
  this._addCategoryMenuEntry(
    new CategoryButtonCompleted({
        onToggle: opts.onCompletedToggle,
        toggledOn: opts.showCompleted
      }
    )
  );
};

Logo.prototype._addCategoryMenuEntry = function(categoryButton) {
  var menuEntry = $(this.menuEntryContainerTemplate);
  menuEntry.append(categoryButton.domNode);
  this.domNode.append(menuEntry);
};