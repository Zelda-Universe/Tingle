"""BotW models (BFRES) into one glTF binary, with what the game's own shader
(uking_mat) draws them with, as near as glTF and three.js come:

- albedo (_Alb), normal map (_Nrm: X and Y only, Z rebuilt) and emission
  (_Emm: a mask, tinted, or its own colours);
- the second albedo / normal layer of blended materials (moss, wear), blended
  in by the vertex colours' alpha: the _BLEND attribute, and the layer's
  textures in the material's extras (Map3D.js blends them);
- the vertex colours' RGB, the game's baked ambient occlusion: COLOR_0;
- metal masks (_Mtl) in the extras too;
- tangents, for the normal maps.

The game's per-material colour combiner (uking_colorN_*) isn't followed: the
textures are used by what they are (their names say), which is what it does
for nearly every material.

Used by build_model.py (a Divine Beast) and build_field.py (what stands
around it).
"""
import json, re, math, os, struct, subprocess, tempfile
import numpy as np
import nin, bfres, gx2


def load(path):
    raw = open(path, 'rb').read()
    return nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw


def norm(v):
    l = math.sqrt(sum(x * x for x in v)) or 1
    return tuple(x / l for x in v)


def quat(r):
    """BotW's Rotate (radians: y alone, or x, y, z) as a quaternion."""
    if not r: return [0, 0, 0, 1]
    if not isinstance(r, list): r = [0, r, 0]
    x, y, z = (a / 2 for a in r)
    cx, sx, cy, sy, cz, sz = math.cos(x), math.sin(x), math.cos(y), math.sin(y), math.cos(z), math.sin(z)
    return [sx*cy*cz - cx*sy*sz, cx*sy*cz + sx*cy*sz, cx*cy*sz - sx*sy*cz, cx*cy*cz + sx*sy*sz]


def qmul(a, b):
    ax, ay, az, aw = a; bx, by, bz, bw = b
    return [aw*bx + ax*bw + ay*bz - az*by, aw*by - ax*bz + ay*bw + az*bx,
            aw*bz + ax*by - ay*bx + az*bw, aw*bw - ax*bx - ay*by - az*bz]


class Textures:
    """The textures of one or more .Tex1.sbfres files, by name."""
    def __init__(self, paths):
        self.entries = {}
        for p in paths:
            if not os.path.exists(p): continue
            d = load(p); r = bfres.R(d)
            for name, t in bfres.group(r, r.rel(0x24)):
                self.entries.setdefault(name, (d, r, t))

    def fmt(self, name):
        d, r, t = self.entries[name]
        return r.u32(t + 0x18) & 0x3f

    def decode(self, name, tmp):
        """(pixels HxWx4 uint8, base format)"""
        d, r, t = self.entries[name]
        w, h, fmt, size, tile, swz, pitch = (r.u32(t + 8), r.u32(t + 12), r.u32(t + 0x18), r.u32(t + 0x24),
                                             r.u32(t + 0x34), r.u32(t + 0x38), r.u32(t + 0x40))
        base = fmt & 0x3f
        lin = gx2.untile(d[r.rel(t + 0xB0):r.rel(t + 0xB0) + size], w, h, pitch, fmt, tile, swz)
        if base == 0x34:
            g = gx2.decode_bc4(lin, w, h)
            return np.dstack([g, g, g, np.full_like(g, 255)]), base
        if base == 0x35:
            rr, gg = gx2.decode_bc5(lin, w, h)
            return np.dstack([rr, gg, np.zeros_like(rr), np.full_like(rr, 255)]), base
        p = os.path.join(tmp, 'x.dds'); open(p, 'wb').write(gx2.dds(lin, w, h, fmt))
        rgba = np.frombuffer(magick(p, '-depth', '8', 'rgba:-'), np.uint8).reshape(h, w, 4)
        return rgba, base


def magick(*args, data=None):
    return subprocess.run(['magick', *args], input=data, check=True, capture_output=True).stdout


