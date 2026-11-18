#!/usr/bin/env python3
"""Makes a glTF binary smaller, losslessly to the eye (KHR_mesh_quantization,
which three.js's GLTFLoader reads as is): positions as 16-bit integers (each
mesh's nodes scaled back up), normals and tangents as 8-bit, custom scalars
(_BLEND) as 8-bit, indices as 16-bit where they fit. Everything else as it was.

python3 quantize.py <in.glb> <out.glb>
"""
import json, struct, sys
import numpy as np

SRC, DST = sys.argv[1:3]
d = open(SRC, 'rb').read()
jl = struct.unpack_from('<I', d, 12)[0]; gl = json.loads(d[20:20 + jl])
bin_ = d[20 + jl + 8:]
COMP = {5120: np.int8, 5121: np.uint8, 5122: np.int16, 5123: np.uint16, 5125: np.uint32, 5126: np.float32}
N = {'SCALAR': 1, 'VEC2': 2, 'VEC3': 3, 'VEC4': 4}

def read(i):
    a = gl['accessors'][i]; v = gl['bufferViews'][a['bufferView']]
    dt = np.dtype(COMP[a['componentType']]); n = N[a['type']]
    stride = v.get('byteStride', dt.itemsize * n)
    off = v.get('byteOffset', 0) + a.get('byteOffset', 0)
    raw = np.frombuffer(bin_, np.uint8, count=stride * (a['count'] - 1) + dt.itemsize * n, offset=off)
    rows = np.lib.stride_tricks.as_strided(raw, (a['count'], dt.itemsize * n), (stride, 1))
    out = np.ascontiguousarray(rows).view(dt).reshape(a['count'], n).astype(np.float64)
    if a.get('normalized'):
        out = out / {5120: 127, 5121: 255, 5122: 32767, 5123: 65535}[a['componentType']]
        if a['componentType'] in (5120, 5122): out = np.maximum(out, -1)
    return out

new_bin = bytearray(); views, accs = [], []
def add(arr, comp, typ, target, normalized=False, stride=None, mm=False):
    while len(new_bin) % 4: new_bin.append(0)
    arr = np.ascontiguousarray(arr)
    count = arr.shape[0]
    row = arr.reshape(count, -1).view(np.uint8)
    if stride and row.shape[1] < stride:
        row = np.hstack([row, np.zeros((count, stride - row.shape[1]), np.uint8)])
    view = dict(buffer=0, byteOffset=len(new_bin), byteLength=row.size, target=target)
    if stride: view['byteStride'] = stride
    new_bin.extend(row.tobytes()); views.append(view)
    a = dict(bufferView=len(views) - 1, componentType=comp, count=count, type=typ)
    if normalized: a['normalized'] = True
    if mm:
        flat = arr.reshape(count, -1)
        a['min'] = flat.min(0).tolist(); a['max'] = flat.max(0).tolist()
    accs.append(a); return len(accs) - 1

def snorm8(x): return np.clip(np.rint(x * 127), -127, 127).astype(np.int8)

mesh_scale = {}
for mi, mesh in enumerate(gl['meshes']):
    ext = max(np.abs(read(p['attributes']['POSITION'])).max() for p in mesh['primitives'] if 'POSITION' in p['attributes']) if mesh['primitives'] else 1
    q = max(ext, 1e-6) / 32767
    mesh_scale[mi] = q
    for p in mesh['primitives']:
        at = p['attributes']; new = {}
        for name, i in at.items():
            v = read(i)
            if name == 'POSITION':
                new[name] = add(np.rint(v / q).astype(np.int16), 5122, 'VEC3', 34962, stride=8, mm=True)
            elif name in ('NORMAL', 'TANGENT'):
                if name == 'NORMAL':
                    v = v / np.maximum(np.linalg.norm(v, axis=1, keepdims=True), 1e-9)
                new[name] = add(snorm8(v), 5120, 'VEC3' if name == 'NORMAL' else 'VEC4', 34962, normalized=True, stride=4)
            elif name.startswith('_') and v.shape[1] == 1:
                new[name] = add(np.clip(np.rint(v * 255), 0, 255).astype(np.uint8), 5121, 'SCALAR', 34962, normalized=True, stride=4)
            elif name.startswith('COLOR'):
                new[name] = add(np.clip(np.rint(v * 255), 0, 255).astype(np.uint8), 5121, 'VEC4' if v.shape[1] == 4 else 'VEC3', 34962, normalized=True, stride=4)
            elif name.startswith('TEXCOORD') and v.min() >= 0 and v.max() <= 1:
                new[name] = add(np.rint(v * 65535).astype(np.uint16), 5123, 'VEC2', 34962, normalized=True, stride=4)
            else:
                new[name] = add(v.astype(np.float32), 5126, {1: 'SCALAR', 2: 'VEC2', 3: 'VEC3', 4: 'VEC4'}[v.shape[1]], 34962)
        p['attributes'] = new
        if 'indices' in p:
            idx = read(p['indices']).astype(np.uint32).ravel()
            if idx.max() < 65535: p['indices'] = add(idx.astype(np.uint16), 5123, 'SCALAR', 34963)
            else: p['indices'] = add(idx, 5125, 'SCALAR', 34963)
for node in gl['nodes']:
    if 'mesh' in node:
        q = mesh_scale[node['mesh']]
        node['scale'] = [s * q for s in node.get('scale', [1, 1, 1])]
while len(new_bin) % 4: new_bin.append(0)
gl['accessors'], gl['bufferViews'] = accs, views
gl['buffers'] = [dict(byteLength=len(new_bin))]
for k in ('extensionsUsed', 'extensionsRequired'):
    gl[k] = sorted(set(gl.get(k, [])) | {'KHR_mesh_quantization'})
js = json.dumps(gl).encode(); js += b' ' * (-len(js) % 4)
out = struct.pack('<III', 0x46546C67, 2, 12 + 8 + len(js) + 8 + len(new_bin))
out += struct.pack('<II', len(js), 0x4E4F534A) + js + struct.pack('<II', len(new_bin), 0x004E4942) + bytes(new_bin)
open(DST, 'wb').write(out)
print(SRC, round(len(d) / 1e6, 1), 'MB ->', DST, round(len(out) / 1e6, 1), 'MB')
