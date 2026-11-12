// The community editing beta: anyone signed in can opt in, and then edits
// any marker, but can't delete markers or change whether they show (the
// server decides: lib/common/account_status.php). Here:
//  - the notice at the top of the category list, which explains the beta and
//    opts in, with a link to the game's Recent Community Edits under it;
//  - for editors, Recent Changes at the top of the list instead;
//  - the Recent Changes (one game) and All Changes (every game) pages;
//  - joining and leaving.

// The explainer's carousel: real screens, captured from a sample account.
ZMap.prototype.EDITING_BETA_SLIDES = [
  { image: 'images/editing-beta-editor.webp',
    alt: 'The marker editor: a category and a content section with a formatting toolbar' },
  { image: 'images/editing-beta-history.webp',
    alt: 'A marker\'s History: three edits, each with a summary, who made it and when' },
  { image: 'images/editing-beta-profile.webp',
    alt: 'A profile page: banner, picture, name, Beta Editor role, and counts of markers, edits and comments' }
];
ZMap.prototype.EDITING_BETA_CONTROLS_IMAGE = 'images/editing-beta-controls.webp';
ZMap.prototype.EDITING_BETA_SLIDE_MS = 3500;
ZMap.prototype.DISCORD_URL = 'https://discord.gg/ccuawSxUa3';

// 'editor' (Contributors and Admins, and beta testers), or 'none'.
ZMap.prototype._editingRole = function() {
  var me = this.getUser();
  if(me && me.level >= this.WIKI_EDITOR_LEVEL) return 'editor';
  return 'none';
};

ZMap.prototype._setupEditingBeta = function() {
  if(this._editingBetaReady) return;
  this._editingBetaReady = true;
  var _this = this;
  this.addHandler('userChanged', function(current) {
    _this._renderEditingBeta();
    // Signed in to join the beta: join now.
    if(current && _this._joinBetaAfterSignIn) {
      _this._joinBetaAfterSignIn = false;
      if(current.level < _this.WIKI_EDITOR_LEVEL) _this._joinEditingBeta();
    }
  });
  this._renderEditingBeta();
};

// The category list is built once categories have loaded (CategoryMenu).
$(document).on('zm:categoryMenuBuilt', function() {
  window.setTimeout(function() {
    if(typeof zMap === 'undefined' || !zMap._setupEditingBeta) return;
    zMap._setupEditingBeta();
    zMap._renderEditingBeta();
  }, 0);
});

