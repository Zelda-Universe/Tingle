// 3D maps (map.kind '3d': BotW's Divine Beasts, staff-only while they're
// built). The map is a layer like any other: Switch Map lists it, and while
// it's the current map it covers the 2D map with the game's own model
// (images/3d/<game>/<map>/model.glb, the submap's tile_url), drawn with three.js.
// Its markers are the site's own (their icons, their marker pages); their x
// and y are the game's ground coordinates and z its height. A Map / Textured
// pill, as the age pill (OotFloors.js), switches between the Sheikah Slate's
// hologram look and the textured model, which stands in its surroundings
// (environment.glb, when the folder has one: the field's terrain and water
// around it, already in the model's own frame).
var ZMap3D = (function() {
  var THREE_URL = 'https://cdn.jsdelivr.net/npm/three@0.160.0/';
  var libs = null;
  function load() {
    if(!libs) libs = Promise.all([
      import(THREE_URL + '+esm'),
      import(THREE_URL + 'examples/jsm/controls/OrbitControls.js/+esm'),
      import(THREE_URL + 'examples/jsm/loaders/GLTFLoader.js/+esm'),
      import(THREE_URL + 'examples/jsm/renderers/CSS2DRenderer.js/+esm'),
      import(THREE_URL + 'examples/jsm/postprocessing/EffectComposer.js/+esm'),
      import(THREE_URL + 'examples/jsm/postprocessing/RenderPass.js/+esm'),
      import(THREE_URL + 'examples/jsm/postprocessing/UnrealBloomPass.js/+esm'),
      import(THREE_URL + 'examples/jsm/postprocessing/OutputPass.js/+esm')
    ]).then(function(m) {
      return { THREE: m[0], OrbitControls: m[1].OrbitControls, GLTFLoader: m[2].GLTFLoader, CSS2D: m[3],
        EffectComposer: m[4].EffectComposer, RenderPass: m[5].RenderPass,
        UnrealBloomPass: m[6].UnrealBloomPass, OutputPass: m[7].OutputPass };
    });
    return libs;
  }

  var Layer = L.Layer.extend({
    initialize: function(zmap, vMap) {
      var submap = vMap.subMap[0];
      this.zmap = zmap;
      this.folder = submap.tileURL;
      this.submapId = submap.id;
      this.options = { label: vMap.name, iconURL: submap.tileURL + 'icon.webp', attribution: vMap.mapCopyright };
      this.mode = 'map';
    },
    // What Switch Map's swap (ZLayers.js _swapMapLayer) asks of a map layer,
    // as of a tile layer: it's put under the map on screen, hidden by its
    // container until loaded ('load', once the model's in), then the old map
    // fades away over it.
    bringToBack: function() { return this; },
    getContainer: function() { return this.view; },
    isLoading: function() { return !this._loaded; },
    onAdd: function(map) {
      this._map = map;
      this._loaded = false;
      var container = map.getContainer();
      container.classList.add('zm-3d-active');
      ['dragging', 'scrollWheelZoom', 'doubleClickZoom', 'boxZoom', 'keyboard', 'touchZoom'].forEach(function(h) {
        if(map[h] && map[h].enabled()) { map[h].disable(); (this._disabled = this._disabled || []).push(h); }
      }, this);
      this.view = L.DomUtil.create('div', 'zm-3d-view', container);
      L.DomEvent.disableClickPropagation(this.view);
      L.DomEvent.disableScrollPropagation(this.view);
      this._buildPill();
      this._zoomButtons(true);
      var layer = this;
      load().then(function(lib) { if(layer.view) layer._start(lib); })
        .catch(function(e) { console.error(e); if(window.toastr) toastr.error('The 3D map could not load.'); });
    },
    onRemove: function(map) {
      if(this._frame) cancelAnimationFrame(this._frame);
      if(this.composer) { this.composer.dispose(); this.composer = null; }
      if(this.renderer) { this.renderer.dispose(); this.renderer = null; }
      this.scene = null; this.env = null; this._envLoading = false; this._zoomAt = null; this._pin = null;
      if(this._onPinLayer) { map.off('layeradd layerremove', this._onPinLayer); this._onPinLayer = null; }
      if(this.zmap._limitCategoriesToMap) this.zmap._limitCategoriesToMap(null);
      this._zoomButtons(false);
      if(this._resize) window.removeEventListener('resize', this._resize);
      if(this.view) { this.view.remove(); this.view = null; }
      if(this.pill) { this.pill.remove(); this.pill = null; }
      this._joints = null;
      map.getContainer().classList.remove('zm-3d-active');
      (this._disabled || []).forEach(function(h) { map[h].enable(); });
      this._disabled = [];
    },
    // Map / Textured, built as the age pill is (OotFloors.js), where the floor switch goes.
    _buildPill: function() {
      var layer = this;
      this.pill = L.DomUtil.create('div', 'oot-floor-control zm-3d-mode', document.body);
      var pill = L.DomUtil.create('div', 'oot-floor-pill oot-age-pill', this.pill);
      pill.setAttribute('aria-label', 'Map style');
      ['Map', 'Textured'].forEach(function(name) {
        var b = L.DomUtil.create('button', '', pill);
        b.type = 'button'; b.textContent = name; b.dataset.mode = name.toLowerCase();
        b.setAttribute('aria-pressed', String(layer.mode === b.dataset.mode));
        b.onclick = function() { layer.setMode(b.dataset.mode); };
      });
      L.DomEvent.disableClickPropagation(this.pill);
      // Where the floor switch goes: just above the zoom buttons (OotFloors.js).
      var zoom = document.querySelector('.leaflet-control-zoom');
      this.pill.style.bottom = (zoom ? Math.max(16, window.innerHeight - zoom.getBoundingClientRect().top + 12) : 16) + 'px';
    },
    setMode: function(mode) {
      this.mode = mode;
      if(this.pill) this.pill.querySelectorAll('button').forEach(function(b) { b.setAttribute('aria-pressed', String(b.dataset.mode === mode)); });
      if(this.view) this.view.classList.toggle('zm-3d-map', mode === 'map');
      this._applyLook(mode);
      if(!this.model) return;
      var self = this;
      this.grid.visible = mode === 'map';
      if(mode === 'textured') this._loadEnvironment();
      if(this.env) this.env.visible = mode === 'textured';
      this.model.traverse(function(o) {
        if(!o.isMesh) return;
        o.userData.textured = o.userData.textured || o.material;
        o.material = mode === 'map' ? self.holo : o.userData.textured;
        if(!o.userData.edges) {
          o.userData.edges = new self.lib.THREE.LineSegments(new self.lib.THREE.EdgesGeometry(o.geometry, 35), self.edgeMat);
          o.add(o.userData.edges);
        }
        o.userData.edges.visible = mode === 'map';
      });
    },
    // Textured, as the game lights it (as near as three.js comes): a low
    // morning sun casting shadows, sky light from all round, filmic tone
    // mapping, bloom on what glows, haze in the distance, a sky behind. Map
    // is the hologram over the page's grid: none of it.
    _applyLook: function(mode) {
      if(!this.scene) return;
      var textured = mode === 'textured', THREE = this.lib.THREE;
      this.scene.background = textured ? this.sky : null;
      this.scene.environment = textured ? this.envMap : null;
      this.scene.fog = textured ? this.fog : null;
      this.sun.castShadow = textured;
      this.sun.intensity = textured ? 2.4 : 1.4;
      this.hemi.intensity = textured ? 0.5 : 1.6;
    },
    // The game's material, beyond what glTF says (build_model.py): a second
    // layer (moss, wear) blended in by the vertex colours' alpha (_blend), its
    // normal map with it; metal masks; emission bright enough to bloom.
    _gameMaterials: function(gltf) {
      var THREE = this.lib.THREE, parser = gltf.parser, cache = {};
      var tex = function(i, srgb) {
        if(i == null) return Promise.resolve(null);
        if(!cache[i]) cache[i] = parser.getDependency('texture', i);
        return cache[i].then(function(t) { if(srgb) t.colorSpace = THREE.SRGBColorSpace; return t; });
      };
      gltf.scene.traverse(function(o) {
        if(!o.isMesh || !o.material || !o.material.isMeshStandardMaterial) return;
        o.castShadow = o.receiveShadow = true;
        var m = o.material, x = m.userData || {};
        if(m.emissiveMap) m.emissiveIntensity = 3;
        if(x.metal != null) tex(x.metal).then(function(t) { m.metalnessMap = t; m.metalness = 1; m.roughness = 0.45; m.needsUpdate = true; });
        if(x.layer2Albedo == null || !o.geometry.attributes._blend) return;
        Promise.all([tex(x.layer2Albedo, true), tex(x.layer2Normal)]).then(function(t) {
          var map2 = t[0], normal2 = t[1];
          m.onBeforeCompile = function(shader) {
            shader.uniforms.map2 = { value: map2 };
            shader.uniforms.normalMap2 = { value: normal2 };
            shader.vertexShader = 'attribute float _blend;\nvarying float vBlend;\n' +
              shader.vertexShader.replace('#include <uv_vertex>', '#include <uv_vertex>\nvBlend = _blend;');
            shader.fragmentShader = 'uniform sampler2D map2;\nuniform sampler2D normalMap2;\nvarying float vBlend;\n' + shader.fragmentShader
              .replace('#include <map_fragment>', '#include <map_fragment>\ndiffuseColor.rgb = mix(diffuseColor.rgb, diffuse * texture2D(map2, vMapUv).rgb, vBlend);')
              .replace('vec3 mapN = texture2D( normalMap, vNormalMapUv ).xyz * 2.0 - 1.0;',
                'vec3 mapN = mix(texture2D( normalMap, vNormalMapUv ).xyz, ' + (normal2 ? 'texture2D( normalMap2, vNormalMapUv ).xyz' : 'vec3(0.5, 0.5, 1.0)') + ', vBlend) * 2.0 - 1.0;');
          };
          m.customProgramCacheKey = function() { return 'zm-layer2' + (normal2 ? 'n' : ''); };
          m.needsUpdate = true;
        });
      });
    },
    // The parts of a Beast the Sheikah Slate moves, as the game has them. By
    // node (the map unit's actor):
    //  - hinge: the node's origin, where the dungeon's DungeonRotateTag stands
    //    (RemainsWater_Static: its Rotate turns the tag's axis, RotateAxisIndex
    //    1, onto the model's x; raising turns the trunk about -x);
    //  - levels: the notches it moves between, in radians from where the model
    //    rests (InitDgnRotRad 0, the lowest): the Lv0-Lv9 of its AI program,
    //    DungeonRotateAppWater (DungeonRotateTag4WaterApp);
    //  - motion: how it gets there, per frame at the game's 30 a second (its
    //    DungeonRotate2Target action): speeding up by accel, slowing by slow
    //    within slowWithin of the notch (never below minSpeed), braking by
    //    reverse when sent back the other way.
    // The game's "Divine Beast Controls" legend in the corner, hidden for now
    // (the notches on the model stay). True shows it again.
    SHOW_JOINT_LEGEND: false,
    JOINTS: {
      DgnObj_IbutsuWaterNose_A_01: {
        label: 'Trunk', axis: [-1, 0, 0],
        levels: [0, 0.349066, 0.698132, 1.0472, 1.309, 1.61443, 2.00713, 2.18166, 2.44346, 2.61799],
        motion: { accel: 8.72665e-05, slow: 0.000174533, slowWithin: 0.0872665, minSpeed: 0.00174533, reverse: 0.00261799 }
      }
    },
    _buildJoints: function() {
      var layer = this, THREE = this.lib.THREE, joints = [];
      Object.keys(this.JOINTS).forEach(function(name) {
        var node = layer.model.getObjectByName(name);
        if(node) joints.push({ node: node, spec: layer.JOINTS[name], base: node.quaternion.clone(),
          axis: new THREE.Vector3().fromArray(layer.JOINTS[name].axis), angle: 0, target: 0, speed: 0, q: new THREE.Quaternion() });
      });
      if(!joints.length) return;
      this._joints = joints;
      // The markers on a moving part (the chest at the trunk's tip) go with it.
      this.model.updateMatrixWorld(true);
      joints.forEach(function(joint) {
        var box = new THREE.Box3().setFromObject(joint.node).expandByScalar(2);
        (layer._markerObjs || []).forEach(function(obj) {
          if(obj.parent === layer.scene && box.containsPoint(obj.position)) joint.node.attach(obj);
        });
        layer._buildNotches(joint);
        layer._buildGauge(joint);
      });
      // The game's own legend for it, bottom right: what the control does.
      if(this.pill && this.SHOW_JOINT_LEGEND) {
        var legend = L.DomUtil.create('div', 'zm-slate-legend');
        legend.innerHTML = '<b>Divine Beast Controls</b><span><i class="zm-slate-key">\u2195</i> Move ' + joints[0].spec.label + '</span>' +
          '<span><i class="zm-slate-key">\u2713</i> Let go to execute</span>';
        this.pill.insertBefore(legend, this.pill.firstChild);
      }
    },
    // Sends a part to an angle (radians from rest, raising).
    _moveJoint: function(joint, angle) {
      var levels = joint.spec.levels;
      joint.target = Math.min(levels[levels.length - 1], Math.max(levels[0], angle));
    },
    // A frame of the game's DungeonRotate2Target, for each part on its way.
    _stepJoints: function(dt) {
      var layer = this;
      (this._joints || []).forEach(function(joint) {
        var m = joint.spec.motion;
        joint._frames = (joint._frames || 0) + dt * 30;
        var moved = false;
        for(; joint._frames >= 1; joint._frames--) {
          var diff = joint.target - joint.angle;
          if(diff === 0 && joint.speed === 0) { joint._frames = 0; break; }
          var dir = diff > 0 ? 1 : -1, v = joint.speed;
          if(v * dir < 0) v += dir * m.reverse;                    // going the other way: brake first
          else {
            var sp = Math.abs(v);
            sp = Math.abs(diff) <= m.slowWithin ? Math.max(sp - m.slow, m.minSpeed) : sp + m.accel;
            v = dir * sp;
          }
          joint.angle += v; joint.speed = v; moved = true;
          if((joint.target - joint.angle) * dir <= 0 && v * dir > 0) { joint.angle = joint.target; joint.speed = 0; }
        }
        if(!moved) return;
        joint.q.setFromAxisAngle(joint.axis, joint.angle);
        joint.node.quaternion.copy(joint.base).multiply(joint.q);
        layer._syncNotches(joint);
      });
    },
    // The Sheikah Slate's control for it, on the model as the game draws it
    // (its Vah Ruta map: "Divine Beast Controls"): a magenta drop for each
    // notch, round the arc its tip sweeps, each pointing out from the hinge;
    // the one picked big and white with orange brackets, chevrons leading to
    // it. Drag along them (or click one) and let go: the part moves there.
    _buildNotches: function(joint) {
      var layer = this, THREE = this.lib.THREE, spec = joint.spec, lib = this.lib;
      var hinge = new THREE.Vector3(), tip = new THREE.Vector3(), v = new THREE.Vector3();
      joint.node.getWorldPosition(hinge);
      // The tip: the part's farthest point from its hinge.
      var far = 0;
      joint.node.traverse(function(o) {
        if(!o.isMesh) return;
        var pos = o.geometry.attributes.position;
        for(var i = 0; i < pos.count; i += 3) {
          v.fromBufferAttribute(pos, i); o.localToWorld(v);
          var d = v.distanceTo(hinge);
          if(d > far) { far = d; tip.copy(v); }
        }
      });
      var arm = tip.clone().sub(hinge).multiplyScalar(1.22), q = new THREE.Quaternion();
      joint.hinge = hinge; joint.arm = arm;
      joint.marks = spec.levels.map(function(level, i) {
        q.setFromAxisAngle(joint.axis, level);
        var at = hinge.clone().add(arm.clone().applyQuaternion(q));
        var el = document.createElement('button');
        el.type = 'button'; el.className = 'zm-slate-notch';
        el.innerHTML = '<span class="zm-slate-notch-turn"><span class="zm-slate-notch-drop"></span></span>' +
          '<span class="zm-slate-notch-brackets"><i></i><i></i></span>' +
          '<span class="zm-slate-chevrons"><span>&rsaquo;&rsaquo;&rsaquo;&rsaquo;</span></span>';
        el.setAttribute('aria-label', spec.label + ': position ' + (spec.levels.length - i) + ' from the top');
        var obj = new lib.CSS2D.CSS2DObject(el);
        obj.position.copy(at); layer.scene.add(obj);
        return { el: el, obj: obj, level: level, i: i };
      });
      joint.picked = null;
      var pick = function(mark) {
        joint.picked = mark;
        joint.marks.forEach(function(m) { m.el.classList.toggle('is-picked', m === mark); });
        layer._syncNotches(joint);
      };
      var nearest = function(e) {
        var best = null, bd = Infinity;
        joint.marks.forEach(function(m) {
          var r = m.el.getBoundingClientRect(), dx = e.clientX - (r.left + r.width / 2), dy = e.clientY - (r.top + r.height / 2);
          if(dx * dx + dy * dy < bd) { bd = dx * dx + dy * dy; best = m; }
        });
        return best;
      };
      var dragging = null;
      joint.marks.forEach(function(mark) {
        var el = mark.el;
        L.DomEvent.disableClickPropagation(el); L.DomEvent.disableScrollPropagation(el);
        el.addEventListener('pointerdown', function(e) {
          e.preventDefault(); e.stopPropagation();
          el.setPointerCapture(e.pointerId); dragging = el; pick(mark);
        });
        el.addEventListener('pointermove', function(e) { if(dragging === el && el.hasPointerCapture(e.pointerId)) pick(nearest(e)); });
        el.addEventListener('pointerup', function(e) {
          if(dragging !== el) return;
          dragging = null; el.releasePointerCapture(e.pointerId);
          if(joint.picked) layer._moveJoint(joint, joint.picked.level);
        });
        el.addEventListener('pointercancel', function() { dragging = null; pick(null); });
        el.addEventListener('mouseenter', function() { if(!dragging) pick(mark); });
        el.addEventListener('mouseleave', function() { if(!dragging) pick(null); });
        el.addEventListener('focus', function() { pick(mark); });
        el.addEventListener('blur', function() { if(!dragging) pick(null); });
        el.addEventListener('keydown', function(e) {
          var step = { ArrowUp: 1, ArrowRight: 1, ArrowDown: -1, ArrowLeft: -1 }[e.key];
          if(step != null) {
            e.preventDefault();
            var next = joint.marks[Math.min(joint.marks.length - 1, Math.max(0, mark.i + step))];
            next.el.focus();
          } else if(e.key === 'Enter' || e.key === ' ') {
            e.preventDefault(); layer._moveJoint(joint, mark.level);
          }
        });
      });
      this._syncNotches(joint);
    },
    // Each drop points out from the hinge as the view turns, the chevrons
    // come from the part's side of the arc, and the notch it's at is lit.
    _syncNotches: function(joint) {
      if(!joint.marks || !this.camera) return;
      var camera = this.camera, view = this.view, h = joint.hinge.clone().project(camera), w = view.clientWidth, hh = view.clientHeight;
      var hx = (h.x + 1) / 2 * w, hy = (1 - h.y) / 2 * hh;
      // Where on the arc the part is now: the chevrons come from there.
      var now = joint.arm.clone().applyQuaternion(new this.lib.THREE.Quaternion().setFromAxisAngle(joint.axis, joint.angle)).add(joint.hinge).project(camera);
      var nx = (now.x + 1) / 2 * w, ny = (1 - now.y) / 2 * hh;
      joint.marks.forEach(function(m) {
        var p = m.obj.position.clone().project(camera), x = (p.x + 1) / 2 * w, y = (1 - p.y) / 2 * hh;
        m.el.style.setProperty('--zm-out', Math.atan2(y - hy, x - hx) + 'rad');
        var from = Math.abs(nx - x) + Math.abs(ny - y) < 4 ? Math.atan2(y - hy, x - hx) + Math.PI / 2 : Math.atan2(ny - y, nx - x);
        m.el.style.setProperty('--zm-from', from + 'rad');
        m.el.classList.toggle('is-current', Math.abs(joint.angle - m.level) < 0.002);
        m.el.classList.toggle('is-target', joint.target === m.level && Math.abs(joint.angle - m.level) >= 0.002);
      });
    },
    // The corner gauge (as the floor switch is): hidden for now, the on-model
    // notches being the game's control; kept for when a corner control's
    // wanted (a phone, say). Its handle sends the part anywhere on its range.
    _buildGauge: function(joint) {
      if(!this.pill) return;
      var layer = this, spec = joint.spec, R = 46, CX = 14, CY = 58, A0 = -60, A1 = 60;
      var top = spec.levels[spec.levels.length - 1];
      var point = function(deg) { var r = deg * Math.PI / 180; return [CX + R * Math.cos(r), CY - R * Math.sin(r)]; };
      var p0 = point(A0), p1 = point(A1);
      var el = L.DomUtil.create('div', 'oot-floor-pill zm-3d-joint');
      el.hidden = true;
      el.innerHTML = '<svg viewBox="0 0 72 116" width="72" height="116" aria-hidden="true">' +
        '<path class="zm-3d-joint-track" d="M' + p0[0] + ' ' + p0[1] + ' A' + R + ' ' + R + ' 0 0 0 ' + p1[0] + ' ' + p1[1] + '"/>' +
        '<path class="zm-3d-joint-fill"/><line class="zm-3d-joint-arm" x1="' + CX + '" y1="' + CY + '"/>' +
        '<circle class="zm-3d-joint-hinge" cx="' + CX + '" cy="' + CY + '" r="4"/><circle class="zm-3d-joint-handle" r="9"/></svg>' +
        '<span class="zm-3d-joint-label"></span>';
      el.querySelector('.zm-3d-joint-label').textContent = spec.label;
      el.setAttribute('role', 'slider'); el.tabIndex = 0;
      el.setAttribute('aria-label', spec.label); el.setAttribute('aria-valuemin', '0'); el.setAttribute('aria-valuemax', '100');
      this.pill.insertBefore(el, this.pill.firstChild);
      L.DomEvent.disableClickPropagation(el); L.DomEvent.disableScrollPropagation(el);
      var set = function(t) {
        t = Math.min(1, Math.max(0, t)); joint.gaugeT = t;
        layer._moveJoint(joint, t * top);
        var h = point(A0 + (A1 - A0) * t);
        var handle = el.querySelector('.zm-3d-joint-handle'); handle.setAttribute('cx', h[0]); handle.setAttribute('cy', h[1]);
        var arm = el.querySelector('.zm-3d-joint-arm'); arm.setAttribute('x2', h[0]); arm.setAttribute('y2', h[1]);
        el.querySelector('.zm-3d-joint-fill').setAttribute('d', 'M' + p0[0] + ' ' + p0[1] + ' A' + R + ' ' + R + ' 0 0 0 ' + h[0] + ' ' + h[1]);
        el.setAttribute('aria-valuenow', String(Math.round(t * 100)));
      };
      set(0);
      var svg = el.querySelector('svg');
      var fromPointer = function(e) {
        var r = svg.getBoundingClientRect();
        var x = (e.clientX - r.left) / r.width * 72 - CX, y = CY - (e.clientY - r.top) / r.height * 116;
        set((Math.atan2(y, Math.max(x, 0.001)) * 180 / Math.PI - A0) / (A1 - A0));
      };
      el.addEventListener('pointerdown', function(e) { e.preventDefault(); el.setPointerCapture(e.pointerId); fromPointer(e); });
      el.addEventListener('pointermove', function(e) { if(el.hasPointerCapture(e.pointerId)) fromPointer(e); });
      el.addEventListener('keydown', function(e) {
        var step = { ArrowUp: 0.05, ArrowRight: 0.05, ArrowDown: -0.05, ArrowLeft: -0.05 }[e.key];
        if(step != null) { e.preventDefault(); set(joint.gaugeT + step); }
      });
    },
    // The surroundings, loaded the first time Textured is shown.
    _loadEnvironment: function() {
      if(this._envLoading || !this.scene) return;
      this._envLoading = true;
      var layer = this;
      new this.lib.GLTFLoader().load(this.folder + 'environment.glb', function(gltf) {
        if(!layer.scene) return;
        layer.env = gltf.scene; layer.scene.add(gltf.scene);
        gltf.scene.traverse(function(o) {
          if(!o.isMesh) return;
          o.receiveShadow = true;
          if(o.name === 'Water' || (o.parent && o.parent.name === 'Water')) {
            // The game's ripples (water-normal.jpg, from its WaterNrm), two
            // layers drifting across each other; the sky in it, deep teal
            // below.
            var mat = o.material;
            mat.roughness = 0.06; mat.envMapIntensity = 1; mat.color.setRGB(0.02, 0.11, 0.14);
            mat.opacity = 0.9; mat.normalScale.set(0.35, 0.35);
            mat.onBeforeCompile = function(shader) {
              shader.uniforms.uTime = layer._waterTime;
              shader.fragmentShader = 'uniform float uTime;\n' + shader.fragmentShader.replace(
                'vec3 mapN = texture2D( normalMap, vNormalMapUv ).xyz * 2.0 - 1.0;',
                'vec3 mapN = normalize((texture2D( normalMap, vNormalMapUv + uTime * vec2(0.013, 0.007) ).xyz * 2.0 - 1.0)' +
                ' + (texture2D( normalMap, vNormalMapUv * 0.63 + uTime * vec2(-0.008, 0.011) ).xyz * 2.0 - 1.0));');
            };
            mat.customProgramCacheKey = function() { return 'zm-water'; };
          } else { o.material.roughness = 1; o.material.envMapIntensity = 0.25; }
        });
        layer.env.visible = layer.mode === 'textured';
      }, undefined, function() { /* no surroundings for this map */ });
    },
    _start: function(lib) {
      var THREE = lib.THREE, layer = this, view = this.view;
      this.lib = lib;
      var renderer = this.renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
      renderer.setPixelRatio(window.devicePixelRatio);
      renderer.setSize(view.clientWidth, view.clientHeight);
      renderer.toneMapping = THREE.ACESFilmicToneMapping;
      renderer.toneMappingExposure = 0.9;
      renderer.shadowMap.enabled = true; renderer.shadowMap.type = THREE.PCFSoftShadowMap;
      view.appendChild(renderer.domElement);
      var labels = new lib.CSS2D.CSS2DRenderer();
      labels.setSize(view.clientWidth, view.clientHeight);
      // As the 2D map's marker pane, so markers are styled as they are there.
      labels.domElement.className = 'zm-3d-labels leaflet-marker-pane';
      view.appendChild(labels.domElement);
      var scene = this.scene = new THREE.Scene();
      this.hemi = new THREE.HemisphereLight(0xcfe3ff, 0x5a4a35, 1.6); scene.add(this.hemi);
      var sun = this.sun = new THREE.DirectionalLight(0xfff1dc, 1.4); sun.position.set(160, 220, 90); scene.add(sun);
      sun.shadow.mapSize.set(2048, 2048); sun.shadow.bias = -0.0004; sun.shadow.normalBias = 0.4;
      Object.assign(sun.shadow.camera, { left: -170, right: 170, top: 170, bottom: -170, near: 10, far: 700 });
      // Sky light from all round, and a sky: its blue fading to haze at the
      // horizon, the haze the distance fades into.
      // (The light and reflections are the sky's: its gradient and the sun.)
      var skyScene = new THREE.Scene();
      skyScene.add(new THREE.Mesh(new THREE.SphereGeometry(100, 32, 16), new THREE.ShaderMaterial({
        side: THREE.BackSide, depthWrite: false,
        uniforms: { sunDir: { value: sun.position.clone().normalize() } },
        vertexShader: 'varying vec3 vDir; void main() { vDir = normalize(position); gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0); }',
        fragmentShader: 'uniform vec3 sunDir; varying vec3 vDir; void main() {' +
          ' float h = vDir.y; vec3 zenith = vec3(0.16, 0.36, 0.72), horizon = vec3(0.62, 0.74, 0.86), ground = vec3(0.22, 0.24, 0.22);' +
          ' vec3 c = h > 0.0 ? mix(horizon, zenith, pow(h, 0.6)) : mix(horizon, ground, pow(-h, 0.4));' +
          ' c += vec3(1.0, 0.9, 0.75) * (pow(max(dot(vDir, sunDir), 0.0), 600.0) * 40.0 + pow(max(dot(vDir, sunDir), 0.0), 8.0) * 0.4);' +
          ' gl_FragColor = vec4(c, 1.0); }'
      })));
      var pmrem = new THREE.PMREMGenerator(renderer);
      this.envMap = pmrem.fromScene(skyScene, 0, 0.1, 200).texture; pmrem.dispose();
      var sky = document.createElement('canvas'); sky.width = 2; sky.height = 256;
      var g = sky.getContext('2d'), grad = g.createLinearGradient(0, 0, 0, 256);
      grad.addColorStop(0, '#5d8fcf'); grad.addColorStop(0.55, '#a9c6e4'); grad.addColorStop(1, '#d9e4ea');
      g.fillStyle = grad; g.fillRect(0, 0, 2, 256);
      this.sky = new THREE.CanvasTexture(sky); this.sky.colorSpace = THREE.SRGBColorSpace;
      this.fog = new THREE.Fog(0xc9d8e4, 500, 2600);
      var camera = new THREE.PerspectiveCamera(50, view.clientWidth / view.clientHeight, 0.5, 6000);
      camera.position.set(200, 110, 120);
      var controls = new lib.OrbitControls(camera, renderer.domElement);
      controls.target.set(0, 20, 0); controls.enableDamping = true;
      controls.minDistance = 2; controls.maxDistance = 3000;
      this.camera = camera; this.controls = controls;
      this._gestures(THREE);
      // The Sheikah Slate's dungeon map, matched to in-game screenshots: the
      // model as additive cyan light, brightest at its silhouettes and where
      // walls overlap, with soft bright edges over a cyan grid pad.
      this.holo = new THREE.ShaderMaterial({
        transparent: true, depthWrite: false, depthTest: false, side: THREE.DoubleSide, blending: THREE.AdditiveBlending,
        uniforms: { color: { value: new THREE.Color(0x3fa6ff) } },
        vertexShader: 'varying vec3 vN; varying vec3 vV; void main() { vec4 mv = modelViewMatrix * vec4(position, 1.0); vN = normalize(normalMatrix * normal); vV = normalize(-mv.xyz); gl_Position = projectionMatrix * mv; }',
        fragmentShader: 'uniform vec3 color; varying vec3 vN; varying vec3 vV; void main() { float rim = 1.0 - abs(dot(normalize(vN), normalize(vV))); gl_FragColor = vec4(color * (0.05 + 0.2 * pow(rim, 2.0)), 1.0); }'
      });
      this.edgeMat = new THREE.LineBasicMaterial({ color: 0x6cc4ff, transparent: true, opacity: 0.12, blending: THREE.AdditiveBlending, depthWrite: false, depthTest: false });
      this.grid = new THREE.GridHelper(260, 44, 0x2d7fd6, 0x2d7fd6);
      this.grid.material.transparent = true; this.grid.material.opacity = 0.28; this.grid.material.depthWrite = false;
      this.grid.material.blending = THREE.AdditiveBlending; this.grid.position.y = -72; scene.add(this.grid);
      new lib.GLTFLoader().load(this.folder + 'model.glb', function(gltf) {
        if(layer.scene !== scene) return;
        layer.model = gltf.scene; scene.add(gltf.scene); layer._gameMaterials(gltf); layer.setMode(layer.mode);
        layer._buildJoints();
        layer._fit();
        layer._loaded = true; layer.fire('load');
      }, undefined, function(e) { console.error(e); layer._loaded = true; layer.fire('load'); });
      // Bloom, for Textured: what glows (the Beast's lights) bleeds light.
      var composer = this.composer = new lib.EffectComposer(renderer);
      composer.addPass(new lib.RenderPass(scene, camera));
      composer.addPass(new lib.UnrealBloomPass(new THREE.Vector2(view.clientWidth, view.clientHeight), 0.45, 0.5, 0.9));
      composer.addPass(new lib.OutputPass());
      this._addMarkers(scene, lib);
      this._followPin(lib);
      if(this.zmap._limitCategoriesToMap) this.zmap._limitCategoriesToMap(this.submapId);
      this._resize = function() {
        if(!layer.view) return;
        camera.aspect = view.clientWidth / view.clientHeight;
        renderer.setSize(view.clientWidth, view.clientHeight); labels.setSize(view.clientWidth, view.clientHeight);
        composer.setSize(view.clientWidth, view.clientHeight);
        layer._centreInVisibleArea();
      };
      window.addEventListener('resize', this._resize);
      this.setMode(this.mode);
      this._waterTime = { value: 0 };
      var clock = new THREE.Clock();
      var tick = function() {
        if(!layer.renderer) return;
        var dt = Math.min(clock.getDelta(), 0.1);
        layer._waterTime.value = clock.elapsedTime;
        layer._stepJoints(dt);
        controls.update();
        (layer._joints || []).forEach(function(joint) { layer._syncNotches(joint); });
        if(layer.mode === 'textured') composer.render(); else renderer.render(scene, camera);
        labels.render(scene, camera);
        // (The renderer orders the markers by depth: the pin stays over them all.)
        if(layer._pin) layer._pin.element.style.zIndex = '100000';
        layer._frame = requestAnimationFrame(tick);
      };
      tick();
    },
    // The view's centre where the map's visible area's is (beside the drawer
    // on a desktop, above it on a phone: ZMap._visibleMapPadding), as a 2D
    // map's is: the picture shifted rather than the camera, so turning the
    // view still turns it about what's in the middle of what you see.
    _visibleArea: function() {
      var w = this.view.clientWidth, h = this.view.clientHeight;
      var pad = this.zmap._visibleMapPadding ? this.zmap._visibleMapPadding() : { topLeft: [0, 0], bottomRight: [0, 0] };
      var left = pad.topLeft[0], top = pad.topLeft[1];
      var width = Math.max(80, w - left - pad.bottomRight[0]), height = Math.max(80, h - top - pad.bottomRight[1]);
      return { w: w, h: h, left: left, top: top, width: width, height: height };
    },
    _centreInVisibleArea: function() {
      if(!this.camera || !this.view) return;
      var a = this._visibleArea();
      var dx = a.left + a.width / 2 - a.w / 2, dy = a.top + a.height / 2 - a.h / 2;
      this.camera.setViewOffset(a.w, a.h, -dx, -dy, a.w, a.h);
      this.camera.updateProjectionMatrix();
    },
    // The model framed in the visible area, seen from the usual angle, as a 2D
    // map opens fitted to it.
    _fit: function() {
      var THREE = this.lib.THREE, camera = this.camera, controls = this.controls;
      var box = new THREE.Box3().setFromObject(this.model), centre = box.getCenter(new THREE.Vector3());
      var corners = [];
      for(var i = 0; i < 8; i++) corners.push(new THREE.Vector3(i & 1 ? box.max.x : box.min.x, i & 2 ? box.max.y : box.min.y, i & 4 ? box.max.z : box.min.z));
      var dir = new THREE.Vector3(200, 110, 120).normalize(), a = this._visibleArea();
      this._centreInVisibleArea();
      controls.target.copy(centre);
      // Nearest distance at which every corner is inside the visible area.
      var fits = function(d) {
        camera.position.copy(centre).addScaledVector(dir, d); camera.lookAt(centre); camera.updateMatrixWorld();
        return corners.every(function(c) {
          var p = c.clone().project(camera);
          var x = (p.x + 1) / 2 * a.w, y = (1 - p.y) / 2 * a.h;
          return p.z < 1 && x >= a.left && x <= a.left + a.width && y >= a.top && y <= a.top + a.height;
        });
      };
      var lo = 1, hi = 4000;
      for(var n = 0; n < 30; n++) { var mid = (lo + hi) / 2; if(fits(mid)) hi = mid; else lo = mid; }
      camera.position.copy(centre).addScaledVector(dir, hi);
      controls.update();
    },
    // The same gestures as the 2D maps (TrackpadGestureHandler.js, which
    // leaves this view to us): a trackpad's two-finger scroll pans and its
    // pinch zooms (Chrome and Firefox send pinches as ctrl + wheel, Safari as
    // gesture events); a mouse wheel and the zoom buttons zoom. Zooming closes
    // in on what's under the pointer, in proportion to how far the fingers
    // moved. Dragging turns the view; right-, shift- or two-finger-click
    // dragging pans. On touchscreens one finger turns, two pinch and pan
    // (OrbitControls' own touch handling).
    _gestures: function(THREE) {
      var layer = this, view = this.view, camera = this.camera, controls = this.controls;
      var raycaster = new THREE.Raycaster(), ndc = new THREE.Vector2(), plane = new THREE.Plane();
      var last = { t: 0, x: 0, y: 0, p: null }, panUntil = 0;
      // The point under the pointer: the model or its surroundings, or else the
      // depth of the orbit's centre. Kept for the rest of one gesture.
      function pointAt(x, y) {
        var now = Date.now();
        if(last.p && now - last.t < 200 && Math.abs(x - last.x) < 3 && Math.abs(y - last.y) < 3) { last.t = now; return last.p; }
        var r = view.getBoundingClientRect();
        ndc.set((x - r.left) / r.width * 2 - 1, -(y - r.top) / r.height * 2 + 1);
        raycaster.setFromCamera(ndc, camera);
        var meshes = [];
        [layer.model, layer.env].forEach(function(root) {
          if(root && root.visible) root.traverse(function(o) { if(o.isMesh && o.visible && o.name !== 'Water') meshes.push(o); });
        });
        var hit = raycaster.intersectObjects(meshes, false)[0], p = hit ? hit.point.clone() : null;
        if(!p) {
          plane.setFromNormalAndCoplanarPoint(camera.getWorldDirection(new THREE.Vector3()), controls.target);
          p = raycaster.ray.intersectPlane(plane, new THREE.Vector3()) || controls.target.clone();
        }
        last = { t: now, x: x, y: y, p: p };
        return p;
      }
      // factor < 1 zooms in: the camera and the orbit's centre close in on p together.
      function zoomAt(p, factor) {
        var d = camera.position.distanceTo(p);
        factor = Math.min(Math.max(factor, controls.minDistance / d), controls.maxDistance / d);
        camera.position.sub(p).multiplyScalar(factor).add(p);
        controls.target.sub(p).multiplyScalar(factor).add(p);
      }
      // Moves the view with the fingers, by screen pixels at the orbit centre's depth.
      var right = new THREE.Vector3(), up = new THREE.Vector3(), move = new THREE.Vector3();
      function panBy(dx, dy) {
        var perPixel = 2 * Math.tan(camera.fov * Math.PI / 360) * camera.position.distanceTo(controls.target) / view.clientHeight;
        right.setFromMatrixColumn(camera.matrix, 0); up.setFromMatrixColumn(camera.matrix, 1);
        move.copy(right).multiplyScalar(dx * perPixel).addScaledVector(up, -dy * perPixel);
        camera.position.add(move); controls.target.add(move);
      }
      this._zoomAt = function(x, y, factor) { zoomAt(pointAt(x, y), factor); };
      view.addEventListener('wheel', function(e) {
        e.preventDefault(); e.stopPropagation();
        var now = Date.now();
        if(looksLikeTrackpadPinch(e)) {
          layer._zoomAt(e.clientX, e.clientY, Math.exp(Math.max(-30, Math.min(30, e.deltaY)) * 0.012));
          return;
        }
        if(looksLikeTrackpadPan(e)) panUntil = now + 250;
        if(now <= panUntil) { panBy(e.deltaX, e.deltaY); return; }
        var dy = e.deltaY * (e.deltaMode === 1 ? 16 : e.deltaMode === 2 ? view.clientHeight : 1);
        layer._zoomAt(e.clientX, e.clientY, Math.exp(Math.max(-100, Math.min(100, dy)) * 0.002));
      }, { capture: true, passive: false });
      // Safari's trackpad pinch, desktop only (as TrackpadGestureHandler.js):
      // on touchscreens OrbitControls has the pinch.
      if('ongesturestart' in window && !(navigator.maxTouchPoints > 0)) {
        var scale = 1;
        view.addEventListener('gesturestart', function(e) { e.preventDefault(); scale = 1; });
        view.addEventListener('gesturechange', function(e) {
          e.preventDefault();
          layer._zoomAt(e.clientX, e.clientY, scale / e.scale); scale = e.scale;
        });
        view.addEventListener('gestureend', function(e) { e.preventDefault(); });
      }
    },
    // The map's + and - buttons zoom the 3D view (by the centre of the view) while it's shown.
    _zoomButtons: function(on) {
      var layer = this;
      if(!this._onZoomButton) this._onZoomButton = function(e) {
        var b = e.target.closest && e.target.closest('.leaflet-control-zoom-in, .leaflet-control-zoom-out');
        if(!b || !layer._zoomAt || !layer.view) return;
        e.preventDefault(); e.stopPropagation();
        var r = layer.view.getBoundingClientRect(), x = r.left + r.width / 2, y = r.top + r.height / 2;
        var total = b.classList.contains('leaflet-control-zoom-in') ? 0.6 : 1 / 0.6, start = performance.now(), done = 1;
        // A quick move (0.25s), as MapMotion.js's.
        (function step(now) {
          var t = Math.min(1, (now - start) / 250), eased = 1 - Math.pow(1 - t, 3);
          var want = Math.pow(total, eased);
          if(layer._zoomAt) layer._zoomAt(x, y, want / done);
          done = want;
          if(t < 1) requestAnimationFrame(step);
        })(start);
      };
      ['click', 'dblclick'].forEach(function(type) {
        document[on ? 'addEventListener' : 'removeEventListener'](type, this._onZoomButton, true);
      }, this);
    },
    // The Master Sword pin on the selected marker (ZMap._createPin): the 2D
    // map's pin is a Leaflet marker, hidden with the rest of its markers, so
    // a copy of it stands at that marker's place in the model, stabbing in
    // as it does there. Its tip (the pin's anchor) is on the marker's centre.
    _followPin: function(lib) {
      var layer = this, map = this._map;
      var show = function(pin) {
        if(layer._pin) { layer._pin.removeFromParent(); layer._pin = null; }
        var marker = pin && pin._spreadMarker;
        if(!marker || marker.z == null || String(marker.submapId) !== String(layer.submapId) || !layer.scene) return;
        var icon = pin.options.icon, o = icon.options, el = icon.createIcon();
        el.style.marginLeft = (o.iconSize[0] / 2 - o.iconAnchor[0]) + 'px';
        el.style.marginTop = (o.iconSize[1] / 2 - o.iconAnchor[1]) + 'px';
        el.style.pointerEvents = 'none';
        var ll = marker.getLatLng(), obj = layer._pin = new lib.CSS2D.CSS2DObject(el);
        // Where the marker's drawn: on a moving part (the trunk), with it.
        var drawn = (layer._markerObjs || []).find(function(o) { return String(o.userData.markerId) === String(marker.id); });
        if(drawn && drawn.parent) { drawn.parent.add(obj); obj.position.copy(drawn.position); }
        else { obj.position.set(ll.lng, Number(marker.z), ll.lat); layer.scene.add(obj); }
      };
      var isPin = function(l) { return l && l.options && l.options.icon && l.options.icon.options && l.options.icon.options.className === 'sword-pin'; };
      this._onPinLayer = function(e) {
        if(!isPin(e.layer)) return;
        if(e.type === 'layeradd') show(e.layer);
        else if(layer._pin && layer._pinSource === e.layer) show(null);
        if(e.type === 'layeradd') layer._pinSource = e.layer;
      };
      map.on('layeradd layerremove', this._onPinLayer);
      map.eachLayer(function(l) { if(isPin(l)) { layer._pinSource = l; show(l); } });
    },
    // The site's markers on this map, with the icons the 2D map gives them:
    // x, y across (the game's x and z) and z up.
    _addMarkers: function(scene, lib) {
      var zmap = this.zmap, submapId = this.submapId, layer = this;
      this._markerObjs = [];
      zmap.getMarkers().forEach(function(marker) {
        if(String(marker.submapId) !== String(submapId) || marker.z == null || !marker.options.icon) return;
        var ll = marker.getLatLng();
        // The marker's icon as the 2D map draws it zoomed in.
        var icon = marker.categoryId != null && zmap.categories && zmap.categories[marker.categoryId]
          ? zmap._createMarkerIcon(marker.categoryId, marker.complete, 'Medium') : marker.options.icon;
        var el = icon.createIcon();
        el.classList.add('zm-3d-marker');
        el.style.position = 'static'; el.style.margin = '0'; el.title = marker.options.title || '';
        // As a click on it on a 2D map: its page, and the sword pin on it.
        el.addEventListener('click', function(e) { e.stopPropagation(); marker.fire('click'); });
        var obj = new lib.CSS2D.CSS2DObject(el);
        obj.userData.markerId = marker.id;
        (layer._markerObjs = layer._markerObjs || []).push(obj);
        obj.position.set(ll.lng, Number(marker.z), ll.lat);
        scene.add(obj);
      });
    }
  });
  return { layer: function(zmap, vMap) { return new Layer(zmap, vMap); } };
})();
