const fs = require('fs');
const path = require('path');

test('category settings keep descriptions separate and fields in reading order', () => {
  const source = fs.readFileSync(path.join(__dirname, '../scripts/zmapsettings.js'), 'utf8');
  const form = source.slice(source.indexOf("'<h3 class=\"text-center\">' + (isNew ? 'New Category'"), source.indexOf('var form = $(page).find', source.indexOf("'<h3 class=\"text-center\">' + (isNew ? 'New Category'")));
  const fields = ["Field('Name'", "Field('Section'", "Field('Page Description'", "Field('SEO Description'",
    'map-settings-label">Shape', 'map-settings-colors', 'map-settings-label">Icon', 'name="visible"', "Field('Summary'"];
  let previous = -1;
  fields.forEach(field => {
    const position = form.indexOf(field);
    expect(position).toBeGreaterThan(previous);
    previous = position;
  });
});