class TerrainArrays:
    """The terrain's texture arrays (Terrain.Tex1: MaterialAlb, colour;
    MaterialCmb, normal X and Y in red and green), which field objects that
    blend into the ground (their textures 'MaterialAlb' / 'MaterialCmb') draw
    with too, by layer (their texture_array_index params)."""
    def __init__(self, path):
        self.d = load(path); self.r = bfres.R(self.d)
        self.entries = dict(bfres.group(self.r, self.r.rel(0x24)))

    def decode(self, name, layer, tmp):
        r, t = self.r, self.entries[name]
        w, h, fmt, size, tile, swz, pitch, depth = (r.u32(t + 8), r.u32(t + 12), r.u32(t + 0x18), r.u32(t + 0x24),
                                                    r.u32(t + 0x34), r.u32(t + 0x38), r.u32(t + 0x40), r.u32(t + 0x10))
        lin = gx2.untile(self.d[r.rel(t + 0xB0):r.rel(t + 0xB0) + size], w, h, pitch, fmt, tile, swz, min(layer, depth - 1))
        if fmt & 0x3f == 0x34:   # BC4 (the water's WaterEmm), BC5 (WaterNrm): decoded here (ImageMagick doesn't)
            g = gx2.decode_bc4(lin, w, h)
            return np.dstack([g, g, g, np.full_like(g, 255)])
        if fmt & 0x3f == 0x35:
            rr, gg = gx2.decode_bc5(lin, w, h)
            return np.dstack([rr, gg, np.zeros_like(rr), np.full_like(rr, 255)])
        p = os.path.join(tmp, 'a.dds'); open(p, 'wb').write(gx2.dds(lin, w, h, fmt))
        return np.frombuffer(magick(p, '-depth', '8', 'rgba:-'), np.uint8).reshape(h, w, 4)


# The Sheikah's lights (shrines, towers, terminals, Divine Beasts): their
# colour is the page's to give, by state (blue once activated).
SHEIKAH = re.compile(r'Dgn|Remains|Terminal|MapTower|FirstShrine|DRC|Ancient|Entrance|Monyo|WarpPoint|Ibt')

