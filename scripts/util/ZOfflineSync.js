// Outside production, ?offline=on makes the site act offline (for checking
// offline styling) until ?offline=off, while still loading normally.
(function() {
  try {
    if(/^(www\.)?zeldamaps\.com$/.test(location.hostname)) return;
    var param = new URLSearchParams(location.search).get('offline');
    if(param === 'on') sessionStorage.setItem('zeldamapsPreviewOffline', '1');
    if(param === 'off') sessionStorage.removeItem('zeldamapsPreviewOffline');
    if(sessionStorage.getItem('zeldamapsPreviewOffline')) {
      Object.defineProperty(navigator, 'onLine', { get: function() { return false; }, configurable: true });
    }
  } catch(error) {}
})();

// Signed-in features without a connection. The account's details, completed
// markers and bookmarks are kept on this device while signed in, and changes
// made offline are queued and sent once the connection returns.
var ZOfflineSync = {
  userKey: 'zeldamapsAccountOffline',
  queueKey: 'zeldamapsAccountQueue',
  settingsKey: 'zeldamapsAccountSettingsPending',
  dataPrefix: 'zeldamapsAccountData-',

  _read: function(key) {
    try {
      var value = localStorage.getItem(key);
      return value ? JSON.parse(value) : null;
    } catch(error) {
      return null;
    }
  },

  _write: function(key, value) {
    try {
      localStorage.setItem(key, JSON.stringify(value));
    } catch(error) {}
  },

  _remove: function(key) {
    try {
      localStorage.removeItem(key);
    } catch(error) {}
  },

  // A request that never reached the server, as opposed to one it refused.
  isNetworkError: function(xhr) {
    return !navigator.onLine || !xhr || xhr.status === 0;
  },

  // get_user_info's response. Signing out, or another account signing in,
  // removes the previous account's data from this device.
  saveUserInfo: function(info) {
    if(!info || !info.user) {
      this.clear();
      return;
    }
    var saved = this._read(this.userKey);
    if(saved && saved.user && saved.user.id != info.user.id) this.clear();
    this._write(this.userKey, info);
  },

  savedUserInfo: function() {
    var saved = this._read(this.userKey);
    return saved && saved.user ? saved : null;
  },

  clear: function() {
    // (Paths are kept in a cache of their own: savePaths.)
    try { if(window.caches) caches.delete(this.accountCache); } catch(error) {}
    try {
      Object.keys(localStorage).forEach(function(key) {
        if(
          key === this.userKey || key === this.queueKey || key === this.settingsKey ||
          key.indexOf(this.dataPrefix) === 0
        ) localStorage.removeItem(key);
      }, this);
    } catch(error) {}
  },

  _dataKey: function(kind, userId, game) {
    return this.dataPrefix + kind + '-' + userId + '-' + game;
  },

  // The completed marker ids for a game.
  saveCompleted: function(userId, game, markerIds) {
    if(!userId || game == null) return;
    this._write(this._dataKey('completed', userId, game), markerIds.map(Number));
  },

  savedCompleted: function(userId, game) {
    return this._read(this._dataKey('completed', userId, game));
  },

  saveBookmarks: function(userId, game, bookmarks) {
    if(!userId || game == null) return;
    this._write(this._dataKey('bookmarks', userId, game), bookmarks);
  },

  savedBookmarks: function(userId, game) {
    return this._read(this._dataKey('bookmarks', userId, game));
  },

  // A game's paths as get_paths gave them to this account (its drafts and
  // completions with them), for the map offline. Kept in the browser's cache
  // storage rather than localStorage: TotK's are about 300 KB. Promises.
  accountCache: 'zeldamaps-offline-account',
  _pathsRequest: function(userId, game) {
    return new URL('zeldamaps-account/paths/' + encodeURIComponent(userId) + '/' + encodeURIComponent(game) + '.json', location.href).href;
  },
  savePaths: function(userId, game, paths) {
    if(!userId || game == null || !window.caches || !Array.isArray(paths)) return Promise.resolve();
    var request = this._pathsRequest(userId, game);
    return caches.open(this.accountCache).then(function(cache) {
      return cache.put(request, new Response(JSON.stringify(paths), { headers: { 'Content-Type': 'application/json' } }));
    }).catch(function() {});
  },
  savedPaths: function(userId, game) {
    if(!userId || game == null || !window.caches) return Promise.resolve(null);
    var request = this._pathsRequest(userId, game);
    return caches.open(this.accountCache).then(function(cache) { return cache.match(request); })
      .then(function(response) { return response ? response.json() : null; })
      .catch(function() { return null; });
  },

  queue: function() {
    return this._read(this.queueKey) || [];
  },

  _setQueue: function(queue) {
    if(queue.length) this._write(this.queueKey, queue);
    else this._remove(this.queueKey);
  },

  // Completed markers the server doesn't have yet, applied to its list.
  applyPendingCompleted: function(userId, game, markerIds) {
    var ids = markerIds.map(Number);
    this.queue().forEach(function(item) {
      if(item.userId != userId || item.game != game) return;
      var markerId = Number(item.data.markerId);
      var index = ids.indexOf(markerId);
      if(item.command === 'add_complete_marker' && index === -1) ids.push(markerId);
      if(item.command === 'del_complete_marker' && index !== -1) ids.splice(index, 1);
    });
    return ids;
  },

  // Sends a change, or queues it when offline. opts: command, data, userId,
  // game, success(data), error(xhr). A queued change succeeds at once with
  // { success: true, queued: true }; a queued bookmark gets a temporary id.
  send: function(opts) {
    var self = this;
    var queueIt = function() {
      var queue = self.queue();
      var result = { success: true, queued: true };
      if(opts.command === 'del_bookmark' && String(opts.data.bookmarkId).indexOf('offline-') === 0) {
        // Never sent, so just drop the queued add.
        queue = queue.filter(function(item) { return item.tempId !== opts.data.bookmarkId; });
      } else {
        var item = { command: opts.command, data: opts.data, userId: opts.userId, game: opts.game };
        if(opts.command === 'add_bookmark') {
          item.tempId = result.id = 'offline-' + Date.now() + '-' + Math.floor(Math.random() * 1000);
        }
        queue.push(item);
      }
      self._setQueue(queue);
      if(opts.success) opts.success(result);
    };
    if(!navigator.onLine) {
      queueIt();
      return;
    }
    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=' + opts.command,
      data: opts.data,
      success: opts.success,
      error: function(xhr) {
        if(self.isNetworkError(xhr)) queueIt();
        else if(opts.error) opts.error(xhr);
      }
    });
  },

  // Settings changed offline are sent with the rest of the queue.
  settingsPending: function() {
    return !!this._read(this.settingsKey);
  },

  setSettingsPending: function(pending) {
    if(pending) this._write(this.settingsKey, true);
    else this._remove(this.settingsKey);
  },

  // Sends queued changes in order. Stops, keeping the rest, if the
  // connection drops or the session has expired; drops a change the server
  // refuses for another reason (e.g. a marker that no longer exists).
  // onDone(changed) is told whether anything was sent.
  flush: function(userId, opts) {
    var self = this;
    opts = opts || {};
    if(this._flushing || !navigator.onLine) return;
    this._flushing = true;
    var changed = false;
    var finish = function() {
      self._flushing = false;
      if(opts.onDone) opts.onDone(changed);
    };
    var next = function() {
      var queue = self.queue();
      var item = queue[0];
      if(!item) {
        if(self.settingsPending() && opts.saveSettings) {
          opts.saveSettings(function(ok) {
            if(ok) self.setSettingsPending(false);
            finish();
          });
        } else {
          finish();
        }
        return;
      }
      // Another account's changes can't be sent from this session.
      if(item.userId != userId) {
        self._setQueue(queue.slice(1));
        next();
        return;
      }
      $.ajax({
        type: 'POST',
        url: 'ajax.php?command=' + item.command,
        data: item.data,
        success: function(data) {
          if(data && !data.success && /session|logged/i.test(data.msg || '')) {
            finish();
            return;
          }
          self._setQueue(self.queue().filter(function(queued) {
            return JSON.stringify(queued) !== JSON.stringify(item);
          }));
          changed = true;
          next();
        },
        error: function(xhr) {
          if(self.isNetworkError(xhr) || xhr.status === 401) {
            finish();
            return;
          }
          self._setQueue(self.queue().slice(1));
          next();
        }
      });
    };
    next();
  }
};