// The top of the category list: the beta notice, or Recent Changes for
// editors. Redrawn when the account changes.
ZMap.prototype._renderEditingBeta = function() {
  var menu = this.mapControl && this.mapControl._categoryMenu;
  if(!menu || !menu.domNode) return;
  var root = $(menu.domNode);
  root.children('.editing-beta').remove();
  root.children('.category-editor-tools').remove();
  var _this = this;
  var game = this.mapOptions.shortName;
  var slot = $('<div class="editing-beta"></div>');
  if(this._editingRole() === 'editor') {
    // Contributors and Admins also manage the map (scripts/zmapsettings.js).
    slot.append(
      '<button type="button" class="editing-beta-changes">' +
        '<i class="fas fa-history" aria-hidden="true"></i>' +
        '<span>Recent Community Edits</span>' +
        '<i class="fas fa-chevron-right editing-beta-chevron" aria-hidden="true"></i>' +
      '</button>'
    );
  } else {
    slot.append(
      '<button type="button" class="editing-beta-notice">' +
        '<span class="editing-beta-icon" aria-hidden="true"><i class="fas fa-pencil-alt"></i></span>' +
        '<span class="editing-beta-text">' +
          '<strong>We\'re testing community editing!</strong>' +
          '<span>Try out the editing beta</span>' +
        '</span>' +
        '<i class="fas fa-chevron-right editing-beta-chevron" aria-hidden="true"></i>' +
      '</button>' +
      '<button type="button" class="editing-beta-changes editing-beta-all-changes">' +
        '<i class="fas fa-history" aria-hidden="true"></i>' +
        '<span>Recent Community Edits</span>' +
        '<i class="fas fa-chevron-right editing-beta-chevron" aria-hidden="true"></i>' +
      '</button>'
    );
  }
  slot.on('click', '.editing-beta-notice', function() { _this._showEditingBetaAlert(); });
  slot.on('click', '.editing-beta-settings', function(e) {
    e.stopImmediatePropagation();
    _this._openMapSettings(function() { _this.mapControl.resetContent(); });
  });
  slot.on('click', '.editing-beta-changes:not(.editing-beta-settings):not(.editing-beta-all-changes)', function() {
    _this._openRecentChanges(game, function() { _this.mapControl.resetContent(); });
  });
  slot.on('click', '.editing-beta-all-changes', function() {
    _this._openRecentChanges(null, function() { _this.mapControl.resetContent(); });
  });
  var recent=slot.find('.editing-beta-changes:not(.editing-beta-settings)').last();
  var toolbar=$('<div class="category-view-toolbar"></div>');
  recent.before(toolbar);toolbar.append(recent);
  var views=$('<div class="category-view-toggle" role="group" aria-label="Category view">'+
    '<button type="button" data-category-view="icons" aria-label="Icon view"><span class="category-view-dots" aria-hidden="true"><i></i><i></i><i></i><i></i></span></button>'+
    '<button type="button" data-category-view="list" aria-label="List view"><i class="fas fa-list" aria-hidden="true"></i></button></div>');
  toolbar.append(views);
  views.on('click','button',function() {menu.setCategoryView(this.getAttribute('data-category-view'));});
  root.prepend(slot);
  if(this._canUseMapSettings && this._canUseMapSettings()) {
    var tools=$(this._markerEditorToolsHTML({id:this.mapOptions.id || 1},{mapSettings:true,hideIdentity:true,allowDelete:false,talk:false})).addClass('category-editor-tools');
    this._wireEditorTools(tools,function(action) {
      var back=function() {_this.mapControl.resetContent();};
      if(action==='edit') _this._openMapSettings(back);
      else if(action==='history') _this._openMapSettingsHistory(back);
    });
    root.append(tools);
  }
  if(menu.setCategoryView) menu.setCategoryView(menu.categoryView || 'icons');
};

ZMap.prototype._showEditingBetaAlert = function() {
  var _this = this;
  var signedIn = !!this.getUser();
  this._showAlert({
    id: 'editing-beta-alert',
    title: 'Try out community map editing!',
    description: [
      'Help make Zelda Maps better: add markers that maps are missing, fix ones that are wrong, and ' +
        'write tips for other players.',
      this._editingBetaCarouselHTML(),
      'It works like a wiki: every edit is saved to a marker\'s History, each marker has a Talk page for ' +
        'discussing changes, and you get a profile page that shows all of your edits.'
    ],
    actions: [
      { label: signedIn ? 'Join the Beta' : 'Register and Join the Beta', className: 'infoWindowIcn form-action-button', onSelect: function() {
        if(signedIn) { _this._joinEditingBeta(); return; }
        // Signed out: register (counted in Admin's sign-up sources as the
        // editing beta), and join as soon as they have an account, or have
        // signed in to one they had.
        _this.trackFeatureEvent('prompt_register', 'editing_beta');
        _this._pendingBetaRegistration = true;
        _this._joinBetaAfterSignIn = true;
        _this._createRegisterForm();
        if(_this.mapControl.viewStyleBottomSlide) _this.mapControl.openDrawerLarge();
      } },
      { label: 'Maybe Later', cancel: true, onSelect: function() {
        if(!signedIn) _this.trackFeatureEvent('prompt_later', 'editing_beta');
      } }
    ]
  });
  if(!signedIn) this.trackFeatureEvent('prompt_shown', 'editing_beta');
  this._runEditingBetaCarousel(document.querySelector('#editing-beta-alert .editing-beta-carousel'));
};