class Builder:
    def __init__(self, out_dir, max_px=512, tex_dir='textures', emission_tint=(1.0, 1.0, 1.0), terrain=None, webp=True):
        self.out, self.max_px, self.tex_dir, self.tint, self.webp = out_dir, max_px, tex_dir, emission_tint, webp
        self.terrain = terrain   # TerrainArrays, for materials drawn with the terrain's textures
        os.makedirs(os.path.join(out_dir, tex_dir), exist_ok=True)
        self.tmp = tempfile.mkdtemp()
        self.bin = bytearray(); self.views, self.accs = [], []
        self.images, self.textures, self.tex_index, self.tex_alpha = [], [], {}, {}
        self.tex_mask = {}   # emission textures that are masks (one channel), tinted by the page
        self.materials, self.mat_index = [], {}
        self.meshes, self.nodes = [], []
        self.extensions = set()

    # --- buffers
    def add(self, data, target, count, typ, comp, normalized=False, mm=None):
        while len(self.bin) % 4: self.bin.append(0)
        view = dict(buffer=0, byteOffset=len(self.bin), byteLength=len(data))
        if target: view['target'] = target
        self.views.append(view); self.bin.extend(data)
        a = dict(bufferView=len(self.views) - 1, componentType=comp, count=count, type=typ)
        if normalized: a['normalized'] = True
        if mm: a['min'], a['max'] = mm
        self.accs.append(a); return len(self.accs) - 1

    # --- textures and materials
    def _save(self, pixels, out_name, alpha=False, quality=85):
        """A texture as a file: WebP (EXT_texture_webp) at up to max_px, the
        game's own size where it's smaller; PNG or JPEG with webp=False."""
        h, w = pixels.shape[:2]
        ext = 'webp' if self.webp else ('png' if alpha else 'jpg')
        rel = '%s/%s.%s' % (self.tex_dir, out_name, ext)
        data = pixels if alpha else pixels[..., :3]
        opts = ['-quality', str(quality)] if (self.webp or not alpha) else []
        if self.webp and alpha: opts += ['-define', 'webp:alpha-quality=90']
        magick('-size', '%dx%d' % (w, h), '-depth', '8', ('rgba' if alpha else 'rgb') + ':-',
               '-resize', '%dx%d>' % (self.max_px, self.max_px), *opts, os.path.join(self.out, rel),
               data=np.ascontiguousarray(data).tobytes())
        return rel

    def _add_image(self, rel):
        self.images.append(dict(uri=rel))
        tex = dict(sampler=0)
        if rel.endswith('.webp'):
            tex['extensions'] = {'EXT_texture_webp': {'source': len(self.images) - 1}}
            self.extensions.add('EXT_texture_webp')
        else:
            tex['source'] = len(self.images) - 1
        self.textures.append(tex)

    def texture(self, texs, name, role):
        key = (name, role)
        if key in self.tex_index: return self.tex_index[key]
        if name not in texs.entries: return None
        px, base = texs.decode(name, self.tmp)
        self.tex_alpha[name] = base == 0x33
        if role == 'normal':
            xy = px[..., :2].astype(np.float32) / 255 * 2 - 1
            z = np.sqrt(np.clip(1 - (xy ** 2).sum(-1), 0, 1))
            px = np.dstack([px[..., 0], px[..., 1], ((z + 1) / 2 * 255).astype(np.uint8), px[..., 3]])
            rel = self._save(px, name, quality=92)
        elif role == 'emission':
            # Sheikah lights are masks the game colours by state (red and green
            # channels for off and on, or plain white): one mask, any channel.
            sheikah = SHEIKAH.search(name) is not None
            if sheikah and base != 0x34: px = np.dstack([px[..., :3].max(-1)] * 3 + [px[..., 3]])
            self.tex_mask[name] = base == 0x34 or sheikah
            if self.tex_mask[name]:   # a mask: tinted
                g = px[..., 0].astype(np.float32)
                px = np.dstack([(g * c).astype(np.uint8) for c in self.tint] + [px[..., 3]])
            rel = self._save(px, name)
        elif role == 'metal':
            rel = self._save(px, name)
        else:
            rel = self._save(px, name, alpha=(base == 0x33))
        self._add_image(rel)
        self.tex_index[key] = len(self.textures) - 1
        return self.tex_index[key]

    def masked_texture(self, texs, alb, msk):
        """An albedo with its alpha from a mask texture's red (cut out)."""
        key = (alb, 'masked', msk)
        if key in self.tex_index: return self.tex_index[key]
        if alb not in texs.entries or msk not in texs.entries: return self.texture(texs, alb, 'albedo')
        px, _ = texs.decode(alb, self.tmp); mk, _ = texs.decode(msk, self.tmp)
        if mk.shape[:2] != px.shape[:2]:
            mk = np.frombuffer(magick('-size', '%dx%d' % (mk.shape[1], mk.shape[0]), '-depth', '8', 'rgba:-',
                                      '-resize', '%dx%d!' % (px.shape[1], px.shape[0]), 'rgba:-', data=mk.tobytes()), np.uint8).reshape(px.shape[0], px.shape[1], 4)
        px = np.dstack([px[..., :3], mk[..., 0]])
        self.tex_alpha[alb] = True
        rel = self._save(px, alb, alpha=True)
        self._add_image(rel)
        self.tex_index[key] = len(self.textures) - 1
        return self.tex_index[key]

    def array_texture(self, name, layer, role):
        """A layer of the terrain's arrays, as a texture of its own."""
        key = ('array', name, layer, role)
        if key in self.tex_index: return self.tex_index[key]
        px = self.terrain.decode(name, layer, self.tmp)
        if role == 'normal':
            xy = px[..., :2].astype(np.float32) / 255 * 2 - 1
            z = np.sqrt(np.clip(1 - (xy ** 2).sum(-1), 0, 1))
            px = np.dstack([px[..., 0], px[..., 1], ((z + 1) / 2 * 255).astype(np.uint8), px[..., 3]])
        rel = self._save(px, 'Terrain%s_%02d' % ('Normal' if role == 'normal' else 'Colour', layer), quality=92 if role == 'normal' else 85)
        self._add_image(rel)
        self.tex_index[key] = len(self.textures) - 1
        return self.tex_index[key]

    def _terrain_material(self, mat, m):
        """A material drawn with the terrain's arrays: its base layer
        (texture_array_index0) and, blended in as the Beast's second layers
        are (the vertex colours' alpha), the next different one."""
        p, o = mat.get('params', {}), mat.get('options', {})
        idx = [int(p.get('texture_array_index%d' % i, (0,))[0]) for i in range(6)]
        # The layers its array slots use (uking_texture_array_textureN), in
        # slot order; else the layers it names at all (0 being unset).
        flagged = [idx[i] for i in range(6) if o.get('uking_texture_array_texture%d' % i) == '1']
        layers = []
        for i in (flagged or [i for i in idx if i]) or [0]:
            if i not in layers: layers.append(i)
        base = layers[0]
        m['pbrMetallicRoughness']['baseColorTexture'] = dict(index=self.array_texture('MaterialAlb', base, 'albedo'))
        m['normalTexture'] = dict(index=self.array_texture('MaterialCmb', base, 'normal'))
        other = layers[1] if len(layers) > 1 else None
        if other is not None and 'Bld' in mat['name']:
            m['extras']['layer2Albedo'] = self.array_texture('MaterialAlb', other, 'albedo')
            m['extras']['layer2Normal'] = self.array_texture('MaterialCmb', other, 'normal')

    @staticmethod
    def by_role(mat):
        """The material's textures by what they are: albedo, normal, emission
        and metal (from their names), in sampler order (_a0 before _a1)."""
        roles = {'Alb': [], 'Nrm': [], 'Emm': [], 'Mtl': []}
        for sampler in sorted(mat['textures']):
            name = mat['textures'][sampler]
            kind = name.rsplit('_', 1)[-1]
            if kind in roles: roles[kind].append(name)
        return roles

    def material(self, mat, texs, extras=None):
        key = mat['name'] + '|' + ','.join(sorted(mat['textures'].values())) + '|' + json.dumps(extras or {}, sort_keys=True)
        if key in self.mat_index: return self.mat_index[key]
        roles = self.by_role(mat)
        o = mat.get('options', {})
        m = dict(name=mat['name'], doubleSided=True,
                 pbrMetallicRoughness=dict(metallicFactor=0, roughnessFactor=0.8), extras=dict(extras or {}))
        # Ice: the game draws it see-through, refracting what's behind.
        if 'Ice' in mat['name']: m['extras']['ice'] = True
        if self.terrain and 'MaterialAlb' in mat['textures'].values():
            self._terrain_material(mat, m)
        elif roles['Alb']:
            # Leaves and the like: their shape in a mask of its own (_Msk, red).
            msk = next((v for v in mat['textures'].values() if v.endswith('_Msk')), None)
            i = self.masked_texture(texs, roles['Alb'][0], msk) if msk else self.texture(texs, roles['Alb'][0], 'albedo')
            if i is not None:
                m['pbrMetallicRoughness']['baseColorTexture'] = dict(index=i)
                if self.tex_alpha.get(roles['Alb'][0]):
                    m['alphaMode'] = 'MASK'; m['alphaCutoff'] = 0.5
        if roles['Nrm'] and o.get('uking_enable_normalmap', '1') == '1':
            i = self.texture(texs, roles['Nrm'][0], 'normal')
            if i is not None: m['normalTexture'] = dict(index=i)
        if roles['Emm'] and o.get('uking_enable_emission') == '1':
            i = self.texture(texs, roles['Emm'][0], 'emission')
            if i is not None:
                m['emissiveTexture'] = dict(index=i); m['emissiveFactor'] = [1, 1, 1]
                # A mask: its colour is the page's to give (a Divine Beast's
                # lights: pink-red while it's held by Malice, blue once freed).
                if self.tex_mask.get(roles['Emm'][0]): m['extras']['glow'] = True
        if len(roles['Alb']) > 1:
            i = self.texture(texs, roles['Alb'][1], 'albedo')
            if i is not None:
                m['extras']['layer2Albedo'] = i
                if len(roles['Nrm']) > 1:
                    j = self.texture(texs, roles['Nrm'][1], 'normal')
                    if j is not None: m['extras']['layer2Normal'] = j
        if roles['Mtl']:
            i = self.texture(texs, roles['Mtl'][0], 'metal')
            if i is not None: m['extras']['metal'] = i
        if not m['extras']: del m['extras']
        self.materials.append(m); self.mat_index[key] = len(self.materials) - 1
        return self.mat_index[key]

    # --- geometry
    def mesh(self, model, texs, material_extras=None):
        """A model (bfres.models' entry) as a mesh: its index."""
        prims = []
        for s in model['shapes']:
            p = s['attrs'].get('_p0', (0, None))[1]
            if not p or s['prim'] != 4: continue
            # (Not the meshes only the Sheikah Slate's map draws.)
            mt = model['mats'][s['mat']] if s['mat'] < len(model['mats']) else None
            if mt and ('IbutsuMap' in mt['name'] or 'IbtMap' in mt['name']): continue
            n = len(p)
            attrs = {}
            attrs['POSITION'] = self.add(b''.join(struct.pack('<3f', *v[:3]) for v in p), 34962, n, 'VEC3', 5126,
                                         mm=([min(v[i] for v in p) for i in range(3)], [max(v[i] for v in p) for i in range(3)]))
            nr = s['attrs'].get('_n0', (0, None))[1]
            if nr and len(nr) == n:
                nr = [norm(v[:3]) for v in nr]
                attrs['NORMAL'] = self.add(b''.join(struct.pack('<3f', *v) for v in nr), 34962, n, 'VEC3', 5126)
            uv = s['attrs'].get('_u0', (0, None))[1]
            if uv and len(uv) == n:
                attrs['TEXCOORD_0'] = self.add(b''.join(struct.pack('<2f', *v[:2]) for v in uv), 34962, n, 'VEC2', 5126)
            tg, bt = s['attrs'].get('_t0', (0, None))[1], s['attrs'].get('_b0', (0, None))[1]
            if nr and tg and len(tg) == n:
                out = []
                for i in range(n):
                    t = norm(tg[i][:3]); nn = nr[i]
                    w = 1.0
                    if bt and len(bt) == n:
                        c = (nn[1] * t[2] - nn[2] * t[1], nn[2] * t[0] - nn[0] * t[2], nn[0] * t[1] - nn[1] * t[0])
                        w = 1.0 if sum(a * b for a, b in zip(c, bt[i][:3])) >= 0 else -1.0
                    out.append(struct.pack('<4f', *t, w))
                attrs['TANGENT'] = self.add(b''.join(out), 34962, n, 'VEC4', 5126)
            col = s['attrs'].get('_c0', (0, None))[1]
            if col and len(col) == n:
                clamp = lambda x: max(0, min(255, int(round(x * 255))))
                # (Colours with fewer than three channels: grey from the first.)
                rgb = lambda c: (c[0], c[1], c[2]) if len(c) >= 3 else (c[0], c[0], c[0])
                attrs['COLOR_0'] = self.add(b''.join(struct.pack('<4B', *(clamp(v) for v in rgb(c)), 255) for c in col),
                                            34962, n, 'VEC4', 5121, normalized=True)
                if len(col[0]) > 3:
                    attrs['_BLEND'] = self.add(b''.join(struct.pack('<f', min(1, max(0, c[3]))) for c in col), 34962, n, 'SCALAR', 5126)
            idx = self.add(b''.join(struct.pack('<I', i) for i in s['idx']), 34963, len(s['idx']), 'SCALAR', 5125)
            mat = model['mats'][s['mat']] if s['mat'] < len(model['mats']) else None
            prim = dict(attributes=attrs, indices=idx)
            if mat: prim['material'] = self.material(mat, texs, material_extras)
            prims.append(prim)
        self.meshes.append(dict(name=model['name'], primitives=prims))
        return len(self.meshes) - 1

    # --- meshes of our own (terrain, water): numpy arrays
    def image_texture(self, rel):
        """A texture from an image file already written (its path from out_dir)."""
        self._add_image(rel)
        return len(self.textures) - 1

    def raw_material(self, m):
        self.materials.append(m)
        return len(self.materials) - 1

    def raw_mesh(self, name, prims):
        """prims: dicts of pos (n x 3), nrm (n x 3), uv (n x 2, optional),
        idx (m) and material. Indices are 16-bit where they fit."""
        import numpy as np
        out = []
        for p in prims:
            pos = np.ascontiguousarray(p['pos'], np.float32); n = len(pos)
            attrs = dict(POSITION=self.add(pos.tobytes(), 34962, n, 'VEC3', 5126,
                                           mm=(pos.min(0).tolist(), pos.max(0).tolist())))
            if p.get('nrm') is not None:
                attrs['NORMAL'] = self.add(np.ascontiguousarray(p['nrm'], np.float32).tobytes(), 34962, n, 'VEC3', 5126)
            if p.get('uv') is not None:
                attrs['TEXCOORD_0'] = self.add(np.ascontiguousarray(p['uv'], np.float32).tobytes(), 34962, n, 'VEC2', 5126)
            idx = np.asarray(p['idx'])
            if n < 65536: ib = self.add(idx.astype(np.uint16).tobytes(), 34963, len(idx), 'SCALAR', 5123)
            else: ib = self.add(idx.astype(np.uint32).tobytes(), 34963, len(idx), 'SCALAR', 5125)
            out.append(dict(attributes=attrs, indices=ib, material=p['material']))
        self.meshes.append(dict(name=name, primitives=out))
        return len(self.meshes) - 1

    def node(self, name, mesh, translation, rotation, scale=None):
        n = dict(name=name, mesh=mesh, translation=list(translation), rotation=list(rotation))
        if scale and list(scale) != [1, 1, 1]: n['scale'] = list(scale)
        self.nodes.append(n); return len(self.nodes) - 1

    def instanced(self, name, mesh, placements):
        """One node drawing a mesh at many places (EXT_mesh_gpu_instancing):
        placements are (translation, rotation quaternion, scale)."""
        n = len(placements)
        t = self.add(b''.join(struct.pack('<3f', *p[0]) for p in placements), None, n, 'VEC3', 5126)
        r = self.add(b''.join(struct.pack('<4f', *p[1]) for p in placements), None, n, 'VEC4', 5126)
        s = self.add(b''.join(struct.pack('<3f', *p[2]) for p in placements), None, n, 'VEC3', 5126)
        self.extensions.add('EXT_mesh_gpu_instancing')
        self.nodes.append(dict(name=name, mesh=mesh, extensions={'EXT_mesh_gpu_instancing': {
            'attributes': {'TRANSLATION': t, 'ROTATION': r, 'SCALE': s}}}))
        return len(self.nodes) - 1

    def write(self, name, generator='Zelda Maps BFRES export'):
        while len(self.bin) % 4: self.bin.append(0)
        gl = dict(asset=dict(version='2.0', generator=generator), scene=0, scenes=[dict(nodes=list(range(len(self.nodes))))],
                  nodes=self.nodes, meshes=self.meshes, materials=self.materials, accessors=self.accs,
                  bufferViews=self.views, buffers=[dict(byteLength=len(self.bin))])
        if self.images:
            gl.update(images=self.images, textures=self.textures,
                      samplers=[dict(wrapS=10497, wrapT=10497, magFilter=9729, minFilter=9987)])
        if self.extensions:
            gl['extensionsUsed'] = sorted(self.extensions)
        js = json.dumps(gl).encode(); js += b' ' * (-len(js) % 4)
        out = struct.pack('<III', 0x46546C67, 2, 12 + 8 + len(js) + 8 + len(self.bin))
        out += struct.pack('<II', len(js), 0x4E4F534A) + js + struct.pack('<II', len(self.bin), 0x004E4942) + bytes(self.bin)
        open(os.path.join(self.out, name), 'wb').write(out)
        return len(out)
