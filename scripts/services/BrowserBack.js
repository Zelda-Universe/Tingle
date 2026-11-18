// The browser's Back (and Android's back gesture, and the iPhone's swipe from
// the screen's edge) for the sidebar's pages: it undoes opening the page, as
// the page's own Back button does, or its close button if it has only that.
//
// While the page showing has either, there's a history entry for it above the
// one the site was on (history.state.zmSidebarBack). Browser Back leaves that
// entry and presses the button; if the page gone back to has one too, the
// entry's put back. A page without one (the category list) has none, so Back
// from there does what it always did: the game before (GameSwitch.js), or the
// page before the site. The page's own buttons, or a swipe back, keep it in
// step.
//
// A marker or area opened from the map over another has only a close button,
// which closes it; Back reopens the one before it instead (the trail).
//
// Before the page, in turn: an open dialog is closed; a phone's drawer pulled
// down is brought back up; an editor with changes asks before they're lost.
// Asked and kept (here, or by the page's own "leave without saving?"), the
// page keeps its entry.
//
// Experimental: on for everyone when an admin turns it on for the site (the
// admin panel's Settings: window.zmapSiteSettings.browserBack); otherwise
// only for staff who've turned it on in their own browser (Settings), as
// with switching games (GameSwitch.js). Off, Back does what it always did.
//
// Not Forward: a page gone back from can't be rebuilt with its way back (each
// page's Back button is made by the page that opened it), so there's never a
// Forward to one.
(function() {
  var KEY = 'zmSidebarBack';
  // History moves of our own (history.back()), whose popstates aren't Back
  // presses; and what to do once the last of them lands.
  var ignoring = 0, afterIgnored = [], leaving = null;
  // Ours, landed after we'd stopped waiting (a slow phone): not a Back.
  var late = 0, lateLeaving = null;
  var onEntry = false;
  var syncTimer = null;

  function state() { return window.history.state || {}; }
  function current() {
    return typeof zMap !== 'undefined' && zMap && zMap.mapControl && zMap.mapControl._contents ? zMap : null;
  }
  // (Not in an embed: its history is the page it's in.)
  function enabled(map) {
    return !!(map && map._browserBackOn() && !(map.isFramed && map.isFramed()) && window.history && history.pushState);
  }
  // Its Back button, or its close button if it has only that.
  function backButton(map) {
    var contents = map.mapControl._contents;
    return contents.querySelector(':scope > a.back-button:not(.close-button)') ||
      contents.querySelector(':scope > a.back-button.close-button');
  }
  function pageType(map) { return map.mapControl._contentType; }
  // A dialog open over the page (the site's are all <dialog>s).
  function openDialog() { return document.querySelector && document.querySelector('dialog[open]'); }
  // A phone's drawer pulled down over a page still open in it.
  function drawerDown(map) { return !!(map.mapControl.viewStyleBottomSlide && !map.mapControl._open); }

  // An editor's fields as they were once it was shown, to tell whether
  // they've been changed since (rich text: TinyMCE's own isDirty).
  var editBaseline = null;
  function editState(map) {
    var fields = map.mapControl._contents.querySelectorAll('input, select, textarea');
    var values = Array.prototype.map.call(fields, function(field) {
      if(field.type === 'checkbox' || field.type === 'radio') return field.checked ? '1' : '0';
      if(field.type === 'file') return field.files ? String(field.files.length) : '0';
      return field.value;
    });
    // A path's points, placed on the map.
    try { values.push(map._pathEditing ? JSON.stringify(map._pathEditing.draft) : ''); } catch(e) {}
    return values.join('\u0001');
  }
  function editing(map) { return !!(map._editingSomething && map._editingSomething()); }
  function noteEditor(map) {
    if(!editing(map)) { editBaseline = null; return; }
    if(!editBaseline || editBaseline.type !== pageType(map)) editBaseline = { type: pageType(map), state: editState(map) };
  }
  function unsaved(map) {
    // (Game Settings asks for itself.)
    if(!editing(map) || /^mapSettings/.test(pageType(map) || '')) return false;
    var editors = window.tinymce && tinymce.editors || [];
    for(var i = 0; i < editors.length; i++) { try { if(editors[i].isDirty()) return true; } catch(e) {} }
    return !!(editBaseline && editBaseline.type === pageType(map) && editBaseline.state !== editState(map));
  }
  // Presses a button, noting whether it asked to leave and was told no.
  function pressKept(press) {
    var confirm = window.confirm, kept = false;
    window.confirm = function() { var yes = confirm.apply(window, arguments); if(!yes) kept = true; return yes; };
    try { press(); } finally { window.confirm = confirm; }
    return kept;
  }
  // A page whose button, pressed by Back, left it showing (a phone's login
  // closes the drawer, not the page): no entry for it again till another
  // page shows, so Back can still leave the site.
  var pressedOn = null;

  // Markers and areas opened from the map, one over another: those before
  // the one showing, to reopen, newest last. Emptied at the category list,
  // and for another game.
  var trail = [], trailMap = null, showing = null, reopening = null;
  function closeOnly(map) {
    var contents = map.mapControl._contents;
    return !contents.querySelector(':scope > a.back-button:not(.close-button)') &&
      !!contents.querySelector(':scope > a.back-button.close-button');
  }
  // The page showing, if it's a marker or area, and how to open it again.
  function mapPage(map) {
    var type = pageType(map) || '';
    var marker = /^m(\d+)$/.exec(type);
    if(marker) return { type: type, reopen: function() {
      map.goTo({ marker: marker[1], centerInVisibleArea: true, animate: 'move' });
    } };
    if(/^area-/.test(type) && map.selectedArea) {
      var area = map.selectedArea, bounds = map.selectedAreaBounds;
      return { type: type, reopen: function() {
        map._showAreaPage(area, bounds);
        if(map.mapControl.viewStyleBottomSlide) map.mapControl.openDrawerDefaultPartial();
      } };
    }
    return null;
  }
  function pageShown(map) {
    if(trailMap !== map) { trail = []; trailMap = map; showing = null; }
    var page = mapPage(map);
    if(reopening && page && page.type === reopening) reopening = null;
    else if(page && showing && showing.type !== page.type && closeOnly(map)) trail = trail.concat([showing]).slice(-20);
    if(!backButton(map)) trail = [];
    showing = page;
  }

  // An entry left from before a reload, or from another site gone back from:
  // still ours. Kept if the page that opens has a Back button, and left if
  // not, so there's no step left over that Back does nothing on.
  if(window.history && state()[KEY]) onEntry = true;

  function back(then) {
    // The address and title the page has now, which the entry below it,
    // from when the entry was added, doesn't.
    leaving = { url: window.location.href, title: document.title };
    ignoring++;
    if(then) afterIgnored.push(then);
    history.back();
    // (Should the browser not move, carry on anyway.)
    var waited = ignoring;
    window.setTimeout(function() {
      if(ignoring !== waited || ignoring <= 0) return;
      // Not moved yet: its popstate's still to come, and isn't a Back.
      if(state()[KEY]) { late++; lateLeaving = leaving; }
      ignoring = 0;
      landed();
    }, 400);
  }
  function landed() {
    if(leaving) {
      try { history.replaceState(state(), '', leaving.url); } catch(e) {}
      document.title = leaving.title;
      leaving = null;
    }
    var waiting = afterIgnored;
    afterIgnored = [];
    waiting.forEach(function(fn) { try { fn(); } catch(e) { window.setTimeout(function() { throw e; }); } });
    // (Leaving for another game: not put back. The next page shown, if
    // any, says whether there should be one.)
    if(!waiting.length) schedule();
  }

  // The entry, in step with the page showing.
  function sync() {
    syncTimer = null;
    var map = current();
    if(!enabled(map)) return;
    // (Not while history's moving, or a game's being switched to.)
    if(ignoring || map._switchingGame) { schedule(); return; }
    if(pressedOn !== null && pageType(map) !== pressedOn) pressedOn = null;
    noteEditor(map);
    var hasBack = (!!backButton(map) && pageType(map) !== pressedOn) || !!openDialog();
    if(hasBack && !onEntry) {
      var entry = Object.assign({}, state());
      entry[KEY] = true;
      history.pushState(entry, '', window.location.href);
      onEntry = true;
    } else if(!hasBack && onEntry) {
      // (Off it now, so a slow move isn't asked for twice.)
      onEntry = false;
      back();
    }
  }
  function schedule() {
    window.clearTimeout(syncTimer);
    syncTimer = window.setTimeout(sync, 50);
  }

  window.addEventListener('popstate', function() {
    var left = onEntry;
    onEntry = !!state()[KEY];
    if(ignoring) {
      ignoring--;
      if(!ignoring) landed();
      return;
    }
    if(late && !onEntry) {
      late--;
      if(lateLeaving) { try { history.replaceState(state(), '', lateLeaving.url); } catch(e) {} document.title = lateLeaving.title; lateLeaving = null; }
      schedule();
      return;
    }
    var map = current();
    if(!enabled(map)) return;
    // Back, off the page's entry: its Back button, as if pressed.
    if(left && !onEntry && !map._switchingGame) {
      var button = backButton(map);
      var before = trailMap === map && closeOnly(map) && trail[trail.length - 1];
      var dialog = openDialog();
      if(dialog) {
        // As Escape does: its cancel, then closed (unless that's refused).
        var cancel;
        try { cancel = new Event('cancel', { cancelable: true }); } catch(e) { cancel = null; }
        if(!cancel || dialog.dispatchEvent(cancel)) dialog.close();
      } else if(button && drawerDown(map)) {
        map.mapControl.openDrawerDefaultPartial();
      } else if(button && unsaved(map) && !window.confirm('Leave without saving your changes?')) {
        // Kept: its entry's put back.
      } else if(before) {
        // The marker or area before this one, opened again.
        trail = trail.slice(0, -1);
        pressedOn = pageType(map);
        reopening = before.type;
        before.reopen();
      } else if(button) {
        pressedOn = pageType(map);
        if(pressKept(function() { button.click(); })) pressedOn = null;
      }
    }
    schedule();
  });

  // The switches.
  ZMap.prototype.BROWSER_BACK_KEY = 'zeldamapsBrowserBack';
  // Admins and up (Moderator 10, Admin 15, Super Admin 20).
  ZMap.prototype.BROWSER_BACK_LEVEL = 15;
  ZMap.prototype._browserBackAllowed = function() {
    var user = this.getUser && this.getUser();
    return !!user && Number(user.level) >= this.BROWSER_BACK_LEVEL;
  };
  ZMap.prototype._browserBackForEveryone = function() {
    return !!(window.zmapSiteSettings && window.zmapSiteSettings.browserBack);
  };
  ZMap.prototype._browserBackOn = function() {
    if(this._browserBackForEveryone()) return true;
    try { return this._browserBackAllowed() && localStorage.getItem(this.BROWSER_BACK_KEY) === 'on'; } catch(e) { return false; }
  };
  // Turned on or off in this browser: the entry follows at once.
  ZMap.prototype._setBrowserBack = function(on) {
    try {
      if(on) localStorage.setItem(this.BROWSER_BACK_KEY, 'on');
      else localStorage.removeItem(this.BROWSER_BACK_KEY);
    } catch(e) {}
    window.clearTimeout(syncTimer);
    trail = []; showing = null; pressedOn = null;
    if(on) { pageShown(this); schedule(); }
    else if(onEntry && !ignoring) { onEntry = false; back(); }
  };
  // The switch in Settings, for those allowed it (setUser adds it once the
  // account's known). Off by default; on just for this browser.
  ZMap.prototype._addBrowserBackSetting = function() {
    var settings = this.settingsControl;
    // (On for everyone: nothing for one browser to turn on.)
    if(!settings || !settings.addCheckbox || this._browserBackCheckbox || !this._browserBackAllowed() || this._browserBackForEveryone()) return;
    var zmap = this;
    this._browserBackCheckbox = settings.addCheckbox('Experimental back button support (staff test)', this._browserBackOn(), function(checked) {
      zmap._setBrowserBack(checked);
      toastr.info(checked ? 'The browser\'s Back now goes back through the sidebar, in this browser.' : 'The browser\'s Back leaves the page, as normal.');
    });
    // (Known to be staff only now: in step with the page showing.)
    if(this._browserBackOn()) { pageShown(this); schedule(); }
  };

  // A dialog opened or closed: an entry for it, or not.
  function dialogChanged() { var map = current(); if(enabled(map)) schedule(); }
  // (Closed and removed at once, as the site's alerts are, its close event
  // never reaches the page: close() itself, too.)
  if(window.HTMLDialogElement && HTMLDialogElement.prototype.showModal) {
    ['showModal', 'close'].forEach(function(name) {
      var original = HTMLDialogElement.prototype[name];
      HTMLDialogElement.prototype[name] = function() {
        var result = original.apply(this, arguments);
        dialogChanged();
        return result;
      };
    });
  }
  if(document.addEventListener) document.addEventListener('close', function(e) {
    if(e.target && e.target.tagName === 'DIALOG') dialogChanged();
  }, true);

  // The page showing changed (ZLayers.js _setContent).
  ZMap.prototype._syncBrowserBack = function() {
    if(!enabled(this)) return;
    editBaseline = editBaseline && editBaseline.type === pageType(this) ? editBaseline : null;
    pageShown(this);
    schedule();
  };

  // Leaving for another game (or the same game's page afresh): off the
  // page's entry first, so the history between games is as it always was.
  ZMap.prototype._leavingSidebarHistory = function(then) {
    if(!onEntry || !enabled(this)) { then(); return; }
    window.clearTimeout(syncTimer);
    onEntry = false;
    back(then);
  };
})();
