// Reporting problem edits (ajax/report_edit.php), and Admin > Reports, where
// admins undo the edit, warn its editor (three strikes), ban them, or
// dismiss the report (ajax/admin_reports.php, admin_report_action.php).

ZMap.prototype.REPORT_STRIKES = 3;

// A dialog asking what's wrong with an edit, then sending the report.
ZMap.prototype._reportEdit = function(revisionId, markerTitle) {
  var _this = this;
  if(!this.getUser()) { toastr.info('Sign in to report an edit.'); return; }
  if(document.getElementById('report-edit-dialog')) return;
  var dialog = document.createElement('dialog');
  dialog.id = 'report-edit-dialog';
  dialog.className = 'bookmark-registration-prompt report-edit-prompt';
  dialog.setAttribute('aria-labelledby', 'report-edit-title');
  dialog.innerHTML =
    '<h2 id="report-edit-title">Report This Edit</h2>' +
    '<p class="report-edit-target"></p>' +
    '<form method="dialog">' +
      '<textarea name="reason" rows="4" maxlength="1000" required ' +
        'placeholder="What\'s wrong with it? Vandalism, wrong information, spam…"></textarea>' +
      '<p class="report-edit-status" role="status" aria-live="polite"></p>' +
      '<div class="bookmark-registration-actions">' +
        '<button type="submit" class="infoWindowIcn form-action-button">Send Report</button>' +
        '<button type="button" class="infoWindowIcn" data-action="cancel">Cancel</button>' +
      '</div>' +
    '</form>';
  dialog.querySelector('.report-edit-target').textContent =
    'Revision ' + revisionId + (markerTitle ? ' of ' + markerTitle : '') + '. An admin will review it.';
  var close = function() { if(dialog.open) dialog.close(); dialog.remove(); };
  dialog.addEventListener('cancel', function(e) { e.preventDefault(); close(); });
  dialog.querySelector('[data-action="cancel"]').addEventListener('click', close);
  dialog.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault();
    var reason = dialog.querySelector('textarea').value.trim();
    var status = dialog.querySelector('.report-edit-status');
    if(!reason) { status.textContent = 'Say what\'s wrong with the edit.'; return; }
    dialog.querySelector('[type=submit]').disabled = true;
    _this._wikiPost('report_edit', { revisionId: revisionId, reason: reason }).done(function(data) {
      if(!data.success) {
        status.textContent = data.msg;
        dialog.querySelector('[type=submit]').disabled = false;
        return;
      }
      close();
      toastr.success(data.msg);
    }).fail(function(xhr) {
      status.textContent = _this._wikiError(xhr);
      dialog.querySelector('[type=submit]').disabled = false;
    });
  });
  document.body.appendChild(dialog);
  dialog.showModal();
  dialog.querySelector('textarea').focus();
};

// From a report notification: Admin, on its Reports tab.
ZMap.prototype._openAdminReports = function() {
  if(this._adminState) {
    this._adminState.tab = 'reports';
    this._createAdminPage({ restore: true });
  } else {
    this._createAdminPage();
    $('#admin_tab_reports').trigger('click');
  }
};

// Fills Admin > Reports (open, or resolved).
ZMap.prototype._loadAdminReports = function(status) {
  var _this = this;
  var panel = $('#admin_panel_reports');
  if(!panel.length) return;
  status = status || panel.attr('data-status') || 'open';
  panel.attr('data-status', status);
  if(!panel.children('.admin-reports-options').length) {
    panel.html(
      '<section class="admin-section">' +
        '<div class="admin-toggle admin-reports-options" role="group" aria-label="Reports">' +
          '<button type="button" data-report-status="open">Open</button>' +
          '<button type="button" data-report-status="resolved">Resolved</button>' +
        '</div>' +
        '<div class="admin-reports"></div>' +
      '</section>'
    );
    panel.on('click', '[data-report-status]', function() { _this._loadAdminReports(this.getAttribute('data-report-status')); });
  }
  panel.find('[data-report-status]').each(function() {
    this.setAttribute('aria-pressed', String(this.getAttribute('data-report-status') === status));
  });
  var list = panel.find('.admin-reports').html('<p class="admin-muted">Loading…</p>');
  this._wikiGet('admin_reports', { status: status }).done(function(data) {
    list.empty();
    if(!data.success) { list.append($('<p class="admin-muted"></p>').text(data.msg)); return; }
    _this._setAdminReportCount(data.openCount);
    if(!data.reports.length) {
      list.append('<div class="wiki-empty-state"><div class="wiki-empty-state-title">' +
        (status === 'open' ? 'No Open Reports' : 'No Resolved Reports') + '</div><p>' +
        (status === 'open' ? 'Reported edits will show up here.' : 'Reports you\'ve dealt with will show up here.') + '</p></div>');
      return;
    }
    data.reports.forEach(function(report) { list.append(_this._adminReportCard(report)); });
  }).fail(function(xhr) { list.empty().append($('<p class="admin-muted"></p>').text(_this._wikiError(xhr))); });
};

ZMap.prototype._setAdminReportCount = function(count) {
  var badge = $('#admin_tab_reports .admin-tab-count');
  badge.text(count || '').prop('hidden', !count);
};

