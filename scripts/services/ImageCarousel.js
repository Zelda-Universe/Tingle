// Image carousels: two or more images in a row in a marker's contents
// (nothing but images between them) show as one image at a time, with
// arrows on its sides and dots along its bottom, swiped on a phone. Nothing
// to make one: it's how images next to each other show, wherever a marker's
// contents do (its page, a path's steps, a revision, an embed). It never
// moves on by itself.

// Where carousels are made: contents written in the marker editor.
ZMap.prototype.IMAGE_CAROUSEL_SELECTOR = '.popupContent, .wiki-preview';

// What a top-level element of the contents is to a carousel: its images
// (an image, a link around one, or a paragraph of only those), [] for a
// credit line (ImageCredits.js, drawn again later), or null for anything
// else, which ends a row of images.
ZMap.prototype._carouselItems = function(el) {
  if(el.classList.contains('zm-image-credit')) return [];
  var isItem = function(node) {
    if(node.nodeName === 'IMG') return true;
    if(node.nodeName !== 'A') return false;
    var kids = Array.from(node.childNodes).filter(function(n) { return n.nodeType !== 3 || n.textContent.trim(); });
    return kids.length === 1 && kids[0].nodeName === 'IMG';
  };
  if(isItem(el)) return [el];
  if(el.nodeName !== 'P' && el.nodeName !== 'DIV') return null;
  var items = [];
  for(var i = 0; i < el.childNodes.length; i++) {
    var node = el.childNodes[i];
    if(node.nodeType === 3) { if(node.textContent.replace(/ /g, ' ').trim()) return null; continue; }
    if(node.nodeType !== 1 || node.nodeName === 'BR') continue;
    if(node.classList.contains('zm-image-credit')) continue;
    if(!isItem(node)) return null;
    items.push(node);
  }
  return items.length ? items : null;
};

// Each run of two or more images in each container under root, as a
// carousel.
ZMap.prototype._buildImageCarousels = function(root) {
  var zmap = this;
  var containers = Array.from(root.querySelectorAll(this.IMAGE_CAROUSEL_SELECTOR));
  if(root.matches && root.matches(this.IMAGE_CAROUSEL_SELECTOR)) containers.unshift(root);
  containers.forEach(function(container) {
    var run = [], items = [];
    var flush = function() {
      if(items.length >= 2) zmap._makeImageCarousel(run, items);
      run = []; items = [];
    };
    Array.from(container.childNodes).forEach(function(node) {
      if(node.nodeType === 3) { if(node.textContent.trim()) flush(); return; }
      if(node.nodeType !== 1) return;
      var found = zmap._carouselItems(node);
      if(found === null) { flush(); return; }
      run.push(node);
      items = items.concat(found);
    });
    flush();
  });
};

// The carousel, where the run of images was.
ZMap.prototype._makeImageCarousel = function(run, items) {
  var zmap = this;
  var carousel = document.createElement('div');
  carousel.className = 'zm-carousel';
  carousel.setAttribute('role', 'region');
  carousel.setAttribute('aria-roledescription', 'carousel');
  carousel.setAttribute('aria-label', 'Images');
  var chevron = function(d) {
    return '<svg viewBox="0 0 16 16" width="16" height="16" aria-hidden="true"><path d="' + d + '" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>';
  };
  carousel.innerHTML = '<div class="zm-carousel-track" tabindex="0"></div>' +
    '<button type="button" class="zm-carousel-arrow zm-carousel-prev" aria-label="Previous image">' + chevron('M10 3 5 8l5 5') + '</button>' +
    '<button type="button" class="zm-carousel-arrow zm-carousel-next" aria-label="Next image">' + chevron('M6 3l5 5-5 5') + '</button>' +
    '<div class="zm-carousel-dots">' + items.map(function(item, i) {
      return '<button type="button" class="zm-carousel-dot" aria-label="Image ' + (i + 1) + ' of ' + items.length + '"></button>';
    }).join('') + '</div>';
  var track = carousel.firstChild;
  run[0].parentNode.insertBefore(carousel, run[0]);
  items.forEach(function(item, i) {
    var slide = document.createElement('div');
    slide.className = 'zm-carousel-slide';
    slide.setAttribute('role', 'group');
    slide.setAttribute('aria-roledescription', 'slide');
    slide.setAttribute('aria-label', (i + 1) + ' of ' + items.length);
    slide.appendChild(item);
    track.appendChild(slide);
  });
  // (What held them, now empty, and their old credit lines, gone.)
  run.forEach(function(node) { if(items.indexOf(node) === -1 && node.parentNode) node.remove(); });
  // The shown image's credit, under the carousel (ImageCredits.js).
  var credit = document.createElement('div');
  credit.className = 'zm-carousel-credit';
  credit.hidden = true;
  carousel.parentNode.insertBefore(credit, carousel.nextSibling);
  this._wireImageCarousel(carousel);
};

