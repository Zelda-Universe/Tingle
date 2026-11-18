"""Writes BFRES models as one glTF binary: a node per model, a primitive per shape."""
import json, struct

COLORS = [(0.78,0.72,0.6),(0.55,0.62,0.7),(0.7,0.55,0.5),(0.6,0.7,0.55),(0.65,0.6,0.75),(0.75,0.7,0.45)]

def write(models, path, placements=None, textures=None):
    """placements: [(model name, translate, rotate radians xyz)]; None puts each model once at the origin."""
    bin_ = bytearray(); views=[]; accs=[]; meshes=[]; nodes=[]; mats=[]
    def add(data, target):
        while len(bin_) % 4: bin_.append(0)
        views.append(dict(buffer=0, byteOffset=len(bin_), byteLength=len(data), target=target)); bin_.extend(data)
        return len(views) - 1
    textures = textures or {}  # albedo name -> (uri, has alpha)
    images, texs, mat_index = [], [], {}
    def material(mi, m, s):
        alb = m['mats'][s['mat']]['textures'].get('_a0') if s['mat'] < len(m['mats']) else None
        key = alb if alb in textures else ('color', mi)
        if key not in mat_index:
            if alb in textures:
                uri, alpha = textures[alb]
                images.append(dict(uri=uri)); texs.append(dict(source=len(images) - 1, sampler=0))
                mats.append(dict(name=alb, pbrMetallicRoughness=dict(baseColorTexture=dict(index=len(texs) - 1), metallicFactor=0, roughnessFactor=0.9),
                                 doubleSided=True, **({'alphaMode': 'MASK', 'alphaCutoff': 0.5} if alpha else {})))
            else:
                c = COLORS[mi % len(COLORS)]
                mats.append(dict(name=m['name'], pbrMetallicRoughness=dict(baseColorFactor=[*c, 1], metallicFactor=0, roughnessFactor=0.9), doubleSided=True))
            mat_index[key] = len(mats) - 1
        return mat_index[key]
    for mi, m in enumerate(models):
        prims = []
        for s in m['shapes']:
            p = s['attrs'].get('_p0', (0, None))[1]
            if not p or s['prim'] != 4: continue
            n = s['attrs'].get('_n0', (0, None))[1]
            pv = add(b''.join(struct.pack('<3f', *v) for v in p), 34962)
            accs.append(dict(bufferView=pv, componentType=5126, count=len(p), type='VEC3',
                             min=[min(v[i] for v in p) for i in range(3)], max=[max(v[i] for v in p) for i in range(3)]))
            attrs = dict(POSITION=len(accs) - 1)
            if n:
                nv = add(b''.join(struct.pack('<3f', *v) for v in n), 34962)
                accs.append(dict(bufferView=nv, componentType=5126, count=len(n), type='VEC3')); attrs['NORMAL'] = len(accs) - 1
            uv = s['attrs'].get('_u0', (0, None))[1]
            if uv and len(uv) == len(p):
                tv = add(b''.join(struct.pack('<2f', *v[:2]) for v in uv), 34962)
                accs.append(dict(bufferView=tv, componentType=5126, count=len(uv), type='VEC2')); attrs['TEXCOORD_0'] = len(accs) - 1
            iv = add(b''.join(struct.pack('<I', i) for i in s['idx']), 34963)
            accs.append(dict(bufferView=iv, componentType=5125, count=len(s['idx']), type='SCALAR'))
            prims.append(dict(attributes=attrs, indices=len(accs) - 1, material=material(mi, m, s)))
        meshes.append(dict(name=m['name'], primitives=prims))
    import math
    def quat(r):
        if not r: return [0, 0, 0, 1]
        if not isinstance(r, list): r = [0, r, 0]
        x, y, z = (a / 2 for a in r)
        cx, sx, cy, sy, cz, sz = math.cos(x), math.sin(x), math.cos(y), math.sin(y), math.cos(z), math.sin(z)
        # ZYX order (BotW's), as a quaternion
        return [sx*cy*cz - cx*sy*sz, cx*sy*cz + sx*cy*sz, cx*cy*sz - sx*sy*cz, cx*cy*cz + sx*sy*sz]
    names = [m['name'] for m in models]
    for name, t, r in (placements or [(n, [0, 0, 0], None) for n in names]):
        if name in names:
            nodes.append(dict(name=name, mesh=names.index(name), translation=list(t), rotation=quat(r)))
    while len(bin_) % 4: bin_.append(0)
    gl = dict(asset=dict(version='2.0', generator='Zelda Maps BFRES export'), scene=0, scenes=[dict(nodes=list(range(len(nodes))))],
              nodes=nodes, meshes=meshes, materials=mats, accessors=accs, bufferViews=views, buffers=[dict(byteLength=len(bin_))],
              **({'images': images, 'textures': texs, 'samplers': [dict(wrapS=10497, wrapT=10497, magFilter=9729, minFilter=9987)]} if images else {}))
    js = json.dumps(gl).encode(); js += b' ' * (-len(js) % 4)
    out = struct.pack('<III', 0x46546C67, 2, 12 + 8 + len(js) + 8 + len(bin_))
    out += struct.pack('<II', len(js), 0x4E4F534A) + js + struct.pack('<II', len(bin_), 0x004E4942) + bin_
    open(path, 'wb').write(out)
