// Map Settings: Contributors and Admins rename a game's maps, and lay out and
// style its category list: add categories, drag categories and sections into
// order (saved as soon as they're dropped), rename sections, give a category
// its own shape, colours and icon, and hide or show it
// (ajax/map_settings*.php). Every change goes in the map's history, shown at
// the bottom of the page, and shows on the map straight away.
//
// The list here is the category list as the map shows it (getPOIMenuLayout,
// scripts/util/poiStyle.js), so its sections, order, names and badges match.

ZMap.prototype._canUseMapSettings = function() {
  var me = this.getUser();
  return !!me && me.level >= this.WIKI_EDITOR_LEVEL && !me.betaEditor;
};

ZMap.prototype.MAP_SETTINGS_SHAPES = [
  ['circle', 'Circle'], ['diamond', 'Diamond'], ['square', 'Square'], ['none', 'No Shape']
];

ZMap.prototype._openMapSettings = function(back) {
  var _this = this;
  back = back || function() { _this.mapControl.resetContent(); };
  var reopen = function() { _this._openMapSettings(back); };
  reopen.label = 'Map Settings';
  this._mapSettingsReopen = reopen;
  // Leaving with the list changed but not saved asks first.
  var leave = function() {
    if(!_this._confirmLeaveMapSettings()) return;
    back();
  };
  var page = this._showWikiPage(
    '<div id="map_settings" class="wiki-page">' +
      '<h3 class="text-center">Map Settings</h3>' +
      '<p class="wiki-subtitle">' + this._wikiEscape(this.mapOptions.name || this.mapOptions.shortName) + '</p>' +
      '<div class="map-settings-body"><p class="wiki-empty">Loading…</p></div>' +
    '</div>',
    'mapSettings',
    leave,
    reopen,
    { settles: true }
  );
  this._mapSettingsChanges = [];
  var scroll = this._mapSettingsScroll;
  this._mapSettingsScroll = null;
  this._wikiGet('map_settings', { game: this.mapOptions.shortName }).done(function(data) {
    var body = $(page).find('.map-settings-body').empty();
    if(!data.success) { body.append($('<p class="wiki-empty"></p>').text(data.msg)); return; }
    _this._mapSettingsData = data;
    _this._renderMapSettings(body, data, reopen);
    if(scroll) _this.mapControl._contents.scrollTop = scroll;
  }).fail(function(xhr) {
    $(page).find('.map-settings-body').empty().append($('<p class="wiki-empty"></p>').text(_this._wikiError(xhr)));
  });
};

// Map Settings' categories, shaped like the page's own (get_categories), so
// the list's functions lay them out and draw them the same way.
ZMap.prototype._mapSettingsRecords = function(data) {
  return data.categories.map(function(c) {
    var record = {
      id: c.id, parent_id: c.parentId, container_id: data.game.id, marker_category_type_id: c.typeId,
      name: c.name, description: c.description, seo_description: c.seo_description,
      defaultSeoDescription: c.defaultSeoDescription, img: c.img, color: c.color, glyph_color: c.glyphColor, shape: c.shape,
      custom_style: c.customStyle ? 1 : 0, visible: c.visible, menu_section: c.menuSection, menu_order: c.menuOrder
    };
    record.glyph = getPOIGlyph(record);
    return record;
  });
};

// A category's badge, drawn as the map draws it.
ZMap.prototype._mapSettingsBadge = function(record) {
  var style = getPOIStyle(record);
  var span = $('<span class="icon-background circle category-icon map-settings-badge"></span>')
    .addClass('icon-' + (record.glyph || getPOIGlyph(record)));
  if(style) {
    span.addClass('poi-badge poi-' + style);
    if(String(record.container_id) === '22') span.addClass('poi-eow');
  } else {
    span.css({ 'background-color': record.color, 'border-color': record.color });
  }
  var vars = getPOIStyleVars(record);
  if(vars) span[0].style.cssText += vars;
  return span;
};

