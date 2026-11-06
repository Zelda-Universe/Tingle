// Community editing, wiki-style: marker History (with reverts), Talk pages
// with threaded comments, and profiles. For now only editors (Contributors
// and Admins, level 5+) see any of it; the server checks the same.
//
// Pages here are drawer pages like the others. Each is opened with the
// function that goes back from it, so History opened from a POI goes back
// to the POI, and a revision opened from Talk goes back to Talk.

ZMap.prototype.WIKI_EDITOR_LEVEL = 5;
ZMap.prototype.WIKI_ADMIN_LEVEL = 10;

// Signing in or out while a POI is open updates its footer.
ZMap.prototype._watchWikiUser = function() {
  if(this._wikiUserWatched || !this.addHandler) return;
  this._wikiUserWatched = true;
  var _this = this;
  this.addHandler('userChanged', function() {
    var match = /^m(\d+)$/.exec(_this.mapControl && _this.mapControl.getContentType() || '');
    if(match) _this._refreshMarkerEditorTools(_this.cachedMarkersById[match[1]]);
  });
};

ZMap.prototype._isWikiEditor = function() {
  var me = this.getUser();
  return !!me && me.level >= this.WIKI_EDITOR_LEVEL;
};

ZMap.prototype._canEditMarker = function(marker) {
  var me = this.getUser();
  if(!me || !marker) return false;
  return me.level >= this.WIKI_ADMIN_LEVEL ||
    (me.level >= this.WIKI_EDITOR_LEVEL && String(marker.userId) === String(me.id));
};

ZMap.prototype._wikiEscape = function(text) {
  return String(text == null ? '' : text)
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&#39;');
};

ZMap.prototype._wikiAgo = function(seconds) {
  return this._adminTime(seconds) || '';
};

ZMap.prototype._wikiRoleLabel = function(level) {
  level = Number(level);
  if(level >= this.WIKI_ADMIN_LEVEL) return 'Admin';
  if(level >= this.WIKI_EDITOR_LEVEL) return 'Contributor';
  return 'Member';
};

ZMap.prototype.WIKI_ACTIONS = {
  create: { label: 'Created', icon: 'fa-plus' },
  edit: { label: 'Edited', icon: 'fa-pencil-alt' },
  revert: { label: 'Reverted', icon: 'fa-undo' },
  'delete': { label: 'Deleted', icon: 'fa-trash-alt' },
  'import': { label: 'Original', icon: 'fa-archive' }
};

ZMap.prototype._wikiActionBadge = function(action) {
  var info = this.WIKI_ACTIONS[action] || { label: action, icon: 'fa-circle' };
  return '<span class="wiki-action wiki-action-' + this._wikiEscape(action) + '">' +
    '<i class="fas ' + info.icon + '" aria-hidden="true"></i>' + this._wikiEscape(info.label) + '</span>';
};

ZMap.prototype._wikiUserLink = function(userId, username) {
  if(!username) return '<span class="wiki-user">Unknown</span>';
  return '<a href="#" class="wiki-user wiki-link" data-user-id="' + Number(userId) + '">' +
    this._wikiEscape(username) + '</a>';
};

// Opens a wiki page in the drawer. back runs from its Back button (and
// swiping back); it's passed on so pages can be reopened the same way.
// Links on it open pages that come back to it with reopen.
ZMap.prototype._showWikiPage = function(html, type, back, reopen) {
  var control = this.mapControl;
  control._nextPageBack = back || null;
  control._navigatingForward = !control._navigatingBack;
  control.setContent(html, type);
  if(control.viewStyleBottomSlide) {
    if(!control._navigatingBack) control.openDrawerLarge();
  } else if(control._expand) {
    control._expand();
  }
  var page = control._contents.querySelector('.menu-cat-content-inner');
  this._wireWikiLinks(page, reopen || back);
  return page;
};

ZMap.prototype._wikiError = function(xhr, fallback) {
  var data = xhr && xhr.responseJSON;
  return (data && data.msg) || fallback || 'Something went wrong. Try again.';
};

ZMap.prototype._wikiGet = function(command, params) {
  return $.getJSON('ajax.php?command=' + command, params);
};

ZMap.prototype._wikiPost = function(command, data) {
  return $.ajax({ type: 'POST', url: 'ajax.php?command=' + command, data: data, dataType: 'json' });
};

ZMap.prototype._wikiCopy = function(text, what) {
  var done = function() { toastr.success((what || 'Link') + ' copied'); };
  if(navigator.clipboard && window.isSecureContext) {
    navigator.clipboard.writeText(text).then(done, function() {
      window.prompt('Copy to clipboard: Ctrl+C, Enter', text);
    });
  } else {
    window.prompt('Copy to clipboard: Ctrl+C, Enter', text);
  }
};

// Back to a marker's POI page, or the category list if it isn't on this map.
ZMap.prototype._wikiBackToMarker = function(markerId) {
  var _this = this;
  return function() {
    var marker = _this.cachedMarkersById[markerId];
    if(marker && marker.visible !== false && marker.visible !== 0) _this._createMarkerPopup(marker);
    else _this.mapControl.resetContent();
  };
};

//************************************************************************//
//  POI footer                                                            //
//************************************************************************//

