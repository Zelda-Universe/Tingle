// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// CategoryIcon
// - opts: [Object]
//   - color: [String]
//   - img: [String] - Class name suffix for child category icon selection.

function CategoryIcon(opts) {
  opts = opts || {};

  this._initSettings(opts);
  this._initDOMElements(opts);
};

CategoryIcon.prototype._initSettings = function(item) {
  this.color = item.color;
  var category=item.category || item;
  this.category = category;
  this.poiStyle = getPOIStyle(category);
  this.isEoW = String(category.container_id || category.containerId) === '22';

  this.iconClass = getSetOrDefaultValues([
    item.iconClass,
    item.image,
    item.img // For automatic category detection. Split code out and remove this in the generic class later
  ]);

  this.iconURL = item.iconURL;
  if(!this.iconURL && item.iconURLFn) {
    this.iconURL = item.iconURLFn();
  }

  this.iconTitle = getSetOrDefaultValues([
    item.iconTitle,
    item.title,
    item.name
  ]);
};

CategoryIcon.prototype._initDOMElements = function() {
  if(this.iconURL) {
    this.domNode = $('' +
      '<img class="" src="' + this.iconURL + '" title="' + this.iconTitle + '">'
    );
  } else {
    this.domNode = $('' +
      '<span class="icon-background circle category-icon icon-' + this.iconClass + '"></span>'
    );
  }

  this.domNode.css('background-color' , this.color);
  this.domNode.css('border-color'     , this.color);
  if(this.poiStyle && !this.iconURL) this.domNode.addClass('poi-badge poi-' + this.poiStyle);
  // The colours given in Map Settings (fill or outline, and glyph).
  var vars = typeof getPOIStyleVars === 'function' ? getPOIStyleVars(this.category) : '';
  if(vars) this.domNode[0].style.cssText += vars;
  if(this.poiStyle && this.isEoW) this.domNode.addClass('poi-eow');
};
