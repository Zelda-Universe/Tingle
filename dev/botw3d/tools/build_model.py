#!/usr/bin/env python3
"""A Divine Beast's model for the 3D map (images/3d/botw/<beast>/model.glb),
with what the game's own shader (uking_mat) draws it with, as near as glTF
and three.js come:

- albedo (_Alb), normal map (_Nrm: X and Y only, Z rebuilt) and emission
  (_Emm: a mask, tinted the Beast's blue, or its own colours);
- the second albedo / normal layer of blended materials (moss, wear), blended
  in by the vertex colours' alpha: the _BLEND attribute, and the layer's
  textures in the material's extras (Map3D.js blends them);
- the vertex colours' RGB, the game's baked ambient occlusion: COLOR_0;
- metal masks (_Mtl) in the extras too;
- tangents, for the normal maps.

The game's per-material colour combiner (uking_colorN_*) isn't followed: the
textures are used by what they are (their names say), which is what it does
for nearly every material here.

python3 build_model.py <BotW content folder> <model name> <map unit objs.json> <output folder>
e.g. build_model.py .../content DgnObj_IbutsuWater_A ../vah-ruta-objs.json ../../../images/3d/botw/vah-ruta
Writes model.glb and textures/.
"""
import json, math, os, struct, subprocess, sys, tempfile
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import nin, bfres, gx2

CONTENT, NAME, OBJS, OUT = sys.argv[1:5]
MAX_PX = 512
EMISSION_TINT = (0.35, 0.8, 1.0)   # a Divine Beast's restored blue

def load(path):
    raw = open(path, 'rb').read()
    return nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw

models = bfres.models(load(os.path.join(CONTENT, 'Model', NAME + '.sbfres')))
texd = load(os.path.join(CONTENT, 'Model', NAME + '.Tex1.sbfres')); tr = bfres.R(texd)
tex_entries = dict(bfres.group(tr, tr.rel(0x24)))
os.makedirs(os.path.join(OUT, 'textures'), exist_ok=True)
tmp = tempfile.mkdtemp()

def magick(*args, data=None):
    return subprocess.run(['magick', *args], input=data, check=True, capture_output=True).stdout

def decode(name):
    """(pixels HxWx4 uint8, base format)"""
    t = tex_entries[name]
    w, h, fmt, size, tile, swz, pitch = (tr.u32(t + 8), tr.u32(t + 12), tr.u32(t + 0x18), tr.u32(t + 0x24),
                                         tr.u32(t + 0x34), tr.u32(t + 0x38), tr.u32(t + 0x40))
    base = fmt & 0x3f
    lin = gx2.untile(texd[tr.rel(t + 0xB0):tr.rel(t + 0xB0) + size], w, h, pitch, fmt, tile, swz)
    if base == 0x34:
        g = gx2.decode_bc4(lin, w, h)
        return np.dstack([g, g, g, np.full_like(g, 255)]), base
    p = os.path.join(tmp, 'x.dds'); open(p, 'wb').write(gx2.dds(lin, w, h, fmt))
    rgba = np.frombuffer(magick(p, '-depth', '8', 'rgba:-'), np.uint8).reshape(h, w, 4)
    return rgba, base

def save(pixels, out_name, alpha=False, quality=85):
    h, w = pixels.shape[:2]
    ext = 'png' if alpha else 'jpg'
    rel = 'textures/%s.%s' % (out_name, ext)
    fmt = 'rgba' if alpha else 'rgb'
    data = pixels if alpha else pixels[..., :3]
    magick('-size', '%dx%d' % (w, h), '-depth', '8', fmt + ':-', '-resize', '%dx%d>' % (MAX_PX, MAX_PX),
           *([] if alpha else ['-quality', str(quality)]), os.path.join(OUT, rel), data=np.ascontiguousarray(data).tobytes())
    return rel

