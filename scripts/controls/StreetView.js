// Street view: stand anywhere the game's world is built (staff only while
// it's built, BotW's Great Plateau first) and look around, from any marker's
// page or a dropped pin. The world is the game's own, by its 1 km map
// sections (images/3d/botw/streetview/<section>.glb: terrain, ground, water
// and everything that stands there, in the game's own coordinates;
// dev/botw3d/tools/build_streetview.py), drawn as the 3D maps are
// (Map3D.js: its three.js, its look, its game materials).
//
// Where to stand: for what a ray down can't find by itself, the game's own
// place (viewpoints.json: in front of a shrine or chest, a tower's top, the
// Shrine of Resurrection's chamber); anywhere else, the first surface below
// the spot, ground or roof, at Link's eye height.
//
// Drag to look round, scroll or pinch to zoom; arrow keys or WASD walk
// (Shift runs), double-click or double-tap to walk to a spot. The map's
// markers stand in it, their pages a click away.
var ZStreetView = (function() {
  // By the 2D map's version (submap): where its world is, and the game's
  // coordinates for a point on the 2D map.
  var WORLDS = {
    1901: { root: 'images/3d/botw/streetview/', toGame: function(ll) { return { x: (ll.lng - 128) * 64, z: -(ll.lat + 128) * 64 }; },
            toMap: function(x, z) { return { lng: x / 64 + 128, lat: -z / 64 - 128 }; } }
  };
  var EYE = 1.7, WALK = 6, RUN = 16, NEAR = 1500;
  // The game's own light for the field (env.json, built from the game's
  // Env/env.sgenvb by dev/botw3d/tools/build_env_params.py): these until it loads.
  var ENV = {
    sun: { DiffuseColor: [1, 0.922, 0.749], Intensity: 9 },
    hemisphere: { SkyColor: [0.84, 0.84, 0.96], GroundColor: [0.47, 0.35, 0.25], Intensity: 1 },
    sky: { sun_color: [1, 0.86, 0.68, 18], rayleigh_base_height: 24, mie_base_height: 2, mie_scattering_coeff: 0.00183,
           mie_amplifier_rendering: 8, rayleigh_amplifier_rendering: 1, mie_symmetrical_prop_rendering: 0.85,
           adhoc_fog_near: -500, adhoc_fog_far: 4640, adhoc_fog_atten_grd: 4, adhoc_fog_color: [0.51, 0.399, 0.285], amplifier_for_envmap: 2 },
    color: { saturation: 1.175 }
  };
  // The sky as the game makes it: sunlight scattered by the air (Rayleigh)
  // and its haze (Mie), along each line of sight, with the game's heights,
  // coefficients and sun. The game's heights are in thirds of a kilometre
  // (Rayleigh's 24 is the usual 8 km). The same maths in GLSL (the sky) and
  // here (the light's colours, _atmo).
  var R_PLANET = 6371e3, R_AIR = 6471e3, RAYLEIGH = [5.5e-6, 13.0e-6, 22.4e-6];
  // Ozone: it takes red and green out of sunlight crossing the air low at
  // dusk, which keeps the twilight sky blue (by the air's density, scaled for
  // its layer lying higher than the air's bulk).
  var OZONE = [0.65e-6 * 3, 1.881e-6 * 3, 0.085e-6 * 3];
  var ATMO_GLSL = [
    'uniform vec3 uSunDir, uSunCol, uRay; uniform float uMie, uHr, uHm, uG; const vec3 OZONE = vec3(' + OZONE.join(', ') + ');',
    'vec2 rsi(vec3 r0, vec3 rd, float sr) { float b = 2.0 * dot(rd, r0), c = dot(r0, r0) - sr * sr, d = b * b - 4.0 * c;',
    '  if(d < 0.0) return vec2(-1e9); return vec2(-b - sqrt(d), -b + sqrt(d)) * 0.5; }',   // a miss: nothing ahead
    'vec3 atmo(vec3 r) {',
    '  vec3 r0 = vec3(0.0, ' + R_PLANET + '.0 + 300.0, 0.0);',
    '  vec2 p = rsi(r0, r, ' + R_AIR + '.0); float g = rsi(r0, r, ' + R_PLANET + '.0).x; if(g > 0.0) p.y = min(p.y, g);',
    '  float iS = (p.y - max(p.x, 0.0)) / 16.0, iT = 0.0, oR = 0.0, oM = 0.0; vec3 tR = vec3(0.0), tM = vec3(0.0);',
    '  float mu = dot(r, uSunDir), gg = uG * uG;',
    '  float pR = 3.0 / (16.0 * 3.14159) * (1.0 + mu * mu);',
    '  float pM = 3.0 / (8.0 * 3.14159) * ((1.0 - gg) * (mu * mu + 1.0)) / (pow(1.0 + gg - 2.0 * mu * uG, 1.5) * (2.0 + gg));',
    '  for(int i = 0; i < 16; i++) {',
    '    vec3 q = r0 + r * (iT + iS * 0.5); float h = length(q) - ' + R_PLANET + '.0;',
    '    float dR = exp(-h / uHr) * iS, dM = exp(-h / uHm) * iS; oR += dR; oM += dM;',
    '    if(rsi(q, uSunDir, ' + R_PLANET + '.0).x < 0.0) {',   // in the earth's shadow after sunset
    '      float jS = rsi(q, uSunDir, ' + R_AIR + '.0).y / 8.0, jT = 0.0, jR = 0.0, jM = 0.0;',
    '      for(int j = 0; j < 8; j++) { float jh = length(q + uSunDir * (jT + jS * 0.5)) - ' + R_PLANET + '.0;',
    '        jR += exp(-jh / uHr) * jS; jM += exp(-jh / uHm) * jS; jT += jS; }',
    '      vec3 a = exp(-(uMie * 1.1 * (oM + jM) + (uRay + OZONE) * (oR + jR))); tR += dR * a; tM += dM * a;',
    '    }',
    '    iT += iS;',
    '  }',
    '  return uSunCol * (pR * uRay * tR + pM * uMie * tM);',
    '}'].join('\n');
  var index = {};   // world root -> its viewpoints.json, as it loads

  function world(zmap) {
    var map = zmap.mapControl && zmap.mapControl.getCurrentMap && zmap.mapControl.getCurrentMap();
    return map ? WORLDS[map.subMapId] : null;
  }
  function sectionOf(x, z) {
    var c = Math.floor((x + 5000) / 1000), r = Math.floor((z + 4000) / 1000);
    return c >= 0 && c < 10 && r >= 0 && r < 8 ? 'ABCDEFGHIJ'[c] + '-' + (r + 1) : null;
  }
  function loadIndex(w) {
    if(!index[w.root]) index[w.root] = fetch(w.root + 'viewpoints.json').then(function(r) { return r.ok ? r.json() : null; })
      .catch(function() { return null; });
    return index[w.root];
  }

  // Whether there's street view at a point of the map on screen: a promise.
  function available(zmap, latlng) {
    var w = world(zmap);
    // (Staff only while it's built; user is the page's own, zmain.js's.)
    var u = typeof user !== 'undefined' ? user : null;
    if(!w || !u || !(u.level >= 10)) return Promise.resolve(false);
    var g = w.toGame(latlng), sec = sectionOf(g.x, g.z);
    return loadIndex(w).then(function(ix) { return !!(ix && sec && ix.sections.indexOf(sec) >= 0); });
  }

  // What kind of place a marker is, for where to stand (viewpoints).
  function kindOf(marker, zmap) {
    var cat = marker && zmap.categories && zmap.categories[marker.categoryId];
    var name = ((cat && cat.name) || '') + ' ' + ((marker && (marker.title || marker.options && marker.options.title)) || '');
    if(/Resurrection/i.test(name)) return 'resurrection';
    if(/Tower/i.test(name)) return 'tower';
    if(/Shrine/i.test(name)) return 'shrine';
    if(/Chest/i.test(name)) return 'chest';
    return null;
  }

  function View(zmap, latlng, marker) {
    this.zmap = zmap; this.w = world(zmap); this.latlng = latlng; this.marker = marker;
    this.kind = kindOf(marker, zmap);
    // For the 3D maps' game materials (Map3D.js _gameMaterials): the freed
    // world's light.
    this.STATES = ZMap3D.Layer.prototype.STATES; this.state = 'freed';
    this.env = ENV; this.hour = 14;
  }
  View.prototype = {
    open: function() {
      var view = this, container = this.zmap.map.getContainer();
      this.el = L.DomUtil.create('div', 'zm-streetview', container);
      this.el.innerHTML = '<div class="zm-streetview-canvas"></div>' +
        '<button type="button" class="zm-streetview-close" aria-label="Close street view"><i class="fas fa-times" aria-hidden="true"></i></button>' +
        '<div class="zm-streetview-status">Loading street view…</div>' +
        '<div class="zm-streetview-help">Drag to look · Arrows / WASD to walk · Double-click to go there</div>';
      L.DomEvent.disableClickPropagation(this.el); L.DomEvent.disableScrollPropagation(this.el);
      this.el.querySelector('.zm-streetview-close').onclick = function() { view.close(); };
      this._key = function(e) { view._onKey(e, true); };
      this._keyUp = function(e) { view._onKey(e, false); };
      window.addEventListener('keydown', this._key); window.addEventListener('keyup', this._keyUp);
      this.keys = {};
      ZMap3D.load().then(function(lib) { if(view.el) view._start(lib); })
        .catch(function(e) { console.error(e); view._status('Street view could not load.'); });
      return this;
    },
    close: function() {
      if(this._frame) cancelAnimationFrame(this._frame);
      if(this.game) { this.game.dispose(); this.game = null; }
      if(this.composer) { this.composer.dispose(); this.composer = null; }
      if(this.renderer) { this.renderer.dispose(); this.renderer = null; }
      window.removeEventListener('keydown', this._key); window.removeEventListener('keyup', this._keyUp);
      if(this._resize) window.removeEventListener('resize', this._resize);
      if(this.el) { this.el.remove(); this.el = null; }
      if(ZStreetView.current === this) ZStreetView.current = null;
    },
    _status: function(text) {
      var s = this.el && this.el.querySelector('.zm-streetview-status');
      if(s) { s.textContent = text || ''; s.hidden = !text; }
    },
    _start: function(lib) {
      var THREE = lib.THREE, view = this, box = this.el.querySelector('.zm-streetview-canvas');
      this.lib = lib;
      var renderer = this.renderer = new THREE.WebGLRenderer({ antialias: true });
      renderer.setPixelRatio(window.devicePixelRatio); renderer.setSize(box.clientWidth, box.clientHeight);
      renderer.toneMapping = THREE.AgXToneMapping; renderer.toneMappingExposure = 1.15;
      renderer.shadowMap.enabled = true; renderer.shadowMap.type = THREE.PCFSoftShadowMap;
      box.appendChild(renderer.domElement);
      var labels = this.labels = new lib.CSS2D.CSS2DRenderer();
      labels.setSize(box.clientWidth, box.clientHeight); labels.domElement.className = 'zm-3d-labels leaflet-marker-pane';
      box.appendChild(labels.domElement);
      var scene = this.scene = new THREE.Scene();
      this.hemi = new THREE.HemisphereLight(0xffffff, 0xffffff, 1); scene.add(this.hemi);
      var sun = this.sun = new THREE.DirectionalLight(0xffffff, 1); sun.castShadow = true;
      sun.shadow.mapSize.set(2048, 2048); sun.shadow.bias = -0.0004; sun.shadow.normalBias = 0.4;
      Object.assign(sun.shadow.camera, { left: -80, right: 80, top: 80, bottom: -80, near: 1, far: 600 });
      scene.add(sun); scene.add(sun.target);
      scene.fog = new THREE.Fog(0xffffff, 0, 1);   // the haze: the horizon's own colour, set with the time (_setTime)
      this._sky();
      var camera = this.camera = new THREE.PerspectiveCamera(70, box.clientWidth / box.clientHeight, 0.2, 8000);
      // The picture as the game makes it: tone mapped, a little bloom, its
      // colour correction (saturation) after.
      var composer = this.composer = new lib.EffectComposer(renderer,
        new THREE.WebGLRenderTarget(box.clientWidth, box.clientHeight, { type: THREE.HalfFloatType, samples: 4 }));
      composer.setSize(box.clientWidth, box.clientHeight);
      composer.addPass(new lib.RenderPass(scene, camera));
      this.bloom = new lib.UnrealBloomPass(new THREE.Vector2(box.clientWidth, box.clientHeight), 0.12, 0.5, 1.1);
      composer.addPass(this.bloom);
      var out = new lib.OutputPass(), fs = out.material.fragmentShader;
      if(fs.indexOf('// color space') >= 0) {
        out.material.uniforms.uSat = this._sat = { value: 1 };
        out.material.fragmentShader = fs.replace('void main() {', 'uniform float uSat;\nvoid main() {')
          .replace('// color space', 'gl_FragColor.rgb = max(mix(vec3(dot(gl_FragColor.rgb, vec3(0.2126, 0.7152, 0.0722))), gl_FragColor.rgb, uSat), 0.0);\n// color space');
      }
      composer.addPass(out);
      // The game's own way of drawing (StreetViewGame.js), once its shaders are in;
      // until then, if they don't load, or when asked for the earlier look
      // (?streetview=classic, or localStorage zm-streetview-game = 0), the above.
      var wantGame = !/[?&]streetview=classic\b/.test(location.search);
      try { if(localStorage.getItem('zm-streetview-game') === '0') wantGame = false; } catch(e) {}
      if(window.ZStreetViewGame && wantGame) {
        var game = ZStreetViewGame.create(this);
        game.load().then(function() { if(view.renderer && game.ready) view.game = game; })
          .catch(function(e) { console.warn('Street view: the game\'s shaders didn\'t load', e); });
      }
      this._timeControl();
      fetch(this.w.root + 'env.json').then(function(r) { return r.ok ? r.json() : null; }).catch(function() { return null; })
        .then(function(env) { if(view.renderer) { if(env) view.env = env; view._cloudParams(); view._setTime(view.hour); } });
      this._setTime(this.hour);
      camera.rotation.order = 'YXZ';
      this.yaw = 0; this.pitch = 0;
      this.solid = [];   // what a ray down finds the ground in
      this.terrain = [];   // the ground itself (where markers stand)
      this._markerObjs = []; this._occl = 0;
      var g0 = this.w.toGame(this.latlng);
      this.x = g0.x; this.z = g0.z; this.y = null;
      this._look(); this._loadAround(); this._loadHorizon();
      this._resize = function() {
        camera.aspect = box.clientWidth / box.clientHeight; camera.updateProjectionMatrix();
        renderer.setSize(box.clientWidth, box.clientHeight); labels.setSize(box.clientWidth, box.clientHeight);
        composer.setSize(box.clientWidth, box.clientHeight);
        if(view.game) view.game.resize(box.clientWidth, box.clientHeight);
      };
      window.addEventListener('resize', this._resize);
      var clock = new THREE.Clock();
      var tick = function() {
        if(!view.renderer) return;
        var dt = Math.min(clock.getDelta(), 0.1);
        view._waterTime.value = clock.elapsedTime;
        if(view._cloudU) { var cp = view._cloudU.uCloudP.value; cp.y = clock.elapsedTime * 0.004; cp.z = -clock.elapsedTime * 0.0003; }   // the wind (CloudParam0's first noise, eastward)
        (view._flowing || []).forEach(function(t) { t.offset.y -= dt * 0.6; });
        view._walk(dt);
        view._growGrass(); view._occlude(); view._haze();
        if(view._cloudU) view._cloudU.uCloudCam.value.copy(camera.matrixWorld);
        if(view.game) view.game.render(); else composer.render();
        labels.render(scene, camera);
        view._frame = requestAnimationFrame(tick);
      };
      tick();
    },
    // The sky: the scattering (ATMO_GLSL) drawn into a small panorama when
    // the time changes (_setTime), which the dome round us shows with the sun,
    // the clouds and at night the stars, and which lights what's shiny
    // (scene.environment) as the game's sky cubemap does.
    _sky: function() {
      var THREE = this.lib.THREE;
      this._skyRT = new THREE.WebGLRenderTarget(256, 128, { type: THREE.HalfFloatType, depthBuffer: false });
      this._skyRT.texture.mapping = THREE.EquirectangularReflectionMapping; this._skyRT.texture.wrapS = THREE.RepeatWrapping;
      this._atmoU = { uSunDir: { value: new THREE.Vector3(0, 1, 0) }, uSunCol: { value: new THREE.Vector3() }, uRay: { value: new THREE.Vector3() },
                      uMie: { value: 0 }, uHr: { value: 8000 }, uHm: { value: 667 }, uG: { value: 0.85 } };
      this._skyScene = new THREE.Scene(); this._skyCam = new THREE.OrthographicCamera(-1, 1, 1, -1, 0, 1);
      this._skyScene.add(new THREE.Mesh(new THREE.PlaneGeometry(2, 2), new THREE.ShaderMaterial({
        uniforms: this._atmoU, depthTest: false, depthWrite: false,
        vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
        // three's own panorama layout (equirectUv), for the dome and the environment light alike
        fragmentShader: ATMO_GLSL + '\nvarying vec2 vUv; void main() {' +
          ' float az = (vUv.x - 0.5) * 6.2831853, el = (vUv.y - 0.5) * 3.14159265;' +
          ' gl_FragColor = vec4(atmo(vec3(cos(el) * cos(az), sin(el), cos(el) * sin(az))), 1.0); }'
      })));
      // The clouds: the game's own layer (env.json clouds, CloudParam0) with its
      // own textures (tex/clouds.png: its textures 2, 3 and 4 in red, green and
      // blue): the base shapes, blended toward the fuller cover, broken up by
      // two drifting noises, on a sky 7.9 km up, fading toward the horizon.
      var clouds = new THREE.TextureLoader().load(this.w.root + 'tex/clouds.png');
      clouds.wrapS = clouds.wrapT = THREE.RepeatWrapping; clouds.colorSpace = THREE.NoColorSpace;
      this._waterNear = { value: 0 };   // (the horizon's water leaves out what the game's covers: StreetViewGame.js)
      this._domeU = { uSky: { value: this._skyRT.texture }, uTime: this._waterTime = { value: 0 }, uSun: { value: new THREE.Vector3(0, 1, 0) },
                      uSunLight: { value: new THREE.Vector3(1, 1, 1) }, uAmb: { value: new THREE.Vector3(0.3, 0.4, 0.5) }, uNight: { value: 0 },
                      uClouds: { value: clouds }, uC0: { value: new THREE.Vector4() }, uC1: { value: new THREE.Vector4() },
                      uC2: { value: new THREE.Vector4() }, uC3: { value: new THREE.Vector4() }, uC4: { value: new THREE.Vector4() } };
      this._cloudParams();
      var dome = this.skyDome = new THREE.Mesh(new THREE.SphereGeometry(1000, 32, 16), new THREE.ShaderMaterial({
        uniforms: this._domeU, side: THREE.BackSide, depthWrite: false, fog: false,
        vertexShader: 'varying vec3 vDir; void main() { vDir = position; vec4 p = projectionMatrix * modelViewMatrix * vec4(position, 1.0); gl_Position = p.xyww; }',
        fragmentShader: [
          'varying vec3 vDir; uniform sampler2D uSky, uClouds; uniform float uTime, uNight; uniform vec3 uSun, uSunLight, uAmb;',
          'uniform vec4 uC0, uC1, uC2, uC3, uC4;',   // sky scale, height, base scale, blend | noise scales, densities | noise speeds | density, distortion, alpha mul, cover threshold | emboss, far alpha start, end, colour scale
          'float h(vec2 p) { return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453); }',
          'float cloudAt(vec2 uv, float t) {',   // the cover at a point of the sky plane (uv: plane / sky scale)
          '  vec2 n1 = uv * uC1.x + uC2.xy * t, n2 = uv * uC1.y + uC2.zw * t;',
          '  float nz = texture2D(uClouds, n1).g * uC1.z + texture2D(uClouds, n2).g * uC1.w;',
          '  vec2 b = uv * uC0.z + (nz - 0.12) * uC3.y * 0.08;',
          '  vec3 tx = texture2D(uClouds, b).rgb; float v = mix(tx.r, tx.b, uC0.w) + (nz - 0.12) * uC3.y * 2.0;',
          '  return (v - mix(0.385, 0.492, uC0.w)) / mix(0.138, 0.079, uC0.w);',   // in spreads from the textures' mean (measured)
          '}',
          'void main() {',
          '  vec3 d = normalize(vDir); vec3 e = vec3(d.x, max(d.y, 0.0), d.z);',
          '  vec3 c = texture2D(uSky, vec2(atan(e.z, e.x) * 0.1591549 + 0.5, asin(clamp(e.y, -1.0, 1.0)) * 0.3183099 + 0.5)).rgb;',
          '  float s = max(dot(d, uSun), 0.0);',
          '  c += uSunLight * (smoothstep(0.99994, 0.99998, s) * 60.0);',   // the sun's disc (it blooms)
          '  c += vec3(0.006, 0.013, 0.034) * uNight * (0.6 + 0.4 * e.y);',   // the night sky's own deep blue
          '  if(uNight > 0.0 && d.y > 0.0) { vec2 g = floor(d.xz / (d.y + 0.6) * 420.0); float st = step(0.9975, h(g));',
          '    c += vec3(0.8, 0.85, 1.0) * st * h(g + 7.0) * uNight * 0.6; }',
          '  if(d.y > 0.0) {',
          '    float t = uTime * 0.0015;',
          '    vec2 uv = d.xz * (uC0.y / max(d.y, 0.03)) / uC0.x;',   // where the line of sight meets the sky plane
          '    float v = cloudAt(uv, t);',
          '    float a = smoothstep(uC3.w - 0.4, uC3.w + 0.9, v) * clamp(uC3.z * 1.45, 0.0, 1.0);',   // the game's density as the share of sky covered
          '    a *= 1.0 - smoothstep(uC4.y, uC4.z, 1.0 - d.y);',   // the game's far fade, toward the horizon
          '    vec2 toSun = normalize(uSun.xz + 1e-4) * uC4.x;',   // emboss: thinner toward the sun, lit
          '    float lit = clamp((v - cloudAt(uv + toSun, t)) * 0.6 + 0.5, 0.0, 1.0);',
          '    vec3 cc = c * (0.25 + 0.1 * uC4.w) + uAmb * 0.9 + uSunLight * (0.3 + 0.6 * lit) * (0.75 + 0.25 * pow(s, 4.0));',
          '    cc += uSunLight * pow(s, 12.0) * (1.0 - a) * 0.8;',   // the sun through the thin edges
          '    c = mix(c, cc, a);',
          '  }',
          '  gl_FragColor = vec4(c, 1.0);',
          '  #include <tonemapping_fragment>',
          '  #include <colorspace_fragment>',
          '}'].join('\n')
      }));
      dome.renderOrder = -1; dome.frustumCulled = false;
      this.scene.add(dome);
      this._pmrem = new THREE.PMREMGenerator(this.renderer);
    },
    // The cloud layer's settings, from the game's (env.json clouds).
    _cloudParams: function() {
      var c = (this.env.clouds || {}), P = c.CloudParam0 || {}, G = c.Cloud || {}, D = this._domeU, m = P.mNoiseSpeedMaster || 1;
      var g = function(k, d) { return P[k] != null ? P[k] : d; };
      D.uC0.value.set(g('mSkyScale', 26500), g('mSkyHeight', 7895), g('mBaseTexScale', 2.07), g('mbCloudTexBlend', true) ? g('mCloudTexBlendRate', 1) : 0);
      D.uC1.value.set(g('mNoiseScale1', 4), g('mNoiseScale2', 8), g('mNoiseDensity1', 0.5), g('mNoiseDensity2', 0.5));
      D.uC2.value.set(g('mNoiseSpeed1X', 0.25) * m, g('mNoiseSpeed1Y', -0.02) * m, g('mNoiseSpeed2X', -0.53) * m, g('mNoiseSpeed2Y', 0.29) * m);
      // the share of sky covered as the game's density: the cover's threshold
      // (in spreads from its mean) the normal distribution's at 1 - density
      var dens = Math.min(0.95, Math.max(0.05, g('mDensity', 0.37))), q = 1 - dens, tq = Math.sqrt(-2 * Math.log(Math.min(q, 1 - q)));
      var z = tq - (2.515517 + 0.802853 * tq + 0.010328 * tq * tq) / (1 + 1.432788 * tq + 0.189269 * tq * tq + 0.001308 * tq * tq * tq);
      D.uC3.value.set(dens, g('mDistotion', 0.66), g('mAlphaMul', 0.69), q < 0.5 ? -z : z);
      D.uC4.value.set(g('mEmbossWidth', 0.05), g('mFarAlphaChgStart', 0.7), g('mFarAlphaChgEnd', 0.95), G.mCloudColorScale || 2.75);
    },
    // The clouds' shadows on the ground: the game's own (tex/cloud-shadow.png,
    // projected from above over 1 km, env.json cloud_shadow), drifting with
    // the clouds' wind. Each lit material's sunlight is dimmed where the line
    // from its point toward the sun crosses a shadow at the cloud's height;
    // the sky's light stays.
    _cloudShadow: function(mat) {
      if(!mat || mat.userData.cloudShadow || !(mat.isMeshStandardMaterial || mat.isMeshLambertMaterial || mat.isMeshPhongMaterial)) return;
      var THREE = this.lib.THREE;
      if(!this._cloudU) {
        var tex = new THREE.TextureLoader().load(this.w.root + 'tex/cloud-shadow.png');
        tex.wrapS = tex.wrapT = THREE.RepeatWrapping; tex.colorSpace = THREE.NoColorSpace;
        var pr = (this.env.cloud_shadow || {}), size = pr.height || 1000;
        this._cloudU = { uCloudShadow: { value: tex }, uCloudCam: { value: new THREE.Matrix4() }, uCloudSun: { value: new THREE.Vector3(0, 1, 0) },
                         uCloudP: { value: new THREE.Vector4(1 / size, 0, 0, 0.75) }, uCloudH: { value: size } };
        if(this._light) this._cloudU.uCloudSun.value.set(this._light.x, this._light.y, this._light.z);
        this._cloudPars = ['uniform sampler2D uCloudShadow; uniform mat4 uCloudCam; uniform vec3 uCloudSun; uniform vec4 uCloudP; uniform float uCloudH;',
          'float cloudShadow(vec3 vp) {',   // vp: the point in view space
          '  vec3 w = (uCloudCam * vec4(vp, 1.0)).xyz;',
          '  vec2 q = w.xz + uCloudSun.xz / max(uCloudSun.y, 0.1) * max(uCloudH - w.y, 0.0);',
          '  return mix(1.0, texture2D(uCloudShadow, q * uCloudP.x + uCloudP.yz).r, uCloudP.w);',
          '}'].join('\n');
        var chunk = THREE.ShaderChunk.lights_fragment_begin, at = chunk.indexOf('NUM_DIR_LIGHTS > 0'), re = 'RE_Direct( directLight', i = chunk.indexOf(re, at);
        this._cloudLights = at < 0 || i < 0 ? null : chunk.slice(0, i) + 'directLight.color *= cloudShadow( geometryPosition );\n\t\t' + chunk.slice(i);
      }
      if(!this._cloudLights) return;
      var U = this._cloudU, pars = this._cloudPars, lights = this._cloudLights, prev = mat.onBeforeCompile, key = mat.customProgramCacheKey();
      mat.onBeforeCompile = function(shader, r) {
        if(prev) prev.call(this, shader, r);
        Object.assign(shader.uniforms, U);
        shader.fragmentShader = shader.fragmentShader.replace('#include <common>', '#include <common>\n' + pars)
          .replace('#include <lights_fragment_begin>', lights);
      };
      mat.customProgramCacheKey = function() { return 'cloudshadow|' + key; };
      mat.userData.cloudShadow = true; mat.needsUpdate = true;
    },
    // The same scattering in JavaScript, for a few directions: the light
    // arriving along r (a unit vector) at the sun s, and how much of the
    // sun's own light gets through the air to us.
    _atmo: function(r, s, P) {
      var r0 = [0, R_PLANET + 300, 0];
      function rsi(o, d, R) { var b = 2 * (o[0] * d[0] + o[1] * d[1] + o[2] * d[2]), c = o[0] * o[0] + o[1] * o[1] + o[2] * o[2] - R * R, q = b * b - 4 * c;
        return q < 0 ? [-1e9, -1e9] : [(-b - Math.sqrt(q)) / 2, (-b + Math.sqrt(q)) / 2]; }
      function depth(o, d) {   // optical depth to the sky's top, or null in the earth's shadow
        if(rsi(o, d, R_PLANET)[0] > 0) return null;
        var jS = rsi(o, d, R_AIR)[1] / 8, jR = 0, jM = 0;
        for(var j = 0; j < 8; j++) { var t = (j + 0.5) * jS, h = Math.hypot(o[0] + d[0] * t, o[1] + d[1] * t, o[2] + d[2] * t) - R_PLANET;
          jR += Math.exp(-h / P.Hr) * jS; jM += Math.exp(-h / P.Hm) * jS; }
        return [jR, jM];
      }
      var sd = depth(r0, s), trans = sd ? P.ray.map(function(b, k) { return Math.exp(-(P.mie * 1.1 * sd[1] + (b + OZONE[k]) * sd[0])); }) : [0, 0, 0];
      var p = rsi(r0, r, R_AIR), g = rsi(r0, r, R_PLANET)[0]; if(g > 0) p[1] = Math.min(p[1], g);
      var iS = (p[1] - Math.max(p[0], 0)) / 12, oR = 0, oM = 0, tR = [0, 0, 0], tM = [0, 0, 0];
      var mu = r[0] * s[0] + r[1] * s[1] + r[2] * s[2], gg = P.g * P.g;
      var pR = 3 / (16 * Math.PI) * (1 + mu * mu), pM = 3 / (8 * Math.PI) * ((1 - gg) * (mu * mu + 1)) / (Math.pow(1 + gg - 2 * mu * P.g, 1.5) * (2 + gg));
      for(var i = 0; i < 12; i++) {
        var t = (i + 0.5) * iS, q = [r0[0] + r[0] * t, r0[1] + r[1] * t, r0[2] + r[2] * t], h = Math.hypot(q[0], q[1], q[2]) - R_PLANET;
        var dR = Math.exp(-h / P.Hr) * iS, dM = Math.exp(-h / P.Hm) * iS; oR += dR; oM += dM;
        var jd = depth(q, s); if(!jd) continue;
        for(var k = 0; k < 3; k++) { var a = Math.exp(-(P.mie * 1.1 * (oM + jd[1]) + (P.ray[k] + OZONE[k]) * (oR + jd[0]))); tR[k] += dR * a; tM[k] += dM * a; }
      }
      return { sky: [0, 1, 2].map(function(k) { return P.col[k] * (pR * P.ray[k] * tR[k] + pM * P.mie * tM[k]); }), sun: trans };
    },
    // Where the sun is at an hour of the day (0 to 24): rising in the east
    // (+x), at noon high in the south (+z), setting in the west.
    _sunAt: function(hour) {
      var a = (hour - 6) / 12 * Math.PI, tilt = 0.6;
      return [Math.cos(a), Math.sin(a) * Math.cos(tilt), Math.sin(a) * Math.sin(tilt)];
    },
    // The world at an hour: the sky drawn again, the sun's and the sky's light
    // from it (the game's colours at noon), the haze the horizon's colour.
    _setTime: function(hour) {
      if(!this.renderer) return;
      var THREE = this.lib.THREE, E = this.env, sky = E.sky, U = this._atmoU;
      this.hour = hour;
      var P = { Hr: sky.rayleigh_base_height / 3 * 1000, Hm: sky.mie_base_height / 3 * 1000, g: sky.mie_symmetrical_prop_rendering,
                mie: sky.mie_scattering_coeff / 1000 * sky.mie_amplifier_rendering,
                ray: RAYLEIGH.map(function(b) { return b * sky.rayleigh_amplifier_rendering; }),
                // white sunlight into the air (the air itself reddens it), the
                // game's strength and its sky amplifier
                col: [1, 1, 1].map(function() { return sky.sun_color[3] * (sky.amplifier_for_envmap || 1); }) };
      var s = this.sunDir || this._sunAt(hour), view = this;   // sunDir: an exact direction (the comparison with the game's frames)
      U.uSunDir.value.set(s[0], s[1], s[2]); U.uSunCol.value.fromArray(P.col); U.uRay.value.fromArray(P.ray);
      U.uMie.value = P.mie; U.uHr.value = P.Hr; U.uHm.value = P.Hm; U.uG.value = P.g;
      var rt = this.renderer.getRenderTarget(); this.renderer.setRenderTarget(this._skyRT);
      this.renderer.render(this._skyScene, this._skyCam); this.renderer.setRenderTarget(rt);
      // the game's own sky, once the game renderer has it (StreetViewGame.js paintSky)
      if(this.game && this.game.paintSky) this.game.paintSky(this._skyRT, s, this.camera ? this.camera.position.y : 0);
      if(this._envRT) this._envRT.dispose();
      this._envRT = this._pmrem.fromEquirectangular(this._skyRT.texture); this.scene.environment = this._envRT.texture;
      // The sky's light: overhead and round the horizon, against noon's.
      function skyLight(sd) {
        var up = view._atmo([0, 1, 0], sd, P).sky, sum = up.slice();
        for(var i = 0; i < 6; i++) { var a = i / 6 * 2 * Math.PI, l = view._atmo([Math.cos(a) * 0.9, 0.44, Math.sin(a) * 0.9], sd, P);
          for(var k = 0; k < 3; k++) sum[k] += l.sky[k]; }
        return { light: sum.map(function(v) { return v / 7; }), sun: view._atmo([0, 1, 0], sd, P).sun };
      }
      var now = skyLight(s), noon = this._noon || (this._noon = skyLight(this._sunAt(12)));
      var lum = function(c) { return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2]; };
      var day = Math.max(0, Math.min(1, (s[1] + 0.03) / 0.12));   // the sun up (sunrise / sunset in between)
      var night = 1 - Math.max(0, Math.min(1, (s[1] + 0.18) / 0.16));
      // The sun: the game's colour at noon, reddened as the air lengthens, or
      // the moon's pale light at night (its direction opposite).
      var sc = E.sun.DiffuseColor, k = E.sun.Intensity * 0.2;   // 9 -> 1.8: noon as street view's been lit
      var tr = now.sun.map(function(v, i) { return v / Math.max(noon.sun[i], 1e-4); });
      var moon = [-s[0], -s[1], -s[2]];
      if(day > 0) {
        this.sun.color.setRGB(sc[0] * tr[0], sc[1] * tr[1], sc[2] * tr[2]); this.sun.intensity = k * day;
        this._light = { x: s[0], y: s[1], z: s[2] };
      } else {
        this.sun.color.setRGB(0.55, 0.65, 0.9); this.sun.intensity = 0.22 * night;
        this._light = { x: moon[0], y: moon[1], z: moon[2] };
      }
      // The sky's light from above, the ground's from below: the game's
      // hemisphere colours, as bright (and as tinted) as the sky is against noon.
      var hs = E.hemisphere, rel = now.light.map(function(v, i) { return v / Math.max(noon.light[i], 1e-6); }), b = lum(now.light) / lum(noon.light);
      var floor = 0.06;   // starlight
      this.hemi.color.setRGB(Math.max(hs.SkyColor[0] * rel[0], floor * 0.6), Math.max(hs.SkyColor[1] * rel[1], floor * 0.75), Math.max(hs.SkyColor[2] * rel[2], floor));
      this.hemi.groundColor.setRGB(hs.GroundColor[0] * Math.max(b, floor), hs.GroundColor[1] * Math.max(b, floor), hs.GroundColor[2] * Math.max(b, floor));
      this.hemi.intensity = hs.Intensity * 1.1;
      // The haze: half the horizon's colour round us (_haze picks the one
      // ahead), half the game's own ground haze lit by the sky. It thickens as
      // the game's does, as distance to the power of its ground attenuation:
      // clear close by, the far hills hazy (three's fog is a smoothstep, so
      // it starts where the game's would reach 5%).
      var adhoc = sky.adhoc_fog_color || [0.51, 0.399, 0.285], lit = 1.8 * b + 0.15 * day;
      this._horizon = [];
      for(var i = 0; i < 16; i++) { var a = i / 16 * 2 * Math.PI, hz = this._atmo([Math.cos(a) * 0.996, 0.09, Math.sin(a) * 0.996], s, P).sky;
        this._horizon.push([0, 1, 2].map(function(k) { return hz[k] * 0.5 + adhoc[k] * lit; })); }
      var n = sky.adhoc_fog_near, f = sky.adhoc_fog_far, att = sky.adhoc_fog_atten_grd || 1;
      this.scene.fog.near = n + (f - n) * Math.pow(0.05, 1 / att); this.scene.fog.far = f;
      // The dome: its sun and clouds lit as the world is.
      var D = this._domeU, sl = this.sun.color;
      D.uSun.value.set(s[0], s[1], s[2]); D.uNight.value = night;
      if(this._cloudU) { var Ld = this._light; this._cloudU.uCloudSun.value.set(Ld.x, Ld.y, Ld.z); }
      D.uSunLight.value.set(sl.r * day, sl.g * day, sl.b * day);
      D.uAmb.value.set(this.hemi.color.r * 0.35, this.hemi.color.g * 0.35, this.hemi.color.b * 0.35);
      if(this._sat) this._sat.value = (E.color && E.color.saturation) || 1;
      // The eye's adjustment: as the light falls, the picture brightens (part
      // way: dusk stays dusk, the night dark).
      this.renderer.toneMappingExposure = 1.15 * Math.min(5, Math.pow(1 / Math.max(b, 1e-3), 0.5));
      this._haze(true);
      if(this.game) this.game.skyChanged();
      var t = this.el && this.el.querySelector('.zm-streetview-time output');
      if(t) { var hh = Math.floor(hour) % 24, mm = Math.round((hour - Math.floor(hour)) * 60);
        t.textContent = ((hh + 11) % 12 + 1) + ':' + (mm < 10 ? '0' : '') + mm + (hh < 12 ? ' AM' : ' PM'); }
    },
    // The haze's colour: the horizon's, the way we're looking.
    _haze: function(force) {
      if(!this._horizon || !this.camera) return;
      var yaw = this.yaw || 0, a = Math.atan2(-Math.cos(yaw), -Math.sin(yaw)), f = ((a / (2 * Math.PI)) % 1 + 1) % 1 * 16;
      var i = Math.floor(f) % 16, j = (i + 1) % 16, t = f - Math.floor(f), A = this._horizon[i], B = this._horizon[j];
      this.scene.fog.color.setRGB(A[0] + (B[0] - A[0]) * t, A[1] + (B[1] - A[1]) * t, A[2] + (B[2] - A[2]) * t);
    },
    // The time of day: a slider, the hour beside it.
    _timeControl: function() {
      var view = this, el = L.DomUtil.create('label', 'zm-streetview-time', this.el);
      el.innerHTML = '<i class="fas fa-sun" aria-hidden="true"></i>' +
        '<input type="range" min="0" max="24" step="0.25" aria-label="Time of day"><output></output>';
      L.DomEvent.disableClickPropagation(el);
      var input = el.querySelector('input'); input.value = this.hour;
      var pending = null;
      input.addEventListener('input', function() {
        if(pending) return;   // once a frame while dragging (the sky's drawn again each time)
        pending = requestAnimationFrame(function() { pending = null; view._setTime(parseFloat(input.value) % 24); });
      });
    },
    // Drag to look, scroll or pinch to zoom, double-click to walk there.
    _look: function() {
      var view = this, el = this.renderer.domElement, drag = null, pinch = null, pointers = {};
      el.style.touchAction = 'none';
      el.addEventListener('pointerdown', function(e) {
        pointers[e.pointerId] = [e.clientX, e.clientY]; el.setPointerCapture(e.pointerId);
        drag = { x: e.clientX, y: e.clientY, yaw: view.yaw, pitch: view.pitch };
        var ids = Object.keys(pointers);
        if(ids.length === 2) {
          var a = pointers[ids[0]], b = pointers[ids[1]];
          pinch = { d: Math.hypot(a[0] - b[0], a[1] - b[1]), fov: view.camera.fov }; drag = null;
        }
      });
      el.addEventListener('pointermove', function(e) {
        if(!pointers[e.pointerId]) return;
        pointers[e.pointerId] = [e.clientX, e.clientY];
        var ids = Object.keys(pointers);
        if(pinch && ids.length === 2) {
          var a = pointers[ids[0]], b = pointers[ids[1]];
          view._fov(pinch.fov * pinch.d / Math.max(20, Math.hypot(a[0] - b[0], a[1] - b[1])));
        } else if(drag) {
          var k = view.camera.fov / 70 * 0.005;
          view.yaw = drag.yaw - (e.clientX - drag.x) * k;
          view.pitch = Math.max(-1.45, Math.min(1.45, drag.pitch + (e.clientY - drag.y) * k));
        }
      });
      var up = function(e) { delete pointers[e.pointerId]; if(Object.keys(pointers).length < 2) pinch = null; if(!Object.keys(pointers).length) drag = null; };
      el.addEventListener('pointerup', up); el.addEventListener('pointercancel', up);
      el.addEventListener('wheel', function(e) { e.preventDefault(); view._fov(view.camera.fov * Math.exp(e.deltaY * (e.ctrlKey ? 0.01 : 0.001))); }, { passive: false });
      el.addEventListener('dblclick', function(e) { view._goToPointer(e); });
      var lastTap = 0;
      el.addEventListener('pointerup', function(e) {
        if(e.pointerType !== 'touch') return;
        if(Date.now() - lastTap < 300) view._goToPointer(e);
        lastTap = Date.now();
      });
    },
    _fov: function(f) { this.camera.fov = Math.max(20, Math.min(90, f)); this.camera.updateProjectionMatrix(); },
    _onKey: function(e, down) {
      if(!this.el || /input|textarea|select/i.test(e.target.tagName)) return;
      var k = { ArrowUp: 'f', KeyW: 'f', ArrowDown: 'b', KeyS: 'b', ArrowLeft: 'l', KeyA: 'l', ArrowRight: 'r', KeyD: 'r', ShiftLeft: 'run', ShiftRight: 'run' }[e.code];
      if(e.key === 'Escape' && down) { this.close(); return; }
      if(!k) return;
      e.preventDefault(); this.keys[k] = down;
    },
    // Walking: across the ground (or roofs), never through to below it.
    _walk: function(dt) {
      var cam = this.camera, k = this.keys;
      if(this.target) {   // walking to a double-clicked spot
        var dx = this.target.x - this.x, dz = this.target.z - this.z, d = Math.hypot(dx, dz), step = RUN * 1.5 * dt;
        if(d <= step) { this.x = this.target.x; this.z = this.target.z; this.target = null; }
        else { this.x += dx / d * step; this.z += dz / d * step; }
        this._settle();
      }
      var f = (k.f ? 1 : 0) - (k.b ? 1 : 0), s = (k.r ? 1 : 0) - (k.l ? 1 : 0);
      if(f || s) {
        var sp = (k.run ? RUN : WALK) * dt;
        this.x += (-Math.sin(this.yaw) * f + Math.cos(this.yaw) * s) * sp;
        this.z += (-Math.cos(this.yaw) * f - Math.sin(this.yaw) * s) * sp;
        this._settle(); this._loadAround();
      }
      if(this.y != null) cam.position.set(this.x, this.y + EYE, this.z);
      if(this.skyDome) this.skyDome.position.copy(cam.position);
      cam.rotation.set(-this.pitch, this.yaw, 0);   // looking along (-sin yaw, -cos yaw), the way it walks
      var L = this._light || { x: 0.5, y: 0.7, z: 0.3 };
      this.sun.position.set(this.x + L.x * 300, (this.y || 0) + L.y * 300, this.z + L.z * 300); this.sun.target.position.set(this.x, this.y || 0, this.z);
    },
    // The first surface below the spot (from a little above where we are,
    // so walking under a roof stays under it).
    _settle: function(from) {
      if(!this.solid.length) return;
      var THREE = this.lib.THREE;
      this.scene.updateMatrixWorld();   // what's just loaded has no place in the world until it's drawn once
      var top = from != null ? from : (this.y != null ? this.y + 3 : 2000);
      var rc = new THREE.Raycaster(new THREE.Vector3(this.x, top, this.z), new THREE.Vector3(0, -1, 0), 0, 4000);
      var hit = rc.intersectObjects(this.solid, true)[0];
      if(hit) this.y = hit.point.y;
    },
    _goToPointer: function(e) {
      var THREE = this.lib.THREE, r = this.renderer.domElement.getBoundingClientRect();
      var rc = new THREE.Raycaster();
      rc.setFromCamera(new THREE.Vector2((e.clientX - r.left) / r.width * 2 - 1, -(e.clientY - r.top) / r.height * 2 + 1), this.camera);
      var hit = rc.intersectObjects(this.solid, true)[0];
      if(hit && hit.distance < 600) this.target = { x: hit.point.x, z: hit.point.z };
    },
    // The sections within reach, each once.
    _loadAround: function() {
      var view = this;
      loadIndex(this.w).then(function(ix) {
        if(!ix || !view.scene) return;
        view.viewpoints = ix.viewpoints || [];
        view._loaded = view._loaded || {};
        // One at a time, nearest first: hundreds of textures each, and the
        // browser refuses requests past a point. (Textures the sections share
        // load once: THREE.Cache.)
        view.lib.THREE.Cache.enabled = true;
        var centre = function(sec) { return ['ABCDEFGHIJ'.indexOf(sec[0]) * 1000 - 5000 + 500, (parseInt(sec.slice(2), 10) - 1) * 1000 - 4000 + 500]; };
        var todo = ix.sections.filter(function(sec) {
          var c = centre(sec);
          return !view._loaded[sec] && Math.abs(c[0] - view.x) <= NEAR && Math.abs(c[1] - view.z) <= NEAR;
        }).sort(function(a, b) {
          var ca = centre(a), cb = centre(b);
          return Math.hypot(ca[0] - view.x, ca[1] - view.z) - Math.hypot(cb[0] - view.x, cb[1] - view.z);
        });
        todo.forEach(function(sec) { view._loaded[sec] = true; });
        view._pending = (view._pending || 0) + todo.length;
        view._queue = (view._queue || []).concat(todo);
        var done = function() { if(--view._pending === 0) view._arrive(); next(); };
        var next = function() {
          var sec = view._queue.shift();
          if(!sec || !view.scene) { view._busy = false; return; }
          new view.lib.GLTFLoader().load(view.w.root + sec + '.glb', function(gltf) {
            if(!view.scene) return;
            view.scene.add(gltf.scene);
            ZMap3D.Layer.prototype._gameMaterials.call(view, gltf);
            gltf.scene.traverse(function(o) {
              if(!o.isMesh) return;
              o.receiveShadow = true;
              // What lies flat on the ground casts no shadow worth its cost (the
              // terrain's hills shade themselves already; decals onto the
              // ground beneath them made dark patches).
              if(/^(Terrain|Water)/.test(o.name) || (o.parent && /^(Terrain|Water)$/.test(o.parent.name)) || /Moss|Decal|Mound|Sand/.test(o.name)) o.castShadow = false;
              var water = o.name === 'Water' || (o.parent && o.parent.name === 'Water');
              if(water) { view._water(o.material); if(view.game) view.game.ownWater(o, false); } else view.solid.push(o);
              if(o.name === 'Terrain' || (o.parent && o.parent.name === 'Terrain')) { view.terrain.push(o); o.material.roughness = 1; o.material.envMapIntensity = 0.25; view._ground(o.material, sec); if(view.game) view.game.ground(o); }
              else if(!water && o.material && !(o.material.userData || {}).flow && !/Blackbase/.test(o.material.name)) o.material.envMapIntensity = 0.3;
              (Array.isArray(o.material) ? o.material : [o.material]).forEach(function(m) { view._cloudShadow(m); });
              if(view.game) view.game.adopt(o);
            });
            view._groundData(sec, gltf.scene);
            done();
          }, undefined, function(err) { console.error(err); done(); });
        };
        if(!view._busy) { view._busy = true; next(); }
        if(!view._pending && view.y == null) view._status('There’s no street view here yet.');
      });
    },
    // All Hyrule at low detail (horizon.glb), round the sections loaded in
    // full: the far mountains, lakes and sea. Not for standing on.
    _loadHorizon: function() {
      var view = this;
      new this.lib.GLTFLoader().load(this.w.root + 'horizon.glb', function(gltf) {
        if(!view.scene) return;
        view.scene.add(gltf.scene);
        gltf.scene.traverse(function(o) {
          if(!o.isMesh) return;
          o.receiveShadow = false; o.castShadow = false;
          if(o.name === 'Water' || (o.parent && o.parent.name === 'Water')) { o.material.userData.zmHorizonWater = true; view._water(o.material); if(view.game) view.game.ownWater(o, true); }
          else { o.material.roughness = 1; o.material.envMapIntensity = 0.25; o.material.userData.zmHorizon = true; }   // (the game renderer's terrain draws the near part)
          view._cloudShadow(o.material);
          if(view.game) view.game.adopt(o);
        });
      }, undefined, function() { /* none yet */ });
    },
    // The ground up close as the game paints it: per half metre its two
    // materials and their blend (matmap-<section>.png), each material a layer
    // of the game's ground textures (ground-atlas.webp) repeating at its own
    // scale, laid on from above, or from the side on cliffs so they don't
    // stretch. Further off, the section's baked ground (its own texture).
    _ground: function(mat, sec) {
      if(mat.userData.zmGround) return;
      mat.userData.zmGround = true;
      var view = this, THREE = this.lib.THREE, root = this.w.root;
      var uniforms = { uMatMap: { value: null }, uAtlas: { value: null }, uMats: { value: Array.from({ length: 96 }, function() { return new THREE.Vector3(0, 0.1, 0.1); }) }, uDetail: { value: 0 }, uMean: { value: Array.from({ length: 96 }, function() { return new THREE.Vector3(1, 1, 1); }) } };
      var pixels = function(url) {
        return fetch(url).then(function(r) { if(!r.ok) throw new Error(url); return r.blob(); })
          .then(function(b) { return createImageBitmap(b, { premultiplyAlpha: 'none', colorSpaceConversion: 'none' }); })
          .then(function(img) {
            var c = document.createElement('canvas'); c.width = img.width; c.height = img.height;
            var g = c.getContext('2d', { willReadFrequently: true }); g.drawImage(img, 0, 0);
            return { w: img.width, h: img.height, data: g.getImageData(0, 0, img.width, img.height).data };
          });
      };
      // The textures every section shares, once.
      if(!view._groundShared) view._groundShared = Promise.all([fetch(root + 'tex/ground-materials.json').then(function(r) { return r.json(); }),
                                                               pixels(root + 'tex/ground-atlas.webp')]).then(function(res) {
        var info = res[0], img = res[1], n = info.layers, px = info.px, data = new Uint8Array(px * px * 4 * n);
        for(var l = 0; l < n; l++) {
          var ox = (l % info.cols) * px, oy = Math.floor(l / info.cols) * px;
          for(var y = 0; y < px; y++) data.set(img.data.subarray(((oy + y) * img.w + ox) * 4, ((oy + y) * img.w + ox + px) * 4), (l * px + y) * px * 4);
        }
        var atlas = new THREE.DataArrayTexture(data, px, px, n);
        atlas.format = THREE.RGBAFormat; atlas.colorSpace = THREE.SRGBColorSpace;
        atlas.wrapS = atlas.wrapT = THREE.RepeatWrapping;
        atlas.minFilter = THREE.LinearMipmapLinearFilter; atlas.magFilter = THREE.LinearFilter;
        atlas.generateMipmaps = true; atlas.anisotropy = 4; atlas.needsUpdate = true;
        // Each layer's average colour (linear), so up close its grain can sit
        // on the baked ground's colour: near and far the same.
        var means = [];
        for(var l2 = 0; l2 < 96; l2++) {
          if(l2 >= n) { means.push(new THREE.Vector3(1, 1, 1)); continue; }
          var sum = [0, 0, 0], base = l2 * px * px * 4;
          for(var k = 0; k < px * px * 4; k += 16) for(var ch = 0; ch < 3; ch++) sum[ch] += Math.pow(data[base + k + ch] / 255, 2.2);
          var cnt = px * px / 4;
          means.push(new THREE.Vector3(Math.max(sum[0] / cnt, 0.01), Math.max(sum[1] / cnt, 0.01), Math.max(sum[2] / cnt, 0.01)));
        }
        var mats = info.materials.map(function(m) { return new THREE.Vector3(m[0], m[1], m[2]); });
        while(mats.length < 96) mats.push(new THREE.Vector3(0, 0.1, 0.1));
        return { atlas: atlas, mats: mats, means: means };
      });
      Promise.all([view._groundShared, pixels(root + 'tex/matmap-' + sec + '.png')]).then(function(res) {
        var map = new THREE.DataTexture(new Uint8Array(res[1].data.buffer.slice(0)), res[1].w, res[1].h, THREE.RGBAFormat);
        map.minFilter = map.magFilter = THREE.NearestFilter; map.generateMipmaps = false; map.needsUpdate = true;
        uniforms.uMatMap.value = map; uniforms.uAtlas.value = res[0].atlas; uniforms.uMats.value = res[0].mats; uniforms.uMean.value = res[0].means; uniforms.uDetail.value = 1;
      }).catch(function() { /* the baked ground alone */ });
      mat.onBeforeCompile = function(shader) {
        Object.assign(shader.uniforms, uniforms);
        shader.vertexShader = 'varying vec3 vGW;\nvarying vec3 vGN;\n' + shader.vertexShader.replace('#include <project_vertex>',
          '#include <project_vertex>\nvGW = (modelMatrix * vec4(transformed, 1.0)).xyz;\nvGN = normalize(mat3(modelMatrix) * objectNormal);');
        shader.fragmentShader = [
          'varying vec3 vGW;', 'varying vec3 vGN;',
          'uniform sampler2D uMatMap;', 'uniform mediump sampler2DArray uAtlas;', 'uniform vec3 uMats[96];', 'uniform vec3 uMean[96];', 'uniform float uDetail;',
          'vec3 zmMat(float mi, vec3 P, vec3 w, vec3 dx, vec3 dy) {',
          '  vec3 m = uMats[int(mi)]; vec3 c = vec3(0.0);',
          '  if(w.y > 0.01) { vec2 s = m.yz; c += w.y * textureGrad(uAtlas, vec3(P.xz * s, m.x), dx.xz * s, dy.xz * s).rgb; }',
          '  if(w.x > 0.01) { vec2 s = vec2(m.y); c += w.x * textureGrad(uAtlas, vec3(P.zy * s, m.x), dx.zy * s, dy.zy * s).rgb; }',
          '  if(w.z > 0.01) { vec2 s = vec2(m.y); c += w.z * textureGrad(uAtlas, vec3(P.xy * s, m.x), dx.xy * s, dy.xy * s).rgb; }',
          '  return c / uMean[int(m.x)];',   // the grain, about 1 on average
          '}',
          'vec3 zmTexel(ivec2 i, vec3 P, vec3 w, vec3 dx, vec3 dy) {',
          '  vec3 t = floor(texelFetch(uMatMap, clamp(i, ivec2(0), ivec2(2047)), 0).rgb * 255.0 + 0.5);',
          '  vec3 a = zmMat(t.x, P, w, dx, dy);',
          '  return t.z < 1.0 || t.y == t.x ? a : mix(a, zmMat(t.y, P, w, dx, dy), t.z / 255.0);',
          '}',
          shader.fragmentShader.replace('#include <map_fragment>', [
            'vec4 sampledDiffuseColor = texture2D( map, vMapUv );',
            'vec3 dx = dFdx(vGW), dy = dFdy(vGW);',
            'float near = uDetail * (1.0 - smoothstep(50.0, 130.0, length(vGW - cameraPosition)));',
            'if(near > 0.0) {',
            '  vec3 w = pow(abs(normalize(vGN)), vec3(4.0)); w /= w.x + w.y + w.z;',
            '  vec2 f = vMapUv * 2048.0 - 0.5; ivec2 i0 = ivec2(floor(f)); vec2 t = fract(f);',
            '  ivec4 q = ivec4(floor(texelFetch(uMatMap, clamp(i0, ivec2(0), ivec2(2047)), 0) * 255.0 + 0.5));',
            '  vec3 c;',
            // Most places are one material over a few texels: once, not four times.
            '  bool same = all(equal(ivec4(floor(texelFetch(uMatMap, clamp(i0 + ivec2(1, 1), ivec2(0), ivec2(2047)), 0) * 255.0 + 0.5)), q))',
            '    && all(equal(ivec4(floor(texelFetch(uMatMap, clamp(i0 + ivec2(1, 0), ivec2(0), ivec2(2047)), 0) * 255.0 + 0.5)), q))',
            '    && all(equal(ivec4(floor(texelFetch(uMatMap, clamp(i0 + ivec2(0, 1), ivec2(0), ivec2(2047)), 0) * 255.0 + 0.5)), q));',
            '  if(same) c = zmTexel(i0, vGW, w, dx, dy);',
            '  else c = mix(mix(zmTexel(i0, vGW, w, dx, dy), zmTexel(i0 + ivec2(1, 0), vGW, w, dx, dy), t.x),',
            '               mix(zmTexel(i0 + ivec2(0, 1), vGW, w, dx, dy), zmTexel(i0 + ivec2(1, 1), vGW, w, dx, dy), t.x), t.y);',
            '  sampledDiffuseColor.rgb *= mix(vec3(1.0), mix(vec3(1.0), c, 0.85), near);',   // the baked colour, with the game's grain
            '}',
            'diffuseColor *= sampledDiffuseColor;'
          ].join('\n'))
        ].join('\n');
      };
      mat.customProgramCacheKey = function() { return 'zm-ground'; };
      mat.needsUpdate = true;
    },
    // What grass needs of a section: its ground's heights (from its terrain,
    // a 2 m grid) and the game's grass map (tex/grass-<section>.png: where
    // it grows, alpha, and its colour).
    _groundData: function(sec, root) {
      var view = this, THREE = this.lib.THREE, N = 501, H = new Float32Array(N * N).fill(-1e9);
      var X0 = 'ABCDEFGHIJ'.indexOf(sec[0]) * 1000 - 5000, Z0 = (parseInt(sec.slice(2), 10) - 1) * 1000 - 4000, v = new THREE.Vector3();
      root.updateMatrixWorld(true);
      root.traverse(function(o) {
        if(!o.isMesh || !(o.name === 'Terrain' || (o.parent && o.parent.name === 'Terrain'))) return;
        var p = o.geometry.attributes.position;
        for(var i = 0; i < p.count; i++) {
          v.fromBufferAttribute(p, i).applyMatrix4(o.matrixWorld);
          var gi = Math.round((v.x - X0) / 2), gj = Math.round((v.z - Z0) / 2);
          if(gi >= 0 && gi < N && gj >= 0 && gj < N && v.y > H[gj * N + gi]) H[gj * N + gi] = v.y;   // (the skirts hang below)
        }
      });
      this._sections = this._sections || {};
      var d = this._sections[sec] = { x0: X0, z0: Z0, h: H, grass: null };
      fetch(this.w.root + 'tex/grass-' + sec + '.png').then(function(r) { if(!r.ok) throw 0; return r.blob(); })
        .then(function(b) { return createImageBitmap(b, { premultiplyAlpha: 'none', colorSpaceConversion: 'none' }); })
        .then(function(img) {
          var c = document.createElement('canvas'); c.width = img.width; c.height = img.height;
          var g = c.getContext('2d', { willReadFrequently: true }); g.drawImage(img, 0, 0);
          d.grass = { n: img.width, data: g.getImageData(0, 0, img.width, img.height).data };
          view._grassAt = null;   // grow again with it
        }).catch(function() {});
    },
    _heightAt: function(x, z) {
      var sec = this._sections && this._sections[sectionOf(x, z)];
      if(!sec) return null;
      var fx = (x - sec.x0) / 2, fz = (z - sec.z0) / 2, i = Math.min(Math.floor(fx), 499), j = Math.min(Math.floor(fz), 499), tx = fx - i, tz = fz - j, H = sec.h;
      var a = H[j * 501 + i], b = H[j * 501 + i + 1], c = H[(j + 1) * 501 + i], d = H[(j + 1) * 501 + i + 1];
      if(a < -1e8 || b < -1e8 || c < -1e8 || d < -1e8) return null;
      return (a * (1 - tx) + b * tx) * (1 - tz) + (c * (1 - tx) + d * tx) * tz;
    },
    // Grass round the camera, where the game grows it and in its colours,
    // swaying; regrown as we walk.
    _growGrass: function() {
      if(!this._sections || this.y == null) return;
      if(this._grassAt && Math.hypot(this._grassAt.x - this.x, this._grassAt.z - this.z) < 6) return;
      var THREE = this.lib.THREE, view = this;
      if(!this._grassMesh) {
        // A clump: blades, tapered, leaning out a little; aTip 0 at the root, 1 at the tip.
        var pos = [], tip = [], idx = [], BL = 11;
        for(var b = 0; b < BL; b++) {
          var a = b / BL * Math.PI * 2 + Math.random(), r = 0.04 + Math.random() * 0.14, hgt = 0.3 + Math.random() * 0.3, w = 0.045, lean = 0.1 + Math.random() * 0.15;
          var cx = Math.cos(a) * r, cz = Math.sin(a) * r, px = -Math.sin(a) * w, pz = Math.cos(a) * w, k = pos.length / 3;
          pos.push(cx - px, 0, cz - pz, cx + px, 0, cz + pz, cx * (1 + lean * 6) - px * 0.4, hgt * 0.55, cz * (1 + lean * 6) - pz * 0.4,
                   cx * (1 + lean * 6) + px * 0.4, hgt * 0.55, cz * (1 + lean * 6) + pz * 0.4, cx * (1 + lean * 12), hgt, cz * (1 + lean * 12));
          tip.push(0, 0, 0.55, 0.55, 1);
          idx.push(k, k + 1, k + 2, k + 1, k + 3, k + 2, k + 2, k + 3, k + 4);
        }
        var geo = new THREE.BufferGeometry();
        geo.setAttribute('position', new THREE.Float32BufferAttribute(pos, 3));
        geo.setAttribute('normal', new THREE.Float32BufferAttribute(pos.map(function(_, i) { return i % 3 === 1 ? 1 : 0; }), 3));
        geo.setAttribute('aTip', new THREE.Float32BufferAttribute(tip, 1));
        geo.setIndex(idx);
        var mat = new THREE.MeshLambertMaterial({ side: THREE.DoubleSide });
        mat.onBeforeCompile = function(shader) {
          shader.uniforms.uTime = view._waterTime;
          shader.vertexShader = 'uniform float uTime;\nattribute float aTip;\nvarying float vTip;\n' + shader.vertexShader.replace('#include <begin_vertex>', [
            '#include <begin_vertex>', 'vTip = aTip;',
            'vec2 root = vec2(instanceMatrix[3][0], instanceMatrix[3][2]);',
            'float sway = sin(uTime * 1.7 + root.x * 0.35 + root.y * 0.22) + 0.5 * sin(uTime * 2.9 + root.x * 0.9);',
            'transformed.xz += vec2(0.07, 0.04) * sway * aTip * aTip;'].join('\n'));
          shader.fragmentShader = 'varying float vTip;\n' + shader.fragmentShader.replace('#include <color_fragment>',
            '#include <color_fragment>\ndiffuseColor.rgb *= mix(0.5, 1.1, vTip);');
        };
        mat.customProgramCacheKey = function() { return 'zm-grass'; };
        this._cloudShadow(mat);
        if(this.game) this.game.patch(mat);
        this._grassMesh = new THREE.InstancedMesh(geo, mat, 32000);
        this._grassMesh.frustumCulled = false; this._grassMesh.receiveShadow = true;
        this._grassMesh.instanceColor = new THREE.InstancedBufferAttribute(new Float32Array(32000 * 3), 3);
        this.scene.add(this._grassMesh);
      }
      var mesh = this._grassMesh, R = 34, STEP = 0.42, n = 0, m4 = new THREE.Matrix4(), q = new THREE.Quaternion(), up = new THREE.Vector3(0, 1, 0),
          sc = new THREE.Vector3(), at = new THREE.Vector3(), col = new THREE.Color(), cx = Math.round(this.x / STEP) * STEP, cz = Math.round(this.z / STEP) * STEP;
      var hash = function(x, z, k) { var h = Math.sin(x * 127.1 + z * 311.7 + k * 74.7) * 43758.5453; return h - Math.floor(h); };
      var waiting = false;
      for(var gz = -R; gz <= R && n < 32000; gz += STEP) for(var gx = -R; gx <= R && n < 32000; gx += STEP) {
        var d2 = gx * gx + gz * gz; if(d2 > R * R) continue;
        var wx = cx + gx, wz = cz + gz, x = wx + (hash(wx, wz, 1) - 0.5) * STEP, z = wz + (hash(wx, wz, 2) - 0.5) * STEP;
        var sec = this._sections[sectionOf(x, z)];
        if(!sec) continue;
        if(!sec.grass) { waiting = true; continue; }
        var gi = Math.min(sec.grass.n - 1, Math.floor((x - sec.x0) / 1000 * sec.grass.n)), gj = Math.min(sec.grass.n - 1, Math.floor((z - sec.z0) / 1000 * sec.grass.n));
        var o = (gj * sec.grass.n + gi) * 4, dens = sec.grass.data[o + 3] / 255;
        if(hash(wx, wz, 3) > dens * 0.9) continue;
        var y = this._heightAt(x, z), y1 = this._heightAt(x + 1, z), y2 = this._heightAt(x, z + 1);
        if(y == null || y1 == null || y2 == null || Math.abs(y1 - y) > 0.9 || Math.abs(y2 - y) > 0.9) continue;   // not on cliffs
        var e = Math.max(0, (Math.sqrt(d2) / R - 0.45) / 0.55), fade = 1 - e * e * (3 - 2 * e);   // thinning out to nothing at the edge
        if(hash(wx, wz, 7) > fade + 0.15) continue;
        q.setFromAxisAngle(up, hash(wx, wz, 4) * 6.283);
        sc.setScalar((0.6 + 0.6 * hash(wx, wz, 5)) * (0.5 + 0.5 * dens) * fade);
        m4.compose(at.set(x, y - 0.05, z), q, sc); mesh.setMatrixAt(n, m4);
        col.setRGB(sec.grass.data[o] / 255, sec.grass.data[o + 1] / 255, sec.grass.data[o + 2] / 255, THREE.SRGBColorSpace).multiplyScalar(0.85 + 0.25 * hash(wx, wz, 6));
        mesh.setColorAt(n, col);
        n++;
      }
      mesh.count = n; mesh.instanceMatrix.needsUpdate = true; mesh.instanceColor.needsUpdate = true;
      this._grassAt = waiting ? null : { x: this.x, z: this.z };
    },
    _water: function(mat) {
      var view = this;
      mat.roughness = 0.06; mat.envMapIntensity = 1; mat.color.setRGB(0.05, 0.16, 0.2); mat.opacity = 0.88;
      if(mat.normalScale) mat.normalScale.set(0.35, 0.35);
      mat.onBeforeCompile = function(shader) {
        shader.uniforms.uTime = view._waterTime;
        // (the horizon's lakes and sea leave out what the game's water covers: StreetViewGame.js ownWater)
        shader.uniforms.zmNear = mat.userData.zmHorizonWater ? view._waterNear : { value: 0 };
        shader.fragmentShader = 'uniform float uTime;\nuniform float zmNear;\n' + shader.fragmentShader.replace(/void main\(\)\s*\{/, 'void main() {\n\tif(length(vViewPosition) < zmNear) discard;').replace(
          'vec3 mapN = texture2D( normalMap, vNormalMapUv ).xyz * 2.0 - 1.0;',
          'vec3 mapN = normalize((texture2D( normalMap, vNormalMapUv + uTime * vec2(0.013, 0.007) ).xyz * 2.0 - 1.0)' +
          ' + (texture2D( normalMap, vNormalMapUv * 0.63 + uTime * vec2(-0.008, 0.011) ).xyz * 2.0 - 1.0));');
      };
      mat.customProgramCacheKey = function() { return 'zm-water' + (mat.userData.zmHorizonWater ? '|hz' : ''); };
    },
    // Once what's here has loaded: where to stand, and the markers round about.
    _arrive: function() {
      if(this.y != null) return;
      // The nearest of the game's places of the marker's kind, as far off
      // as such a marker might be put from it (the Shrine of Resurrection's
      // marker is on its hill, its chamber inside).
      var reach = { resurrection: 120, tower: 40, shrine: 40, chest: 25 };
      var view = this, vp = null, best = reach[this.kind] || 0;
      (this.viewpoints || []).forEach(function(v) {
        if(v.kind !== view.kind) return;
        var d = Math.hypot(v.x - view.x, v.z - view.z);
        if(d < best) { best = d; vp = v; }
      });
      if(vp) { this.x = vp.pos[0]; this.y = vp.pos[1] - EYE; this.z = vp.pos[2]; this.yaw = vp.yaw; }
      else this._settle();
      if(this.y == null) { this._status('There’s no street view here yet.'); return; }
      this._status('');
      this._markers();
    },
    // The map's markers here, standing where they are on the ground.
    _markers: function() {
      var view = this, THREE = this.lib.THREE, zmap = this.zmap, w = this.w, sub = zmap.mapControl.getCurrentMap().subMapId;
      var rc = new THREE.Raycaster();
      zmap.getMarkers().forEach(function(m) {
        if(String(m.submapId) !== String(sub) || !m.options.icon || !zmap._shouldShowMarker || !zmap._shouldShowMarker(m, true)) return;
        var g = w.toGame(m.getLatLng());
        if(Math.hypot(g.x - view.x, g.z - view.z) > 600) return;
        rc.set(new THREE.Vector3(g.x, 2000, g.z), new THREE.Vector3(0, -1, 0));
        // On the ground, not on whatever stands over the spot (a tower's top);
        // what then stands in front of it hides it (_occlude).
        var hit = rc.intersectObjects(view.terrain, false)[0];
        if(!hit) return;
        var icon = m.categoryId != null && zmap.categories[m.categoryId] ? zmap._createMarkerIcon(m.categoryId, m.complete, 'Medium') : m.options.icon;
        var el = icon.createIcon();
        el.classList.add('zm-3d-marker'); el.style.position = 'static'; el.style.margin = '0'; el.title = m.options.title || '';
        el.addEventListener('click', function(e) { e.stopPropagation(); m.fire('click'); });
        var obj = new view.lib.CSS2D.CSS2DObject(el);
        obj.position.set(g.x, hit.point.y + 1.2, g.z);
        obj.visible = false; view.scene.add(obj); view._markerObjs.push(obj);   // (shown once seen to be in sight)
      });
    },
    // Markers behind something (a wall, a hill, the floor we stand on) hidden:
    // a few looked at each frame, a ray from the eye to each.
    _occlude: function() {
      var list = this._markerObjs, n = list.length;
      if(!n) return;
      var THREE = this.lib.THREE, eye = this.camera.position, rc = this._occRay || (this._occRay = new THREE.Raycaster()), dir = new THREE.Vector3();
      for(var k = 0; k < Math.min(8, n); k++) {
        var obj = list[this._occl = (this._occl + 1) % n];
        dir.subVectors(obj.position, eye); var d = dir.length();
        if(d > 400) { obj.visible = false; continue; }
        rc.set(eye, dir.normalize()); rc.far = d - 1.5;
        obj.visible = !rc.intersectObjects(this.solid, false).length;
      }
    }
  };

  return {
    available: available,
    // Opens street view at a point of the map on screen (a marker's, or a dropped pin's).
    open: function(zmap, latlng, marker) {
      if(ZStreetView.current) ZStreetView.current.close();
      ZStreetView.current = new View(zmap, latlng, marker).open();
      return ZStreetView.current;
    },
    current: null
  };
})();
