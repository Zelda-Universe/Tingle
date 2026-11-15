// Notifications (lib/common/notifications.php): a badge on the account
// button, the Notifications page under Account, its settings (in the app,
// by email, or both, for each kind), browser push on this device, and the
// markers you follow. Editors only for now, like the Talk pages they're about.

ZMap.prototype.NOTIFICATION_POLL_MS = 60 * 1000;

ZMap.prototype.NOTIFICATION_ICONS = {
  user_talk: 'fa-comment-dots',
  comment_reply: 'fa-reply',
  like: 'fa-smile',
  comment_like: 'fa-smile',
  edit_like: 'fa-smile',
  mention: 'fa-at',
  marker_comment: 'fa-comments',
  marker_edit: 'fa-pencil-alt',
  followed_comment: 'fa-comments',
  followed_edit: 'fa-pencil-alt',
  path_edit: 'fa-map-signs',
  edit_report: 'fa-flag',
  warning: 'fa-exclamation-triangle'
};

//************************************************************************//
//  Badge                                                                 //
//************************************************************************//

ZMap.prototype.setNotificationCount = function(count) {
  count = this._isWikiEditor() ? Math.max(0, Number(count) || 0) : 0;
  this.notificationCount = count;
  var label = count > 99 ? '99+' : String(count);
  $('.account-button').each(function() {
    var badge = $(this).find('.account-badge');
    if(!badge.length) badge = $('<span class="account-badge" aria-hidden="true"></span>').appendTo(this);
    badge.text(label).prop('hidden', !count);
    this.setAttribute('aria-label', count ? 'Account, ' + count + ' unread notification' + (count === 1 ? '' : 's') : 'Account');
  });
  $('#account_notifications_btn .account-nav-count').text(label).prop('hidden', !count);
  // The installed app's icon, where supported.
  try {
    if(count && navigator.setAppBadge) navigator.setAppBadge(count);
    else if(!count && navigator.clearAppBadge) navigator.clearAppBadge();
  } catch(e) {}
};

ZMap.prototype.refreshNotificationCount = function() {
  var _this = this;
  if(!this._isWikiEditor() || !navigator.onLine) return;
  $.getJSON('ajax.php?command=notifications_count').done(function(data) {
    if(data && data.success) _this.setNotificationCount(data.unread);
  });
};

// Keeps the badge current: on sign-in, every minute while the page is
// visible, on coming back to it, and when a push arrives.
ZMap.prototype._watchNotifications = function() {
  var _this = this;
  if(!this._notificationsWatched) {
    this._notificationsWatched = true;
    document.addEventListener('visibilitychange', function() {
      if(document.visibilityState === 'visible') _this.refreshNotificationCount();
    });
    window.setInterval(function() {
      if(document.visibilityState === 'visible') _this.refreshNotificationCount();
    }, this.NOTIFICATION_POLL_MS);
    if('serviceWorker' in navigator) navigator.serviceWorker.addEventListener('message', function(event) {
      var data = event.data || {};
      if(data.type === 'zeldamaps-notifications') _this.refreshNotificationCount();
      if(data.type === 'zeldamaps-open-notification' && data.url) _this._openWikiURL(data.url);
    });
    this.addHandler('userChanged', function(current) {
      _this.setNotificationCount(current && current.unreadNotifications);
    });
  }
  var me = this.getUser();
  this.setNotificationCount(me && me.unreadNotifications);
};

//************************************************************************//
//  Links: ?marker=1&rev=2, ?marker=1&talk=1&comment=3, ?user=4&talk=1     //
//************************************************************************//

ZMap.prototype._wikiLinkParams = function(url) {
  var params = new URL(url || window.location.href, window.location.href).searchParams;
  var number = function(name) { return Number(params.get(name)) || 0; };
  return {
    marker: number('marker'), rev: number('rev'), talk: params.get('talk') === '1',
    user: params.get('user'), comment: number('comment'), game: params.get('game'),
    notification: number('notification'), page: params.get('page'), report: number('report'), settingsRev:number('settings-rev'),
    navigationRestore:params.get('nav-restore'), path: params.get('path'), pathRev: number('pathrev')
  };
};

ZMap.prototype._hasWikiLink = function() {
  var link = this._wikiLinkParams();
  return !!(link.navigationRestore || link.rev || link.user || (link.talk && link.marker));
};