images, textures, tex_index = [], [], {}
def texture(name, role):
    key = (name, role)
    if key in tex_index: return tex_index[key]
    if name not in tex_entries: return None
    px, base = decode(name)
    if role == 'normal':
        xy = px[..., :2].astype(np.float32) / 255 * 2 - 1
        z = np.sqrt(np.clip(1 - (xy ** 2).sum(-1), 0, 1))
        px = np.dstack([px[..., 0], px[..., 1], ((z + 1) / 2 * 255).astype(np.uint8), px[..., 3]])
        rel = save(px, name, quality=92)
    elif role == 'emission':
        if base == 0x34:   # a mask: tinted
            g = px[..., 0].astype(np.float32)
            px = np.dstack([(g * c).astype(np.uint8) for c in EMISSION_TINT] + [px[..., 3]])
        rel = save(px, name)
    elif role == 'metal':
        rel = save(px, name)
    else:
        rel = save(px, name, alpha=(base == 0x33))
    images.append(dict(uri=rel)); textures.append(dict(source=len(images) - 1, sampler=0))
    tex_index[key] = len(textures) - 1
    return tex_index[key]

def by_role(mat):
    """The material's textures by what they are: albedo, normal, emission and
    metal (from their names), in sampler order (_a0 before _a1)."""
    roles = {'Alb': [], 'Nrm': [], 'Emm': [], 'Mtl': []}
    for sampler in sorted(mat['textures']):
        name = mat['textures'][sampler]
        kind = name.rsplit('_', 1)[-1]
        if kind in roles: roles[kind].append(name)
    return roles

materials, mat_index = [], {}
def material(mat):
    key = mat['name'] + '|' + ','.join(sorted(mat['textures'].values()))
    if key in mat_index: return mat_index[key]
    roles = by_role(mat)
    o = mat['options']
    m = dict(name=mat['name'], doubleSided=True,
             pbrMetallicRoughness=dict(metallicFactor=0, roughnessFactor=0.8), extras={})
    if roles['Alb']:
        i = texture(roles['Alb'][0], 'albedo'); m['pbrMetallicRoughness']['baseColorTexture'] = dict(index=i)
        t = tex_entries.get(roles['Alb'][0])
        if t and (tr.u32(t + 0x18) & 0x3f) == 0x33:
            m['alphaMode'] = 'MASK'; m['alphaCutoff'] = 0.5
    if roles['Nrm'] and o.get('uking_enable_normalmap', '1') == '1':
        m['normalTexture'] = dict(index=texture(roles['Nrm'][0], 'normal'))
    if roles['Emm'] and o.get('uking_enable_emission') == '1':
        m['emissiveTexture'] = dict(index=texture(roles['Emm'][0], 'emission')); m['emissiveFactor'] = [1, 1, 1]
    if len(roles['Alb']) > 1:
        m['extras']['layer2Albedo'] = texture(roles['Alb'][1], 'albedo')
        if len(roles['Nrm']) > 1: m['extras']['layer2Normal'] = texture(roles['Nrm'][1], 'normal')
    if roles['Mtl']:
        m['extras']['metal'] = texture(roles['Mtl'][0], 'metal')
    if not m['extras']: del m['extras']
    materials.append(m); mat_index[key] = len(materials) - 1
    return mat_index[key]

# --- geometry
bin_ = bytearray(); views, accs = [], []
def add(data, target, count, typ, comp, normalized=False, mm=None):
    while len(bin_) % 4: bin_.append(0)
    views.append(dict(buffer=0, byteOffset=len(bin_), byteLength=len(data), target=target)); bin_.extend(data)
    a = dict(bufferView=len(views) - 1, componentType=comp, count=count, type=typ)
    if normalized: a['normalized'] = True
    if mm: a['min'], a['max'] = mm
    accs.append(a); return len(accs) - 1

def norm(v):
    l = math.sqrt(sum(x * x for x in v)) or 1
    return tuple(x / l for x in v)

