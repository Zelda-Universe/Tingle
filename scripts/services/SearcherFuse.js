// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearcherFuse
// - opts: [Object]
//   - targetSearchMaterial: [Array] Objects to search through.
//   - searchOptions: [Object] (See fusejs website for more information.)

// http://fusejs.io/
function SearcherFuse(opts) {
  this._initSettings(opts);
  this._initCore(opts);
};

SearcherFuse.prototype._initSettings = function(opts) {
  this.targetSearchMaterial = Object.pop(opts, "targetSearchMaterial");

  this.searchOptions = $.extend({
    shouldSort: true,
    findAllMatches: true,
    includeScore: true,
    includeMatches: true,
    threshold: 0.6, // 0.0 perfect match, 1.0 any match
    location: 0, // content starting offset for pattern
    distance: 20, // pattern must be within (distance * threshold) number of characters away from location
    maxPatternLength: 32,
    minMatchCharLength: 3,
    keys: [
      "name",
      "description"
    ]
  }, opts);
};

SearcherFuse.prototype._initCore = function(opts) {
  this.core = new Fuse(this.targetSearchMaterial, this.searchOptions);
};

SearcherFuse.prototype.search = function(query) {
  return this.core.search(query);
};
