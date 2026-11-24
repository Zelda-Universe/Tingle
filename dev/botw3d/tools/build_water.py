#!/usr/bin/env python3
"""The game's water for street view (images/3d/botw/streetview/water/), which
StreetViewWater.js lays into a clipmap round the camera and draws with the game's own
water shaders (shader-notes.md, "The water clipmap").

The game's water is one surface over all of Hyrule: every terrain area has a 64 x 64 grid
of water texels (Terrain/A/MainField/*.water.extm, the update's), and where there's no
water the surface lies a little above zero, under the ground, which hides it. The water's
vertex shader reads each texel as four 16-bit values (its texture VS1, RGBA16):
- the water's height (x 800 m), the flow along x and along z (0.5: none);
- the fourth: the type in its high byte (its row in the shader's type table, and the layer
  of the water textures) and a flags byte (the shader takes the fraction).
Lossless:
- w/<area>.png: 512 x 64 grey: each texel's 8 bytes, as the file has them (little-endian);
- index.json: every area exported, [centre x, centre z, size, name], coarsest first;
- ../tex/water-nrm.png: WaterNrm (BC5: red, green; the game reads it as red, green, 1, 1),
  ../tex/water-emm.png: WaterEmm (BC4: one channel, which the game reads as grey), each its
  8 layers (one per type) of 512 px in 4 columns, 2 rows.

python3 build_water.py <update content> <base content> <output folder>
(Which areas: those in the terrain export's index.json, already in <output folder>/terrain/.)
"""
import json, os, subprocess, sys
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import nin, fieldbake
from gltf_writer import TerrainArrays, magick

U, B, OUT = sys.argv[1:4]
WATER = os.path.join(U, 'Terrain', 'A', 'MainField')
areas = json.load(open(os.path.join(OUT, 'terrain', 'index.json')))['areas']
os.makedirs(os.path.join(OUT, 'water', 'w'), exist_ok=True)

packs, done = {}, []
for x, z, size, name in areas:
    pack = name[:-1] + '%X' % (int(name[-1], 16) & ~3)
    if pack not in packs:
        p = os.path.join(WATER, pack + '.water.extm.sstera')
        if os.path.exists(p):
            raw = open(p, 'rb').read()
            packs[pack] = {k.split('.')[0]: v for k, v in nin.sarc(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw).items()}
        else: packs[pack] = {}
    v = packs[pack].get(name)
    if v is None or len(v) != 64 * 64 * 8: continue
    out = os.path.join(OUT, 'water', 'w', name + '.png')
    if not os.path.exists(out):
        subprocess.run(['magick', '-size', '512x64', '-depth', '8', 'gray:-', '-define', 'png:compression-level=9', out], input=v, check=True)
    done.append([x, z, size, name])
json.dump(dict(areas=done), open(os.path.join(OUT, 'water', 'index.json'), 'w'))
print(len(done), 'water tiles')

arrays = next(TerrainArrays(p) for p in (os.path.join(r, 'Model', 'Terrain.Tex1.sbfres') for r in (U, B)) if os.path.exists(p))
tmp = fieldbake.arrays_tmp()
os.makedirs(os.path.join(OUT, 'tex'), exist_ok=True)
for entry, name, chans in (('WaterNrm', 'water-nrm.png', 2), ('WaterEmm', 'water-emm.png', 1)):
    atlas = np.zeros((2 * 512, 4 * 512, 3), np.uint8)
    for layer in range(8):
        img = arrays.decode(entry, layer, tmp)
        assert img.shape[:2] == (512, 512)
        atlas[(layer // 4) * 512:(layer // 4 + 1) * 512, (layer % 4) * 512:(layer % 4 + 1) * 512, :chans] = img[..., :chans]
    magick('-size', '2048x1024', '-depth', '8', 'rgb:-', '-define', 'png:compression-level=9', os.path.join(OUT, 'tex', name), data=atlas.tobytes())
    print(name)