meshes = []
for m in models:
    prims = []
    for s in m['shapes']:
        p = s['attrs'].get('_p0', (0, None))[1]
        if not p or s['prim'] != 4: continue
        n = len(p)
        attrs = {}
        attrs['POSITION'] = add(b''.join(struct.pack('<3f', *v[:3]) for v in p), 34962, n, 'VEC3', 5126,
                                mm=([min(v[i] for v in p) for i in range(3)], [max(v[i] for v in p) for i in range(3)]))
        nr = s['attrs'].get('_n0', (0, None))[1]
        if nr and len(nr) == n:
            nr = [norm(v[:3]) for v in nr]
            attrs['NORMAL'] = add(b''.join(struct.pack('<3f', *v) for v in nr), 34962, n, 'VEC3', 5126)
        uv = s['attrs'].get('_u0', (0, None))[1]
        if uv and len(uv) == n:
            attrs['TEXCOORD_0'] = add(b''.join(struct.pack('<2f', *v[:2]) for v in uv), 34962, n, 'VEC2', 5126)
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
            attrs['TANGENT'] = add(b''.join(out), 34962, n, 'VEC4', 5126)
        col = s['attrs'].get('_c0', (0, None))[1]
        if col and len(col) == n:
            clamp = lambda x: max(0, min(255, int(round(x * 255))))
            attrs['COLOR_0'] = add(b''.join(struct.pack('<4B', clamp(c[0]), clamp(c[1]), clamp(c[2]), 255) for c in col),
                                   34962, n, 'VEC4', 5121, normalized=True)
            if len(col[0]) > 3:
                attrs['_BLEND'] = add(b''.join(struct.pack('<f', min(1, max(0, c[3]))) for c in col), 34962, n, 'SCALAR', 5126)
        idx = add(b''.join(struct.pack('<I', i) for i in s['idx']), 34963, len(s['idx']), 'SCALAR', 5125)
        mat = m['mats'][s['mat']] if s['mat'] < len(m['mats']) else None
        prim = dict(attributes=attrs, indices=idx)
        if mat: prim['material'] = material(mat)
        prims.append(prim)
    meshes.append(dict(name=m['name'], primitives=prims))

def quat(r):
    if not r: return [0, 0, 0, 1]
    if not isinstance(r, list): r = [0, r, 0]
    x, y, z = (a / 2 for a in r)
    cx, sx, cy, sy, cz, sz = math.cos(x), math.sin(x), math.cos(y), math.sin(y), math.cos(z), math.sin(z)
    return [sx*cy*cz - cx*sy*sz, cx*sy*cz + sx*cy*sz, cx*cy*sz - sx*sy*cz, cx*cy*cz + sx*sy*sz]

names = [m['name'] for m in models]
nodes = [dict(name=o['UnitConfigName'], mesh=names.index(o['UnitConfigName']), translation=list(o.get('Translate', [0, 0, 0])),
              rotation=quat(o.get('Rotate'))) for o in json.load(open(OBJS)) if o['UnitConfigName'] in names]
while len(bin_) % 4: bin_.append(0)
gl = dict(asset=dict(version='2.0', generator='Zelda Maps BFRES export'), scene=0, scenes=[dict(nodes=list(range(len(nodes))))],
          nodes=nodes, meshes=meshes, materials=materials, accessors=accs, bufferViews=views,
          buffers=[dict(byteLength=len(bin_))], images=images, textures=textures,
          samplers=[dict(wrapS=10497, wrapT=10497, magFilter=9729, minFilter=9987)])
js = json.dumps(gl).encode(); js += b' ' * (-len(js) % 4)
out = struct.pack('<III', 0x46546C67, 2, 12 + 8 + len(js) + 8 + len(bin_))
out += struct.pack('<II', len(js), 0x4E4F534A) + js + struct.pack('<II', len(bin_), 0x004E4942) + bin_
open(os.path.join(OUT, 'model.glb'), 'wb').write(out)
print(len(nodes), 'nodes,', len(materials), 'materials,', len(images), 'textures,', round(len(out) / 1e6, 1), 'MB of model')
