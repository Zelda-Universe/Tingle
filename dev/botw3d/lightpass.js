// BotW's own light pass (shader bec68ec6, translated by tools/cemu_to_webgl.py
// into webgl/bec68ec6_ps.glsl), run over street view: the game's maths on our
// world. A first step toward drawing street view the way the game does (a
// light pre-pass, then each material's own shader); see shader-notes.md.
//
// What it's fed, as the game feeds it (read with the probe pack,
// reference/probe-6.json, row 241 / 241x):
// - it runs at half resolution (640 x 360); passParameterSem0 = (u, v, the
//   camera ray x, y), Sem6 = (u, u, u, v), Sem2 = values from its vertex shader;
// - textureUnitPS2 albedo, PS3 the view-space normal * 0.5 + 0.5 with the
//   material id in alpha, PS4 black, all 1280 x 720; PS6 the linear depth
//   ((z - 0.1) / 24999.9) and PS14 white, 640 x 360; PS5 the clouds' shadow
//   texture; PS0 noise (64 x 64); PS11, PS12, PS15, PS17 black; PS7 the sky's
//   cube map array (street view's scattering sky, in the shader's own layout);
// - its constants (uf_remappedPS) the game's, with the camera rows and the sun
//   ours, each frame.
//
// Run in the console on a BotW map page with street view open:
//   fetch('/dev/botw3d/lightpass.js').then(r => r.text()).then(eval)
//   ZLightPass.run()        (shows its five outputs; click to close)
var ZLightPass = (function() {
  var W = 1280, H = 720, HW = 640, HH = 360;

  function floatsToInts(f) { return new Int32Array(new Float32Array(f).buffer); }

  // Every street view material also writes the game's G-buffer: albedo and the
  // view-space normal (with a material id), into extra outputs.
  function patchMaterials(v) {
    var n = 0;
    v.scene.traverse(function(o) {
      if(!o.isMesh || !o.material) return;
      (Array.isArray(o.material) ? o.material : [o.material]).forEach(function(m) {
        if(m.userData.zmGbuf2 || !(m.isMeshStandardMaterial || m.isMeshLambertMaterial || m.isMeshPhongMaterial)) return;
        var prev = m.onBeforeCompile, key = m.customProgramCacheKey();
        m.onBeforeCompile = function(sh, r) {
          if(prev) prev.call(this, sh, r);
          sh.fragmentShader = sh.fragmentShader
            .replace('#include <common>', '#include <common>\nlayout(location = 1) out highp vec4 zmAlbedo;\nlayout(location = 2) out highp vec4 zmNormal;\nlayout(location = 3) out highp vec4 zmShadow;')
            .replace(/}\s*$/, [
              // albedo; its alpha the surface type (0: ground, as the game's terrain)
              '\tzmAlbedo = vec4(diffuseColor.rgb, 0.0);',
              // the view normal; its alpha the gloss the light pass reads (the game's ground: ~25 / 255)
              '\tfloat zmRough = 1.0;',
              '\t#if defined( STANDARD ) || defined( PHYSICAL )\n\tzmRough = roughnessFactor;\n\t#endif',
              '\tzmNormal = vec4(normalize(normal) * 0.5 + 0.5, 0.1 + (1.0 - zmRough) * 0.6);',
              // the sun's shadow (street view's own shadow map), for the light pass's shadow mask
              '\tfloat zs = 1.0;',
              '\t#if defined( USE_SHADOWMAP ) && NUM_DIR_LIGHT_SHADOWS > 0',
              '\tzs = getShadow( directionalShadowMap[ 0 ], directionalLightShadows[ 0 ].shadowMapSize, directionalLightShadows[ 0 ].shadowBias, directionalLightShadows[ 0 ].shadowRadius, vDirectionalShadowCoord[ 0 ] );',
              '\t#endif',
              '\tzmShadow = vec4(zs);',
              '}'].join('\n'));
        };
        m.customProgramCacheKey = function() { return 'zmgbuf2|' + key; };
        m.userData.zmGbuf2 = true; m.needsUpdate = true; n++;
      });
    });
    return n;
  }

  function solid(THREE, r, g, b, a, w, h) {
    w = w || 1; h = h || 1;
    var d = new Float32Array(w * h * 4);
    for(var i = 0; i < w * h; i++) { d[i * 4] = r; d[i * 4 + 1] = g; d[i * 4 + 2] = b; d[i * 4 + 3] = a; }
    var t = new THREE.DataTexture(d, w, h, THREE.RGBAFormat, THREE.FloatType); t.needsUpdate = true; return t;
  }
  function noise(THREE) {
    var d = new Uint8Array(64 * 64 * 4);
    for(var i = 0; i < d.length; i++) d[i] = Math.random() * 255;
    var t = new THREE.DataTexture(d, 64, 64); t.wrapS = t.wrapT = THREE.RepeatWrapping; t.needsUpdate = true; return t;
  }

  // A full-screen pass running one of the game's pixel shaders, with a small
  // vertex shader of ours giving it its inputs.
  function quad(THREE, uniforms, body, outs, src) {
    return new THREE.RawShaderMaterial({
      glslVersion: THREE.GLSL3, uniforms: uniforms, depthTest: false, depthWrite: false,
      vertexShader: 'in vec3 position; in vec2 uv;\n' + outs.map(function(o) { return 'out vec4 ' + o + ';'; }).join('\n') +
        '\nvoid main() { ' + body + ' gl_Position = vec4(position.xy, 0.0, 1.0); }',
      fragmentShader: src.replace(/^#version 300 es\n/, '')
    });
  }

  function setup(v, probe) {
    var THREE = v.lib.THREE, L = {};
    L.gbuf = new THREE.WebGLMultipleRenderTargets(W, H, 4, { type: THREE.HalfFloatType });
    L.gbuf.depthTexture = new THREE.DepthTexture(W, H); L.gbuf.depthTexture.type = THREE.FloatType;
    L.depth = new THREE.WebGLRenderTarget(HW, HH, { type: THREE.FloatType, format: THREE.RGBAFormat, depthBuffer: false });
    L.depthFull = new THREE.WebGLRenderTarget(W, H, { type: THREE.FloatType, format: THREE.RGBAFormat, depthBuffer: false });
    L.hdr = new THREE.WebGLRenderTarget(W, H, { type: THREE.HalfFloatType, depthBuffer: false });
    L.hdr2 = new THREE.WebGLRenderTarget(W, H, { type: THREE.HalfFloatType, depthBuffer: false });
    L.final = new THREE.WebGLRenderTarget(W, H, { type: THREE.UnsignedByteType, depthBuffer: false });
    L.sky = new THREE.WebGLRenderTarget(W, H, { type: THREE.HalfFloatType });
    L.out = new THREE.WebGLMultipleRenderTargets(HW, HH, 5, { type: THREE.HalfFloatType, depthBuffer: false });
    L.quadCam = new THREE.OrthographicCamera(-1, 1, 1, -1, 0, 1);
    // linear depth, as the game keeps it: (view distance - 0.1) / 24999.9
    L.depthMat = new THREE.ShaderMaterial({
      uniforms: { tDepth: { value: L.gbuf.depthTexture }, uNear: { value: 0 }, uFar: { value: 0 } },
      vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
      fragmentShader: 'uniform sampler2D tDepth; uniform float uNear, uFar; varying vec2 vUv;' +
        'void main() { float d = texture2D(tDepth, vUv).x; float z = uNear * uFar / (uFar - d * (uFar - uNear));' +
        ' gl_FragColor = vec4((z - 0.1) / 24999.9, 0.0, 0.0, 1.0); }'
    });
    L.depthScene = new THREE.Scene(); L.depthScene.add(new THREE.Mesh(new THREE.PlaneGeometry(2, 2), L.depthMat));
    var get = function(n) { return fetch('/dev/botw3d/webgl/' + n + '.glsl?' + Date.now()).then(function(r) { return r.text(); }); };
    return Promise.all([get('bec68ec6f40a864f_ps'), get('b4a729584b6188ea_ps'), get('37040a485a29d54e_ps')]).then(function(srcs) {
      var src = srcs[0]; L.upSrc = srcs[1]; L.toneSrc = srcs[2];
      var C = probe['241'].constants, X = probe['241x'].values;
      L.consts = [].concat.apply([], C);
      var tex = {
        textureUnitPS0: noise(THREE), textureUnitPS2: L.gbuf.texture[1], textureUnitPS3: L.gbuf.texture[2],
        textureUnitPS4: solid(THREE, 0, 0, 0, 1), textureUnitPS5: v._cloudU ? v._cloudU.uCloudShadow.value : solid(THREE, 1, 1, 1, 1),
        textureUnitPS6: L.depth.texture, textureUnitPS11: solid(THREE, 0, 0, 0, 0), textureUnitPS12: solid(THREE, 0, 0, 0, 1),
        textureUnitPS14: L.gbuf.texture[3],   // the shadow mask: street view's sun shadow textureUnitPS15: solid(THREE, 0, 0, 0, 1), textureUnitPS17: solid(THREE, 0, 0, 0, 0)
      };
      // the sky's cube map array, in the light pass's own layout: it looks up the
      // world direction (x, y, -z) (its view-space normal back through C[8], C[5],
      // C[6]), on face 0..5 = +a -a +b -b +c -c, at (minor / 2|major| + 0.5). Filled
      // from street view's scattering sky (_skyRT), with mipmaps for the blurry lookups.
      // (three r160 can't draw into one layer of an array target: each face is drawn
      // into a plain target and read back into a 2D-array texture, mipmapped)
      L.face = new THREE.WebGLRenderTarget(64, 64, { type: THREE.HalfFloatType, depthBuffer: false });
      L.cubeData = new Uint16Array(64 * 64 * 4 * 6);
      L.cubeTex = new THREE.DataArrayTexture(L.cubeData, 64, 64, 6);
      L.cubeTex.type = THREE.HalfFloatType; L.cubeTex.format = THREE.RGBAFormat;
      L.cubeTex.generateMipmaps = true; L.cubeTex.minFilter = THREE.LinearMipmapLinearFilter; L.cubeTex.magFilter = THREE.LinearFilter;
      L.cubeMat = new THREE.ShaderMaterial({
        uniforms: { tSky: { value: v._skyRT.texture }, uFace: { value: 0 } },
        vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
        fragmentShader: [
          'uniform sampler2D tSky; uniform int uFace; varying vec2 vUv;',
          'void main() {',
          '  vec2 m = (vUv - 0.5) * 2.0; vec3 d;',   // minor axes, major = +-1
          '  if(uFace == 0) d = vec3(1.0, m.x, m.y); else if(uFace == 1) d = vec3(-1.0, m.x, m.y);',
          '  else if(uFace == 2) d = vec3(m.x, 1.0, m.y); else if(uFace == 3) d = vec3(m.x, -1.0, m.y);',
          '  else if(uFace == 4) d = vec3(m.x, m.y, 1.0); else d = vec3(m.x, m.y, -1.0);',
          '  vec3 w = normalize(vec3(d.x, d.y, -d.z));',   // its (a, b, c) = world (x, y, -z)
          '  w.y = max(w.y, 0.0);',
          '  vec2 uv = vec2(atan(w.z, w.x) * 0.1591549 + 0.5, asin(clamp(w.y, -1.0, 1.0)) * 0.3183099 + 0.5);',
          '  gl_FragColor = vec4(texture2D(tSky, uv).rgb, 1.0);',
          '}'].join('\n')
      });
      L.cubeScene = new THREE.Scene(); L.cubeScene.add(new THREE.Mesh(new THREE.PlaneGeometry(2, 2), L.cubeMat));
      tex.textureUnitPS7 = L.cubeTex;
      var uniforms = { uf_remappedPS: { value: floatsToInts(L.consts) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
                       uP: { value: new THREE.Vector2() }, uSem2: { value: new THREE.Vector4(X['passParameterSem2.x'], X['passParameterSem2.y'], X['passParameterSem2.z'], X['passParameterSem2.w']) } };
      Object.keys(tex).forEach(function(k) { uniforms[k] = { value: tex[k] }; });
      L.uniforms = uniforms;
      L.mat = new THREE.RawShaderMaterial({
        glslVersion: THREE.GLSL3, uniforms: uniforms, depthTest: false, depthWrite: false,
        vertexShader: [
          'in vec3 position; in vec2 uv; uniform vec2 uP; uniform vec4 uSem2;',
          'out vec4 passParameterSem0; out vec4 passParameterSem2; out vec4 passParameterSem6;',
          'void main() {',
          // the game's v runs down the screen; our images run up, so sample with ours and
          // build the camera ray from the game's
          '  float vd = 1.0 - uv.y;',
          '  passParameterSem0 = vec4(uv.x, uv.y, -(2.0 * uv.x - 1.0) / uP.x, (2.0 * vd - 1.0) / uP.y);',
          '  passParameterSem2 = uSem2; passParameterSem6 = vec4(uv.x, uv.x, uv.x, uv.y);',
          '  gl_Position = vec4(position.xy, 0.0, 1.0);',
          '}'].join('\n'),
        fragmentShader: src.replace(/^#version 300 es\n/, '')
      });
      L.scene = new THREE.Scene(); L.scene.add(new THREE.Mesh(new THREE.PlaneGeometry(2, 2), L.mat));
      // the game's upsample (b4a72958): the half-resolution lit image to full,
      // following the depth (probe row 228: Sem0 = (u, v, u * 640, v * 360);
      // PS0 the half-resolution image, PS1 full-resolution depth, PS2 half's)
      var up = probe['228'].constants;
      L.upU = { uf_remappedPS: { value: floatsToInts([].concat.apply([], up)) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
                textureUnitPS0: { value: L.out.texture[3] }, textureUnitPS1: { value: L.depthFull.texture }, textureUnitPS2: { value: L.depth.texture } };
      L.upMat = quad(THREE, L.upU, 'passParameterSem0 = vec4(uv, uv * vec2(' + HW + '.0, ' + HH + '.0));', ['passParameterSem0'], L.upSrc);
      L.upScene = new THREE.Scene(); L.upScene.add(new THREE.Mesh(new THREE.PlaneGeometry(2, 2), L.upMat));
      // the sky, drawn after the light pass where nothing else is (as the game draws its
      // own): street view's scattering sky for now
      L.skyMat = new THREE.ShaderMaterial({
        uniforms: { tLit: { value: L.hdr.texture }, tFwd: { value: L.sky.texture }, tDepth: { value: L.depthFull.texture } },
        vertexShader: 'varying vec2 vUv; void main() { vUv = uv; gl_Position = vec4(position.xy, 0.0, 1.0); }',
        fragmentShader: 'uniform sampler2D tLit, tFwd, tDepth; varying vec2 vUv; void main() {' +
          ' float d = texture2D(tDepth, vUv).x; gl_FragColor = d > 0.3 ? texture2D(tFwd, vUv) : texture2D(tLit, vUv); }'
      });
      L.skyScene = new THREE.Scene(); L.skyScene.add(new THREE.Mesh(new THREE.PlaneGeometry(2, 2), L.skyMat));
      // the game's tone map (37040a48: PS0 bloom, PS1 the HDR image; C[0] probed)
      var tm = probe['80'].constants;
      L.toneU = { uf_remappedPS: { value: floatsToInts([].concat.apply([], tm)) }, uf_fragCoordScale: { value: new THREE.Vector2(1, 1) },
                  textureUnitPS0: { value: solid(THREE, 0, 0, 0, 1) }, textureUnitPS1: { value: L.hdr2.texture } };
      L.toneMat = quad(THREE, L.toneU, 'passParameterSem0 = vec4(uv, 0.0, 0.0);', ['passParameterSem0'], L.toneSrc);
      L.toneScene = new THREE.Scene(); L.toneScene.add(new THREE.Mesh(new THREE.PlaneGeometry(2, 2), L.toneMat));
      return L;
    });
  }

  // Our camera and sun into the game's constants: C[2..4] camera to world,
  // C[11..14] world to camera, C[15] the sun's light direction in view space.
  function cameraConstants(v, L) {
    var c = L.consts.slice(), cam = v.camera, mw = cam.matrixWorld.elements, mi = cam.matrixWorldInverse.elements;
    for(var r = 0; r < 3; r++) {
      c.splice((2 + r) * 4, 4, mw[r], mw[4 + r], mw[8 + r], mw[12 + r]);
      c.splice([8, 5, 6][r] * 4, 4, mw[r], mw[4 + r], mw[8 + r], mw[12 + r]);   // the same rows, for the sky cube's lookup
    }
    // world -> camera rows into C[11], C[12], C[14] (C[13] holds a scale)
    [[11, 0], [12, 1], [14, 2]].forEach(function(p) { c.splice(p[0] * 4, 4, mi[p[1]], mi[4 + p[1]], mi[8 + p[1]], mi[12 + p[1]]); });
    var s = v.sunDir || v._sunAt(v.hour), THREE = v.lib.THREE;
    var d = new THREE.Vector3(-s[0], -s[1], -s[2]).transformDirection(cam.matrixWorldInverse);
    c.splice(15 * 4, 3, d.x, d.y, d.z);
    L.uniforms.uf_remappedPS.value = floatsToInts(c);
    L.uniforms.uP.value.set(cam.projectionMatrix.elements[0], cam.projectionMatrix.elements[5]);
  }

  function render(v, L) {
    var r = v.renderer, cam = v.camera, keep = r.getRenderTarget();
    cam.updateMatrixWorld();
    r.setRenderTarget(L.gbuf); r.clear(); r.render(v.scene, cam);
    L.depthMat.uniforms.uNear.value = cam.near; L.depthMat.uniforms.uFar.value = cam.far;
    r.setRenderTarget(L.depth); r.render(L.depthScene, L.quadCam);
    r.setRenderTarget(L.depthFull); r.render(L.depthScene, L.quadCam);
    var gl = r.getContext();
    for(var f = 0; f < 6; f++) {
      L.cubeMat.uniforms.uFace.value = f; r.setRenderTarget(L.face); r.render(L.cubeScene, L.quadCam);
      gl.readPixels(0, 0, 64, 64, gl.RGBA, gl.HALF_FLOAT, L.cubeData.subarray(f * 64 * 64 * 4, (f + 1) * 64 * 64 * 4));
    }
    L.cubeTex.needsUpdate = true;
    cameraConstants(v, L);
    r.setRenderTarget(L.out); r.render(L.scene, L.quadCam);
    r.setRenderTarget(L.hdr); r.render(L.upScene, L.quadCam);
    if(v.skyDome) { r.setRenderTarget(L.sky); r.clear(); r.render(v.skyDome, cam); }
    r.setRenderTarget(L.hdr2); r.render(L.skyScene, L.quadCam);
    r.setRenderTarget(L.final); r.render(L.toneScene, L.quadCam);
    r.setRenderTarget(keep);
  }

  // The five outputs, read back and shown (tone mapped for the eye).
  function show(v, L) {
    var r = v.renderer, gl = r.getContext(), el = document.getElementById('zlightpass'); if(el) el.remove();
    el = document.createElement('div'); el.id = 'zlightpass';
    el.style.cssText = 'position:fixed;inset:0;z-index:100000;background:#111;color:#eee;font:12px system-ui;overflow:auto;padding:8px';
    el.innerHTML = '<div>BotW light pass (bec68ec6) on street view: its five outputs, 640 x 360 (click to close)</div>';
    var stats = [];
    for(var i = 0; i < 5; i++) {
      var px = new Uint16Array(HW * HH * 4);
      r.setRenderTarget(L.out, 0); gl.readBuffer(gl.COLOR_ATTACHMENT0 + i);
      gl.readPixels(0, 0, HW, HH, gl.RGBA, gl.HALF_FLOAT, px);
      var f = new Float32Array(px.length);
      for(var j = 0; j < px.length; j++) { var h = px[j], e = (h >> 10) & 31, m = h & 1023, sgn = h >> 15 ? -1 : 1;
        f[j] = sgn * (e === 0 ? m / 1024 * Math.pow(2, -14) : e === 31 ? (m ? NaN : Infinity) : (1 + m / 1024) * Math.pow(2, e - 15)); }
      var mean = [0, 0, 0, 0], max = [0, 0, 0, 0];
      for(j = 0; j < f.length; j++) { mean[j % 4] += f[j] / (HW * HH); max[j % 4] = Math.max(max[j % 4], Math.abs(f[j])); }
      stats.push({ out: i, mean: mean.map(function(x) { return +x.toFixed(4); }), max: max.map(function(x) { return +x.toFixed(3); }) });
      var c = document.createElement('canvas'); c.width = HW; c.height = HH; c.style.cssText = 'margin:4px;width:31%';
      var g = c.getContext('2d'), img = g.createImageData(HW, HH), sc = Math.max(1e-6, max[0], max[1], max[2]);
      for(var y = 0; y < HH; y++) for(var x = 0; x < HW; x++) {
        var s = ((HH - 1 - y) * HW + x) * 4, t = (y * HW + x) * 4;
        for(var k = 0; k < 3; k++) img.data[t + k] = Math.pow(Math.max(0, f[s + k]) / sc, 1 / 2.2) * 255;
        img.data[t + 3] = 255;
      }
      g.putImageData(img, 0, 0); c.title = 'output ' + i; el.appendChild(c);
    }
    r.setRenderTarget(null);
    var pre = document.createElement('pre'); pre.textContent = JSON.stringify(stats); el.appendChild(pre);
    el.onclick = function() { el.remove(); };
    document.body.appendChild(el);
    return stats;
  }

  var L = null;
  // The finished frame for compare.js (ZCompare.run('field-day', ZLightPass.frame)): the
  // game's light pass, upsample and tone map, at the reference's camera; pixels top row first.
  function frame(v, ref) {
    var cam = v.camera, keep = { fov: cam.fov, aspect: cam.aspect };
    cam.fov = ref.fovy; cam.aspect = ref.w / ref.h; cam.updateProjectionMatrix();
    v._walk(0); cam.updateMatrixWorld(); if(v._cloudU) v._cloudU.uCloudCam.value.copy(cam.matrixWorld);
    render(v, L);
    var gl = v.renderer.getContext(), px = new Uint8ClampedArray(W * H * 4), out = new Uint8ClampedArray(W * H * 4), row = W * 4;
    v.renderer.setRenderTarget(L.final); gl.readPixels(0, 0, W, H, gl.RGBA, gl.UNSIGNED_BYTE, px); v.renderer.setRenderTarget(null);
    for(var y = 0; y < H; y++) out.set(px.subarray((H - 1 - y) * row, (H - y) * row), y * row);
    for(var i = 3; i < out.length; i += 4) out[i] = 255;
    cam.fov = keep.fov; cam.aspect = keep.aspect; cam.updateProjectionMatrix();
    return out;
  }
  return {
    frame: function(v, ref) { return frame(v, ref); },
    buffers: function() { return L; },   // (for looking into)
    prepare: function() {
      var v = ZStreetView.current; patchMaterials(v);
      return fetch('/dev/botw3d/reference/probe-6.json?' + Date.now()).then(function(r) { return r.json(); })
        .then(function(probe) { return L ? L : setup(v, probe); }).then(function(l) { L = l; });
    },
    run: function() {
      var v = ZStreetView.current; if(!v) throw new Error('Open street view first');
      var n = patchMaterials(v);
      return fetch('/dev/botw3d/reference/probe-6.json?' + Date.now()).then(function(r) { return r.json(); })
        .then(function(probe) { return L ? L : setup(v, probe); })
        .then(function(l) {
          L = l;
          return new Promise(function(res) { requestAnimationFrame(function() { requestAnimationFrame(res); }); });   // let the patched materials compile
        }).then(function() { render(v, L); return { patched: n, stats: show(v, L) }; });
    }
  };
})();
