function getSetOrDefaultValue(opts, propertyName, defaultValue) {
  if(!opts || opts[propertyName] === undefined) {
    return defaultValue;
  } else {
    return opts[propertyName];
  }
};
