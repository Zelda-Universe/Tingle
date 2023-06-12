// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// SearcherFuse
// - opts: [Object]
//   - targetSearchMaterial: [Array] Objects to search through.
//   - searchOptions: [Object] (See fusejs website for more information.)

// http://fusejs.io/
function SearcherFuse(opts) {
  this._initSettings(opts)    ;
  this._updateSearchSettings();
  this._initCore(opts)        ;
  this._initHandlers()        ;
};

SearcherFuse.prototype._initSettings = function(opts) {
  if (opts.name) {
    this.name = opts.name;
  }
  if (!this.name) {
    this.name = "search" + Date.now();
  }

  if (
        opts.targetSearchMaterial
    &&  $.type(opts.targetSearchMaterial) == "array"
  ) {
    this.targetSearchMaterial = Object.pop(opts, "targetSearchMaterial");
  }

  if(opts.searchOptions) {
    this.searchOptionsOpts = opts.searchOptions;
  }
  if(!this.searchOptionsOpts) {
    this.searchOptionsOpts = {};
  }
};

SearcherFuse.prototype._updateSearchSettings = function() {
  // ZConfig.resetConfigValue("searchDefaults-"  + this.name);
  // ZConfig.resetConfigValue("searchOverrides-" + this.name);

  this.searchOptions = $.extend(
    true,
    JSON.parse(ZConfig.getConfig("searchDefaults-"   + this.name) || '{}'),
    this.searchOptionsOpts,
    JSON.parse(ZConfig.getConfig("searchOverrides-"  + this.name) || '{}')
  );
}

SearcherFuse.prototype._initHandlers = function() {
  ZConfig.addHandler("searchDefaults-" + this.name,  this._updateSearchSettings.bind(this));
  ZConfig.addHandler("searchOverrides-" + this.name, this._updateSearchSettings.bind(this));
}

SearcherFuse.prototype._initCore = function(opts) {
  this.core = new Fuse(this.targetSearchMaterial, this.searchOptions);
};

SearcherFuse.prototype.search = function(query) {
  return this.core.search(query);
};
