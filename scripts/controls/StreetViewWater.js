// Street view's water as Breath of the Wild draws its own (dev/botw3d/shader-notes.md,
// "The water clipmap"): a clipmap round the camera like the terrain's, its heights from
// the game's water tiles (64 x 64 texels per terrain area, images/3d/botw/streetview/water/,
// build_water.py). Every texel has a height, water or not: where there's none, the surface
// lies just under the ground (about 0.4 m), and the ground hides it (the depth test: the water
// is "clipped up through the ground"). The game's draws leave out cells too (a frame capture's
// water draws are grids with cells missing); here, the cells under the ground all over.
//
// Drawn with the game's own water shaders for its G-buffer pass (gpu/water_vs.glsl,
// water_ps.glsl: vertex shader 4ba85316, pixel shader e57a8ad2, the maths untouched):
// the surface, its waves, its colour and normal into street view's G-buffer, after the
// terrain (StreetViewGame.js). Its levels are the terrain's (StreetViewTerrain.js): the
// same squares, and the water's vertex shader reads the terrain's heights (its VS0) for
// how deep the water is there.
//
// Each level's water is a layer of a texture array (the shader's VS1), four values per
// texel as the game's tiles have them (16 bits each): height (x 800 m), flow x, flow z,
// and the type (high byte; its row of the type table and its layer of the water
// textures) with a flags byte.
//
// The constants the game gives the shaders (the type table, the textures' scales, the
// pixel shader's) are read from the running game (build_water_probe.py --gbuffer,
// gpu/water-constants.json); the camera, the levels and the time are made here.
var ZStreetViewWater = (function() {
  var ROOT = 'images/3d/botw/streetview/', NW = 65, CELLS = 64, FADE = [8.53333, -3.16667], TYPES = 8;

  function floatsToInts(f) { return new Int32Array(new Float32Array(f).buffer); }
  function swapped(f) {
    var b = new DataView(new ArrayBuffer(4)); b.setFloat32(0, f, true);
    return b.getUint32(0, false);
  }

  function Water(game, terrain) { this.game = game; this.terrain = terrain; this.view = game.view; this.THREE = game.lib.THREE; this.ready = false; this.t0 = performance.now(); }
  Water.prototype = {
    load: function() {
      var w = this, get = function(n, json) { return fetch(ROOT + n).then(function(r) { if(!r.ok) throw new Error(n); return json ? r.json() : r.text(); }); };
      return Promise.all([get('water/index.json', true), get('gpu/water_vs.glsl'), get('gpu/water_ps.glsl'),
                          get('gpu/water-constants.json', true).catch(function() { return null; }),
                          this._atlas(ROOT + 'tex/water-nrm.png', false), this._atlas(ROOT + 'tex/water-emm.png', true)]).then(function(f) {
        w.areas = f[0].areas.map(function(a) { return { x: a[0], z: a[1], size: a[2], name: a[3], d: null, loading: false }; });
        w.src = { vs: f[1], ps: f[2] }; w.C = f[3] || {}; w.nrm = f[4]; w.emm = f[5];
        w._build();
        w.ready = true;
      });
    },

    // The game's water textures (build_water.py's atlases: 8 layers of 512 px, 4 columns) as arrays:
    // WaterNrm as the game reads it (red, green, 1, 1), WaterEmm as grey (its one channel in r, g, b)
    _atlas: function(url, grey) {
      var THREE = this.THREE;
      return fetch(url).then(function(r) { return r.blob(); })
        .then(function(b) { return createImageBitmap(b, { premultiplyAlpha: 'none', colorSpaceConversion: 'none' }); })
        .then(function(img) {
          var px = 512, cols = 4, n = TYPES;
          var c = document.createElement('canvas'); c.width = img.width; c.height = img.height;
          var g = c.getContext('2d', { willReadFrequently: true }); g.drawImage(img, 0, 0);
          var all = g.getImageData(0, 0, img.width, img.height).data, data = new Uint8Array(px * px * 4 * n);
          for(var l = 0; l < n; l++) {
            var ox = (l % cols) * px, oy = Math.floor(l / cols) * px;
            for(var y = 0; y < px; y++) for(var x = 0; x < px; x++) {
              var s = ((oy + y) * img.width + ox + x) * 4, d = ((l * px + y) * px + x) * 4;
              data[d] = all[s]; data[d + 1] = grey ? all[s] : all[s + 1]; data[d + 2] = grey ? all[s] : 255; data[d + 3] = grey ? all[s] : 255;
            }
          }
          var tex = new THREE.DataArrayTexture(data, px, px, n);
          tex.format = THREE.RGBAFormat; tex.wrapS = tex.wrapT = THREE.RepeatWrapping;
          tex.minFilter = THREE.LinearMipmapLinearFilter; tex.magFilter = THREE.LinearFilter;
          tex.generateMipmaps = true; tex.anisotropy = 4; tex.needsUpdate = true;
          return tex;
        });
    },

    _build: function() {
      var THREE = this.THREE, LEVELS = this.terrain.levels.length;
      var lin = this.view.renderer.extensions.has('OES_texture_float_linear') ? THREE.LinearFilter : THREE.NearestFilter;
      this.data = new THREE.DataArrayTexture(new Float32Array(NW * NW * LEVELS * 4), NW, NW, LEVELS);   // VS1
      this.data.type = THREE.FloatType; this.data.format = THREE.RGBAFormat; this.data.minFilter = this.data.magFilter = lin;
      this.data.wrapS = this.data.wrapT = THREE.ClampToEdgeWrapping; this.data.generateMipmaps = false; this.data.needsUpdate = true;
      var zero2 = new THREE.DataTexture(new Uint8Array(4), 1, 1); zero2.needsUpdate = true;
      // one grid: 65 x 65 vertices over 0-1 (the game's water patches are such grids, 1/31 apart), big-endian floats
      var pos = new Uint32Array(NW * NW * 2);
      for(var j = 0; j < NW; j++) for(var i = 0; i < NW; i++) { pos[(j * NW + i) * 2] = swapped(i / CELLS); pos[(j * NW + i) * 2 + 1] = swapped(j / CELLS); }
      var attr = new THREE.BufferAttribute(pos, 2); attr.gpuType = THREE.IntType;
      var one = new THREE.BufferAttribute(new Float32Array(3), 3);   // (three asks for a position)
      // the pixel shader: leaves out what a finer level covers, and takes the sun's shadow as the terrain does
      // (its world position from its view position, Sem8)
      var ps = this.src.ps.replace(/^#version 300 es\n/, '')
        .replace('uniform float zmSunShadow;', 'uniform mat4 zmViewToWorld;\nuniform vec4 zmHole;\n' + ZStreetViewTerrain.SHADOW_GLSL)
        .replace('zmShadow = vec4(zmSunShadow, 1.0, 1.0, zmSunShadow);', 'float zmS = zmSun(zmW); zmShadow = vec4(zmS, 1.0, 1.0, zmS);')
        .replace(/void main\(\)\s*\{/, 'void main()\n{\nvec3 zmW = (zmViewToWorld * vec4(passParameterSem8.xyz, 1.0)).xyz;\n' +
          'if(zmW.x > zmHole.x && zmW.x < zmHole.z && zmW.z > zmHole.y && zmW.z < zmHole.w) discard;');
      var vs = this.src.vs.replace(/^#version 300 es\n/, '');
      // the same pixel shader for its light through the water (its output 5, which the game hands its full-screen
      // water pass): that alone, into a picture of its own (StreetViewGame.js, waterT)
      var pt = ps.replace('layout(location = 0) out vec4 passPixelColor0;', 'vec4 passPixelColor0;\nlayout(location = 0) out vec4 zmThrough;')
        .replace('layout(location = 1) out vec4 passPixelColor1;', 'vec4 passPixelColor1;').replace('layout(location = 2) out vec4 passPixelColor3;', 'vec4 passPixelColor3;')
        .replace('layout(location = 3) out vec4 zmShadow;', 'vec4 zmShadow;').replace('layout(location = 4) out vec4 zmEmissive;', 'vec4 zmEmissive;')
        .replace(/}\s*$/, 'zmThrough = passPixelColor5;\n}\n');
      this.through = new THREE.Scene();
      // the type table (6 rows a type): the types the probe has seen; the others take the nearest seen type's
      // rows for now (the probe reads only the types in view)
      var table = new Float32Array(48 * 4), seen = Object.keys(this.C.table || {}).map(Number);
      for(var t = 0; t < TYPES; t++) {
        var near = seen.length ? seen.reduce(function(a, b) { return Math.abs(b - t) < Math.abs(a - t) ? b : a; }) : null;
        if(near != null) table.set(this.C.table[near], t * 24); else table.set([1, 1, 0, 0], (t * 6 + 5) * 4);
      }
      this.scene = new THREE.Scene(); this.levels = [];
      for(var L = 0; L < LEVELS; L++) {
        var u = {
          uf_blockVS1: { value: new Float32Array(11 * 4) }, uf_blockVS3: { value: new Float32Array([0, 0, 0.5, 0.5]) },
          uf_blockVS4: { value: table }, uf_blockVS5: { value: new Float32Array([2, 2, 0, 0]) },
          uf_blockVS6: { value: new Float32Array(39 * 4) }, uf_blockVS8: { value: new Float32Array(this.C.vs8 || 14 * 4) },
          uf_blockVS11: { value: new Float32Array(8 * 4) }, uf_blockVS12: { value: new Float32Array(30 * 4) }, uf_blockVS13: { value: new Float32Array(30 * 4) },
          textureUnitVS0: { value: this.terrain.heights }, textureUnitVS1: { value: this.data },
          uf_remappedPS: { value: new Int32Array(20 * 4) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
          textureUnitPS0: { value: zero2 }, textureUnitPS2: { value: zero2 }, textureUnitPS3: { value: zero2 },
          textureUnitPS7: { value: this.nrm }, textureUnitPS8: { value: this.nrm }, textureUnitPS9: { value: this.emm },
          textureUnitPS10: { value: this.nrm }, textureUnitPS11: { value: this.nrm },
          zmViewToWorld: { value: new THREE.Matrix4() }, zmHole: { value: new THREE.Vector4(0, 0, 0, 0) },
          zmShadowMap: { value: zero2 }, zmShadowMatrix: { value: new THREE.Matrix4() }, zmShadowBias: { value: 0 },
          zmShadowSize: { value: new THREE.Vector2(1, 1) }, zmShadowOn: { value: 0 }
        };
        var mat = new THREE.RawShaderMaterial({ glslVersion: THREE.GLSL3, uniforms: u, vertexShader: vs, fragmentShader: ps, side: THREE.DoubleSide });
        var geo = new THREE.BufferGeometry();   // (its cells: those with water, _cells)
        geo.setAttribute('attrDataSem0', attr); geo.setAttribute('position', one); geo.setIndex(new THREE.BufferAttribute(new Uint32Array(CELLS * CELLS * 6), 1));
        geo.setDrawRange(0, 0);
        var mesh = new THREE.Mesh(geo, mat); mesh.frustumCulled = false;
        this.scene.add(mesh);
        var tmat = new THREE.RawShaderMaterial({ glslVersion: THREE.GLSL3, uniforms: u, vertexShader: vs, fragmentShader: pt, side: THREE.DoubleSide,
                                                 depthWrite: false, depthFunc: THREE.LessEqualDepth });
        var tmesh = new THREE.Mesh(geo, tmat); tmesh.frustumCulled = false; this.through.add(tmesh);
        this.levels.push({ L: L, u: u, mesh: mesh, tmesh: tmesh, x0: null, z0: null, dirty: true });
      }
    },

    _over: function(a, lv, size) {
      return a.size >= size && a.x + a.size / 2 > lv.x0 && a.x - a.size / 2 < lv.x0 + size && a.z + a.size / 2 > lv.z0 && a.z - a.size / 2 < lv.z0 + size;
    },
    _fetch: function(a) {
      var w = this; a.loading = true;
      fetch(ROOT + 'water/w/' + a.name + '.png').then(function(r) { if(!r.ok) throw new Error(a.name); return r.blob(); })
        .then(function(b) { return createImageBitmap(b, { premultiplyAlpha: 'none', colorSpaceConversion: 'none' }); })
        .then(function(img) {
          var c = document.createElement('canvas'); c.width = 512; c.height = 64;
          var g = c.getContext('2d', { willReadFrequently: true }); g.drawImage(img, 0, 0);
          var px = g.getImageData(0, 0, 512, 64).data, d = new Float32Array(64 * 64 * 4);
          // each texel's 8 bytes (little-endian u16s): height, flow x, flow z, flags | type << 8; as the shader reads them (/ 65535)
          for(var i = 0; i < 64 * 64; i++) for(var k = 0; k < 4; k++) d[i * 4 + k] = (px[(i * 8 + k * 2) * 4] + px[(i * 8 + k * 2 + 1) * 4] * 256) / 65535;
          a.d = d;
          w.levels.forEach(function(lv) { var tl = w.terrain.levels[lv.L]; if(lv.x0 != null && w._over(a, lv, tl.size)) lv.dirty = true; });
        }).catch(function() { a.failed = true; });
    },

    // A level's layer from the tiles: coarsest first, finer over them; height and flow bilinear,
    // the type word from the nearest texel
    _fill: function(lv) {
      var tl = this.terrain.levels[lv.L], size = tl.size, step = size / CELLS, base = lv.L * NW * NW * 4, D = this.data.image.data, w = this;
      var need = this.areas.filter(function(a) { return w._over(a, lv, size); });
      need.forEach(function(a) { if(!a.d && !a.loading && !a.failed) w._fetch(a); });
      for(var k = 0; k < need.length; k++) {
        var a = need[k]; if(!a.d) continue;
        var ax0 = a.x - a.size / 2, az0 = a.z - a.size / 2, s = a.d;
        var i0 = Math.max(0, Math.ceil((ax0 - lv.x0) / step)), i1 = Math.min(NW - 1, Math.floor((ax0 + a.size - lv.x0) / step));
        var j0 = Math.max(0, Math.ceil((az0 - lv.z0) / step)), j1 = Math.min(NW - 1, Math.floor((az0 + a.size - lv.z0) / step));
        for(var j = j0; j <= j1; j++) {
          var fz = (lv.z0 + j * step - az0) / a.size * 63, tz = Math.min(62, Math.floor(fz)), wz = fz - tz;
          for(var i = i0; i <= i1; i++) {
            var fx = (lv.x0 + i * step - ax0) / a.size * 63, tx = Math.min(62, Math.floor(fx)), wx = fx - tx;
            var p = (tz * 64 + tx) * 4, o = base + (j * NW + i) * 4;
            for(var c = 0; c < 3; c++) D[o + c] = (s[p + c] * (1 - wx) + s[p + 4 + c] * wx) * (1 - wz) + (s[p + 256 + c] * (1 - wx) + s[p + 260 + c] * wx) * wz;
            D[o + 3] = s[(Math.round(fz) * 64 + Math.round(fx)) * 4 + 3];
          }
        }
      }
      this.data.needsUpdate = true;
      this._cells(lv);
      lv.dirty = false;
    },

    // A level's triangles: every cell but those whose water lies under the terrain's lowest point in the
    // cell (the terrain's level is the same square, 4 of its texels to one of these)
    _cells: function(lv) {
      var D = this.data.image.data, base = lv.L * NW * NW * 4, geo = lv.mesh.geometry, idx = geo.index.array, n = 0;
      var tl = this.terrain.levels[lv.L], H = this.terrain.heights.image.data, TN = 257, tb = lv.L * TN * TN, k = (TN - 1) / CELLS;
      for(var j = 0; j < CELLS; j++) for(var i = 0; i < CELLS; i++) {
        var a = j * NW + i, b = a + 1, c = a + NW, d = c + 1;
        var top = Math.max(D[base + a * 4], D[base + b * 4], D[base + c * 4], D[base + d * 4]), low = Infinity;
        for(var y = j * k; y <= (j + 1) * k; y++) for(var x = i * k; x <= (i + 1) * k; x++) low = Math.min(low, H[tb + y * TN + x]);
        if(top < low) continue;   // (both / 800 m)
        idx[n++] = a; idx[n++] = c; idx[n++] = b; idx[n++] = b; idx[n++] = c; idx[n++] = d;
      }
      geo.index.needsUpdate = true; geo.setDrawRange(0, n);
      lv.mesh.visible = lv.tmesh.visible = n > 0; lv.terrainFills = tl.fills;
    },

    // Each frame, after the terrain's update (its levels place these): refill what moved, then the constants
    update: function(cam) {
      var w = this, filled = 0;
      this.levels.forEach(function(lv) {
        var tl = w.terrain.levels[lv.L];
        if(tl.x0 !== lv.x0 || tl.z0 !== lv.z0) { lv.x0 = tl.x0; lv.z0 = tl.z0; lv.dirty = true; }
        if(lv.dirty && lv.x0 != null && filled < 2) { w._fill(lv); filled++; }
        else if(!lv.dirty && lv.terrainFills !== tl.fills) w._cells(lv);   // (the terrain's level refilled: its heights changed)
      });
      this.levels.forEach(function(lv) { w._constants(lv, cam); });
    },

    _constants: function(lv, cam) {
      var T = this.terrain.levels, LEVELS = T.length, tl = T[lv.L], c = T[Math.min(lv.L + 1, LEVELS - 1)], top = c === tl, u = lv.u, C = this.C;
      var row = function(arr, i, a, b, cc, d) { arr.set([a, b, cc, d], i * 4); };
      var tS = 256 / 257, tO = 0.5 / 257, wS = CELLS / NW, wO = 0.5 / NW;
      var level = function(B, t) {   // a level's block (VS12 this one, VS13 the coarser): the terrain's level and the water's
        row(B, 5, t.size, 0, t.x0, t.z0); row(B, 7, t.L, -1, 0, 0); row(B, 9, tS, tS, tO, tO);   // the terrain's heights (VS0), at their full detail
        row(B, 25, t.size, 0, t.x0, t.z0); row(B, 27, t.L, 0, 0, 0); row(B, 29, wS, wS, wO, wO);   // the water's (VS1)
      };
      var B12 = u.uf_blockVS12.value, B13 = u.uf_blockVS13.value;
      level(B12, tl); level(B13, c);
      row(B12, 26, tl.size / c.size, tl.size / c.size, (tl.x0 - c.x0) / c.size, (tl.z0 - c.z0) / c.size);   // local -> the coarser level's
      row(B12, 28, 0.5, 0.5, top ? 0 : FADE[0], top ? -1 : FADE[1]);                                         // the edge fade
      var Wv = cam.matrixWorldInverse.elements, P = cam.projectionMatrix.elements, W = cam.matrixWorld.elements, V1 = u.uf_blockVS1.value;
      for(var r = 0; r < 3; r++) row(V1, r, Wv[r], Wv[4 + r], Wv[8 + r], Wv[12 + r]);
      for(r = 0; r < 4; r++) row(V1, 7 + r, P[r], P[4 + r], P[8 + r], P[12 + r]);
      var time = (performance.now() - this.t0) / 1000;
      var V6 = u.uf_blockVS6.value; row(V6, 37, time, 0, 0, 0); V6.set(C.vs6_38 || [1, 0, 0, 1], 38 * 4);
      var V11 = u.uf_blockVS11.value; row(V11, 0, 0, 800, 0, 0); V11.set(C.vs11_7 || [0, 0, 0, 0], 7 * 4);
      // the pixel shader's constants: the game's, the camera's rows and the screen made here
      var F = new Float32Array(C.ps || 20 * 4), size = this.view.renderer.getDrawingBufferSize(new this.THREE.Vector2());
      var ty = Math.tan(cam.fov * Math.PI / 360), aspect = size.x / size.y;
      F.set([W[2], W[6], W[10], W[14]], 0); F.set([W[0], W[4], W[8], W[12]], 4);   // view -> world z, then x (as the game's)
      F.set([ty * aspect, ty, cam.fov * Math.PI / 180, 0], 8);                      // the field of view: tan x, tan y, its angle
      F[16] = 24999.9; F[20] = 0.1; F[24] = 1 / 24999.9;                            // the depth (PS0) as street view keeps it: (distance - 0.1) / 24999.9
      F[26] = aspect; F[27] = 1 / aspect;
      F.set([size.x, size.y, 1 / size.x, 1 / size.y], 36);                          // the screen
      F.set([Wv[4], Wv[5], Wv[6], cam.position.y], 40);                             // up (world y) in view space; the camera's height
      F.set([Wv[0], Wv[1], Wv[2], 0], 76);                                          // world x in view space
      u.uf_remappedPS.value = floatsToInts(F);
      u.textureUnitPS0.value = this.game.depthFull ? this.game.depthFull.texture : u.textureUnitPS0.value;
      if(this.game.hdr2) u.textureUnitPS2.value = this.game.hdr2.texture;   // what's under the water: the last frame's picture (the game's too)
      u.zmViewToWorld.value.copy(cam.matrixWorld);
      var sh = this.view.sun && this.view.sun.shadow;
      if(sh && sh.map && this.view.sun.castShadow) {
        u.zmShadowMap.value = sh.map.texture; u.zmShadowMatrix.value.copy(sh.matrix); u.zmShadowBias.value = sh.bias;
        u.zmShadowSize.value.copy(sh.mapSize); u.zmShadowOn.value = 1;
      } else u.zmShadowOn.value = 0;
      var fine = lv.L > 0 ? T[lv.L - 1] : null;
      if(fine && fine.x0 != null) u.zmHole.value.set(fine.x0, fine.z0, fine.x0 + fine.size, fine.z0 + fine.size); else u.zmHole.value.set(0, 0, 0, 0);
    },

    dispose: function() {
      [this.data, this.nrm, this.emm].forEach(function(x) { if(x) x.dispose(); });
      if(this.levels) this.levels.forEach(function(lv) { lv.mesh.material.dispose(); lv.tmesh.material.dispose(); });
      if(this.levels) this.levels.forEach(function(lv) { lv.mesh.geometry.dispose(); });
    }
  };

  return { create: function(game, terrain) { return new Water(game, terrain); } };
})();
