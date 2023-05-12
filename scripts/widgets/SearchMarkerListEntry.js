// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearchMarkerListEntry
// - searchEntry: [Object] The search entry with subject marker and metadata
//   - item: [Object] The subject marker object to render.
// - opts: [Object]
//   - showScoreNearIcon: [Boolean]
//   - showScoreInDetails: [Boolean]

function SearchMarkerListEntry(opts) {
  opts = opts || {};
  this.searchEntry = opts.marker;
  opts.marker = this.searchEntry.item;

  this._initSettings(opts);

  MarkerListEntry.call(this, opts);
};

SearchMarkerListEntry.prototype = Object.create(MarkerListEntry.prototype);
SearchMarkerListEntry.prototype.constructor = SearchMarkerListEntry;

SearchMarkerListEntry.prototype._initSettings = function(opts) {
  this.showScoreNearIcon = getSetOrDefaultValue(opts.showScoreNearIcon, true);
  this.showScoreInDetails = getSetOrDefaultValue(opts.showScoreInDetails, true);
};

SearchMarkerListEntry.prototype._initDOMElements = function(opts) {
  MarkerListEntry.prototype._initDOMElements.call(this, opts);

  this.detailsNode = this.domNode.find('.details');
  this.titleNode = this.detailsNode.find('.title');
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

  this.titleNode.html(generateHighlightedText(this.searchEntry.item.name, fieldMatchGroups["name"]));
  this.descriptionNode.html(generateHighlightedText(this.searchEntry.item.description, fieldMatchGroups["description"]));
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
