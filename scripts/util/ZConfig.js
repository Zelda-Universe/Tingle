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

// "exact", "focus" (Jason's deafult)
ZConfig.setConfig("categorySelectionMethod", "focus");
