#!/usr/bin/env python3
"""Street view's horizon (images/3d/botw/streetview/horizon.glb): all of
Hyrule's ground at low detail (32 m between heights, its ground baked coarse)
and its water, so the far mountains, lakes and sea are always there. The
sections street view has in full are left out of it (they're drawn instead).

python3 build_horizon.py <update content> <base content> <output folder> <built section>...
"""
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import terrain, fieldbake
from gltf_writer import Builder, TerrainArrays, magick
from gridmesh import grid_mesh

U, B, OUT = sys.argv[1:4]
BUILT = set(sys.argv[4:])
X0, Z0, W, H = -5000.0, -4000.0, 10000.0, 8000.0
STEP, TEX = 25.0, 4096   # 25 m: the sections' 1 km edges fall on its lines

T = terrain.Terrain(os.path.join(B, 'Terrain', 'A'))
Wt = fieldbake.Water(os.path.join(U, 'Terrain', 'A', 'MainField'))
arrays = next(TerrainArrays(p) for p in (os.path.join(r, 'Model', 'Terrain.Tex1.sbfres') for r in (U, B)) if os.path.exists(p))
b = Builder(OUT, tex_dir='tex', terrain=arrays)

# The world as one square grid (the wider side), cut to its own size after.
size = max(W, H)
n = int(size / STEP) + 1
Hg = fieldbake.height_grid(T, X0, Z0, size, n)
nx, nz = int(W / STEP) + 1, int(H / STEP) + 1
Hg = Hg[:nz, :nx]
print('heights', Hg.shape, flush=True)
ground = fieldbake.ground_texture(T, arrays, X0, Z0, size, TEX, min_area=250)
ground = ground[:int(TEX * H / size), :int(TEX * W / size)]
rel = 'tex/ground-horizon.webp'
magick('-size', '%dx%d' % (ground.shape[1], ground.shape[0]), '-depth', '8', 'rgb:-', '-quality', '80', os.path.join(OUT, rel), data=np.ascontiguousarray(ground).tobytes())
mat = b.raw_material(dict(name='Ground', pbrMetallicRoughness=dict(baseColorTexture=dict(index=b.image_texture(rel)), metallicFactor=0, roughnessFactor=1)))

# Cells inside a built section left out.
def outside(nz_, nx_, step):
    keep = np.ones((nz_ - 1, nx_ - 1), bool)
    cx = X0 + (np.arange(nx_ - 1) + 0.5) * step; cz = Z0 + (np.arange(nz_ - 1) + 0.5) * step
    for sec in BUILT:
        sx = 'ABCDEFGHIJ'.index(sec[0]) * 1000 - 5000; sz = (int(sec[2:]) - 1) * 1000 - 4000
        keep[np.ix_((cz > sz) & (cz < sz + 1000), (cx > sx) & (cx < sx + 1000))] = False
    return keep
prims = grid_mesh(X0, Z0, Hg, STEP, lambda p: np.stack([(p[:, 0] - X0) / W, (p[:, 2] - Z0) / H], -1), mask=outside(nz, nx, STEP))
for p in prims: p['material'] = mat
b.node('Terrain', b.raw_mesh('Terrain', prims), [0, 0, 0], [0, 0, 0, 1])

WSTEP = 50.0
wn = int(size / WSTEP) + 1
WH, _ = fieldbake.water_grid(T, Wt, X0, Z0, size, wn)
GH = fieldbake.height_grid(T, X0, Z0, size, wn)
wnx, wnz = int(W / WSTEP) + 1, int(H / WSTEP) + 1
WH, GH = WH[:wnz, :wnx], GH[:wnz, :wnx]
wet = np.nan_to_num(WH, nan=-1e9) > GH + 0.05
Hf = np.where(wet, WH, np.nan)
for _ in range(2):
    pad = np.pad(Hf, 1, constant_values=np.nan)
    nb = np.nanmax(np.stack([pad[1 + dj:wnz + 1 + dj, 1 + di:wnx + 1 + di] for dj in (-1, 0, 1) for di in (-1, 0, 1)]), 0)
    Hf = np.where(np.isnan(Hf), nb, Hf)
Hf = np.nan_to_num(Hf, nan=0.0)
cells = (wet[:-1, :-1] | wet[1:, :-1] | wet[:-1, 1:] | wet[1:, 1:]) & outside(wnz, wnx, WSTEP)
wmat = b.raw_material(dict(name='Water', pbrMetallicRoughness=dict(baseColorFactor=[0.12, 0.3, 0.38, 0.9], metallicFactor=0, roughnessFactor=0.2),
                           alphaMode='BLEND', doubleSided=True))
wp = grid_mesh(X0, Z0, Hf, WSTEP, lambda p: None, mask=cells)
for p in wp: p['material'] = wmat; p.pop('uv', None)
if wp: b.node('Water', b.raw_mesh('Water', wp), [0, 0, 0], [0, 0, 0, 1])
size_ = b.write('horizon.glb', 'Zelda Maps BotW horizon export')
print('horizon', round(size_ / 1e6, 1), 'MB')
