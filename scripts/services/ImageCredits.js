// Image credits (lib/common/image_credits.php): a small line under an image
// or a video in a marker's contents, wherever it shows (its page, a path's
// steps, a revision, an embed), saying who made it and where it's from:
// "Image: Polygon · With permission", "Video: …". Set from the marker
// editor's Add Credit / Change Credit button (_editImageCredit). One with
// none is the site's own and shows nothing.

ZMap.prototype.IMAGE_LICENSES = [
  ['own', 'Own work'],
  ['permission', 'With permission'],
  ['cc-by', 'CC BY'],
  ['cc-by-sa', 'CC BY-SA'],
  ['other', 'Other']
];

// The images that get a credit line: a marker's contents as its page, a
// path's steps and a revision's preview show them. (Also what the image
// viewer opens larger, ImageViewer.js.)
ZMap.prototype.IMAGE_CREDIT_SELECTOR = '.popupContent img, .path-step-content img, .wiki-preview img';
// ...and the videos there, which get one too.
ZMap.prototype.MEDIA_CREDIT_SELECTOR = ZMap.prototype.IMAGE_CREDIT_SELECTOR + ', .popupContent video, .path-step-content video, .wiki-preview video';

// Credits known so far, by the address an image or video was written with:
// a credit, or null for none.
ZMap.prototype._imageCreditCache = null;

// Watches the drawer for images and videos as pages come and go.
ZMap.prototype._watchImageCredits = function(root) {
  if(!root || root._imageCreditsWatched || typeof MutationObserver === 'undefined') return;
  root._imageCreditsWatched = true;
  var zmap = this, timer;
  var media = function(n) { return n.nodeType === 1 && (n.nodeName === 'IMG' || n.nodeName === 'VIDEO' || n.querySelector('img, video')); };
  new MutationObserver(function(records) {
    if(!records.some(function(r) { return Array.from(r.addedNodes).some(media); })) return;
    window.clearTimeout(timer);
    timer = window.setTimeout(function() { zmap._imagesAdded(root); }, 0);
  }).observe(root, {childList: true, subtree: true});
  this._imagesAdded(root);
};

// New images: those in a row made a carousel (ImageCarousel.js), then each
// credited, and those with more to see opened larger when clicked.
ZMap.prototype._imagesAdded = function(root) {
  if(this._buildImageCarousels) this._buildImageCarousels(root);
  this._creditImages(root);
  // (Clicked, shown larger: ImageViewer.js.)
  if(this._wireImageViewer) this._wireImageViewer(root);
};

// The credits of some addresses not yet known, asked for (100 at a time)
// and kept; then done(). Each is asked for once: one already asked for
// counts as known (null) until its answer comes.
ZMap.prototype._fetchImageCredits = function(srcs, done) {
  var cache = this._imageCreditCache || (this._imageCreditCache = {});
  var needed = [];
  srcs.forEach(function(src) {
    if(src && !/^(data|blob):/i.test(src) && !(src in cache) && needed.indexOf(src) === -1) needed.push(src);
  });
  if(!needed.length) { if(done) done(); return; }
  needed.forEach(function(src) { cache[src] = null; });
  for(var i = 0; i < needed.length; i += 100) {
    $.getJSON('ajax.php?command=image_credits', {srcs: JSON.stringify(needed.slice(i, i + 100))}).done(function(data) {
      if(data && data.success) Object.keys(data.credits || {}).forEach(function(src) { cache[src] = data.credits[src]; });
    }).always(function() { if(done) done(); });
  }
};

// Each image's and video's credit, asked for once, then drawn.
ZMap.prototype._creditImages = function(root) {
  var zmap = this;
  var media = Array.from(root.querySelectorAll(this.MEDIA_CREDIT_SELECTOR));
  this._fetchImageCredits(media.map(function(el) { return el.getAttribute('src'); }), function() {
    media.forEach(function(el) { zmap._paintImageCredit(el); });
  });
};

// The line under one image or video, or none: after it, or after the link
// around it.
ZMap.prototype._paintImageCredit = function(img) {
  var credit = (this._imageCreditCache || {})[img.getAttribute('src')] || null;
  var anchor = img.parentNode && img.parentNode.nodeName === 'A' && img.parentNode.childNodes.length === 1 ? img.parentNode : img;
  var next = anchor.nextElementSibling;
  if(next && next.classList.contains('zm-image-credit')) next.remove();
  var html = this._imageCreditHTML(credit, img.nodeName === 'VIDEO' ? 'Video' : 'Image');
  if(html) anchor.insertAdjacentHTML('afterend', html);
  // (In a carousel, shown under it for the image showing.)
  var carousel = img.closest && img.closest('.zm-carousel');
  if(carousel && this._showCarouselCredit) this._showCarouselCredit(carousel);
};