// Opens what a link points at, in place. Links into another game load it.
ZMap.prototype._openWikiURL = function(url) {
  var link = this._wikiLinkParams(url);
  if(link.page==='game-settings-revision' && link.settingsRev) {this._openSettingsRevisionLink(link.settingsRev,link.game);return;}
  if(link.path && link.game && this.openPathFromLink) {
    // (At its Talk, or one of its revisions: a notification's.)
    this.openPathFromLink(link.game, link.path, null, {talk: link.talk, comment: link.comment, pathRev: link.pathRev});
    return;
  }
  if(link.page === 'notifications') {
    this._openNotificationsPage();
    return;
  }
  if(link.page === 'report' && link.report && this._openReport) {
    this._openReport(link.report);
    return;
  }
  if(link.page === 'admin-reports' && this._openAdminReports) {
    this._openAdminReports();
    return;
  }
  if(!link.rev && !link.talk && link.game && this.mapOptions && link.game !== this.mapOptions.shortName && link.marker) {
    window.location.href = new URL(url, window.location.href).href;
    return;
  }
  this._openWikiLink(link);
};

ZMap.prototype._openWikiLink = function(link, back) {
  var _this = this;
  var initial=this.mapControl._suppressPageSlide || this.mapControl._restoringInitialPage;
  var render=function(callback) {return initial ? _this._withoutPageSlide(callback) : callback();};
  if(link.navigationRestore && this._restoreMarkerLinkSource(link.navigationRestore)) return;
  if(!back && this._markerLinkReturnBack) back=this._markerLinkReturnBack();
  if(link.notification) {
    this._wikiPost('notifications_read', { ids: [link.notification] }).done(function(data) {
      if(data.success) _this.setNotificationCount(data.unread);
    });
  }
  if(link.rev) {
    this._openMarkerRevision(link.rev, back || function() {
      _this._openMarkerHistory(link.marker, _this._wikiBackToMarker(link.marker));
    });
  } else if(link.talk && link.user) {
    this._wikiGet('user_profile', { name: link.user }).done(function(data) {
      if(!data.success) return;
      render(function() {
        _this._openTalk('user', data.user.id, data.user.username, back || function() {
          _this._openUserProfile({ id: data.user.id });
        }, { highlight: link.comment });
      });
    });
  } else if(link.user) {
    this._openUserProfile({name:link.user},back);
  } else if(link.talk && link.marker) {
    var marker = this.cachedMarkersById[link.marker];
    if(marker && link.comment && this._openActivityComment) {
      if(!back) {
        try {
          var source=JSON.parse(new URL(window.location.href).searchParams.get('talk-from') || 'null');
          if(source && ['all','edits','talk'].includes(source.filter)) {
            if(source.type==='recent' && typeof source.game==='string' && /^[A-Za-z0-9_-]{0,30}$/.test(source.game)) back=function() {_this._openRecentChanges(source.game || null,null,source.filter);};
            else if(source.type==='profile' && Number.isInteger(source.id) && source.id>0) back=function() {_this._profileActivityFilter=source.filter;_this._openUserProfile({id:source.id});};
            else if(source.type==='notifications') back=function() {_this._openNotificationsPage();};
          }
        } catch(e) {}
      }
      var target=$('<div></div>').attr({'data-page-type':'marker','data-page-id':link.marker,'data-comment':link.comment,'data-title':marker.title,'data-game':this.mapOptions.shortName});
      this._openActivityComment(target[0],back);return;
    }
    var open = function(title) {
      render(function() {_this._openTalk('marker', link.marker, title, back || _this._wikiBackToMarker(link.marker), { highlight: link.comment });});
    };
    if(marker) open(marker.title);
    else this._wikiGet('marker_history', { markerId: link.marker }).done(function(data) {
      open(data.success ? data.marker.title : '');
    });
  }
};

