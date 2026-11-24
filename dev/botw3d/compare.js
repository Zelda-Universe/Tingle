// Street view against the game, frame for frame: renders street view from the
// exact camera of a frame captured from the game (Cemu + Xcode, see
// shader-notes.md), and shows the game's frame, ours and their difference
// side by side, with the numbers.
//
// Run in the browser console on a BotW map page (staff, street view open):
//   fetch('/dev/botw3d/compare.js').then(r => r.text()).then(eval)
// then:  ZCompare.run('field-day')       (Esc or click closes it)
//        ZCompare.all()                   (every reference's score)
//
// Each reference (dev/botw3d/reference/<name>.png, the game's frame without its
// HUD) has its camera, field of view and sun here, read from the capture's
// buffers (MTLBuffer-7: the view matrix and projection; MTLBuffer-1283: the sun).
var ZCompare = (function() {
  // The references (reference/index.json: names; reference/<name>.json: camera, field
  // of view, sun, hour; written by tools/extract_reference.py from a frame capture).
  var REFS = {};
  function loadRefs() {
    return fetch('/dev/botw3d/reference/index.json?' + Date.now()).then(function(r) { return r.json(); }).then(function(names) {
      return Promise.all(names.map(function(n) {
        return fetch('/dev/botw3d/reference/' + n + '.json?' + Date.now()).then(function(r) { return r.json(); }).then(function(ref) { REFS[n] = ref; });
      }));
    }).then(function() { return REFS; });
  }

  function luma(r, g, b) { return 0.2126 * r + 0.7152 * g + 0.0722 * b; }

  function render(v, ref) {
    var THREE = v.lib.THREE, cam = v.camera, r = v.renderer;
    var keep = { fov: cam.fov, aspect: cam.aspect, size: r.getSize(new THREE.Vector2()), pr: r.getPixelRatio() };
    cam.fov = ref.fovy; cam.aspect = ref.w / ref.h; cam.updateProjectionMatrix();
    r.setPixelRatio(1); r.setSize(ref.w, ref.h, false); v.composer.setPixelRatio(1); v.composer.setSize(ref.w, ref.h);
    v._walk(0); cam.updateMatrixWorld(); v._haze();
    if(v._cloudU) v._cloudU.uCloudCam.value.copy(cam.matrixWorld);
    if(v.game) { v.game.resize(ref.w, ref.h); v.game.render(); } else v.composer.render();   // as street view draws
    var gl = r.getContext(), px = new Uint8ClampedArray(ref.w * ref.h * 4);
    gl.readPixels(0, 0, ref.w, ref.h, gl.RGBA, gl.UNSIGNED_BYTE, px);
    // rows come bottom first
    var flip = function(px, comps) {
      var out = new px.constructor(px.length), row = ref.w * comps;
      for(var y = 0; y < ref.h; y++) out.set(px.subarray((ref.h - 1 - y) * row, (ref.h - y) * row), y * row);
      return out;
    };
    var out = flip(px, 4);
    // the game renderer's G-buffer as well: albedo (linear; sRGB-encoded here, as the game's albedo
    // target stores it) and the view normal (n * 0.5 + 0.5, as the game's), 8-bit like the game's
    if(v.game && v.game.gbuf) {
      var f = new Float32Array(ref.w * ref.h * 4);
      r.setRenderTarget(v.game.gbuf);
      var read = function(i) {
        gl.readBuffer(gl.COLOR_ATTACHMENT0 + i);
        gl.readPixels(0, 0, ref.w, ref.h, gl.RGBA, gl.FLOAT, f);
        return flip(f, 4);
      };
      var enc = function(x) { x = Math.max(0, Math.min(1, x)); return 255 * (x <= 0.0031308 ? 12.92 * x : 1.055 * Math.pow(x, 1 / 2.4) - 0.055); };
      var alb = read(1), nrm = read(2);
      gl.readBuffer(gl.COLOR_ATTACHMENT0); r.setRenderTarget(null);
      out.albedo = new Uint8ClampedArray(alb.length); out.normal = new Uint8ClampedArray(nrm.length); out.solid = new Uint8Array(ref.w * ref.h);
      for(var i = 0; i < alb.length; i += 4) {
        out.albedo[i] = enc(alb[i]); out.albedo[i + 1] = enc(alb[i + 1]); out.albedo[i + 2] = enc(alb[i + 2]); out.albedo[i + 3] = 255;
        out.normal[i] = nrm[i] * 255; out.normal[i + 1] = nrm[i + 1] * 255; out.normal[i + 2] = nrm[i + 2] * 255; out.normal[i + 3] = 255;
        out.solid[i / 4] = alb[i + 3] > 0 || nrm[i] + nrm[i + 1] + nrm[i + 2] > 0 ? 1 : 0;   // something drawn (cleared sky is 0 in both; the game's terrain writes albedo alpha 0)
      }
    }
    // put street view back as it was
    cam.fov = keep.fov; cam.aspect = keep.aspect; cam.updateProjectionMatrix();
    r.setPixelRatio(keep.pr); r.setSize(keep.size.x, keep.size.y, false); v.composer.setPixelRatio(keep.pr); v.composer.setSize(keep.size.x, keep.size.y);
    if(v.game) v.game.resize(keep.size.x, keep.size.y);
    return out;
  }

  // CIELAB from 8-bit sRGB (D65): colour differences as the eye sees them (deltaE 76: ~2.3 is
  // just noticeable), and chroma (how saturated)
  function lab(r, g, b) {
    var lin = function(c) { c /= 255; return c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4); };
    r = lin(r); g = lin(g); b = lin(b);
    var x = (0.4124 * r + 0.3576 * g + 0.1805 * b) / 0.95047, y = 0.2126 * r + 0.7152 * g + 0.0722 * b, z = (0.0193 * r + 0.1192 * g + 0.9505 * b) / 1.08883;
    var f = function(t) { return t > 0.008856 ? Math.cbrt(t) : 7.787 * t + 16 / 116; };
    var fx = f(x), fy = f(y), fz = f(z);
    return [116 * fy - 16, 500 * (fx - fy), 200 * (fy - fz)];
  }
  // How far apart two pictures' colours are, where keep (optional) is 1: mean deltaE, the mean
  // lightness and chroma of each, and the share of pixels past a just noticeable difference
  function colour(a, b, w, h, keep) {
    var n = 0, de = 0, la = 0, lb = 0, ca = 0, cb = 0, far = 0;
    for(var p = 0; p < w * h; p++) {
      if(keep && !keep[p]) continue;
      var i = p * 4, A = lab(a[i], a[i + 1], a[i + 2]), B = lab(b[i], b[i + 1], b[i + 2]);
      var d = Math.hypot(A[0] - B[0], A[1] - B[1], A[2] - B[2]);
      de += d; if(d > 10) far++;
      la += A[0]; lb += B[0]; ca += Math.hypot(A[1], A[2]); cb += Math.hypot(B[1], B[2]); n++;
    }
    var r1 = function(x) { return Math.round(x / Math.max(n, 1) * 10) / 10; };
    return { deltaE: r1(de), lightness: [r1(la), r1(lb)], chroma: [r1(ca), r1(cb)], over10: Math.round(far / Math.max(n, 1) * 100) + '%', pixels: n };
  }
  // Normals: the mean angle between the game's and ours (degrees), where both drew something
  function normals(a, b, w, h, keep) {
    var n = 0, s = 0;
    for(var p = 0; p < w * h; p++) {
      if(keep && !keep[p]) continue;
      var i = p * 4, A = [a[i] / 127.5 - 1, a[i + 1] / 127.5 - 1, a[i + 2] / 127.5 - 1], B = [b[i] / 127.5 - 1, b[i + 1] / 127.5 - 1, b[i + 2] / 127.5 - 1];
      var la = Math.hypot(A[0], A[1], A[2]), lb = Math.hypot(B[0], B[1], B[2]);
      if(la < 0.5 || lb < 0.5) continue;
      s += Math.acos(Math.max(-1, Math.min(1, (A[0] * B[0] + A[1] * B[1] + A[2] * B[2]) / (la * lb)))); n++;
    }
    return { meanAngle: Math.round(s / Math.max(n, 1) * 180 / Math.PI * 10) / 10, pixels: n };
  }

  function stats(a, b, w, h, sky) {
    var n = w * h, d = [0, 0, 0], ma = [0, 0, 0], mb = [0, 0, 0], abs = 0, sd = [0, 0, 0], sn = 0, gd = [0, 0, 0], gn = 0;
    for(var i = 0; i < n * 4; i += 4) {
      for(var k = 0; k < 3; k++) { ma[k] += a[i + k]; mb[k] += b[i + k]; d[k] += Math.abs(a[i + k] - b[i + k]); }
      abs += Math.abs(luma(a[i], a[i + 1], a[i + 2]) - luma(b[i], b[i + 1], b[i + 2]));
      var isSky = sky ? sky[i / 4] : false;
      for(k = 0; k < 3; k++) { if(isSky) sd[k] += b[i + k] - a[i + k]; else gd[k] += b[i + k] - a[i + k]; }
      if(isSky) sn++; else gn++;
    }
    var f = function(x, m) { return x.map(function(v) { return Math.round(v / m * 10) / 10; }); };
    return { game: f(ma, n), ours: f(mb, n), meanAbsDiffRGB: f(d, n), meanAbsDiffLuma: Math.round(abs / n * 10) / 10,
             skyBias: sn ? f(sd, sn) : null, groundBias: gn ? f(gd, gn) : null,
             colour: colour(a, b, w, h), colourSky: sky ? colour(a, b, w, h, sky) : null,
             colourGround: sky ? colour(a, b, w, h, sky.map(function(x) { return 1 - x; })) : null };
  }

  function show(name, game, ours, w, h, st, extra) {
    var el = document.getElementById('zcompare'); if(el) el.remove();
    el = document.createElement('div'); el.id = 'zcompare';
    el.style.cssText = 'position:fixed;inset:0;z-index:100000;background:#111;color:#eee;font:13px/1.4 system-ui;overflow:auto;padding:12px';
    var diff = new Uint8ClampedArray(game.length);
    for(var i = 0; i < game.length; i += 4) {   // grey where they agree; red where ours is brighter, blue where darker
      var dl = luma(ours[i], ours[i + 1], ours[i + 2]) - luma(game[i], game[i + 1], game[i + 2]);
      diff[i] = 128 + Math.max(0, dl) * 1.5; diff[i + 1] = 128 - Math.abs(dl) * 0.5; diff[i + 2] = 128 + Math.max(0, -dl) * 1.5; diff[i + 3] = 255;
    }
    function canvas(px, label) {
      var c = document.createElement('canvas'); c.width = w; c.height = h; c.style.cssText = 'width:calc(50% - 8px);margin:4px;display:inline-block;vertical-align:top';
      c.getContext('2d').putImageData(new ImageData(px, w, h), 0, 0); c.title = label; return c;
    }
    el.innerHTML = '<div style="margin:4px"><b>' + name + '</b> · game (left) · street view (right) · difference (red: ours brighter, blue: darker) · ' +
      '<code>' + JSON.stringify(st) + '</code></div>';
    el.appendChild(canvas(game, 'game')); el.appendChild(canvas(ours, 'street view'));
    el.appendChild(canvas(diff, 'difference'));
    (extra || []).forEach(function(e) {   // the G-buffer: the game's (left), ours (right)
      var t = document.createElement('div'); t.style.margin = '8px 4px 0'; t.textContent = e[2] + ': game (left) · street view (right)'; el.appendChild(t);
      el.appendChild(canvas(e[0], 'game ' + e[2])); el.appendChild(canvas(e[1], 'street view ' + e[2]));
    });
    el.onclick = function() { el.remove(); };
    document.addEventListener('keydown', function esc(e) { if(e.key === 'Escape') { el.remove(); document.removeEventListener('keydown', esc); } });
    document.body.appendChild(el);
  }

  // Stand where the game's camera was (street view's camera is at x, y + eye, z,
  // looking along yaw / pitch), with the frame's sun, and let what's there load.
  function standAt(v, ref) {
    v.x = ref.pos[0]; v.z = ref.pos[2]; v.y = ref.pos[1] - 1.7;
    v.yaw = Math.atan2(-ref.fwd[0], -ref.fwd[2]); v.pitch = -Math.asin(ref.fwd[1]);
    // the frame's own sun (its direction from the game's constants); at night the hour alone
    v.sunDir = ref.night ? null : (ref.light || ref.sun); v._setTime(ref.hour);
    v._loadAround();
    if(!v._zmSettle) v._zmSettle = v._settle;
    v._settle = function() {};   // stay at the camera's height, not the ground's (until done)
    return new Promise(function(res) { setTimeout(res, 12000); });
  }

  function loadRef(name) {
    return new Promise(function(res, rej) {
      var img = new Image(); img.onload = function() {
        var c = document.createElement('canvas'); c.width = img.width; c.height = img.height;
        var g = c.getContext('2d'); g.drawImage(img, 0, 0); res(g.getImageData(0, 0, img.width, img.height).data);
      }; img.onerror = rej; img.src = '/dev/botw3d/reference/' + name + '.png?' + Date.now();
    });
  }

  return {
    REFS: REFS, show: show, stats: stats,
    // custom: another way to draw street view's frame (e.g. ZLightPass.frame, the game's own
    // shaders), given street view and the reference, returning its pixels top row first
    run: function(name, custom) {
      return loadRefs().then(function() { return ZCompare._run(name, custom); });
    },
    // every reference in turn: the scores (no pictures)
    all: function(custom) {
      return loadRefs().then(function() {
        var names = Object.keys(REFS), out = {}, i = 0;
        var next = function() {
          if(i >= names.length) return out;
          var n = names[i++];
          return ZCompare._run(n, custom).then(function(st) {
            out[n] = { luma: st.meanAbsDiffLuma, deltaE: st.colour.deltaE, chroma: st.colour.chroma, deltaESky: st.colourSky && st.colourSky.deltaE,
                       deltaEGround: st.colourGround && st.colourGround.deltaE };
            if(st.albedo) { out[n].albedoDeltaE = st.albedo.deltaE; out[n].albedoChroma = st.albedo.chroma; out[n].normalAngle = st.normal.meanAngle; }
            var el = document.getElementById('zcompare'); if(el) el.remove(); return next(); });
        };
        return next();
      });
    },
    _run: function(name, custom) {
      var v = ZStreetView.current, ref = REFS[name];
      if(!v || !ref) throw new Error('Open street view first; references: ' + Object.keys(REFS).join(', '));
      return standAt(v, ref).then(function() { return loadRef(name); }).then(function(game) {
        var ours = custom ? custom(v, ref) : render(v, ref);
        // the sky: where the game's frame is far away (its own sky mask isn't
        // saved, so: the top part bluer than it is green)
        var sky = new Uint8Array(ref.w * ref.h);
        for(var i = 0; i < sky.length; i++) { var j = i * 4; sky[i] = (i / ref.w < ref.h * 0.5) && game[j + 2] > game[j + 1] + 10 && game[j + 2] > game[j] + 40 ? 1 : 0; }
        // a frame with the game's HUD in it: its corners (hearts and runes, the map and clock) left out
        var keep = null;
        if(ref.hud_in_frame) {
          keep = new Uint8Array(ref.w * ref.h);
          for(var y = 0; y < ref.h; y++) for(var x = 0; x < ref.w; x++)
            keep[y * ref.w + x] = (x < 180 && y < 120) || (x > 1000 && y > 520) ? 0 : 1;
          for(var k = 0; k < keep.length; k++) if(!keep[k]) { game[k * 4] = ours[k * 4]; game[k * 4 + 1] = ours[k * 4 + 1]; game[k * 4 + 2] = ours[k * 4 + 2]; }
        }
        var st = stats(game, ours, ref.w, ref.h, sky);
        if(v._zmSettle) { v._settle = v._zmSettle; delete v._zmSettle; } v.sunDir = null;
        // The inputs: the game's G-buffer against ours, where the capture's G-buffer is of this same
        // frame (ref.gbuffer 'matches', checked by eye: a capture can keep one from another moment)
        if(ref.gbuffer !== 'matches' || !ours.albedo) { show(name, game, ours, ref.w, ref.h, st); return st; }
        return Promise.all([loadRef(name + '-albedo'), loadRef(name + '-normal')]).then(function(g) {
          var both = new Uint8Array(ref.w * ref.h);
          for(var p = 0; p < both.length; p++) both[p] = ours.solid[p] && !sky[p] ? 1 : 0;
          st.albedo = colour(g[0], ours.albedo, ref.w, ref.h, both);
          st.normal = normals(g[1], ours.normal, ref.w, ref.h, both);
          show(name, game, ours, ref.w, ref.h, st, [[g[0], ours.albedo, 'albedo'], [g[1], ours.normal, 'normal']]);
          return st;
        });
      });
    }
  };
})();
