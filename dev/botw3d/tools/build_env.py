#!/usr/bin/env python3
"""Vah Ruta's surroundings for the 3D map: East Reservoir Lake's terrain, painted
with the game's own ground materials (Terrain.Tex1, by the .mate tiles), and its water, as one
glTF binary in the Beast's own frame (the field places RemainsWater at
Translate / Rotate below, so everything is moved by the inverse).

python3 build_env.py <BotW content folder> <output folder>
Writes environment.glb and environment.jpg.
"""
import math, os, struct, subprocess, sys, tempfile, json
sys.path.insert(0, os.path.dirname(__file__))
import nin, gx2, terrain, bfres

CONTENT, OUT = sys.argv[1:3]
ORIGIN, ROT = (3662.403, 256.37, -175.42), -2.094395   # RemainsWater in I-4_Static
WATER = ORIGIN[1]        # the reservoir's surface: the field model's waves sit at its origin
X0, X1, Z0, Z1 = 2900, 4400, -1000, 500   # world bounds
STEP = 4                 # metres between terrain vertices
TEX_PX = 3072            # ground texture size for the whole square (0.5 m a pixel)

def to_local(x, y, z):
    dx, dy, dz = x - ORIGIN[0], y - ORIGIN[1], z - ORIGIN[2]
    c, s = math.cos(-ROT), math.sin(-ROT)   # undo the field's rotation about y
    return (dx * c + dz * s, dy, -dx * s + dz * c)

# --- texture: the ground as the game paints it. Every terrain sample names two
# materials and a blend between them (the .mate tiles); each material is a
# layer of Terrain.Tex1's MaterialAlb array, repeating so many times a metre.
# Painted from the coarsest areas to the finest, top-down, into one texture.
def bake_ground(T, tmp):
    import numpy as np
    tex = nin.yaz0(open(os.path.join(CONTENT, 'Model/Terrain.Tex1.sbfres'), 'rb').read()); r = bfres.R(tex)
    t = dict(bfres.group(r, r.rel(0x24)))['MaterialAlb']
    w, h, fmt, size, tile, swz, pitch, depth = (r.u32(t + 8), r.u32(t + 12), r.u32(t + 0x18), r.u32(t + 0x24),
                                                r.u32(t + 0x34), r.u32(t + 0x38), r.u32(t + 0x40), r.u32(t + 0x10))
    data = tex[r.rel(t + 0xB0):r.rel(t + 0xB0) + size]
    px = (X1 - X0) / TEX_PX
    A = np.zeros((TEX_PX, TEX_PX), np.uint8); B = np.zeros_like(A); W = np.zeros_like(A)
    xs = X0 + (np.arange(TEX_PX) + 0.5) * px; zs = Z0 + (np.arange(TEX_PX) + 0.5) * px
    for ax, az, sz, name in sorted(T.areas, key=lambda a: -a[2]):
        c0, c1 = np.searchsorted(xs, ax - sz / 2), np.searchsorted(xs, ax + sz / 2)
        r0, r1 = np.searchsorted(zs, az - sz / 2), np.searchsorted(zs, az + sz / 2)
        if c1 <= c0 or r1 <= r0: continue
        try: m = T.mate(name)
        except (FileNotFoundError, KeyError): continue
        ci = np.clip(np.rint((xs[c0:c1] - (ax - sz / 2)) / sz * 255).astype(int), 0, 255)
        ri = np.clip(np.rint((zs[r0:r1] - (az - sz / 2)) / sz * 255).astype(int), 0, 255)
        tile_ = m[ri][:, ci]
        A[r0:r1, c0:c1], B[r0:r1, c0:c1], W[r0:r1, c0:c1] = tile_[..., 0], tile_[..., 1], tile_[..., 2]
    SAMPLE = 256   # each material's texture, as sampled (a repeat is a few dozen pixels here)
    layers = {}
    for mi in sorted(set(np.unique(A)) | set(np.unique(B))):
        layer = min(T.materials[mi][0] if mi < len(T.materials) else 0, depth - 1)
        if layer not in layers:
            lin = gx2.untile(data, w, h, pitch, fmt, tile, swz, layer)
            p = os.path.join(tmp, 'm.dds'); open(p, 'wb').write(gx2.dds(lin, w, h, fmt))
            raw = subprocess.run(['magick', p, '-resize', '%dx%d!' % (SAMPLE, SAMPLE), '-depth', '8', 'rgb:-'],
                                 check=True, capture_output=True).stdout
            layers[layer] = np.frombuffer(raw, np.uint8).reshape(SAMPLE, SAMPLE, 3).astype(np.float32)
    X, Z = np.meshgrid(xs, zs)
    def colour(M):
        out = np.zeros((TEX_PX, TEX_PX, 3), np.float32)
        for mi in np.unique(M):
            sel = M == mi
            layer, us, vs = T.materials[mi] if mi < len(T.materials) else (0, 0.1, 0.1)
            img = layers[min(layer, depth - 1)]
            u = (np.floor(X[sel] * us * SAMPLE) % SAMPLE).astype(int)
            v = (np.floor(Z[sel] * vs * SAMPLE) % SAMPLE).astype(int)
            out[sel] = img[v, u]
        return out
    wgt = (W.astype(np.float32) / 255)[..., None]
    rgb = colour(A) * (1 - wgt) + colour(B) * wgt
    # A touch softer and darker than the raw textures: the game's own lighting
    # (and distance) tones them down; here they'd read as bright and busy.
    mean = rgb.reshape(-1, 3).mean(0)
    rgb = (mean + (rgb - mean) * 0.75) * 0.88
    p = os.path.join(tmp, 'ground.rgb'); open(p, 'wb').write(np.clip(rgb, 0, 255).astype(np.uint8).tobytes())
    subprocess.run(['magick', '-size', '%dx%d' % (TEX_PX, TEX_PX), '-depth', '8', 'rgb:' + p, '-quality', '80',
                    os.path.join(OUT, 'environment.jpg')], check=True)
    print('ground:', len(layers), 'materials')