// Links open once both the account and the markers have loaded.
ZMap.prototype._openRevisionLinkWhenReady = function(part) {
  if(!this._hasWikiLink() || this._revisionLinkOpened) return;
  this._revisionLinkReady = Object.assign({}, this._revisionLinkReady);
  this._revisionLinkReady[part] = true;
  if(!this._revisionLinkReady.user || !this._revisionLinkReady.markers) return;
  this._revisionLinkOpened = true;
  var link = this._wikiLinkParams();
  try {
    var url = new URL(window.location.href);
    // Keep the destination address intact while its async page loads. In
    // particular, opening the initial marker must not consume ?talk=1.
    url.searchParams.delete('notification');
    window.history.replaceState(window.history.state, '', url.href);
  } catch(e) {}
  this._withoutPageSlide(function() {this._openWikiLink(link);}.bind(this));
};

//************************************************************************//
//  Notifications page                                                    //
//************************************************************************//

ZMap.prototype._openNotificationsPage = function(back) {
  var _this = this;
  back = back || this._wikiBackToAccount();
  var reopen = this._wikiReopen(function() { _this._openNotificationsPage(back); }, back, 'Notifications');
  reopen.activitySource={type:'notifications',filter:'all'};
  var page = this._showWikiPage(
    '<div id="notifications_page" class="wiki-page">' +
      '<h3 class="text-center">Notifications</h3>' +
      '<div class="wiki-actions notification-actions">' +
        '<button type="button" class="wiki-action-button" data-action="read-all"><i class="fas fa-check" aria-hidden="true"></i>Mark All Read</button>' +
        '<button type="button" class="wiki-action-button" data-action="settings"><i class="fas fa-cog" aria-hidden="true"></i>Settings</button>' +
      '</div>' +
      '<ul class="notification-list"><li class="wiki-empty">Loading…</li></ul>' +
      '<button type="button" class="infoWindowIcn form-action-button notification-more" hidden>Load More</button>' +
    '</div>',
    'notificationsPage',
    back,
    reopen,
    { settles: true }
  );
  var list = $(page).find('.notification-list');
  var more = $(page).find('.notification-more');
  var oldest = 0;
  var load = function() {
    more.prop('disabled', true);
    _this._wikiGet('notifications_get', oldest ? { before: oldest } : {}).done(function(data) {
      more.prop('disabled', false);
      if(!oldest) list.empty();
      if(!data.success) {
        list.append($('<li class="wiki-empty"></li>').text(data.msg));
        return;
      }
      _this.setNotificationCount(data.unread);
      if(!oldest && !data.notifications.length) {
        list.append('<li class="wiki-empty notification-empty"><i class="fas fa-bell" aria-hidden="true"></i>' +
          'Nothing yet. Replies, messages on your talk page and changes to your markers show up here.</li>');
      }
      data.notifications.forEach(function(n) {
        list.append(_this._notificationRow(n));
        oldest = n.id;
      });
      more.prop('hidden', !data.more);
    }).fail(function(xhr) {
      more.prop('disabled', false);
      list.empty().append($('<li class="wiki-empty"></li>').text(_this._wikiError(xhr)));
    });
  };
  list.on('click', '.notification', function(e) {
    if($(e.target).closest('a.wiki-link').length) return;
    var item = $(this);
    var n = item.data('notification');
    if(!n.isRead) {
      n.isRead = true;
      item.removeClass('unread');
      _this._wikiPost('notifications_read', { ids: [n.id] }).done(function(data) {
        if(data.success) _this.setNotificationCount(data.unread);
      });
    }
    // A report opens its own page, not the edit it's about.
    var target = n.url ? _this._wikiLinkParams(n.url) : {};
    if(target.page === 'report' && target.report) { _this._openReport(target.report, reopen); return; }
    if(target.page === 'admin-reports') { _this._openAdminReports(); return; }
    if(target.path && target.game) { _this.openPathFromLink(target.game, target.path, reopen); return; }
    if(target.page === 'notifications') return;
    if(target.page==='game-settings-revision' && target.settingsRev) {_this._openSettingsRevisionLink(target.settingsRev,target.game,reopen);return;}
    if(!n.revisionId && n.commentId && (n.markerId || n.pageType==='marker')) {
      var commentTarget=$('<div></div>').attr({'data-page-type':'marker','data-page-id':n.markerId || n.pageId,'data-comment':n.commentId,'data-title':n.pageTitle || '', 'data-game':n.game || _this.mapOptions.shortName});
      _this._openActivityComment(commentTarget[0],reopen);
      return;
    }
    _this._openWikiLink({
      rev: n.revisionId, talk: !n.revisionId, marker: n.markerId || (n.pageType === 'marker' ? n.pageId : 0),
      user: n.pageType === 'user' ? n.pageId : 0, comment: n.commentId
    }, reopen);
  });
  $(page).on('click', '[data-action]', function() {
    var action = this.getAttribute('data-action');
    if(action === 'settings') {
      _this._openNotificationSettings(reopen);
    } else if(action === 'read-all') {
      _this._wikiPost('notifications_read', { all: 1 }).done(function(data) {
        if(!data.success) return;
        list.find('.notification.unread').removeClass('unread').each(function() { $(this).data('notification').isRead = true; });
        _this.setNotificationCount(0);
      }).fail(function(xhr) { toastr.error(_this._wikiError(xhr)); });
    }
  });
  more.on('click', load);
  load();
};

