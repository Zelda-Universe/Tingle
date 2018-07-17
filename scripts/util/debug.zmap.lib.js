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
