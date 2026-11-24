// Street view drawn the way Breath of the Wild draws itself: the game's own
// shaders (images/3d/botw/streetview/gpu/, its GLSL from Cemu turned into WebGL
// 2 by dev/botw3d/tools/cemu_to_webgl.py, the maths untouched) with the
// constants the game gives them (gpu/constants.json, read from the running
// game; dev/botw3d/shader-notes.md has how).
//
// A frame, as the game's:
// 1. the G-buffer: every solid thing's colour (albedo), view-space normal (its
//    alpha a gloss), the sun's shadow, its glow (emission, which the light pass
//    adds to the lit colour) and depth (street view's own materials, each also
//    writing these);
// 2. the light pass (light_ps), at half resolution: each pixel lit by the
//    game's sun, sky and shadows (its output 3);
// 3. its depth-aware upsample to full resolution (upsample_ps);
// 4. the sky, where nothing else is (street view's scattering sky for now);
//    then what you see through (water) drawn over it, depth tested;
// 5. bloom: the game's bright pass (bright_ps), blurred;
// 6. the tone map (tonemap_ps), the bloom added, to the screen.
//
// The light pass reads the sky as a cube map array (six faces, in its own
// layout); it's filled from street view's sky when the time changes.
var ZStreetViewGame = (function() {
  var ROOT = 'images/3d/botw/streetview/gpu/';
  // The Sheikah's glow in the game's HDR where its mask is full: (0.025, 0.25, 1) x 36, read from
  // a frame capture by a shrine (reference glow-shrine; shader-notes.md). Only the materials whose
  // colour is that one (the shrines' entrances: uking_emission_color 205); the game's other glow
  // colours (its other indices) aren't measured yet, so those keep street view's own
  var SHEIKAH_GLOW = [0.9, 9, 36], SHEIKAH_GLOW_MATS = /^Mt_DgnObj_DungeonEntrance_/;

  // The water's full-screen pass's constants as the game had them at the pond (water-probe3): the depth's range,
  // the field of view, the cube's centre, the camera's rows, the sun, and (11, 12) its own
  var WATER_PS = [24999.332, 0, 0, 0, 0.66704, 25000, 0.00003, 0.99997, 0.82899, 0.46631, 0.87266, 0, 0.00037, 0.25728, -1.63928, 1,
    -0.69693, 0, 0.71714, -1561.9088, 0, 1, 0, -165.21107, 0.71714, 0, -0.69693, 1557.1387, -0.69693, 0, -0.71714, -638.8307,
    0, 1, 0, 660.84436, -0.71714, 0, -0.69693, 627.0769, -0.34139, -0.46052, -0.81943, 4, 0, 1, 0, 1, 1, 0, 1, 0, 3.59216, 2.1316, 2.1647, 16.00781];

  function floatsToInts(f) { return new Int32Array(new Float32Array(f).buffer); }
  function flat(rows) { return [].concat.apply([], rows); }

  function Game(view) {
    this.view = view; this.lib = view.lib; this.ready = false; this._skyDirty = true;
    this._grounds = []; this._waters = []; this._near = { value: 0 };   // street view's own ground meshes; the horizon's cut-out radius
  }
  Game.prototype = {
    load: function() {
      var game = this, get = function(n) { return fetch(ROOT + n).then(function(r) { if(!r.ok) throw new Error(n); return r.text(); }); };
      return Promise.all([get('light_ps.glsl'), get('upsample_ps.glsl'), get('tonemap_ps.glsl'), get('bright_ps.glsl'), get('constants.json'),
                          get('water_composite_ps.glsl')]).then(function(f) {
        if(!game.view.renderer) return;
        game.src = { light: f[0], upsample: f[1], tonemap: f[2], bright: f[3], water: f[5] }; game.C = JSON.parse(f[4]);
        game._build();
        game.ready = true;
        // the sky as the game makes it (its table shader and its sky shader, from its precomputed scattering);
        // street view's own until it's in, or with ?streetview-sky=own
        if(!/[?&]streetview-sky=own\b/.test(location.search)) {
          Promise.all([get('sky_lut_ps.glsl'), get('sky_ps.glsl'), fetch(ROOT + 'sky-inscatter.bin').then(function(r) { if(!r.ok) throw new Error('sky'); return r.arrayBuffer(); }),
                       get('sky-palettes.json')])
            .then(function(k) {
              if(!game.view.renderer) return;
              game.palettes = JSON.parse(k[3]);
              game._buildSky(k[0], k[1], k[2]);
              if(game.view.hour != null) game.view._setTime(game.view.hour);   // the sky now painted the game's way
            }).catch(function(e) { console.warn('Street view: the game\'s sky didn\'t load', e); });
        }
        // the ground as the game draws it (StreetViewTerrain.js); street view's own until it's in
        if(window.ZStreetViewTerrain && !/[?&]streetview-ground=own\b/.test(location.search)) {
          var t = ZStreetViewTerrain.create(game);
          t.load().then(function() {
            if(!game.view.renderer) return;
            game.terrain = t; game._grounds.forEach(game._hideGround, game);
            // the water as the game draws it (StreetViewWater.js), on the terrain's levels; street view's own until it's in
            if(window.ZStreetViewWater && !/[?&]streetview-water=own\b/.test(location.search)) {
              var w = ZStreetViewWater.create(game, t);
              return w.load().then(function() { if(!game.view.renderer) return; game.water = w; game._waters.forEach(game._hideWater, game); });
            }
          }).catch(function(e) { console.warn('Street view: the game\'s terrain or water didn\'t load', e); });
        }
      });
    },
    // Street view's own ground (the sections' terrain meshes): once the game's terrain draws, they
    // draw nothing (they stay for walking on, raycasts and the hills' shadows); the horizon's far
    // ground leaves out what the game's levels cover (zmNear)
    ground: function(o) {
      if(this._grounds.indexOf(o) < 0) this._grounds.push(o);
      if(this.terrain) this._hideGround(o);
    },
    // Street view's own water (the sections' and the horizon's): once the game's water draws, the sections'
    // draws nothing, and the horizon's only past the game's levels (its far lakes and sea)
    ownWater: function(o, horizon) {
      if(this._waters.indexOf(o) < 0) { o.userData.zmHorizonWater = !!horizon; this._waters.push(o); }
      if(this.water) this._hideWater(o);
    },
    _hideWater: function(o) {
      if(o.userData.zmHorizonWater) this.view._waterNear.value = 1950; else o.visible = false;
    },
    _hideGround: function(o) {
      (Array.isArray(o.material) ? o.material : [o.material]).forEach(function(m) { m.colorWrite = false; m.depthWrite = false; });
    },

    // Each solid material also writes the G-buffer: albedo (alpha: the surface
    // type, 0 as the game's ground), the view normal (alpha: a gloss, the game's
    // ground ~25 / 255, from roughness) and the sun's shadow.
    patch: function(m) {
      if(!m || m.userData.zmGame || !(m.isMeshStandardMaterial || m.isMeshLambertMaterial || m.isMeshPhongMaterial)) return;
      var prev = m.onBeforeCompile, key = m.customProgramCacheKey(), THREE = this.lib.THREE, near = this._near;
      m.onBeforeCompile = function(sh, r) {
        if(prev) prev.call(this, sh, r);
        // The Sheikah's lights (Map3D's glow masks): the game's own glow, its mask times the colour
        // the game gives them (uking_emission_color 205), as bright as the game's HDR has it
        var glow = this.userData.glow && this.emissiveMap && SHEIKAH_GLOW_MATS.test(this.name) ? SHEIKAH_GLOW : [0, 0, 0];
        sh.uniforms.zmGlow = { value: new THREE.Vector3(glow[0], glow[1], glow[2]) };
        sh.uniforms.zmNear = this.userData.zmHorizon ? near : { value: 0 };
        sh.fragmentShader = sh.fragmentShader
          .replace(/void main\(\)\s*\{/, 'void main() {\n\tif(length(vViewPosition) < zmNear) discard;')
          .replace('#include <common>', '#include <common>\nuniform vec3 zmGlow;\nuniform float zmNear;\nlayout(location = 1) out highp vec4 zmAlbedo;\nlayout(location = 2) out highp vec4 zmNormal;\nlayout(location = 3) out highp vec4 zmShadow;\nlayout(location = 4) out highp vec4 zmEmissive;')
          .replace(/}\s*$/, [
            // albedo; its alpha's bit 0 tells the light pass to add the emission (PS4) to the lit colour
            // (1.5 / 255: it reads int(alpha * 255), and 1 / 255 in half float comes back as 0.9996)
            '\tzmAlbedo = vec4(diffuseColor.rgb, 1.5 / 255.0);',
            '\tvec3 zmE = totalEmissiveRadiance;',
            '\tif(zmGlow.z > 0.0) { float zmMax = max(emissive.r, max(emissive.g, emissive.b)); zmE = zmGlow * (zmMax > 0.0 ? max(zmE.r, max(zmE.g, zmE.b)) / zmMax : 0.0); }',
            '\tzmEmissive = vec4(zmE, 1.0);',
            '\tfloat zmRough = 1.0;',
            '\t#if defined( STANDARD ) || defined( PHYSICAL )\n\tzmRough = roughnessFactor;\n\t#endif',
            '\tzmNormal = vec4(normalize(normal) * 0.5 + 0.5, 0.1 + (1.0 - zmRough) * 0.6);',
            '\tfloat zs = 1.0;',
            '\t#if defined( USE_SHADOWMAP ) && NUM_DIR_LIGHT_SHADOWS > 0',
            '\tzs = getShadow( directionalShadowMap[ 0 ], directionalLightShadows[ 0 ].shadowMapSize, directionalLightShadows[ 0 ].shadowBias, directionalLightShadows[ 0 ].shadowRadius, vDirectionalShadowCoord[ 0 ] );',
            '\t#endif',
            // the shadow mask: the sun's shadow in x and w (the light pass blends them), z another
            // occlusion (the game's 1 where lit; shadow there darkened the shade twice)
            '\tzmShadow = vec4(zs, 1.0, 1.0, zs);',
            '}'].join('\n'));
      };
      m.customProgramCacheKey = function() { return 'zmgame6|' + (this.userData.glow && SHEIKAH_GLOW_MATS.test(this.name) ? 'glow|' : '') + (this.userData.zmHorizon ? 'hz|' : '') + key; };
      m.userData.zmGame = true; m.needsUpdate = true;
    },
    // A mesh street view adds: what you see through (water) is drawn after the
    // light pass, over it (layer 1), the rest goes into the G-buffer (layer 0).
    adopt: function(o) {
      (Array.isArray(o.material) ? o.material : [o.material]).forEach(this.patch, this);
      var m = Array.isArray(o.material) ? o.material[0] : o.material;
      if(m && m.transparent) o.layers.set(1);
    },
    skyChanged: function() { this._skyDirty = true; },

    _build: function() {
      var THREE = this.lib.THREE, v = this.view, game = this;
      this.quadCam = new THREE.OrthographicCamera(-1, 1, 1, -1, 0, 1);
      var geo = new THREE.PlaneGeometry(2, 2);
      this._quad = function(mat) { var s = new THREE.Scene(); s.add(new THREE.Mesh(geo, mat)); return s; };
      var solid = function(r, g, b, a) { var t = new THREE.DataTexture(new Float32Array([r, g, b, a]), 1, 1, THREE.RGBAFormat, THREE.FloatType); t.needsUpdate = true; return t; };
      var noise = new Uint8Array(64 * 64 * 4); for(var i = 0; i < noise.length; i++) noise[i] = Math.random() * 255;
      this.noise = new THREE.DataTexture(noise, 64, 64); this.noise.wrapS = this.noise.wrapT = THREE.RepeatWrapping; this.noise.needsUpdate = true;
      // the sky's cube map array (filled in _cube)
      this.face = new THREE.WebGLRenderTarget(64, 64, { type: THREE.HalfFloatType, depthBuffer: false });
      this.cubeData = new Uint16Array(64 * 64 * 4 * 6);
      this.cubeTex = new THREE.DataArrayTexture(this.cubeData, 64, 64, 6);
      this.cubeTex.type = THREE.HalfFloatType; this.cubeTex.format = THREE.RGBAFormat;
      this.cubeTex.generateMipmaps = true; this.cubeTex.minFilter = THREE.LinearMipmapLinearFilter; this.cubeTex.magFilter = THREE.LinearFilter;
      this.cubeMat = new THREE.ShaderMaterial({
        uniforms: { tSky: { value: v._skyRT.texture }, uFace: { value: 0 } },
        vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
        // the light pass looks up the world direction (x, y, -z), on face 0..5 = +a -a +b -b +c -c,
        // at minor / 2|major| + 0.5
        fragmentShader: [
          'uniform sampler2D tSky; uniform int uFace; varying vec2 vUv;',
          'void main() {',
          '  vec2 m = (vUv - 0.5) * 2.0; vec3 d;',
          '  if(uFace == 0) d = vec3(1.0, m.x, m.y); else if(uFace == 1) d = vec3(-1.0, m.x, m.y);',
          '  else if(uFace == 2) d = vec3(m.x, 1.0, m.y); else if(uFace == 3) d = vec3(m.x, -1.0, m.y);',
          '  else if(uFace == 4) d = vec3(m.x, m.y, 1.0); else d = vec3(m.x, m.y, -1.0);',
          '  vec3 w = normalize(vec3(d.x, d.y, -d.z)); w.y = max(w.y, 0.0);',
          '  gl_FragColor = vec4(texture2D(tSky, vec2(atan(w.z, w.x) * 0.1591549 + 0.5, asin(clamp(w.y, -1.0, 1.0)) * 0.3183099 + 0.5)).rgb, 1.0);',
          '}'].join('\n')
      });
      this.cubeScene = this._quad(this.cubeMat);
      // linear depth, as the game keeps it: (view distance - 0.1) / 24999.9
      this.depthMat = new THREE.ShaderMaterial({
        uniforms: { tDepth: { value: null }, uNear: { value: 0 }, uFar: { value: 0 } },
        vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
        fragmentShader: 'uniform sampler2D tDepth; uniform float uNear, uFar; varying vec2 vUv;' +
          'void main() { float d = texture2D(tDepth, vUv).x; float z = uNear * uFar / (uFar - d * (uFar - uNear));' +
          ' gl_FragColor = vec4((z - 0.1) / 24999.9, 0.0, 0.0, 1.0); }'
      });
      this.depthScene = this._quad(this.depthMat);
      var raw = function(uniforms, vs, src) {
        return new THREE.RawShaderMaterial({ glslVersion: THREE.GLSL3, uniforms: uniforms, depthTest: false, depthWrite: false,
          vertexShader: vs, fragmentShader: src.replace(/^#version 300 es\n/, '') });
      };
      // the light pass: Sem0 = (u, v, the camera ray), Sem6 = (u, u, u, v), Sem2 from its vertex shader
      this.lightU = {
        uf_remappedPS: { value: floatsToInts(flat(this.C.light)) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
        uP: { value: new THREE.Vector2() }, uSem2: { value: new THREE.Vector4().fromArray(this.C.light_sem2) },
        textureUnitPS0: { value: this.noise }, textureUnitPS2: { value: null }, textureUnitPS3: { value: null },
        // PS5: the sun's visibility under the clouds (the light pass multiplies the sun by it, through
        // the game's projector, C[22..24]). The game's is made while it runs (not the clouds' shadow
        // texture as it is: that came out far too dark), so none for now.
        textureUnitPS4: { value: solid(0, 0, 0, 1) }, textureUnitPS5: { value: solid(1, 1, 1, 1) },
        textureUnitPS6: { value: null }, textureUnitPS7: { value: this.cubeTex }, textureUnitPS11: { value: solid(0, 0, 0, 0) },
        textureUnitPS12: { value: solid(0, 0, 0, 1) }, textureUnitPS14: { value: null }, textureUnitPS15: { value: solid(0, 0, 0, 1) },
        textureUnitPS17: { value: solid(0, 0, 0, 0) }
      };
      this.lightScene = this._quad(raw(this.lightU, [
        'in vec3 position; in vec2 uv; uniform vec2 uP; uniform vec4 uSem2;',
        'out vec4 passParameterSem0; out vec4 passParameterSem2; out vec4 passParameterSem6;',
        'void main() {',
        '  float vd = 1.0 - uv.y;',   // the game's v runs down the screen
        '  passParameterSem0 = vec4(uv.x, uv.y, -(2.0 * uv.x - 1.0) / uP.x, (2.0 * vd - 1.0) / uP.y);',
        '  passParameterSem2 = uSem2; passParameterSem6 = vec4(uv.x, uv.x, uv.x, uv.y);',
        '  gl_Position = vec4(position.xy, 0.0, 1.0);',
        '}'].join('\n'), this.src.light));
      // the upsample: Sem0 = (u, v, u, v at half resolution)
      this.upU = { uf_remappedPS: { value: null }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) }, uHalf: { value: new THREE.Vector2() },
                   textureUnitPS0: { value: null }, textureUnitPS1: { value: null }, textureUnitPS2: { value: null } };
      this.upScene = this._quad(raw(this.upU, 'in vec3 position; in vec2 uv; uniform vec2 uHalf; out vec4 passParameterSem0;' +
        ' void main() { passParameterSem0 = vec4(uv, uv * uHalf); gl_Position = vec4(position.xy, 0.0, 1.0); }', this.src.upsample));
      // the water's full-screen pass (2e2543216c04766d, water_composite_ps.glsl): over the water, the light through
      // it plus the sky's reflection, times the light pass's output 0, plus the lit surface (output 3). Its vertex
      // shader (4721609a) as a quad: Sem0 = (u, v, the camera ray), Sem4 = (u, v at half resolution + 0.5,
      // a half-resolution texel), Sem6.zw = (u, v)
      this.waterU = {
        uf_remappedPS: { value: null }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) }, uP: { value: new THREE.Vector2() }, uHalf: { value: new THREE.Vector2() },
        textureUnitPS1: { value: null }, textureUnitPS2: { value: null }, textureUnitPS4: { value: null }, textureUnitPS6: { value: null },
        textureUnitPS7: { value: null }, textureUnitPS8: { value: this.cubeTex }, textureUnitPS10: { value: null }, textureUnitPS11: { value: null },
        textureUnitPS13: { value: null }
      };
      this.waterScene = this._quad(raw(this.waterU, [
        'in vec3 position; in vec2 uv; uniform vec2 uP; uniform vec2 uHalf;',
        'out vec4 passParameterSem0; out vec4 passParameterSem4; out vec4 passParameterSem6;',
        'void main() {',
        '  float vd = 1.0 - uv.y;',
        '  passParameterSem0 = vec4(uv.x, uv.y, -(2.0 * uv.x - 1.0) / uP.x, (2.0 * vd - 1.0) / uP.y);',
        '  passParameterSem4 = vec4(uv * uHalf + 0.5, 1.0 / uHalf);',
        '  passParameterSem6 = vec4(0.0, 0.0, uv.x, uv.y);',
        '  gl_Position = vec4(position.xy, 0.0, 1.0);',
        '}'].join('\n'), this.src.water));
      // the sky where nothing else is
      this.skyMat = new THREE.ShaderMaterial({
        uniforms: { tLit: { value: null }, tSky: { value: null }, tDepth: { value: null } }, depthTest: false, depthWrite: false,
        vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
        fragmentShader: 'uniform sampler2D tLit, tSky, tDepth; varying vec2 vUv; void main() {' +
          ' gl_FragColor = texture2D(tDepth, vUv).x > 0.3 ? texture2D(tSky, vUv) : texture2D(tLit, vUv); }'
      });
      this.skyScene = this._quad(this.skyMat);
      // bloom: the game's bright pass (a 2 x 2 block of the HDR image: Sem0, Sem1 its four taps),
      // at half resolution; then a blur to quarter (the game's own blur passes aren't known yet:
      // a gaussian, horizontal then vertical), which the tone map adds
      this.brightU = { uf_remappedPS: { value: floatsToInts(flat(this.C.bright)) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
                       uTexel: { value: new THREE.Vector2() }, textureUnitPS0: { value: null } };
      this.brightScene = this._quad(raw(this.brightU, 'in vec3 position; in vec2 uv; uniform vec2 uTexel; out vec4 passParameterSem0; out vec4 passParameterSem1;' +
        ' void main() { vec2 h = uTexel * 0.5; passParameterSem0 = vec4(uv - h, uv + vec2(h.x, -h.y)); passParameterSem1 = vec4(uv + vec2(-h.x, h.y), uv + h);' +
        ' gl_Position = vec4(position.xy, 0.0, 1.0); }', this.src.bright));
      this.blurMat = new THREE.ShaderMaterial({
        uniforms: { tSrc: { value: null }, uStep: { value: new THREE.Vector2() } }, depthTest: false, depthWrite: false,
        vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
        fragmentShader: 'uniform sampler2D tSrc; uniform vec2 uStep; varying vec2 vUv; void main() {' +
          ' vec4 c = texture2D(tSrc, vUv) * 0.2270270;' +
          ' c += (texture2D(tSrc, vUv + uStep * 1.3846154) + texture2D(tSrc, vUv - uStep * 1.3846154)) * 0.3162162;' +
          ' c += (texture2D(tSrc, vUv + uStep * 3.2307692) + texture2D(tSrc, vUv - uStep * 3.2307692)) * 0.0702703;' +
          ' gl_FragColor = c; }'
      });
      this.blurScene = this._quad(this.blurMat);
      // the tone map: PS0 bloom, PS1 the HDR image
      this.toneU = { uf_remappedPS: { value: floatsToInts(flat(this.C.tonemap)) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
                     textureUnitPS0: { value: solid(0, 0, 0, 1) }, textureUnitPS1: { value: null } };
      this.toneScene = this._quad(raw(this.toneU, 'in vec3 position; in vec2 uv; out vec4 passParameterSem0;' +
        // (Sem0.w passes through as the alpha: the game's is 0, which its 10-bit output ignores;
        // a page's canvas would show nothing, so 1)
        ' void main() { passParameterSem0 = vec4(uv, 0.0, 1.0); gl_Position = vec4(position.xy, 0.0, 1.0); }',
        // The tone map's output is linear; the Wii U's video out shows it sRGB-encoded (checked
        // against Cemu's own window: the game's final image, encoded, matches it to ~5 levels of
        // 255; shown as is, it's far darker and more saturated). So encode it, as the console does.
        this.src.tonemap.replace(/passPixelColor0 = (vec4\([^;]*\));\s*}\s*$/,
          'passPixelColor0 = $1;\npassPixelColor0.rgb = mix(1.055 * pow(clamp(passPixelColor0.rgb, 0.0, 1.0), vec3(1.0 / 2.4)) - 0.055, 12.92 * passPixelColor0.rgb, vec3(lessThanEqual(passPixelColor0.rgb, vec3(0.0031308))));\n}\n')));
      var size = v.renderer.getSize(new THREE.Vector2());
      this.resize(size.x, size.y);
      // every light lights both layers (the solid things and what you see through)
      v.scene.traverse(function(o) { if(o.isLight) o.layers.enableAll(); });
      if(v.skyDome) v.skyDome.layers.set(2);
      v.scene.traverse(function(o) { if(o.isMesh && o !== v.skyDome) game.adopt(o); });
    },

    // Sizes: full resolution the screen's (in CSS pixels), the light pass half.
    resize: function(w, h) {
      if(!this.quadCam) return;
      var THREE = this.lib.THREE, W = Math.max(2, Math.round(w)), H = Math.max(2, Math.round(h)), HW = W >> 1, HH = H >> 1;
      if(this.W === W && this.H === H) return;
      this.W = W; this.H = H;
      ['gbuf', 'depth', 'depthFull', 'out', 'hdr', 'hdr2', 'waterT', 'bright', 'bloomA', 'bloomB'].forEach(function(k) { if(this[k]) this[k].dispose(); }, this);
      this.gbuf = new THREE.WebGLMultipleRenderTargets(W, H, 5, { type: THREE.HalfFloatType });
      this.gbuf.depthTexture = new THREE.DepthTexture(W, H); this.gbuf.depthTexture.type = THREE.FloatType;
      this.depth = new THREE.WebGLRenderTarget(HW, HH, { type: THREE.FloatType, depthBuffer: false });
      this.depthFull = new THREE.WebGLRenderTarget(W, H, { type: THREE.FloatType, depthBuffer: false });
      this.out = new THREE.WebGLMultipleRenderTargets(HW, HH, 5, { type: THREE.HalfFloatType, depthBuffer: false });
      this.hdr = new THREE.WebGLRenderTarget(W, H, { type: THREE.HalfFloatType, depthBuffer: false });
      this.hdr2 = new THREE.WebGLRenderTarget(W, H, { type: THREE.HalfFloatType, depthTexture: this.gbuf.depthTexture });   // shares the G-buffer's depth (water is tested against it)
      this.bright = new THREE.WebGLRenderTarget(HW, HH, { type: THREE.HalfFloatType, depthBuffer: false });
      this.waterT = new THREE.WebGLRenderTarget(W, H, { type: THREE.HalfFloatType, depthTexture: this.gbuf.depthTexture });   // the light through the water (alpha: water here)
      var WU = this.waterU;
      WU.textureUnitPS1.value = this.gbuf.texture[1]; WU.textureUnitPS2.value = this.gbuf.texture[2]; WU.textureUnitPS4.value = this.depthFull.texture;
      WU.textureUnitPS6.value = this.depth.texture; WU.textureUnitPS7.value = this.out.texture[4]; WU.textureUnitPS10.value = this.waterT.texture;
      WU.textureUnitPS11.value = this.out.texture[0]; WU.textureUnitPS13.value = this.out.texture[3]; WU.uHalf.value.set(HW, HH);
      var QW = Math.max(1, W >> 2), QH = Math.max(1, H >> 2);
      this.bloomA = new THREE.WebGLRenderTarget(QW, QH, { type: THREE.HalfFloatType, depthBuffer: false });
      this.bloomB = new THREE.WebGLRenderTarget(QW, QH, { type: THREE.HalfFloatType, depthBuffer: false });
      this.brightU.textureUnitPS0.value = this.hdr2.texture; this.brightU.uTexel.value.set(1 / W, 1 / H);
      this.toneU.textureUnitPS0.value = this.bloomB.texture;
      this.sky = this.sky || new THREE.WebGLRenderTarget(W, H, { type: THREE.HalfFloatType });
      this.sky.setSize(W, H);
      var L = this.lightU; L.textureUnitPS2.value = this.gbuf.texture[1]; L.textureUnitPS3.value = this.gbuf.texture[2];
      L.textureUnitPS6.value = this.depth.texture; L.textureUnitPS14.value = this.gbuf.texture[3]; L.textureUnitPS4.value = this.gbuf.texture[4];
      this.depthMat.uniforms.tDepth.value = this.gbuf.depthTexture;
      var up = this.C.upsample.map(function(r) { return r.slice(); });
      up[2] = [HW, HH, 1 / HW, 1 / HH];   // the half resolution, as the game gives it
      this.upU.uf_remappedPS.value = floatsToInts(flat(up)); this.upU.uHalf.value.set(HW, HH);
      this.upU.textureUnitPS0.value = this.out.texture[3]; this.upU.textureUnitPS1.value = this.depthFull.texture; this.upU.textureUnitPS2.value = this.depth.texture;
      this.skyMat.uniforms.tLit.value = this.hdr.texture; this.skyMat.uniforms.tSky.value = this.sky.texture; this.skyMat.uniforms.tDepth.value = this.depthFull.texture;
      this.toneU.textureUnitPS1.value = this.hdr2.texture;
    },

    // The sky into the light pass's cube (three r160 can't draw into one layer
    // of an array target: each face drawn into a plain target and read back).
    // The game's sky (shader-notes.md, "The sky"): the table of the sky's light for every angle to the sun and
    // height above the horizon, for the sun's height now (sky_lut_ps: 250cb5a0, from the game's precomputed 3D
    // scattering table), and the sky's colour in any direction from it (sky_ps: 4e21d093, what the game fills its
    // sky cube with). The table is also the light pass's haze (its PS11).
    _buildSky: function(lutSrc, skySrc, inscatter) {
      var THREE = this.lib.THREE;
      var tex = new THREE.Data3DTexture(new Uint16Array(inscatter), 256, 32, 16);
      tex.type = THREE.HalfFloatType; tex.format = THREE.RGBAFormat;
      tex.minFilter = tex.magFilter = THREE.LinearFilter; tex.wrapS = tex.wrapT = tex.wrapR = THREE.ClampToEdgeWrapping;
      tex.unpackAlignment = 1; tex.needsUpdate = true;
      this.skyTable = tex;
      this.skyLut = new THREE.WebGLRenderTarget(256, 256, { type: THREE.HalfFloatType, depthBuffer: false, minFilter: THREE.LinearFilter, magFilter: THREE.LinearFilter });
      var raw = function(uniforms, vs, src) {
        return new THREE.RawShaderMaterial({ glslVersion: THREE.GLSL3, uniforms: uniforms, depthTest: false, depthWrite: false,
          vertexShader: vs, fragmentShader: src.replace(/^#version 300 es\n/, '') });
      };
      // its vertex shader (2e5c98a2): the camera's distance from the planet's centre (6360 km + 60 km x uAlt), the
      // horizon's angle from there, and where the ground cuts the table off
      this.skyLutU = { uf_remappedPS: { value: floatsToInts(flat(this.C.sky_lut)) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
                       textureUnitPS0: { value: tex }, uAlt: { value: 0 }, uVS1w: { value: 1 / 256 }, uVS2x: { value: 0 } };   // (uVS1w: the horizon cut, as the game's: its Sem3.x = 1 / 256 - the horizon's angle)
      this.skyLutScene = this._quad(raw(this.skyLutU, [
        'in vec3 position; uniform float uAlt, uVS1w, uVS2x;',
        'out vec4 passParameterSem0; out vec4 passParameterSem2; out vec4 passParameterSem3;',
        'void main() {',
        '  float r = 60.0 * min(max(uAlt, 0.0001), 0.9999) + 6360.0, q = 6360.0 / r, h = -sqrt(clamp(1.0 - q * q, 0.0, 1.0));',
        '  passParameterSem0 = vec4(r, h, h, h); passParameterSem2 = vec4(h); passParameterSem3 = vec4(uVS2x == 0.0 ? uVS1w + h : -1.0, h, h, h);',
        '  gl_Position = vec4(position.xy, 0.0, 1.0);',
        '}'].join('\n'), lutSrc));
      // the sky panorama (street view's, StreetView.js _sky: its dome and the sky cube read it), a direction a texel
      // (three's panorama layout, as street view's own sky draws it)
      this.skyU = { uf_remappedPS: { value: floatsToInts(flat(this.C.sky)) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
                    textureUnitPS0: { value: this.skyLut.texture } };
      // (the direction made per pixel, in place of the game's interpolated Sem6: a panorama's corners are its poles)
      var skyPS = skySrc.replace('in vec4 passParameterSem6;', 'in vec2 zmUv;')
        .replace('R0f = passParameterSem6;', 'float zmAz = (zmUv.x - 0.5) * 6.2831853, zmEl = (zmUv.y - 0.5) * 3.14159265;\n' +
                 'R0f = vec4(cos(zmEl) * cos(zmAz), sin(zmEl), cos(zmEl) * sin(zmAz), 0.0);');
      if(skyPS.indexOf('zmUv;') < 0 || skyPS.indexOf('R0f = vec4(cos(zmEl)') < 0) throw new Error('sky_ps.glsl: its input not found');
      this.skyPaintScene = this._quad(raw(this.skyU, [
        'in vec3 position; in vec2 uv; out vec2 zmUv;',
        'void main() { zmUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }'].join('\n'), skyPS));
      this.lightU.textureUnitPS11.value = this.skyLut.texture;
    },

    // The sky's constants for where the sun is: the game's environment palettes (gpu/sky-palettes.json, from
    // WorldMgr/normal.bwinfo), set 0 (the Great Plateau's clear sky), the time slots blended by the sun's height
    // as the game blends them (probed through a day: shader-notes.md, "The sky"), morning while the sun is in the
    // east (+x), afternoon in the west. Each range [sun height from, to, slot from, slot to]; between, one slot.
    // (Morning 2 -> 3 not probed: the afternoon's 3 -> 4 mirrored, as 1 -> 2 mirrors 4 -> 5.)
    _palette: function(s) {
      var P = this.palettes, set = P.sets[0], y = s[1];
      var R = s[0] > 0 ? [[-1, 0.0034, 0, 0], [0.0034, 0.1804, 0, 1], [0.1804, 0.336, 1, 1], [0.336, 0.467, 1, 2], [0.467, 0.540, 2, 2], [0.540, 0.614, 2, 3], [0.614, 2, 3, 3]]
                       : [[0.614, 2, 3, 3], [0.540, 0.614, 4, 3], [0.459, 0.540, 4, 4], [0.340, 0.459, 5, 4], [-1, 0.340, 5, 5]];
      var g = R.filter(function(q) { return y >= q[0] && y <= q[1]; })[0] || R[R.length - 1];
      var t = g[2] === g[3] ? 0 : (y - g[0]) / (g[1] - g[0]), a = P.palettes[set[g[2]]], b = P.palettes[set[g[3]]];
      var m = function(i) { return a[i] + (b[i] - a[i]) * t; };
      var w = m(5);   // (the colour and its strength each blended: the probe's 7 PM sun, 0.607 x 13.3, is that)
      return { c7: m(0), c9: m(1), c10: [m(2) * w, m(3) * w, m(4) * w] };
    },

    // At an hour (StreetView.js _setTime): the sky's table for the sun's height, then the sky panorama from it.
    // s: toward the sun (world); alt: the camera's height (m). At night (the sun under the horizon) the game draws
    // its sky another way (not ported): street view's own sky stays.
    paintSky: function(rt, s, alt) {
      if(!this.skyLut || s[1] < 0) return false;
      var r = this.view.renderer, keep = r.getRenderTarget(), c = flat(this.C.sky_lut), k = flat(this.C.sky);
      c[4] = s[1];                                       // C1.x: the sun's height
      if(this.palettes) {
        var pal = this._palette(s);
        c[28] = pal.c7; c[36] = pal.c9; c[40] = pal.c10[0]; c[41] = pal.c10[1]; c[42] = pal.c10[2];
      }
      this.skyLutU.uf_remappedPS.value = floatsToInts(c);
      this.skyLutU.uAlt.value = Math.max(0, alt || 0) / 60000;
      r.setRenderTarget(this.skyLut); r.render(this.skyLutScene, this.quadCam);
      k[0] = s[0]; k[1] = s[1]; k[2] = s[2];             // C0: toward the sun
      this.skyU.uf_remappedPS.value = floatsToInts(k);
      r.setRenderTarget(rt); r.render(this.skyPaintScene, this.quadCam);
      r.setRenderTarget(keep);
      return true;
    },

    _cube: function() {
      var r = this.view.renderer, gl = r.getContext();
      for(var f = 0; f < 6; f++) {
        this.cubeMat.uniforms.uFace.value = f; r.setRenderTarget(this.face); r.render(this.cubeScene, this.quadCam);
        gl.readPixels(0, 0, 64, 64, gl.RGBA, gl.HALF_FLOAT, this.cubeData.subarray(f * 64 * 64 * 4, (f + 1) * 64 * 64 * 4));
      }
      this.cubeTex.needsUpdate = true; this._skyDirty = false;
    },

    // Street view's camera and sun into the game's constants: camera to world in
    // C[2..4] (and C[8], C[5], C[6], the sky cube's lookup), world to camera in
    // C[11], C[12], C[14], the sun's (or moon's) light in view space and its strength in C[15],
    // its colour in C[32].
    _constants: function() {
      var THREE = this.lib.THREE, v = this.view, cam = v.camera, c = flat(this.C.light), mw = cam.matrixWorld.elements, mi = cam.matrixWorldInverse.elements;
      for(var r = 0; r < 3; r++) {
        var row = [mw[r], mw[4 + r], mw[8 + r], mw[12 + r]];
        c.splice((2 + r) * 4, 4, row[0], row[1], row[2], row[3]);
        c.splice([8, 5, 6][r] * 4, 4, row[0], row[1], row[2], row[3]);
      }
      [[11, 0], [12, 1], [14, 2]].forEach(function(p) { c.splice(p[0] * 4, 4, mi[p[1]], mi[4 + p[1]], mi[8 + p[1]], mi[12 + p[1]]); });
      // The light street view works out for the hour (StreetView.js _setTime): the sun, reddened
      // as it sets, or the moon at night. At noon its 1.8 is the game's 9 (x 0.2), and its colour the
      // game's dir_main: C[32] then is the game's own (9, 8.29, 6.74).
      var Ld = v._light || { x: 0, y: 1, z: 0 }, d = new THREE.Vector3(-Ld.x, -Ld.y, -Ld.z).transformDirection(cam.matrixWorldInverse);
      var f = v.sun.intensity / 0.2, sc = v.sun.color;
      c.splice(15 * 4, 4, d.x, d.y, d.z, f);
      c.splice(32 * 4, 3, sc.r * f, sc.g * f, sc.b * f);
      this.lightU.uf_remappedPS.value = floatsToInts(c);
      this.lightU.uP.value.set(cam.projectionMatrix.elements[0], cam.projectionMatrix.elements[5]);
      // the water's full-screen pass: the game's constants (read with the water probe at the pond, water-probe3),
      // the camera's and the sun's made here as the light pass's are
      var w = WATER_PS.slice(), set = function(i, a) { w.splice(i * 4, 4, a[0], a[1], a[2], a[3]); };
      var ty = Math.tan(cam.fov * Math.PI / 360);
      set(0, [24999.9, 0, 0, 0]); w[4] = 0.1;                                       // the depth (PS4) as street view keeps it
      set(2, [ty * cam.aspect, ty, cam.fov * Math.PI / 180, 0]);
      set(3, [0, 0, 0, 1]);                                                           // where the sky cube was made, in view space (the camera)
      [4, 5, 9].forEach(function(i, r) { set(i, [mi[r], mi[4 + r], mi[8 + r], mi[12 + r]]); });   // world -> view
      [6, 7, 8].forEach(function(i, k) { var r = [2, 0, 1][k]; set(i, [mw[r], mw[4 + r], mw[8 + r], mw[12 + r]]); });   // view -> world z, x, y
      set(10, c.slice(15 * 4, 16 * 4));                                               // the sun in view space, its strength
      set(13, [c[32 * 4], c[32 * 4 + 1], c[32 * 4 + 2], 16]);                         // its colour
      this.waterU.uf_remappedPS.value = floatsToInts(w);
      this.waterU.uP.value.copy(this.lightU.uP.value);
    },

    // A frame, to target (null: the screen).
    render: function(target) {
      var v = this.view, r = v.renderer, cam = v.camera, auto = r.autoClear, mask = cam.layers.mask;
      if(this._skyDirty) this._cube();
      cam.updateMatrixWorld();
      // 1. the G-buffer (and the sun's shadow map, once)
      r.shadowMap.autoUpdate = false; r.shadowMap.needsUpdate = true;
      cam.layers.set(0);
      r.setRenderTarget(this.gbuf); r.clear(); r.render(v.scene, cam);
      r.autoClear = false;
      // the ground, the game's terrain shaders on its clipmap (StreetViewTerrain.js), into the same G-buffer
      this._near.value = this.terrain ? 1950 : 0;
      if(this.terrain) { this.terrain.update(cam); r.render(this.terrain.scene, cam); }
      this.depthMat.uniforms.uNear.value = cam.near; this.depthMat.uniforms.uFar.value = cam.far;
      // the water (StreetViewWater.js), over the ground: its pixel shader reads the depth of what's under it
      // (the linear depth, as the game's), so that first, then again with the water in for the light pass
      if(this.water) {
        r.setRenderTarget(this.depthFull); r.render(this.depthScene, this.quadCam);
        this.water.update(cam);
        r.setRenderTarget(this.gbuf); r.render(this.water.scene, cam);
        // its light through the water, on its own (cleared: alpha 0 where there's no water)
        var cc = r.getClearColor(this._cc || (this._cc = new this.lib.THREE.Color())), ca = r.getClearAlpha();
        r.setRenderTarget(this.waterT); r.setClearColor(0x000000, 0); r.clearColor(); r.setClearColor(cc, ca);
        r.render(this.water.through, cam);
      }
      r.setRenderTarget(this.depth); r.render(this.depthScene, this.quadCam);
      r.setRenderTarget(this.depthFull); r.render(this.depthScene, this.quadCam);
      // 2, 3. the light pass and its upsample
      this._constants();
      r.setRenderTarget(this.out); r.render(this.lightScene, this.quadCam);
      r.setRenderTarget(this.hdr); r.render(this.upScene, this.quadCam);
      if(this.water) r.render(this.waterScene, this.quadCam);   // the water's full-screen pass, over the water
      // 4. the sky where nothing else is, then what you see through, over it
      if(v.skyDome) { cam.layers.set(2); r.setRenderTarget(this.sky); r.clear(); r.render(v.scene, cam); }
      r.setRenderTarget(this.hdr2); r.render(this.skyScene, this.quadCam);
      cam.layers.set(1); r.render(v.scene, cam);
      // 5. bloom: the bright pass, blurred
      r.setRenderTarget(this.bright); r.render(this.brightScene, this.quadCam);
      this.blurMat.uniforms.tSrc.value = this.bright.texture; this.blurMat.uniforms.uStep.value.set(1 / this.bloomA.width, 0);
      r.setRenderTarget(this.bloomA); r.render(this.blurScene, this.quadCam);
      this.blurMat.uniforms.tSrc.value = this.bloomA.texture; this.blurMat.uniforms.uStep.value.set(0, 1 / this.bloomA.height);
      r.setRenderTarget(this.bloomB); r.render(this.blurScene, this.quadCam);
      // 6. the tone map
      r.setRenderTarget(target || null); r.render(this.toneScene, this.quadCam);
      r.autoClear = auto; cam.layers.mask = mask; r.shadowMap.autoUpdate = true;
    },

    dispose: function() {
      ['gbuf', 'depth', 'depthFull', 'out', 'hdr', 'hdr2', 'sky', 'face', 'bright', 'bloomA', 'bloomB'].forEach(function(k) { if(this[k]) this[k].dispose(); }, this);
      if(this.cubeTex) this.cubeTex.dispose();
      if(this.terrain) this.terrain.dispose();
      if(this.water) this.water.dispose();
    }
  };

  return { create: function(view) { return new Game(view); } };
})();