// The screenshots in a strip across the dialog, the current one in the
// middle and its neighbours showing at the edges. Spans, since it goes in a
// paragraph. Two copies at each end let it loop round without a jump.
ZMap.prototype._editingBetaCarouselHTML = function() {
  var esc = this._wikiEscape.bind(this);
  var slides = this.EDITING_BETA_SLIDES, n = slides.length;
  var order = [n - 2, n - 1].concat(slides.map(function(s, i) { return i; }), [0, 1]);
  return '<span class="editing-beta-carousel" aria-label="Community editing screenshots">' +
    '<span class="editing-beta-track">' +
      order.map(function(index, position) {
        var copy = position < 2 || position >= n + 2;
        var slide = slides[(index + n) % n];
        return '<span class="editing-beta-slide"' + (copy ? ' aria-hidden="true"' : '') + '>' +
          '<img class="editing-beta-image" src="' + esc(slide.image) + '" alt="' + (copy ? '' : esc(slide.alt)) +
            '" width="680" height="680"></span>';
      }).join('') +
    '</span>' +
  '</span>';
};

// Moves on a slide every few seconds, round and round, until the dialog
// closes. People who'd rather not see motion get the change without the glide.
ZMap.prototype._runEditingBetaCarousel = function(root) {
  if(!root) return;
  var track = root.querySelector('.editing-beta-track');
  var count = this.EDITING_BETA_SLIDES.length, index = 2;
  var place = function(animate) {
    var slide = track.children[index];
    var offset = root.clientWidth / 2 - (slide.offsetLeft + slide.offsetWidth / 2);
    track.style.transition = animate ? '' : 'none';
    track.style.transform = 'translateX(' + offset + 'px)';
  };
  track.addEventListener('transitionend', function() {
    // Past the last real slide onto a copy: jump back to the real one.
    if(index >= count + 2) { index -= count; place(false); }
  });
  place(false);
  var timer = window.setInterval(function() {
    if(!root.isConnected) { window.clearInterval(timer); return; }
    index++;
    place(!window.matchMedia('(prefers-reduced-motion: reduce)').matches);
    if(window.matchMedia('(prefers-reduced-motion: reduce)').matches && index >= count + 2) { index -= count; place(false); }
  }, this.EDITING_BETA_SLIDE_MS);
  window.addEventListener('resize', function() { if(root.isConnected) place(false); });
};

