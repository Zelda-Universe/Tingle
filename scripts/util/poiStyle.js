// Shared Zelda POI styling. Existing category records and glyphs stay intact.

// A category given its own colour or icon in Map Settings.
function isCustomPOIStyle(category) {
  return !!category && (category.custom_style == 1 || category.custom_style === true || category.customStyle === true);
}

// The shapes Map Settings offers, and the built-in badge style each draws
// with (styles/poi.css): no shape is a bare glyph with an outline, like
// treasure's.
var POI_SHAPE_STYLES = { circle: 'interest', diamond: 'travel', square: 'location', arch: 'cave', none: 'treasure' };

function getPOIShape(category) {
  return isCustomPOIStyle(category) && POI_SHAPE_STYLES[category.shape] ? category.shape : null;
}

function isPOIHex(color) { return /^#[0-9a-f]{6}$/i.test(color || ''); }

// Its badge colour: the category's own, when styled in Map Settings (null
// keeps the built-in colour for its kind of badge). With no shape, the
// colour is the glyph's outline instead (getPOIStyleVars).
function getPOIFill(category) {
  return isCustomPOIStyle(category) && getPOIShape(category) !== 'none' && isPOIHex(category.color) ? category.color : null;
}

// Inline CSS for a badge styled in Map Settings: its fill (or outline, with no
// shape) and glyph colour. Empty for the built-in styles.
function getPOIStyleVars(category) {
  if(!isCustomPOIStyle(category)) return '';
  var css = '';
  if(isPOIHex(category.color)) css += (getPOIShape(category) === 'none' ? '--poi-outline: ' : '--poi-fill: ') + category.color + '; ';
  if(isPOIHex(category.glyph_color)) css += 'color: ' + category.glyph_color + '; ';
  return css;
}

// A category's name in the list: some read better than their database names,
// and a section's own markers are listed as "Other …" beside its categories.
function getPOIMenuName(category, records) {
  var id = String(category.id), name = category.name || '';
  if(id === '2134' && name === 'Tears') return "Dragon's Tears";
  if(String(category.container_id) === '4' && id === '1968' && name === 'Boss') return 'Bosses';
  if(!category.parent_id && (records || []).some(function(c) { return String(c.parent_id) === id; })) {
    return name === 'Point of Interest' ? 'Other POIs' : 'Other ' + name;
  }
  return name;
}
function getPOIGlyph(category) {
  // Styled in Map Settings: its own icon wins (scripts/zmapsettings.js).
  if(isCustomPOIStyle(category)) return category.img;
  var game = String(category.container_id || category.containerId);
  // Equipment's weapons show the Master Sword; chests' weapons keep the plain sword.
  if(game === '64' && String(category.id) === '64061') return 'OoT_Weapons';
  if(game === '64' && String(category.id) === '64064') return 'BotW_Food-n-Materials';
  if(game === '64' && String(category.id) === '64052') return 'BotW_Shrine-of-Resurrection';
  if ((game === '64' && String(category.id) === '64002') ||
      (game === '4' && String(category.id) === '1956') ||
      (game === '22' && String(category.id) === '2220')) return 'General_HeartPiece';
  if ((game === '4' || game === '22') &&
      (category.img === 'BotW_Treasure-Chest' || /^Treasure Chests?$/i.test(category.name || ''))) {
    return 'General_Chest';
  }
  return category.img;
}

function getPOIStyle(category) {
  // A shape given in Map Settings.
  var shape = getPOIShape(category);
  if(shape) return POI_SHAPE_STYLES[shape];
  if(category && String(category.container_id || category.containerId) === '64') {
    return {
      '64002': 'heart', '64001': 'relic', '64003': 'korok', '64004': 'heart', '64005': 'silver', '64006': 'memory', '64007': 'fairy-thought', '64008': 'song', '64021': 'treasure',
      '64022': 'treasure', '64023': 'treasure', '64024': 'treasure', '64025': 'treasure', '64026': 'treasure', '64027': 'treasure', '64028': 'treasure',
      '64061': 'treasure', '64062': 'treasure', '64063': 'treasure', '64064': 'treasure', '64065': 'treasure', '64066': 'treasure',
      '64031': 'location', '64032': 'location', '64033': 'location', '64034': 'cave', '64035': 'location', '64041': 'interest', '64042': 'enemy',
      '64071': 'enemy', '64072': 'enemy',
      '64043': 'interest', '64044': 'interest', '64045': 'interest', '64046': 'interest',
      '64051': 'travel', '64052': 'travel', '64053': 'travel'
    }[String(category.id)] || '';
  }
  // Path Lab, the paths test map: badges as the real games' have.
  if(category && String(category.container_id || category.containerId) === '90') {
    return {
      '9000': 'interest', '9001': 'treasure', '9002': 'interest', '9003': 'location',
      '9004': 'korok', '9005': 'memory', '9006': 'interest'
    }[String(category.id)] || '';
  }
  if(category && String(category.container_id || category.containerId) === '3') {
    return {
      // Dungeon Entrances, Warp Tiles, Flute Spots.
      '3051': 'travel', '3052': 'travel', '3053': 'travel',
      // Pieces of Heart, Heart Containers, Bottles, Pendants & Crystals.
      '3001': 'heart', '3002': 'heart', '3003': 'memory', '3004': 'song',
      '3061': 'treasure', '3062': 'treasure', '3063': 'treasure', '3064': 'treasure', '3065': 'treasure',
      '3021': 'treasure', '3022': 'treasure', '3023': 'treasure', '3024': 'treasure', '3025': 'treasure',
      '3031': 'location', '3032': 'location', '3033': 'location', '3034': 'cave', '3035': 'location',
      '3041': 'interest', '3071': 'enemy'
    }[String(category.id)] || '';
  }
  if(category && String(category.container_id || category.containerId) === '4') {
    return {
      '1951': 'interest', '1952': 'interest', '1953': 'interest', '1954': 'interest',
      '1956': 'heart', '1957': 'korok', '1958': 'memory',
      '1960': 'treasure', '1961': 'treasure', '1962': 'treasure',
      '1964': 'location', '1965': 'location', '1966': 'location',
      '1969': 'location', '1968': 'enemy',
      // Warp Points, Telephone Booths, Owl Statues, Li'l Devil, Golden Leaves.
      '1970': 'travel', '1971': 'interest', '1972': 'interest', '1973': 'interest', '1974': 'memory',
      // Dungeon Items, Stone Beaks, Instruments, Heart Containers, Treasure Chests, Mini-Bosses.
      '1975': 'treasure', '1976': 'treasure', '1977': 'song', '1978': 'heart', '1979': 'treasure', '1980': 'enemy'
    }[String(category.id)] || '';
  }
  if(category && String(category.container_id || category.containerId) === '22') {
    return {
      '2232': 'travel', '2220': 'heart', '2221': 'memory', '2231': 'relic',
      '2211': 'korok', '2230': 'cave', '2233': 'location',
      '2210': 'interest', '2222': 'interest', '2278': 'treasure'
    }[String(category.id)] || '';
  }
  if(category && String(category.container_id || category.containerId) === '19') {
    var botwId = String(category.id);
    if(!botwId.startsWith('19')) return '';
    if(botwId === '1924') return 'travel';
    if(botwId === '1927') return 'location';
    if(botwId === '1945') return 'treasure';
    if(botwId === '1920') return 'location';
    if(botwId === '1930') return 'enemy';
    if(botwId === '1901') return 'interest';
    return getPOIStyle(Object.assign({}, category, {
      container_id: '21', id: '21' + botwId.substring(2),
      parent_id: category.parent_id ? '21' + String(category.parent_id).substring(2) : null
    }));
  }
  if(!category || String(category.container_id || category.containerId) !== '21') return '';
  var id = String(category.id);
  if(['2123', '2125', '2126', '2127'].includes(id)) return 'travel';
  if(id === '2116') return 'korok';
  if(id === '2134') return 'memory';
  if(id === '2169') return 'relic';
  if(id === '2150' || id === '2152') return 'location-round';
  if(id === '2151') return 'cave';
  if(['2121', '2122', '2124', '2137', '2138', '2174', '2175'].includes(id)) return 'location';
  if(String(category.parent_id || category.parentId) === '2130' || id === '2171') return 'enemy';
  if(/^Treasure Chest/.test(category.name || '') ||
    ['2103', '2104', '2105', '2106', '2115', '2148', '2156', '2168', '2172'].includes(id)) return 'treasure';
  if(String(category.parent_id || category.parentId) === '2101') return 'interest';
  return '';
}

// Leaf categories the list would otherwise leave out: not labels (type 3:
// region and place names, set in Settings), nor sections.
function isPOIListedCategory(c) {
  return !!c.parent_id && String(c.marker_category_type_id) !== '3' && !['2162', '2204'].includes(String(c.parent_id));
}

// A layout saved in Map Settings (menu_section, menu_order): its sections in
// order. A category not in one goes with its siblings (or its section's own
// "Other …" entry), else in the last section.
function getPOISavedLayout(records) {
  var placed = records.filter(function(c) { return c.menu_section; }).sort(function(a, b) {
    return (Number(a.menu_order) || 0) - (Number(b.menu_order) || 0) || Number(a.id) - Number(b.id);
  });
  if(!placed.length) return null;
  var groups = [], byTitle = {};
  placed.forEach(function(c) {
    if(!byTitle[c.menu_section]) groups.push(byTitle[c.menu_section] = { title: c.menu_section, categories: [] });
    byTitle[c.menu_section].categories.push(c);
  });
  records.forEach(function(c) {
    if(c.menu_section || !isPOIListedCategory(c)) return;
    var has = function(test) { return groups.find(function(g) { return g.categories.some(test); }); };
    var home = has(function(other) { return String(other.id) === String(c.parent_id); }) ||
      has(function(other) { return String(other.parent_id) === String(c.parent_id); }) || groups[groups.length - 1];
    home.categories.push(c);
  });
  return groups;
}

// The list's sections for Map Settings: as the list shows them, or for a game
// listed by its database sections, each of those with its categories (a
// section with none listed as itself).
function getPOIMenuLayout(categories) {
  var records = Object.values(categories || {});
  var groups = getPOICategoryGroups(records);
  if(groups) return groups.filter(function(g) { return g.categories.length; });
  return records.filter(function(c) { return !c.parent_id && String(c.marker_category_type_id) !== '3'; })
    .sort(function(a, b) { return Number(a.id) - Number(b.id); })
    .map(function(root) {
      var children = records.filter(function(c) { return String(c.parent_id) === String(root.id); })
        .sort(function(a, b) { return Number(a.id) - Number(b.id); });
      return { title: root.name, categories: children.length ? children : [root] };
    });
}

function getPOICategoryGroups(categories) {
  var records = Object.values(categories || {});
  var saved = getPOISavedLayout(records);
  if(saved) return saved;
  var sectioned = records.some(function(c) { return String(c.container_id) === '64'; }) ? '64' :
    (records.some(function(c) { return String(c.container_id) === '3'; }) ? '3' : null);
  if(sectioned) {
    // Label categories (type 3: place names) are set in Settings, not listed.
    // Sections in BotW's and TotK's order: Travel, Collectibles, Locations,
    // Points of Interest, then Treasure; any others after. ALttP's are laid
    // out as OoT's.
    var sectionOrder = sectioned === '64' ? ['64050', '64000', '64030', '64040', '64060', '64020'] :
      ['3050', '3000', '3030', '3040', '3060', '3020', '3070'];
    var rank = function(c) { var i = sectionOrder.indexOf(String(c.id)); return i === -1 ? sectionOrder.length : i; };
    return records.filter(function(c) { return !c.parent_id && String(c.marker_category_type_id) !== '3'; })
      .sort(function(a, b) { return rank(a) - rank(b); }).map(function(root) {
      return { title: root.name, categories: records.filter(function(c) { return c.parent_id === root.id; }).sort(function(a,b) {
        // Heart Pieces and Containers together; others in the order added.
        var order=['64002','64004','64001','64003','64005','64006','64007','64008'];
        if(String(root.id)==='64020') order=['64022','64023','64024','64025','64026','64027','64028','64021'];
        if(String(root.id)==='64060') order=['64061','64062','64063','64064','64065','64066'];
        if(String(root.id)==='3020') order=['3022','3023','3024','3025','3021'];
        return order.indexOf(String(a.id))-order.indexOf(String(b.id));
      }) };
    });
  }
  var game = records.some(function(c) { return String(c.container_id) === '21'; }) ? '21' :
    (records.some(function(c) { return String(c.container_id) === '19'; }) ? '19' :
      (records.some(function(c) { return String(c.container_id) === '22'; }) ? '22' :
        (records.some(function(c) { return String(c.container_id) === '4'; }) ? '4' : null)));
  if(!game) return null;
  var groups = game === '4' ? [
    ['Travel Points', ['1970']],
    ['Collectibles', ['1956', '1978', '1957', '1958', '1974', '1977']],
    ['Locations', ['1964', '1965', '1966', '1969']],
    ['Points of Interest', ['1972', '1971', '1973', '1951', '1952', '1953', '1954']],
    ['Enemies & Bosses', ['1968', '1980']],
    ['Treasure', ['1975', '1960', '1961', '1962', '1976', '1979']],
    ['Misc', []]
  ] : game === '22' ? [
    ['Travel Gates', ['2232']],
    ['Collectibles', ['2220', '2221', '2231', '2211']],
    ['Locations', ['2230', '2233']],
    ['Points of Interest', ['2210', '2222']],
    ['Treasure', ['2278']],
    ['Misc', []]
  ] : game === '19' ? [
    ['Travel Gates', ['1923', '1925', '1924', '1926']],
    ['Collectibles', ['1916', '1934']],
    ['Locations', ['1938', '1937', '1921', '1922', '1927', '1920']],
    ['Points of Interest', ['1949', '1936', '1955', '1935', '1946', '1901']],
    ['Enemies & Bosses', ['1932', '1947', '1941', '1942', '1940', '1939', '1931', '1933', '1930']],
    ['Treasure', ['1944', '1943']],
    ['Misc', ['1948', '1903', '1904', '1905', '1906', '1945', '1911', '1912', '1913', '1914', '1915']]
  ] : [
    ['Travel Gates', ['2123', '2125', '2126', '2127']],
    ['Collectibles', ['2116', '2134', '2169']],
    ['Locations', ['2138', '2137', '2124', '2150', '2151', '2152', '2121', '2122', '2175', '2174']],
    ['Points of Interest', ['2149', '2167', '2136', '2135', '2146', '2155', '2173']],
    ['Enemies & Bosses', ['2132', '2153', '2154', '2160', '2170', '2147', '2141', '2142', '2140', '2139', '2131', '2133', '2161', '2171']],
    ['Treasure', ['2158', '2159', '2157', '2143', '2144', '2145']],
    ['Misc', ['2148', '2168', '2156', '2103', '2104', '2105', '2106', '2172', '2111', '2112', '2113', '2114', '2115']]
  ];
  var seen = new Set();
  var result = groups.map(function(group) {
    return { title: group[0], categories: group[1].map(function(id) {
      return records.find(function(c) { return String(c.id) === id; });
    }).filter(function(c) {
      if(!c) return false;
      seen.add(String(c.id));
      return true;
    }) };
  });
  // Preserve future leaf categories rather than silently dropping them.
  records.forEach(function(c) {
    // Label categories (type 3: region and place names) are set in Settings.
    if(isPOIListedCategory(c) && !seen.has(String(c.id))) {
      result[result.length - 1].categories.push(c);
    }
  });
  return result;
}
