// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

ZConfig = {
  options: {},
  getConfig: function(propertyName) {
    return this.options[propertyName];
  },
  setConfig: function(propertyName, defaultValue) {
    this.options[propertyName] = getSetOrDefaultValues([
        getUrlParam(propertyName),
        localStorage[propertyName],
        getCookie(propertyName),
      ],
      defaultValue
    );
  }
};

// Main config set-up with defaults

// "exact", "focus" (Jason's default)
ZConfig.setConfig("categorySelectionMethod", "focus");
ZConfig.setConfig("tilesBaseURL", "https://zeldamaps.com/tiles/");
ZConfig.setConfig("zoomDirectories", 'false');
ZConfig.setConfig("tileNameFormat", (
  (ZConfig.getConfig("zoomDirectories") == 'true')
  ? '{z}/{x}_{y}'
  : '{z}_{x}_{y}'
));
