/* Path pages and the path editor (paths: scripts/services/Paths.js).
   A path's page lists its steps and links to it; the editor makes or changes
   one: its name and settings, and its steps, added by clicking markers on
   the map or dropping pins, and put in order by dragging. While the editor
   is open the path is drawn as it stands. */

ZMap.prototype._pathEsc = function(s) { return this._wikiEscape(s == null ? '' : String(s)); };

ZMap.prototype._pathStepLabel = function(step) {
  if(step.markerId) {
    var marker = this._pathMarker(step.markerId);
    // (One since removed from the map: the name it had, get_paths.php.)
    return marker ? (marker.title || marker.name || 'Marker') : step.markerName || 'Missing marker';
  }
  return step.name || (step.shown === false || step.shown == 0 ? 'Waypoint' : 'Pin');
};

ZMap.prototype._pathUrl = function(path) {
  var url = new URL(window.location.href);
  url.search = '';
  url.searchParams.set('game', this.mapOptions.shortName);
  url.searchParams.set('path', path.slug);
  return url.toString();
};

// The paths a marker is a step of, at the top of its page as compact rows
// (_pathListItemHTML): its game's official paths, and the viewer's own.
ZMap.prototype._markerPathsHTML = function(marker) {
  var zmap = this, rows = [];
  (this.paths || []).forEach(function(path) {
    if(path._preview) return;
    var index = path.steps.findIndex(function(s) { return s.markerId == marker.id; });
    if(index === -1) return;
    rows.push(zmap._pathListItemHTML(path, {attrs: "onclick='_this.openPathPage(\"" + zmap._pathEsc(path.slug) + "\"); return false'",
      context: path.kind === 'single' ? null : 'Step ' + (index + 1) + ' of ' + path.steps.length}));
  });
  // Headed as a category page's Paths are (CategoryPage.js).
  return "<div class='marker-paths' data-marker='" + Number(marker.id) + "'>" + (rows.length ?
    "<section class='poi-category-groups category-paths marker-paths-section'><div class='poi-category-heading'><h3 class='area-category-title'>" +
      (rows.length === 1 ? 'Part of this path' : 'Part of these paths') + "</h3></div><div class='path-compact-list'>" + rows.join('') + "</div></section>" : '') + "</div>";
};

// "Make a path from here", under a marker's edit controls (zwiki.js
// _refreshMarkerEditorTools): only for those the server gives paths to
// (admins, while they're built).
ZMap.prototype._addMakePathButton = function(marker) {
  var tools = this.mapControl && this.mapControl._contents.querySelector('.menu-cat-content-inner > .marker-editor-tools');
  if(!tools || !marker || tools.querySelector('.path-new-button')) return;
  if(!this.getUser() || !this._pathsEnabled) return;
  var button = document.createElement('button');
  button.type = 'button';
  button.className = 'marker-editor-button path-new-button';
  button.innerHTML = "<span class='path-new-icon' aria-hidden='true'><i class='fas fa-map-signs'></i><i class='fas fa-plus'></i></span><span>Make a path from here</span>";
  var zmap = this;
  button.addEventListener('click', function() { zmap.openPathEditor(null, marker.id); });
  var after = tools.querySelector('.marker-editor-confirm');
  tools.insertBefore(button, after);
};

// Fill in any marker page's paths once they've loaded (a marker page opened
// from a link renders before them).
ZMap.prototype._refreshMarkerPaths = function() {
  var zmap = this;
  document.querySelectorAll('.marker-paths[data-marker]').forEach(function(slot) {
    var marker = zmap._pathMarker(Number(slot.dataset.marker));
    if(marker) { slot.outerHTML = zmap._markerPathsHTML(marker); zmap._addMakePathButton(marker); }
  });
};

// When a path was or will be published, in the viewer's own words.
ZMap.prototype._pathTime = function(seconds) {
  return new Date(seconds * 1000).toLocaleString(undefined, {month: 'short', day: 'numeric', year: 'numeric', hour: 'numeric', minute: '2-digit'});
};

// Who sees a path and whether it's out yet, for its page and lists.
ZMap.prototype._pathStatusHTML = function(path) {
  var parts = [];
  if(!path.published) parts.push(path.publishedAt ? "<span class='path-badge path-badge-scheduled'><i class='fas fa-clock' aria-hidden='true'></i> Publishes " + this._pathEsc(this._pathTime(path.publishedAt)) + "</span>" :
    "<span class='path-badge path-badge-draft'><i class='fas fa-pencil-alt' aria-hidden='true'></i> Draft</span>");
  if(path.scope !== 'official') {
    if(path.visibility === 'private') parts.push("<span class='path-badge'><i class='fas fa-lock' aria-hidden='true'></i> Private</span>");
    if(path.visibility === 'unlisted') parts.push("<span class='path-badge'><i class='fas fa-link' aria-hidden='true'></i> Unlisted</span>");
  }
  return parts.join(' ');
};

// ---- A path's page. opts.back: where its Back button goes (a category
// page that is this path); kept for the path when it's reopened (from its
// editor, history, or a marker opened from it). opts.keepView: coming back
// to it, so the map stays where it is.
ZMap.prototype.openPathPage = function(slugOrPath, opts) {
  var zmap = this;
  opts = opts || {};
  var path = typeof slugOrPath === 'object' ? slugOrPath : (this.paths || []).find(function(p) { return p.slug === slugOrPath; });
  if(!path) return;
  if('back' in opts) this._pathPageBack = {slug: path.slug, back: opts.back};
  var back = this._pathPageBack && this._pathPageBack.slug === path.slug ? this._pathPageBack.back : null;
  this._endPathEditing();
  // The path in focus (Paths.js): its markers alone, its line on top.
  this._focusedPath = path;
  history.replaceState(history.state, '', this._pathUrl(path));
  var shown = path.steps.filter(function(step) { return step.markerId || step.shown != 0; });
  var status = this._pathStatusHTML(path);
  // Others' Yeahs, once it's out where others can see it.
  var yeahs = path.scope === 'user' && path.published && path.visibility !== 'private';
  // Who's started it, and how many of them finished it.
  var stat = path.started ? "<br>" + Math.round(path.finished / path.started * 100) + "% of people who started finished this path" : '';
  // The controls, as a marker page's (zmap.js): icon over label, in a row.
  var action = function(className, icon, label) {
    return "<button type='button' class='marker-action-button infoWindowIcn " + className + "'>" +
      "<span class='marker-action-icon'><i class='" + icon + "' aria-hidden='true'></i></span><span class='marker-action-label'>" + label + "</span></button>";
  };
  // Its guide: Start at the first step, or Continue at the first one not
  // yet done. (Decided on arriving: it stays as it was until the path is
  // left, PathEditor.js _pathStartLabel, Paths.js _updatePathFocus.)
  if(!this._pathStartLabel || this._pathStartLabel.slug !== path.slug) {
    var checks = this._pathCheckMarkers(path);
    var doneCount = checks.filter(function(m) { return m.complete === true || m.complete == 1; }).length;
    this._pathStartLabel = {slug: path.slug, label: doneCount && doneCount < checks.length ? 'Continue' : 'Start'};
  }
  // Bookmarked as a marker is (zmap.js toggleBookmark, _findBookmark).
  this._bookmarkTarget = {pathId: path.id};
  var actions = [
    this._bookmarkButtonHTML ? this._bookmarkButtonHTML() : '',
    // A Yeah, as the comments' (zwiki.js _wireYeahs fills and wires it).
    yeahs ? "<button type='button' class='marker-action-button infoWindowIcn yeah-target yeah-button path-yeah' data-yeah-key='path:" + Number(path.id) + "' aria-pressed='false' disabled>" +
      "<span class='marker-action-icon'><span class='yeah-icon yeah-plus' aria-hidden='true'></span></span>" +
      "<span class='marker-action-label'><span class='yeah-label'>Yeah!</span> <span class='yeah-count'>0</span></span></button>" : '',
    action('path-copy', 'fas fa-link', 'Copy Link'),
    action('path-history', 'fas fa-history', 'History'),
    path.canEdit ? action('path-edit', 'fas fa-pencil-alt', 'Edit') : ''
  ].filter(Boolean);
  // Titled as a marker or category page is, with what it is and its
  // completion as pills: both stay in the compact title bar when the page
  // scrolls (ZLayers.js).
  var page = this._showWikiPage("<h2 class='popupTitle'>" + this._pathEsc(path.name) + "</h2>" +
    "<div class='area-header-pills path-header-pills'><p class='marker-coordinate-pill path-kind-pill'><i class='fas fa-map-signs' aria-hidden='true'></i> Path</p>" +
      (this._pathCheckMarkers(path).length ? "<p class='area-completion-pill marker-coordinate-pill path-completion-pill'></p>" : '') + "</div>" +
    "<div class='marker-actions-row path-actions-row' style='grid-template-columns: repeat(" + actions.length + ", minmax(0, 1fr))'>" + actions.join('') + "</div>" +
    // Its guide, full width under the controls, and the end of what a phone's
    // partly open drawer shows (ZLayers.js _mobileDrawerPeekHeight).
    (shown.length ? "<div class='path-start-row drawer-peek-end'><button type='button' class='path-start'>" +
      "<i class='fas fa-play' aria-hidden='true'></i><span>" + this._pathStartLabel.label + "</span></button></div>" : '') +
    "<div class='wiki-page path-page' data-path-slug='" + this._pathEsc(path.slug) + "'>" +
    (status ? "<p class='path-status'>" + status + "</p>" : '') +
    // Who made a user's path and when, and how many finish it: nothing else
    // (its step count shows in its list; who can edit it, by its Edit).
    ((path.scope !== 'official' || stat) ? "<p class='path-meta'>" + (path.scope === 'official' ? '' : 'By ' + (path.userName ?
      "<button type='button' class='path-owner'>" + this._pathEsc(path.userName) + "</button>" : 'a user') +
      (path.published && path.publishedAt ? ' · ' + this._pathEsc(this._pathTime(path.publishedAt)) : '')) +
      (path.scope === 'official' ? stat.replace(/^<br>/, '') : stat) + "</p>" : '') +
    (path.description ? "<div class='path-description'>" + this._renderWikiText(path.description) + "</div>" : '') +
    this._pathStepsHTML(path, path.steps, {checks: true}) + "</div>", 'path', back, null, {partialDrawer: true});
  page.classList.add('area-detail-page', 'path-detail-page');
  // Step numbers stick just under the compact title bar, however tall it is
  // here (ZLayers.js _setupCompactTitle).
  var contents = this.mapControl._contents;
  setTimeout(function() {
    var bar = contents.querySelector(':scope > .compact-title-bar');
    // (16px below it.)
    if(bar && bar.offsetHeight) contents.style.setProperty('--path-sticky-top', (bar.offsetHeight + 16) + 'px');
  }, 0);
  this.updatePathCompletionCounts();
  // Its markers alone on the map, then the map fitted to it (Paths.js).
  this._updatePathFocus();
  if(!opts.keepView) this.focusPath(path.slug);
  $(page).find('.path-copy').on('click', function() { zmap._wikiCopy(zmap._pathUrl(path), 'Path link'); });
  $(page).find('.path-owner').on('click', function() {
    zmap._openUserProfile({name: path.userName}, function() { zmap.openPathPage(path.slug, {keepView: true}); });
  });
  $(page).find('.path-edit').on('click', function() { zmap.openPathEditor(path); });
  $(page).find('.path-history').on('click', function() { zmap.openPathHistory(path); });
  $(page).find('.path-start').on('click', function() { zmap._startPathGuide(path, page); });
  this._wirePathSteps(page, path.steps, function(scrollTop) { zmap.openPathPage(path.slug, {keepView: true, scrollTop: scrollTop}); }, path.name);
  if(opts.scrollTop) {
    var contents = this.mapControl._contents;
    contents.scrollTop = opts.scrollTop;
    // (Again once the page has settled and its images have taken their room.)
    setTimeout(function() { contents.scrollTop = opts.scrollTop; }, 50);
  }
};

