// The lines between area exits on one version (Child or Adult) of the Hyrule
// map, from connections.json. Each end names an area label and a position
// inside its artwork; the site turns that into map coordinates from the
// label's bounds, so lines follow the areas when the layout changes. Links to
// an area that isn't on this version (Hyrule Castle on Adult, Ganon's Castle
// on Child) are left out.
const data = require('./connections.json');

module.exports = function connectionsFor(placeLabels, areaName, age) {
  const onMap = new Set(placeLabels.filter(label => label.bounds).map(label => label.name));
  // Some areas have different Adult artwork, with their exits elsewhere.
  const exits = age === 'Adult' ? Object.assign({}, data.exits, data.adultExits) : data.exits;
  const end = name => {
    const [region, u, v] = exits[name];
    return [areaName(region), u, v];
  };
  return data.links
    .map(([from, to, route]) => ({ from: end(from), to: end(to), route }))
    .filter(link => onMap.has(link.from[0]) && onMap.has(link.to[0]));
};
