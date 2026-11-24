#!/usr/bin/env python3
"""Street view's ground up close (images/3d/botw/streetview/tex/), for
StreetView.js to paint the game's own ground textures at full detail near
the camera (the baked ground-<section>.webp stays for the distance):

- ground-atlas.webp: every layer of the terrain's MaterialAlb array, 256 px
  each, in rows of ATLAS_COLS; ground-cmb.webp the same of MaterialCmb;
- ground-materials.json: the game's ground materials, each [layer, u scale,
  v scale] (a texture repeats every 1/scale metres);
- matmap-<section>.png: per half metre, the two materials there and the
  blend between them (red, green, blue), as the game's .mate files have it.

python3 build_ground.py <update content> <base content> <output folder> <section>...
"""
import json, os, sys
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import terrain, fieldbake
from gltf_writer import TerrainArrays, magick

U, B, OUT = sys.argv[1:4]
SECTIONS = sys.argv[4:]
LAYER_PX, ATLAS_COLS, MAP_PX = 256, 10, 2048

T = terrain.Terrain(os.path.join(B, 'Terrain', 'A'))
arrays = next(TerrainArrays(p) for p in (os.path.join(r, 'Model', 'Terrain.Tex1.sbfres') for r in (U, B)) if os.path.exists(p))
os.makedirs(os.path.join(OUT, 'tex'), exist_ok=True)

r, t = arrays.r, arrays.entries['MaterialAlb']
depth = r.u32(t + 0x10)
rows = (depth + ATLAS_COLS - 1) // ATLAS_COLS
tmp = fieldbake.arrays_tmp()
# MaterialAlb (the colours, sRGB) and MaterialCmb (normal in red / green, a third value in blue,
# linear: the game terrain shader's second array), the same layout
for entry, name in (('MaterialAlb', 'ground-atlas.webp'), ('MaterialCmb', 'ground-cmb.webp')):
    atlas = np.zeros((rows * LAYER_PX, ATLAS_COLS * LAYER_PX, 3), np.uint8)
    for layer in range(depth):
        img = arrays.decode(entry, layer, tmp)
        small = np.frombuffer(magick('-size', '%dx%d' % (img.shape[1], img.shape[0]), '-depth', '8', 'rgba:-',
                                     '-resize', '%dx%d!' % (LAYER_PX, LAYER_PX), 'rgb:-', data=img.tobytes()), np.uint8)
        y, x = divmod(layer, ATLAS_COLS)
        atlas[y * LAYER_PX:(y + 1) * LAYER_PX, x * LAYER_PX:(x + 1) * LAYER_PX] = small.reshape(LAYER_PX, LAYER_PX, 3)
    magick('-size', '%dx%d' % (atlas.shape[1], atlas.shape[0]), '-depth', '8', 'rgb:-', '-quality', '88',
           os.path.join(OUT, 'tex', name), data=atlas.tobytes())
json.dump(dict(layers=depth, cols=ATLAS_COLS, px=LAYER_PX, materials=[list(m) for m in T.materials]),
          open(os.path.join(OUT, 'tex/ground-materials.json'), 'w'))
print('atlas', depth, 'layers;', len(T.materials), 'materials', flush=True)

for sec in SECTIONS:
    X0 = 'ABCDEFGHIJ'.index(sec[0]) * 1000 - 5000; Z0 = (int(sec[2:]) - 1) * 1000 - 4000
    A, Bm, W = fieldbake.material_map(T, X0, Z0, 1000.0, MAP_PX)
    magick('-size', '%dx%d' % (MAP_PX, MAP_PX), '-depth', '8', 'rgb:-', '-define', 'png:compression-level=9',
           os.path.join(OUT, 'tex/matmap-%s.png' % sec), data=np.dstack([A, Bm, W]).tobytes())
    print(sec, flush=True)
