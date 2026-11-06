// Shared Zelda POI styling. Existing category records and glyphs stay intact.
function getPOIStyle(category) {
  if(category && String(category.container_id) === '64') return category.poiStyle || '';
  if(category && String(category.container_id || category.containerId) === '4') {
    return {
      '1951': 'interest', '1952': 'interest', '1953': 'interest', '1954': 'interest',
      '1956': 'heart', '1957': 'korok', '1958': 'memory',
      '1960': 'treasure', '1961': 'treasure', '1962': 'treasure',
      '1964': 'location', '1965': 'location', '1966': 'location',
      '1969': 'location', '1968': 'enemy'
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

function getPOICategoryGroups(categories) {
  var records = Object.values(categories || {});
  if(records.some(function(c) { return String(c.container_id) === '64'; })) {
    return records.filter(function(c) { return !c.parent_id; }).map(function(root) {
      return { title: root.name, categories: records.filter(function(c) { return c.parent_id === root.id; }).sort(function(a,b) {
        var order=['64002','64001','64003'];
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
    ['Collectibles', ['1956', '1957', '1958']],
    ['Locations', ['1964', '1965', '1966', '1969']],
    ['Points of Interest', ['1951', '1952', '1953', '1954']],
    ['Enemies & Bosses', ['1968']],
    ['Treasure', ['1960', '1961', '1962']],
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
    if(c.parent_id && String(c.marker_category_type_id) !== '3' &&
        !['2162', '2204'].includes(String(c.parent_id)) && !seen.has(String(c.id))) {
      result[result.length - 1].categories.push(c);
    }
  });
  return result;
}