// Under a POI's content: who added it, and Edit, History, Talk and Delete.
// Editors only.
ZMap.prototype._markerEditorToolsHTML = function(marker) {
  if(!this._isWikiEditor() || !marker || !(marker.id > 0)) return '';
  var canEdit = this._canEditMarker(marker);
  var id = Number(marker.id);
  var button = function(action, icon, label, extra) {
    return '<button type="button" class="marker-editor-button' + (extra || '') + '" data-editor-action="' + action + '">' +
      '<i class="fas ' + icon + '" aria-hidden="true"></i><span>' + label + '</span></button>';
  };
  return '<section class="marker-editor-tools" data-marker-id="' + id + '">' +
    '<div class="marker-editor-meta">' +
      '<span>Marker #' + id + '</span>' +
      (marker.userName ? '<span>Added by ' + this._wikiUserLink(marker.userId, marker.userName) + '</span>' : '') +
    '</div>' +
    '<div class="marker-editor-buttons">' +
      (canEdit ? button('edit', 'fa-pencil-alt', 'Edit') : '') +
      button('history', 'fa-history', 'History') +
      button('talk', 'fa-comments', 'Talk') +
      (canEdit ? button('delete', 'fa-trash-alt', 'Delete', ' bad') : '') +
    '</div>' +
    '<div class="marker-editor-confirm" hidden>' +
      '<p>Delete this marker? It disappears from the map, and can be brought back from its History.</p>' +
      '<div class="wiki-button-pair">' +
        '<button type="button" class="infoWindowIcn form-action-button" data-editor-action="cancel-delete">Cancel</button>' +
        '<button type="button" class="infoWindowIcn form-action-button bad" data-editor-action="confirm-delete">Delete Marker</button>' +
      '</div>' +
    '</div>' +
  '</section>';
};

// Adds (or updates) the footer on the open POI page, which may have opened
// before the account finished loading.
ZMap.prototype._refreshMarkerEditorTools = function(marker) {
  var _this = this;
  var page = this.mapControl._contents.querySelector('.menu-cat-content-inner');
  if(!page || !marker) return;
  $(page).children('.marker-editor-tools').remove();
  var html = this._markerEditorToolsHTML(marker);
  if(!html) return;
  $(page).append(html);
  var tools = page.querySelector('.marker-editor-tools');
  this._wireWikiLinks(tools, this._wikiBackToMarker(marker.id));
  $(tools).on('click', '[data-editor-action]', function(e) {
    e.preventDefault();
    var action = this.getAttribute('data-editor-action');
    var back = _this._wikiBackToMarker(marker.id);
    if(action === 'edit') _this.editMarker(marker.id);
    else if(action === 'history') _this._openMarkerHistory(marker.id, back);
    else if(action === 'talk') _this._openTalk('marker', marker.id, marker.title, back);
    else if(action === 'delete' || action === 'cancel-delete') {
      var confirming = action === 'delete';
      $(tools).find('.marker-editor-buttons').prop('hidden', confirming);
      $(tools).find('.marker-editor-confirm').prop('hidden', !confirming);
      if(confirming) tools.querySelector('[data-editor-action="confirm-delete"]').focus();
    } else if(action === 'confirm-delete') {
      $(this).prop('disabled', true);
      _this.deleteMarker(marker.id);
    }
  });
};

//************************************************************************//
//  Link codes                                                            //
//************************************************************************//

// Talk comments are plain text. Link codes, interwiki-style:
//   [[rev:123]]  a marker revision    [[marker:45]]  a marker
//   [[user:name]]  a profile          [[rev:123|label]]  with a label
ZMap.prototype._renderWikiText = function(text) {
  var _this = this;
  var html = this._wikiEscape(text);
  html = html.replace(/\[\[(rev|marker|user):([^\]|]{1,64})(?:\|([^\]]{1,120}))?\]\]/gi, function(all, kind, target, label) {
    kind = kind.toLowerCase();
    target = target.trim();
    if((kind === 'rev' || kind === 'marker') && !/^\d+$/.test(target)) return all;
    var text = label ? label.trim() : (kind === 'rev' ? 'revision ' + target : kind === 'marker' ? 'marker #' + target : target);
    var icon = kind === 'rev' ? 'fa-history' : kind === 'marker' ? 'fa-map-marker-alt' : 'fa-user';
    var attr = kind === 'rev' ? 'data-rev="' + target + '"' : kind === 'marker' ? 'data-marker="' + target + '"' : 'data-username="' + target + '"';
    return '<a href="#" class="wiki-link wiki-code-link" ' + attr + '><i class="fas ' + icon + '" aria-hidden="true"></i>' + text + '</a>';
  });
  html = html.replace(/(^|[\s(])(https?:\/\/[^\s<]+[^\s<.,;:!?)\]'"])/g, function(all, lead, url) {
    return lead + '<a href="' + url + '" target="_blank" rel="noopener noreferrer nofollow">' + url + '</a>';
  });
  return html.replace(/\n/g, '<br>');
};

// Link clicks inside a wiki page. back reopens the page they're on.
ZMap.prototype._wireWikiLinks = function(root, back) {
  var _this = this;
  if(!root || root._wikiLinksWired) return;
  root._wikiLinksWired = true;
  $(root).on('click', 'a.wiki-link', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var link = this;
    if(link.hasAttribute('data-rev')) {
      _this._openMarkerRevision(Number(link.getAttribute('data-rev')), back);
    } else if(link.hasAttribute('data-marker')) {
      _this._openMarkerLink(Number(link.getAttribute('data-marker')));
    } else if(link.hasAttribute('data-user-id')) {
      _this._openUserProfile({ id: Number(link.getAttribute('data-user-id')) }, back);
    } else if(link.hasAttribute('data-username')) {
      _this._openUserProfile({ username: link.getAttribute('data-username') }, back);
    }
  });
};

