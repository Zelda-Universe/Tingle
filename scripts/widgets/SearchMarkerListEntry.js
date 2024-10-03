// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearchMarkerListEntry
// - searchEntry: [Object] The search entry with subject marker and metadata
//   - item: [Object] The subject marker object to render.
// - opts: [Object]
//   - showScoreNearIcon: [Boolean]
//   - showScoreInDetails: [Boolean]

function SearchMarkerListEntry(searchEntry, opts) {
  opts = opts || {};
  this.searchEntry = searchEntry;
  MarkerListEntry.call(this, searchEntry.item, opts);
};

SearchMarkerListEntry.prototype = Object.create(MarkerListEntry.prototype);
SearchMarkerListEntry.prototype.constructor = SearchMarkerListEntry;

SearchMarkerListEntry.prototype._initSettings = function(marker, opts) {
  MarkerListEntry.prototype._initSettings.call(this, marker, opts);
  this.showScoreNearIcon = getSetOrDefaultValue(opts.showScoreNearIcon, true);
  this.showScoreInDetails = getSetOrDefaultValue(opts.showScoreInDetails, true);
};

SearchMarkerListEntry.prototype._initDOMElements = function(marker) {
  MarkerListEntry.prototype._initDOMElements.call(this, marker);

  this.detailsNode = this.domNode.find('.details');
  this.nameNode = this.detailsNode.find('.name');
  this.descriptionNode = this.detailsNode.find('.description');

  this._addHighlighting();

  // Inverting the score reasoning:
  // Assuming people think the bigger number/closer to 1 is the better / more similar/accurate match.
  // Also treating as a percentage to help convey that same feeling more strongly.
  this._addSearchScoreDOMElements((1 - this.searchEntry.score) * 100);
};

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

SearchMarkerListEntry.prototype._addSearchScoreDOMElements = function(score) {
  this.searchScoreNodeTemplate = '' +
    '<div class="searchScore">' +
    '</div>' +
  '';

  if(this.showScoreNearIcon) {
    this.iconNode.addClass('relativeContainer');
    this.iconNode.append(
      $(this.searchScoreNodeTemplate).append(new ProgressBar({
        progressPercentage: score
      }).domNode)
    );
  }

  if(this.showScoreInDetails) {
    this.detailsNode.addClass('relativeContainer');
    this.detailsNode.append(
      $(this.searchScoreNodeTemplate).text(Number.roundDecimal(score, 1) + "%")
    );
  }
};
