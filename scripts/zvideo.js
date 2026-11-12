// Videos in marker content: uploading clips from the editor (Upload Video;
// ajax/upload_marker_video.php), and playing them muted and looping, only
// while they're on screen. On a phone that means once the drawer is pulled
// up and the video scrolled into view; they pause again when out of view.

// Insert/Edit Video: a dialog like Insert/Edit Image's (TinyMCE 5's
// windowManager). General takes a video's address; Upload takes a clip,
// dropped or browsed for, sends it, and puts its address in General.
// Opened on a video in the content, it edits that one. (TinyMCE's own drop
// area only takes images, so Upload has one of ours, drawn the same.)
ZMap.prototype.VIDEO_TYPES = ['video/mp4', 'video/quicktime', 'video/webm'];

ZMap.prototype._uploadEditorVideo = function(editor) {
  var _this = this;
  var selected = editor.selection.getNode();
  var current = selected && selected.nodeName === 'VIDEO' ? selected : null;
  var uploading = null;
  var dialog;
  var upload = function(file) {
    if(!file || uploading) return;
    if(_this.VIDEO_TYPES.indexOf(file.type) === -1 && !/\.(mp4|m4v|mov|webm)$/i.test(file.name)) {
      editor.windowManager.alert('That isn\'t a video this site takes: upload an MP4, MOV or WebM.');
      return;
    }
    uploading = _this._sendEditorVideo(file, function(percent) {
      dialog.block('Uploading video… ' + percent + '%');
    }, function(error, location) {
      uploading = null;
      dialog.unblock();
      if(error) { editor.windowManager.alert(error); return; }
      if(!location) return; // Cancelled.
      dialog.setData({ src: { value: location } });
      dialog.showTab('general');
      dialog.focus('src');
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
    title: current ? 'Edit Video' : 'Insert Video',
    size: 'normal',
    body: {
      type: 'tabpanel',
      tabs: [
        { name: 'general', title: 'General', items: [
          { type: 'urlinput', name: 'src', filetype: 'media', label: 'Source' },
          { type: 'htmlpanel', html: '<p class="zm-video-dialog-hint">Videos play muted and on a loop while they\'re on screen.</p>' }
        ] },
        { name: 'upload', title: 'Upload', items: [
          { type: 'htmlpanel', html:
            '<div class="tox-dropzone-container zm-video-drop"><div class="tox-dropzone">' +
              '<p>Drop a video here</p>' +
              '<button type="button" class="tox-button tox-button--secondary zm-video-browse">Browse for a video</button>' +
              '<input type="file" accept="video/mp4,video/quicktime,video/webm,.mp4,.m4v,.mov,.webm" style="display: none;">' +
            '</div></div>' +
            '<p class="zm-video-dialog-hint">MP4 (like Switch clips), MOV or WebM, up to 64MB.</p>' }
        ] }
      ]
    },
    initialData: { src: { value: current ? (current.getAttribute('src') || '') : '' } },
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
        editor.windowManager.alert('Use the address of a video file, starting with https://, or upload one.');
        return;
      }
      if(current) {
        editor.dom.setAttrib(current, 'src', src);
        editor.undoManager.add();
      } else {
        editor.insertContent('<p><video src="' + editor.dom.encode(src) + '" muted loop playsinline controls preload="metadata"></video></p><p></p>');
      }
      api.close();
    }
  });
  if(!current) {
    dialog.showTab('upload');
    window.setTimeout(wire,0);
  }
  return dialog;
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
