// Videos in marker content: uploading clips from the editor (Upload Video;
// ajax/upload_marker_video.php), and playing them muted and looping, only
// while they're on screen. On a phone that means once the drawer is pulled
// up and the video scrolled into view; they pause again when out of view.

// Insert/Edit Video and Upload Photo: dialogs like TinyMCE's Insert/Edit
// Image (its windowManager). General takes an address; Upload takes a file,
// dropped or browsed for, sends it, and puts it in the content at once,
// closing the dialog: nothing more to press. Opened on a video in the
// content, Insert/Edit Video replaces that one's. (TinyMCE's own drop area
// only takes images and stops at General, so Upload has one of ours, drawn
// the same.)
ZMap.prototype.VIDEO_TYPES = ['video/mp4', 'video/quicktime', 'video/webm'];
ZMap.prototype.PHOTO_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];

ZMap.prototype._uploadEditorVideo = function(editor) {
  var selected = editor.selection.getNode();
  var current = selected && selected.nodeName === 'VIDEO' ? selected : null;
  var _this = this;
  return this._editorMediaDialog(editor, {
    title: current ? 'Edit Video' : 'Insert Video',
    current: current ? (current.getAttribute('src') || '') : '',
    fileTypes: this.VIDEO_TYPES, fileExtensions: /\.(mp4|m4v|mov|webm)$/i,
    wrongType: 'That isn\'t a video this site takes: upload an MP4, MOV or WebM.',
    accept: 'video/mp4,video/quicktime,video/webm,.mp4,.m4v,.mov,.webm',
    dropText: 'Drop a video here', browseText: 'Browse for a video', uploading: 'Uploading video…',
    generalHint: 'Videos play muted and on a loop while they\'re on screen.',
    uploadHint: 'MP4 (like Switch clips), MOV or WebM, up to 64MB.',
    badAddress: 'Use the address of a video file, starting with https://, or upload one.',
    send: function(file, progress, done) { return _this._sendEditorVideo(file, progress, done); },
    insert: function(src) {
      if(current) {
        editor.dom.setAttrib(current, 'src', src);
        editor.undoManager.add();
      } else {
        editor.insertContent('<p><video src="' + editor.dom.encode(src) + '" muted loop playsinline controls preload="metadata"></video></p><p></p>');
      }
    }
  });
};

ZMap.prototype._uploadEditorPhoto = function(editor) {
  var _this = this;
  return this._editorMediaDialog(editor, {
    title: 'Insert Photo',
    current: '',
    fileTypes: this.PHOTO_TYPES, fileExtensions: /\.(jpe?g|png|gif|webp)$/i,
    wrongType: 'That isn\'t a photo this site takes: upload a JPEG, PNG, GIF or WebP.',
    accept: 'image/jpeg,image/png,image/gif,image/webp',
    dropText: 'Drop a photo here', browseText: 'Browse for a photo', uploading: 'Uploading photo…',
    generalHint: 'Photos next to each other show as a carousel.',
    uploadHint: 'JPEG, PNG, GIF or WebP. Large photos are made smaller to fit.',
    badAddress: 'Use the address of an image, starting with https://, or upload one.',
    send: function(file, progress, done) { return _this._sendEditorPhoto(file, progress, done); },
    insert: function(src) { editor.insertContent('<img src="' + editor.dom.encode(src) + '" alt="">'); }
  });
};