ZMap.prototype._notificationRow = function(n) {
  var avatar = n.actorPicture || 'images/default-avatar.png';
  var icon = this.NOTIFICATION_ICONS[n.type] || 'fa-bell';
  var item = $(
    '<li class="notification notification-type-' + this._wikiEscape(n.type) + '" role="button" tabindex="0">' +
      '<span class="notification-avatar"><img src="' + this._wikiEscape(avatar) + '" alt="" loading="lazy" ' +
        'onerror="this.onerror=null;this.src=\'images/default-avatar.png\'" />' +
        '<span class="notification-kind"><i class="fas ' + icon + '" aria-hidden="true"></i></span></span>' +
      '<span class="notification-main">' +
        '<span class="notification-title"></span>' +
        (n.body ? '<span class="notification-body"></span>' : '') +
        '<span class="notification-time"></span>' +
      '</span>' +
      '<span class="notification-dot" aria-label="Unread"></span>' +
    '</li>'
  );
  item.toggleClass('unread', !n.isRead).data('notification', n);
  item.find('.notification-title').text(n.title);
  item.find('.notification-body').text(n.body);
  if(n.type==='comment_reply' && n.parentBody) {
    var quote=$('<blockquote class="activity-reply-quote notification-reply-quote"><cite></cite><div></div></blockquote>');
    quote.find('cite').text(n.parentUsername || 'Comment');
    quote.find('div').html(this._renderWikiText(n.parentBody));
    item.find('.notification-time').before(quote);
  }
  item.find('.notification-time').text(this._wikiAgo(n.ago));
  return item;
};

//************************************************************************//
//  Settings                                                              //
//************************************************************************//

ZMap.prototype.NOTIFICATION_CHOICES = [
  { key: 'off', label: 'Off', inApp: false, email: false },
  { key: 'app', label: 'In-App', inApp: true, email: false },
  { key: 'email', label: 'Email', inApp: false, email: true },
  { key: 'both', label: 'Both', inApp: true, email: true }
];

