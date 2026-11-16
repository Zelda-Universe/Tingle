// Embed Code (marker, dropped pin and path pages): a dialog, as YouTube's,
// with the embed itself shown live beside its code, Landscape or Portrait.
// The code is a sized <iframe> of embed.php that keeps its shape: Landscape
// fills the width it's given, Portrait shrinks to fit narrower pages. Copying it is what's counted for Admin's Embeds
// (trackEmbedCopy); the preview isn't a view (embed.php counts only other
// sites').

// Each shape at the size the code asks for. Landscape is wide enough for the
// drawer beside the map; Portrait is a phone's layout, the drawer below
// (general.js MOBILE_LAYOUT_BREAKPOINT).
ZMap.prototype.EMBED_SHAPES = {
  // Landscape fills the width it's given; Portrait stays at its size, or it
  // would be taller than the screen in a wide column.
  landscape: { width: 800, height: 500, label: 'Landscape', grows: true },
  portrait: { width: 400, height: 640, label: 'Portrait' }
};
ZMap.prototype.EMBED_SHAPE_KEY = 'zeldamapsEmbedShape';

// The code for an embed of src (an embed.php address) in a shape.
ZMap.prototype._embedCode = function(src, shape, title) {
  var size = this.EMBED_SHAPES[shape] || this.EMBED_SHAPES.landscape;
  var escape = function(text) { return String(text).replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;'); };
  return '<iframe src="' + escape(src) + '" width="' + size.width + '" height="' + size.height + '"' +
    ' style="border:0;width:100%;' + (size.grows ? '' : 'max-width:' + size.width + 'px;') + 'height:auto;aspect-ratio:' + size.width + '/' + size.height + '"' +
    (title ? ' title="' + escape(title + ' - Zelda Maps') + '"' : '') +
    ' frameborder="0" loading="lazy" allowfullscreen></iframe>';
};

// opts: {src, target ('marker', 'pin' or 'path'), title}
ZMap.prototype.openEmbedDialog = function(opts) {
  var old = document.getElementById('embed-dialog');
  if(old) old.remove();
  var zmap = this;
  var shape = 'landscape';
  try { if(this.EMBED_SHAPES[localStorage.getItem(this.EMBED_SHAPE_KEY)]) shape = localStorage.getItem(this.EMBED_SHAPE_KEY); } catch(e) {}
  var previousFocus = document.activeElement;
  var escape = function(text) { return $('<span>').text(text).html(); };

  var dialog = document.createElement('dialog');
  dialog.id = 'embed-dialog';
  dialog.className = 'embed-dialog';
  dialog.setAttribute('aria-labelledby', 'embed-dialog-title');
  var shapes = Object.keys(this.EMBED_SHAPES).map(function(key) {
    var size = zmap.EMBED_SHAPES[key];
    return "<button type='button' class='embed-shape' data-shape='" + key + "' aria-pressed='false'>" +
      "<span class='embed-shape-icon embed-shape-icon-" + key + "' aria-hidden='true'></span>" +
      "<span class='embed-shape-label'>" + size.label + "</span>" +
    "</button>";
  }).join('');
  dialog.innerHTML =
    "<div class='embed-dialog-preview'><div class='embed-dialog-frame'></div></div>" +
    "<div class='embed-dialog-side'>" +
      "<h2 id='embed-dialog-title'>Embed Code</h2>" +
      (opts.title ? "<p class='embed-dialog-subtitle'>" + escape(opts.title) + "</p>" : '') +
      "<div class='embed-shapes' role='group' aria-label='Shape'>" + shapes + "</div>" +
      "<label class='embed-dialog-code-label' for='embed-dialog-code'>Code</label>" +
      "<textarea id='embed-dialog-code' class='embed-dialog-code' readonly spellcheck='false'></textarea>" +
      "<div class='embed-dialog-actions'>" +
        "<button type='button' class='infoWindowIcn embed-dialog-copy'><i class='fas fa-copy' aria-hidden='true'></i>Copy Code</button>" +
        "<button type='button' class='embed-dialog-close'>Close</button>" +
      "</div>" +
    "</div>";

  var frameBox = dialog.querySelector('.embed-dialog-frame');
  var preview = dialog.querySelector('.embed-dialog-preview');
  var code = dialog.querySelector('.embed-dialog-code');
  var iframe;
  // The embed at its real size, scaled down to fit the preview.
  var fit = function() {
    if(!iframe) return;
    var size = zmap.EMBED_SHAPES[shape];
    var styles = getComputedStyle(preview);
    var roomW = preview.clientWidth - parseFloat(styles.paddingLeft) - parseFloat(styles.paddingRight);
    var roomH = preview.clientHeight - parseFloat(styles.paddingTop) - parseFloat(styles.paddingBottom);
    var scale = Math.min(1, roomW / size.width, roomH / size.height);
    if(!(scale > 0)) scale = 1;
    frameBox.style.width = Math.floor(size.width * scale) + 'px';
    frameBox.style.height = Math.floor(size.height * scale) + 'px';
    iframe.style.transform = 'scale(' + scale + ')';
  };
  var show = function(next) {
    shape = next;
    try { localStorage.setItem(zmap.EMBED_SHAPE_KEY, shape); } catch(e) {}
    dialog.classList.toggle('is-portrait', shape === 'portrait');
    dialog.querySelectorAll('.embed-shape').forEach(function(button) {
      button.setAttribute('aria-pressed', button.dataset.shape === shape ? 'true' : 'false');
    });
    code.value = zmap._embedCode(opts.src, shape, opts.title);
    // A new frame for each shape: an embed fits what it shows to its size
    // as it opens (zmap.js _fitEmbedMarker).
    var size = zmap.EMBED_SHAPES[shape];
    iframe = document.createElement('iframe');
    iframe.src = opts.src;
    iframe.width = size.width;
    iframe.height = size.height;
    iframe.title = 'Preview';
    iframe.setAttribute('allowfullscreen', '');
    frameBox.replaceChildren(iframe);
    fit();
  };

  dialog.querySelectorAll('.embed-shape').forEach(function(button) {
    button.addEventListener('click', function() { if(button.dataset.shape !== shape) show(button.dataset.shape); });
  });
  code.addEventListener('focus', function() { code.select(); });
  dialog.querySelector('.embed-dialog-copy').addEventListener('click', function() {
    zmap.trackEmbedCopy(opts.target);
    zmap._copyText(code.value, this);
  });

  var resize = function() { fit(); };
  dialog.addEventListener('close', function() {
    window.removeEventListener('resize', resize);
    dialog.remove();
    if(previousFocus && previousFocus.isConnected) previousFocus.focus({ preventScroll: true });
  });
  var dismiss = function() {
    if(dialog.classList.contains('is-closing')) return;
    dialog.classList.add('is-closing');
    var animations = typeof dialog.getAnimations === 'function' ? dialog.getAnimations() : [];
    if(!animations.length) { dialog.close(); return; }
    Promise.all(animations.map(function(animation) { return animation.finished.catch(function() {}); })).then(function() { dialog.close(); });
  };
  dialog.addEventListener('cancel', function(e) { e.preventDefault(); dismiss(); });
  dialog.querySelector('.embed-dialog-close').addEventListener('click', dismiss);
  // A click on the backdrop (outside the dialog's box) closes it.
  dialog.addEventListener('click', function(e) {
    if(e.target !== dialog) return;
    var box = dialog.getBoundingClientRect();
    if(e.clientX < box.left || e.clientX > box.right || e.clientY < box.top || e.clientY > box.bottom) dismiss();
  });
  window.addEventListener('resize', resize);

  document.body.appendChild(dialog);
  dialog.showModal();
  show(shape);
  dialog.querySelector('.embed-dialog-copy').focus({ preventScroll: true });
};