tmp = tempfile.mkdtemp()

# --- terrain mesh
T = terrain.Terrain(os.path.join(CONTENT, 'Terrain/A'))
T.areas = [a for a in T.areas if a[0] + a[2] / 2 >= X0 and a[0] - a[2] / 2 <= X1 and a[1] + a[2] / 2 >= Z0 and a[1] - a[2] / 2 <= Z1]
bake_ground(T, tmp)
nx, nz = (X1 - X0) // STEP + 1, (Z1 - Z0) // STEP + 1
pos, uv = [], []
for j in range(nz):
    z = Z0 + j * STEP
    for i in range(nx):
        x = X0 + i * STEP
        pos.append(to_local(x, T.height(x, z), z))
        uv.append(((x - X0) / (X1 - X0), (z - Z0) / (Z1 - Z0)))
idx = []
for j in range(nz - 1):
    for i in range(nx - 1):
        a = j * nx + i; b, c, d = a + 1, a + nx, a + nx + 1
        idx += [a, c, b, b, c, d]
# normals from the grid
def sub(p, q): return (p[0] - q[0], p[1] - q[1], p[2] - q[2])
nrm = [[0.0, 0.0, 0.0] for _ in pos]
for t in range(0, len(idx), 3):
    a, b, c = idx[t:t + 3]
    u, v = sub(pos[b], pos[a]), sub(pos[c], pos[a])
    n = (u[1] * v[2] - u[2] * v[1], u[2] * v[0] - u[0] * v[2], u[0] * v[1] - u[1] * v[0])
    for k in (a, b, c):
        nrm[k][0] += n[0]; nrm[k][1] += n[1]; nrm[k][2] += n[2]
for n in nrm:
    l = math.sqrt(sum(x * x for x in n)) or 1
    n[0] /= l; n[1] /= l; n[2] /= l
flipped = nrm[0][1] < 0
if flipped: nrm = [[-a for a in n] for n in nrm]