ZMap.prototype._openNotificationSettings = function(back) {
  var _this = this;
  back = back || function() { _this._openNotificationsPage(); };
  var reopen = function() { _this._openNotificationSettings(back); };
  var page = this._showWikiPage(
    '<div id="notification_settings" class="wiki-page">' +
      '<h3 class="text-center">Notification Settings</h3>' +
      '<div class="notification-settings-body"><p class="wiki-empty wiki-section">Loading…</p></div>' +
    '</div>',
    'notificationSettingsPage',
    back,
    reopen,
    { settles: true }
  );
  var body = $(page).find('.notification-settings-body');
  this._wikiGet('notification_settings').done(function(data) {
    body.empty();
    if(!data.success) {
      body.append($('<p class="wiki-empty wiki-section"></p>').text(data.msg));
      return;
    }
    // Push on this device.
    body.append(
      '<section class="wiki-section notification-push">' +
        '<h4>Push Notifications on This Device</h4>' +
        '<div class="wiki-card">' +
          '<p class="notification-push-status"></p>' +
          '<button type="button" class="infoWindowIcn form-action-button notification-push-button" hidden></button>' +
        '</div>' +
        '<p class="wiki-hint notification-note">Push notifications follow your In-App choices below.</p>' +
      '</section>'
    );
    _this._renderPushControl(body.find('.notification-push'), data.push);

    // Each kind, grouped.
    var groups = {};
    data.types.forEach(function(type) { (groups[type.group] = groups[type.group] || []).push(type); });
    Object.keys(groups).forEach(function(group) {
      var section = $('<section class="wiki-section"></section>').append($('<h4></h4>').text(group));
      var card = $('<div class="wiki-card notification-types"></div>').appendTo(section);
      groups[group].forEach(function(type) {
        card.append(_this._notificationTypeRow(type, data.settings[type.type]));
      });
      body.append(section);
    });
    if(!data.emailEnabled) {
      body.append('<p class="wiki-hint wiki-section">Email isn\'t set up on this server, so email choices are saved but nothing is sent yet.</p>');
    }

    // Following.
    body.append(
      '<section class="wiki-section">' +
        '<h4>Following</h4>' +
        '<div class="wiki-card notification-follow">' +
          '<label class="notification-switch"><span><strong>Follow markers you comment on</strong>' +
            '<small>Then you hear about every new comment on them.</small></span>' +
            '<input type="checkbox" data-option="autoFollow" /></label>' +
          '<button type="button" class="notification-link-row" data-action="followed">' +
            '<span>Followed Markers</span><span class="notification-link-count"></span>' +
            '<i class="fas fa-chevron-right" aria-hidden="true"></i></button>' +
        '</div>' +
      '</section>'
    );
    body.find('[data-option="autoFollow"]').prop('checked', data.options.autoFollow);
    body.find('.notification-link-count').text(data.followCount + (data.options.followsPaused ? ' · Paused' : ''));
  }).fail(function(xhr) {
    body.empty().append($('<p class="wiki-empty wiki-section"></p>').text(_this._wikiError(xhr)));
  });

  body.on('click', '.notification-choice button', function() {
    var button = $(this);
    var row = button.closest('.notification-type');
    var choice = _this.NOTIFICATION_CHOICES.find(function(c) { return c.key === button.attr('data-choice'); });
    var previous = row.find('button[aria-pressed="true"]');
    row.find('button').attr('aria-pressed', 'false');
    button.attr('aria-pressed', 'true');
    _this._wikiPost('notification_settings', {
      type: row.attr('data-type'), inApp: choice.inApp ? 1 : 0, email: choice.email ? 1 : 0
    }).fail(function(xhr) {
      toastr.error(_this._wikiError(xhr, 'That setting couldn\'t be saved.'));
      row.find('button').attr('aria-pressed', 'false');
      previous.attr('aria-pressed', 'true');
    });
  });
  body.on('change', '[data-option="autoFollow"]', function() {
    var input = this;
    _this._wikiPost('notification_settings', { autoFollow: input.checked ? '1' : '0' }).fail(function(xhr) {
      input.checked = !input.checked;
      toastr.error(_this._wikiError(xhr, 'That setting couldn\'t be saved.'));
    });
  });
  body.on('click', '[data-action="followed"]', function() {
    _this._openFollowedMarkers(reopen);
  });
};

ZMap.prototype._notificationTypeRow = function(type, setting) {
  var current = this.NOTIFICATION_CHOICES.find(function(c) {
    return c.inApp === !!setting.inApp && c.email === !!setting.email;
  }) || this.NOTIFICATION_CHOICES[0];
  var row = $('<div class="notification-type"></div>').attr('data-type', type.type);
  row.append($('<div class="notification-type-label"></div>').text(type.label));
  if(type.hint) row.append($('<div class="notification-type-hint"></div>').text(type.hint));
  var choices = $('<div class="notification-choice" role="group"></div>').attr('aria-label', type.label);
  this.NOTIFICATION_CHOICES.forEach(function(choice) {
    choices.append($('<button type="button"></button>')
      .attr('data-choice', choice.key)
      .attr('aria-pressed', choice === current ? 'true' : 'false')
      .text(choice.label));
  });
  return row.append(choices);
};

//************************************************************************//
//  Push on this device                                                   //
//************************************************************************//

ZMap.prototype._pushSupported = function() {
  return 'serviceWorker' in navigator && 'PushManager' in window && 'Notification' in window;
};

ZMap.prototype._pushSubscription = function() {
  if(!this._pushSupported()) return Promise.resolve(null);
  return navigator.serviceWorker.ready.then(function(registration) {
    return registration.pushManager.getSubscription();
  });
};