ZMap.prototype._editorMediaDialog = function(editor, kind) {
  var uploading = null;
  var dialog;
  var upload = function(file) {
    if(!file || uploading) return;
    if(kind.fileTypes.indexOf(file.type) === -1 && !kind.fileExtensions.test(file.name)) {
      editor.windowManager.alert(kind.wrongType);
      return;
    }
    uploading = kind.send(file, function(percent) {
      dialog.block(kind.uploading + ' ' + percent + '%');
    }, function(error, location) {
      uploading = null;
      dialog.unblock();
      if(error) { editor.windowManager.alert(error); return; }
      if(!location) return; // Cancelled.
      // Uploaded: straight into the content.
      kind.insert(location);
      dialog.close();
    });
  };
  // Upload's drop area: browsing, and dropping a file on it.
  var wire = function() {
    var drop = document.querySelector('.tox-dialog .zm-video-drop');
    if(!drop || drop._wired) return;
    drop._wired = true;
    var zone = drop.querySelector('.tox-dropzone');
    var input = drop.querySelector('input[type=file]');
    drop.querySelector('.zm-video-browse').addEventListener('click', function() { input.click(); });
    input.addEventListener('change', function() { upload(input.files && input.files[0]); input.value = ''; });
    zone.addEventListener('dragover', function(e) { e.preventDefault(); zone.classList.add('tox-dropzone--dragging'); });
    zone.addEventListener('dragleave', function() { zone.classList.remove('tox-dropzone--dragging'); });
    zone.addEventListener('drop', function(e) {
      e.preventDefault();
      zone.classList.remove('tox-dropzone--dragging');
      upload(e.dataTransfer && e.dataTransfer.files && e.dataTransfer.files[0]);
    });
  };
  dialog = editor.windowManager.open({
    title: kind.title,
    size: 'normal',
    body: {
      type: 'tabpanel',
      tabs: [
        { name: 'general', title: 'General', items: [
          { type: 'urlinput', name: 'src', filetype: kind.fileTypes === this.VIDEO_TYPES ? 'media' : 'image', label: 'Source' },
          { type: 'htmlpanel', html: '<p class="zm-video-dialog-hint">' + kind.generalHint + '</p>' }
        ] },
        { name: 'upload', title: 'Upload', items: [
          { type: 'htmlpanel', html:
            '<div class="tox-dropzone-container zm-video-drop"><div class="tox-dropzone">' +
              '<p>' + kind.dropText + '</p>' +
              '<button type="button" class="tox-button tox-button--secondary zm-video-browse">' + kind.browseText + '</button>' +
              '<input type="file" accept="' + kind.accept + '" style="display: none;">' +
            '</div></div>' +
            '<p class="zm-video-dialog-hint">' + kind.uploadHint + '</p>' }
        ] }
      ]
    },
    initialData: { src: { value: kind.current } },
    buttons: [
      { type: 'cancel', name: 'cancel', text: 'Cancel' },
      { type: 'submit', name: 'save', text: 'Save', primary: true }
    ],
    onTabChange: function(api, details) {
      if(details.newTabName === 'upload') window.setTimeout(wire, 0);
    },
    onCancel: function() {
      if(uploading) uploading.abort();
    },
    onSubmit: function(api) {
      var src = $.trim((api.getData().src || {}).value || '');
      if(!src) { api.close(); return; }
      if(!/^(https?:\/\/|\/|uploads\/|marker-video\.php)/i.test(src)) {
        editor.windowManager.alert(kind.badAddress);
        return;
      }
      kind.insert(src);
      api.close();
    }
  });
  if(!kind.current) {
    dialog.showTab('upload');
    window.setTimeout(wire,0);
  }
  return dialog;
};