// A marker on this map opens in place; one from another game opens there.
ZMap.prototype._openMarkerLink = function(markerId, revisionId) {
  var _this = this;
  var marker = this.cachedMarkersById[markerId];
  if(marker && !revisionId) {
    this.goTo({ marker: markerId });
    return;
  }
  this._wikiGet('marker_history', { markerId: markerId }).done(function(data) {
    if(!data.success) { toastr.error(data.msg); return; }
    var game = data.marker.game;
    if(!revisionId && (!game || game === _this.mapOptions.shortName)) {
      toastr.info('That marker isn\'t visible on this map.');
      return;
    }
    window.location.href = _this._wikiMarkerURL(markerId, game, revisionId);
  }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
};

ZMap.prototype._wikiMarkerURL = function(markerId, game, revisionId) {
  var url = new URL(window.location.href.split('?')[0]);
  url.searchParams.set('game', game || this.mapOptions.shortName);
  url.searchParams.set('marker', markerId);
  if(revisionId) url.searchParams.set('rev', revisionId);
  return url.href;
};

//************************************************************************//
//  History                                                               //
//************************************************************************//

ZMap.prototype._openMarkerHistory = function(markerId, back) {
  var _this = this;
  back = back || this._wikiBackToMarker(markerId);
  var reopen = function() { _this._openMarkerHistory(markerId, back); };
  var page = this._showWikiPage(
    '<div id="marker_history" class="wiki-page">' +
      '<h3 class="text-center">History</h3>' +
      '<p class="wiki-subtitle"></p>' +
      '<ul class="wiki-revisions"><li class="wiki-empty">Loading…</li></ul>' +
    '</div>',
    'markerHistory-' + markerId,
    back,
    reopen
  );
  this._wikiGet('marker_history', { markerId: markerId }).done(function(data) {
    var list = $(page).find('.wiki-revisions').empty();
    if(!data.success) {
      list.append($('<li class="wiki-empty"></li>').text(data.msg));
      return;
    }
    $(page).find('.wiki-subtitle').text(data.marker.title);
    if(!data.revisions.length) {
      list.append('<li class="wiki-empty">No changes have been saved since history started being kept. ' +
        'The first edit saves the current version here.</li>');
      return;
    }
    data.revisions.forEach(function(revision, index) {
      list.append(_this._wikiRevisionRow(revision, { current: index === 0 }));
    });
    list.on('click', '.wiki-revision', function(e) {
      if($(e.target).closest('a.wiki-link').length) return;
      _this._openMarkerRevision(Number(this.getAttribute('data-rev')), reopen);
    });
  }).fail(function(xhr) {
    $(page).find('.wiki-revisions').empty().append($('<li class="wiki-empty"></li>').text(_this._wikiError(xhr)));
  });
};

// One row of History or a profile's recent changes.
ZMap.prototype._wikiRevisionRow = function(revision, opts) {
  opts = opts || {};
  var summary = revision.summary
    ? '<span class="wiki-revision-summary">' + this._renderWikiText(revision.summary) + '</span>'
    : '';
  var title = opts.markerTitle
    ? '<span class="wiki-revision-marker">' + this._wikiEscape(opts.markerTitle) + '</span>'
    : '';
  var by = opts.hideUser ? '' : 'by ' + this._wikiUserLink(revision.userId, revision.username) + ' · ';
  return $('<li></li>').append(
    '<div class="wiki-revision" role="button" tabindex="0" data-rev="' + Number(revision.id) + '">' +
      '<span class="wiki-revision-top">' + this._wikiActionBadge(revision.action) +
        (opts.current ? '<span class="wiki-current">Current</span>' : '') +
        '<span class="wiki-revision-time">' + this._wikiEscape(this._wikiAgo(revision.ago)) + '</span>' +
      '</span>' +
      title + summary +
      '<span class="wiki-revision-by">' + by + 'Revision ' + Number(revision.id) + '</span>' +
      '<i class="fas fa-chevron-right wiki-chevron" aria-hidden="true"></i>' +
    '</div>'
  );
};

//************************************************************************//
//  One revision                                                          //
//************************************************************************//

ZMap.prototype._openMarkerRevision = function(revisionId, back) {
  var _this = this;
  var reopen = function() { _this._openMarkerRevision(revisionId, back); };
  var page = this._showWikiPage(
    '<div id="marker_revision" class="wiki-page">' +
      '<h3 class="text-center">Revision ' + Number(revisionId) + '</h3>' +
      '<p class="wiki-subtitle"></p>' +
      '<div class="wiki-revision-body"><p class="wiki-empty">Loading…</p></div>' +
    '</div>',
    'markerRevision-' + revisionId,
    back,
    reopen
  );
  this._wikiGet('marker_revision', { id: revisionId }).done(function(data) {
    var body = $(page).find('.wiki-revision-body').empty();
    if(!data.success) {
      body.append($('<p class="wiki-empty"></p>').text(data.msg));
      return;
    }
    var revision = data.revision;
    var snapshot = revision.data || {};
    _this._setRevisionURL(revision.markerId, revisionId);
    $(page).find('.wiki-subtitle').text(snapshot.title || 'Untitled marker');
    var code = '[[rev:' + revisionId + ']]';
    body.append(
      '<section class="wiki-card wiki-revision-meta">' +
        '<div class="wiki-revision-top">' + _this._wikiActionBadge(revision.action) +
          (data.isCurrent ? '<span class="wiki-current">Current</span>' : '') + '</div>' +
        '<p>' + _this._wikiUserLink(revision.userId, revision.username) +
          ' · ' + _this._wikiEscape(_this._wikiAgo(revision.ago)) + '</p>' +
        (revision.summary ? '<p class="wiki-revision-summary">' + _this._renderWikiText(revision.summary) + '</p>' : '') +
        (revision.revertsId ? '<p class="admin-muted">Restored <a href="#" class="wiki-link" data-rev="' +
          revision.revertsId + '">revision ' + revision.revertsId + '</a>.</p>' : '') +
      '</section>' +
      '<div class="wiki-actions">' +
        (data.canRevert && !data.isCurrent
          ? '<button type="button" class="wiki-action-button" data-action="revert"><i class="fas fa-undo" aria-hidden="true"></i>Restore This Version</button>'
          : '') +
        '<button type="button" class="wiki-action-button" data-action="copy-code"><i class="fas fa-code" aria-hidden="true"></i>Copy <code>' + code + '</code></button>' +
        '<button type="button" class="wiki-action-button" data-action="copy-url"><i class="fas fa-link" aria-hidden="true"></i>Copy Link</button>' +
        '<button type="button" class="wiki-action-button" data-action="history"><i class="fas fa-history" aria-hidden="true"></i>All Revisions</button>' +
      '</div>' +
      '<form class="wiki-revert-form" hidden>' +
        '<p>Restoring saves this version as a new edit, so it can be undone from History too.</p>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-comment-alt" aria-hidden="true"></i></span>' +
          '<input class="form-control" name="summary" maxlength="255" placeholder="Why? (optional)" autocomplete="off" />' +
        '</div></div>' +
        '<div class="wiki-button-pair">' +
          '<button type="button" class="infoWindowIcn form-action-button" data-action="cancel-revert">Cancel</button>' +
          '<button type="submit" class="infoWindowIcn form-action-button">Restore</button>' +
        '</div>' +
      '</form>' +
      '<section class="wiki-section"><h4>' + (data.previous ? 'Changes from revision ' + data.previous.id : 'Changes') + '</h4>' +
        _this._wikiDiffHTML(data.previous && data.previous.data, snapshot) + '</section>' +
      '<section class="wiki-section"><h4>This Version</h4>' +
        '<div class="wiki-card wiki-preview popupContent">' + _this._wikiPreviewHTML(snapshot) + '</div></section>'
    );
    body.on('click', '[data-action]', function(e) {
      var action = this.getAttribute('data-action');
      if(action === 'copy-code') _this._wikiCopy(code, 'Link code');
      else if(action === 'copy-url') _this._wikiCopy(_this._wikiMarkerURL(revision.markerId, data.game, revisionId), 'Link');
      else if(action === 'history') _this._openMarkerHistory(revision.markerId, _this._wikiBackToMarker(revision.markerId));
      else if(action === 'revert' || action === 'cancel-revert') {
        var opening = action === 'revert';
        body.find('.wiki-actions').prop('hidden', opening);
        body.find('.wiki-revert-form').prop('hidden', !opening);
        if(opening) body.find('.wiki-revert-form input').trigger('focus');
      }
    });
    body.find('.wiki-revert-form').on('submit', function(e) {
      e.preventDefault();
      var form = $(this);
      form.find('button').prop('disabled', true);
      _this._wikiPost('marker_revert', {
        revisionId: revisionId,
        summary: form.find('input').val(),
        game: _this.mapOptions.id
      }).done(function(result) {
        if(!result.success) {
          toastr.error(result.msg);
          form.find('button').prop('disabled', false);
          return;
        }
        _this._replaceMarkerFromServer(revision.markerId, result.marker);
        toastr.success('Restored revision ' + revisionId);
        _this.mapControl._navigatingBack = true;
        _this._openMarkerHistory(revision.markerId, _this._wikiBackToMarker(revision.markerId));
      }).fail(function(xhr) {
        toastr.error(_this._wikiError(xhr));
        form.find('button').prop('disabled', false);
      });
    });
  }).fail(function(xhr) {
    $(page).find('.wiki-revision-body').empty().append($('<p class="wiki-empty"></p>').text(_this._wikiError(xhr)));
  });
};

ZMap.prototype._setRevisionURL = function(markerId, revisionId) {
  try {
    var url = new URL(window.location.href);
    url.searchParams.set('marker', markerId);
    url.searchParams.set('rev', revisionId);
    window.history.replaceState(window.history.state, '', url.href);
  } catch(e) {}
};

// After a revert: the map shows the marker as the server now has it.
ZMap.prototype._replaceMarkerFromServer = function(markerId, markerJSON) {
  var fresh = null;
  try { fresh = (JSON.parse(markerJSON || '[]') || [])[0] || null; } catch(e) {}
  for(var i = 0; i < markers.length; i++) {
    if(markers[i].id == markerId) {
      this.map.removeLayer(markers[i]);
      markers[i].id = -1;
      markers[i].visible = 0;
      markers[i].categoryId = -1;
    }
  }
  delete this.cachedMarkersById[markerId];
  if(fresh && String(fresh.submapId) === String(this.mapControl.getCurrentMap().subMapId || fresh.submapId)) {
    this.addMarker(fresh);
  }
  this.refreshMap();
};

ZMap.prototype._wikiCategoryName = function(categoryId) {
  var match = (this.categoriesArr || []).find(function(c) { return String(c.id) === String(categoryId); });
  return match ? match.name : 'Category ' + categoryId;
};

ZMap.prototype._wikiPlainText = function(html) {
  var doc = new DOMParser().parseFromString('<div>' + (html || '') + '</div>', 'text/html');
  doc.querySelectorAll('br, p, div, li, h1, h2, h3, h4, h5, h6, tr').forEach(function(el) {
    el.insertAdjacentText('afterend', '\n');
  });
  doc.querySelectorAll('img').forEach(function(img) {
    img.replaceWith('[image: ' + (img.getAttribute('alt') || img.getAttribute('src') || '') + ']');
  });
  return (doc.body.textContent || '').replace(/[ \t]+/g, ' ').replace(/\n\s*\n+/g, '\n').trim();
};

// Word-by-word differences between two texts, marked with <del> and <ins>.
ZMap.prototype._wikiWordDiff = function(before, after) {
  var a = (before || '').split(/(\s+)/);
  var b = (after || '').split(/(\s+)/);
  // Long texts compare by line instead, to keep the table small.
  if(a.length * b.length > 4000000) {
    a = (before || '').split(/(\n)/);
    b = (after || '').split(/(\n)/);
  }
  var rows = a.length + 1, cols = b.length + 1;
  var table = new Uint32Array(rows * cols);
  for(var i = a.length - 1; i >= 0; i--) {
    for(var j = b.length - 1; j >= 0; j--) {
      table[i * cols + j] = a[i] === b[j]
        ? table[(i + 1) * cols + j + 1] + 1
        : Math.max(table[(i + 1) * cols + j], table[i * cols + j + 1]);
    }
  }
  var out = '', esc = this._wikiEscape.bind(this);
  var x = 0, y = 0;
  while(x < a.length || y < b.length) {
    if(x < a.length && y < b.length && a[x] === b[y]) { out += esc(a[x]); x++; y++; }
    else if(y < b.length && (x >= a.length || table[x * cols + y + 1] >= table[(x + 1) * cols + y])) {
      out += '<ins>' + esc(b[y]) + '</ins>'; y++;
    } else { out += '<del>' + esc(a[x]) + '</del>'; x++; }
  }
  return out.replace(/<\/ins><ins>/g, '').replace(/<\/del><del>/g, '').replace(/\n/g, '<br>');
};

ZMap.prototype._wikiDiffHTML = function(before, after) {
  var _this = this;
  after = after || {};
  if(!before) {
    return '<p class="wiki-empty">' + (after && after.title !== undefined
      ? 'The first saved version of this marker.' : 'Nothing to compare.') + '</p>';
  }
  var position = function(s) {
    return [s.x, s.y, s.z].filter(function(v) { return v !== null && v !== undefined; })
      .map(function(v) { return Math.round(v); }).join(', ');
  };
  var yesNo = function(v) { return Number(v) ? 'Yes' : 'No'; };
  var fields = [
    ['Title', before.title, after.title],
    ['Category', _this._wikiCategoryName(before.categoryId), _this._wikiCategoryName(after.categoryId)],
    ['Position', position(before), position(after)],
    ['Shown on every map', yesNo(before.global), yesNo(after.global)],
    ['Visible', yesNo(before.visible), yesNo(after.visible)],
    ['Internal notes', before.description, after.description]
  ];
  var count = Math.max((before.tabs || []).length, (after.tabs || []).length);
  for(var i = 0; i < count; i++) {
    fields.push([
      count > 1 ? 'Content ' + (i + 1) : 'Content',
      _this._wikiPlainText((before.tabs || [])[i]),
      _this._wikiPlainText((after.tabs || [])[i]),
      (before.tabs || [])[i] !== (after.tabs || [])[i]
    ]);
  }
  var rows = fields.filter(function(f) {
    return f.length > 3 ? f[3] : String(f[1] == null ? '' : f[1]) !== String(f[2] == null ? '' : f[2]);
  }).map(function(f) {
    var diff = _this._wikiWordDiff(String(f[1] == null ? '' : f[1]), String(f[2] == null ? '' : f[2]));
    if(f.length > 3 && f[1] === f[2]) diff += ' <span class="admin-muted">(formatting changed)</span>';
    return '<div class="wiki-diff-row"><dt>' + _this._wikiEscape(f[0]) + '</dt><dd>' + (diff || '<span class="admin-muted">Empty</span>') + '</dd></div>';
  });
  if(!rows.length) return '<p class="wiki-empty">No changes to the marker\'s content.</p>';
  return '<dl class="wiki-card wiki-diff">' + rows.join('') + '</dl>';
};

// A revision's content as the POI shows it, without anything that runs.
ZMap.prototype._wikiPreviewHTML = function(snapshot) {
  var html = (snapshot.tabs || []).join('').replace(
    /<p\b(?=[^>]*\bname\s*=\s*(['"])coord\1)[^>]*>[\s\S]*?<\/p>/gi, ''
  );
  var doc = new DOMParser().parseFromString('<div>' + html + '</div>', 'text/html');
  doc.querySelectorAll('script, style, iframe, object, embed, form, link, meta, base').forEach(function(el) { el.remove(); });
  doc.querySelectorAll('*').forEach(function(el) {
    Array.from(el.attributes).forEach(function(attr) {
      var name = attr.name.toLowerCase();
      if(name.indexOf('on') === 0 || (/^(href|src|xlink:href|action|formaction)$/.test(name) && /^\s*(javascript|data):/i.test(attr.value) && !/^data:image\//i.test(attr.value))) {
        el.removeAttribute(attr.name);
      }
    });
  });
  var out = doc.body.firstChild ? doc.body.firstChild.innerHTML.trim() : '';
  return out || '<p class="wiki-empty">No content.</p>';
};

//************************************************************************//
//  Talk                                                                  //
//************************************************************************//

// opts.highlight: a comment to scroll to and flash.
ZMap.prototype._openTalk = function(pageType, pageId, title, back, opts) {
  var _this = this;
  opts = opts || {};
  var reopen = function() { _this._openTalk(pageType, pageId, title, back); };
  var page = this._showWikiPage(
    '<div id="wiki_talk" class="wiki-page">' +
      '<h3 class="text-center">Talk</h3>' +
      '<p class="wiki-subtitle"></p>' +
      '<div class="wiki-follow" hidden><button type="button" class="wiki-follow-button" aria-pressed="false"></button></div>' +
      '<form class="wiki-comment-form wiki-new-comment">' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-comment" aria-hidden="true"></i></span>' +
          '<textarea class="form-control" name="body" rows="3" maxlength="5000" required ' +
            'placeholder="' + (pageType === 'user' ? 'Leave a message' : 'Start a discussion about this marker') + '"></textarea>' +
        '</div></div>' +
        '<p class="wiki-hint">Link with <code>[[rev:123]]</code>, <code>[[marker:45]]</code> or <code>[[user:name]]</code>.</p>' +
        '<button type="submit" class="infoWindowIcn form-action-button">Post</button>' +
      '</form>' +
      '<ul class="wiki-thread"><li class="wiki-empty">Loading…</li></ul>' +
    '</div>',
    'talk-' + pageType + '-' + pageId,
    back,
    reopen
  );
  $(page).find('.wiki-subtitle').text(title || '');

  var thread = $(page).find('.wiki-thread');
  // Following a marker's Talk page (znotifications.js).
  var followButton = $(page).find('.wiki-follow-button');
  var showFollowing = function(following) {
    followButton.attr('aria-pressed', following ? 'true' : 'false').html(following
      ? '<i class="fas fa-bell" aria-hidden="true"></i>Following'
      : '<i class="far fa-bell" aria-hidden="true"></i>Follow');
  };
  followButton.on('click', function() {
    var follow = followButton.attr('aria-pressed') !== 'true';
    followButton.prop('disabled', true);
    _this._wikiPost('talk_follow', { pageType: pageType, pageId: pageId, follow: follow ? '1' : '0' }).done(function(result) {
      followButton.prop('disabled', false);
      if(!result.success) { toastr.error(result.msg); return; }
      showFollowing(result.following);
      toastr.success(result.following ? 'You\'ll be notified about new comments here.' : 'Unfollowed.');
    }).fail(function(xhr) {
      followButton.prop('disabled', false);
      toastr.error(_this._wikiError(xhr));
    });
  });
  var load = function(focusId) {
    _this._wikiGet('talk_get', { pageType: pageType, pageId: pageId }).done(function(data) {
      thread.empty();
      if(!data.success) {
        thread.append($('<li class="wiki-empty"></li>').text(data.msg));
        return;
      }
      if(data.canFollow) {
        $(page).find('.wiki-follow').prop('hidden', false);
        showFollowing(data.following);
      }
      _this._renderTalkThread(thread, data.comments);
      if(focusId) {
        var added = thread.find('[data-comment-id="' + focusId + '"]')[0];
        if(added) {
          added.classList.add('wiki-comment-new');
          added.scrollIntoView({ block: 'nearest', behavior: 'smooth' });
        }
      }
    }).fail(function(xhr) {
      thread.empty().append($('<li class="wiki-empty"></li>').text(_this._wikiError(xhr)));
    });
  };
  var post = function(form, parentId) {
    var textarea = form.find('textarea');
    var body = textarea.val().trim();
    if(!body) return;
    form.find('button').prop('disabled', true);
    _this._wikiPost('talk_post', {
      pageType: pageType, pageId: pageId, parentId: parentId || 0, body: body
    }).done(function(result) {
      form.find('button').prop('disabled', false);
      if(!result.success) { toastr.error(result.msg); return; }
      textarea.val('');
      if(parentId) form.remove();
      if(result.following) showFollowing(true);
      load(result.id);
    }).fail(function(xhr) {
      form.find('button').prop('disabled', false);
      toastr.error(_this._wikiError(xhr));
    });
  };
  $(page).find('.wiki-new-comment').on('submit', function(e) {
    e.preventDefault();
    post($(this));
  });
  thread.on('click', '[data-comment-action]', function(e) {
    e.preventDefault();
    var action = this.getAttribute('data-comment-action');
    var comment = $(this).closest('.wiki-comment');
    var id = Number(comment.attr('data-comment-id'));
    if(action === 'reply') {
      if(comment.children('.wiki-reply-form').length) {
        comment.children('.wiki-reply-form').find('textarea').trigger('focus');
        return;
      }
      var form = $(
        '<form class="wiki-comment-form wiki-reply-form">' +
          '<div class="form-group"><div class="input-group">' +
            '<span class="input-group-addon"><i class="fas fa-reply" aria-hidden="true"></i></span>' +
            '<textarea class="form-control" rows="2" maxlength="5000" required placeholder="Reply to ' +
              _this._wikiEscape(comment.attr('data-username') || 'this comment') + '"></textarea>' +
          '</div></div>' +
          '<div class="wiki-button-pair">' +
            '<button type="button" class="infoWindowIcn form-action-button" data-reply-cancel>Cancel</button>' +
            '<button type="submit" class="infoWindowIcn form-action-button">Reply</button>' +
          '</div>' +
        '</form>'
      );
      comment.children('.wiki-comment-body-wrap').after(form);
      form.on('submit', function(ev) { ev.preventDefault(); post(form, id); });
      form.find('[data-reply-cancel]').on('click', function() { form.remove(); });
      form.find('textarea').trigger('focus');
    } else if(action === 'remove') {
      if(!window.confirm('Remove this comment? Replies to it stay.')) return;
      _this._wikiPost('talk_delete', { id: id }).done(function(result) {
        if(!result.success) { toastr.error(result.msg); return; }
        load();
      }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
    } else if(action === 'copy') {
      _this._wikiCopy(window.location.href.split('#')[0], 'Link');
    }
  });
  load(opts.highlight);
};

ZMap.prototype._renderTalkThread = function(thread, comments) {
  var _this = this;
  if(!comments.length) {
    thread.append('<li class="wiki-empty">No comments yet. Start the conversation.</li>');
    return;
  }
  var children = {};
  comments.forEach(function(c) {
    var key = c.parentId || 0;
    (children[key] = children[key] || []).push(c);
  });
  var render = function(comment, depth) {
    var avatar = comment.profilePicture || 'images/default-avatar.png';
    var item = $('<li class="wiki-comment"></li>')
      .attr('data-comment-id', comment.id)
      .attr('data-username', comment.username || '')
      .toggleClass('wiki-comment-deleted', comment.deleted);
    item.append(
      '<div class="wiki-comment-body-wrap">' +
        '<img class="wiki-avatar" src="' + _this._wikiEscape(avatar) + '" alt="" loading="lazy" ' +
          'onerror="this.onerror=null;this.src=\'images/default-avatar.png\'" />' +
        '<div class="wiki-comment-main">' +
          '<div class="wiki-comment-head">' + _this._wikiUserLink(comment.userId, comment.username) +
            (comment.level >= _this.WIKI_ADMIN_LEVEL ? '<span class="wiki-role">Admin</span>' : '') +
            '<span class="wiki-comment-time">' + _this._wikiEscape(_this._wikiAgo(comment.ago)) + '</span></div>' +
          '<div class="wiki-comment-body">' +
            (comment.deleted ? '<em>Comment removed</em>' : _this._renderWikiText(comment.body)) + '</div>' +
          (comment.deleted ? '' :
            '<div class="wiki-comment-actions">' +
              '<button type="button" data-comment-action="reply"><i class="fas fa-reply" aria-hidden="true"></i>Reply</button>' +
              (comment.canDelete ? '<button type="button" data-comment-action="remove"><i class="fas fa-trash-alt" aria-hidden="true"></i>Remove</button>' : '') +
            '</div>') +
        '</div>' +
      '</div>'
    );
    var replies = children[comment.id] || [];
    // A removed comment nobody replied to is left out.
    if(comment.deleted && !replies.length) return null;
    if(replies.length) {
      var list = $('<ul class="wiki-replies"></ul>');
      // Past a few levels, deeper replies line up instead of shrinking.
      if(depth >= 4) list.addClass('wiki-replies-flat');
      replies.forEach(function(reply) {
        var rendered = render(reply, depth + 1);
        if(rendered) list.append(rendered);
      });
      item.append(list);
    }
    return item;
  };
  (children[0] || []).forEach(function(comment) {
    var rendered = render(comment, 0);
    if(rendered) thread.append(rendered);
  });
  // Replies whose parent is missing still show, at the top level.
  var ids = {};
  comments.forEach(function(c) { ids[c.id] = true; });
  comments.filter(function(c) { return c.parentId && !ids[c.parentId]; }).forEach(function(c) {
    var rendered = render(c, 0);
    if(rendered) thread.append(rendered);
  });
  if(!thread.children().length) thread.append('<li class="wiki-empty">No comments yet. Start the conversation.</li>');
};

//************************************************************************//
//  Profiles                                                              //
//************************************************************************//

// who is { id } or { username }.
ZMap.prototype._openUserProfile = function(who, back) {
  var _this = this;
  back = back || function() { _this.mapControl.resetContent(); };
  var params = who.username ? { username: who.username } : { id: who.id };
  this._wikiGet('user_profile', params).done(function(data) {
    if(!data.success) { toastr.error(data.msg); return; }
    _this._renderUserProfile(data, back);
  }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
};

ZMap.prototype._renderUserProfile = function(data, back) {
  var _this = this;
  var profile = data.user;
  var reopen = function() { _this._openUserProfile({ id: profile.id }, back); };
  var avatar = profile.profilePicture || 'images/default-avatar.png';
  var stat = function(n, label) {
    return '<div><strong>' + Number(n).toLocaleString() + '</strong><span>' + label + '</span></div>';
  };
  var page = this._showWikiPage(
    '<div id="user_profile" class="wiki-page">' +
      '<div class="profile-banner"' + (profile.banner ? ' style="background-image:url(\'' + _this._wikiEscape(profile.banner) + '\')"' : '') + '></div>' +
      '<div class="profile-head">' +
        '<img class="profile-avatar" src="' + _this._wikiEscape(avatar) + '" alt="" ' +
          'onerror="this.onerror=null;this.src=\'images/default-avatar.png\'" />' +
        '<h3 class="profile-name">' + _this._wikiEscape(profile.username) + '</h3>' +
        '<p class="profile-role">' + _this._wikiRoleLabel(profile.level) +
          ' · Joined ' + _this._wikiEscape(_this._adminTime(profile.joinedAgo, { dateOnly: true }) || '') + '</p>' +
      '</div>' +
      '<div class="profile-stats">' + stat(data.counts.markers, 'Markers') + stat(data.counts.edits, 'Edits') +
        stat(data.counts.comments, 'Comments') + '</div>' +
      '<div class="wiki-actions profile-actions">' +
        '<button type="button" class="wiki-action-button" data-action="talk"><i class="fas fa-comments" aria-hidden="true"></i>Talk</button>' +
        (data.canEdit ? '<button type="button" class="wiki-action-button" data-action="edit"><i class="fas fa-pencil-alt" aria-hidden="true"></i>Edit Profile</button>' : '') +
        '<button type="button" class="wiki-action-button" data-action="copy-code"><i class="fas fa-code" aria-hidden="true"></i>Copy <code>[[user:' + _this._wikiEscape(profile.username) + ']]</code></button>' +
      '</div>' +
      '<section class="wiki-section profile-bio-section"><h4>About</h4>' +
        '<div class="wiki-card profile-bio"></div></section>' +
      (data.canEdit ?
        '<form class="profile-edit-form wiki-section" hidden>' +
          '<h4>Edit Profile</h4>' +
          '<div class="form-group"><div class="input-group">' +
            '<span class="input-group-addon"><i class="fas fa-align-left" aria-hidden="true"></i></span>' +
            '<textarea class="form-control" name="bio" rows="5" maxlength="2000" placeholder="A little about you, and the games you map"></textarea>' +
          '</div></div>' +
          '<p class="wiki-hint">Plain text. Link codes like <code>[[marker:45]]</code> work here too.</p>' +
          '<div class="wiki-button-pair">' +
            '<button type="button" class="infoWindowIcn form-action-button" data-action="choose-banner">' + (profile.banner ? 'Change Banner' : 'Add Banner') + '</button>' +
            (profile.banner ? '<button type="button" class="infoWindowIcn form-action-button bad" data-action="remove-banner">Remove Banner</button>' : '') +
          '</div>' +
          '<input type="file" class="profile-banner-input" accept="image/jpeg,image/png,image/webp,image/gif" hidden />' +
          '<p class="admin-muted">Banners are cropped to 3:1, at least 1500 × 500 pixels looks best.</p>' +
          '<p class="admin-user-status" role="status" aria-live="polite"></p>' +
          '<div class="wiki-button-pair">' +
            '<button type="button" class="infoWindowIcn form-action-button" data-action="cancel-edit">Cancel</button>' +
            '<button type="submit" class="infoWindowIcn form-action-button">Save</button>' +
          '</div>' +
        '</form>' : '') +
      '<section class="wiki-section"><h4>Recent Changes</h4><ul class="wiki-revisions profile-changes"></ul></section>' +
    '</div>',
    'userProfile-' + profile.id,
    back,
    reopen
  );
  var showBio = function(bio) {
    $(page).find('.profile-bio').html(bio
      ? _this._renderWikiText(bio)
      : '<span class="admin-muted">' + (data.isSelf ? 'You haven\'t written a bio yet.' : 'No bio yet.') + '</span>');
  };
  showBio(profile.bio);
  var changes = $(page).find('.profile-changes');
  if(!data.changes.length) changes.append('<li class="wiki-empty">No changes yet.</li>');
  data.changes.forEach(function(change) {
    changes.append(_this._wikiRevisionRow(change, { markerTitle: change.markerTitle || ('Marker #' + change.markerId), hideUser: true }));
  });
  changes.on('click', '.wiki-revision', function() {
    _this._openMarkerRevision(Number(this.getAttribute('data-rev')), reopen);
  });

  var form = $(page).find('.profile-edit-form');
  var status = form.find('.admin-user-status');
  var setStatus = function(text, kind) {
    status.removeClass('error success').addClass(kind || '').text(text || '');
  };
  $(page).on('click', '[data-action]', function(e) {
    var action = this.getAttribute('data-action');
    if(action === 'talk') {
      _this._openTalk('user', profile.id, profile.username, reopen);
    } else if(action === 'copy-code') {
      _this._wikiCopy('[[user:' + profile.username + ']]', 'Link code');
    } else if(action === 'edit') {
      form.prop('hidden', false);
      $(page).find('.profile-bio-section, .profile-actions').prop('hidden', true);
      form.find('textarea').val(profile.bio || '').trigger('focus');
    } else if(action === 'cancel-edit') {
      form.prop('hidden', true);
      $(page).find('.profile-bio-section, .profile-actions').prop('hidden', false);
      setStatus('');
    } else if(action === 'choose-banner') {
      form.find('.profile-banner-input').trigger('click');
    } else if(action === 'remove-banner') {
      _this._wikiPost('user_profile_save', { userId: profile.id, removeBanner: 1 }).done(function(result) {
        if(!result.success) { setStatus(result.msg, 'error'); return; }
        profile.banner = null;
        $(page).find('.profile-banner').css('background-image', '');
        $(e.target).closest('button').remove();
        form.find('[data-action="choose-banner"]').text('Add Banner');
        setStatus(result.msg, 'success');
      }).fail(function(xhr) { setStatus(_this._wikiError(xhr), 'error'); });
    }
  });
  form.find('.profile-banner-input').on('change', function() {
    var file = this.files && this.files[0];
    if(!file) return;
    var upload = new FormData();
    upload.append('banner', file);
    upload.append('userId', profile.id);
    setStatus('Uploading…');
    $.ajax({
      type: 'POST', url: 'ajax.php?command=update_profile_banner', data: upload,
      processData: false, contentType: false, dataType: 'json'
    }).done(function(result) {
      if(!result.success) { setStatus(result.msg, 'error'); return; }
      profile.banner = result.banner;
      $(page).find('.profile-banner').css('background-image', 'url("' + result.banner + '")');
      form.find('[data-action="choose-banner"]').text('Change Banner');
      setStatus(result.msg, 'success');
    }).fail(function(xhr) { setStatus(_this._wikiError(xhr), 'error'); });
    this.value = '';
  });
  form.on('submit', function(e) {
    e.preventDefault();
    form.find('button[type="submit"]').prop('disabled', true);
    _this._wikiPost('user_profile_save', { userId: profile.id, bio: form.find('textarea').val() }).done(function(result) {
      form.find('button[type="submit"]').prop('disabled', false);
      if(!result.success) { setStatus(result.msg, 'error'); return; }
      profile.bio = result.bio;
      showBio(result.bio);
      form.prop('hidden', true);
      $(page).find('.profile-bio-section, .profile-actions').prop('hidden', false);
      setStatus('');
      toastr.success(result.msg);
    }).fail(function(xhr) {
      form.find('button[type="submit"]').prop('disabled', false);
      setStatus(_this._wikiError(xhr), 'error');
    });
  });
};
