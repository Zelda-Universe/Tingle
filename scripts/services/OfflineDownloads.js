// Offline map downloads (ajax/get_offline_maps.php, service-worker.js), run
// apart from the Offline Maps page: a download carries on while the map is
// used, its progress in a toast, one game at a time. One a page change,
// reload or lost connection interrupts is remembered and picked up again on
// the next page, or when the connection is back. A file that fails is tried
// again before the download gives up.

// The games being downloaded, in order (the first is running), so they're
// picked up again after the page changes.
ZMap.prototype.OFFLINE_QUEUE_KEY = 'zeldamapsOfflineQueue';

ZMap.prototype._offlineQueue = function() {
  try { return JSON.parse(localStorage.getItem(this.OFFLINE_QUEUE_KEY) || '[]') || []; } catch(e) { return []; }
};
ZMap.prototype._setOfflineQueue = function(queue) {
  try {
    if(queue.length) localStorage.setItem(this.OFFLINE_QUEUE_KEY, JSON.stringify(queue));
    else localStorage.removeItem(this.OFFLINE_QUEUE_KEY);
  } catch(e) {}
};

ZMap.prototype._offlineFormatBytes = function(bytes) {
  if(!bytes) return '0 MB';
  var units = ['B', 'KB', 'MB', 'GB'];
  var unitIndex = Math.min(Math.floor(Math.log(bytes) / Math.log(1024)), units.length - 1);
  var value = bytes / Math.pow(1024, unitIndex);
  return value.toFixed(unitIndex >= 2 && value < 10 ? 1 : 0) + ' ' + units[unitIndex];
};

// What happened to a download, for Admin's Offline Maps stats.
ZMap.prototype._reportOfflineEvent = function(game, event, bytes) {
  try {
    var data = { game: game.id, event: event };
    if(bytes > 0) data.bytes = Math.round(bytes);
    $.post('ajax.php?command=offline_map_event', data);
  } catch(e) {}
};

// Who's told how a download is going: the Offline Maps page's cards
// (zmap.js _createOfflineMapsForm) and the toast.
ZMap.prototype.onOfflineDownloadChange = function(listener) {
  (this._offlineListeners = this._offlineListeners || []).push(listener);
};
ZMap.prototype._offlineDownloadChanged = function(job) {
  (this._offlineListeners || []).forEach(function(listener) { try { listener(job); } catch(e) {} });
  this._offlineDownloadToast(job);
};
// The download running or waiting for a game, if any.
ZMap.prototype.offlineDownloadFor = function(gameId) {
  if(this._offlineJob && this._offlineJob.game.id === gameId) return this._offlineJob;
  return (this._offlineWaiting || []).find(function(job) { return job.game.id === gameId; }) || null;
};

// Downloads (or updates, opts.update) a game, after any already running.
// game: {id, name, size, tileCount, available, version}, as the Offline
// Maps page has it.
ZMap.prototype.startOfflineDownload = function(game, opts) {
  if(this.offlineDownloadFor(game.id)) return;
  var job = { game: game, isUpdate: !!(opts && opts.update), phase: 'queued',
    completedFiles: 0, totalFiles: game.tileCount || 0, completedBytes: 0, totalBytes: game.size || 0 };
  var queue = this._offlineQueue().filter(function(entry) { return entry.id !== game.id; });
  queue.push({ id: game.id, name: game.name, update: job.isUpdate });
  this._setOfflineQueue(queue);
  (this._offlineWaiting = this._offlineWaiting || []).push(job);
  this._offlineDownloadChanged(job);
  this._nextOfflineDownload();
};

// Stops a game's download (its saved map being removed).
ZMap.prototype.cancelOfflineDownload = function(gameId) {
  this._setOfflineQueue(this._offlineQueue().filter(function(entry) { return entry.id !== gameId; }));
  this._offlineWaiting = (this._offlineWaiting || []).filter(function(job) { return job.game.id !== gameId; });
  if(this._offlineJob && this._offlineJob.game.id === gameId) this._offlineJob.cancelled = true;
};