// joined runs once they're in, before the welcome.
ZMap.prototype._joinEditingBeta = function(joined) {
  var _this = this;
  this._wikiPost('beta_editing', { action: 'join' }).done(function(data) {
    if(!data.success) { toastr.error(data.msg); return; }
    _this._applyEditingBeta(data);
    if(joined) joined();
    _this._showAlert({
      id: 'editing-beta-joined',
      title: 'You\'re in!',
      description: [
        'Thanks for helping test community editing!',
        '<img class="editing-beta-controls" src="' + _this.EDITING_BETA_CONTROLS_IMAGE + '" alt="A marker\'s ' +
          'editing controls: Edit, History and Talk" width="688" height="124">',
        'To fix or add to any marker, open it and choose <strong>Edit</strong>; every marker also has ' +
          '<strong>History</strong> and <strong>Talk</strong>. To add a marker, long-press the map to drop a pin, ' +
          'then choose <strong>Create Community Marker</strong>.',
        'You can see what everyone\'s changing from <strong>Recent Community Edits</strong> at the top of the category ' +
          'list, or view <a href="#" data-action="allChanges">All Changes across every map</a>.',
        'Finally, <a href="' + _this.DISCORD_URL + '" target="_blank" rel="noopener">join our community Discord ' +
          'server</a> to discuss edits with other beta testers! Happy editing!'
      ],
      links: {
        allChanges: function() {
          _this._openRecentChanges(null, function() { _this.mapControl.resetContent(); });
        }
      },
      actions: [{ label: 'Let\'s go!' }]
    });
  }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
};

// Leaving turns their profile off (profiles are for people who edit), so
// check first.
ZMap.prototype._confirmLeaveEditingBeta = function() {
  var _this = this;
  this._showAlert({
    id: 'editing-beta-leave',
    title: 'Leave the editing beta?',
    description: [
      'Your profile page will be turned off, but your edits will stay on the map and in each marker\'s History.',
      'You can rejoin at any time.'
    ],
    actions: [
      { label: 'Leave the Beta', className: 'infoWindowIcn bad', onSelect: function() { _this._leaveEditingBeta(); } },
      { label: 'Stay in the Beta', cancel: true }
    ]
  });
};

ZMap.prototype._leaveEditingBeta = function(done) {
  var _this = this;
  this._wikiPost('beta_editing', { action: 'leave' }).done(function(data) {
    if(!data.success) { toastr.error(data.msg); return; }
    _this._applyEditingBeta(data);
    _this.mapControl.resetContent();
    _this._showAlert({
      id: 'editing-beta-left',
      title: 'You\'ve left the editing beta',
      description: 'You can rejoin at any time from the top of the category list. Thanks for testing!',
      actions: [{ label: 'Okay' }]
    });
    if(done) done();
  }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
};

// The account's new role, everywhere it shows.
ZMap.prototype._applyEditingBeta = function(data) {
  var me = this.getUser();
  if(!me) return;
  me.level = data.level;
  me.betaEditor = !!data.betaEditor;
  // Add Marker in the map's right-click menu is for editors.
  this._buildContextMenu();
  this.notifyUserChanged();
  // Joined from the Account page: show it with the editing controls.
  // (The drawer skips showing the page it's already on, so let it redraw.)
  var contents = this.mapControl._contents;
  if(contents && contents.querySelector('#account')) {
    this.mapControl._contentType = null;
    this._createAccountForm(me);
  }
};

//************************************************************************//
//  Recent Changes (one game) and All Changes (every game)                //
//************************************************************************//

// game: a game's short name, or null for every game.
ZMap.prototype._openRecentChanges = function(game, back, activityFilter) {
  var _this = this;
  var title = game ? 'Recent Edits' : 'All Changes';
  activityFilter=activityFilter || 'all';
  var reopen = this._wikiReopen(function() { _this._openRecentChanges(game, back,activityFilter); }, back, title);
  // Serializable counterpart for comment links that switch games.
  Object.defineProperty(reopen,'activitySource',{get:function() {return {type:'recent',game:game || '',filter:activityFilter};}});
  var page = this._showWikiPage(
    '<div id="recent_changes" class="wiki-page">' +
      '<h3 class="text-center">' + title + '</h3>' +
      '<p class="wiki-subtitle">' + (game ? 'Community edits to ' + this._wikiEscape(game === this.mapOptions.shortName ? (this.mapOptions.name || game) : game)
        : 'Community edits to every map') + '</p>' +
      this._activityFilterHTML(activityFilter)+'<ul class="wiki-revisions"><li class="wiki-empty">Loading…</li></ul>' +
      '<button type="button" class="infoWindowIcn form-action-button recent-changes-more" hidden>Show More</button>' +
    '</div>',
    game ? 'recentChanges-' + game : 'allChanges',
    back,
    reopen,
    { settles: true }
  );
  var list = $(page).find('.wiki-revisions');
  var more = $(page).find('.recent-changes-more');
  var editor = this._editingRole() === 'editor';
  var oldest = 0;
  var request=0;
  var activityCache={};
  var renderActivity=function(data) {
    list.empty();
    if(!data.success) { list.append($('<li class="wiki-empty"></li>').text(data.msg)); return; }
    if(!data.changes.length) list.append('<li class="wiki-empty-state"><div class="wiki-empty-state-title">No Activity Yet</div><p>'+(activityFilter==='talk'?'Talk comments':activityFilter==='edits'?'Edits':'Community activity')+' will show up here.</p></li>');
    data.changes.forEach(function(change) {
      var row=_this._wikiActivityRow(change,{markerTitle:change.markerTitle+(game || !change.gameName?'':' · '+change.gameName)});
      row.find('.wiki-revision').attr({'data-marker':change.markerId,'data-game':change.game,'data-revision-type':change.revisionType || 'marker'});
      list.append(row);
      oldest=change.cursor || change.id;
    });
    more.prop('hidden',!data.more).prop('disabled',false);
  };
  ['all','edits','talk'].forEach(function(filter) {
    if(filter===activityFilter) return;
    _this._wikiGet('recent_changes',{game:game || '',before:'',filter:filter}).done(function(data) {
      if(data.success) activityCache[filter]=data;
    });
  });
  var load = function() {
    var version=++request;
    var loadingFilter=activityFilter,firstPage=!oldest;
    more.prop('disabled', true);
    _this._wikiGet('recent_changes', { game: game || '', before: oldest || '',filter:activityFilter }).done(function(data) {
      if(version!==request) return;
      if(firstPage && data.success) activityCache[loadingFilter]=data;
      if(!oldest) list.empty();
      // Another game's edits (a link from elsewhere): name that game.
      if(game && game !== _this.mapOptions.shortName && data.changes && data.changes[0] && data.changes[0].gameName) {
        $(page).find('.wiki-subtitle').text('Community edits to ' + data.changes[0].gameName);
      }
      if(!data.success) { list.append($('<li class="wiki-empty"></li>').text(data.msg)); return; }
      // Empty, like Bookmarks: a title and a line, centred with room around.
      if(!data.changes.length && !oldest) list.append('<li class="wiki-empty-state"><div class="wiki-empty-state-title">No Activity Yet</div>' +
        '<p>' + (activityFilter==='talk'?'Talk comments':activityFilter==='edits'?'Edits':'Community activity') + ' will show up here.</p></li>');
      data.changes.forEach(function(change) {
        var row = _this._wikiActivityRow(change, {
          markerTitle: change.markerTitle + (game || !change.gameName ? '' : ' · ' + change.gameName)
        });
        row.find('.wiki-revision').attr({ 'data-marker': change.markerId, 'data-game': change.game,'data-revision-type':change.revisionType || 'marker' });
        list.append(row);
        oldest = change.cursor || change.id;
      });
      more.prop('hidden', !data.more).prop('disabled', false);
    }).fail(function(xhr) {
      if(version!==request) return;
      list.empty().append($('<li class="wiki-empty"></li>').text(_this._wikiError(xhr)));
    });
  };
  $(page).find('.activity-filters').on('click','button',function() {
    var next=this.getAttribute('data-activity-filter');if(next===activityFilter) return;
    activityFilter=next;oldest=0;
    $(this).siblings().attr('aria-selected','false');$(this).attr('aria-selected','true');
    if(activityCache[next]) {++request;renderActivity(activityCache[next]);}
    else load();
  });
  list.on('click keydown', '.wiki-revision', function(e) {
    if($(e.target).closest('a.wiki-link').length) return;
    if(e.type==='keydown' && e.key!=='Enter' && e.key!==' ') return;
    e.preventDefault();
    var markerId = Number(this.getAttribute('data-marker'));
    var markerGame = this.getAttribute('data-game');
    if(this.getAttribute('data-revision-type')==='talk') {_this._openActivityComment(this,reopen);return;}
    if(this.getAttribute('data-revision-type')==='settings') {
      _this._openSettingsRevisionLink(Number(this.getAttribute('data-rev')),markerGame,reopen);return;
    }
    if(editor) {
      if(markerGame === _this.mapOptions.shortName) _this._openMarkerRevision(Number(this.getAttribute('data-rev')), reopen);
      else window.location.href = _this._wikiMarkerURL(markerId, markerGame, Number(this.getAttribute('data-rev')));
    } else {
      _this._openMarkerLink(markerId, null, reopen, markerGame);
    }
  });
  more.on('click', load);
  load();
};

//************************************************************************//
//  Searching for people: user:name in the search box                     //
//************************************************************************//

// Shows the people matching term in the search results (view, a
// MarkerListView); done runs once they're shown. Anyone can search; the
// people found are those who edit, who are the ones with profiles.
ZMap.prototype._searchUsers = function(term, query, view, done) {
  var _this = this;
  var request = this._userSearchRequest = (this._userSearchRequest || 0) + 1;
  view.clear();
  view.currentSearchQueryDomNodes.text(query);
  // The "Found n results" line is for results, not notes.
  var header = view.resultsDomNode.find('.header').show();
  var note = function(title, text, onClick) {
    header.hide();
    // Centred, with room around, like Bookmarks' empty state.
    var item = $('<li class="search-empty-state"><div class="search-empty-state-title"></div><p></p></li>');
    item.find('.search-empty-state-title').text(title);
    item.find('p').text(text);
    if(onClick) item.addClass('is-link').on('click', onClick);
    view.markerListDomNode.append(item);
    view.currentSearchAmountDomNode.text(0);
    view.resultsDomNode.show();
    done();
  };
  if(!term) {
    note('Search for people', 'Type a username after user: to find someone.');
    return;
  }
  this._wikiGet('user_search', { q: term }).done(function(data) {
    if(request !== _this._userSearchRequest) return;
    if(!data.success || !data.users.length) {
      view.noResultsDomNode.show();
      done();
      return;
    }
    view.currentSearchAmountDomNode.text(data.users.length);
    data.users.forEach(function(person) {
      var item = $('<li class="marker-list-entry search-marker-list-entry search-user-entry">' +
        '<span class="icon"><img class="search-user-avatar" alt=""></span>' +
        '<span class="details"><div class="name"></div><div class="location"></div></span></li>');
      item.find('img').attr('src', person.profilePicture || 'images/default-avatar.png')
        .on('error', function() { this.src = 'images/default-avatar.png'; });
      item.find('.name').text(person.username);
      // Where a marker result shows its location (search results hide descriptions).
      item.find('.location').text(_this._wikiRoleLabel(person.level, person.beta) + ' · ' +
        person.edits.toLocaleString() + (person.edits === 1 ? ' edit' : ' edits'));
      item.on('click', function() {
        _this._openUserProfile({ id: person.id }, function() { _this.mapControl.resetContent(); });
      });
      view.markerListDomNode.append(item);
      view.markerListDomNode.append($(view.separatorDomNodeTemplate).addClass('search-result-separator'));
    });
    view.resultsDomNode.show();
    done();
  }).fail(function(xhr) {
    if(request !== _this._userSearchRequest) return;
    note('Couldn\'t search for people', _this._wikiError(xhr));
  });
};

//************************************************************************//
//  Profile preview, for accounts that don't edit yet                     //
//************************************************************************//

// Account > Profile for someone not in the beta: their profile as it would
// start, and the way to set it up.
ZMap.prototype._openProfilePreview = function(back) {
  var _this = this, me = this.getUser() || {};
  var page = this._showWikiPage(
    '<div id="user_profile" class="wiki-page profile-preview">' +
      '<div class="profile-banner"></div>' +
      '<div class="profile-head">' +
        '<img class="profile-avatar" alt="" />' +
        '<h3 class="profile-name"></h3>' +
        '<p class="profile-role">Member</p>' +
      '</div>' +
      '<section class="wiki-section profile-preview-invite">' +
        '<div class="wiki-card">' +
          '<p><strong>Join the community editing beta to set up your profile.</strong></p>' +
          '<p>Your profile shows everyone the markers you\'ve added and fixed, with a banner and a bit about you.</p>' +
          '<button type="button" class="infoWindowIcn form-action-button" data-action="join-beta">Join the Editing Beta</button>' +
        '</div>' +
      '</section>' +
    '</div>',
    'profilePreview',
    back
  );
  $(page).find('.profile-avatar').attr('src', me.profilePicture || 'images/default-avatar.png')
    .on('error', function() { this.src = 'images/default-avatar.png'; });
  $(page).find('.profile-name').text(me.username || '');
  $(page).on('click', '[data-action="join-beta"]', function() {
    $(this).prop('disabled', true);
    _this._joinEditingBeta(function() { _this._openUserProfile({ id: me.id }, back); });
  });
};