// "#4395f7" from any CSS colour.
ZMap.prototype._mapSettingsHex = function(color, fallback) {
  color = String(color || '').trim();
  var m = /^#([0-9a-f])([0-9a-f])([0-9a-f])$/i.exec(color);
  if(m) return ('#' + m[1] + m[1] + m[2] + m[2] + m[3] + m[3]).toLowerCase();
  if(/^#[0-9a-f]{6}$/i.test(color)) return color.toLowerCase();
  m = /rgba?\(\s*(\d+)[\s,]+(\d+)[\s,]+(\d+)/i.exec(color);
  if(m) return '#' + [m[1], m[2], m[3]].map(function(n) { return ('0' + Number(n).toString(16)).slice(-2); }).join('');
  return fallback || '#ffffff';
};

// How a category looks now (its shape, colours and icon), read from its badge
// as drawn, built-in style or not: what the form starts from.
ZMap.prototype._mapSettingsLook = function(record) {
  var style = getPOIStyle(record);
  var shape = getPOIShape(record) ||
    ({ travel: 'diamond', location: 'square', cave: 'square', treasure: 'none' })[style] || 'circle';
  var probe = this._mapSettingsBadge(record).css({ position: 'absolute', left: '-9999px', top: 0 }).appendTo(document.body);
  var css = getComputedStyle(probe[0]);
  var fill = style ? css.getPropertyValue('--poi-fill') : css.backgroundColor;
  var outline = css.getPropertyValue('--poi-outline');
  var glyph = css.color;
  probe.remove();
  return {
    shape: shape,
    color: shape === 'none' ? this._mapSettingsHex(outline, '#2a2600') : this._mapSettingsHex(fill, '#ffad47'),
    glyphColor: this._mapSettingsHex(glyph),
    img: record.glyph || record.img
  };
};

ZMap.prototype._renderMapSettings = function(body, data, reopen) {
  var _this = this;
  var records = this._mapSettingsRecords(data);
  var layout = getPOIMenuLayout(records);
  body.off().empty();

  var maps = $('<section class="wiki-section"><h4>Maps</h4></section>');
  data.maps.forEach(function(map) {
    maps.append($('<button type="button" class="map-settings-row" data-settings-kind="map"></button>')
      .attr('data-settings-id', map.id)
      .append($('<span class="map-settings-name"></span>').text(map.name),
        '<i class="fas fa-chevron-right map-settings-chevron" aria-hidden="true"></i>'));
  });
  body.append(maps);

  var list = $('<section class="wiki-section map-settings-list">' +
    '<h4>Category List</h4>' +
    '<p class="map-settings-hint">Drag <i class="fas fa-bars" aria-hidden="true"></i> to reorder sections and categories. ' +
      'Press Save Changes when you\'re done.</p>' +
    // Like a marker's own buttons.
    '<div class="marker-actions-row map-settings-actions">' +
      '<button type="button" class="marker-action-button infoWindowIcn map-settings-add-section">' +
        '<span class="marker-action-icon"><i class="fas fa-folder" aria-hidden="true"></i></span>' +
        '<span class="marker-action-label">New Section</span></button>' +
      '<button type="button" class="marker-action-button infoWindowIcn map-settings-add">' +
        '<span class="marker-action-icon"><i class="fas fa-plus" aria-hidden="true"></i></span>' +
        '<span class="marker-action-label">New Category</span></button>' +
    '</div>' +
    '<div class="map-settings-layout"></div>' +
    // What's changed and not saved yet, and Save; it stays in view while
    // there's something to save.
    '<div class="map-settings-savebar">' +
      '<p class="map-settings-pending" role="status" aria-live="polite">No changes to save.</p>' +
      '<button type="button" class="infoWindowIcn form-action-button map-settings-save" disabled>Save Changes</button>' +
      '<button type="button" class="text-button map-settings-discard" hidden>Discard Changes</button>' +
    '</div>' +
  '</section>');
  var root = list.find('.map-settings-layout');
  layout.forEach(function(group) {
    var section = _this._mapSettingsSectionNode(group.title, group.categories.length);
    var children = section.children('.map-settings-children');
    group.categories.forEach(function(record) {
      var name = getPOIMenuName(record, records);
      var item = $('<div class="map-settings-item"></div>').attr('data-id', record.id).toggleClass('is-hidden', !record.visible);
      item.append(
        $('<button type="button" class="map-settings-handle"><i class="fas fa-bars" aria-hidden="true"></i></button>')
          .attr('aria-label', 'Move ' + name + ' (arrow keys)'),
        $('<button type="button" class="map-settings-row" data-settings-kind="category"></button>')
          .attr('data-settings-id', record.id)
          .append(_this._mapSettingsBadge(record), $('<span class="map-settings-name"></span>').text(name),
            record.visible ? '' : '<span class="map-settings-tag">Hidden</span>',
            '<i class="fas fa-chevron-right map-settings-chevron" aria-hidden="true"></i>')
      );
      children.append(item);
    });
    root.append(section);
  });
  root.children('.map-settings-group').each(function() { this.setAttribute('data-original', this.getAttribute('data-section')); });
  body.append(list);
  var savebar = list.find('.map-settings-savebar');
  var before = layout.map(function(g) { return { title: g.title, ids: g.categories.map(function(c) { return Number(c.id); }) }; });
  var names = {};
  records.forEach(function(r) { names[r.id] = getPOIMenuName(r, records); });
  // What the page shows that isn't saved, in words.
  var update = function() {
    var changes = _this._mapSettingsLayoutChanges(before, root, names);
    _this._mapSettingsChanges = changes;
    savebar.toggleClass('has-changes', !!changes.length);
    savebar.find('.map-settings-pending').text(changes.length
      ? 'Not saved: ' + changes.join(', ') + '.'
      : 'No changes to save.');
    savebar.find('.map-settings-save').prop('disabled', !changes.length)
      .text(changes.length > 1 ? 'Save ' + changes.length + ' Changes' : 'Save Changes');
    savebar.find('.map-settings-discard').prop('hidden', !changes.length);
    var pageNode = body.closest('#map_settings');
    if(changes.length) pageNode.attr('data-no-swipe-back', '');
    else pageNode.removeAttr('data-no-swipe-back');
  };
  body.on('click', '.map-settings-save', function() {
    var button = $(this).prop('disabled', true).text('Saving…');
    _this._saveMapSettingsLayout(root, data, _this._mapSettingsChanges, function(ok) {
      if(!ok) update();
    });
  });
  body.on('click', '.map-settings-discard', function() {
    _this._mapSettingsChanges = [];
    _this._renderMapSettings(body, data, reopen);
  });

  var history = $('<section class="wiki-section"><h4>History</h4><ul class="wiki-revisions map-settings-history"></ul></section>');
  this._renderMapSettingsHistory(history.find('ul'), data);
  body.append(history);

  // A map's or category's page, or the form for a new category.
  body.on('click', '.map-settings-row', function() {
    if(!_this._confirmLeaveMapSettings()) return;
    var kind = this.getAttribute('data-settings-kind'), id = Number(this.getAttribute('data-settings-id'));
    _this._mapSettingsScroll = _this.mapControl._contents.scrollTop;
    if(kind === 'map') {
      var map = data.maps.find(function(m) { return m.id === id; });
      if(map) _this._openMapSettingsMap(map, reopen);
    } else {
      var record = records.find(function(r) { return r.id === id; });
      if(record) _this._openMapSettingsCategory(record, records, layout, data, reopen);
    }
  });
  body.on('click', '.map-settings-add', function() {
    if(!_this._confirmLeaveMapSettings()) return;
    _this._mapSettingsScroll = _this.mapControl._contents.scrollTop;
    _this._openMapSettingsCategory(null, records, layout, data, reopen);
  });
  body.on('click', '.map-settings-section-rename', function() {
    _this._renameMapSettingsSection($(this).closest('.map-settings-group'), root, update);
  });
  // A new section starts empty at the top, named in place; it's kept once a
  // category is dragged into it.
  body.on('click', '.map-settings-add-section', function() {
    var section = _this._mapSettingsSectionNode('', 0);
    root.prepend(section);
    section[0].scrollIntoView({ block: 'nearest', behavior: 'smooth' });
    _this._renameMapSettingsSection(section, root, update, true);
  });
  this._mapSettingsSortable(root, update);
  update();
};

// Leaving Map Settings (or opening one of its pages, which reloads it) with
// changes to the list not saved: true once it's fine to go.
ZMap.prototype._confirmLeaveMapSettings = function() {
  var changes = this._mapSettingsChanges || [];
  if(!changes.length || !$(this.mapControl._contents).find('#map_settings').length) return true;
  if(window.confirm('Leave without saving your changes to the category list? (' + changes.join(', ') + ')')) {
    this._mapSettingsChanges = [];
    return true;
  }
  this.mapControl._navigatingBack = false;
  this.mapControl._navigatingForward = false;
  return false;
};

// The changes the page shows to the saved layout, in words for the history:
// sections added, renamed, removed and reordered, categories moved to
// another section or reordered in theirs.
ZMap.prototype._mapSettingsLayoutChanges = function(before, root, names) {
  var after = root.children('.map-settings-group').map(function() {
    return {
      title: this.getAttribute('data-section'), original: this.getAttribute('data-original') || null,
      ids: $(this).find('.map-settings-item').map(function() { return Number(this.getAttribute('data-id')); }).get()
    };
  }).get().filter(function(g) { return g.title && g.ids.length; });
  var changes = [];
  var was = {}, now = {};
  before.forEach(function(g) { g.ids.forEach(function(id) { was[id] = g.title; }); });
  after.forEach(function(g) { g.ids.forEach(function(id) { now[id] = g.original || ('new:' + g.title); }); });
  after.forEach(function(g) {
    if(!g.original) changes.push('added section ' + g.title);
    else if(g.original !== g.title) changes.push('renamed section ' + g.original + ' to ' + g.title);
  });
  var kept = after.filter(function(g) { return g.original; }).map(function(g) { return g.original; });
  before.forEach(function(g) { if(kept.indexOf(g.title) === -1) changes.push('removed section ' + g.title); });
  var oldOrder = before.map(function(g) { return g.title; }).filter(function(t) { return kept.indexOf(t) !== -1; });
  if(oldOrder.join('\n') !== kept.join('\n')) changes.push('reordered sections');
  after.forEach(function(g) {
    g.ids.forEach(function(id) {
      if(now[id] !== was[id]) changes.push('moved ' + (names[id] || 'a category') + ' to ' + g.title);
    });
    if(!g.original) return;
    var stayed = g.ids.filter(function(id) { return was[id] === g.original; });
    var old = (before.find(function(b) { return b.title === g.original; }) || { ids: [] }).ids
      .filter(function(id) { return stayed.indexOf(id) !== -1; });
    if(old.join(',') !== stayed.join(',')) changes.push('reordered ' + g.title);
  });
  return changes;
};

ZMap.prototype._renderMapSettingsHistory = function(list, data) {
  var _this = this;
  list.empty();
  if(!data.history.length) {
    list.append('<li class="wiki-empty-state"><div class="wiki-empty-state-title">No Changes Yet</div>' +
      '<p>Changes to this map\'s settings will show up here.</p></li>');
  }
  data.history.forEach(function(entry) {
    list.append($('<li class="map-settings-change"></li>').append(
      $('<div class="map-settings-change-top"></div>')
        .append($('<span class="map-settings-change-title"></span>').text(_this._mapSettingsChangeText(entry)))
        .append($('<span class="wiki-revision-time"></span>').text(_this._wikiAgo(entry.ago))),
      entry.summary ? $('<div class="map-settings-change-summary"></div>').text(entry.summary) : '',
      $('<div class="wiki-revision-by"></div>').html('by ' + _this._wikiUserLink(entry.userId, entry.username))
    ));
  });
};

// "Korok Seeds: renamed from “Koroks”, look changed", "Category list: moved
// Korok Seeds to Collectibles".
ZMap.prototype._mapSettingsChangeText = function(entry) {
  var d = entry.data || {}, before = d.before || {}, after = d.after || {};
  if(entry.kind === 'layout') return 'Category list: ' + ((d.changes && d.changes.length ? d.changes.join(', ') : d.change) || 'reordered');
  if(d.created) return (d.name || 'A category') + ': added' + (d.section ? ' to ' + d.section : '');
  var parts = [];
  if('name' in after) parts.push('renamed from “' + before.name + '”');
  if('parentId' in after) parts.push('moved to another section');
  if('visible' in after) parts.push(after.visible ? 'shown' : 'hidden');
  var look = ['shape', 'color', 'glyphColor', 'img'].filter(function(key) { return key in after; });
  if(look.length) parts.push(look.length === 1 && look[0] === 'img' ? 'icon changed' : 'look changed');
  return (d.name || (entry.kind === 'map' ? 'A map' : 'A category')) + ': ' + (parts.join(', ') || 'changed');
};

// The site's icon glyphs (from its stylesheets), for the icon picker.
ZMap.prototype._mapSettingsIcons = function() {
  if(this._mapSettingsIconNames) return this._mapSettingsIconNames;
  var names = {};
  var walk = function(rules) {
    [].forEach.call(rules || [], function(rule) {
      if(rule.cssRules) walk(rule.cssRules);
      var re = /\.icon-([A-Za-z]+_[A-Za-z0-9_-]+?)(?=::?before|[\s,.:>\[)]|$)/g, m;
      while(rule.selectorText && (m = re.exec(rule.selectorText))) names[m[1]] = true;
    });
  };
  [].forEach.call(document.styleSheets, function(sheet) {
    try { walk(sheet.cssRules); } catch(e) {}
  });
  // Only those that draw a glyph here (some are images that only show on
  // their own game's badges).
  var probe = $('<span class="category-icon" style="position:absolute;left:-9999px;top:0"></span>').appendTo(document.body)[0];
  var drawn = Object.keys(names).sort().filter(function(name) {
    probe.className = 'category-icon icon-' + name;
    var content = getComputedStyle(probe, '::before').content;
    return !!content && content !== 'none' && content !== 'normal' && content !== '""' && content !== "''";
  });
  probe.remove();
  return (this._mapSettingsIconNames = drawn);
};

//************************************************************************//
//  Reordering                                                            //
//************************************************************************//

// The layout as the page shows it: [{title, ids}].
ZMap.prototype._mapSettingsLayoutFromPage = function(root) {
  return root.find('.map-settings-group').map(function() {
    return { title: this.getAttribute('data-section'), ids: $(this).find('.map-settings-item').map(function() {
      return Number(this.getAttribute('data-id'));
    }).get() };
  }).get();
};

// Dragging a handle moves its category (into any section) or section; so do
// the arrow keys on a focused handle. onDrop(change) runs after each drop,
// with what moved in words (null if it went back where it was).
ZMap.prototype._mapSettingsSortable = function(root, onDrop) {
  var _this = this;
  var describe = function(item, fromSection, fromIndex) {
    if(item.classList.contains('map-settings-group')) {
      return $(item).index() === fromIndex ? null : 'moved section ' + item.getAttribute('data-section');
    }
    var name = $(item).find('.map-settings-name').text();
    var section = $(item).closest('.map-settings-group').attr('data-section');
    if(section !== fromSection) return 'moved ' + name + ' to ' + section;
    return $(item).index() === fromIndex ? null : 'moved ' + name + ' in ' + section;
  };
  var counts = function() {
    root.find('.map-settings-group').each(function() {
      $(this).find('.map-settings-section .map-settings-extra').text($(this).find('.map-settings-item').length);
    });
  };
  // Puts the item where the pointer is: categories among the categories of
  // the section under it, sections among the sections.
  var place = function(item, y) {
    if(item.classList.contains('map-settings-group')) {
      var groups = root.children('.map-settings-group').not(item).get();
      var before = groups.find(function(g) { var r = g.getBoundingClientRect(); return y < r.top + r.height / 2; });
      if(before) { if(item.nextElementSibling !== before) root[0].insertBefore(item, before); }
      else if(root[0].lastElementChild !== item) root[0].appendChild(item);
      return;
    }
    var nearest = null, distance = Infinity;
    root.children('.map-settings-group').each(function() {
      var r = this.getBoundingClientRect();
      var d = y < r.top ? r.top - y : (y > r.bottom ? y - r.bottom : 0);
      if(d < distance) { distance = d; nearest = this; }
    });
    if(!nearest) return;
    var list = $(nearest).children('.map-settings-children')[0];
    var items = $(list).children('.map-settings-item').not(item).get();
    var next = items.find(function(i) { var r = i.getBoundingClientRect(); return y < r.top + r.height / 2; });
    if(next) { if(item.nextElementSibling !== next) list.insertBefore(item, next); }
    else if(list.lastElementChild !== item) list.appendChild(item);
  };

  root.on('pointerdown', '.map-settings-handle', function(e) {
    if(e.button !== 0) return;
    e.preventDefault();
    e.stopPropagation();
    var handle = this;
    var item = $(handle).closest('.map-settings-item, .map-settings-group')[0];
    var fromSection = $(item).closest('.map-settings-group').attr('data-section');
    var fromIndex = $(item).index();
    var scroller = _this.mapControl._contents;
    var y = e.clientY, frame = null, pointer = e.pointerId;
    // Moving the item through the page drops any pointer capture, so the
    // drag is followed on the whole document.
    item.classList.add('is-dragging');
    root.addClass('is-sorting');
    // Near the top or bottom of the drawer, it scrolls.
    var tick = function() {
      var r = scroller.getBoundingClientRect(), edge = 56, speed = 0;
      if(y < r.top + edge) speed = -Math.ceil((r.top + edge - y) / 4);
      else if(y > r.bottom - edge) speed = Math.ceil((y - (r.bottom - edge)) / 4);
      if(speed) { scroller.scrollTop += speed; place(item, y); }
      frame = window.requestAnimationFrame(tick);
    };
    frame = window.requestAnimationFrame(tick);
    var move = function(ev) {
      if(ev.pointerId !== pointer) return;
      // Let go outside the window: the drag ends where it is.
      if(ev.pointerType === 'mouse' && ev.buttons === 0) { end(ev); return; }
      ev.preventDefault();
      y = ev.clientY;
      place(item, y);
      counts();
    };
    var end = function(ev) {
      if(ev && ev.pointerId !== undefined && ev.pointerId !== pointer) return;
      document.removeEventListener('pointermove', move);
      document.removeEventListener('pointerup', end);
      document.removeEventListener('pointercancel', end);
      window.removeEventListener('blur', end);
      window.cancelAnimationFrame(frame);
      item.classList.remove('is-dragging');
      root.removeClass('is-sorting');
      counts();
      var change = describe(item, fromSection, fromIndex);
      onDrop(change);
    };
    document.addEventListener('pointermove', move, { passive: false });
    document.addEventListener('pointerup', end);
    document.addEventListener('pointercancel', end);
    window.addEventListener('blur', end);
  });

  root.on('keydown', '.map-settings-handle', function(e) {
    if(e.key !== 'ArrowUp' && e.key !== 'ArrowDown') return;
    e.preventDefault();
    var item = $(this).closest('.map-settings-item, .map-settings-group')[0];
    var fromSection = $(item).closest('.map-settings-group').attr('data-section');
    var fromIndex = $(item).index();
    var up = e.key === 'ArrowUp';
    var sibling = up ? item.previousElementSibling : item.nextElementSibling;
    if(sibling) {
      if(up) sibling.parentNode.insertBefore(item, sibling);
      else sibling.parentNode.insertBefore(item, sibling.nextElementSibling);
    } else if(item.classList.contains('map-settings-item')) {
      // Past the end of its section, into the next one.
      var group = $(item).closest('.map-settings-group')[0];
      var other = up ? group.previousElementSibling : group.nextElementSibling;
      if(!other) return;
      var list = $(other).children('.map-settings-children')[0];
      if(up) list.appendChild(item); else list.insertBefore(item, list.firstElementChild);
    } else {
      return;
    }
    this.focus();
    counts();
    var change = describe(item, fromSection, fromIndex);
    onDrop(change);
  });
};

// Saves the layout as the page now shows it, with what changed for the
// history, and shows it on the map. done(saved) after.
ZMap.prototype._saveMapSettingsLayout = function(root, data, changes, done) {
  var _this = this;
  var layout = this._mapSettingsLayoutFromPage(root).filter(function(g) { return g.title && g.ids.length; });
  root.addClass('is-saving');
  this._wikiPost('map_settings_layout', { game: data.game.shortName, layout: JSON.stringify(layout), changes: JSON.stringify(changes) })
    .done(function(result) {
      root.removeClass('is-saving');
      if(!result.success) { toastr.error(result.msg); if(done) done(false); return; }
      _this._mapSettingsChanges = [];
      _this._applyMapSettingsLayout(layout);
      toastr.success('Category list saved');
      _this._refreshMapSettings();
      if(done) done(true);
    }).fail(function(xhr) {
      root.removeClass('is-saving');
      toastr.error(_this._wikiError(xhr));
      if(done) done(false);
    });
};

// Map Settings again, as it is now on the server, where it was scrolled to:
// historyOnly redraws just the history.
ZMap.prototype._refreshMapSettings = function(historyOnly) {
  var _this = this;
  var page = $(this.mapControl._contents).find('#map_settings');
  if(!page.length) return;
  this._wikiGet('map_settings', { game: this.mapOptions.shortName }).done(function(data) {
    if(!data.success) return;
    _this._mapSettingsData = data;
    var body = page.find('.map-settings-body');
    if(historyOnly) {
      _this._renderMapSettingsHistory(body.find('.map-settings-history'), data);
      return;
    }
    var scroll = _this.mapControl._contents.scrollTop;
    _this._renderMapSettings(body, data, _this._mapSettingsReopen);
    _this.mapControl._contents.scrollTop = scroll;
  });
};

// A section in the list: its handle, name, count and rename button, and the
// list its categories go in.
ZMap.prototype._mapSettingsSectionNode = function(title, count) {
  var section = $('<div class="map-settings-group"></div>').attr('data-section', title);
  $('<div class="map-settings-section"></div>').append(
    $('<button type="button" class="map-settings-handle"><i class="fas fa-bars" aria-hidden="true"></i></button>')
      .attr('aria-label', 'Move section ' + title + ' (arrow keys)'),
    $('<span class="map-settings-section-title"></span>').text(title),
    $('<span class="map-settings-extra"></span>').text(count),
    $('<button type="button" class="map-settings-section-rename"><i class="fas fa-pencil-alt" aria-hidden="true"></i></button>')
      .attr('aria-label', 'Rename section ' + title)
  ).appendTo(section);
  section.append('<div class="map-settings-children"></div>');
  return section;
};

// Renaming a section in place: its title becomes a text field. A new one
// (isNew) goes again if it isn't given a name.
ZMap.prototype._renameMapSettingsSection = function(group, root, changed, isNew) {
  var _this = this;
  var head = group.children('.map-settings-section');
  if(head.find('input').length) return;
  var title = head.find('.map-settings-section-title');
  var old = group.attr('data-section');
  var input = $('<input type="text" class="map-settings-section-input" maxlength="45" />').val(old)
    .attr({ 'aria-label': 'Section name', placeholder: isNew ? 'New section name' : '' });
  title.hide().after(input);
  input.trigger('focus').trigger('select');
  var done = false;
  var finish = function(save) {
    if(done) return;
    done = true;
    var name = $.trim(input.val());
    input.remove();
    title.show();
    var taken = name && root.find('.map-settings-group').not(group).filter(function() {
      return this.getAttribute('data-section') === name;
    }).length;
    if(taken) toastr.error('There\'s already a section called ' + name + '.');
    if(!save || !name || name === old || taken) {
      if(isNew) group.remove();
      return;
    }
    group.attr('data-section', name);
    title.text(name);
    group.find('.map-settings-handle').first().attr('aria-label', 'Move section ' + name + ' (arrow keys)');
    group.find('.map-settings-section-rename').attr('aria-label', 'Rename section ' + name);
    changed();
  };
  input.on('keydown', function(e) {
    if(e.key === 'Enter') { e.preventDefault(); finish(true); }
    else if(e.key === 'Escape') { e.preventDefault(); finish(false); }
  }).on('blur', function() { finish(true); });
};

//************************************************************************//
//  A map, a category                                                     //
//************************************************************************//

ZMap.prototype._mapSettingsField = function(label, icon, control) {
  return this._editorFieldHTML(icon, control, label);
};

ZMap.prototype._openMapSettingsMap = function(map, back) {
  var _this = this;
  var page = this._showWikiPage(
    '<div id="map_settings_item" class="wiki-page">' +
      '<h3 class="text-center">Edit Map</h3>' +
      '<p class="wiki-subtitle"></p>' +
      '<form class="map-settings-form">' +
        this._mapSettingsField('Name', 'fa-heading', '<input type="text" class="form-control" name="name" maxlength="45" required />') +
        this._mapSettingsField('Summary', 'fa-comment',
          '<input type="text" class="form-control" name="summary" maxlength="255" placeholder="What changed and why (optional)" />') +
        '<p class="admin-user-status" role="status" aria-live="polite"></p>' +
        '<button type="submit" class="infoWindowIcn form-action-button">Save</button>' +
      '</form>' +
    '</div>',
    'mapSettingsItem',
    back
  );
  $(page).find('.wiki-subtitle').text(map.name);
  var form = $(page).find('form');
  form.find('[name=name]').val(map.name);
  form.on('submit', function(e) {
    e.preventDefault();
    var status = form.find('.admin-user-status').removeClass('error').text('');
    form.find('[type=submit]').prop('disabled', true);
    _this._wikiPost('map_settings_save', { kind: 'map', id: map.id, name: form.find('[name=name]').val(),
      summary: form.find('[name=summary]').val() }).done(function(result) {
      form.find('[type=submit]').prop('disabled', false);
      if(!result.success) { status.addClass('error').text(result.msg); return; }
      toastr.success(result.changed.length ? 'Map renamed' : 'Nothing changed');
      _this.mapControl._navigatingBack = true;
      back();
    }).fail(function(xhr) {
      form.find('[type=submit]').prop('disabled', false);
      status.addClass('error').text(_this._wikiError(xhr));
    });
  });
};

// A category's page, or (record null) a new category's.
ZMap.prototype._openMapSettingsCategory = function(record, records, layout, data, back) {
  var _this = this, esc = this._wikiEscape.bind(this);
  var isNew = !record;
  var sectionOf = record && layout.find(function(g) { return g.categories.some(function(c) { return c.id === record.id; }); });
  var look = isNew
    ? { shape: 'circle', color: '#ffad47', glyphColor: '#ffffff', img: 'General_Marker' }
    : this._mapSettingsLook(record);
  if(isNew && this._mapSettingsIcons().indexOf(look.img) === -1) look.img = this._mapSettingsIcons()[0];
  var state = Object.assign({}, look);
  var shapes = this.MAP_SETTINGS_SHAPES.map(function(shape) {
    return '<button type="button" class="map-settings-shape" data-shape="' + shape[0] + '" aria-pressed="false">' +
      '<span class="map-settings-shape-badge"></span><span>' + shape[1] + '</span></button>';
  }).join('');
  var colour = function(name, label) {
    return '<div class="map-settings-color-field">' +
      '<label class="map-settings-label" for="map_settings_' + name + '">' + label + '</label>' +
      '<div class="map-settings-color">' +
        '<input type="color" name="' + name + 'Picker" aria-label="Pick the ' + label.toLowerCase() + '" />' +
        '<input type="text" class="map-settings-hex" id="map_settings_' + name + '" name="' + name + '" maxlength="7" ' +
          'spellcheck="false" autocomplete="off" pattern="#[0-9a-fA-F]{6}" />' +
      '</div>' +
    '</div>';
  };
  var page = this._showWikiPage(
    '<div id="map_settings_item" class="wiki-page">' +
      '<h3 class="text-center">' + (isNew ? 'New Category' : 'Edit Category') + '</h3>' +
      (isNew ? '' : '<p class="wiki-subtitle"></p>') +
      '<form class="map-settings-form">' +
        '<div class="map-settings-preview" aria-hidden="true"></div>' +
        this._mapSettingsField('Name', 'fa-heading', '<input type="text" class="form-control" name="name" maxlength="45" required />') +
        this._mapSettingsField('Section', 'fa-folder',
          '<select class="form-control" name="section">' + layout.map(function(g) {
            return '<option>' + esc(g.title) + '</option>';
          }).join('') + '<option value="">New section…</option></select>') +
        '<div class="map-settings-new-section" hidden>' +
          this._mapSettingsField('New Section', 'fa-folder',
            '<input type="text" class="form-control" name="newSection" maxlength="45" placeholder="Section name" />') +
        '</div>' +
        this._mapSettingsField('Page Description', 'fa-align-left', '<textarea class="form-control" name="description" maxlength="5000" rows="4"></textarea>') +
        this._mapSettingsField('SEO Description', 'fa-search', '<textarea class="form-control" name="seo_description" maxlength="5000" rows="3" placeholder="Leave blank for the standard category SEO description"></textarea>') +
        '<label class="map-settings-label">Shape</label>' +
        '<div class="map-settings-shapes" role="group" aria-label="Shape">' + shapes + '</div>' +
        '<div class="map-settings-colors">' + colour('color', 'Background Colour') + colour('glyphColor', 'Glyph Colour') + '</div>' +
        '<label class="map-settings-label">Icon</label>' +
        '<div class="form-group"><div class="input-group">' +
          '<span class="input-group-addon"><i class="fas fa-search" aria-hidden="true"></i></span>' +
          '<input type="search" class="form-control" name="iconSearch" placeholder="Search icons" />' +
        '</div></div>' +
        '<div class="map-settings-icons" role="listbox" aria-label="Icons"></div>' +
        '<label class="map-settings-check"><input type="checkbox" name="visible" />' +
          '<span><strong>Show this category</strong><small>Hidden categories and their markers aren\'t on the map.</small></span></label>' +
        (isNew ? '' : this._mapSettingsField('Summary', 'fa-comment',
          '<input type="text" class="form-control" name="summary" maxlength="255" placeholder="What changed and why (optional)" />')) +
        '<p class="admin-user-status" role="status" aria-live="polite"></p>' +
        '<button type="submit" class="infoWindowIcn form-action-button">' + (isNew ? 'Add Category' : 'Save') + '</button>' +
      '</form>' +
    '</div>',
    'mapSettingsItem',
    back
  );
  var form = $(page).find('form');
  var menuName = record ? getPOIMenuName(record, records) : '';
  $(page).find('.wiki-subtitle').text(menuName);
  form.find('[name=name]').val(record ? record.name : '');
  form.find('[name=description]').val(record ? record.description || '' : '');
  form.find('[name=seo_description]').val(record ? record.seo_description || '' : '');
  form.find('[name=seo_description]').attr('placeholder', record ? record.defaultSeoDescription : 'Generated from the category name, marker count, and maps after saving.');
  if(sectionOf) form.find('[name=section]').val(sectionOf.title);
  form.find('[name=visible]').prop('checked', isNew || !!record.visible);
  var styleTouched = isNew;
  var draft = function(over) {
    return Object.assign({}, record || { id: 0, container_id: data.game.id }, {
      custom_style: 1, shape: state.shape, color: state.color, glyph_color: state.glyphColor, img: state.img, glyph: state.img
    }, over || {});
  };
  var preview = function() {
    form.find('.map-settings-preview').empty().append(_this._mapSettingsBadge(draft()));
    form.find('.map-settings-shape').each(function() {
      var shape = this.getAttribute('data-shape');
      this.setAttribute('aria-pressed', String(shape === state.shape));
      var over = { shape: shape };
      // Each shape shown in the colours it would get.
      if((shape === 'none') !== (state.shape === 'none')) {
        over.color = shape === 'none' ? '#2a2600' : (look.shape !== 'none' ? look.color : '#ffad47');
        over.glyph_color = shape === 'none' ? '#ede954' : '#ffffff';
      }
      $(this).find('.map-settings-shape-badge').empty().append(_this._mapSettingsBadge(draft(over)));
    });
    // With no shape, the glyph has an outline in place of a background.
    form.find('label[for=map_settings_color]').text(state.shape === 'none' ? 'Outline Colour' : 'Background Colour');
    form.find('[name=colorPicker]').attr('aria-label', state.shape === 'none' ? 'Pick the outline colour' : 'Pick the background colour');
    form.find('.map-settings-icons [data-icon]').each(function() {
      var on = this.getAttribute('data-icon') === state.img;
      this.classList.toggle('is-selected', on);
      this.setAttribute('aria-selected', String(on));
    });
  };
  var showColours = function() {
    ['color', 'glyphColor'].forEach(function(key) {
      form.find('[name=' + key + ']').val(state[key]);
      form.find('[name=' + key + 'Picker]').val(state[key]);
    });
  };
  ['color', 'glyphColor'].forEach(function(key) {
    form.find('[name=' + key + ']').on('input', function() {
      if(!/^#[0-9a-f]{6}$/i.test(this.value)) return;
      state[key] = this.value.toLowerCase();
      form.find('[name=' + key + 'Picker]').val(state[key]);
      styleTouched = true;
      preview();
    });
    form.find('[name=' + key + 'Picker]').on('input', function() {
      state[key] = this.value.toLowerCase();
      form.find('[name=' + key + ']').val(state[key]);
      styleTouched = true;
      preview();
    });
  });
  showColours();
  form.on('click', '.map-settings-shape', function() {
    var shape = this.getAttribute('data-shape');
    if(shape === state.shape) return;
    // Into or out of no shape, the colour swaps between a background and an
    // outline: start from that kind's usual ones.
    if((shape === 'none') !== (state.shape === 'none')) {
      state.color = shape === 'none' ? '#2a2600' : (look.shape !== 'none' ? look.color : '#ffad47');
      state.glyphColor = shape === 'none' ? '#ede954' : '#ffffff';
      showColours();
    }
    state.shape = shape;
    styleTouched = true;
    preview();
  });
  form.find('[name=section]').on('change', function() {
    var adding = this.value === '';
    form.find('.map-settings-new-section').prop('hidden', !adding);
    if(adding) form.find('[name=newSection]').trigger('focus');
  });
  var grid = form.find('.map-settings-icons');
  var showIcons = function(query) {
    grid.empty();
    query = (query || '').toLowerCase();
    var names = _this._mapSettingsIcons().filter(function(name) { return !query || name.toLowerCase().indexOf(query) !== -1; });
    names.forEach(function(name) {
      grid.append($('<button type="button" role="option" class="map-settings-icon"></button>')
        .attr({ 'data-icon': name, title: name.replace(/_/g, ' '), 'aria-label': name.replace(/_/g, ' ') })
        .append($('<span class="category-icon"></span>').addClass('icon-' + name)));
    });
    if(!names.length) grid.append('<p class="map-settings-icons-empty">No icons match.</p>');
    preview();
  };
  form.find('[name=iconSearch]').on('input', function() { showIcons(this.value); });
  grid.on('click', '[data-icon]', function() { state.img = this.getAttribute('data-icon'); styleTouched = true; preview(); });
  showIcons('');
  // The current icon, in the middle of the grid.
  var selected = grid.find('.is-selected')[0];
  if(selected) {
    grid[0].scrollTop += selected.getBoundingClientRect().top - grid[0].getBoundingClientRect().top -
      (grid[0].clientHeight - selected.offsetHeight) / 2;
  }

  form.on('submit', function(e) {
    e.preventDefault();
    var status = form.find('.admin-user-status').removeClass('error').text('');
    var section = form.find('[name=section]').val() || $.trim(form.find('[name=newSection]').val());
    if(!section) { status.addClass('error').text('Name the new section.'); return; }
    var fields = { kind: 'category', id: record ? record.id : 0, game: data.game.shortName,
      name: form.find('[name=name]').val(), visible: form.find('[name=visible]').prop('checked') ? '1' : '0',
      description: form.find('[name=description]').val(),
      seo_description: form.find('[name=seo_description]').val(),
      summary: form.find('[name=summary]').val() || '' };
    if(styleTouched) Object.assign(fields, { style: '1', shape: state.shape, color: state.color, glyphColor: state.glyphColor, img: state.img });
    if(isNew) {
      fields.section = section;
      fields.layout = JSON.stringify(layout.map(function(g) { return { title: g.title, ids: g.categories.map(function(c) { return c.id; }) }; }));
    }
    form.find('[type=submit]').prop('disabled', true);
    _this._wikiPost('map_settings_save', fields).done(function(result) {
      if(!result.success) {
        form.find('[type=submit]').prop('disabled', false);
        status.addClass('error').text(result.msg);
        return;
      }
      var moved = !isNew && sectionOf && section !== sectionOf.title;
      var finish = function() {
        _this._applyMapSettingsCategory(result.category, isNew);
        // A new one joins the list as the server laid it out.
        if(isNew) {
          var placed = JSON.parse(fields.layout);
          var home = placed.find(function(g) { return g.title === section; });
          if(home) home.ids.push(result.id); else placed.push({ title: section, ids: [result.id] });
          _this._applyMapSettingsLayout(placed);
        }
        toastr.success(isNew ? 'Category added' : (result.changed.length || moved ? 'Category saved' : 'Nothing changed'));
        _this.mapControl._navigatingBack = true;
        back();
      };
      if(!moved) { finish(); return; }
      // Into another section: at its end.
      var next = layout.map(function(g) {
        return { title: g.title, ids: g.categories.map(function(c) { return c.id; }).filter(function(id) { return id !== record.id; }) };
      }).filter(function(g) { return g.ids.length; });
      var target = next.find(function(g) { return g.title === section; });
      if(target) target.ids.push(record.id); else next.push({ title: section, ids: [record.id] });
      _this._wikiPost('map_settings_layout', { game: data.game.shortName, layout: JSON.stringify(next),
        changes: JSON.stringify(['moved ' + menuName + ' to ' + section]) }).always(function() {
        _this._applyMapSettingsLayout(next);
        finish();
      });
    }).fail(function(xhr) {
      form.find('[type=submit]').prop('disabled', false);
      status.addClass('error').text(_this._wikiError(xhr));
    });
  });
};

//************************************************************************//
//  Showing changes on the map                                            //
//************************************************************************//

// A saved layout: each category's section and place, then the list redrawn.
ZMap.prototype._applyMapSettingsLayout = function(layout) {
  var _this = this, order = 0, placed = {};
  layout.forEach(function(group) {
    group.ids.forEach(function(id) {
      placed[id] = true;
      var category = _this.categories[id];
      if(!category) return;
      category.menu_section = group.title;
      category.menu_order = ++order;
    });
  });
  Object.keys(this.categories).forEach(function(id) {
    if(placed[id]) return;
    _this.categories[id].menu_section = null;
    _this.categories[id].menu_order = null;
  });
  this._rebuildCategoryMenu();
};

// A saved category (as get_categories gives it): the map's copy updated, or
// added, its markers redrawn (fetched, if it's just been shown), and the
// list redrawn.
ZMap.prototype._applyMapSettingsCategory = function(row, isNew) {
  var _this = this;
  if(!row) return;
  row.img = getPOIGlyph(row);
  var category = this.categories[row.id];
  var wasVisible = !!category && category.visible !== false && category.visible !== 0;
  if(!category) {
    if(!this.categories[row.parent_id]) return;
    this.addCategory(row);
    category = this.categories[row.id];
  } else {
    ['name', 'description', 'seo_description', 'img', 'color', 'glyph_color', 'shape', 'custom_style', 'menu_section', 'menu_order'].forEach(function(key) {
      category[key] = row[key];
    });
  }
  category.visible = !!row.visible;
  this.getMarkers().forEach(function(marker) {
    if(String(marker.categoryId) !== String(row.id) || marker.categoryTypeId == 3) return;
    marker._iconKey = null;
    if(marker._icon) marker.setIcon(_this._createMarkerIcon(row.id, marker.complete));
  });
  if(!category.visible && wasVisible) {
    category.checked = false;
    this.refreshMap([category]);
  } else if(category.visible && (!wasVisible || isNew)) {
    // Its markers weren't loaded while it was hidden.
    category.checked = true;
    $.getJSON('ajax.php?command=get_markers&game=' + this.mapOptions.id + '&categoryId=' + row.id, function(markersData) {
      var known = {};
      _this.getMarkers().forEach(function(marker) { known[marker.id] = true; });
      var fresh = (Array.isArray(markersData) ? markersData : []).filter(function(m) { return !known[m.id]; });
      if(fresh.length) _this.addMarkers(fresh);
      _this.refreshMap([category]);
      _this._rebuildCategoryMenu();
    });
  }
  this._rebuildCategoryMenu();
};

// The category list built again from the map's categories, as they are now.
ZMap.prototype._rebuildCategoryMenu = function() {
  var control = this.mapControl;
  var old = control && control._categoryMenu;
  if(!old) return;
  var menu = control.createCategoryMenu();
  $(old.domNode).replaceWith(menu.domNode);
  control._categoryMenu = menu;
  menu.categoryButtons.forEach(function(button) { if(button.updateCategoryLabel) button.updateCategoryLabel(); });
};