ZMap.prototype._adminReportCard = function(report) {
  var _this = this, esc = this._wikiEscape.bind(this);
  var strikes = report.warnings || 0, max = this.REPORT_STRIKES;
  var open = report.status === 'open';
  var card = $('<article class="admin-report"></article>');
  card.html(
    '<div class="admin-report-top">' + this._wikiActionBadge(report.action) +
      '<span class="wiki-revision-time">' + esc(this._wikiAgo(report.ago)) + '</span></div>' +
    '<h4 class="admin-report-title"></h4>' +
    '<p class="admin-report-meta"></p>' +
    (report.summary ? '<p class="admin-report-summary"></p>' : '') +
    '<blockquote class="admin-report-reason"></blockquote>' +
    '<p class="admin-report-by"></p>' +
    (open ?
      '<div class="admin-report-actions">' +
        '<button type="button" class="infoWindowIcn" data-report-action="view"><i class="fas fa-eye" aria-hidden="true"></i>View Edit</button>' +
        '<button type="button" class="infoWindowIcn" data-report-action="undo"><i class="fas fa-undo" aria-hidden="true"></i>Undo Edit</button>' +
        '<button type="button" class="infoWindowIcn" data-report-action="warn"' + (strikes >= max ? ' disabled' : '') + '>' +
          '<i class="fas fa-exclamation-triangle" aria-hidden="true"></i>' +
          (strikes >= max ? 'Warned 3/3: Ban Instead' : 'Warn (' + strikes + '/' + max + ' strikes)') + '</button>' +
        '<button type="button" class="infoWindowIcn bad" data-report-action="ban"' + (report.editorBanned ? ' disabled' : '') + '>' +
          '<i class="fas fa-ban" aria-hidden="true"></i>' + (report.editorBanned ? 'Already Banned' : 'Ban User') + '</button>' +
        '<button type="button" class="infoWindowIcn" data-report-action="dismiss"><i class="fas fa-times" aria-hidden="true"></i>Dismiss</button>' +
      '</div>' +
      '<p class="admin-user-status" role="status" aria-live="polite"></p>'
    : '<p class="admin-report-resolution"></p>')
  );
  card.find('.admin-report-title').text((report.markerTitle || 'Marker #' + report.markerId) + (report.game ? ' · ' + report.game : ''));
  card.find('.admin-report-meta').html('Revision ' + Number(report.revisionId) + ' by ' +
    this._wikiUserLink(report.editorId, report.editor) + ' · ' + strikes + '/' + max + ' strikes' +
    (report.editorBanned ? ' · banned' : ''));
  card.find('.admin-report-summary').text('Summary: ' + (report.summary || ''));
  card.find('.admin-report-reason').text(report.reason);
  card.find('.admin-report-by').html('Reported by ' + this._wikiUserLink(report.reporterId, report.reporter));
  card.find('.admin-report-resolution').text(
    ({ undone: 'Edit undone', warned: 'Editor warned', dismissed: 'Dismissed', banned: 'Editor banned' })[report.resolution] +
    (report.resolvedBy ? ' by ' + report.resolvedBy : '') +
    (report.resolvedAgo !== null ? ' · ' + this._wikiAgo(report.resolvedAgo) : ''));
  this._wireWikiLinks(card[0], function() { _this._openAdminReports(); });
  var status = card.find('.admin-user-status');
  var act = function(action, extra) {
    card.find('[data-report-action]').prop('disabled', true);
    _this._wikiPost('admin_report_action', Object.assign({ id: report.id, action: action }, extra || {})).done(function(data) {
      if(!data.success) {
        status.addClass('error').text(data.msg);
        card.find('[data-report-action]').prop('disabled', false);
        return;
      }
      toastr.success(data.msg);
      _this._loadAdminReports();
    }).fail(function(xhr) {
      status.addClass('error').text(_this._wikiError(xhr));
      card.find('[data-report-action]').prop('disabled', false);
    });
  };
  card.on('click', '[data-report-action]', function() {
    var action = this.getAttribute('data-report-action');
    if(action === 'view') {
      var backToReports = function() { _this._openAdminReports(); };
      backToReports.label = 'Reports';
      _this._openMarkerRevision(report.revisionId, backToReports);
    } else if(action === 'undo') {
      if(confirm('Undo this edit? The marker goes back to how it was before it, saved as a new revision.')) act('undo');
    } else if(action === 'warn') {
      var note = prompt('Warn ' + report.editor + ' (strike ' + (strikes + 1) + ' of ' + max + '). A note for them, optional:', '');
      if(note !== null) act('warn', { note: note });
    } else if(action === 'ban') {
      var reason = prompt('Ban ' + report.editor + '? Give a reason (they won\'t be able to sign in or sign up again with this email):',
        'Problem edit (report #' + report.id + ')');
      if(!reason) return;
      card.find('[data-report-action]').prop('disabled', true);
      _this._wikiPost('admin_set_ban', { id: report.editorId, banned: 1, reason: reason }).done(function(data) {
        if(!data.success) {
          status.addClass('error').text(data.msg);
          card.find('[data-report-action]').prop('disabled', false);
          return;
        }
        act('banned');
      }).fail(function(xhr) {
        status.addClass('error').text(_this._wikiError(xhr));
        card.find('[data-report-action]').prop('disabled', false);
      });
    } else if(action === 'dismiss') {
      act('dismiss');
    }
  });
  return card;
};