ZMap.prototype._nextOfflineDownload = function() {
  if(this._offlineJob || !(this._offlineWaiting || []).length) return;
  var zmap = this, job = this._offlineJob = this._offlineWaiting.shift();
  this._runOfflineDownload(job).then(function() {
    job.phase = 'done';
    zmap._setOfflineQueue(zmap._offlineQueue().filter(function(entry) { return entry.id !== job.game.id; }));
  }, function(error) {
    job.phase = 'failed';
    job.error = error;
    // Not one that can't succeed (no room, nothing to download, removed):
    // it's picked up again later.
    if(job.cancelled || error.fatal) zmap._setOfflineQueue(zmap._offlineQueue().filter(function(entry) { return entry.id !== job.game.id; }));
  }).then(function() {
    zmap._offlineJob = null;
    if(!job.cancelled) zmap._offlineDownloadChanged(job);
    zmap._nextOfflineDownload();
  });
};

// Picks up downloads an earlier page (or a lost connection) left unfinished:
// on loading, coming back online, and coming back to the page.
ZMap.prototype.resumeOfflineDownloads = function() {
  var zmap = this;
  if(!this._offlineResumeListeners) {
    this._offlineResumeListeners = true;
    this._onPage(window, 'online', function() { zmap.resumeOfflineDownloads(); });
    this._onPage(document, 'visibilitychange', function() { if(!document.hidden) zmap.resumeOfflineDownloads(); });
  }
  if(!this.getUser() || !navigator.onLine || !('caches' in window) || (this.isFramed && this.isFramed())) return;
  this._offlineQueue().forEach(function(entry) {
    if(zmap.offlineDownloadFor(entry.id)) return;
    // Its size and version now, as the Offline Maps page loads them.
    $.getJSON('ajax.php?command=get_offline_maps&game=' + encodeURIComponent(entry.id)).then(function(data) {
      if(!data || !data.success || !data.game || !data.game.available) return;
      if(zmap.offlineDownloadFor(entry.id)) return;
      var record = ZMapOfflinePacks.read(entry.id) || {};
      zmap.startOfflineDownload({ id: entry.id, name: data.game.name || entry.name, size: data.game.size,
        tileCount: data.game.tileCount, available: true, version: data.game.version },
        { update: entry.update || !!record.pendingUpdate });
    });
  });
};

// A download's progress, wherever the map is: a toast that stays until it's
// done (tapped, it opens Offline Maps), then says how it went.
ZMap.prototype._offlineDownloadToast = function(job) {
  if(typeof toastr === 'undefined') return;
  var zmap = this, name = $('<span>').text(job.game.name).html();
  var running = job.phase !== 'done' && job.phase !== 'failed';
  if(running) {
    // (The one running; a game waiting its turn shows once it starts.)
    if(job !== this._offlineJob) return;
    var percent = job.totalBytes > 0 ? Math.min(100, Math.floor(job.completedBytes / job.totalBytes * 100)) :
      Math.min(100, Math.floor(job.completedFiles / Math.max(job.totalFiles, 1) * 100));
    var detail = job.phase === 'images' ? 'Saving marker images…' : job.phase === 'preparing' || job.phase === 'queued' ? 'Getting ready…' :
      percent + '% · ' + this._offlineFormatBytes(job.completedBytes) + ' of ' + this._offlineFormatBytes(job.totalBytes);
    var html = "<span class='offline-toast-name'>" + (job.isUpdate ? 'Updating ' : 'Downloading ') + name + "</span>" +
      "<span class='offline-toast-detail'>" + $('<span>').text(detail).html() + "</span>" +
      "<span class='offline-toast-bar'><span style='width:" + (job.phase === 'files' ? percent : 0) + "%'></span></span>";
    if(this._offlineToast && this._offlineToast.closest('body').length) {
      this._offlineToast.find('.toast-message').html(html);
      return;
    }
    this._offlineToast = toastr.info(html, null, { timeOut: 0, extendedTimeOut: 0, tapToDismiss: false,
      closeButton: false, toastClass: 'toast offline-download-toast', onclick: function() { zmap.openOfflineMapsPage(); } });
    return;
  }
  if(this._offlineToast) { toastr.clear(this._offlineToast, { force: true }); this._offlineToast = null; }
  if(job.cancelled) return;
  if(job.phase === 'done') {
    toastr.success(name + (job.isUpdate ? ' is up to date offline.' : ' is saved for offline use.'), null, { timeOut: 5000 });
  } else {
    var message = job.error && job.error.message && !(job.error instanceof TypeError) ? job.error.message : 'The download was interrupted.';
    toastr.warning($('<span>').text(message).html() + (job.error && job.error.fatal ? '' : ' It will carry on when you\'re back online, or from Offline Maps.'),
      null, { timeOut: 8000, onclick: function() { zmap.openOfflineMapsPage(); } });
  }
};

