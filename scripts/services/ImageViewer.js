// Clicking an image in a marker's contents (its page, a path's steps, a
// revision, an embed) shows it larger, over the page, with its credit
// (ImageCredits.js) when it has one. Images in a carousel (ImageCarousel.js)
// step through together. Only images there's more of to see open: one shown
// smaller than it is, a link around it to a bigger image, or a TotK
// compendium picture (its _Detail screenshot). A link around an image to
// anything else is still a link.

// The larger version of an image: what a link around it points to, if
// that's an image; a TotK compendium icon's screenshot; else itself.
ZMap.prototype._imageLargeSource = function(img) {
  var link = img.parentNode && img.parentNode.nodeName === 'A' ? img.parentNode : null;
  var href = link && link.getAttribute('href');
  if(href && /\.(png|jpe?g|gif|webp|avif)(\?.*)?$/i.test(href)) return href;
  var src = img.getAttribute('src') || '';
  if(/\/gallery\/[^/]+_Icon\.png$/i.test(src)) return src.replace(/_Icon\.png$/i, '_Detail.png');
  return src;
};

// Whether there's more of it to see.
ZMap.prototype._imageZoomable = function(img) {
  if(!img.getAttribute('src') || /^(data|blob):/i.test(img.getAttribute('src'))) return false;
  if(img.closest && img.closest('.zm-carousel')) return true;
  if(this._imageLargeSource(img) !== img.getAttribute('src')) return true;
  return img.complete && img.naturalWidth > 0 && img.naturalWidth > img.clientWidth * 1.2;
};

// Marks the images that open (a zoom-in pointer), once each has loaded, and
// opens them when clicked.
ZMap.prototype._wireImageViewer = function(root) {
  var zmap = this;
  if(root && !root._imageViewerWired) {
    root._imageViewerWired = true;
    root.addEventListener('click', function(e) {
      var img = e.target.closest && e.target.closest('img');
      if(!img || !img.matches(zmap.IMAGE_CREDIT_SELECTOR) || !img.classList.contains('zm-zoomable')) return;
      // (A link around it to something else than an image stays a link.)
      var link = img.parentNode && img.parentNode.nodeName === 'A' ? img.parentNode : null;
      if(link && zmap._imageLargeSource(img) !== link.getAttribute('href')) return;
      e.preventDefault();
      e.stopPropagation();
      zmap.openImageViewer(img);
    });
  }
  Array.from(root.querySelectorAll(this.IMAGE_CREDIT_SELECTOR)).forEach(function(img) {
    var mark = function() {
      var link = img.parentNode && img.parentNode.nodeName === 'A' ? img.parentNode : null;
      var linkedElsewhere = link && zmap._imageLargeSource(img) !== link.getAttribute('href');
      img.classList.toggle('zm-zoomable', !linkedElsewhere && zmap._imageZoomable(img));
    };
    if(img.complete) mark(); else img.addEventListener('load', mark, {once: true});
  });
};

