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
};
