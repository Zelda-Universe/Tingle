#!/usr/bin/env python3
"""The constants the game gives its water shaders (vertex shader 4ba85316, pixel shader e57a8ad2),
for StreetViewWater.js (images/3d/botw/streetview/gpu/water-constants.json), from the water probe's
reading of a frame (build_water_probe.py --gbuffer, read_water_probe.py --gbuffer).

- ps: the pixel shader's 20 constants (80 floats) as the game had them; the camera's (rows 0, 1,
  2, 6, 9, 10, 19) and the depth's (4, 5) are remade each frame by StreetViewWater.js;
- table: the type table (VS4: 6 rows a type), the rows the probe saw (the types in view: their
  pixels hand the rows on, Sem7, 10, 2, 3, 5 = rows 0-4; row 5, the waves, in Sem5.w / Sem8.w);
  types not seen are left out (StreetViewWater.js uses the nearest seen);
- vs8: the texture coordinates of world x, z (VS8 rows 2-13; rows 8, 9 the identity: the pixel
  shader doesn't read Sem0.xy), fitted from each probe word's own pixel (its world position from
  the camera: the probe's words lie 4 pixels apart, so a block's words are from different spots);
- vs6_38: the flow's scale (Sem9.zw = (flow x 2 - 1) x it).

python3 build_water_constants.py <probe .npz> <reference json (camera fovy, w, h)> <out json>
"""
import json, sys
import numpy as np

NPZ, REF, OUT = sys.argv[1:4]
d = np.load(NPZ); ref = json.load(open(REF))
b = d['inputs']; w = b[:, 2:].astype(np.uint32).view(np.float32).reshape(-1, 11, 4)
c = d['consts'].view(np.float32).reshape(-1, 4)
W, H = ref['w'], ref['h']; T = np.tan(np.radians(ref['fovy'] / 2)); ASP = W / H
SEM = {n: i for i, n in enumerate(['Sem0', 'Sem1', 'Sem2', 'Sem3', 'Sem4', 'Sem5', 'Sem7', 'Sem8', 'Sem9', 'Sem10', 'Sem11'])}

# the water's blocks: a whole type (0-7) and a table row (Sem7, Sem3) not all zero (empty pixels read as type 0)
types = np.rint(np.nan_to_num(w[:, SEM['Sem9'], 1], nan=-1, posinf=-1, neginf=-1)).astype(int)
ok = (types >= 0) & (types < 8) & (np.abs(w[:, SEM['Sem9'], 1] - types) < 1e-3)
# (a type's table rows are the same at every pixel: keep the blocks with its most common rows, and the types
# whose rows aren't all zero)
for t in set(types[ok]):
    k = ok & (types == t); rows = w[:, [SEM['Sem7'], SEM['Sem10'], SEM['Sem2'], SEM['Sem3']]].reshape(len(w), -1)
    vals, n = np.unique(rows[k], axis=0, return_counts=True); mode = vals[np.argmax(n)]
    ok &= ~k | (np.all(rows == mode, axis=1) & (np.abs(mode).sum() > 0))
w, b, types = w[ok], b[ok], types[ok]
table = {}
for t in sorted(set(types)):
    s = w[types == t]
    med = lambda n: np.median(s[:, SEM[n]], axis=0)
    rows = [med('Sem7'), med('Sem10'), med('Sem2'), med('Sem3'), np.r_[med('Sem5')[:3], 0], np.array([med('Sem5')[3], med('Sem8')[3], 0, 0])]
    if np.abs(np.array(rows[:4])).sum() < 1e-6: continue   # (empty pixels)
    table[int(t)] = [float(x) for r in rows for x in r]
    print('type', t, len(s), 'blocks:', np.array(rows).round(5).tolist())
ok = np.isin(types, list(table)); w, b, types = w[ok], b[ok], types[ok]

# texture coordinates: each word's world x, z from its own pixel (the high byte's: x0 + 2 + 4 word + 3; the
# capture's pictures start 320 pixels in), on the water's plane (its view y, Sem8.y), the camera's rows 0, 1
s = w; X = b[:, 0].astype(float); Y = b[:, 1].astype(float)
vy = np.median(s[:, SEM['Sem8'], 1])
def world(word):
    sx = (X + 2 + 4 * word + 3 - 320) % W
    dx = ((sx + 0.5) / W * 2 - 1) * T * ASP; dy = (1 - (Y + 0.5) / H * 2) * T; t = vy / dy
    V = np.c_[dx * t, np.full_like(t, vy), -t, np.ones_like(t)]
    return V @ c[1], V @ c[0]
vs8 = np.zeros((14, 4)); vs8[8] = [1, 0, 0, 1]
for sem, (ru, ro) in (('Sem0', (2, 3)), ('Sem1', (4, 5)), ('Sem1+', (6, 7)), ('Sem4', (10, 11)), ('Sem4+', (12, 13))):
    i = SEM[sem.rstrip('+')]; j0 = 2 if sem.endswith('+') or sem == 'Sem0' else 0
    fit = []
    for j in (j0, j0 + 1):
        wx, wz = world(4 * i + j); A = np.c_[wx, wz, np.ones_like(wx)]
        fit.append(np.linalg.lstsq(A, s[:, i, j], rcond=None)[0])
    (ux, uz, uo), (vx, vz, vo) = fit
    vs8[ru] = [ux, vx, uz, vz]; vs8[ro] = [uo, vo, 0, 0]
    print(sem, 'u = %.6f x + %.6f z + %.4f, v = %.6f x + %.6f z + %.4f' % (ux, uz, uo, vx, vz, vo))

flow = np.median(np.abs(s[:, SEM['Sem9'], 2:]) / (2 * 32768 / 65535 - 1))
print('flow scale', flow)
json.dump(dict(source='water probe, ' + NPZ.split('/')[-1], ps=[float(x) for x in c.ravel()], table=table,
               vs8=[float(x) for x in vs8.ravel()], vs6_38=[float(round(flow, 3)), 0, 0, 1]), open(OUT, 'w'), indent=1)
print('wrote', OUT)
