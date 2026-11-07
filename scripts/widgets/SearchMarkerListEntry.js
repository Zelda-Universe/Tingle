// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearchMarkerListEntry
// - searchEntry: [Object] The search entry with subject marker and metadata
//   - item: [Object] The subject marker object to render.
function SearchMarkerListEntry(searchEntry, opts) {
  opts = opts || {};
  this.searchEntry = searchEntry;
  MarkerListEntry.call(this, searchEntry.item, opts);
};

SearchMarkerListEntry.prototype = Object.create(MarkerListEntry.prototype);
SearchMarkerListEntry.prototype.constructor = SearchMarkerListEntry;

var markerLocationNameCache = Object.create(null);

SearchMarkerListEntry.prototype._initDOMElements = function(marker) {
  MarkerListEntry.prototype._initDOMElements.call(this, marker);
  this.domNode.addClass('search-marker-list-entry');
  if(marker.mapDestination && marker.iconURL) {
    this.iconNode.empty().append($('<img class="search-map-preview" alt="">').attr('src',marker.iconURL));
  } else if(marker.areaDestination || marker.markerCategoryTypeId == 3 || marker.categoryTypeId == 3) {
    // An area within a map (OoT's areas, other games' place labels): a square
    // tile like the map results, in gold so it isn't mistaken for one, with
    // the generic Point of Interest glyph.
    this.iconNode.empty().append(
      '<span class="search-area-preview" aria-hidden="true"><span class="icon-BotW_Points-of-Interest"></span></span>'
    );
  }

  this.detailsNode = this.domNode.find('.details');
  this.nameNode = this.detailsNode.find('.name');
  this.descriptionNode = this.detailsNode.find('.description');
  this.locationNode = $('<div class="location"></div>').appendTo(this.detailsNode);
  this.locationNode.text(getMarkerLocationName(marker));

  this._addHighlighting();
};

function getMarkerLocationName(marker) {
  if(Object.prototype.hasOwnProperty.call(markerLocationNameCache, marker.id)) {
    return markerLocationNameCache[marker.id];
  }

  var markerMap = zMap.maps.find(function(map) {
    return map.originalId == marker.mapId;
  });
  var mapName = markerMap ? (markerMap.mapName || markerMap.title) : '';
  var multipleMaps = zMap.maps.length > 1;

  // A map result is its own place; repeating its name says nothing.
  if(marker.mapDestination) return markerLocationNameCache[marker.id] = '';

  if(marker.markerCategoryTypeId == 3) {
    return markerLocationNameCache[marker.id] = multipleMaps ? mapName : '';
  }

  // "Area, Map", e.g. "Hyrule Field, Hyrule". Where the game has place names
  // (BotW, TotK), the same names as the marker's pills, finest first: "Place,
  // Area, Region", e.g. "Hickaly Woods, West Necluda, Dueling Peaks Tower
  // Region".
  var region = zMap.getMarkerRegion && zMap.getMarkerRegion(marker);
  var locationParts = [];
  var mapMarker = zMap.cachedMarkersById && zMap.cachedMarkersById[marker.id];
  var place = mapMarker && zMap.markerLabelLink ? zMap.markerLabelLink(mapMarker, 'place') : null;
  var area = mapMarker && zMap.markerLabelLink ? zMap.markerLabelLink(mapMarker, 'area') : null;
  if(place || area || region) {
    if(place) locationParts.push(place.label);
    if(area) locationParts.push(area.label);
    if(region) locationParts.push(region.name);
    else if(!area) {
      var nearestArea = getNearestMarkerAreaName(marker);
      if(nearestArea && nearestArea.toLowerCase() !== mapName.toLowerCase()) locationParts.push(nearestArea);
    }
  } else {
    var areaName = getNearestMarkerAreaName(marker) ||
      (zMap.getMarkerAreaName && zMap.getMarkerAreaName(marker)) || '';
    if(areaName && areaName.toLowerCase() !== mapName.toLowerCase()) locationParts.push(areaName);
  }
  if(multipleMaps && mapName) locationParts.push(mapName);

  return markerLocationNameCache[marker.id] = locationParts.join(', ');
}

// The area a POI is in, for games without area outlines: its nearest "Area
// Labels" label where the game has that level (so TotK says "Hyrule Field",
// not the tiny place next door), else its nearest label of any kind. Given
// the region the POI is in, only "Area Labels" inside that region count, and
// there may be none.
function getNearestMarkerAreaName(marker, region) {
  var mapMarker = zMap.cachedMarkersById[marker.id];
  if(!mapMarker || !zMap.nearestLabel) return '';
  var areaLevel = Object.keys(zMap.categories).find(function(id) {
    var category = zMap.categories[id];
    return category && /^Area Labels$/i.test(category.name || '');
  });
  if(region) {
    var inside = areaLevel && zMap.nearestLabelInRegion(mapMarker, areaLevel, region);
    return inside ? (inside.title || inside.name || '') : '';
  }
  var nearest = (areaLevel && zMap.nearestLabel(mapMarker, areaLevel)) || zMap.nearestLabel(mapMarker);
  return nearest ? (nearest.title || nearest.name || '') : '';
}

SearchMarkerListEntry.prototype._addHighlighting = function() {
  var fieldMatchGroups = groupObjects({
    arrayOfObjects: this.searchEntry.matches,
    groupPropertyName: "key",
    objectFormatter: function(matchObject) { return matchObject.indices; },
    groupFormatter: function(groupValues) { return groupValues[0]; }
  });

  this.nameNode.html(generateHighlightedText(this.marker.name, fieldMatchGroups["name"]));
  this.descriptionNode.html(generateHighlightedText(this.marker.description, fieldMatchGroups["description"]));
};
