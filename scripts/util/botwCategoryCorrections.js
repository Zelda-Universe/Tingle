// Audited legacy BotW entries assigned to the generic POI category.
// Keep IDs, coordinates, completion records and source data unchanged.
var BOTW_CATEGORY_CORRECTIONS = {
  '1503': '1944', // Buried chest: Knight's Bow (equipment).
  '1396': '1943', '326': '1943', '324': '1943', '323': '1943', '322': '1943',
  '1398': '1945', '1045': '1945', // Blupees.
  '216': '1938', // Serenne Stable.
  '159': '1948', '114': '1948', '73': '1948', '72': '1948', // Cooking pots.
  '170': '1936', '127': '1936', // Cracked walls.
  '153': '1903', '117': '1903', // Tree branches and Woodcutter's Axe.
  '149': '1915', '147': '1915', '131': '1915', '65': '1915' // Mineral deposits.
};

var BOTW_ENEMY_CATEGORY_CORRECTIONS = {
  '474': '1940', '254': '1940' // Lynels assigned to the generic Enemies category.
};

function ensureBotWNPCCategory(categories) {
  if(!categories.some(function(c) { return String(c.container_id) === '19'; }) ||
    categories.some(function(c) { return String(c.id) === '1955'; })) return categories;
  return categories.concat([{
    id: '1955', parent_id: '1901', container_id: '19', name: 'NPCs',
    marker_category_type_id: '1', default_checked: true, visible: true,
    img: 'TotK_Npc', color: '#ffad47', visible_zoom: '6'
  }]);
}

function correctBotWMarkerCategory(marker) {
  if(!marker || String(marker.mapId) !== '19') return marker;
  var source = String(marker.markerCategoryId);
  if((source === '1901' && String(marker.id) === '331') ||
    (source === '1935' && ['377', '229'].includes(String(marker.id)))) {
    return Object.assign({}, marker, { markerCategoryId: '1955' });
  }
  var corrections = source === '1901' ? BOTW_CATEGORY_CORRECTIONS :
    (source === '1930' ? BOTW_ENEMY_CATEGORY_CORRECTIONS : {});
  var category = corrections[String(marker.id)];
  return category ? Object.assign({}, marker, { markerCategoryId: category }) : marker;
}
