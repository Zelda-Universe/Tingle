ZMap.prototype._createMarkerForm = function(vMarker, vLatLng, vPoly) {
  var _this = this;
  if (user == null) {
    toastr.error(_this.langMsgs.GENERAL_ERROR.format('You are not logged!'));
    return;
  }
  if(!window.tinymce) {
    var request=this._editorLoadRequest=(this._editorLoadRequest || 0)+1;
    var origin=this.mapControl.getContentType();
    this._loadRichTextEditor().done(function() {
      if(_this._editorLoadRequest===request && _this.mapControl.getContentType()===origin)
        _this._createMarkerForm(vMarker,vLatLng,vPoly);
    }).fail(function() {toastr.error('The text editor could not load. Check your connection and try again.');});
    return;
  }
  if (window.tinymce) tinymce.remove();

  var editing = vMarker != null;
  var isEditor = user.level >= 5;
  var esc = this._wikiEscape.bind(this);
  var field = this._editorFieldHTML.bind(this);
  var categoryOptions = this.categoriesArr.map(function(entry) {
    return '<option value="' + esc(entry.id) + '">' + esc(entry.name) + '</option>';
  }).join('');
  var coordinate = function(axis, id, name, required) {
    return '<div class="form-group"><div class="input-group">' +
      '<span class="input-group-addon marker-edit-axis" aria-hidden="true">' + axis + '</span>' +
      '<input type="number" step="any" inputmode="decimal" class="form-control" id="' + id + '" name="' + name + '"' +
        (required ? ' required' : ' placeholder="Optional"') + ' aria-label="' + axis + '" />' +
    '</div></div>';
  };
  // Some markers (from TotK's import) keep their in-game coordinates in a
  // hidden line of their content instead of a Z. The fields take its place.
  var coordMarkup = /<p\b(?=[^>]*\bname\s*=\s*(['"])coord\1)[^>]*>([\s\S]*?)<\/p>/i;
  var markupZ = null;
  (editing && vMarker.tabText || []).some(function(text) {
    var match = coordMarkup.exec(text || '');
    if (!match) return false;
    var parts = match[2].replace(/<[^>]*>/g, '').split('|');
    if (parts.length > 2 && parts[2].trim() !== '' && isFinite(Number(parts[2]))) markupZ = Number(parts[2]);
    return true;
  });
  var submapId = editing && vMarker.submapId != null ? vMarker.submapId : this.mapControl.getCurrentMap().subMapId;

  var html =
    '<div id="marker_edit" class="wiki-page">' +
      '<h3 class="text-center">' + (editing ? 'Edit Marker' : 'New Marker') + '</h3>' +
      '<form id="newMarkerForm" class="leaflet-control-layers-list marker-edit-form" autocomplete="off">' +
        '<label for="markerTitle">Title</label>' +
        field('fa-heading', '<input type="text" class="form-control" id="markerTitle" name="markerTitle" required maxlength="255" placeholder="What is it?" />') +
        // Where it is: X and Y place it on the map; Z (height) is optional.
        '<label for="markerX">Coordinates</label>' +
        '<div class="marker-edit-coords">' +
          coordinate('X', 'markerX', 'lng', true) +
          coordinate('Y', 'markerY', 'lat', true) +
          coordinate('Z', 'markerZ', 'z', false) +
        '</div>' +
        '<label for="categoryId">Category</label>' +
        field('fa-tag', '<select class="form-control" name="categoryId" id="categoryId">' + categoryOptions + '</select>') +
        '<label>Content</label>' +
        '<div class="divTabBody marker-edit-sections"></div>' +
        '<button id="add_field_button" type="button" class="marker-edit-add"><i class="fas fa-plus" aria-hidden="true"></i>Add Section</button>' +
        '<label for="markerDescription">Internal Notes</label>' +
        field('fa-sticky-note', '<textarea class="form-control" id="markerDescription" name="markerDescription" rows="2" placeholder="For editors. Not shown on the map."></textarea>') +
        '<div class="marker-edit-options">' +
          '<label class="admin-check"><input type="checkbox" id="isGlobal" name="isGlobal" />' +
            '<span>Show on every map of this game<small>For example, in both the Light World and Dark World.</small></span></label>' +
          (editing && user.level >= 10
            ? '<label class="admin-check"><input type="checkbox" id="isVisible" name="isVisible" />' +
              '<span>Visible<small>Hidden markers stay in History and can be shown again.</small></span></label>'
            : '') +
        '</div>' +
        (editing && isEditor
          ? '<label for="markerSummary">Edit Summary</label>' +
            field('fa-comment-alt', '<input type="text" class="form-control" id="markerSummary" name="summary" maxlength="255" placeholder="What did you change? (optional)" />')
          : '') +
        '<input type="hidden" name="game" value="' + esc(this.mapOptions.id) + '" />' +
        '<input type="hidden" name="userId" value="' + esc(user.id) + '" />' +
        (editing ? '<input type="hidden" name="markerId" value="' + esc(vMarker.id) + '" />' : '') +
        '<input type="hidden" name="submapId" value="' + esc(submapId) + '" />' +
        this._editorSaveHTML(editing, editing ? 'Save Changes' : 'Add Marker') +
        // Deleting it, under Save, as Delete Account is under its form, and
        // asked about first in a dialog. Not part of the editing beta
        // (scripts/zbeta.js).
        (editing && this._canEditMarker && this._canEditMarker(vMarker) && !user.betaEditor
          ? '<div class="marker-edit-delete">' +
              '<button type="button" class="text-button text-button-bad marker-delete-button">Delete Marker</button>' +
            '</div>'
          : '') +
      '</form>' +
    '</div>';

  // The pin follows the coordinate fields, and goes back if the edit isn't saved.
  var pin = editing ? vMarker : newMarker;
  var originalLatLng = pin && pin.getLatLng ? pin.getLatLng() : null;
  var restorePin = function() {
    if (pin && originalLatLng && pin.setLatLng) pin.setLatLng(originalLatLng);
  };
  var backToMarker = editing ? this._wikiBackToMarker(vMarker.id) : null;
  var formType = editing ? 'markerEdit-' + vMarker.id : 'newMarker';
  // Leaving the editor any other way puts the pin back too.
  this._pendingPinRestore = { type: formType, restore: restorePin };
  if (!this._pinRestoreWatched) {
    this._pinRestoreWatched = true;
    this.mapControl.addHandler('afterSetContent', function(vContent, vType) {
      var pending = _this._pendingPinRestore;
      if (!pending || vType === pending.type) return;
      _this._pendingPinRestore = null;
      pending.restore();
    });
  }
  this.mapControl._nextPageBack = editing ? function() { restorePin(); backToMarker(); } : null;
  this.mapControl._navigatingForward = true;
  this.mapControl.setContent(html, editing ? 'markerEdit-' + vMarker.id : 'newMarker');
  if (this.mapControl.viewStyleBottomSlide) this.mapControl.openDrawerLarge();

  var form = $('#newMarkerForm');
  form.find('#markerTitle').val(editing ? vMarker.title : '');
  // Clicked spots get two decimals; saved ones keep what they have.
  var initial = function(value) { return editing ? String(value) : String(Math.round(value * 100) / 100); };
  form.find('#markerX').val(initial(vLatLng.lng));
  form.find('#markerY').val(initial(vLatLng.lat));
  var initialZ = editing && vMarker.z != null && vMarker.z !== '' ? vMarker.z : markupZ;
  form.find('#markerZ').val(initialZ != null ? String(initialZ) : '');
  form.find('#markerX, #markerY').on('input', function() {
    var x = Number(form.find('#markerX').val());
    var y = Number(form.find('#markerY').val());
    if (!pin || !pin.setLatLng || form.find('#markerX').val() === '' || form.find('#markerY').val() === '' ||
        !isFinite(x) || !isFinite(y)) return;
    pin.setLatLng([y, x]);
  });
  if (editing) form.find('#categoryId').val(String(vMarker.categoryId));
  form.find('#markerDescription').val(editing ? (vMarker.description || '') : '');
  form.find('#isGlobal').prop('checked', editing && vMarker.globalMarker == 1);
  form.find('#isVisible').prop('checked', editing && vMarker.dbVisible == 1);

  var sections = form.find('.marker-edit-sections');
  // "Save Changes" flips on when an edit diverges from the marker it opened on,
  // so a no-op save can't log an empty revision. It's wired up after the fields
  // are filled; the rich-text editors reach it through the setup below.
  var updateMarkerDirty;
  // Typing fires keyup; paste, link/image-dialog inserts, and mobile soft
  // keyboards fire change per editing burst; nodeChange fires when the caret
  // moves. Any of them may have changed the document, and re-checking is
  // cheap, so all three are safe.
  var bindEditorDirty = function(editor) {
    editor._zmInit = false;
    var dialogViewport=null;
    var dialogDepth=0;
    // Use the public dialog configuration, rather than clicking rendered tabs.
    editor.on('init',function() {
      var openEditorDialog=editor.windowManager.open;
      editor.windowManager.open=function(config,params) {
      var selected=editor.selection.getNode();
      var editingMedia=selected && /^(IMG|VIDEO)$/.test(selected.nodeName);
      var tabs=config.body && config.body.type==='tabpanel' && config.body.tabs;
      if(!editingMedia && tabs && tabs.some(function(tab) {return tab.name==='upload';})) {
        config=Object.assign({},config,{body:Object.assign({},config.body,{tabs:tabs.filter(function(tab) {return tab.name==='upload';}).concat(tabs.filter(function(tab) {return tab.name!=='upload';}))})});
      }
        return openEditorDialog.call(editor.windowManager,config,params);
      };
    });
    var positionEditorDialogs=function() {
      var viewport=window.visualViewport;
      document.documentElement.style.setProperty('--editor-dialog-top',(viewport ? viewport.offsetTop : 0)+'px');
      document.documentElement.style.setProperty('--editor-dialog-height',(viewport ? viewport.height : window.innerHeight)+'px');
    };
    var stopDialogTracking=function() {
      if(window.visualViewport) {
        window.visualViewport.removeEventListener('resize',positionEditorDialogs);
        window.visualViewport.removeEventListener('scroll',positionEditorDialogs);
      }
      window.removeEventListener('resize',positionEditorDialogs);
    };
    // Alert/confirm dialogs do not emit OpenWindow in TinyMCE 5. Keep the
    // visible-viewport geometry current for those dialogs too.
    positionEditorDialogs();
    if(window.visualViewport) {
      window.visualViewport.addEventListener('resize',positionEditorDialogs);
      window.visualViewport.addEventListener('scroll',positionEditorDialogs);
    }
    window.addEventListener('resize',positionEditorDialogs);
    editor.on('OpenWindow',function() {
      var control=_this.mapControl;
      // Dialog fields and the iframe trade focus while Safari is still
      // animating its keyboard. Never take a new baseline mid-animation.
      if(control.viewStyleBottomSlide && dialogDepth===0) {
        dialogViewport=Object.assign({},control._keyboardDrawerViewport || {
          height:control._viewportHeight(),bottom:control._viewportBottom(),width:window.innerWidth
        });
      }
      dialogDepth++;
      positionEditorDialogs();
      if(window.visualViewport) {
        window.visualViewport.addEventListener('resize',positionEditorDialogs);
        window.visualViewport.addEventListener('scroll',positionEditorDialogs);
      }
      window.addEventListener('resize',positionEditorDialogs);
    });
    editor.on('CloseWindow',function() {
      dialogDepth=Math.max(0,dialogDepth-1);
      if(dialogDepth) return;
      if(dialogViewport && _this.mapControl.viewStyleBottomSlide) {
        _this.mapControl._keyboardDrawerViewport=Object.assign({},dialogViewport);
      }
      dialogViewport=null;
      if(_this.mapControl.viewStyleBottomSlide || window.matchMedia('(pointer: coarse)').matches) {
        // TinyMCE 5 calls editor.focus() synchronously after CloseWindow.
        // Return to a non-text control instead: no surprise keyboard on Cancel
        // or Save. The next intentional tap in the editor still focuses it.
        var focusEditor=editor.focus;
        editor.focus=function() {};
        Promise.resolve().then(function() {
          editor.focus=focusEditor;
          var toolbar=editor.getContainer().querySelector('.tox-toolbar button');
          if(toolbar) toolbar.focus({preventScroll:true});
        });
      }
      window.setTimeout(function() {window.dispatchEvent(new Event('resize'));},350);
    });
    editor.on('remove',stopDialogTracking);
    // Iframe focus does not bubble to the outer document. Capture the drawer
    // geometry before iOS opens its keyboard, just as for ordinary fields.
    editor.on('focus', function() {
      var control=_this.mapControl;
      if(control.viewStyleBottomSlide && !control._keyboardDrawerViewport) {
        control._keyboardDrawerViewport=dialogViewport ? Object.assign({},dialogViewport) : {height:control._viewportHeight(),bottom:control._viewportBottom(),width:window.innerWidth};
      }
    });
    editor.on('blur', function() {
      window.setTimeout(function() {window.dispatchEvent(new Event('resize'));},350);
    });
    editor.on('keyup change nodeChange', function() { if (updateMarkerDirty) updateMarkerDirty(); });
    // TinyMCE rewrites the loaded HTML once it finishes initializing (plain
    // text becomes <p>…), which a moment later would look like an edit. Re-take
    // the baseline at that point, but only while the button is still disabled,
    // so an edit the user makes first is never absorbed into it.
    editor.on('init', function() {
      editor._zmInit = true;
      if (!updateMarkerDirty || !markerSubmit || !markerSubmit.prop('disabled')) return;
      markerBaseline = markerSnapshot();
      updateMarkerDirty();
    });
  };
  var editorOptions = {
    skin: 'oxide-dark',
    content_css: 'dark',
    menubar: false,
    statusbar: false,
    branding: false,
    // An edit in the rich text should enable the save, whatever the field.
    setup: bindEditorDirty,
    plugins: 'lists link image media table code autoresize paste',
    // (Editors upload: Insert Photo and Insert Video put an upload straight
    // into the content, scripts/zvideo.js.)
    toolbar: 'bold italic | bullist numlist | link ' + (isEditor ? 'uploadphoto' : 'image') + ' media' + (isEditor ? ' uploadvideo' : '') + ' | table | removeformat code',
    // Uploaded clips (scripts/zvideo.js) keep what makes them play quietly.
    extended_valid_elements: 'video[src|muted|loop|playsinline|autoplay|controls|preload|poster|width|height|class]',
    toolbar_mode: 'wrap',
    min_height: 160,
    max_height: 520,
    autoresize_bottom_margin: 12,
    // Keep links and uploads as written: 'uploads/…', not '../uploads/…'.
    convert_urls: false,
    image_dimensions: false,
    // A marker's link pasted in comes in as its shortcode with its title
    // (zwiki.js _markerLinkShortcode).
    paste_preprocess: function(plugin, args) {
      var text = $('<div>').html(args.content).text();
      var code = _this._markerLinkShortcode(text);
      if (code) args.content = code;
    },
    content_style:
      '@font-face { font-family: BrandonText; src: url("styles/fonts/brandon/264CA8_2_0.woff") format("woff"); font-weight: 400; }' +
      'html, body { background: transparent; } body { margin: 12px 14px; color: #fff; font-family: BrandonText, sans-serif; font-size: 16px; line-height: 1.4; }' +
      'a { color: #8fd8ff; }' +
      'img { max-width: 100%; height: auto; border-radius: 8px; }' +
      // Uploading a dropped photo or video (scripts/zvideo.js _wireEditorDrops).
      'p.zm-uploading { padding: 10px 12px; border-radius: 8px; background: #2a2a2d; color: #bbb; font-size: 14px; }' +
      // Videos and tables as they'll show on the marker, with cell edges
      // visible while editing.
      'iframe, video { max-width: 100%; border: 0; border-radius: 8px; }' +
      'video { display: block; width: 100%; height: auto; aspect-ratio: 16 / 9; background: #000; }' +
      'table { width: 100%; border-collapse: collapse; }' +
      'th, td { padding: 4px 6px; border: 1px solid #4a4a4f; text-align: left; vertical-align: top; }' +
      'blockquote { margin: 0 0 12px; padding: 8px 12px; border-left: 3px solid #777; background: #2a2a2d; }'
  };
  if (isEditor) {
    // Upload Video: a clip like a Switch recording (scripts/zvideo.js).
    editorOptions.setup = function(editor) {
      bindEditorDirty(editor);
      // A video camera with an up arrow, unlike Media's embed icon.
      editor.ui.registry.addIcon('zm-upload-video',
        '<svg width="24" height="24" viewBox="0 0 24 24"><path fill-rule="evenodd" d="M4 6h10a2 2 0 0 1 2 2v1.5l4-2.5v10l-4-2.5V16a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2zm5 2.5L5.5 12H8v3h2v-3h2.5L9 8.5z"/></svg>');
      // Insert Photo: an upload goes straight in. On a photo already in the
      // content, TinyMCE's own dialog (its address and description).
      editor.ui.registry.addButton('uploadphoto', {
        icon: 'image', tooltip: 'Insert/edit image',
        onAction: function() {
          var node = editor.selection.getNode();
          if(node && node.nodeName === 'IMG') editor.execCommand('mceImage');
          else _this._uploadEditorPhoto(editor);
        }
      });
      // Photos and videos dropped into the text upload where they land.
      if(_this._wireEditorDrops) _this._wireEditorDrops(editor);
      editor.ui.registry.addButton('uploadvideo', {
        icon: 'zm-upload-video', tooltip: 'Insert/edit video',
        onAction: function() { _this._uploadEditorVideo(editor); }
      });
      // Over a selected image or video, a toolbar: Add Credit (Change
      // Credit once it has one: who made it and where it's from,
      // scripts/services/ImageCredits.js), then its settings: TinyMCE's
      // own dialog for an image (its address and description), Insert/Edit
      // Video's for a video. One toolbar for each pair, as TinyMCE's
      // buttons keep the words they're made with; none while it's still
      // being found out whether it has a credit (asked for once, then
      // shown).
      if(_this._editImageCredit) {
        var credit = function() { _this._editImageCredit(editor); };
        editor.ui.registry.addButton('addcredit', { text: 'Add Credit', tooltip: 'Say who made it', onAction: credit });
        editor.ui.registry.addButton('changecredit', { text: 'Change Credit', tooltip: 'Change who made it', onAction: credit });
        editor.ui.registry.addButton('imagesettings', {
          text: 'Image Settings', tooltip: 'Image address and description',
          onAction: function() { editor.execCommand('mceImage'); }
        });
        editor.ui.registry.addButton('videosettings', {
          text: 'Video Settings', tooltip: 'Video address',
          onAction: function() { _this._uploadEditorVideo(editor); }
        });
        var mediaToolbar = function(name, kind, credited, items) {
          editor.ui.registry.addContextToolbar(name, {
            predicate: function(node) {
              var media = _this._editorMedia(node);
              return !!media && media.kind === kind && _this._editorMediaCredited(editor, node) === credited;
            },
            items: items, position: 'node', scope: 'node'
          });
        };
        mediaToolbar('imagecredit', 'image', false, 'addcredit | imagesettings');
        mediaToolbar('imagecredited', 'image', true, 'changecredit | imagesettings');
        mediaToolbar('videocredit', 'video', false, 'addcredit | videosettings');
        mediaToolbar('videocredited', 'video', true, 'changecredit | videosettings');
        // (The credits of what's already in it, asked for up front.)
        editor.on('init', function() {
          var srcs = Array.from(editor.getBody().querySelectorAll('img, .mce-object-video')).map(function(el) {
            return el.getAttribute('data-mce-p-src') || el.getAttribute('src');
          });
          _this._fetchImageCredits(srcs, function() { if(!editor.removed) editor.nodeChanged(); });
        });
      }
    };
    editorOptions.automatic_uploads = true;
    editorOptions.images_file_types = 'jpeg,jpg,png,gif,webp';
    editorOptions.images_upload_handler = function(blobInfo, success, failure) {
      var upload = new FormData();
      upload.append('file', blobInfo.blob(), blobInfo.filename());
      $.ajax({
        type: 'POST', url: 'ajax.php?command=upload_marker_image', data: upload,
        processData: false, contentType: false, dataType: 'json'
      }).done(function(result) {
        if (result.success) success(result.location);
        else failure(result.msg || 'The image could not be uploaded.', { remove: true });
      }).fail(function(xhr) {
        failure(_this._wikiError(xhr, 'The image could not be uploaded.'), { remove: true });
      });
    };
  }
  var renumber = function() {
    var all = sections.children('.marker-edit-section');
    all.each(function(i) {
      $(this).find('.marker-edit-section-name').text(all.length > 1 ? 'Section ' + (i + 1) : 'Section');
      $(this).find('.marker-edit-section-remove').prop('hidden', all.length < 2);
    });
  };
  var sectionCount = 0;
  var addSection = function(content) {
    var id = 'tabText' + (sectionCount++);
    var section = $(
      '<div class="marker-edit-section">' +
        '<div class="marker-edit-section-head"><span class="marker-edit-section-name"></span>' +
          '<button type="button" class="marker-edit-section-remove" aria-label="Remove section"><i class="fas fa-times" aria-hidden="true"></i></button></div>' +
        '<textarea class="tabText" name="tabText[]" id="' + id + '"></textarea>' +
      '</div>'
    );
    section.find('textarea').val(content || '');
    sections.append(section);
    renumber();
    if (window.tinymce) tinymce.init(Object.assign({ target: section.find('textarea')[0] }, editorOptions));
    section.find('.marker-edit-section-remove').on('click', function() {
      var editor = window.tinymce && tinymce.get(id);
      var empty = !editor || !editor.getContent().trim();
      if (!empty && !window.confirm('Remove this section and its content?')) return;
      if (editor) editor.remove();
      section.remove();
      renumber();
      if (updateMarkerDirty) updateMarkerDirty();
    });
  };
  var tabs = editing && vMarker.tabText && vMarker.tabText.length ? vMarker.tabText : [''];
  tabs = tabs.map(function(text) {
    return (text || '').replace(new RegExp(coordMarkup.source, 'gi'), '');
  });
  tabs.forEach(addSection);
  $('#add_field_button').on('click', function(e) {
    e.preventDefault();
    addSection('');
    if (updateMarkerDirty) updateMarkerDirty();
  });

  // A new marker has nothing to compare to, so its "Add Marker" is always on.
  var markerSubmit = form.find('button[type="submit"]');
  if (editing) {
    var markerSnapshot = function() {
      return JSON.stringify({
        title: form.find('#markerTitle').val() || '',
        x: form.find('#markerX').val() || '',
        y: form.find('#markerY').val() || '',
        z: form.find('#markerZ').val() || '',
        category: form.find('#categoryId').val() || '',
        description: form.find('#markerDescription').val() || '',
        isGlobal: !!form.find('#isGlobal').prop('checked'),
        isVisible: !!form.find('#isVisible').prop('checked'),
        // Edit Summary is deliberately excluded: it describes the change, it
        // is not one, and typing in it must never enable the button.
        // The rich text lives in the editors, not the textareas, until saved.
        // An editor still mid-init reports an empty document, so a
        // created-but-uninitialized one is read from its textarea, which
        // holds the original content until the editor takes over.
        sections: sections.find('textarea.tabText').map(function() {
          var editor = window.tinymce ? tinymce.get(this.id) : null;
          return editor && editor._zmInit ? editor.getContent() : (this.value || '');
        }).get()
      });
    };
    var markerBaseline = markerSnapshot();
    updateMarkerDirty = function() {
      var dirty = markerSnapshot() !== markerBaseline;
      _this._editorSaveState(form, dirty, !_this._editorNameError(form.find('#markerTitle').val(), 255, true), false);
    };
    form.on('input change', updateMarkerDirty);
    updateMarkerDirty();
  }

  var status = form.find('.admin-user-status');
  // Delete Marker: asked about first in a dialog (zbeta.js _showAlert, as
  // Leave the Beta is), then gone.
  form.find('.marker-delete-button').on('click', function() {
    // The official paths it's a step of leave it too (lib/common/paths.php
    // pathRemoveDeletedMarker); users' own paths keep it.
    var officialPaths = (_this.paths || []).filter(function(p) {
      return p.scope === 'official' && !p._preview && p.steps.some(function(s) { return s.markerId == vMarker.id; });
    }).map(function(p) { return '“' + _this._wikiEscape(p.name) + '”'; });
    _this._showAlert({
      id: 'marker-delete',
      title: 'Delete this marker?',
      description: [
        // (Set as HTML by _showAlert: the names escaped.)
        (vMarker.title || vMarker.name ? '“' + _this._wikiEscape(vMarker.title || vMarker.name) + '” will be removed from the map.' : 'It will be removed from the map.')
      ].concat(officialPaths.length ? ['It will also be removed from the ' + (officialPaths.length === 1 ? 'path ' + officialPaths[0] :
        'paths ' + officialPaths.slice(0, -1).join(', ') + ' and ' + officialPaths[officialPaths.length - 1]) + '.'] : []).concat([
        'It can be brought back from its History.'
      ]),
      actions: [
        { label: 'Delete Marker', className: 'infoWindowIcn bad', onSelect: function() { _this.deleteMarker(vMarker.id); } },
        { label: 'Cancel', cancel: true }
      ]
    });
  });
  form.on('submit', function(e) {
    e.preventDefault();
    if (window.tinymce) tinymce.triggerSave();
    var submit = form.find('button[type="submit"]').prop('disabled', true);
    // The button itself is the saving indicator: its label swaps while the
    // request is in flight and comes back when it settles.
    var submitLabel = submit.text();
    submit.text('Saving...');
    status.removeClass('error success').text('');
    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=add_marker',
      data: form.serialize(),
      dataType: 'json'
    }).done(function(data) {
      submit.text(submitLabel);
      if (editing) updateMarkerDirty();
      else submit.prop('disabled', false);
      if (!data.success) {
        status.addClass('error').text(data.msg || 'The marker could not be saved.');
        return;
      }
      if (window.tinymce) tinymce.remove();
      if (editing) {
        // The save succeeded, so the form now matches the marker: make that
        // the new baseline and dim the button again until the next real
        // edit. (After remove() the sections are read from the textareas
        // that triggerSave() just synced.)
        markerBaseline = markerSnapshot();
        updateMarkerDirty();
      }
      _this._pendingPinRestore = null;
      if (user.level < 5) {
        _this.mapControl.resetContent();
        toastr.success(_this.langMsgs.MARKER_ADD_SUCCESS_RESTRICTED);
        return;
      }
      var saved = jQuery.parseJSON(data.marker)[0];
      if (data.action != "ADD") {
        for (var i = 0; i < markers.length; i++) {
          if (markers[i].id == saved.id) {
            _this.map.removeLayer(markers[i]);
            markers[i].id = -1;
            markers[i].visible = 0;
            markers[i].categoryId = -1;
          }
        }
        delete _this.cachedMarkersById[saved.id];
      }
      _this.addMarker(saved);
      _this.map.addLayer(markers[markers.length - 1]);
      // The saved marker is a new object at the end of the list: the pin on
      // it, and the paths it's a step of, follow it there. (The pin still
      // pointed at the old one, now gone, so the next move of the map took
      // it for a hidden marker and closed its page: the map's moveend
      // handler, addMapControl.)
      if (newMarker && newMarker.markerId == saved.id) newMarker.markerPos = markers.length - 1;
      if (_this._preparePaths && _this.paths) { _this._preparePaths(); _this.drawPaths(); }
      _this.mapControl._navigatingBack = editing;
      _this._createMarkerPopup(markers[markers.length - 1]);
      if (editing) toastr.success('Saved your changes to marker ' + saved.id + '.');
      else toastr.success(_this.langMsgs.MARKER_ADD_SUCCESS.format(saved.id));
    }).fail(function(xhr) {
      submit.text(submitLabel);
      if (editing) updateMarkerDirty();
      else submit.prop('disabled', false);
      status.addClass('error').text(_this._wikiError(xhr, 'The marker could not be saved. Check your connection.'));
    });
  });
};
