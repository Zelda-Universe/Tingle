// MIT Licensed
// Copyright (c) 2023 Pysis(868)
// https://choosealicense.com/licenses/mit/

// ChangelogHandler - Connects the various related widgets to perform search actions, cohesively-containing logic, and provides configuration.
// - opts: [Object] Typical options object.
//   - user: [Object] - User data to use for version checking.
//   - seenChangelogVersion: [String] The last version viewed, in a situation where this cannot be extracted from the user object, like unauthenticated users from a saved cookie.
//   - version: [String] - The semver to use when setting the newly read changelog.

var seenChangelogVersionCookieName = "seenChangelogVersion";

function ChangelogHandler(opts) {
  this._fetchChangelogEntries(opts);
};

ChangelogHandler.prototype._fetchChangelogEntries = function(opts) {
  // Forced mode
  if (ZConfig.getConfig("changelogForce") == 'true') {
    this._fetchChangelogEntriesByVersion(
      '0.0.0',
      opts.version
    );

    return;
  }

  // User mode
  if (opts.user) {
    if (opts.user.seen_version < opts.version) {
      this._fetchChangelogEntriesByUser(opts.user);
    }
    return;
  }

  // Local mode
  let lastSeenVersion = (
    getCookie(seenChangelogVersionCookieName) || '0.0.0'
  );

  if (lastSeenVersion < opts.version) {
    this._fetchChangelogEntriesByVersion(
      opts.seenChangelogVersion,
      opts.version
    );
  }
};

ChangelogHandler.prototype._fetchChangelogEntriesByUser = function(user) {
  $.getJSON("ajax.php?command=get_changelog", function(entries) {
    this._notifyChangelogVersionUpdates(entries, user);
    // $.ajax("ajax.php?command=set_changelog_seen_latest");
  }.bind(this));
};

ChangelogHandler.prototype._fetchChangelogEntriesByVersion = function(seenChangelogVersion, version) {
  $.getJSON("ajax.php?command=get_changelog&sinceVersion=" + seenChangelogVersion, function(entries) {
    this._notifyChangelogVersionUpdates(entries, null);
    setCookie(seenChangelogVersionCookieName, version);
  }.bind(this));
};

ChangelogHandler.prototype._groupChangelogEntriesByVersion = function(entries) {
  return groupObjects({
    arrayOfObjects: entries,
    groupPropertyName: function(entry) { return entry.v1 + "." + entry.v2 + "." + entry.v3; },
    objectFormatter: function(entry) { return '<li>' + entry.content + '</li>'; }
  });
};

ChangelogHandler.prototype._notifyChangelogVersionUpdate = function(version, versionEntry, user) {
  toastr.remove();

  if (user != undefined) {
      $.ajax({
           type: "POST",
           url: "ajax.php?command=update_user_version",
           data: {userId: user.id, version: version},
           success: function(data) {
               if (data.success) {

               } else {
                  toastr.error("Unable to update user version");
                  //alert(data.msg);
               }
           }
         })
  };

  return zLogger.info(
    '<ul>' +
      versionEntry.join('') +
    '</ul>',
    "Zelda Maps Update - Version " + version
  )
};

ChangelogHandler.prototype._notifyChangelogVersionUpdates = function(entries, user) {
  var entriesByVersion = this._groupChangelogEntriesByVersion(entries);
  for (version in entriesByVersion) {
    this._notifyChangelogVersionUpdate(version, entriesByVersion[version], user);
  }
};
