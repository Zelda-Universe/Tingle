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
  // Beta testers edit any marker too (scripts/zbeta.js), but can't delete.
  return me.level >= this.WIKI_ADMIN_LEVEL || !!me.betaEditor ||
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

ZMap.prototype._wikiRoleLabel = function(level, beta) {
  level = Number(level);
  if(level >= this.WIKI_ADMIN_LEVEL) return 'Admin';
  // In the community editing beta (scripts/zbeta.js), who edit at
  // Contributor level.
  if(beta) return 'Beta Editor';
  if(level >= this.WIKI_EDITOR_LEVEL) return 'Contributor';
  return 'Member';
};

ZMap.prototype.WIKI_ACTIONS = {
  comment: { label: 'Commented', icon: 'fa-comment' },
  reply: { label: 'Replied', icon: 'fa-reply' },
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
  return '<a href="'+this._wikiEscape(this._wikiUserURL(username || userId))+'" class="wiki-user wiki-link" data-user-id="' + Number(userId) + '">' +
    this._wikiEscape(username) + '</a>';
};

ZMap.prototype._wikiUserURL = function(identifier,talk) {
  return '?user='+encodeURIComponent(identifier)+(talk?'&talk=1':'');
};

ZMap.prototype._wikiBackToAccount = function() {
  var zmap=this,back=function() {zmap._createAccountForm(zmap.getUser());};
  back.label='Account';back.navigationSource={type:'page',page:'account'};
  return back;
};

