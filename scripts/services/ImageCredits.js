// Image credits (lib/common/image_credits.php): a small line under an image
// in a marker's contents, wherever it shows (its page, a path's steps, a
// revision, an embed), saying who made it and where it's from:
// "Image: Polygon · With permission". Set from the marker editor's Credit
// button (_editImageCredit). An image with none is the site's own and shows
// nothing.

ZMap.prototype.IMAGE_LICENSES = [
  ['own', 'Own work'],
  ['permission', 'With permission'],
  ['cc-by', 'CC BY'],
  ['cc-by-sa', 'CC BY-SA'],
  ['other', 'Other']
];

// The images that get a credit line: a marker's contents as its page, a
// path's steps and a revision's preview show them.
ZMap.prototype.IMAGE_CREDIT_SELECTOR = '.popupContent img, .path-step-content img, .wiki-preview img';

// Credits known so far, by the address an image was written with: a credit,
// or null for none.
ZMap.prototype._imageCreditCache = null;

// Watches the drawer for images as pages come and go.
ZMap.prototype._watchImageCredits = function(root) {
  if(!root || root._imageCreditsWatched || typeof MutationObserver === 'undefined') return;
  root._imageCreditsWatched = true;
  var zmap = this, timer;
  new MutationObserver(function(records) {
    if(!records.some(function(r) { return Array.from(r.addedNodes).some(function(n) { return n.nodeType === 1 && (n.nodeName === 'IMG' || n.querySelector('img')); }); })) return;
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

// Each image's credit, asked for once (100 at a time), then drawn.
ZMap.prototype._creditImages = function(root) {
  var zmap = this, cache = this._imageCreditCache || (this._imageCreditCache = {});
  var images = Array.from(root.querySelectorAll(this.IMAGE_CREDIT_SELECTOR));
  var needed = [];
  images.forEach(function(img) {
    var src = img.getAttribute('src');
    if(src && !/^(data|blob):/i.test(src) && !(src in cache) && needed.indexOf(src) === -1) needed.push(src);
  });
  var paint = function() { images.forEach(function(img) { zmap._paintImageCredit(img); }); };
  if(!needed.length) { paint(); return; }
  needed.forEach(function(src) { cache[src] = null; });
  for(var i = 0; i < needed.length; i += 100) {
    $.getJSON('ajax.php?command=image_credits', {srcs: JSON.stringify(needed.slice(i, i + 100))}).done(function(data) {
      if(data && data.success) Object.keys(data.credits || {}).forEach(function(src) { cache[src] = data.credits[src]; });
      paint();
    });
  }
};

// The line under one image, or none: after the image, or after the link
// around it.
ZMap.prototype._paintImageCredit = function(img) {
  var credit = (this._imageCreditCache || {})[img.getAttribute('src')] || null;
  var anchor = img.parentNode && img.parentNode.nodeName === 'A' && img.parentNode.childNodes.length === 1 ? img.parentNode : img;
  var next = anchor.nextElementSibling;
  if(next && next.classList.contains('zm-image-credit')) next.remove();
  var html = this._imageCreditHTML(credit);
  if(html) anchor.insertAdjacentHTML('afterend', html);
  // (In a carousel, shown under it for the image showing.)
  var carousel = img.closest && img.closest('.zm-carousel');
  if(carousel && this._showCarouselCredit) this._showCarouselCredit(carousel);
};

ZMap.prototype._imageCreditHTML = function(credit) {
  if(!credit || (!credit.author && !credit.source && credit.license === 'own')) return '';
  var esc = this._wikiEscape.bind(this);
  var license = (this.IMAGE_LICENSES.find(function(l) { return l[0] === credit.license; }) || [])[1] || '';
  var who = credit.author || '';
  if(!who && credit.source) { try { who = new URL(credit.source).hostname.replace(/^www\./, ''); } catch(e) { who = 'source'; } }
  var name = credit.source
    ? '<a href="' + esc(credit.source) + '" target="_blank" rel="noopener noreferrer nofollow">' + esc(who) + '</a>'
    : esc(who);
  var shown = credit.license !== 'own' && credit.license !== 'other' ? license : '';
  return '<span class="zm-image-credit">Image: ' + name + (shown ? ' · ' + esc(shown) : '') + '</span>';
};

// Every image showing, drawn again (after a credit changes).
ZMap.prototype._repaintImageCredits = function() {
  var zmap = this;
  document.querySelectorAll(this.IMAGE_CREDIT_SELECTOR).forEach(function(img) { zmap._paintImageCredit(img); });
};

// The marker editor's Credit button, on a selected image: who made it,
// where it's from, and under what license.
ZMap.prototype._editImageCredit = function(editor) {
  var zmap = this, img = editor.selection.getNode();
  if(!img || img.nodeName !== 'IMG') return;
  var src = editor.dom.getAttrib(img, 'src');
  if(!src || /^(data|blob):/i.test(src)) {
    editor.notificationManager.open({text: 'Wait for the image to finish uploading, then credit it.', type: 'info', timeout: 3000});
    return;
  }
  var cache = this._imageCreditCache || (this._imageCreditCache = {});
  var open = function(credit) {
    credit = credit || {author: '', source: '', license: 'own'};
    editor.windowManager.open({
      title: 'Image Credit',
      body: {type: 'panel', items: [
        {type: 'input', name: 'author', label: 'Made by', placeholder: 'A person or a site, e.g. Polygon'},
        {type: 'input', name: 'source', label: 'Source', placeholder: 'https://… where it came from'},
        {type: 'selectbox', name: 'license', label: 'License', items: zmap.IMAGE_LICENSES.map(function(l) { return {value: l[0], text: l[1]}; })},
        {type: 'htmlpanel', html: '<p style="opacity:.75;font-size:13px;margin-top:6px">Shown under the image wherever it appears. Only use someone else’s image with their permission or under a license that allows it.</p>'}
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
        }).fail(function(xhr) {
          api.unblock();
          editor.notificationManager.open({text: zmap._wikiError(xhr), type: 'error', timeout: 4000});
        });
      }
    });
  };
  if(src in cache) { open(cache[src]); return; }
  $.getJSON('ajax.php?command=image_credits', {srcs: JSON.stringify([src])}).done(function(data) {
    var credit = data && data.success && data.credits ? data.credits[src] || null : null;
    cache[src] = credit;
    open(credit);
  }).fail(function() { open(null); });
};