// Photos and videos dropped straight into the editor (editors, who can
// upload): each uploads where it was dropped, a line there meanwhile saying
// how far along it is, then put in as Insert Photo or Insert Video would.
// Placeholders never reach what's saved: they're left out of the editor's
// content. (Text, not a preview of the photo: TinyMCE uploads any temporary
// image it finds itself, which would send the photo twice.)
ZMap.prototype._wireEditorDrops = function(editor) {
  var _this = this;
  var media = function(file) {
    if(_this.PHOTO_TYPES.indexOf(file.type) !== -1 || /\.(jpe?g|png|gif|webp)$/i.test(file.name)) return 'photo';
    if(_this.VIDEO_TYPES.indexOf(file.type) !== -1 || /\.(mp4|m4v|mov|webm)$/i.test(file.name)) return 'video';
    return null;
  };
  var files = function(e) {
    var list = e.dataTransfer && e.dataTransfer.files;
    return list ? Array.prototype.slice.call(list) : [];
  };
  var dragging = function(e) {
    return e.dataTransfer && Array.prototype.indexOf.call(e.dataTransfer.types || [], 'Files') !== -1;
  };
  // (Placeholders: left out of the content, and of the undo history.)
  editor.on('PreInit', function() {
    editor.serializer.addAttributeFilter('data-zm-uploading', function(nodes) {
      nodes.forEach(function(node) { node.remove(); });
    });
  });
  // "Drop photo or video here" over every section's editor as soon as a
  // file's dragged anywhere over the page (_fileDragging), the one under the
  // pointer picked out.
  var area = function() {
    var container = editor.getContainer();
    return container && (container.closest('.marker-edit-section') || container);
  };
  editor.on('init', function() {
    var section = area();
    if(!section || section.querySelector('.zm-editor-drop-overlay')) return;
    section.setAttribute('data-zm-drops', '1');
    var overlay = document.createElement('div');
    overlay.className = 'zm-editor-drop-overlay';
    overlay.setAttribute('aria-hidden', 'true');
    overlay.innerHTML = '<div class="zm-editor-drop-box"><i class="fas fa-cloud-upload-alt"></i><span>Drop photo or video here</span></div>';
    // (Over the editor itself, toolbar and text, not the section's label.)
    (editor.getContainer() || section).appendChild(overlay);
  });
  _this._watchFileDrags();
  editor.on('dragover', function(e) {
    if(!dragging(e)) return;
    e.preventDefault();
    e.dataTransfer.dropEffect = 'copy';
    // (The text is a frame of its own: the page doesn't hear it.)
    _this._fileDragging(area());
  });
  editor.on('drop', function(e) {
    _this._fileDragging(null, true);
    var dropped = files(e).filter(function(file) { return media(file); });
    if(!files(e).length) return;
    e.preventDefault();
    e.stopImmediatePropagation();
    if(!dropped.length) {
      editor.notificationManager.open({ text: 'Drop a photo (JPEG, PNG, GIF or WebP) or a video (MP4, MOV or WebM).', type: 'warning', timeout: 4000 });
      return;
    }
    // Where it was dropped.
    if(editor.selection.placeCaretAt) editor.selection.placeCaretAt(e.clientX, e.clientY);
    // Every file's placeholder at once (one after another, the next would
    // land inside the last and split it).
    var uploads = dropped.map(function(file) {
      var kind = media(file);
      return { file: file, kind: kind, label: kind === 'photo' ? 'Uploading photo… ' : 'Uploading video… ',
        id: 'zm-upload-' + Date.now().toString(36) + Math.random().toString(36).slice(2, 6) };
    });
    editor.insertContent(uploads.map(function(u) {
      return '<p id="' + u.id + '" data-zm-uploading="1" class="zm-uploading">' + u.label + '0%</p>';
    }).join(''));
    uploads.forEach(function(u) {
      var file = u.file, kind = u.kind, id = u.id, label = u.label;
      var placeholder = function() { return editor.getDoc().getElementById(id); };
      var send = kind === 'photo' ? _this._sendEditorPhoto.bind(_this) : _this._sendEditorVideo.bind(_this);
      send(file, function(percent) {
        var el = placeholder();
        if(el) el.textContent = label + percent + '%';
      }, function(error, location) {
        var el = placeholder();
        if(error || !location) {
          if(el) editor.dom.remove(el);
          if(error) editor.notificationManager.open({ text: error, type: 'error', timeout: 5000 });
          return;
        }
        if(!el) return; // Removed while it uploaded.
        var html = kind === 'photo'
          ? '<img src="' + editor.dom.encode(location) + '" alt="">'
          : '<video src="' + editor.dom.encode(location) + '" muted loop playsinline controls preload="metadata"></video>';
        // (Each in its own paragraph: several dropped together show as a
        // carousel, ImageCarousel.js.)
        editor.dom.setOuterHTML(el, '<p>' + html + '</p>');
        editor.undoManager.add();
        editor.fire('change');
      });
    });
  }, true);
};

