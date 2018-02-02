// CategoryIconCompleted
// - opts: [Object]
//   - color: [String]
//   - img: [String] - Class name suffix for child category icon selection.

function CategoryIconCompleted(opts) {
  CategoryIcon.call(this, $.extend(true, {
    color: "purple",
    img: "checkmark"
  }, opts));
};

CategoryIconCompleted.prototype = Object.create(CategoryIcon.prototype);
CategoryIconCompleted.prototype.constructor = CategoryIconCompleted;
