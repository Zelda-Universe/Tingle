// ChangelogHandler - Connects the various related widgets to perform search actions, cohesively-containing logic, and provides configuration.
// - opts: [Object] Typical options object.
//   - user: [Object] - User data to use for version checking.
//   - seenChangelogVersion: [String] The last version viewed, in a situation where this cannot be extracted from the user object, like unauthenticated users from a saved cookie.
//   - version: [String] - The semver to use when setting the newly read changelog.

var seenChangelogVersionCookieName = "seenChangelogVersion";

function ChangelogHandler(opts) {
  this._initSettings();
  this._fetchChangelogEntries(opts);
};

ChangelogHandler.prototype._initSettings = function() {
  this.notificationWidth = (
    (mapControl.isMobile())
    ? (window.innerWidth-24)
    : "450"
  ) + "px";
};

ChangelogHandler.prototype._fetchChangelogEntries = function(opts) {
  if(opts.user) {
    if(!opts.user.seen_latest_changelog)
      this._fetchChangelogEntriesByUser(opts.user);
  } else if(opts.seenChangelogVersion) {
    if(opts.seenChangelogVersion != opts.version)
      this._fetchChangelogEntriesByCookie(opts.seenChangelogVersion, opts.version);
  } else setCookie(seenChangelogVersionCookieName, opts.version);

  if(this.fetchFunction) this.fetchFunction();
};

ChangelogHandler.prototype._fetchChangelogEntriesByUser = function(user) {
  $.getJSON("ajax.php?command=get_changelog", function(entries) {
    this._notifyChangelogVersionUpdates(entries);
    // $.ajax("ajax.php?command=set_changelog_seen_latest");
  }.bind(this));
};

ChangelogHandler.prototype._fetchChangelogEntriesByCookie = function(seenChangelogVersion, version) {
  $.getJSON("ajax.php?command=get_changelog&sinceVersion=" + seenChangelogVersion, function(entries) {
    this._notifyChangelogVersionUpdates(entries);
    setCookie(seenChangelogVersionCookieName, version);
  }.bind(this));
};

ChangelogHandler.prototype._notifyChangelogVersionUpdates = function(entries) {
  var entriesByVersion = this._groupChangelogEntriesByVersion(entries);
  for (version in entriesByVersion) {
    this._notifyChangelogVersionUpdate(version, entriesByVersion[version]);
  }
};

ChangelogHandler.prototype._groupChangelogEntriesByVersion = function(entries) {
  return groupObjects({
    arrayOfObjects: entries,
    groupPropertyName: function(entry) { return entry.v1 + "." + entry.v2 + "." + entry.v3; },
    objectFormatter: function(entry) { return '<li>' + entry.content + '</li>'; }
  });
};

ChangelogHandler.prototype._notifyChangelogVersionUpdate = function(version, versionEntry) {
  toastr.remove();
  return zlogger.info(
    '<ul>' +
      versionEntry.join('') +
    '</ul>',
    "Zelda Maps Update - Version " + version, {
    closeButton: true,
    positionClass: "toast-top-full-width",
    timeOut: 0,
    extendedTimeOut: 0,
    newestOnTop: false
  })
  .css(this.notificationWidth);
  // Width-setting from the old code, in case we decide to not use the full top placement.
};