// A file being dragged over the page: every editor section that takes drops
// shows its overlay (target: the one under the pointer), until the drag
// stops coming (browsers send dragover all the while a drag's over the page,
// so a pause means it left, was dropped or was cancelled) or done is given.
ZMap.prototype._fileDragging = function(target, done) {
  var sections = document.querySelectorAll('[data-zm-drops]');
  var hide = function() {
    sections.forEach(function(section) { section.classList.remove('zm-editor-dropping', 'zm-editor-drop-target'); });
  };
  window.clearTimeout(this._fileDragTimer);
  if(done) { hide(); return; }
  sections.forEach(function(section) {
    section.classList.add('zm-editor-dropping');
    section.classList.toggle('zm-editor-drop-target', section === target);
  });
  this._fileDragTimer = window.setTimeout(hide, 250);
};

// Once: drags over the page itself. Shows the overlays, and while an editor
// takes drops, a file dropped beside it isn't opened in place of the page
// (losing the edit).
ZMap.prototype._watchFileDrags = function() {
  if(this._fileDragsWatched) return;
  this._fileDragsWatched = true;
  var zmap = this;
  var files = function(e) { return e.dataTransfer && Array.prototype.indexOf.call(e.dataTransfer.types || [], 'Files') !== -1; };
  var open = function() { return !!document.querySelector('[data-zm-drops]'); };
  this._onPage(document, 'dragover', function(e) {
    if(!files(e) || !open()) return;
    e.preventDefault();
    e.dataTransfer.dropEffect = 'none';
    zmap._fileDragging(null);
  });
  this._onPage(document, 'drop', function(e) {
    if(!files(e) || !open()) return;
    e.preventDefault();
    zmap._fileDragging(null, true);
  });
  this._onPage(document, 'dragend', function() { zmap._fileDragging(null, true); });
};

// Sends a photo to ajax/upload_marker_image.php (as pasting one does:
// zmap.js images_upload_handler): progress(percent), then done(error) or
// done(null, its address). Returns the request, to abort it.
ZMap.prototype._sendEditorPhoto = function(file, progress, done) {
  var request = { xhr: null, abort: function() { if(this.xhr) this.xhr.abort(); } };
  progress(0);
  var form = new FormData();
  form.append('file', file, file.name);
  var xhr = request.xhr = new XMLHttpRequest();
  xhr.open('POST', 'ajax.php?command=upload_marker_image');
  xhr.upload.addEventListener('progress', function(e) {
    if(e.lengthComputable) progress(Math.round(e.loaded / e.total * 100));
  });
  xhr.addEventListener('load', function() {
    var data = null;
    try { data = JSON.parse(xhr.responseText); } catch(e) {}
    if(xhr.status === 413) { done('That photo is too large for the server to take.'); return; }
    if(!data || !data.success) { done((data && data.msg) || 'The photo could not be uploaded.'); return; }
    done(null, data.location);
  });
  xhr.addEventListener('error', function() { done('The photo could not be uploaded. Check your connection.'); });
  xhr.addEventListener('abort', function() { done(null, null); });
  xhr.send(form);
  return request;
};