ZMap.prototype._wireImageCarousel = function(carousel) {
  var zmap = this, track = carousel.querySelector('.zm-carousel-track');
  var slides = Array.from(track.children), dots = Array.from(carousel.querySelectorAll('.zm-carousel-dot'));
  var prev = carousel.querySelector('.zm-carousel-prev'), next = carousel.querySelector('.zm-carousel-next');
  var reduce = function() { return window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches; };
  var shown = -1;
  var current = function() { return Math.max(0, Math.min(slides.length - 1, Math.round(track.scrollLeft / (track.clientWidth || 1)))); };
  // As tall as the image showing, so a short one leaves no gap.
  var fit = function() {
    var slide = slides[current()];
    var height = slide ? slide.offsetHeight : 0;
    if(height && track.style.height !== height + 'px') {
      track.style.height = height + 'px';
      carousel.dispatchEvent(new CustomEvent('zm-carousel-resize', {bubbles: true}));
    }
  };
  var update = function() {
    var i = current();
    fit();
    if(i === shown) return;
    shown = i;
    prev.hidden = i === 0;
    next.hidden = i === slides.length - 1;
    dots.forEach(function(dot, j) {
      dot.classList.toggle('active', j === i);
      if(j === i) dot.setAttribute('aria-current', 'true'); else dot.removeAttribute('aria-current');
    });
    zmap._showCarouselCredit(carousel);
  };
  var go = function(i) {
    i = Math.max(0, Math.min(slides.length - 1, i));
    track.scrollTo({left: i * track.clientWidth, behavior: reduce() ? 'auto' : 'smooth'});
  };
  carousel._carouselIndex = current;
  var frame;
  track.addEventListener('scroll', function() {
    if(frame) return;
    frame = window.requestAnimationFrame(function() { frame = null; update(); });
  }, {passive: true});
  prev.addEventListener('click', function() { go(current() - 1); });
  next.addEventListener('click', function() { go(current() + 1); });
  dots.forEach(function(dot, i) { dot.addEventListener('click', function() { go(i); }); });
  track.addEventListener('keydown', function(e) {
    if(e.key === 'ArrowLeft' || e.key === 'ArrowRight') {
      e.preventDefault();
      go(current() + (e.key === 'ArrowLeft' ? -1 : 1));
    }
  });
  slides.forEach(function(slide) {
    var img = slide.querySelector('img');
    if(img && !img.complete) img.addEventListener('load', fit);
  });
  // (Kept on the image showing as the drawer changes width.)
  if(typeof ResizeObserver !== 'undefined') {
    var width = 0;
    new ResizeObserver(function() {
      if(track.clientWidth === width) return;
      var i = shown < 0 ? 0 : shown;
      width = track.clientWidth;
      track.scrollLeft = i * width;
      fit();
    }).observe(track);
  }
  update();
};

// The credit of the image showing (ImageCredits.js), under the carousel:
// each image keeps its own in its slide, out of sight.
ZMap.prototype._showCarouselCredit = function(carousel) {
  var box = carousel.nextElementSibling;
  if(!box || !box.classList.contains('zm-carousel-credit') || !carousel._carouselIndex) return;
  var slide = carousel.querySelectorAll('.zm-carousel-slide')[carousel._carouselIndex()];
  var credit = slide && slide.querySelector('.zm-image-credit');
  box.innerHTML = credit ? credit.innerHTML : '';
  box.hidden = !credit;
};