ZMap.prototype._pushKey = function(base64) {
  // base64url to base64, then pad to a multiple of 4 (a length of 1 mod 4 is
  // invalid, and atob throws, so the padding count must land exactly on 4).
  var normalized = (base64 || '').replace(/-/g, '+').replace(/_/g, '/');
  var padded = normalized + '===='.slice((normalized.length % 4) || 4);
  var raw = atob(padded);
  var bytes = new Uint8Array(raw.length);
  for(var i = 0; i < raw.length; i++) bytes[i] = raw.charCodeAt(i);
  return bytes;
};

ZMap.prototype._renderPushControl = function(section, push) {
  var _this = this;
  var status = section.find('.notification-push-status');
  var button = section.find('.notification-push-button');
  var show = function(text, buttonText) {
    status.text(text);
    button.text(buttonText || '').prop('hidden', !buttonText).prop('disabled', false);
  };
  var isAppleMobile = /iPad|iPhone|iPod/.test(navigator.userAgent) ||
    (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1);
  var standalone = window.matchMedia && window.matchMedia('(display-mode: standalone)').matches || navigator.standalone;
  if(!push || !push.available) {
    show('Push notifications aren\'t available on this server yet.');
    return;
  }
  if(!this._pushSupported()) {
    show(isAppleMobile && !standalone
      ? 'On iPhone and iPad, add Zelda Maps to your Home Screen (Share, then Add to Home Screen) and open it from there to turn on push notifications.'
      : 'This browser doesn\'t support push notifications.');
    return;
  }
  var refresh = function() {
    if(Notification.permission === 'denied') {
      show('Notifications are blocked for Zelda Maps in this browser\'s settings. Allow them there to turn push on.');
      return;
    }
    _this._pushSubscription().then(function(subscription) {
      if(subscription && Notification.permission === 'granted') show('On for this device.', 'Turn Off');
      else show('Off for this device.', 'Turn On');
    }, function() { show('Push notifications couldn\'t be checked on this device.'); });
  };
  button.on('click', function() {
    button.prop('disabled', true);
    _this._pushSubscription().then(function(subscription) {
      if(subscription && Notification.permission === 'granted') return _this._pushForgetDevice();
      return _this._pushEnable(push.publicKey);
    }).catch(function(error) {
      toastr.error(error && error.message ? error.message : 'Push notifications couldn\'t be turned on.');
    }).then(refresh);
  });
  refresh();
};

ZMap.prototype._pushEnable = function(publicKey) {
  var _this = this;
  return Notification.requestPermission().then(function(permission) {
    if(permission !== 'granted') throw new Error('Allow notifications to turn push on.');
    return navigator.serviceWorker.ready;
  }).then(function(registration) {
    return registration.pushManager.getSubscription().then(function(existing) {
      // A subscription made with other keys can't be used.
      return existing ? existing.unsubscribe() : null;
    }).then(function() {
      return registration.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey: _this._pushKey(publicKey) });
    });
  }).then(function(subscription) {
    var json = subscription.toJSON();
    return _this._wikiPost('push_subscribe', {
      endpoint: json.endpoint, p256dh: json.keys && json.keys.p256dh, auth: json.keys && json.keys.auth
    }).then(function(result) {
      if(!result.success) throw new Error(result.msg);
      toastr.success('Push notifications are on for this device.');
    });
  });
};

// This device stops getting pushes (Turn Off, and Log Out).
ZMap.prototype._pushForgetDevice = function() {
  var _this = this;
  return this._pushSubscription().then(function(subscription) {
    if(!subscription) return;
    var endpoint = subscription.endpoint;
    return subscription.unsubscribe().catch(function() {}).then(function() {
      return _this._wikiPost('push_subscribe', { endpoint: endpoint, remove: 1 }).catch(function() {});
    });
  }).catch(function() {});
};

//************************************************************************//
//  Followed markers                                                      //
//************************************************************************//

