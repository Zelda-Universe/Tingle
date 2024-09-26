// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

// Examples
//
// printCategoriesListOverview(zMap.categories);
// printCategoryTreeOverview(zMap.categoryRoots);
// printCategoryTreeOverviewChecked(zMap.categoryRoots);
// getCategoryTreeOverviewChecked(zMap.categoryRoots,(cat)=>!cat.checked)
// printCategoryTreeOverviewCheckedBrief(zMap.categoryRoots);
// zMap.mapControl._categoryMenu.computeChecks();

function printCategoriesListOverview(categories, filterFn = () => true) {
  console.log(
    "Categories List:\n" +
    zMap.categories
      .filter((category) => !!category)
      .filter(filterFn)
      .map(
        (category) =>
        `(${category.id}) ` +
        `${category.name.padEnd(27)} - ` +
        `${category.checked.toString().padEnd(5)} - ` +
        `${category.checkedUser.toString().padEnd(5)}`
      ).join("\n")
  );
};

function printCategoryTreeOverview(categoryTree, filterFn = () => true) {
  var message = "Categories Tree:\n";
  recurseTree(function(category) {
    if(!filterFn(category)) return;

    if(category.children) {
      var catChilLen = Object.entries(category.children).length;
    };

    message += '' +
      `(${category.id}) ` +
      `${category.name.padEnd(27)} - ` +
      `[${category.checked.toString().padEnd(5)}]` +
      (
        (catChilLen)
        ? ` - [${catChilLen}]`
        : ''
      ) +
      '\n'
    ;
    // '/' +
    // `UCh:[${
    //   category.checkedUser !== undefined
    //   ? category.checkedUser.toString().padEnd(5)
    //   : '?'
    // }] - ` +

    // `[${category.checked.toString().padEnd(5)}] - ` +
    // `[${category.children ? Object.entries(category.children).length.toString() : '0'}]` +
  }, categoryTree);
  console.log(message);
};

function getCategoryTreeOverviewChecked(categoryTree, filterFn = () => true) {
  var catChecks = [];

  recurseTree(
    function(category) {
      if(!filterFn(category)) return;

      catChecks.push(category.checked);
    },
    categoryTree
  );

  return catChecks;
};

function printCategoryTreeOverviewCheckedBrief(categoryTree, filterFn = () => true) {
  var catChecks = '';

  recurseTree(
    function(category) {
      if(!filterFn(category)) return;

      catChecks += (category.checked) ? 'C' : 'U';
    },
    categoryTree
  );

  console.log(catChecks);
};