// Opens a wiki page in the drawer. back runs from its Back button (and
// swiping back); it's passed on so pages can be reopened the same way.
// Links on it open pages that come back to it with reopen. opts.settles
// marks a page whose content loads after it opens (a list from the
// server): the drawer keeps its height until the content does, rather than
// shrinking to the Loading placeholder (scripts/controls/ZLayers.js).
ZMap.prototype._showWikiPage = function(html, type, back, reopen, opts) {
  var control = this.mapControl;
  control._nextPageBack = back || null;
  control._nextPageSettles = !!(opts && opts.settles);
  control._nextPageWaitForReady = !!(opts && opts.waitForReady);
  control._navigatingForward = !control._navigatingBack;
  control.setContent(html, type);
  if(control.viewStyleBottomSlide) {
    // Most open the drawer most of the way; some (a path) only part way,
    // leaving the map they're about in view.
    if(!control._navigatingBack) {
      // (At once, opened from a link or a reload: opts.instant.)
      if(opts && opts.partialDrawer) { if(opts.instant) control.openDrawerSmall(true, true); else control.openDrawerDefaultPartial(); }
      else control.openDrawerLarge();
    }
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

// Explicit completion also covers empty responses whose placeholder and
// final content have the same height (so ResizeObserver doesn't fire).
// Form primitives shared by marker, region/area, and Map Settings editors.
ZMap.prototype._editorFieldHTML = function(icon, control, label) {
  return (label ? '<label class="map-settings-label">' + this._wikiEscape(label) + '</label>' : '') +
    '<div class="form-group"><div class="input-group">' +
    '<span class="input-group-addon"><i class="fas ' + this._wikiEscape(icon) + '" aria-hidden="true"></i></span>' +
    control + '</div></div>';
};

ZMap.prototype._editorSaveHTML = function(editing, label) {
  return '<p class="admin-user-status" role="status" aria-live="polite"></p>' +
    (editing ? '<p class="marker-edit-pending" role="status" aria-live="polite">No changes to save.</p>' : '') +
    '<button type="submit" class="infoWindowIcn form-action-button"' + (editing ? ' disabled' : '') + '>' +
    this._wikiEscape(label || 'Save Changes') + '</button>';
};

ZMap.prototype._editorNameError = function(value, maxLength, allowMarkup) {
  value=String(value || '').trim();
  return !value ? 'Enter a name.' : value.length > maxLength ? 'Use '+maxLength+' characters or fewer.' :
    !allowMarkup && /[<>]/.test(value) ? 'Names cannot contain HTML.' : '';
};

ZMap.prototype._editorSaveState = function(form, dirty, valid, busy, label) {
  form.find('button[type="submit"]').prop('disabled',!!busy || !valid || !dirty)
    .text(busy ? 'Saving…' : label || 'Save Changes');
  form.find('.marker-edit-pending').prop('hidden',!!dirty);
};

ZMap.prototype._wikiPageSettled = function(page) {
  var control=this.mapControl;
  window.requestAnimationFrame(function() {
    if(!page || !control._contents.contains(page)) return;
    control._settleWaitingForReady = false;
    if(control._settleFit) control._settleFit();
  });
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
  var _this = this, control = this.mapControl;
  // The marker page open now keeps its own Back button (to the edit it was
  // opened from with Go to Marker, a search, an area…) when it's come back to.
  var returnsTo = control && control.getContentType() === 'm' + markerId ? control._pageReturnsTo : null;
  var back = function() {
    var marker = _this.cachedMarkersById[markerId];
    if(marker && marker.visible !== false && marker.visible !== 0) {
      if(returnsTo) control.returnNextPageTo(returnsTo);
      _this._createMarkerPopup(marker);
    } else {
      _this.mapControl.resetContent();
    }
  };
  back.fromMarker = Number(markerId);
  back.navigationSource={type:'marker',id:Number(markerId)};
  back.navigationBack=returnsTo && returnsTo.page || null;
  return back;
};

// A page's reopen function, which links on it come back with: label names
// the page for its Back button, and a page reached from a marker (its POI
// footer, or a page opened from one) passes that on in fromMarker.
ZMap.prototype._wikiReopen = function(reopen, back, label) {
  reopen.label = label;
  reopen.fromMarker = back && back.fromMarker || null;
  reopen.navigationBack = back || null;
  return reopen;
};

// The marker a page is about can be shown on the map, here or in its game.
ZMap.prototype._wikiMarkerReachable = function(markerId, game) {
  if(game && this.mapOptions && game !== this.mapOptions.shortName) return true;
  var marker = this.cachedMarkersById[markerId];
  return !!marker && marker.visible !== false && marker.visible !== 0;
};

// The marker's name under a page's title, with a Go to Marker pill unless
// the page was reached from that marker (where Back already goes).
ZMap.prototype._wikiSetMarkerSubtitle = function(page, title, markerId, game, reopen, opts) {
  opts=opts || {};
  var _this = this;
  var row = $(page).find('.wiki-subtitle-row').first();
  row.find('.wiki-subtitle').text(title || '');
  row.find('.wiki-marker-pill').remove();
  if(!markerId || Number(reopen && reopen.fromMarker) === Number(markerId) || !this._wikiMarkerReachable(markerId, game)) return;
  var marker=this.cachedMarkersById[markerId];
  var isArea=marker && marker.categoryTypeId == 3;
  $('<button type="button" class="marker-coordinate-pill marker-region-pill wiki-marker-pill">'+(opts.view ? (isArea?'View Region':'View Marker') : (isArea ? 'Go to Region' : 'Go to Marker')) +
    '<i class="fas fa-chevron-right" aria-hidden="true"></i></button>')
    .on('click', function() {
      var control=_this.mapControl,skip=control._skipNextSlide;
      if(opts.view) control._skipNextSlide=true;
      try {_this._openMarkerLink(Number(markerId), null, reopen, game);} finally {control._skipNextSlide=skip;}
    })
    .appendTo(row);
};

//************************************************************************//
//  POI footer                                                            //
//************************************************************************//

// Under a POI's content: who added it, and Edit, History, Talk and Delete.
// Editors only.
ZMap.prototype._markerEditorToolsHTML = function(marker, opts) {
  opts=opts || {};
  var viewer=this.getUser();
  if(opts.mapSettings && !this._canUseMapSettings()) return '';
  if(!marker || !(marker.id > 0)) return '';
  var canEdit = opts.mapSettings ? this._canUseMapSettings() : opts.regionMode ? !!viewer && viewer.level>=10 : this._canEditMarker(marker);
  var canDelete = canEdit && opts.allowDelete !== false && !this.getUser().betaEditor;
  var id = Number(marker.id);
  var button = function(action, icon, label, extra) {
    return '<button type="button" class="marker-editor-button' + (extra || '') + '" data-editor-action="' + action + '">' +
      '<i class="fas ' + icon + '" aria-hidden="true"></i><span>' + label + '</span></button>';
  };
  return '<section class="marker-editor-tools' + (opts.regionMode ? ' area-admin-actions' : '') + '" data-marker-id="' + id + '">' +
    (opts.hideIdentity || !viewer || Number(viewer.level)<this.WIKI_ADMIN_LEVEL ? '' : '<div class="marker-editor-meta">' +
      '<span>' + this._wikiEscape(opts.identityLabel || 'Marker') + ' #' + id + '</span>' +
      (marker.userName ? '<span>Added by ' + this._wikiUserLink(marker.userId, marker.userName) + '</span>' : '') +
    '</div>') +
    '<div class="marker-editor-buttons">' +
      (canEdit || !this._isWikiEditor() ? button('edit', 'fa-pencil-alt', 'Edit') : '') +
      button('history', 'fa-history', 'History') +
      (opts.talk === false ? '' : button('talk', 'fa-comments', 'Talk')) +
      // Deleting isn't part of the editing beta (scripts/zbeta.js).
      (canDelete ? button('delete', 'fa-trash-alt', 'Delete', ' bad') : '') +
    '</div>' +
    (canDelete ? '<div class="marker-editor-confirm" hidden>' +
      '<p>Delete this marker? It disappears from the map, and can be brought back from its History.</p>' +
      '<div class="wiki-button-pair">' +
        '<button type="button" class="infoWindowIcn form-action-button" data-editor-action="cancel-delete">Cancel</button>' +
        '<button type="button" class="infoWindowIcn form-action-button bad" data-editor-action="confirm-delete">Delete Marker</button>' +
      '</div>' +
    '</div>' : '') +
  '</section>';
};

ZMap.prototype._wireEditorTools = function(tools, handler, back) {
  var zmap=this;
  this._wireWikiLinks(tools,back);
  $(tools).on('click','[data-editor-action]',function(e) {
    e.preventDefault();
    if(this.getAttribute('data-editor-action')==='edit' && !zmap._isWikiEditor()) {zmap._showEditingBetaAlert();return;}
    handler.call(this,this.getAttribute('data-editor-action'),e);
  });
};

// Adds (or updates) the footer on the open POI page, which may have opened
// before the account finished loading.
ZMap.prototype._refreshMarkerEditorTools = function(marker) {
  var _this = this;
  var page = this.mapControl._contents.querySelector('.menu-cat-content-inner');
  if(!page || !marker) return;
  $(page).children('.marker-editor-tools').remove();
  // (Deleting a marker is on its edit page, under Save: zmap.js editMarker.)
  var html = this._markerEditorToolsHTML(marker, {allowDelete: false});
  if(!html) return;
  $(page).append(html);
  // Paths (scripts/services/PathEditor.js): a way to start one, under the rest.
  if(this._addMakePathButton) this._addMakePathButton(marker);
  var tools = page.querySelector('.marker-editor-tools');
  this._wireEditorTools(tools, function(action) {
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
  }, this._wikiBackToMarker(marker.id));
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
  html = html.replace(/\[\[(rev|settingsrev|marker|user):([^\]|]{1,64})(?:\|([^\]]{1,120}))?\]\]/gi, function(all, kind, target, label) {
    kind = kind.toLowerCase();
    target = target.trim();
    if((kind === 'rev' || kind === 'settingsrev' || kind === 'marker') && !/^\d+$/.test(target)) return all;
    var text = label ? label.trim() : ((kind === 'rev' || kind === 'settingsrev') ? 'revision ' + target : kind === 'marker' ? 'marker #' + target : target);
    var icon = (kind === 'rev' || kind === 'settingsrev') ? 'fa-history' : kind === 'marker' ? 'fa-map-marker-alt' : 'fa-user';
    var attr = kind==='settingsrev' ? 'data-settings-rev="'+target+'"' : kind === 'rev' ? 'data-rev="' + target + '"' : kind === 'marker' ? 'data-marker="' + target + '"' : 'data-username="' + target + '"';
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
  this._wireYeahs(root);
  $(root).on('click', 'a.wiki-link', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var link = this;
    if(link.hasAttribute('data-settings-rev')) {
      _this._openSettingsRevisionLink(Number(link.getAttribute('data-settings-rev')),null,back);
    } else if(link.hasAttribute('data-rev')) {
      _this._openMarkerRevision(Number(link.getAttribute('data-rev')), back);
    } else if(link.hasAttribute('data-marker')) {
      _this._openMarkerLink(Number(link.getAttribute('data-marker')), null, back, link.getAttribute('data-game'));
    } else if(link.hasAttribute('data-user-id')) {
      _this._openUserProfile({ id: Number(link.getAttribute('data-user-id')) }, back);
    } else if(link.hasAttribute('data-username')) {
      _this._openUserProfile({ username: link.getAttribute('data-username') }, back);
    }
  });
};

ZMap.prototype._yeahHTML = function(type,id,summary) {
  var key=type+':'+Number(id);
  if(summary) return '<span class="yeah-target yeah-summary" data-yeah-key="'+key+'" aria-label="Yeahs"><span class="yeah-icon yeah-person" aria-hidden="true"></span><span class="yeah-count">0</span></span>';
  return '<button type="button" class="wiki-action-button yeah-target yeah-button" data-yeah-key="'+key+'" aria-pressed="false" disabled><span class="yeah-icon yeah-plus" aria-hidden="true"></span><span class="yeah-label">Yeah!</span><span class="yeah-count">0</span></button>';
};

ZMap.prototype._wireYeahs = function(root) {
  root=root && (root.jquery ? root[0] : root);
  if(!root || root._yeahWired || typeof MutationObserver==='undefined') return;
  root._yeahWired=true;
  var zmap=this,timer;
  var paint=function(key,state) {
    $(root).find('[data-yeah-key="'+key+'"]').each(function() {
      $(this).attr('aria-pressed',state.liked?'true':'false').attr('aria-label',(state.liked?'Undo Yeah':'Yeah')+' · '+state.count+' Yeahs');
      $(this).find('.yeah-count').text(state.count);
      $(this).find('.yeah-label').text(state.liked?'Yeah’d':'Yeah!');
      $(this).prop('disabled',false);
    });
  };
  var hydrate=function() {
    var targets=$(root).find('[data-yeah-key]:not([data-yeah-loaded])'),keys=[];
    targets.each(function() {this.setAttribute('data-yeah-loaded','1');var key=this.getAttribute('data-yeah-key');if(keys.indexOf(key)<0) keys.push(key);});
    for(var i=0;i<keys.length;i+=100) zmap._wikiGet('likes_get',{targets:JSON.stringify(keys.slice(i,i+100))}).done(function(data) {
      if(data.success) Object.keys(data.states).forEach(function(key) {paint(key,data.states[key]);});
    });
  };
  root._yeahObserver=new MutationObserver(function(records) {
    if(!records.some(function(r) {return Array.from(r.addedNodes).some(function(n) {return n.nodeType===1 && (n.matches('[data-yeah-key]') || n.querySelector('[data-yeah-key]'));});})) return;
    window.clearTimeout(timer);timer=window.setTimeout(hydrate,0);
  });
  root._yeahObserver.observe(root,{childList:true,subtree:true});
  $(root).on('click','.yeah-button',function(e) {
    e.preventDefault();e.stopPropagation();
    if(!zmap._isWikiEditor()) {zmap._showEditingBetaAlert();return;}
    var button=$(this),key=this.getAttribute('data-yeah-key'),parts=key.split(':');
    button.prop('disabled',true);
    zmap._wikiPost('likes_set',{type:parts[0],id:parts[1],liked:button.attr('aria-pressed')==='true'?'0':'1'}).done(function(data) {
      if(data.success) paint(key,data);else toastr.error(data.msg || 'Could not save your Yeah.');
    }).fail(function(xhr) {toastr.error(zmap._wikiError(xhr));}).always(function() {button.prop('disabled',false);});
  });
  hydrate();
};

// A marker on this map opens in place, with a Back button to back (the page
// it was opened from); one from another game opens there.
ZMap.prototype._openMarkerLink = function(markerId, revisionId, back, game) {
  var _this = this;
  if(game && this.mapOptions && game !== this.mapOptions.shortName) {
    window.location.href = this._markerURLWithReturn(this._wikiMarkerURL(markerId, game, revisionId),back);
    return;
  }
  var marker = this.cachedMarkersById[markerId];
  if(marker && !revisionId) {
    if(back) {
      this.mapControl.returnNextPageTo({ page: back, label: back.label });
      // Onward, from the page it was opened from.
      this.mapControl._navigatingForward = true;
    }
    if(marker.categoryTypeId == 3) this.navigateToArea(marker);
    else this.navigateToMarker(markerId);
    return;
  }
  this._wikiGet('marker_history', { markerId: markerId }).done(function(data) {
    if(!data.success) { toastr.error(data.msg); return; }
    var game = data.marker.game;
    if(!revisionId && (!game || game === _this.mapOptions.shortName)) {
      toastr.info('That marker isn\'t visible on this map.');
      return;
    }
    window.location.href = _this._markerURLWithReturn(_this._wikiMarkerURL(markerId, game, revisionId),back);
  }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
};

ZMap.prototype._wikiMarkerURL = function(markerId, game, revisionId) {
  var url = new URL(window.location.href.split('?')[0]);
  url.searchParams.set('game', game || this.mapOptions.shortName);
  url.searchParams.set('marker', markerId);
  if(!revisionId) url.searchParams.set('zoom',6);
  if(revisionId) url.searchParams.set('rev', revisionId);
  return url.href;
};

//************************************************************************//
//  History                                                               //
//************************************************************************//

ZMap.prototype._wikiHistoryEmptyHTML = function() {
  return '<li class="wiki-empty wiki-history-empty">No changes have been saved since history started being kept. ' +
    'The first edit saves the current version here.</li>';
};

ZMap.prototype._openMarkerHistory = function(markerId, back) {
  var _this = this;
  back = back || this._wikiBackToMarker(markerId);
  var reopen = this._wikiReopen(function() { _this._openMarkerHistory(markerId, back); }, back, 'History');
  reopen.historyOf = Number(markerId);
  reopen.navigationSource={type:'history',id:Number(markerId)};
  var page = this._showWikiPage(
    '<div id="marker_history" class="wiki-page">' +
      '<h3 class="text-center">History</h3>' +
      '<div class="area-header-pills wiki-subtitle-row"><p class="wiki-subtitle"></p></div>' +
      '<ul class="wiki-revisions"><li class="wiki-empty">Loading…</li></ul>' +
    '</div>',
    'markerHistory-' + markerId,
    back,
    reopen,
    { settles: true, waitForReady: true }
  );
  this._wikiGet('marker_history', { markerId: markerId }).done(function(data) {
    var list = $(page).find('.wiki-revisions').empty();
    if(!data.success) {
      list.append($('<li class="wiki-empty"></li>').text(data.msg));
      return;
    }
    _this._wikiSetMarkerSubtitle(page, data.marker.title, markerId, data.marker.game, reopen);
    if(!data.revisions.length) {
      list.append(_this._wikiHistoryEmptyHTML());
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
  }).always(function() { _this._wikiPageSettled(page); });
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
  var by = opts.hideUser ? '' : this._activityAvatarHTML(revision) + 'by ' + this._wikiUserLink(revision.userId, revision.username) + ' · ';
  // A path's save (scripts/services/PathEditor.js): its path's name with a
  // signpost, the path it opens, and no Yeah (those are for markers' edits).
  var isPath = revision.revisionType === 'path';
  if(isPath && opts.markerTitle) title = '<span class="wiki-revision-marker"><i class="fas fa-map-signs" aria-hidden="true"></i> ' + this._wikiEscape(opts.markerTitle) + '</span>';
  var pathAttrs = isPath ? ' data-path-id="' + Number(revision.pageId) + '" data-path-slug="' + this._wikiEscape(revision.body || '') + '" data-game="' + this._wikiEscape(revision.game || '') + '"' : '';
  return $('<li></li>').append(
    '<div class="wiki-revision" role="button" tabindex="0" data-rev="' + Number(revision.id) + '"' + pathAttrs + '>' +
      '<span class="wiki-revision-top">' + this._wikiActionBadge(revision.action) +
        (opts.current ? '<span class="wiki-current">Current</span>' : '') +
        '<span class="wiki-revision-time">' + this._wikiEscape(this._wikiAgo(revision.ago)) + '</span>' +
      '</span>' +
      title + summary +
      '<span class="wiki-revision-by">' + by + 'Revision ' + Number(revision.id) + (isPath ? '' : this._yeahHTML(revision.revisionType==='settings'?'settings':'revision',revision.id,true)) + '</span>'+
      '<i class="fas fa-chevron-right wiki-chevron" aria-hidden="true"></i>' +
    '</div>'
  );
};

ZMap.prototype._activityFilterHTML = function(selected) {
  return '<div class="admin-tabs activity-filters" role="group" aria-label="Activity filter">'+['all','edits','talk'].map(function(value) {
    var icon={all:'fa-th-list',edits:'fa-pencil-alt',talk:'fa-comments'}[value];
    return '<button type="button" data-activity-filter="'+value+'" aria-selected="'+(value===(selected || 'all')?'true':'false')+'"><i class="fas '+icon+'" aria-hidden="true"></i>'+value.charAt(0).toUpperCase()+value.slice(1)+'</button>';
  }).join('')+'</div>';
};

ZMap.prototype._activityAvatarHTML = function(item) {
  return '<img class="activity-avatar" src="'+this._wikiEscape(item.profilePicture || 'images/default-avatar.png')+'" alt="" loading="lazy" onerror="this.onerror=null;this.src=\'images/default-avatar.png\'">';
};

ZMap.prototype._wikiActivityRow = function(change,opts) {
  opts=opts || {};
  if(change.revisionType!=='talk') return this._wikiRevisionRow(change,opts);
  var row=$('<li class="activity-talk-item"></li>');
  var quote=change.parentId ? '<blockquote class="activity-reply-quote"><cite>'+this._wikiEscape(change.parentUsername || 'Comment')+'</cite><div>'+this._renderWikiText(change.parentBody || 'Comment removed')+'</div></blockquote>' : '';
  row.append('<div class="wiki-revision activity-talk" role="button" tabindex="0"><span class="wiki-revision-top">'+this._wikiActionBadge(change.parentId?'reply':'comment')+'<span class="wiki-revision-time">'+this._wikiEscape(this._wikiAgo(change.ago))+'</span></span>'+
    (change.pageType==='marker' && !change.markerDeleted ? '<a href="'+this._wikiEscape(this._wikiMarkerURL(change.pageId,change.game))+'" class="wiki-link wiki-revision-marker" data-marker="'+Number(change.pageId)+'" data-game="'+this._wikiEscape(change.game || '')+'">'+this._wikiEscape(opts.markerTitle || change.markerTitle)+'</a>' : '<span class="wiki-revision-marker">'+this._wikiEscape(opts.markerTitle || change.markerTitle)+'</span>')+
    '<div class="activity-comment-body">'+this._renderWikiText(change.body || '')+'</div>'+quote+'<span class="wiki-revision-by">'+(opts.hideUser?'':this._activityAvatarHTML(change)+'by '+this._wikiUserLink(change.userId,change.username))+this._yeahHTML('comment',change.id,true)+'</span><i class="fas fa-chevron-right wiki-chevron" aria-hidden="true"></i></div>');
  row.find('.wiki-revision').attr({'data-comment':change.id,'data-page-type':change.pageType,'data-page-id':change.pageId,'data-title':change.markerTitle});
  return row;
};

ZMap.prototype._openActivityComment = function(element,back) {
  var type=element.getAttribute('data-page-type'),id=Number(element.getAttribute('data-page-id')),comment=Number(element.getAttribute('data-comment')),game=element.getAttribute('data-game');
  var marker=type==='marker' && this.cachedMarkersById && this.cachedMarkersById[id];
  this._openTalk(type,id,element.getAttribute('data-title') || (marker && marker.title) || '',back,
    {highlight:comment,game:game || null,region:!!(marker && marker.categoryTypeId==3)});
};

//************************************************************************//
//  One revision                                                          //
//************************************************************************//

ZMap.prototype._openMarkerRevision = function(revisionId, back) {
  var _this = this;
  var reopen = this._wikiReopen(function() { _this._openMarkerRevision(revisionId, back); }, back, 'Revision ' + Number(revisionId));
  reopen.navigationSource={type:'revision',id:Number(revisionId)};
  var page = this._showWikiPage(
    '<div id="marker_revision" class="wiki-page">' +
      '<h3 class="text-center">Revision ' + Number(revisionId) + '</h3>' +
      '<div class="area-header-pills wiki-subtitle-row"><p class="wiki-subtitle"></p></div>' +
      '<div class="wiki-revision-body"><p class="wiki-empty">Loading…</p></div>' +
    '</div>',
    'markerRevision-' + revisionId,
    back,
    reopen,
    { settles: true }
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
    _this._wikiSetMarkerSubtitle(page, snapshot.title || 'Untitled marker', revision.markerId, data.game, reopen);
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
        _this._yeahHTML('revision',revisionId,false)+'<button type="button" class="wiki-action-button" data-action="history"><i class="fas fa-history" aria-hidden="true"></i>All Revisions</button>' +
      '</div>' +
      // Anyone signed in can report an edit (scripts/zreports.js).
      (_this.getUser() && revision.action !== 'import' && String(revision.userId) !== String(_this.getUser().id)
        ? '<div class="wiki-report-row"><button type="button" class="text-button text-button-bad" data-action="report">' +
            '<i class="fas fa-flag" aria-hidden="true"></i>Report This Edit</button></div>' : '') +
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
    _this._watchContentVideos();
    body.on('click', '[data-action]', function(e) {
      var action = this.getAttribute('data-action');
      if(action === 'copy-code') _this._wikiCopy(code, 'Link code');
      else if(action === 'copy-url') _this._wikiCopy(_this._wikiMarkerURL(revision.markerId, data.game, revisionId), 'Link');
      else if(action === 'history') {
        // Back to the History this was opened from, or else to this edit.
        if(back && back.historyOf === Number(revision.markerId)) {
          _this.mapControl._navigatingBack = true;
          back();
        } else {
          _this._openMarkerHistory(revision.markerId, reopen);
        }
      }
      else if(action === 'report') _this._reportEdit(revisionId, snapshot.title);
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
        // History, now with the restore at the top: the one this was
        // opened from, or one that goes back where this edit did.
        _this.mapControl._navigatingBack = true;
        if(back && back.historyOf === Number(revision.markerId)) back();
        else _this._openMarkerHistory(revision.markerId, back);
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
    // A revision is readable without selecting its marker or leaving the
    // current game. Only the explicit Go/View control navigates the map.
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
  return this._wikiFieldDiffHTML(fields,'No changes to the marker\'s content.');
};

ZMap.prototype._wikiFieldDiffHTML = function(fields,emptyText) {
  var _this=this;
  var rows = fields.filter(function(f) {
    return f.length > 3 ? f[3] : String(f[1] == null ? '' : f[1]) !== String(f[2] == null ? '' : f[2]);
  }).map(function(f) {
    var diff = _this._wikiWordDiff(String(f[1] == null ? '' : f[1]), String(f[2] == null ? '' : f[2]));
    if(f.length > 3 && f[1] === f[2]) diff += ' <span class="admin-muted">(formatting changed)</span>';
    return '<div class="wiki-diff-row"><dt>' + _this._wikiEscape(f[0]) + '</dt><dd>' + (diff || '<span class="admin-muted">Empty</span>') + '</dd></div>';
  });
  if(!rows.length) return '<p class="wiki-empty">'+this._wikiEscape(emptyText || 'No content changes.')+'</p>';
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
  if(pageType==='user') (this._profileNames=this._profileNames || {})[pageId]=title;
  var talkMarker = pageType === 'marker' && this.cachedMarkersById && this.cachedMarkersById[pageId];
  var isRegion = opts.region || talkMarker && talkMarker.categoryTypeId == 3;
  var reopen = this._wikiReopen(function() { _this._openTalk(pageType, pageId, title, back, opts); }, back, 'Talk');
  reopen.navigationSource={type:'talk',pageType:pageType,id:Number(pageId),title:title,comment:opts.highlight || 0,region:!!opts.region};
  var page = this._showWikiPage(
    '<div id="wiki_talk" class="wiki-page">' +
      '<h3 class="text-center">Talk</h3>' +
      '<div class="area-header-pills wiki-subtitle-row"><p class="wiki-subtitle"></p></div>' +
      '<div class="wiki-follow" hidden><button type="button" class="wiki-follow-button" aria-pressed="false"></button></div>' +
      '<form class="wiki-comment-form wiki-new-comment">' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-comment" aria-hidden="true"></i></span>' +
          '<textarea class="form-control" name="body" rows="3" maxlength="5000" required ' +
            'placeholder="' + (pageType === 'user' ? 'Leave a message' : 'Start a discussion about this ' + (isRegion ? 'region' : 'marker')) + '"></textarea>' +
        '</div></div>' +
        '<p class="wiki-hint">Link with <code>[[rev:123]]</code>, <code>[[marker:45]]</code> or <code>[[user:name]]</code>.</p>' +
        '<button type="submit" class="infoWindowIcn form-action-button">Post</button>' +
      '</form>' +
      '<ul class="wiki-thread"><li class="wiki-empty">Loading…</li></ul>' +
    '</div>',
    'talk-' + pageType + '-' + pageId,
    back,
    reopen,
    { settles: true, waitForReady: true }
  );
  if(pageType === 'marker') this._wikiSetMarkerSubtitle(page, title, pageId, opts.game || null, reopen,{view:true});
  else {
    $(page).find('.wiki-subtitle').text(title || '');
    var activitySource=back && back.activitySource;
    if(pageType==='user' && activitySource && activitySource.type==='recent') {
      $('<button type="button" class="marker-coordinate-pill marker-region-pill wiki-marker-pill wiki-profile-pill">View Profile<i class="fas fa-chevron-right" aria-hidden="true"></i></button>')
        .on('click',function() {_this._openUserProfile({id:Number(pageId)},reopen);})
        .appendTo($(page).find('.wiki-subtitle-row').first());
    }
  }

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
          // Scroll only the sidebar. scrollIntoView also scrolls outer
          // ancestors horizontally while this page is sliding in.
          var scroller=_this.mapControl._contents;
          var itemBounds=added.getBoundingClientRect(),viewBounds=scroller.getBoundingClientRect();
          if(itemBounds.bottom>viewBounds.bottom) scroller.scrollTop+=itemBounds.bottom-viewBounds.bottom;
          if(itemBounds.top<viewBounds.top) scroller.scrollTop+=itemBounds.top-viewBounds.top;
        }
      }
    }).fail(function(xhr) {
      thread.empty().append($('<li class="wiki-empty"></li>').text(_this._wikiError(xhr)));
    }).always(function() { _this._wikiPageSettled(page); });
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
    if(!_this._isWikiEditor()) {_this._showEditingBetaAlert();return;}
    post($(this));
  });
  thread.on('click', '[data-comment-action]', function(e) {
    e.preventDefault();
    var action = this.getAttribute('data-comment-action');
    if(action==='reply' && !_this._isWikiEditor()) {_this._showEditingBetaAlert();return;}
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
              _this._yeahHTML('comment',comment.id,false)+
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
  var initial=this.mapControl._suppressPageSlide || this.mapControl._restoringInitialPage;
  back = back || function() { _this.mapControl.resetContent(); };
  var params = who.name !== undefined ? { name: who.name } : who.username ? { username: who.username } : { id: who.id };
  params.filter=this._profileActivityFilter || 'all';
  this._wikiGet('user_profile', params).done(function(data) {
    if(!data.success) { toastr.error(data.msg); return; }
    if(initial) _this._withoutPageSlide(function() {_this._renderUserProfile(data,back);});
    else _this._renderUserProfile(data, back);
  }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
};

ZMap.prototype._renderUserProfile = function(data, back) {
  var _this = this;
  var profile = data.user;
  // Profile links use the name (syncDrawerPageURL).
  (this._profileNames = this._profileNames || {})[profile.id] = profile.username;
  var editor = this._isWikiEditor();
  var reopen = this._wikiReopen(function() { _this._openUserProfile({ id: profile.id }, back); }, back, profile.username);
  Object.defineProperty(reopen,'activitySource',{get:function() {return {type:'profile',id:profile.id,filter:_this._profileActivityFilter || 'all'};}});
  var avatar = profile.profilePicture || 'images/default-avatar.png';
  var stat = function(n, label) {
    var count = Number(n);
    return '<div><strong>' + count.toLocaleString() + '</strong><span>' +
      (count === 1 ? label.replace(/s$/, '') : label) + '</span></div>';
  };
  var page = this._showWikiPage(
    '<div id="user_profile" class="wiki-page">' +
      '<div class="profile-banner"' + (profile.banner ? ' style="background-image:url(\'' + _this._wikiEscape(profile.banner) + '\')"' : '') + '>' +
        (data.canEdit ? '<button type="button" class="profile-banner-edit" data-action="edit" aria-label="Edit Profile" title="Edit Profile"><i class="fas fa-pencil-alt" aria-hidden="true"></i></button>' : '') + '</div>' +
      '<div class="profile-head">' +
        '<img class="profile-avatar" src="' + _this._wikiEscape(avatar) + '" alt="" ' +
          'onerror="this.onerror=null;this.src=\'images/default-avatar.png\'" />' +
        '<h3 class="profile-name">' + _this._wikiEscape(profile.username) + '</h3>' +
        '<p class="profile-role">' + _this._wikiRoleLabel(profile.level, profile.beta) +
          ' · Joined ' + _this._wikiEscape(_this._adminTime(profile.joinedAgo, { dateOnly: true }) || '') + '</p>' +
        '<div class="profile-bio"></div>' +
      '</div>' +
      '<div class="profile-stats">' + stat(data.counts.markers, 'Markers') + stat(data.counts.edits, 'Edits') +
        stat(data.counts.comments, 'Comments') + '</div>' +
      '<div class="wiki-actions profile-actions">' +
        '<button type="button" class="wiki-action-button" data-action="talk"><i class="fas fa-comments" aria-hidden="true"></i>Talk</button>' +
        '<button type="button" class="wiki-action-button" data-action="copy-profile"><span class="copy-action-icon"><i class="fas fa-link" aria-hidden="true"></i></span><span class="copy-action-label">Copy Link to Profile</span></button>' +
      '</div>' +
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
      (_this._profilePathsHTML ? _this._profilePathsHTML(data) : '') +
      '<section class="wiki-section profile-activity"><div class="profile-activity-heading"><h4>Recent Activity</h4>'+this._activityFilterHTML(this._profileActivityFilter || 'all')+'</div><ul class="wiki-revisions profile-changes"></ul></section>' +
    '</div>',
    'userProfile-' + profile.id,
    back,
    reopen
  );
  var showBio = function(bio) {
    $(page).find('.profile-bio').html(bio && String(bio).trim() ? _this._renderWikiText(bio) : '');
  };
  showBio(profile.bio);
  $(page).find('.profile-path').on('click', function() {
    _this.openPathFromLink(this.getAttribute('data-game'), this.getAttribute('data-slug'));
  });
  var changes = $(page).find('.profile-changes');
  var renderActivity=function(rows) {
  changes.empty();
  if(!rows.length) changes.append('<li class="wiki-empty">No activity yet.</li>');
  rows.forEach(function(change) {
    var row = _this._wikiActivityRow(change, { markerTitle: change.markerTitle || ('Marker #' + change.markerId), hideUser: true });
    row.find('.wiki-revision').attr({ 'data-marker': change.markerId, 'data-game': change.game || '', 'data-revision-type':change.revisionType || 'marker' });
    changes.append(row);
  });
  };
  renderActivity(data.changes);
  var activityRequest=0;
  var profileActivityCache={};
  profileActivityCache[_this._profileActivityFilter || 'all']=data.changes;
  ['all','edits','talk'].forEach(function(filter) {
    if(profileActivityCache[filter]) return;
    _this._wikiGet('user_profile',{id:profile.id,filter:filter}).done(function(result) {
      if(result.success) profileActivityCache[filter]=result.changes;
    });
  });
  $(page).find('.activity-filters').on('click','button',function() {
    var filter=this.getAttribute('data-activity-filter');
    if(filter===(_this._profileActivityFilter || 'all')) return;
    _this._profileActivityFilter=filter;
    $(this).siblings().attr('aria-selected','false');$(this).attr('aria-selected','true');
    var request=++activityRequest;
    if(profileActivityCache[filter]) {renderActivity(profileActivityCache[filter]);return;}
    _this._wikiGet('user_profile',{id:profile.id,filter:filter}).done(function(result) {
      if(request!==activityRequest) return;
      if(result.success) {profileActivityCache[filter]=result.changes;renderActivity(result.changes);}
      else changes.empty().append($('<li class="wiki-empty"></li>').text(result.msg));
    }).fail(function(xhr) {if(request===activityRequest) changes.empty().append($('<li class="wiki-empty"></li>').text(_this._wikiError(xhr)));});
  });
  changes.on('click keydown', '.wiki-revision', function(e) {
    if($(e.target).closest('a.wiki-link').length) return;
    if(e.type==='keydown' && e.key!=='Enter' && e.key!==' ') return;
    e.preventDefault();
    if(this.getAttribute('data-revision-type')==='talk') {_this._openActivityComment(this,reopen);return;}
    if(this.getAttribute('data-revision-type')==='settings') {
      _this._openSettingsRevisionLink(Number(this.getAttribute('data-rev')),this.getAttribute('data-game'),reopen);return;
    }
    if(this.getAttribute('data-revision-type')==='path' && _this._openPathRevisionLink) {
      _this._openPathRevisionLink(this.getAttribute('data-path-slug'),Number(this.getAttribute('data-rev')),this.getAttribute('data-game'),reopen);return;
    }
    _this._openMarkerRevision(Number(this.getAttribute('data-rev')), reopen);
  });

  var form = $(page).find('.profile-edit-form');
  var status = form.find('.admin-user-status');
  var setStatus = function(text, kind) {
    status.removeClass('error success').addClass(kind || '').text(text || '');
  };
  var openProfileEditor=function() {
    form.prop('hidden',false);
    $(page).find('.profile-bio-section, .profile-actions').prop('hidden',true);
    form.find('textarea').val(profile.bio || '').trigger('focus');
  };
  $(page).on('click', '[data-action]', function(e) {
    var action = this.getAttribute('data-action');
    if(action === 'talk') {
      _this._openTalk('user', profile.id, profile.username, reopen);
    } else if(action === 'copy-profile') {
      _this._copyText(new URL(_this._wikiUserURL(profile.username),window.location.href).href,this);
    } else if(action === 'edit') {
      openProfileEditor();
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
  // Like Back, this is a direct child of the scrollport. A button inside the
  // banner cannot remain sticky past the banner's own bottom edge.
  $(page).find('.profile-banner-edit').detach().on('click',openProfileEditor).prependTo(this.mapControl._contents);
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
