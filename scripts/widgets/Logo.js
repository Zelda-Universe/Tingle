// Logo
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - headerHeight: [Number]

function Logo(opts) {
  this._initDOMElements(opts);
};

Logo.prototype._initDOMElements = function(opts) {
  var logoDiv = L.DomUtil.create('img', 'img-responsive center-block', opts.parent);
  logoDiv.src  = 'images/zmaps_white.png';
  logoDiv.style.height = (opts.headerHeight - 2) + 'px'; // Need to remove 2px because of the separator
  logoDiv.style.textAlign = 'center';//TODO: move to CSS
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
  this._addCategoryMenuEntry(
    new CategoryButtonCompleted({
        onToggle: opts.onCompletedToggle,
        toggledOn: opts.showCompleted
      }
    )
  );
  // this.categoryButtonCompleted.domNode.on('toggle', opts.onCompletedToggle.bind(this.categoryButtonCompleted));
};
 
Logo.prototype._addCategoryMenuEntry = function(categoryButton) {
  var menuEntry = $(this.menuEntryContainerTemplate);
  menuEntry.append(categoryButton.domNode);
  this.domNode.append(menuEntry);
};