// Sends a clip to ajax/upload_marker_video.php: progress(percent) as it
// goes, then done(error) or done(null, its address). Returns the request,
// to abort it.
ZMap.prototype._sendEditorVideo = function(file, progress, done) {
  var _this = this;
  var request = { aborted: false, xhr: null, abort: function() { this.aborted = true; if(this.xhr) this.xhr.abort(); } };
  var send = function(maxBytes) {
    if(request.aborted) return;
    if(maxBytes && file.size > maxBytes) {
      done('That video is ' + Math.round(file.size / 1048576) + 'MB. Videos can be up to ' + Math.round(maxBytes / 1048576) + 'MB.');
      return;
    }
    progress(0);
    var form = new FormData();
    form.append('file', file, file.name);
    var xhr = request.xhr = new XMLHttpRequest();
    xhr.open('POST', 'ajax.php?command=upload_marker_video');
    xhr.upload.addEventListener('progress', function(e) {
      if(e.lengthComputable) progress(Math.round(e.loaded / e.total * 100));
    });
    xhr.addEventListener('load', function() {
      var data = null;
      try { data = JSON.parse(xhr.responseText); } catch(e) {}
      if(xhr.status === 413) { done('That video is too large for the server to take.'); return; }
      if(!data || !data.success) { done((data && data.msg) || 'The video could not be uploaded.'); return; }
      done(null, data.location);
    });
    xhr.addEventListener('error', function() { done('The video could not be uploaded. Check your connection.'); });
    xhr.addEventListener('abort', function() { done(null, null); });
    xhr.send(form);
  };
  // How large the server takes, once.
  if(this._videoMaxBytes !== undefined) send(this._videoMaxBytes);
  else $.getJSON('ajax.php?command=upload_marker_video', function(data) {
    _this._videoMaxBytes = data && data.maxBytes || 0;
    send(_this._videoMaxBytes);
  }).fail(function() { send(0); });
  return request;
};

// marker-video.php's address for this site's uploads/marker-videos/ file;
// null for anything else.
ZMap.prototype._markerVideoStreamURL = function(src) {
  var url;
  try { url = new URL(src, window.location.href); } catch(e) { return null; }
  var match = /\/uploads\/marker-videos\/(\d+-[0-9a-f]+\.(?:mp4|mov|webm))$/.exec(url.pathname);
  return match && url.origin === window.location.origin ? 'marker-video.php?f=' + match[1] : null;
};

// Plays the drawer's videos only while at least half of one is on screen.
ZMap.prototype._watchContentVideos = function() {
  var _this = this;
  var contents = this.mapControl && this.mapControl._contents;
  if(!contents) return;
  var videos = contents.querySelectorAll('.popupContent video');
  if(!videos.length) return;
  var observer = this._videoObserver;
  if(!observer && 'IntersectionObserver' in window) {
    observer = this._videoObserver = new IntersectionObserver(function(entries) {
      entries.forEach(function(entry) {
        var video = entry.target;
        if(!video.isConnected) { observer.unobserve(video); return; }
        if(entry.isIntersecting && entry.intersectionRatio >= .5) {
          var playing = video.play();
          if(playing && playing.catch) playing.catch(function() {});
        } else {
          video.pause();
        }
      });
    }, { threshold: [0, .5, 1] });
  }
  [].forEach.call(videos, function(video) {
    if(video._zmWatched) return;
    video._zmWatched = true;
    // Uploaded ones saved with their file's path play through marker-video.php,
    // which iPhones need.
    var uploaded = _this._markerVideoStreamURL(video.getAttribute('src'));
    if(uploaded) video.setAttribute('src', uploaded);
    // Quiet, looping, inline (no full screen on iPhone); playing is ours.
    video.muted = true;
    video.defaultMuted = true;
    video.loop = true;
    video.playsInline = true;
    video.setAttribute('playsinline', '');
    video.removeAttribute('autoplay');
    if(!video.getAttribute('preload')) video.preload = 'metadata';
    if(observer) observer.observe(video);
    else video.play && video.play().catch(function() {});
  });
};

// Whenever the drawer shows something new (a POI, a revision's preview).
$(function() {
  var wait = setInterval(function() {
    if(typeof zMap === 'undefined' || !zMap.mapControl || !zMap.mapControl.addHandler) return;
    clearInterval(wait);
    zMap.mapControl.addHandler('afterSetContent', function() {
      window.setTimeout(function() { zMap._watchContentVideos(); }, 0);
    });
    zMap._watchContentVideos();
  }, 250);
});
