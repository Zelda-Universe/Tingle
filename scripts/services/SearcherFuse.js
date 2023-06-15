// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearcherFuse
// - options: [Object]
//   - name: [String] Component name used for event handling.
//   - targetSearchMaterial: [Array] Objects to search through.
//   - searchOptions: [Object] (See fusejs website for more information.)

// http://fusejs.io/

function SearcherFuse(options) {
  this.options = options || {};

  this._initSettings()        ;
  this._updateSearchSettings();
  this._initCore()            ;
  this._initHandlers()        ;
};

SearcherFuse.prototype._initSettings = function() {
  if (!this.options.name) {
    this.options.name = "search" + Date.now();
  }

  if (
        this.options.targetSearchMaterial
    &&  $.type(this.options.targetSearchMaterial) != "array"
  ) {
    delete this.options.targetSearchMaterial;
  }
};

SearcherFuse.prototype._updateSearchSettings = function() {
  this.options.core = $.extend(
    true,
    JSON.parse(ZConfig.getConfig(
      "searchDefaults-"   + this.options.name
    ) || '{}'),
    JSON.parse(ZConfig.getConfig(
      "searchOverrides-"  + this.options.name
    ) || '{}')
  );
}

SearcherFuse.prototype._initHandlers = function() {
  ZConfig.addHandlers([
      "searchDefaults-"   + this.options.name,
      "searchOverrides-"  + this.options.name,
    ],
    this._updateSearchSettings.bind(this)
  );
}

SearcherFuse.prototype._initCore = function() {
  this.core = new Fuse(
    this.options.targetSearchMaterial,
    this.options.core
  );
};

SearcherFuse.prototype.search = function(query) {
  return this.core.search(query);
};

if (
      typeof module         === "object"
  &&  typeof module.exports === "object"
) {
  module.exports = {
    SearcherFuse: SearcherFuse
  };
}