// The overlay, on img (and, in a carousel, the images beside it).
ZMap.prototype.openImageViewer = function(img) {
  var zmap = this;
  var old = document.getElementById('zm-image-viewer');
  if(old) old.remove();
  var carousel = img.closest('.zm-carousel');
  var group = carousel ? Array.from(carousel.querySelectorAll('.zm-carousel-slide img')) : [img];
  var index = Math.max(0, group.indexOf(img));
  var previousFocus = document.activeElement;
  var chevron = function(d) {
    return '<svg viewBox="0 0 16 16" width="20" height="20" aria-hidden="true"><path d="' + d + '" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>';
  };

  var dialog = document.createElement('dialog');
  dialog.id = 'zm-image-viewer';
  dialog.className = 'zm-image-viewer';
  dialog.setAttribute('aria-label', 'Image');
  dialog.innerHTML =
    '<button type="button" class="zm-image-viewer-close" aria-label="Close">' +
      '<svg viewBox="0 0 16 16" width="18" height="18" aria-hidden="true"><path d="M3.5 3.5l9 9m0-9-9 9" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"/></svg>' +
    '</button>' +
    '<figure class="zm-image-viewer-figure">' +
      '<img class="zm-image-viewer-img" alt="">' +
      '<figcaption class="zm-image-viewer-caption" hidden></figcaption>' +
    '</figure>' +
    (group.length > 1 ?
      '<button type="button" class="zm-image-viewer-arrow zm-image-viewer-prev" aria-label="Previous image">' + chevron('M10 3 5 8l5 5') + '</button>' +
      '<button type="button" class="zm-image-viewer-arrow zm-image-viewer-next" aria-label="Next image">' + chevron('M6 3l5 5-5 5') + '</button>' : '');

  var big = dialog.querySelector('.zm-image-viewer-img');
  var caption = dialog.querySelector('.zm-image-viewer-caption');
  var prev = dialog.querySelector('.zm-image-viewer-prev'), next = dialog.querySelector('.zm-image-viewer-next');
  var show = function(i) {
    index = Math.max(0, Math.min(group.length - 1, i));
    var source = group[index];
    var small = source.currentSrc || source.src;
    var large = zmap._imageLargeSource(source);
    big.alt = source.getAttribute('alt') || '';
    // The image already showing first, then the larger one once it's in
    // (or the same one, if there isn't one, e.g. a compendium picture with
    // no screenshot).
    big.onerror = null;
    big.src = small;
    if(large && large !== source.getAttribute('src')) {
      var loader = new Image();
      loader.onload = function() { if(group[index] === source) big.src = loader.src; };
      loader.src = large;
    }
    var credit = zmap._imageCreditHTML ? zmap._imageCreditHTML((zmap._imageCreditCache || {})[source.getAttribute('src')] || null) : '';
    caption.innerHTML = credit;
    caption.hidden = !credit;
    if(prev) prev.hidden = index === 0;
    if(next) next.hidden = index === group.length - 1;
  };

  var dismiss = function() {
    if(dialog.classList.contains('is-closing')) return;
    dialog.classList.add('is-closing');
    var animations = typeof dialog.getAnimations === 'function' ? dialog.getAnimations() : [];
    if(!animations.length) { dialog.close(); return; }
    Promise.all(animations.map(function(a) { return a.finished.catch(function() {}); })).then(function() { dialog.close(); });
  };
  dialog.addEventListener('close', function() {
    // The carousel left on the image last looked at.
    if(carousel && group.length > 1) {
      var track = carousel.querySelector('.zm-carousel-track');
      if(track) track.scrollLeft = index * track.clientWidth;
    }
    dialog.remove();
    if(previousFocus && previousFocus.isConnected) previousFocus.focus({preventScroll: true});
  });
  dialog.addEventListener('cancel', function(e) { e.preventDefault(); dismiss(); });
  dialog.querySelector('.zm-image-viewer-close').addEventListener('click', dismiss);
  // Anywhere but the image, its credit and the buttons closes it.
  dialog.addEventListener('click', function(e) {
    if(!e.target.closest('.zm-image-viewer-img, .zm-image-viewer-caption, button')) dismiss();
  });
  if(prev) prev.addEventListener('click', function() { show(index - 1); });
  if(next) next.addEventListener('click', function() { show(index + 1); });
  dialog.addEventListener('keydown', function(e) {
    if(group.length < 2) return;
    if(e.key === 'ArrowLeft') { e.preventDefault(); show(index - 1); }
    if(e.key === 'ArrowRight') { e.preventDefault(); show(index + 1); }
  });
  // Swiped, on a phone.
  var startX = null, startY = null;
  dialog.addEventListener('touchstart', function(e) {
    if(e.touches.length !== 1) { startX = null; return; }
    startX = e.touches[0].clientX; startY = e.touches[0].clientY;
  }, {passive: true});
  dialog.addEventListener('touchend', function(e) {
    if(startX === null || group.length < 2) return;
    var dx = e.changedTouches[0].clientX - startX, dy = e.changedTouches[0].clientY - startY;
    startX = null;
    if(Math.abs(dx) > 50 && Math.abs(dx) > Math.abs(dy) * 1.5) show(index + (dx < 0 ? 1 : -1));
  });

  document.body.appendChild(dialog);
  show(index);
  dialog.showModal();
  dialog.querySelector('.zm-image-viewer-close').focus({preventScroll: true});
};
