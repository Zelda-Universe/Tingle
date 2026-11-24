// Street view's ground as Breath of the Wild draws its own: a geometry clipmap
// (dev/botw3d/shader-notes.md, "BotW's terrain is a geometry clipmap"). Seven
// nested levels follow the camera, 62.5 m to 4 km across, each 256 cells (0.244 m
// apart in the finest); each level's heights, normals and materials are a layer
// of a texture array, filled from the game's own terrain tiles (the .hght and
// .mate of each area, images/3d/botw/streetview/terrain/, build_terrain.py), and
// drawn with the game's own terrain shaders (gpu/terrain_vs.glsl, terrain_ps.glsl:
// its vertex shader deb54731 and pixel shader fb2d0efc, the maths untouched) into
// the game renderer's G-buffer (StreetViewGame.js).
//
// The constants are the game's, made here per level the way it has them (each
// draw's block in a frame capture): the level's layer, its place in the world,
// its texture coordinates, the coarser level beside it (a level's edges fade to
// the coarser level's heights, so they meet), the camera. A coarser level leaves
// out the pixels a finer one covers.
var ZStreetViewTerrain = (function() {
  var ROOT = 'images/3d/botw/streetview/', N = 257, CELLS = 256, LEVELS = 7, FINEST = 62.5;
  var HEADER_ROWS = [   // the material table's first rows (uf_blockPS11 0-8), as the game has them
    [16000, 800, 1 / 16000, 1 / 800], [1023, 1 / 1023, 1 - 1 / 1023, 0.5 / 1023], [511, 1 / 511, 1 - 1 / 511, 0.5 / 511],
    [511, 1 / 511, 1 - 1 / 511, 0.5 / 511], [63, 1 / 63, 1 - 1 / 63, 0.5 / 63], [255, 1 / 255, 1 - 1 / 255, 0.5 / 255],
    [0.0012952992, -1.25, -2.25, -2.25], [0, 100000, 0, 1], [1, 0, 0, 0]];
  var PS1_ROW17 = [0.82899, 0.46631, 0.87266, 0];   // a constant of the game's scene block (read from a capture)
  var FADE = [8.53333, -3.16667];                   // a level's edge fade, as the game's: from 0.371 to 0.488 of its width

  // the sun's shadow from street view's shadow map (three's: depth packed as RGBA), 3 x 3 samples as the
  // rest of the scene has it (the water's pixel shader takes it too)
  var SHADOW_GLSL = [
    'uniform sampler2D zmShadowMap; uniform mat4 zmShadowMatrix; uniform float zmShadowBias; uniform vec2 zmShadowSize; uniform float zmShadowOn;',
    'float zmUnpack(vec4 v) { return dot(v, vec4(255.0 / 256.0) / vec4(256.0 * 256.0 * 256.0, 256.0 * 256.0, 256.0, 1.0)); }',
    'float zmSun(vec3 w) {',
    '  if(zmShadowOn < 0.5) return 1.0;',
    '  vec4 c = zmShadowMatrix * vec4(w, 1.0); c.xyz /= c.w; c.z += zmShadowBias;',
    '  if(c.x < 0.0 || c.x > 1.0 || c.y < 0.0 || c.y > 1.0 || c.z > 1.0) return 1.0;',
    '  float s = 0.0; vec2 t = 1.0 / zmShadowSize;',
    '  for(int j = -1; j <= 1; j++) for(int i = -1; i <= 1; i++) s += step(c.z, zmUnpack(texture(zmShadowMap, c.xy + vec2(i, j) * t)));',
    '  return s / 9.0;',
    '}'].join('\n');

  function floatsToInts(f) { return new Int32Array(new Float32Array(f).buffer); }
  // The game's vertex data is big-endian floats (Cemu's shader swaps the bytes back)
  function swapped(f) {
    var b = new DataView(new ArrayBuffer(4)); b.setFloat32(0, f, true);
    return b.getUint32(0, false);
  }

  function Terrain(game) { this.game = game; this.view = game.view; this.THREE = game.lib.THREE; this.ready = false; }
  Terrain.prototype = {
    load: function() {
      var t = this, get = function(n, json) { return fetch(ROOT + n).then(function(r) { if(!r.ok) throw new Error(n); return json ? r.json() : r.text(); }); };
      return Promise.all([get('terrain/index.json', true), get('gpu/terrain-materials.json', true), get('gpu/terrain_vs.glsl'), get('gpu/terrain_ps.glsl'),
                          this._atlas(ROOT + 'tex/ground-atlas.webp', true), this._atlas(ROOT + 'tex/ground-cmb.webp', false)]).then(function(f) {
        t.index = f[0]; t.table = f[1].materials; t.src = { vs: f[2], ps: f[3] }; t.alb = f[4]; t.cmb = f[5];
        t.areas = t.index.areas.map(function(a) { return { x: a[0], z: a[1], size: a[2], name: a[3], h: null, m: null, loading: false }; });
        t._build();
        t.ready = true;
      });
    },

    // An atlas of the game's terrain material textures (build_ground.py) as a texture array
    _atlas: function(url, srgb) {
      var THREE = this.THREE;
      return fetch(url).then(function(r) { return r.blob(); })
        .then(function(b) { return createImageBitmap(b, { premultiplyAlpha: 'none', colorSpaceConversion: 'none' }); })
        .then(function(img) {
          var px = 256, cols = 10, n = 83;
          var c = document.createElement('canvas'); c.width = img.width; c.height = img.height;
          var g = c.getContext('2d', { willReadFrequently: true }); g.drawImage(img, 0, 0);
          var all = g.getImageData(0, 0, img.width, img.height).data, data = new Uint8Array(px * px * 4 * n);
          for(var l = 0; l < n; l++) {
            var ox = (l % cols) * px, oy = Math.floor(l / cols) * px;
            for(var y = 0; y < px; y++) data.set(all.subarray(((oy + y) * img.width + ox) * 4, ((oy + y) * img.width + ox + px) * 4), (l * px + y) * px * 4);
          }
          var tex = new THREE.DataArrayTexture(data, px, px, n);
          tex.format = THREE.RGBAFormat; if(srgb) tex.colorSpace = THREE.SRGBColorSpace;
          tex.wrapS = tex.wrapT = THREE.RepeatWrapping;
          tex.minFilter = THREE.LinearMipmapLinearFilter; tex.magFilter = THREE.LinearFilter;
          tex.generateMipmaps = true; tex.anisotropy = 4; tex.needsUpdate = true;
          return tex;
        });
    },

    _array: function(type, format, filter) {
      var THREE = this.THREE, n = N * N * LEVELS * (format === THREE.RedFormat ? 1 : 4);
      var data = type === THREE.FloatType ? new Float32Array(n) : new Uint8Array(n);
      var tex = new THREE.DataArrayTexture(data, N, N, LEVELS);
      tex.type = type; tex.format = format; tex.minFilter = tex.magFilter = filter;
      tex.wrapS = tex.wrapT = THREE.ClampToEdgeWrapping; tex.generateMipmaps = false; tex.needsUpdate = true;
      return tex;
    },

    _build: function() {
      var THREE = this.THREE, t = this;
      var lin = this.view.renderer.extensions.has('OES_texture_float_linear') ? THREE.LinearFilter : THREE.NearestFilter;
      this.heights = this._array(THREE.FloatType, THREE.RedFormat, lin);          // VS0: height / 800
      this.normals = this._array(THREE.UnsignedByteType, THREE.RGBAFormat, THREE.LinearFilter);   // VS1: normal x, z (x 0.5 + 0.5)
      this.mats = this._array(THREE.UnsignedByteType, THREE.RGBAFormat, THREE.NearestFilter);     // PS7: the two materials
      this.surf = this._array(THREE.UnsignedByteType, THREE.RGBAFormat, THREE.LinearFilter);      // PS8: normal x, z, blend, flags
      var water = new THREE.DataArrayTexture(new Float32Array(LEVELS), 1, 1, LEVELS);              // VS2: no water (yet)
      water.type = THREE.FloatType; water.format = THREE.RedFormat; water.needsUpdate = true;
      var zero = new THREE.DataTexture(new Uint8Array(4), 1, 1); zero.needsUpdate = true;
      var far = new THREE.DataTexture(new Float32Array([1e6, 1e6, 1e6, 1e6]), 1, 1, THREE.RGBAFormat, THREE.FloatType); far.needsUpdate = true;
      // the material table: its header, then each material (u scale, v scale, layer, packed)
      var table = new Float32Array(265 * 4);
      HEADER_ROWS.forEach(function(r, i) { table.set(r, i * 4); });
      this.table.forEach(function(r, i) { table.set(r, (9 + i) * 4); });
      // one grid: 257 x 257 vertices, the attribute its place (big-endian floats, as the game's)
      var pos = new Uint32Array(N * N * 2), idx = [];
      for(var j = 0; j < N; j++) for(var i = 0; i < N; i++) { pos[(j * N + i) * 2] = swapped(i); pos[(j * N + i) * 2 + 1] = swapped(j); }
      for(j = 0; j < CELLS; j++) for(i = 0; i < CELLS; i++) {
        var a = j * N + i, b = a + 1, c = a + N, d = c + 1;
        idx.push(a, c, b, b, c, d);
      }
      var geo = new THREE.BufferGeometry();
      var attr = new THREE.BufferAttribute(pos, 2); attr.gpuType = THREE.IntType;
      geo.setAttribute('attrDataSem0', attr);
      geo.setAttribute('position', new THREE.BufferAttribute(new Float32Array(3), 3));   // (three asks for one)
      geo.setIndex(new THREE.BufferAttribute(new Uint32Array(idx), 1));
      // the pixel shader leaves out what a finer level covers (its world x, z: Sem4)
      // and takes the sun's shadow from street view's shadow map (three's: depth packed as RGBA),
      // 3 x 3 samples as the rest of the scene has it
      var ps = this.src.ps.replace(/^#version 300 es\n/, '')
        .replace('uniform float zmSunShadow;', SHADOW_GLSL)
        .replace('zmShadow = vec4(zmSunShadow, 1.0, 1.0, zmSunShadow);', 'float zmS = zmSun(passParameterSem4.xyz); zmShadow = vec4(zmS, 1.0, 1.0, zmS);')
        .replace(/void main\(\)\s*\{/,
          'uniform vec4 zmHole;\nvoid main()\n{\nif(passParameterSem4.x > zmHole.x && passParameterSem4.x < zmHole.z && passParameterSem4.z > zmHole.y && passParameterSem4.z < zmHole.w) discard;');
      var vs = this.src.vs.replace(/^#version 300 es\n/, '');
      this.scene = new THREE.Scene(); this.levels = [];
      for(var L = 0; L < LEVELS; L++) {
        var u = {
          uf_remappedVS: { value: new Int32Array(24 * 4) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
          uf_blockPS1: { value: new Float32Array(18 * 4) }, uf_blockPS6: { value: new Float32Array(46 * 4) },
          uf_blockPS8: { value: new Float32Array(33 * 4) }, uf_blockPS11: { value: table },
          uf_blockPS12: { value: new Float32Array(20 * 4) }, uf_blockPS13: { value: new Float32Array(15 * 4) },
          textureUnitVS0: { value: this.heights }, textureUnitVS1: { value: this.normals }, textureUnitVS2: { value: water },
          textureUnitPS0: { value: zero }, textureUnitPS1: { value: zero }, textureUnitPS3: { value: far },
          textureUnitPS7: { value: this.mats }, textureUnitPS8: { value: this.surf }, textureUnitPS9: { value: this.alb }, textureUnitPS10: { value: this.cmb },   // (PS9 the colours, PS10 MaterialCmb)
          zmHole: { value: new THREE.Vector4(0, 0, 0, 0) }, zmShadowMap: { value: zero }, zmShadowMatrix: { value: new THREE.Matrix4() },
          zmShadowBias: { value: 0 }, zmShadowSize: { value: new THREE.Vector2(1, 1) }, zmShadowOn: { value: 0 }
        };
        var mat = new THREE.RawShaderMaterial({ glslVersion: THREE.GLSL3, uniforms: u, vertexShader: vs, fragmentShader: ps, side: THREE.DoubleSide });
        var mesh = new THREE.Mesh(geo, mat); mesh.frustumCulled = false;
        this.scene.add(mesh);
        var size = FINEST * Math.pow(2, L);
        this.levels.push({ L: L, size: size, step: size / CELLS, u: u, mesh: mesh, x0: null, z0: null, dirty: true });
      }
    },

    // The tiles a level needs (areas at least its size: the game's own detail at that spacing)
    _need: function(lv) {
      var x0 = lv.x0, z0 = lv.z0, x1 = x0 + lv.size, z1 = z0 + lv.size;
      return this.areas.filter(function(a) {
        return a.size >= lv.size && a.x + a.size / 2 > x0 && a.x - a.size / 2 < x1 && a.z + a.size / 2 > z0 && a.z - a.size / 2 < z1;
      });
    },
    _fetch: function(a) {
      var t = this; a.loading = true;
      var px = function(url) {
        return fetch(url).then(function(r) { if(!r.ok) throw new Error(url); return r.blob(); })
          .then(function(b) { return createImageBitmap(b, { premultiplyAlpha: 'none', colorSpaceConversion: 'none' }); })
          .then(function(img) {
            var c = document.createElement('canvas'); c.width = c.height = 256;
            var g = c.getContext('2d', { willReadFrequently: true }); g.drawImage(img, 0, 0);
            return g.getImageData(0, 0, 256, 256).data;
          });
      };
      Promise.all([px(ROOT + 'terrain/h/' + a.name + '.png'), px(ROOT + 'terrain/m/' + a.name + '.png')]).then(function(r) {
        var h = new Float32Array(65536), m = new Uint8Array(65536 * 4);
        for(var i = 0; i < 65536; i++) {
          h[i] = (r[0][i * 4] * 256 + r[0][i * 4 + 1]) / 65535;   // x 800 m
          m[i * 4] = r[1][i * 4]; m[i * 4 + 1] = r[1][i * 4 + 1]; m[i * 4 + 2] = r[1][i * 4 + 2]; m[i * 4 + 3] = r[0][i * 4 + 2];
        }
        a.h = h; a.m = m;
        t.levels.forEach(function(lv) { if(lv.x0 != null && a.size >= lv.size && a.x + a.size / 2 > lv.x0 && a.x - a.size / 2 < lv.x0 + lv.size && a.z + a.size / 2 > lv.z0 && a.z - a.size / 2 < lv.z0 + lv.size) lv.dirty = true; });
      }).catch(function() { a.failed = true; });
    },

    // A level's layer from the tiles: coarsest areas first, finer over them (as fieldbake.py paints)
    _fill: function(lv) {
      var L = lv.L, base = L * N * N, H = this.heights.image.data, Nm = this.normals.image.data, M = this.mats.image.data, S = this.surf.image.data;
      var need = this._need(lv), t = this;
      need.forEach(function(a) { if(!a.h && !a.loading && !a.failed) t._fetch(a); });
      for(var k = 0; k < need.length; k++) {
        var a = need[k]; if(!a.h) continue;
        var ax0 = a.x - a.size / 2, az0 = a.z - a.size / 2;
        var i0 = Math.max(0, Math.ceil((ax0 - lv.x0) / lv.step)), i1 = Math.min(N - 1, Math.floor((ax0 + a.size - lv.x0) / lv.step));
        var j0 = Math.max(0, Math.ceil((az0 - lv.z0) / lv.step)), j1 = Math.min(N - 1, Math.floor((az0 + a.size - lv.z0) / lv.step));
        for(var j = j0; j <= j1; j++) {
          var fz = (lv.z0 + j * lv.step - az0) / a.size * 255, tz = Math.min(254, Math.floor(fz)), wz = fz - tz;
          for(var i = i0; i <= i1; i++) {
            var fx = (lv.x0 + i * lv.step - ax0) / a.size * 255, tx = Math.min(254, Math.floor(fx)), wx = fx - tx;
            var p = tz * 256 + tx, hh = a.h;
            var h = (hh[p] * (1 - wx) + hh[p + 1] * wx) * (1 - wz) + (hh[p + 256] * (1 - wx) + hh[p + 257] * wx) * wz;
            var o = base + j * N + i; H[o] = h;
            var q = (Math.round(fz) * 256 + Math.round(fx)) * 4, mm = a.m;
            M[o * 4] = mm[q]; M[o * 4 + 1] = mm[q + 1]; S[o * 4 + 2] = mm[q + 2]; S[o * 4 + 3] = mm[q + 3];
          }
        }
      }
      // normals from the heights (world space, x and z, as 0.5 + 0.5 n)
      for(var j2 = 0; j2 < N; j2++) for(var i2 = 0; i2 < N; i2++) {
        var o2 = base + j2 * N + i2;
        var dx = (H[base + j2 * N + Math.min(N - 1, i2 + 1)] - H[base + j2 * N + Math.max(0, i2 - 1)]) * 800 / ((Math.min(N - 1, i2 + 1) - Math.max(0, i2 - 1)) * lv.step);
        var dz = (H[base + Math.min(N - 1, j2 + 1) * N + i2] - H[base + Math.max(0, j2 - 1) * N + i2]) * 800 / ((Math.min(N - 1, j2 + 1) - Math.max(0, j2 - 1)) * lv.step);
        var l = Math.sqrt(dx * dx + 1 + dz * dz), nx = -dx / l, nz = -dz / l;
        Nm[o2 * 4] = S[o2 * 4] = Math.round((nx * 0.5 + 0.5) * 255); Nm[o2 * 4 + 1] = S[o2 * 4 + 1] = Math.round((nz * 0.5 + 0.5) * 255);
      }
      this.heights.needsUpdate = this.normals.needsUpdate = this.mats.needsUpdate = this.surf.needsUpdate = true;
      lv.dirty = false; lv.fills = (lv.fills || 0) + 1;   // (the water's cells follow: StreetViewWater.js)
    },

    // Each frame: the levels round the camera (each snapped to twice its own spacing), refilled
    // when they move or their tiles arrive; then every draw's constants
    update: function(cam) {
      var t = this, px = cam.position.x, pz = cam.position.z;
      this.levels.forEach(function(lv) {
        var s2 = lv.step * 2, x0 = Math.round((px - lv.size / 2) / s2) * s2, z0 = Math.round((pz - lv.size / 2) / s2) * s2;
        if(x0 !== lv.x0 || z0 !== lv.z0) { lv.x0 = x0; lv.z0 = z0; lv.dirty = true; }
      });
      var filled = 0;
      this.levels.forEach(function(lv) { if(lv.dirty && filled < 2) { t._fill(lv); filled++; } });
      this.levels.forEach(function(lv) { t._constants(lv, cam); });
    },

    _constants: function(lv, cam) {
      var u = lv.u, c = this.levels[Math.min(lv.L + 1, LEVELS - 1)], top = c === lv, fine = lv.L > 0 ? this.levels[lv.L - 1] : null;
      var uvS = CELLS / N, uvO = 0.5 / N;   // local (0-1 over the level) -> texel centres
      var V = new Float32Array(24 * 4), set = function(i, a, b, cc, d) { V.set([a, b, cc, d], i * 4); };
      set(0, lv.L, 0, lv.L, 0.78333);
      set(1, 1 / CELLS, 1 / CELLS, 0, 0);                                           // grid -> local
      set(2, uvS, uvS, uvO, uvO);                                                   // local -> uv
      set(3, lv.size / c.size, lv.size / c.size, (lv.x0 - c.x0) / c.size, (lv.z0 - c.z0) / c.size);   // local -> the coarser level's
      set(4, lv.size, 0, lv.x0, lv.z0);                                             // local -> world
      set(5, 0.5, 0.5, top ? 0 : FADE[0], top ? -1 : FADE[1]);                      // the edge fade (none for the coarsest)
      set(6, c.L, 0, c.L, 0.78333);                                                 // the coarser level
      set(7, uvS, uvS, uvO, uvO);
      set(8, 16000, 800, 1 / 16000, 1 / 800);
      set(9, lv.L, 0, 0, 0); set(10, uvS, uvS, uvO, uvO);                           // normals (VS1)
      set(11, lv.size, 0, lv.x0, lv.z0); set(12, lv.L, 0, 0, 0); set(13, uvS, uvS, uvO, uvO);   // water (VS2)
      var Wv = cam.matrixWorldInverse.elements, P = cam.projectionMatrix.elements;
      for(var r = 0; r < 3; r++) set(14 + r, Wv[r], Wv[4 + r], Wv[8 + r], Wv[12 + r]);              // world -> view rows
      for(r = 0; r < 4; r++) set(17 + r, P[r], P[4 + r], P[8 + r], P[12 + r]);                       // projection rows
      set(21, c.size, 0, c.x0, c.z0); set(22, c.L, 0, 0, 0); set(23, uvS, uvS, uvO, uvO);
      u.uf_remappedVS.value = floatsToInts(V);
      // the pixel shader's blocks: the camera (PS1), view -> world (PS6), this level's and the
      // coarser level's surface arrays (PS12, PS13)
      var W = cam.matrixWorld.elements, P1 = u.uf_blockPS1.value, row = function(arr, i, a, b, cc, d) { arr.set([a, b, cc, d], i * 4); };
      for(r = 0; r < 3; r++) row(P1, r, Wv[r], Wv[4 + r], Wv[8 + r], Wv[12 + r]);
      for(r = 0; r < 4; r++) row(P1, 7 + r, P[r], P[4 + r], P[8 + r], P[12 + r]);
      for(r = 0; r < 3; r++) row(P1, 11 + r, W[r], W[4 + r], W[8 + r], W[12 + r]);
      row(P1, 14, cam.near, cam.far, 1 / cam.far, 1 - cam.near / cam.far);
      row(P1, 16, cam.far - cam.near, 0, 0, 0);
      P1.set(PS1_ROW17, 17 * 4);
      var P6 = u.uf_blockPS6.value; row(P6, 43, W[0], W[4], W[8], W[12]); row(P6, 44, W[1], W[5], W[9], W[13]); row(P6, 45, W[2], W[6], W[10], W[14]);
      var P12 = u.uf_blockPS12.value; row(P12, 12, lv.L, 0, 0, 0); row(P12, 14, uvS, uvS, uvO, uvO); row(P12, 17, lv.L, 0, 0, 0); row(P12, 19, uvS, uvS, uvO, uvO);
      var P13 = u.uf_blockPS13.value; row(P13, 12, c.L, 0, 0, 0); row(P13, 14, uvS, uvS, uvO, uvO);
      // the sun's shadow map (made by the G-buffer's scene render just before)
      var sh = this.view.sun && this.view.sun.shadow;
      if(sh && sh.map && this.view.sun.castShadow) {
        u.zmShadowMap.value = sh.map.texture; u.zmShadowMatrix.value.copy(sh.matrix); u.zmShadowBias.value = sh.bias;
        u.zmShadowSize.value.copy(sh.mapSize); u.zmShadowOn.value = 1;
      } else u.zmShadowOn.value = 0;
      // leave out what the finer level covers
      if(fine && fine.x0 != null) u.zmHole.value.set(fine.x0, fine.z0, fine.x0 + fine.size, fine.z0 + fine.size); else u.zmHole.value.set(0, 0, 0, 0);
    },

    dispose: function() {
      [this.heights, this.normals, this.mats, this.surf, this.alb, this.cmb].forEach(function(x) { if(x) x.dispose(); });
      if(this.levels) this.levels.forEach(function(lv) { lv.mesh.material.dispose(); });
      if(this.levels && this.levels[0]) this.levels[0].mesh.geometry.dispose();
    }
  };

  return { create: function(game) { return new Terrain(game); }, SHADOW_GLSL: SHADOW_GLSL };
})();