ZMap.prototype._openFollowedMarkers = function(back) {
  var _this = this;
  back = back || function() { _this._openNotificationSettings(); };
  var reopen = this._wikiReopen(function() { _this._openFollowedMarkers(back); }, null, 'Followed Markers');
  var page = this._showWikiPage(
    '<div id="followed_markers" class="wiki-page">' +
      '<h3 class="text-center">Followed Markers</h3>' +
      '<section class="wiki-section">' +
        '<div class="wiki-card">' +
          '<label class="notification-switch"><span><strong>Notifications from followed markers</strong>' +
            '<small>Turn off to pause all of them at once. You keep following them.</small></span>' +
            '<input type="checkbox" class="followed-toggle" disabled /></label>' +
        '</div>' +
      '</section>' +
      '<ul class="wiki-revisions followed-list"><li class="wiki-empty">Loading…</li></ul>' +
    '</div>',
    'followedMarkersPage',
    back,
    reopen,
    { settles: true }
  );
  var list = $(page).find('.followed-list');
  var toggle = $(page).find('.followed-toggle');
  this._wikiGet('followed_markers').done(function(data) {
    list.empty();
    if(!data.success) {
      list.append($('<li class="wiki-empty"></li>').text(data.msg));
      return;
    }
    toggle.prop('checked', !data.paused).prop('disabled', false);
    $(page).toggleClass('followed-paused', data.paused);
    if(!data.markers.length) {
      list.append('<li class="wiki-empty">You aren\'t following any markers. Follow one from its Talk page.</li>');
    }
    data.markers.forEach(function(marker) {
      var row = $(
        '<li class="followed-marker">' +
          '<div class="wiki-revision followed-marker-open" role="button" tabindex="0">' +
            '<span class="wiki-revision-marker"></span>' +
            '<span class="wiki-revision-by"></span>' +
          '</div>' +
          '<button type="button" class="followed-marker-button" aria-pressed="true">Following</button>' +
        '</li>'
      );
      row.find('.wiki-revision-marker').text(marker.title || ('Marker #' + marker.markerId));
      row.find('.wiki-revision-by').text(
        [marker.gameName, marker.visible ? null : 'Deleted', 'Followed ' + _this._wikiAgo(marker.ago)].filter(Boolean).join(' · ')
      );
      row.find('.followed-marker-open').on('click', function() {
        if(marker.game && marker.game !== _this.mapOptions.shortName) {
          window.location.href = _this._wikiMarkerURL(marker.markerId, marker.game) + '&talk=1';
          return;
        }
        _this._openTalk('marker', marker.markerId, marker.title, reopen);
      });
      // Unfollowing keeps the row, so it can be undone.
      row.find('.followed-marker-button').on('click', function() {
        var button = $(this);
        var follow = button.attr('aria-pressed') !== 'true';
        button.prop('disabled', true);
        _this._wikiPost('talk_follow', { pageType: 'marker', pageId: marker.markerId, follow: follow ? '1' : '0' }).done(function(result) {
          button.prop('disabled', false);
          if(!result.success) { toastr.error(result.msg); return; }
          button.attr('aria-pressed', result.following ? 'true' : 'false').text(result.following ? 'Following' : 'Follow');
        }).fail(function(xhr) {
          button.prop('disabled', false);
          toastr.error(_this._wikiError(xhr));
        });
      });
      list.append(row);
    });
  }).fail(function(xhr) {
    list.empty().append($('<li class="wiki-empty"></li>').text(_this._wikiError(xhr)));
  });
  toggle.on('change', function() {
    var on = this.checked;
    $(page).toggleClass('followed-paused', !on);
    _this._wikiPost('notification_settings', { followsPaused: on ? '0' : '1' }).fail(function(xhr) {
      toggle.prop('checked', !on);
      $(page).toggleClass('followed-paused', on);
      toastr.error(_this._wikiError(xhr, 'That setting couldn\'t be saved.'));
    });
  });
};

// ?page=notifications and friends, e.g. from the link in emails.
ZMap.prototype._routeNotifications = function() {
  if(this._isWikiEditor()) this._openNotificationsPage();
  else this._createAccountForm(this.getUser());
};

ZMap.prototype._routeNotificationSettings = function() {
  var _this = this;
  if(this._isWikiEditor()) this._openNotificationSettings(function() { _this._openNotificationsPage(); });
  else this._createAccountForm(this.getUser());
};

ZMap.prototype._routeFollowedMarkers = function() {
  var _this = this;
  if(this._isWikiEditor()) this._openFollowedMarkers(function() {
    _this._openNotificationSettings(function() { _this._openNotificationsPage(); });
  });
  else this._createAccountForm(this.getUser());
};