// The markers whose checks a path's page shows: each step's marker, or, for
// a path that's one check, its first (the one shown on the map).
ZMap.prototype._pathCheckMarkers = function(path) {
  var zmap = this, seen = {}, markers = [];
  path.steps.forEach(function(step) {
    var marker = step.markerId && zmap._pathMarker(step.markerId);
    if(marker && !seen[marker.id]) { seen[marker.id] = true; markers.push(marker); }
  });
  return path.kind === 'single' ? markers.slice(0, 1) : markers;
};

// The header's count, kept up to date as checks change (zmap.js).
ZMap.prototype.updatePathCompletionCounts = function() {
  var control = this.mapControl;
  if(!control || control.getContentType() !== 'path') return;
  var page = control._contents.querySelector('.path-page[data-path-slug]');
  var slug = page && page.getAttribute('data-path-slug');
  var path = slug && (this.paths || []).find(function(p) { return p.slug === slug; });
  var pill = control._contents.querySelector('.path-completion-pill');
  if(!path || !pill) return;
  var markers = this._pathCheckMarkers(path);
  var done = markers.filter(function(m) { return m.complete === true || m.complete == 1; }).length;
  pill.textContent = path.kind === 'single' ? (done ? 'Complete' : 'Not complete') : done + '/' + markers.length + ' Complete';
  pill.classList.toggle('path-completion-done', !!markers.length && done === markers.length);
  // Each step's Complete button, as its marker stands.
  var zmap = this;
  $(page).find('li[data-list-marker-id]').each(function() {
    var marker = zmap._pathMarker(Number(this.getAttribute('data-list-marker-id')));
    var complete = !!marker && (marker.complete === true || marker.complete == 1);
    this.classList.toggle('area-marker-completed', complete);
    var button = this.querySelector('.path-step-complete');
    if(!button) return;
    button.classList.toggle('done', complete);
    button.setAttribute('aria-pressed', String(complete));
    button.querySelector('.path-step-complete-icon').innerHTML = "<i class='icon-" + (complete ? 'checkmark' : 'checkbox-unchecked') + "' aria-hidden='true'></i>";
    button.querySelector('.path-step-complete-label').textContent = complete ? 'Completed' : 'Complete';
  });
  // The compact title bar copies the pill (ZLayers.js).
  if(control._updateCompactTitle) control._updateCompactTitle();
};

// The guide: the map to the first step not yet done (or the first, when
// none or all are), the drawer down to its partial height on a phone so the
// map shows, and that step at the top of the list.
ZMap.prototype._startPathGuide = function(path, page) {
  var control = this.mapControl;
  var rows = $(page).find('.path-timeline > li');
  var target = rows.filter('[data-list-marker-id]:not(.area-marker-completed)').first();
  if(!target.length) target = rows.first();
  if(!target.length) return;
  if(control.viewStyleBottomSlide) control.openDrawerDefaultPartial();
  this._goToPathStep(path.steps[Number(target.attr('data-index'))]);
  this._setCurrentPathStep(page, target[0]);
  var zmap = this;
  // (After the drawer's scroll reset.)
  setTimeout(function() { zmap._scrollToPathStep(target[0]); }, 50);
};

// The step the guide is on, marked in the list.
ZMap.prototype._setCurrentPathStep = function(page, li) {
  $(page).find('.path-step-current').removeClass('path-step-current');
  if(li) li.classList.add('path-step-current');
};

// The map to a step: zoomed in on its marker or pin, centred in the map
// that's left to see (under the drawer's partial height when it's there).
ZMap.prototype._goToPathStep = function(step) {
  if(!step) return;
  var control = this.mapControl;
  var marker = step.markerId && this._pathMarker(step.markerId);
  var latlng;
  if(marker) {
    latlng = marker.getLatLng();
    control.changeMapToMarker(marker);
  } else {
    latlng = L.latLng(Number(step.y), Number(step.x));
    var layer = (this.maps || []).find(function(l) { return String(l.defaultSubMapId) === String(step.submapId); });
    if(layer && String(control.getCurrentMap().subMapId) !== String(step.submapId)) control.changeMapOnly(layer.originalId, step.submapId);
  }
  // Close enough to see where it is, as a marker's link does (zmap.js
  // navigateToMarker); no further out than the guide already is.
  var zoom = Math.min(this.map.getMaxZoom(), Math.max(this.map.getZoom(), 6));
  this._viewChosen = true;
  this._prepareMapEdgesForDrawer();
  this._setViewAtMarkerInVisibleArea({getLatLng: function() { return latlng; }}, zoom,
    control.viewStyleBottomSlide && control._partialDrawerMode ? control.options.softOpenTo : undefined, true);
};