// One game's download: its data, every file in its manifest (a tile that's
// the same as another is saved once: service-worker.js serves the copy),
// then the images its markers embed.
ZMap.prototype._runOfflineDownload = function(job) {
  var zmap = this, game = job.game;
  var cacheName = ZMapOfflinePacks.cacheName(game.id);
  var existingRecord = ZMapOfflinePacks.read(game.id);
  var isUpdate = job.isUpdate = job.isUpdate || !!(existingRecord && existingRecord.pendingUpdate);
  var oldIndex = null, newIndex = {}, aliases = {}, aliasCount = 0, newVersion = null;
  var dataURLs = [], embeddedImages = new Set(), savingEmbeddedImages = false, failed = [];
  function changed(phase) { if(phase) job.phase = phase; zmap._offlineDownloadChanged(job); }
  function check() {
    if(job.cancelled) throw Object.assign(new Error('Cancelled'), { fatal: true });
    if(navigator.onLine === false) throw new Error('You went offline.');
  }
  function collectImages(data) {
    ZMapOfflinePacks.embeddedImageURLs(data, document.baseURI).forEach(function(url) { embeddedImages.add(url); });
  }
  function wait(ms) { return new Promise(function(resolve) { window.setTimeout(resolve, ms); }); }
  // A file that fails (a dropped connection, a busy server) is tried again,
  // twice, a little later each time.
  function fetchWithRetry(url, options, attempt) {
    attempt = attempt || 1;
    return fetch(url, options).then(function(response) {
      if(!response.ok && response.type !== 'opaque' && (response.status >= 500 || response.status === 429) && attempt < 3) {
        return wait(attempt * 1500).then(function() { return fetchWithRetry(url, options, attempt + 1); });
      }
      return response;
    }, function(error) {
      if(attempt >= 3 || navigator.onLine === false || job.cancelled) throw error;
      return wait(attempt * 1500).then(function() { return fetchWithRetry(url, options, attempt + 1); });
    });
  }
  // Marker images often live on other sites. One that's missing or slow
  // is left out (its marker shows no image offline) rather than failing
  // the whole download.
  var EMBEDDED_IMAGE_TIMEOUT = 20000;
  function skipEmbeddedImage(cache, url) {
    delete newIndex[url];
    return cache.delete(url).catch(function() {});
  }
  function verifyEmbeddedImage(cache, url) {
    if(!savingEmbeddedImages) return Promise.resolve();
    // Cross-origin fetch responses are opaque: a 404 can look successful.
    // Decode from the saved pack before counting the image as downloaded.
    return new Promise(function(resolve) {
      var image = new Image();
      var timer = window.setTimeout(failedImage, EMBEDDED_IMAGE_TIMEOUT);
      function failedImage() {
        window.clearTimeout(timer);
        image.onload = image.onerror = null;
        image.src = '';
        skipEmbeddedImage(cache, url).then(resolve);
      }
      image.onload = function() { window.clearTimeout(timer); resolve(); };
      image.onerror = failedImage;
      image.src = url;
    });
  }
  // fetch() has no time limit of its own: an unreachable host can hold a
  // download until the browser gives up minutes later.
  function fetchEmbeddedImage(url, options) {
    var controller = typeof AbortController === 'function' ? new AbortController() : null;
    var timer;
    var timeout = new Promise(function(resolve, reject) {
      timer = window.setTimeout(function() {
        if(controller) controller.abort();
        reject(new Error('Timed out'));
      }, EMBEDDED_IMAGE_TIMEOUT);
    });
    var request = fetch(url, controller ? Object.assign({ signal: controller.signal }, options) : options);
    return Promise.race([request, timeout]).finally(function() { window.clearTimeout(timer); });
  }
  var lastShown = 0;
  function progressed(bytes) {
    job.completedFiles += 1;
    job.completedBytes += bytes || 0;
    // (Redrawn a few times a second, not for every file.)
    var now = Date.now();
    if(now - lastShown > 250 || job.completedFiles >= job.totalFiles) { lastShown = now; changed(); }
  }

  function downloadBatch(cache, tiles) {
    var index = 0;
    var workers = [];
    function worker() {
      if(index >= tiles.length) return Promise.resolve();
      check();
      var tile = tiles[index++];
      // Tiles have absolute paths; marker images are relative to the site.
      var absoluteURL = new URL(tile.url, document.baseURI).href;
      // The same image as another tile: saved once, as that one.
      if(tile.same) {
        aliases[absoluteURL] = new URL(tile.same, document.baseURI).href;
        aliasCount++;
        progressed(0);
        return Promise.resolve().then(worker);
      }
      var sameOrigin = new URL(absoluteURL).origin === window.location.origin;
      var signature = tile.size + ':' + tile.m;
      newIndex[absoluteURL] = signature;
      // Revalidate, so a replaced tile isn't served from the HTTP cache.
      var fetchOptions = sameOrigin
        ? { credentials: 'same-origin', redirect: 'follow', cache: 'no-cache' }
        : { mode: 'no-cors', credentials: 'omit', redirect: 'follow', cache: 'no-cache' };
      return cache.match(absoluteURL, { ignoreVary: true }).then(function(cachedResponse) {
        var unchanged = !isUpdate || (oldIndex && oldIndex[absoluteURL] === signature);
        if(cachedResponse && unchanged) {
          return (/\.json(?:\?|$)/i.test(absoluteURL) && cachedResponse.type !== 'opaque'
            ? cachedResponse.clone().json().then(collectImages) : Promise.resolve())
            .then(function() { return verifyEmbeddedImage(cache, absoluteURL); })
            .then(function() { progressed(tile.size); });
        }
        if(savingEmbeddedImages) {
          return fetchEmbeddedImage(absoluteURL, fetchOptions).then(function(response) {
            if(!response.ok && response.type !== 'opaque') throw new Error('Not found');
            return cache.put(absoluteURL, response.clone())
              .then(function() { return verifyEmbeddedImage(cache, absoluteURL); });
          }).catch(function() {
            return skipEmbeddedImage(cache, absoluteURL);
          }).then(function() { progressed(0); });
        }
        return fetchWithRetry(absoluteURL, fetchOptions).then(function(response) {
          if(!response.ok && response.type !== 'opaque') throw new Error('A map file could not be downloaded.');
          var inspect = /\.json(?:\?|$)/i.test(absoluteURL) && response.type !== 'opaque'
            ? response.clone().json().then(collectImages) : Promise.resolve();
          return inspect.then(function() { return cache.put(absoluteURL, response.clone()); })
            .then(function() { progressed(tile.size); });
        }).catch(function(error) {
          // (Out of room: no use going on.)
          if(error && error.name === 'QuotaExceededError') throw Object.assign(error, { fatal: true });
          check();
          // Tried again at the end, after the rest.
          failed.push(tile);
        });
      }).then(worker);
    }
    for(var i = 0; i < Math.min(6, tiles.length); i++) workers.push(worker());
    return Promise.all(workers);
  }

  function downloadPage(cache, offset) {
    check();
    return fetchWithRetry('ajax.php?command=get_offline_maps&mode=manifest&game=' +
      encodeURIComponent(game.id) + '&offset=' + offset + '&limit=250').then(function(response) {
      if(!response.ok) throw new Error('The map\'s file list could not be loaded.');
      return response.json();
    }).then(function(data) {
      if(!data.success) throw new Error(data.msg || 'The map\'s file list could not be loaded.');
      job.totalFiles = data.total;
      job.totalBytes = data.totalBytes;
      newVersion = data.version || null;
      if(job.phase !== 'files') changed('files');
      return downloadBatch(cache, data.tiles).then(function() {
        var nextOffset = offset + data.tiles.length;
        if(nextOffset < data.total) return downloadPage(cache, nextOffset);
      });
    });
  }

  changed('preparing');
  zmap._reportOfflineEvent(game, 'started', job.totalBytes);
  var persistenceRequest = navigator.storage && navigator.storage.persist
    ? navigator.storage.persist().catch(function() { return false; }) : Promise.resolve(false);
  return persistenceRequest.then(function() {
    return navigator.storage && navigator.storage.estimate ? navigator.storage.estimate() : null;
  }).then(function(estimate) {
    if(!existingRecord && estimate && estimate.quota && estimate.usage + job.totalBytes * 1.1 > estimate.quota) {
      throw Object.assign(new Error('This device does not have enough available browser storage for this map.'), { fatal: true });
    }
    return caches.open(cacheName);
  }).then(function(cache) {
    ZMapOfflinePacks.write(game.id, { status: 'partial', size: job.totalBytes, tileCount: job.totalFiles,
      version: existingRecord && existingRecord.version, pendingUpdate: isUpdate, updatedAt: Date.now() });
    var indexRead = isUpdate
      ? cache.match(ZMapOfflinePacks.indexURL).then(function(response) {
          return response ? response.json() : null;
        }).then(function(index) { oldIndex = index && index.tiles; }).catch(function() {})
      : Promise.resolve();
    var containerURL = 'ajax.php?command=get_container&game=' + encodeURIComponent(game.id);
    dataURLs.push(containerURL);
    return indexRead.then(function() {
      return fetchWithRetry(containerURL, { cache: 'no-cache' });
    }).then(function(response) {
      if(!response.ok) throw new Error('The offline map data could not be saved.');
      return response.json().then(function(containers) {
        if(!containers[0]) throw new Error('The offline map data could not be loaded.');
        return cache.put(containerURL, new Response(JSON.stringify(containers), {
          headers: { 'Content-Type': 'application/json' }
        })).then(function() {
          var saves = ['get_map', 'get_categories', 'get_markers'].map(function(command) {
            var url = 'ajax.php?command=' + command + '&game=' + containers[0].id;
            dataURLs.push(url);
            return fetchWithRetry(url, { cache: 'no-cache' }).then(function(dataResponse) {
              if(!dataResponse.ok) throw new Error('The offline map data could not be saved.');
              return dataResponse.clone().json().then(collectImages).then(function() { return cache.put(url, dataResponse); });
            });
          });
          // The game's paths, as anyone sees them (no account: they're map
          // data, kept with the map like its markers, so signing out keeps
          // them). Paths.js loadPaths uses them offline when this account
          // has no copy of its own. Not needed for the map itself: a failure
          // here doesn't stop the download.
          var pathsURL = ZMapOfflinePacks.pathsURL(containers[0].id);
          dataURLs.push(pathsURL);
          saves.push(fetchWithRetry(pathsURL, { cache: 'no-cache', credentials: 'omit' }).then(function(pathsResponse) {
            if(pathsResponse.ok) return cache.put(pathsURL, pathsResponse);
          }).catch(function() {}));
          // And the signed-in account's (its own paths and completions).
          var account = zmap.getUser && zmap.getUser();
          if(account && window.ZOfflineSync) {
            saves.push(fetchWithRetry(pathsURL, { cache: 'no-cache', credentials: 'same-origin' })
              .then(function(pathsResponse) { return pathsResponse.ok ? pathsResponse.json() : null; })
              .then(function(paths) { if(Array.isArray(paths)) return ZOfflineSync.savePaths(account.id, containers[0].id, paths); })
              .catch(function() {}));
          }
          // The page itself, so switching to this game works offline.
          var pageURL = './?game=' + encodeURIComponent(game.id);
          dataURLs.push(pageURL);
          saves.push(fetchWithRetry(pageURL, { cache: 'no-cache', credentials: 'same-origin' }).then(function(pageResponse) {
            if(pageResponse.ok) return cache.put(pageURL, pageResponse);
          }));
          return Promise.all(saves);
        });
      });
    }).then(function() {
      return downloadPage(cache, 0);
    }).then(function() {
      // The files that failed, once more, now the rest are saved.
      if(!failed.length) return;
      var again = failed;
      failed = [];
      return wait(2000).then(function() { return downloadBatch(cache, again); }).then(function() {
        if(failed.length) throw new Error(failed.length === 1 ? 'A map file couldn\'t be downloaded.' : failed.length + ' map files couldn\'t be downloaded.');
      });
    }).then(function() {
      var images = Array.from(embeddedImages).filter(function(url) { return !newIndex[url]; });
      if(!images.length) return;
      savingEmbeddedImages = true;
      job.totalFiles += images.length;
      changed('images');
      return downloadBatch(cache, images.map(function(url) { return { url: url, size: 0, m: 0 }; }));
    }).then(function() {
      changed('finishing');
      // Remove files the map no longer uses (and tiles now saved once, as
      // another), then save the new index and which tiles share a file.
      var keep = {};
      dataURLs.concat(ZMapOfflinePacks.indexURL, ZMapOfflinePacks.aliasesURL).forEach(function(url) {
        keep[new URL(url, window.location.href).href] = true;
      });
      return cache.keys().then(function(requests) {
        return Promise.all(requests.filter(function(request) {
          return !keep[request.url] && !newIndex[request.url];
        }).map(function(request) { return cache.delete(request); }));
      }).then(function() {
        return cache.put(ZMapOfflinePacks.aliasesURL, new Response(JSON.stringify(aliases),
          { headers: { 'Content-Type': 'application/json' } }));
      }).then(function() {
        return cache.put(ZMapOfflinePacks.indexURL, new Response(
          JSON.stringify({ version: newVersion, tiles: newIndex }),
          { headers: { 'Content-Type': 'application/json' } }));
      });
    });
  }).then(function() {
    // (The service worker reads which tiles share a file afresh.)
    if(navigator.serviceWorker && navigator.serviceWorker.controller) {
      navigator.serviceWorker.controller.postMessage({ type: 'zeldamaps-offline-pack-updated', cache: cacheName });
    }
    ZMapOfflinePacks.write(game.id, { status: 'downloaded', assetsVersion: ZMapOfflinePacks.assetsVersion,
      size: job.totalBytes, tileCount: job.totalFiles - aliasCount, version: newVersion, downloadedAt: Date.now() });
    game.version = newVersion;
    zmap._reportOfflineEvent(game, isUpdate ? 'updated' : 'downloaded', job.totalBytes);
  }, function(error) {
    zmap._reportOfflineEvent(game, 'failed', job.completedBytes);
    return caches.open(cacheName).then(function(cache) { return cache.keys(); }).then(function(saved) {
      if(saved.length > 0 && !job.cancelled) {
        ZMapOfflinePacks.write(game.id, { status: 'partial', size: job.totalBytes, tileCount: job.totalFiles,
          version: existingRecord && existingRecord.version, pendingUpdate: isUpdate, updatedAt: Date.now() });
      } else if(!job.cancelled) {
        caches.delete(cacheName);
        ZMapOfflinePacks.remove(game.id);
      }
    }).catch(function() {}).then(function() { throw error; });
  });
};
