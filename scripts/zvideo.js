// Videos in marker content: uploading clips from the editor (Upload Video;
// ajax/upload_marker_video.php), and playing them muted and looping, only
// while they're on screen. On a phone that means once the drawer is pulled
// up and the video scrolled into view; they pause again when out of view.

ZMap.prototype._uploadEditorVideo = function(editor) {
  var _this = this;
  var input = document.createElement('input');
  input.type = 'file';
  input.accept = 'video/mp4,video/quicktime,video/webm';
  input.addEventListener('change', function() {
    var file = input.files && input.files[0];
    if(!file) return;
    var send = function(maxBytes) {
      if(maxBytes && file.size > maxBytes) {
        editor.notificationManager.open({ text: 'Videos can be up to ' + Math.round(maxBytes / 1048576) + 'MB.', type: 'error', timeout: 5000 });
        return;
      }
      var note = editor.notificationManager.open({ text: 'Uploading video…', type: 'info', progressBar: true });
      var form = new FormData();
      form.append('file', file, file.name);
      var xhr = new XMLHttpRequest();
      xhr.open('POST', 'ajax.php?command=upload_marker_video');
      xhr.upload.addEventListener('progress', function(e) {
        if(e.lengthComputable) note.progressBar.value(Math.round(e.loaded / e.total * 100));
      });
      xhr.addEventListener('load', function() {
        note.close();
        var data = null;
        try { data = JSON.parse(xhr.responseText); } catch(e) {}
        if(!data || !data.success) {
          editor.notificationManager.open({ text: (data && data.msg) || 'The video could not be uploaded.', type: 'error', timeout: 6000 });
          return;
        }
        editor.insertContent('<p><video src="' + data.location + '" muted loop playsinline controls preload="metadata"></video></p><p></p>');
      });
      xhr.addEventListener('error', function() {
        note.close();
        editor.notificationManager.open({ text: 'The video could not be uploaded. Check your connection.', type: 'error', timeout: 6000 });
      });
      xhr.send(form);
    };
    // How large the server takes, once.
    if(_this._videoMaxBytes !== undefined) send(_this._videoMaxBytes);
    else $.getJSON('ajax.php?command=upload_marker_video', function(data) {
      _this._videoMaxBytes = data && data.maxBytes || 0;
      send(_this._videoMaxBytes);
    }).fail(function() { send(0); });
  });
  input.click();
};

// Plays the drawer's videos only while at least half of one is on screen.
ZMap.prototype._watchContentVideos = function() {
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
