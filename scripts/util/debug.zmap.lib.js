// MIT Licensed
// Copyright (c) 2017-2024 Pysis(868)
// https://choosealicense.com/licenses/mit/

function printCategoriesListOverview() {
  console.log(
    categories
      .filter((cat) => !!cat)
      .map((cat) =>
        `${cat.name.padEnd(27)} - ` +
        `${cat.checked.toString().padEnd(5)} - ` +
        `${cat.userChecked.toString().padEnd(5)}`
      ).join("\n")
  );
};