// noun: what the line calls it, "Image" (the default) or "Video".
ZMap.prototype._imageCreditHTML = function(credit, noun) {
  if(!credit || (!credit.author && !credit.source && credit.license === 'own')) return '';
  var esc = this._wikiEscape.bind(this);
  var license = (this.IMAGE_LICENSES.find(function(l) { return l[0] === credit.license; }) || [])[1] || '';
  var who = credit.author || '';
  if(!who && credit.source) { try { who = new URL(credit.source).hostname.replace(/^www\./, ''); } catch(e) { who = 'source'; } }
  var name = credit.source
    ? '<a href="' + esc(credit.source) + '" target="_blank" rel="noopener noreferrer nofollow">' + esc(who) + '</a>'
    : esc(who);
  var shown = credit.license !== 'own' && credit.license !== 'other' ? license : '';
  return '<span class="zm-image-credit">' + (noun || 'Image') + ': ' + name + (shown ? ' · ' + esc(shown) : '') + '</span>';
};

// Every image and video showing, drawn again (after a credit changes).
ZMap.prototype._repaintImageCredits = function() {
  var zmap = this;
  document.querySelectorAll(this.MEDIA_CREDIT_SELECTOR).forEach(function(img) { zmap._paintImageCredit(img); });
};

// What's selected in the marker editor, if it can be credited: an image,
// or a video (which TinyMCE shows as a stand-in holding the real one, its
// address kept as data-mce-p-src). {node, src, kind: 'image'|'video'}.
ZMap.prototype._editorMedia = function(node) {
  if(!node || node.nodeType !== 1) return null;
  if(node.nodeName === 'IMG' && !node.hasAttribute('data-mce-object')) return {node: node, src: node.getAttribute('src') || '', kind: 'image'};
  var video = node.closest && node.closest('.mce-object-video');
  if(video) return {node: video, src: video.getAttribute('data-mce-p-src') || '', kind: 'video'};
  if(node.nodeName === 'VIDEO') return {node: node, src: node.getAttribute('src') || '', kind: 'video'};
  return null;
};

// Whether a selected image or video has a credit, for the toolbar over it
// (zmap.js): true or false, or null while that's being found out (then the
// toolbar's shown again once it's known).
ZMap.prototype._editorMediaCredited = function(editor, node) {
  var media = this._editorMedia(node);
  if(!media || !media.src || /^(data|blob):/i.test(media.src)) return false;
  var cache = this._imageCreditCache || (this._imageCreditCache = {});
  if(media.src in cache) {
    var credit = cache[media.src];
    return !!(credit && (credit.author || credit.source || credit.license !== 'own'));
  }
  this._fetchImageCredits([media.src], function() { if(!editor.removed) editor.nodeChanged(); });
  return null;
};

// The marker editor's Add Credit / Change Credit button, on a selected
// image or video: who made it, where it's from, and under what license.
ZMap.prototype._editImageCredit = function(editor) {
  var zmap = this, media = this._editorMedia(editor.selection.getNode());
  if(!media) return;
  var src = media.src, noun = media.kind === 'video' ? 'video' : 'image';
  if(!src || /^(data|blob):/i.test(src)) {
    editor.notificationManager.open({text: 'Wait for the ' + noun + ' to finish uploading, then credit it.', type: 'info', timeout: 3000});
    return;
  }
  var cache = this._imageCreditCache || (this._imageCreditCache = {});
  var open = function(credit) {
    credit = credit || {author: '', source: '', license: 'own'};
    editor.windowManager.open({
      title: media.kind === 'video' ? 'Video Credit' : 'Image Credit',
      body: {type: 'panel', items: [
        {type: 'input', name: 'author', label: 'Made by', placeholder: 'A person or a site, e.g. Polygon'},
        {type: 'input', name: 'source', label: 'Source', placeholder: 'https://… where it came from'},
        {type: 'selectbox', name: 'license', label: 'License', items: zmap.IMAGE_LICENSES.map(function(l) { return {value: l[0], text: l[1]}; })},
        {type: 'htmlpanel', html: '<p style="opacity:.75;font-size:13px;margin-top:6px">Shown under the ' + noun + ' wherever it appears. Only use someone else’s ' + noun + ' with their permission or under a license that allows it.</p>'}
      ]},
      initialData: {author: credit.author || '', source: credit.source || '', license: credit.license || 'own'},
      buttons: [{type: 'cancel', text: 'Cancel'}, {type: 'submit', text: 'Save', primary: true}],
      onSubmit: function(api) {
        var data = api.getData();
        api.block('Saving…');
        zmap._wikiPost('save_image_credit', {src: src, author: data.author, source: data.source, license: data.license}).done(function(result) {
          api.unblock();
          if(!result || !result.success) { editor.notificationManager.open({text: (result && result.msg) || 'Could not save the credit.', type: 'error', timeout: 4000}); return; }
          cache[src] = result.credit;
          zmap._repaintImageCredits();
          api.close();
          // (Its toolbar now says Change Credit, or Add Credit again.)
          editor.nodeChanged();
        }).fail(function(xhr) {
          api.unblock();
          editor.notificationManager.open({text: zmap._wikiError(xhr), type: 'error', timeout: 4000});
        });
      }
    });
  };
  if(src in cache) { open(cache[src]); return; }
  this._fetchImageCredits([src], function() { open(cache[src]); });
};