# --- water: the grid cells below the surface that join the Beast's (a flood
# fill, so lower ground elsewhere, as Zora's Domain, stays dry), at the surface
wy = WATER - ORIGIN[1]
hts = [p[1] + ORIGIN[1] for p in pos]
start = ((-175 - Z0) // STEP) * nx + (3662 - X0) // STEP
wet, todo = {start}, [start]
while todo:
    k = todo.pop(); j, i = divmod(k, nx)
    for jj, ii in ((j + 1, i), (j - 1, i), (j, i + 1), (j, i - 1)):
        q = jj * nx + ii
        inside = (X0 + ii * STEP - 3662) ** 2 + (Z0 + jj * STEP + 175) ** 2 < 420 ** 2   # the basin, not the river below its outflow
        if 0 <= jj < nz and 0 <= ii < nx and q not in wet and hts[q] < WATER and inside:
            wet.add(q); todo.append(q)
corners, wuv, widx, vid = [], [], [], {}
WATER_REPEAT = 24   # metres a repeat of the water's ripples covers
def wv(k):
    if k not in vid:
        j, i = divmod(k, nx); vid[k] = len(corners)
        corners.append(to_local(X0 + i * STEP, WATER, Z0 + j * STEP))
        wuv.append(((X0 + i * STEP) / WATER_REPEAT, (Z0 + j * STEP) / WATER_REPEAT))
    return vid[k]

# The game's own water ripples: a layer of Terrain.Tex1's WaterNrm array (BC5:
# X and Y; Z rebuilt), animated in the page (Map3D.js).
def water_normal(tmp):
    import numpy as np
    tex = nin.yaz0(open(os.path.join(CONTENT, 'Model/Terrain.Tex1.sbfres'), 'rb').read()); r = bfres.R(tex)
    t = dict(bfres.group(r, r.rel(0x24)))['WaterNrm']
    w, h, fmt, size, tile, swz, pitch = (r.u32(t + 8), r.u32(t + 12), r.u32(t + 0x18), r.u32(t + 0x24),
                                         r.u32(t + 0x34), r.u32(t + 0x38), r.u32(t + 0x40))
    lin = gx2.untile(tex[r.rel(t + 0xB0):r.rel(t + 0xB0) + size], w, h, pitch, fmt, tile, swz, 0)
    rx, gy = gx2.decode_bc5(lin, w, h)
    x = rx.astype(np.float32) / 255 * 2 - 1; y = gy.astype(np.float32) / 255 * 2 - 1
    z = np.sqrt(np.clip(1 - x * x - y * y, 0, 1))
    rgb = np.dstack([rx, gy, ((z + 1) / 2 * 255).astype(np.uint8)])
    p = os.path.join(tmp, 'water.rgb'); open(p, 'wb').write(np.ascontiguousarray(rgb).tobytes())
    subprocess.run(['magick', '-size', '%dx%d' % (w, h), '-depth', '8', 'rgb:' + p, '-quality', '92',
                    os.path.join(OUT, 'water-normal.jpg')], check=True)
water_normal(tmp)
for k in sorted(wet):
    j, i = divmod(k, nx)
    if i + 1 >= nx or j + 1 >= nz: continue
    a, b, c, d = wv(k), wv(k + 1), wv(k + nx), wv(k + nx + 1)
    widx += [a, c, b, b, c, d]

bin_ = bytearray(); views, accs = [], []
def add(data, target, count, typ, comp, mm=None):
    while len(bin_) % 4: bin_.append(0)
    views.append(dict(buffer=0, byteOffset=len(bin_), byteLength=len(data), target=target)); bin_.extend(data)
    a = dict(bufferView=len(views) - 1, componentType=comp, count=count, type=typ)
    if mm: a['min'], a['max'] = mm
    accs.append(a); return len(accs) - 1
mm = lambda p: ([min(v[i] for v in p) for i in range(3)], [max(v[i] for v in p) for i in range(3)])
# The terrain in chunks of under 65,536 vertices each (16-bit indices).
CH = 128
terrain_prims = []
for cj in range(0, nz - 1, CH):
    for ci in range(0, nx - 1, CH):
        j1, i1 = min(cj + CH, nz - 1), min(ci + CH, nx - 1)
        local = {}
        order = []
        for j in range(cj, j1 + 1):
            for i in range(ci, i1 + 1):
                local[j * nx + i] = len(order); order.append(j * nx + i)
        cidx = []
        for j in range(cj, j1):
            for i in range(ci, i1):
                a = j * nx + i; b, c, d = a + 1, a + nx, a + nx + 1
                tri = [a, c, b, b, c, d]
                if flipped: tri = [a, b, c, b, d, c]
                cidx += [local[k] for k in tri]
        cp = [pos[k] for k in order]
        tp = add(b''.join(struct.pack('<3f', *pos[k]) for k in order), 34962, len(order), 'VEC3', 5126, mm(cp))
        tn = add(b''.join(struct.pack('<3f', *nrm[k]) for k in order), 34962, len(order), 'VEC3', 5126)
        tu = add(b''.join(struct.pack('<2f', *uv[k]) for k in order), 34962, len(order), 'VEC2', 5126)
        ti = add(b''.join(struct.pack('<H', i) for i in cidx), 34963, len(cidx), 'SCALAR', 5123)
        terrain_prims.append(dict(attributes=dict(POSITION=tp, NORMAL=tn, TEXCOORD_0=tu), indices=ti, material=0))
wp = add(b''.join(struct.pack('<3f', *v) for v in corners), 34962, len(corners), 'VEC3', 5126, mm(corners))
wn = add(struct.pack('<%df' % (3 * len(corners)), *([0, 1, 0] * len(corners))), 34962, len(corners), 'VEC3', 5126)
wt = add(b''.join(struct.pack('<2f', *v) for v in wuv), 34962, len(wuv), 'VEC2', 5126)
wi = add(b''.join(struct.pack('<I', i) for i in widx), 34963, len(widx), 'SCALAR', 5125)
while len(bin_) % 4: bin_.append(0)
gl = dict(asset=dict(version='2.0', generator='Zelda Maps BotW terrain export'), scene=0, scenes=[dict(nodes=[0, 1])],
          nodes=[dict(name='Terrain', mesh=0), dict(name='Water', mesh=1)],
          meshes=[dict(name='Terrain', primitives=terrain_prims),
                  dict(name='Water', primitives=[dict(attributes=dict(POSITION=wp, NORMAL=wn, TEXCOORD_0=wt), indices=wi, material=1)])],
          materials=[dict(name='Terrain', pbrMetallicRoughness=dict(baseColorTexture=dict(index=0), metallicFactor=0, roughnessFactor=1)),
                     dict(name='Water', pbrMetallicRoughness=dict(baseColorFactor=[0.16, 0.42, 0.55, 0.72], metallicFactor=0, roughnessFactor=0.3),
                          normalTexture=dict(index=1), alphaMode='BLEND', doubleSided=True)],
          images=[dict(uri='environment.jpg'), dict(uri='water-normal.jpg')],
          textures=[dict(source=0, sampler=0), dict(source=1, sampler=1)],
          samplers=[dict(wrapS=33071, wrapT=33071, magFilter=9729, minFilter=9987),
                    dict(wrapS=10497, wrapT=10497, magFilter=9729, minFilter=9987)],
          accessors=accs, bufferViews=views, buffers=[dict(byteLength=len(bin_))])
js = json.dumps(gl).encode(); js += b' ' * (-len(js) % 4)
out = struct.pack('<III', 0x46546C67, 2, 12 + 8 + len(js) + 8 + len(bin_))
out += struct.pack('<II', len(js), 0x4E4F534A) + js + struct.pack('<II', len(bin_), 0x004E4942) + bin_
open(os.path.join(OUT, 'environment.glb'), 'wb').write(out)
print('water cells', len(wet)); print('terrain', nx, 'x', nz, 'vertices; water at', round(wy, 2), 'in the Beast frame')