// A step to the top of the page (under the compact title bar).
ZMap.prototype._scrollToPathStep = function(li) {
  var contents = this.mapControl._contents;
  var bar = contents.querySelector(':scope > .compact-title-bar');
  var top = li.getBoundingClientRect().top - contents.getBoundingClientRect().top + contents.scrollTop - (bar ? bar.offsetHeight : 0) - 12;
  var reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  contents.scrollTo({top: Math.max(0, top), behavior: reduce ? 'auto' : 'smooth'});
};

// A marker's own contents, as its page shows them (zmap.js), less its
// coordinates.
ZMap.prototype._pathMarkerContent = function(marker) {
  return (marker.tabText || []).map(function(text) {
    return String(text || '').replace(/<p\b(?=[^>]*\bname\s*=\s*(['"])coord\1)[^>]*>[\s\S]*?<\/p>/gi, '');
  }).join('').trim();
};

// A path's steps, numbered down a line as on the map (hidden waypoints
// left out), each with its note and its marker's contents, long ones cut
// short until expanded.
ZMap.prototype._pathStepsHTML = function(path, steps, opts) {
  var zmap = this, n = 0;
  var checks = opts && opts.checks ? this._pathCheckMarkers(path).map(function(m) { return String(m.id); }) : [];
  return "<ol class='path-steps path-timeline' style='--path-color:" + zmap._pathEsc(path.color || '#ffad48') + "'>" + steps.map(function(step, i) {
    if(!step.markerId && step.shown == 0) return '';
    n++;
    var marker = step.markerId && zmap._pathMarker(step.markerId);
    // A marker since removed from the map, kept by a user's path: as it was,
    // marked as gone, with nothing to open or complete.
    var removed = !marker && step.deleted;
    var content = marker ? zmap._pathMarkerContent(marker) : removed ? zmap._pathMarkerContent({tabText: [step.content || '']}) : '';
    // Its marker's own check (a single path's is its first marker's): the
    // same one as on the marker's page and in lists (zmap.js keeps them in step).
    var check = marker && checks.indexOf(String(marker.id)) !== -1;
    var done = check && (marker.complete === true || marker.complete == 1);
    return "<li class='path-step" + (done ? ' area-marker-completed' : '') + (removed ? ' path-step-deleted' : '') + "' data-index='" + i + "'" + (check ? " data-list-marker-id='" + Number(marker.id) + "'" : '') + ">" +
      "<span class='path-step-number'><span class='path-step-n'>" + n + "</span><i class='fas fa-check path-step-tick' aria-hidden='true'></i></span>" +
      // A marker's name opens it: a chevron says so.
      // (Inline, after the last word: a long name wraps with it.)
      "<div class='path-step-body'><div class='path-step-head'><button type='button' class='path-step-name'><span class='path-step-label'>" + zmap._pathEsc(zmap._pathStepLabel(step)) +
        (marker ? "<i class='fas fa-chevron-right path-step-chevron' aria-hidden='true'></i>" : '') + "</span></button></div>" +
      (removed ? "<p class='path-step-removed'><i class='fas fa-ban' aria-hidden='true'></i> Removed from the map</p>" : '') +
      (step.note ? "<p class='path-step-note'>" + zmap._renderWikiText(step.note) + "</p>" : '') +
      (content ? "<div class='popupContent path-step-content'>" + content + "</div>" +
        "<button type='button' class='path-step-more' hidden><span>Show more</span><i class='fas fa-chevron-down' aria-hidden='true'></i></button>" : '') +
      // The marker's own Complete, as on its page: checking it here checks
      // the marker everywhere.
      (check ? "<button type='button' class='path-step-complete'><span class='path-step-complete-icon'></span><span class='path-step-complete-label'></span></button>" : '') +
      "</div></li>";
  }).join('') + "</ol>";
};

// A step's name opens its marker, whose Back comes back here (reopen); a
// pin's centres the map on it. Long contents get Show more.
ZMap.prototype._wirePathSteps = function(page, steps, reopen, label) {
  var zmap = this, control = this.mapControl;
  $(page).find('.path-step-name').on('click', function() {
    var step = steps[Number($(this).closest('li').data('index'))];
    var marker = step.markerId && zmap._pathMarker(step.markerId);
    if(!marker) { zmap.map.setView(L.latLng(Number(step.y), Number(step.x)), Math.max(zmap.map.getZoom(), 3)); return; }
    if(reopen) {
      var scrollTop = control._contents.scrollTop;
      control.returnNextPageTo({label: label, page: function() {
        // The map as it was, if it hasn't moved since (zmap.js).
        if(zmap.restoreMarkerReturnView) zmap.restoreMarkerReturnView();
        reopen(scrollTop);
      }});
      control._navigatingForward = true;
    }
    // As a list opens a marker (zmap.js navigateToMarker), but flown to.
    zmap.goTo({marker: marker.id, zoom: Math.max(zmap.map.getZoom(), 6), centerInVisibleArea: true, panTo: false, animate: true}, true);
  });
  // Completing a step moves on to the next one not yet done.
  $(page).find('.path-step-complete').on('click', function() {
    var button = this, li = $(button).closest('li');
    var marker = zmap._pathMarker(Number(li.attr('data-list-marker-id')));
    if(!marker) return;
    var requested = !(marker.complete === true || marker.complete == 1);
    button.disabled = true;
    zmap._setMarkerDone(marker.id, requested, function() {
      button.disabled = false;
      zmap.updatePathCompletionCounts();
      if(!requested || !(marker.complete === true || marker.complete == 1)) return;
      var next = li.nextAll('li[data-list-marker-id]:not(.area-marker-completed)').first();
      if(!next.length) return;
      // On to the next step: in the list and on the map.
      zmap._scrollToPathStep(next[0]);
      zmap._setCurrentPathStep(page, next[0]);
      zmap._goToPathStep(steps[Number(next.attr('data-index'))]);
    });
  });
  var measure = function() {
    $(page).find('.path-step-content').each(function() {
      if(this.classList.contains('expanded')) return;
      var cut = this.scrollHeight > this.clientHeight + 4;
      this.classList.toggle('truncated', cut);
      $(this).next('.path-step-more').prop('hidden', !cut);
    });
  };
  $(page).find('.path-step-content img').on('load', measure);
  $(page).find('.path-step-more').on('click', function() {
    var content = $(this).prev('.path-step-content')[0], open = !content.classList.contains('expanded');
    content.classList.toggle('expanded', open);
    content.classList.toggle('truncated', !open);
    this.querySelector('span').textContent = open ? 'Show less' : 'Show more';
    this.querySelector('i').className = 'fas fa-chevron-' + (open ? 'up' : 'down');
  });
  measure();
  setTimeout(measure, 0);
};

// ---- A path's history: every save, newest first, each one to look at and,
// for those who can edit the path, restore.
ZMap.prototype.openPathHistory = function(path) {
  var zmap = this;
  this._wikiGet('path_history', {id: path.id}).done(function(r) {
    if(!r || !r.success) { toastr.error((r && r.msg) || 'Could not load the history.'); return; }
    var verbs = {create: 'Created', edit: 'Edited', revert: 'Restored'};
    var rows = r.revisions.map(function(rev, i) {
      return "<li class='path-revision' data-index='" + i + "'>" +
        "<div><b>" + zmap._pathEsc(rev.userName || 'Someone') + "</b> · " + zmap._pathEsc(verbs[rev.action] || 'Changed') +
          " <small>" + zmap._pathEsc(zmap._pathTime(rev.created)) + (i === 0 ? ' · Current' : '') + "</small></div>" +
        (rev.summary ? "<p>" + zmap._pathEsc(rev.summary) + "</p>" : '') +
        "<div class='path-revision-actions'><button type='button' class='path-revision-view'>View</button>" +
          (r.canRevert && i > 0 ? "<button type='button' class='path-revision-restore'>Restore</button>" : '') + "</div></li>";
    }).join('');
    var back = function() { zmap.openPathPage(path.slug, {keepView: true}); };
    var page = zmap._showWikiPage("<div class='wiki-page path-history-page'><h3 class='text-center'>History</h3>" +
      "<p class='path-meta'>" + zmap._pathEsc(path.name) + "</p>" +
      (rows ? "<ol class='path-revisions'>" + rows + "</ol>" : "<p class='wiki-empty'>No saves yet.</p>") + "</div>", 'pathHistory', back);
    var revisionAt = function(el) { return r.revisions[Number($(el).closest('li').data('index'))]; };
    $(page).find('.path-revision-view').on('click', function() { zmap._openPathRevision(path, revisionAt(this), r.canRevert && revisionAt(this) !== r.revisions[0]); });
    $(page).find('.path-revision-restore').on('click', function() { zmap._restorePathRevision(path, revisionAt(this)); });
  }).fail(function(x) { toastr.error(zmap._wikiError(x)); });
};

// One save, drawn on the map in place of the path as it is now.
ZMap.prototype._openPathRevision = function(path, rev, canRestore) {
  var zmap = this;
  this._wikiGet('path_history', {id: path.id, revision: rev.id}).done(function(r) {
    if(!r || !r.success) { toastr.error((r && r.msg) || 'Could not load that version.'); return; }
    var snap = r.snapshot;
    var steps = snap.steps.map(function(s) { return s.markerId ? {markerId: s.markerId, note: s.note} :
      {submapId: s.submapId, x: s.x, y: s.y, name: s.name, shown: s.shown ? 1 : 0, note: s.note}; });
    var page = zmap._showWikiPage("<div class='wiki-page path-page'>" +
      "<h3 class='text-center'>" + zmap._pathEsc(snap.name) + "</h3>" +
      "<p class='path-status'><span class='path-badge'><i class='fas fa-history' aria-hidden='true'></i> " +
        zmap._pathEsc(rev.userName || 'Someone') + " · " + zmap._pathEsc(zmap._pathTime(rev.created)) + "</span></p>" +
      (snap.description ? "<div class='path-description'>" + zmap._renderWikiText(snap.description) + "</div>" : '') +
      (canRestore ? "<div class='path-page-actions'><button type='button' class='infoWindowIcn form-action-button path-restore'><i class='fas fa-undo'></i> Restore this version</button></div>" : '') +
      zmap._pathStepsHTML(snap, steps) + "</div>", 'pathRevision', function() { zmap._endPathEditing(); zmap.openPathHistory(path); });
    zmap._wirePathSteps(page, steps, function(scrollTop) { zmap._openPathRevision(path, rev, canRestore); }, snap.name);
    $(page).find('.path-restore').on('click', function() { zmap._restorePathRevision(path, rev); });
    zmap._previewPath({scope: path.scope, kind: snap.kind, loops: snap.loops, numbered: snap.numbered, smooth: !!snap.smooth, categoryId: snap.categoryId,
      color: snap.color || '#ffad48', name: snap.name, steps: steps.map(function(s) { return $.extend({}, s, {shown: s.markerId ? 1 : s.shown}); })}, path);
  }).fail(function(x) { toastr.error(zmap._wikiError(x)); });
};

ZMap.prototype._restorePathRevision = function(path, rev) {
  var zmap = this;
  if(!confirm('Restore "' + path.name + '" to how it was on ' + this._pathTime(rev.created) + '? Who sees it and who can edit it stay as they are.')) return;
  this._wikiPost('revert_path', {id: path.id, revision: rev.id}).done(function(r) {
    if(!r || !r.success) { toastr.error((r && r.msg) || 'Could not restore the path.'); return; }
    toastr.success('Path restored');
    zmap._endPathEditing();
    zmap._reloadPaths(function() { zmap.openPathPage(r.slug); }, r.slug);
  }).fail(function(x) { toastr.error(zmap._wikiError(x)); });
};

// ---- The editor. A new path (path null) starts from a marker when given.
ZMap.prototype.openPathEditor = function(path, startMarkerId) {
  var zmap = this, user = this.getUser();
  if(!user) { toastr.info('Sign in to make a path.'); return; }
  var isEditor = user.level >= this.WIKI_EDITOR_LEVEL;
  // Who sees it, who can edit it, and deleting it: its owner's (and admins').
  var manages = !path || !!path.canManage;
  var draft = path ? {
    id: path.id, name: path.name, description: path.description || '', scope: path.scope, visibility: path.visibility || 'private',
    editAccess: path.editAccess || 'owner', kind: path.kind,
    publish: path.published ? 'now' : path.publishedAt ? 'schedule' : 'draft', publishAt: path.published ? null : path.publishedAt || null,
    loops: !!path.loops, numbered: !!path.numbered, smooth: !!path.smooth, alwaysShow: path.alwaysShow !== false, categoryId: path.categoryId || '', color: path.color || '#ffad48',
    // (A marker since removed from the map keeps what the editor shows of it.)
    steps: path.steps.map(function(s) { return s.markerId ? $.extend({markerId: Number(s.markerId), note: s.note || ''},
        s.deleted ? {deleted: true, markerName: s.markerName, submapId: s.submapId, x: Number(s.x), y: Number(s.y)} : {}) :
      {submapId: s.submapId, x: Number(s.x), y: Number(s.y), name: s.name || '', shown: s.shown != 0, note: s.note || ''}; }),
    summary: ''
  } : {id: null, name: '', description: '', scope: 'user', visibility: 'private', editAccess: 'owner', publish: 'draft', publishAt: null,
       kind: 'guide', loops: false, numbered: true, smooth: false, alwaysShow: true, categoryId: '', color: '#ffad48',
       steps: startMarkerId ? [{markerId: Number(startMarkerId), note: ''}] : [], summary: ''};
  var original = JSON.stringify(draft);
  var categories = Object.keys(this.categories).map(function(id) { return zmap.categories[id]; })
    .filter(function(c) { return c.parent_id && c.marker_category_type_id == 1; })
    .sort(function(a, b) { return String(a.name).localeCompare(b.name); });
  var field = function(label, icon, control) { return zmap._mapSettingsField(label, icon, control); };
  var page = this._showWikiPage("<div class='wiki-page path-editor'>" +
    "<h3 class='text-center'>" + (path ? 'Edit Path' : 'New Path') + "</h3><form class='map-settings-form path-editor-form'>" +
    field('Name', 'fa-heading', "<input type='text' class='form-control' name='name' maxlength='120' required>") +
    field('Description', 'fa-align-left', "<textarea class='form-control' name='description' maxlength='2000' rows='3' placeholder='Optional. Links like [[marker:123]] and web addresses work.'></textarea>") +
    "<fieldset class='path-kind'><legend class='map-settings-label'>Checks</legend>" +
      "<label><input type='radio' name='kind' value='guide'> <b>Each step</b> is its own check (a guide, a route)</label>" +
      "<label><input type='radio' name='kind' value='single'> <b>One check</b> for the whole path (a Korok pair, a dragon)</label></fieldset>" +
    "<div class='path-toggles'><label><input type='checkbox' name='numbered'> Number the steps</label>" +
      "<label><input type='checkbox' name='smooth'> Smooth the line (curves through each step)</label>" +
      "<label><input type='checkbox' name='alwaysShow'> Always show the path on the map (otherwise it shows once one of its markers is opened)</label>" +
      "<label><input type='checkbox' name='loops'> Loops back to the start</label></div>" +
    "<div class='path-row'>" + field('Color', 'fa-tint', "<input type='color' class='form-control' name='color'>") +
      field('Show as category', 'fa-folder', "<select class='form-control' name='categoryId'><option value=''>None</option>" +
        categories.map(function(c) { return "<option value='" + c.id + "'>" + zmap._pathEsc(c.name) + "</option>"; }).join('') + "</select>") + "</div>" +
    (manages ? field('Who sees it', 'fa-users', "<select class='form-control' name='audience'><option value='private'>Only me (private)</option>" +
      "<option value='unlisted'>Anyone with the link (unlisted)</option>" +
      "<option value='public'>Anyone, and on my profile (public)</option>" +
      (isEditor || draft.scope === 'official' ? "<option value='official'>Everyone, on the map (official)</option>" : '') + "</select>") +
      field('Publishing', 'fa-paper-plane', "<select class='form-control' name='publish'><option value='draft'>Draft: only I see it for now</option>" +
        "<option value='now'>Published</option><option value='schedule'>Publish at a set time</option></select>") +
      "<div class='path-schedule' hidden>" + field('Publish at', 'fa-clock', "<input type='datetime-local' class='form-control' name='publishAt'>") + "</div>" +
      field('Who can edit', 'fa-pencil-alt', "<select class='form-control' name='editAccess'><option value='owner'>Only me</option>" +
        "<option value='editors'>Anyone who can edit markers</option></select>") : '') +
    "<h4 class='path-steps-title'>Steps <small class='path-step-count'></small></h4>" +
    "<p class='path-hint'>" + (this.mapControl.viewStyleBottomSlide ? 'Tap “Add steps on the map”, then tap markers to add them, or drop a pin.' :
      'Click markers on the map to add them, or drop a pin.') + " Drag steps by their handle to reorder.</p>" +
    "<ol class='path-steps path-steps-editable'></ol>" +
    "<div class='path-add-buttons'>" +
      (this.mapControl.viewStyleBottomSlide ? "<button type='button' class='infoWindowIcn form-action-button path-add-on-map'><i class='fas fa-plus'></i> Add steps on the map</button>" : '') +
      "<button type='button' class='infoWindowIcn form-action-button path-drop-pin'><i class='fas fa-map-pin'></i> Drop a pin</button></div>" +
    (path ? field('Summary', 'fa-comment', "<input type='text' class='form-control' name='summary' maxlength='255' placeholder='What you changed (optional)'>") : '') +
    this._editorSaveHTML(!!path, path ? 'Save Path' : 'Create Path') +
    "<div class='path-editor-actions'><button type='button' class='path-cancel'>Cancel</button>" +
      (path && manages ? "<button type='button' class='path-delete'>Delete path</button>" : '') + "</div>" +
    "</form></div>", 'pathEditor', function() { zmap._endPathEditing(); if(path) zmap.openPathPage(path.slug, {keepView: true}); });
  var form = $(page).find('form'), list = $(page).find('.path-steps-editable');
  form.find('[name=name]').val(draft.name);
  form.find('[name=description]').val(draft.description);
  form.find('[name=kind][value=' + draft.kind + ']').prop('checked', true);
  form.find('[name=numbered]').prop('checked', draft.numbered);
  form.find('[name=smooth]').prop('checked', draft.smooth);
  form.find('[name=alwaysShow]').prop('checked', draft.alwaysShow);
  form.find('[name=loops]').prop('checked', draft.loops);
  form.find('[name=color]').val(draft.color);
  form.find('[name=categoryId]').val(String(draft.categoryId || ''));
  form.find('[name=audience]').val(draft.scope === 'official' ? 'official' : draft.visibility);
  form.find('[name=editAccess]').val(draft.editAccess);
  form.find('[name=publish]').val(draft.publish);
  // datetime-local takes the viewer's own time, without a zone.
  var localTime = function(seconds) {
    var d = new Date(seconds * 1000), pad = function(n) { return (n < 10 ? '0' : '') + n; };
    return d.getFullYear() + '-' + pad(d.getMonth() + 1) + '-' + pad(d.getDate()) + 'T' + pad(d.getHours()) + ':' + pad(d.getMinutes());
  };
  form.find('[name=publishAt]').val(localTime(draft.publishAt || Math.ceil(Date.now() / 3600000) * 3600 + 86400))
    .attr('min', localTime(Date.now() / 1000));
  var busy = false;

  var state = this._pathEditing = {page: page, draft: draft};
  var readForm = function() {
    draft.name = form.find('[name=name]').val().trim();
    draft.description = form.find('[name=description]').val().trim();
    draft.kind = form.find('[name=kind]:checked').val() || 'guide';
    draft.numbered = form.find('[name=numbered]').prop('checked');
    draft.smooth = form.find('[name=smooth]').prop('checked');
    draft.alwaysShow = form.find('[name=alwaysShow]').prop('checked');
    draft.loops = form.find('[name=loops]').prop('checked');
    draft.color = form.find('[name=color]').val();
    draft.categoryId = form.find('[name=categoryId]').val();
    if(manages) {
      var audience = form.find('[name=audience]').val();
      draft.scope = audience === 'official' ? 'official' : 'user';
      draft.visibility = audience === 'official' ? 'public' : audience;
      draft.editAccess = form.find('[name=editAccess]').val();
      draft.publish = form.find('[name=publish]').val();
      var at = form.find('[name=publishAt]').val();
      draft.publishAt = draft.publish === 'schedule' && at ? Math.round(new Date(at).getTime() / 1000) : null;
      $(page).find('.path-schedule').prop('hidden', draft.publish !== 'schedule');
    }
    draft.summary = (form.find('[name=summary]').val() || '').trim();
  };
  var update = function() {
    readForm();
    var error = zmap._editorNameError(draft.name, 120, false) || (draft.steps.length < 2 ? 'Add at least two steps.' : '') ||
      (draft.publish === 'schedule' && !(draft.publishAt > Date.now() / 1000) ? 'Pick a time in the future to publish it.' : '');
    zmap._editorSaveState(form, JSON.stringify(draft) !== original, !error, busy, path ? 'Save Path' : 'Create Path');
    form.find('.admin-user-status').text(error && draft.name ? error : '');
    zmap._previewPath(draft, path);
  };
  var renderSteps = function() {
    list.empty();
    draft.steps.forEach(function(step, i) {
      var point = !step.markerId;
      // A marker since removed from the map: kept, marked, and gone for good
      // if taken out (it can't be picked again).
      var removed = !!step.markerId && !zmap._pathMarker(step.markerId) && step.deleted;
      var li = $("<li class='path-step" + (removed ? ' path-step-deleted' : '') + "' data-index='" + i + "'>" +
        "<span class='path-step-handle' aria-label='Drag to reorder' title='Drag to reorder'><i class='fas fa-bars'></i></span>" +
        "<span class='path-step-number' style='--path-color:" + zmap._pathEsc(draft.color) + "'>" + (i + 1) + "</span>" +
        (point ? "<input type='text' class='form-control path-step-pin-name' maxlength='120' placeholder='" + (step.shown ? 'Pin name' : 'Waypoint (hidden)') + "'>" :
          "<span class='path-step-name'>" + zmap._pathEsc(zmap._pathStepLabel(step)) + "</span>") +
        (point ? "<button type='button' class='path-step-toggle' title='" + (step.shown ? 'Shown: click to hide it (a waypoint)' : 'Hidden waypoint: click to show it') + "'><i class='fas fa-eye" + (step.shown ? '' : '-slash') + "'></i></button>" : '') +
        "<button type='button' class='path-step-note-toggle" + (step.note ? ' active' : '') + "' title='Note' aria-label='Note'><i class='fas fa-sticky-note'></i></button>" +
        "<button type='button' class='path-step-remove' title='Remove step' aria-label='Remove step'><i class='fas fa-times'></i></button>" +
        (removed ? "<p class='path-step-removed-hint'><i class='fas fa-ban' aria-hidden='true'></i> Removed from the map. It stays in your path, but if you take it out, it can't be added back.</p>" : '') +
        "<textarea class='form-control path-step-note-input' maxlength='500' rows='2' placeholder='A note for this step'" + (step.note ? '' : ' hidden') + "></textarea></li>");
      li.find('.path-step-note-input').val(step.note || '').on('input', function() { step.note = this.value; update(); });
      li.find('.path-step-note-toggle').on('click', function() {
        var input = li.find('.path-step-note-input');
        input.prop('hidden', !input.prop('hidden'));
        if(!input.prop('hidden')) input.trigger('focus');
      });
      if(point) li.find('.path-step-pin-name').val(step.name || '').on('input', function() { step.name = this.value; update(); });
      li.find('.path-step-toggle').on('click', function() { step.shown = !step.shown; renderSteps(); update(); });
      li.find('.path-step-remove').on('click', function() {
        var remove = function() { draft.steps.splice(i, 1); renderSteps(); update(); };
        if(!removed) { remove(); return; }
        zmap._showAlert({
          id: 'path-remove-deleted-step',
          title: 'Take this step out?',
          description: ['“' + zmap._pathEsc(step.markerName || 'This marker') + '” has been removed from the map.',
            'Once it\'s out of your path (and you save), it can\'t be added back.'],
          actions: [
            {label: 'Take It Out', className: 'infoWindowIcn bad', onSelect: remove},
            {label: 'Keep It', cancel: true}
          ]
        });
      });
      list.append(li);
    });
    $(page).find('.path-step-count').text(draft.steps.length ? '(' + draft.steps.length + ')' : '');
    zmap._pathDragReorder(list[0], draft.steps, function() { renderSteps(); update(); });
  };
  state.addMarker = function(marker) {
    if(!page.isConnected) { zmap._endPathEditing(); return false; }
    var last = draft.steps[draft.steps.length - 1];
    if(last && last.markerId == marker.id) return true;
    draft.steps.push({markerId: Number(marker.id), note: ''});
    renderSteps(); update(); state.updateBar(marker.title || marker.name || 'marker');
    // (With the bar up, it says so itself: a toast would cover it.)
    if(!zmap._pathBar) toastr.success('Added ' + (marker.title || marker.name || 'marker') + ' as step ' + draft.steps.length);
    return true;
  };
  form.on('input change', update);
  // On a phone the editor covers the map: put it away while adding steps,
  // with a bar to drop pins and come back.
  state.updateBar = function(added) {
    if(!zmap._pathBar) return;
    var count = draft.steps.length + (draft.steps.length === 1 ? ' step' : ' steps');
    zmap._pathBar.querySelector('.path-bar-count').textContent = added ? 'Added ' + added + ' · ' + count : count;
  };
  form.find('.path-add-on-map').on('click', function() {
    zmap.mapControl.closeDrawer(true);
    var bar = zmap._pathBar = document.createElement('div');
    bar.className = 'path-add-bar';
    bar.innerHTML = "<span class='path-bar-text'><b>Tap markers</b> to add them<br><small class='path-bar-count'></small></span>" +
      "<button type='button' class='path-bar-pin'><i class='fas fa-map-pin'></i> Pin</button>" +
      "<button type='button' class='path-bar-done'>Done</button>";
    document.body.appendChild(bar);
    L.DomEvent.disableClickPropagation(bar);
    state.updateBar();
    bar.querySelector('.path-bar-pin').addEventListener('click', function() {
      form.find('.path-drop-pin').trigger('click');
      bar.querySelector('.path-bar-count').textContent = 'Tap the map to place the pin';
    });
    bar.querySelector('.path-bar-done').addEventListener('click', function() {
      zmap._closePathBar();
      zmap.mapControl.openDrawerLarge();
    });
  });
  form.find('.path-drop-pin').on('click', function() {
    var button = $(this).addClass('active').html('<i class="fas fa-crosshairs"></i> Click the map to drop it…');
    zmap.map.getContainer().classList.add('path-pin-mode');
    zmap._pathPinClick = function(e) {
      zmap._stopPathPinMode();
      if(!page.isConnected) return;
      var current = zmap.mapControl.getCurrentMap();
      draft.steps.push({submapId: Number(current.subMapId), x: Math.round(e.latlng.lng * 1000) / 1000, y: Math.round(e.latlng.lat * 1000) / 1000, name: '', shown: true, note: ''});
      renderSteps(); update(); state.updateBar();
      // (Named from the list: on a phone, once the editor's back.)
      if(!zmap._pathBar) list.find('.path-step-pin-name').last().trigger('focus');
    };
    zmap._pathPinButton = button;
    zmap.map.once('click', zmap._pathPinClick);
  });
  form.find('.path-cancel').on('click', function() {
    zmap._endPathEditing();
    if(path) zmap.openPathPage(path.slug, {keepView: true}); else zmap.mapControl.resetContent();
  });
  form.find('.path-delete').on('click', function() {
    if(!confirm('Delete "' + path.name + '"? This can\'t be undone.')) return;
    zmap._wikiPost('delete_path', {id: path.id}).done(function(r) {
      if(!r || !r.success) { toastr.error((r && r.msg) || 'Could not delete the path.'); return; }
      toastr.success('Path deleted');
      zmap._endPathEditing();
      if(zmap._focusedPath === path) zmap._focusedPath = null;
      var url = new URL(window.location.href); url.searchParams.delete('path');
      history.replaceState(history.state, '', url.toString());
      zmap.paths = zmap.paths.filter(function(p) { return p.id !== path.id; });
      zmap._preparePaths(); zmap.refreshMap();
      zmap.mapControl.resetContent();
    }).fail(function(x) { toastr.error(zmap._wikiError(x)); });
  });
  form.on('submit', function(e) {
    e.preventDefault();
    readForm();
    busy = true; update();
    var data = $.extend({game: zmap.mapOptions.shortName}, draft);
    zmap._wikiPost('save_path', {path: JSON.stringify(data)}).done(function(r) {
      busy = false;
      if(!r || !r.success) { form.find('.admin-user-status').text((r && r.msg) || 'Could not save the path.'); update(); return; }
      toastr.success(path ? 'Path saved' : 'Path created');
      zmap._endPathEditing();
      zmap._reloadPaths(function() { zmap.openPathPage(r.slug); });
    }).fail(function(x) { busy = false; form.find('.admin-user-status').text(zmap._wikiError(x)); update(); });
  });
  renderSteps();
  update();
  setTimeout(function() { form.find('[name=name]').trigger('focus'); }, 50);
};

ZMap.prototype._stopPathPinMode = function() {
  if(this._pathPinClick) this.map.off('click', this._pathPinClick);
  this._pathPinClick = null;
  this.map.getContainer().classList.remove('path-pin-mode');
  if(this._pathPinButton) this._pathPinButton.removeClass('active').html('<i class="fas fa-map-pin"></i> Drop a pin');
  this._pathPinButton = null;
};

ZMap.prototype._closePathBar = function() {
  if(this._pathBar) this._pathBar.remove();
  this._pathBar = null;
};

ZMap.prototype._endPathEditing = function() {
  this._stopPathPinMode();
  this._closePathBar();
  this._pathEditing = null;
  if(this.paths) this.paths = this.paths.filter(function(p) { return !p._preview; });
  this._previewOf = null;
  if(this._focusedPath && this._focusedPath._preview) this._focusedPath = null;
  if(this._preparePaths && this.paths) { this._preparePaths(); this.drawPaths(); }
};

// The path as edited, drawn in place of the saved one.
ZMap.prototype._previewPath = function(draft, saved) {
  var preview = {_preview: true, id: 'preview', slug: '__preview', scope: draft.scope, kind: draft.kind, loops: draft.loops,
    numbered: draft.numbered, smooth: draft.smooth, categoryId: draft.categoryId || null, color: draft.color, name: draft.name,
    steps: draft.steps.map(function(s) { return s.markerId ? (s.deleted ? {markerId: s.markerId, deleted: true, markerName: s.markerName, submapId: s.submapId, x: s.x, y: s.y} : {markerId: s.markerId}) :
      {submapId: s.submapId, x: s.x, y: s.y, name: s.name, shown: s.shown ? 1 : 0}; })};
  this.paths = this.paths.filter(function(p) { return !p._preview; });
  // The saved path steps aside while it's being edited (Paths.js _pathShown).
  this._previewOf = saved || null;
  this.paths.push(preview);
  this._preparePaths();
  this._focusedPath = preview;
  this.drawPaths();
};

ZMap.prototype._reloadPaths = function(then, slug) {
  var zmap = this;
  $.getJSON('ajax.php?command=get_paths&game=' + gameId + '&path=' + encodeURIComponent(slug || '')).done(function(paths) {
    zmap.paths = Array.isArray(paths) ? paths : [];
    zmap._preparePaths();
    zmap.refreshMap();
    if(then) then();
  });
};

// Reorder a list by dragging its items' handles (mouse, touch and pen).
ZMap.prototype._pathDragReorder = function(listEl, items, changed) {
  $(listEl).find('.path-step-handle').each(function() {
    var handle = this;
    handle.addEventListener('pointerdown', function(e) {
      e.preventDefault();
      var li = handle.closest('li'), from = Number(li.dataset.index), to = from;
      var rows = Array.prototype.slice.call(listEl.children);
      var startY = e.clientY, height = li.getBoundingClientRect().height;
      li.classList.add('path-step-dragging');
      handle.setPointerCapture(e.pointerId);
      var move = function(ev) {
        var dy = ev.clientY - startY;
        li.style.transform = 'translateY(' + dy + 'px)';
        to = Math.max(0, Math.min(rows.length - 1, from + Math.round(dy / height)));
        rows.forEach(function(row, i) {
          var shift = 0;
          if(i !== from) {
            if(from < to && i > from && i <= to) shift = -height;
            if(from > to && i < from && i >= to) shift = height;
          }
          row.style.transform = i === from ? row.style.transform : (shift ? 'translateY(' + shift + 'px)' : '');
        });
      };
      var up = function() {
        handle.removeEventListener('pointermove', move);
        handle.removeEventListener('pointerup', up);
        handle.removeEventListener('pointercancel', up);
        rows.forEach(function(row) { row.style.transform = ''; });
        li.classList.remove('path-step-dragging');
        if(to !== from) { items.splice(to, 0, items.splice(from, 1)[0]); changed(); }
      };
      handle.addEventListener('pointermove', move);
      handle.addEventListener('pointerup', up);
      handle.addEventListener('pointercancel', up);
    });
  });
};

// A path from a profile: opened here when it's this game's (loaded first if
// it's someone else's), else its game opened at it.
ZMap.prototype.openPathFromLink = function(game, slug) {
  var zmap = this;
  if(game !== this.mapOptions.shortName) {
    window.location.href = 'index.php?game=' + encodeURIComponent(game) + '&path=' + encodeURIComponent(slug);
    return;
  }
  if((this.paths || []).some(function(p) { return p.slug === slug; })) { this.openPathPage(slug); return; }
  this._reloadPaths(function() { zmap.openPathPage(slug); }, slug);
};

// A profile's paths: the owner's own routes, in every game.
ZMap.prototype._profilePathsHTML = function(data) {
  var zmap = this, paths = data.paths;
  // Paths are only sent to those who may see them (admins, while they're built).
  if(!Array.isArray(paths) || (!paths.length && !data.isSelf)) return '';
  var rows = paths.map(function(p) {
    return "<li>" + zmap._pathCardHTML($.extend({scope: 'user'}, p), {className: 'profile-path',
      attrs: "data-game='" + zmap._pathEsc(p.game) + "' data-slug='" + zmap._pathEsc(p.slug) + "'", game: true}) + "</li>";
  }).join('');
  return "<section class='wiki-section profile-paths'><h4>Paths</h4>" +
    (rows ? "<ul class='profile-path-list'>" + rows + "</ul>" :
      "<p class='wiki-empty'>No paths yet. Start one from any marker's page with “Make a path from here”.</p>") + "</section>";
};

// Wiki text without its link codes, for a short preview.
ZMap.prototype._pathPlainText = function(text) {
  return String(text || '').replace(/\[\[(\w+):([^\]|]*)(?:\|([^\]]*))?\]\]/g, function(all, kind, target, label) {
    return label || (/^user$/i.test(kind) ? target : /rev/i.test(kind) ? 'a revision' : 'a marker');
  });
};

ZMap.prototype._pathYeahCount = function(count) {
  return "<span class='path-yeahs'><span class='yeah-icon yeah-person' aria-hidden='true'></span>" + Number(count) + "<span class='sr-only'> Yeahs</span></span>";
};

// ---- Community Paths: everyone's public paths, in every game, newest or
// most Yeah'd first. (Under Account, for admins while paths are built.)
ZMap.prototype.openCommunityPaths = function(back, sort) {
  var zmap = this;
  sort = ['yeahs', 'completes'].indexOf(sort) !== -1 ? sort : 'latest';
  var page = this._showWikiPage("<div class='wiki-page community-paths'><h3 class='text-center'>Community Paths</h3>" +
    "<div class='admin-tabs activity-filters' role='group' aria-label='Sort paths'>" +
      [['latest', 'fa-clock', 'Latest'], ['yeahs', 'fa-smile', 'Most Yeah’d'], ['completes', 'fa-check', 'Most Completed']].map(function(o) {
        return "<button type='button' data-path-sort='" + o[0] + "' aria-selected='" + (o[0] === sort) + "'><i class='fas " + o[1] + "' aria-hidden='true'></i>" + o[2] + "</button>";
      }).join('') + "</div>" +
    "<ul class='profile-path-list community-path-list'></ul><p class='wiki-empty community-paths-status'>Loading…</p>" +
    "<button type='button' class='infoWindowIcn form-action-button community-paths-more' hidden>Show more</button></div>", 'communityPaths', back);
  var list = $(page).find('.community-path-list'), status = $(page).find('.community-paths-status'), more = $(page).find('.community-paths-more');
  // (Opened again in place, the page is reused: only the latest one loads.)
  var run = page._communityPathsRun = {}, offset = 0, request = 0;
  var load = function() {
    var mine = ++request;
    more.prop('disabled', true);
    zmap._wikiGet('community_paths', {sort: sort, offset: offset}).done(function(r) {
      if(mine !== request || page._communityPathsRun !== run) return;
      more.prop('disabled', false);
      if(!r || !r.success) { status.text((r && r.msg) || 'Could not load paths.').prop('hidden', false); return; }
      r.paths.forEach(function(p) {
        list.append("<li>" + zmap._pathCardHTML($.extend({scope: 'user', published: true}, p), {className: 'community-path',
          attrs: "data-game='" + zmap._pathEsc(p.game) + "' data-slug='" + zmap._pathEsc(p.slug) + "'", game: true, author: true, date: true}) + "</li>");
      });
      offset += r.paths.length;
      status.text(offset ? '' : 'No public paths yet.').prop('hidden', !!offset);
      more.prop('hidden', !r.more);
    }).fail(function(x) { if(mine === request) status.text(zmap._wikiError(x)).prop('hidden', false); });
  };
  $(page).off('.communityPaths').on('click.communityPaths', '[data-path-sort]', function() {
    var value = this.getAttribute('data-path-sort');
    if(value === sort) return;
    sort = value;
    $(page).find('[data-path-sort]').each(function() { this.setAttribute('aria-selected', String(this.getAttribute('data-path-sort') === sort)); });
    list.empty(); offset = 0; load();
  });
  $(page).on('click.communityPaths', '.community-path', function() {
    zmap.openPathFromLink(this.getAttribute('data-game'), this.getAttribute('data-slug'));
  });
  more.off('click').on('click', load);
  list.empty();
  load();
};

// ---- Path cards: a path in a list (a marker's page, a category, a profile,
// Community Paths), with a thumbnail of its whole line on the map and what
// we know of it. opts: className and attrs for the button, context (a
// marker's place in it), and whether to show its game, author and date.
ZMap.prototype._pathCardHTML = function(p, opts) {
  opts = opts || {};
  var zmap = this, esc = function(s) { return zmap._pathEsc(s); };
  var steps = Array.isArray(p.steps) ? p.steps.filter(function(s) { return s.markerId || s.shown != 0; }).length : Number(p.steps) || 0;
  var status = p.visibility !== undefined || p.published !== undefined ? this._pathStatusHTML(p) : '';
  var meta = [];
  if(opts.context) meta.push(esc(opts.context));
  if(opts.game && p.gameName) meta.push(esc(p.gameName));
  if(p.scope !== 'official' && opts.author && p.userName) meta.push('by ' + esc(p.userName));
  meta.push(steps + (steps === 1 ? ' step' : ' steps'));
  var stats = [];
  // The viewer's own progress, for this game's paths (their markers are here).
  if(Array.isArray(p.steps) && this._pathCheckMarkers) {
    var checks = this._pathCheckMarkers(p);
    var done = checks.filter(function(m) { return m.complete === true || m.complete == 1; }).length;
    if(checks.length) stats.push("<span class='path-card-progress" + (done === checks.length ? ' done' : '') + "'>" +
      (p.kind === 'single' ? (done ? 'Complete' : 'Not complete') : done + '/' + checks.length + ' Complete') + "</span>");
  }
  if(p.scope !== 'official' || p.yeahs) stats.push(this._pathYeahCount(p.yeahs || 0));
  if(p.finished) stats.push("<span class='path-finished' title='People who finished it'><i class='fas fa-check' aria-hidden='true'></i> " +
    Number(p.finished) + "<span class='sr-only'> people finished it</span></span>");
  if(opts.date && p.publishedAt) stats.push("<span class='path-card-date'>" + esc(this._pathTime(p.publishedAt)) + "</span>");
  return "<button type='button' class='path-card" + (opts.className ? ' ' + opts.className : '') + "' " + (opts.attrs || '') +
    " style='--path-color:" + esc(p.color || '#ffad48') + "'>" +
    this._pathThumbHTML(p.thumb, p.color || '#ffad48', p.loops, p.scope === 'user', p.smooth) +
    "<span class='path-card-body'>" +
      "<span class='path-card-title'>" + esc(p.name) + "</span>" +
      (status ? "<span class='path-card-badges'>" + status + "</span>" : '') +
      (p.description ? "<span class='path-card-description'>" + esc(this._pathPlainText(p.description)) + "</span>" : '') +
      "<span class='path-card-meta'>" + meta.join(' · ') + "</span>" +
      (stats.length ? "<span class='path-card-stats'>" + stats.join('') + "</span>" : '') +
    "</span></button>";
};

// The thumbnail: the map's own tiles around the path's whole line (as the
// server describes them, lib/common/paths.php pathThumbs), fitted to a 2:1
// frame, with the line, its start and its end drawn over them.
ZMap.prototype._pathThumbHTML = function(thumb, color, loops, dashed, smooth, square) {
  // A card's is 2:1; a list row's (_pathListItemHTML) square.
  var W = square ? 160 : 320, H = 160, zmap = this;
  if(!thumb || !thumb.points || !thumb.points.length) {
    return "<span class='path-card-thumb path-card-thumb-empty' aria-hidden='true'><i class='fas fa-map-signs'></i></span>";
  }
  // Map units to zoom-0 pixels: the game's projection (zmap.js ZCRS).
  var pts = thumb.points.map(function(p) { return [thumb.scaleP * p[1] + thumb.offsetX, thumb.scaleN * p[0] + thumb.offsetY]; });
  var xs = pts.map(function(p) { return p[0]; }), ys = pts.map(function(p) { return p[1]; });
  var minX = Math.min.apply(null, xs), maxX = Math.max.apply(null, xs), minY = Math.min.apply(null, ys), maxY = Math.max.apply(null, ys);
  var size = thumb.tileSize || 256, maxZoom = Math.max(0, thumb.maxZoom || 0);
  // Room around the line; a short one isn't blown up past the artwork's detail.
  var scale = Math.min(W / Math.max((maxX - minX) * 1.3, 1e-6), H / Math.max((maxY - minY) * 1.3, 1e-6), Math.pow(2, maxZoom));
  // Kept on the artwork where the frame fits inside it; centred on it where it doesn't.
  var fit = function(origin, view) { return view >= size ? (size - view) / 2 : Math.max(0, Math.min(size - view, origin)); };
  var ox = fit((minX + maxX) / 2 - W / 2 / scale, W / scale), oy = fit((minY + maxY) / 2 - H / 2 / scale, H / scale);
  // Tiles at the level that's sharp on high-density screens.
  var z = Math.max(0, Math.min(maxZoom, Math.ceil(Math.log2(scale * 2))));
  var n = Math.pow(2, z), span = size / n;
  var version = thumb.tileVersion ? '?v=' + encodeURIComponent(thumb.tileVersion) : '';
  var base = (thumb.tileBaseURL || this.tilesBaseURL) + thumb.tileURL;
  var tiles = '';
  for(var tx = Math.max(0, Math.floor(ox / span)); tx <= Math.min(n - 1, Math.floor((ox + W / scale) / span)); tx++) {
    for(var ty = Math.max(0, Math.floor(oy / span)); ty <= Math.min(n - 1, Math.floor((oy + H / scale) / span)); ty++) {
      var url = base + this.tileNameFormat.replace('{z}', z).replace('{x}', tx).replace('{y}', ty) + '.' + thumb.tileExt + version;
      var pct = function(v, of) { return (v / of * 100).toFixed(3) + '%'; };
      tiles += "<img src='" + zmap._pathEsc(url) + "' alt='' loading='lazy' decoding='async' style='left:" + pct((tx * span - ox) * scale, W) +
        ";top:" + pct((ty * span - oy) * scale, H) + ";width:" + pct(span * scale + .5, W) + ";height:" + pct(span * scale + .5, H) + "' onerror='this.remove()'>";
    }
  }
  // (Curved through the steps when the path is: Paths.js _smoothPoints.)
  var drawn = smooth && pts.length > 2 ? this._smoothPoints(pts, loops, 8) : pts.concat(loops && pts.length > 2 ? [pts[0]] : []);
  var line = drawn.map(function(p) { return ((p[0] - ox) * scale).toFixed(1) + ',' + ((p[1] - oy) * scale).toFixed(1); });
  var first = line[0].split(','), last = line[line.length - 1].split(',');
  var c = this._pathEsc(color);
  return "<span class='path-card-thumb" + (square ? " path-thumb-square" : '') + "' aria-hidden='true'" + (thumb.bgColor ? " style='background-color:" + this._pathEsc(thumb.bgColor) + "'" : '') + ">" + tiles +
    "<svg viewBox='0 0 " + W + " " + H + "' preserveAspectRatio='none'>" +
      "<polyline points='" + line.join(' ') + "' fill='none' stroke='#fff' stroke-width='6' stroke-linecap='round' stroke-linejoin='round' opacity='.9'/>" +
      // (A user's path dashed, as on the map: Paths.js.)
      "<polyline points='" + line.join(' ') + "' fill='none' stroke='" + c + "' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'" + (dashed ? " stroke-dasharray='7 5'" : '') + "/>" +
      (loops ? '' : "<circle cx='" + last[0] + "' cy='" + last[1] + "' r='4.5' fill='#fff' stroke='" + c + "' stroke-width='2.5'/>") +
      "<circle cx='" + first[0] + "' cy='" + first[1] + "' r='5.5' fill='" + c + "' stroke='#fff' stroke-width='2'/>" +
    "</svg></span>";
};

// A path as a compact card: the height of a search result's row
// (search-marker-list-entry), with its own background, a square thumbnail
// of its line on the map against its left edge, its name, and a line under
// it (a marker's place in it, the viewer's progress). For places a full card
// (_pathCardHTML) is too big: marker and category pages, Bookmarks, search.
ZMap.prototype._pathListItemHTML = function(p, opts) {
  opts = opts || {};
  var zmap = this, esc = function(s) { return zmap._pathEsc(s); };
  var line = [];
  if(opts.context) line.push(esc(opts.context));
  if(Array.isArray(p.steps) && this._pathCheckMarkers) {
    var checks = this._pathCheckMarkers(p);
    var done = checks.filter(function(m) { return m.complete === true || m.complete == 1; }).length;
    if(checks.length) line.push(p.kind === 'single' ? (done ? 'Complete' : 'Not complete') : done + '/' + checks.length + ' Complete');
  }
  if(!line.length) {
    var steps = Array.isArray(p.steps) ? p.steps.filter(function(s) { return s.markerId || s.shown != 0; }).length : Number(p.steps) || 0;
    line.push(steps + (steps === 1 ? ' step' : ' steps'));
  }
  return "<button type='button' class='path-compact-card path-list-item" + (opts.className ? ' ' + opts.className : '') + "' " +
    (opts.attrs || '') + " style='--path-color:" + esc(p.color || '#ffad48') + "'>" +
    "<span class='path-compact-thumb'>" + this._pathThumbHTML(p.thumb, p.color || '#ffad48', p.loops, p.scope === 'user', p.smooth, true) + "</span>" +
    "<span class='path-compact-body'><span class='path-compact-name'>" + esc(p.name) + "</span>" +
      "<span class='path-compact-line'><i class='fas fa-map-signs' aria-hidden='true'></i> " + line.join(' · ') + "</span></span>" +
    "<i class='fas fa-chevron-right path-compact-chevron' aria-hidden='true'></i></button>";
};

// A bookmarked path in Bookmarks (zmap.js _renderBookmarksList): its compact
// card, opening it with a way back to Bookmarks.
ZMap.prototype._createPathBookmarkEntry = function(bookmark) {
  var zmap = this;
  var entry = $("<li class='path-compact-row'>" + this._pathListItemHTML($.extend({scope: bookmark.scope}, bookmark)) + "</li>");
  entry.find('button').on('click', function() {
    var back = function() { zmap._createBookmarksPage(); };
    var open = function() { zmap.openPathPage(bookmark.slug, {back: back}); };
    if((zmap.paths || []).some(function(p) { return p.slug === bookmark.slug; })) open();
    else zmap._reloadPaths(open, bookmark.slug);
  });
  return entry;
};

// Paths in search results (SearchMarkerHandler.js), first: those of this
// game whose name or description has every word searched for, as compact
// cards.
ZMap.prototype._addPathSearchResults = function(query, listView, markerCount) {
  var words = String(query || '').toLowerCase().split(/\s+/).filter(Boolean);
  if(!words.length || !listView || !listView.markerListDomNode) return;
  var zmap = this;
  var found = (this.paths || []).filter(function(p) {
    if(p._preview) return false;
    var text = (p.name + ' ' + zmap._pathPlainText(p.description || '')).toLowerCase();
    var textWords = text.split(/[^a-z0-9']+/);
    // Each word, or near enough ("trade" finds "Trading"), as marker search is fuzzy.
    return words.every(function(w) {
      if(text.indexOf(w) !== -1) return true;
      var stem = w.length > 4 ? w.slice(0, w.length - 1) : null;
      return !!stem && textWords.some(function(t) { return t.indexOf(stem) === 0; });
    });
  });
  if(!found.length) return;
  var list = listView.markerListDomNode;
  var rows = $("<li class='path-search-results'></li>");
  found.forEach(function(p) {
    var card = $(zmap._pathListItemHTML(p));
    card.on('click', function() { zmap.openPathPage(p.slug); });
    rows.append(card);
  });
  list.prepend(rows);
  listView.noResultsDomNode.hide();
  listView.resultsDomNode.show();
  listView.currentSearchAmountDomNode.text(markerCount + found.length);
};

