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

var markerAreaLabelsCache = Object.create(null);
var markerLocationNameCache = Object.create(null);

SearchMarkerListEntry.prototype._initDOMElements = function(marker) {
  MarkerListEntry.prototype._initDOMElements.call(this, marker);
  this.domNode.addClass('search-marker-list-entry');
  if(marker.mapDestination && marker.iconURL) {
    this.iconNode.empty().append($('<img class="search-map-preview" alt="">').attr('src',marker.iconURL));
  } else if(marker.markerCategoryTypeId == 3 || marker.categoryTypeId == 3) {
    var labelCategory = this.categories[marker.categoryId || marker.markerCategoryId];
    var labelGroup = labelCategory && this.categories[labelCategory.parent_id];
    this.categoryIcon = new CategoryIcon({
      iconClass: (labelCategory && labelCategory.img) || (labelGroup && labelGroup.img) || 'General_Map',
      color: (labelCategory && labelCategory.color) || (labelGroup && labelGroup.color)
    });
    this.iconNode.empty().append(this.categoryIcon.domNode);
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
  var mapName = markerMap ? markerMap.title : '';
  var multipleMaps = zMap.maps.length > 1;

  if(marker.markerCategoryTypeId == 3) {
    return markerLocationNameCache[marker.id] = multipleMaps ? mapName : '';
  }

  var areaName = getNearestMarkerAreaName(marker);
  var locationParts = [];
  if(multipleMaps && mapName) locationParts.push(mapName);
  if(areaName && areaName.toLowerCase() !== mapName.toLowerCase()) {
    locationParts.push(areaName);
  }

  return markerLocationNameCache[marker.id] = locationParts.join(' - ');
}

function getNearestMarkerAreaName(marker) {
  var mapMarker = zMap.cachedMarkersById[marker.id];
  if(!mapMarker) return '';
  var markerPosition = mapMarker.getLatLng();
  var cacheKey = marker.mapId + ':' + marker.submapId;
  var labels = markerAreaLabelsCache[cacheKey];
  if(!labels) {
    labels = markerAreaLabelsCache[cacheKey] = zMap.getMarkers()
      .filter(function(candidate) {
        return (
          candidate.categoryTypeId == 3 &&
          candidate.mapId == marker.mapId &&
          candidate.submapId == marker.submapId &&
          candidate.title
        );
      });
  }

  var nearestLabel = labels.reduce(function(nearest, candidate) {
    var position = candidate.getLatLng();
    var distance = Math.hypot(
      position.lng - markerPosition.lng,
      position.lat - markerPosition.lat
    );
    return !nearest || distance < nearest.distance
      ? { title: candidate.title, distance: distance }
      : nearest;
  }, null);

  return nearestLabel ? nearestLabel.title : '';
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
