#!/usr/bin/env python3
"""The game's own terrain tiles for street view's ground (images/3d/botw/streetview/terrain/),
which StreetViewGame.js lays into a clipmap round the camera the way the game does (seven
nested levels, shader-notes.md) and draws with the game's terrain shaders.

Lossless, from Terrain/A/MainField (the .tscb's areas, their .hght and .mate tiles):
- h/<area>.png: 256 x 256, RGB: red and green the height (u16, high byte first; metres =
  value x 800 / 65535), blue the .mate's fourth byte (its flags);
- m/<area>.png: 256 x 256, RGB: the .mate's two material indices and the blend between them;
- index.json: every area exported, [centre x, centre z, size, name], coarsest first.
(RGB, not 16-bit or RGBA: a browser reads 16-bit PNGs as 8-bit, and clears the colour where
alpha is 0.)

Which areas: every one over the given sections, and every area 1 km or larger in all of Hyrule
(the coarse levels reach far past the sections).

python3 build_terrain.py <base content> <output folder> <section>...
"""
import json, os, subprocess, sys
import numpy as np
sys.path.insert(0, os.path.dirname(__file__))
import terrain

B, OUT = sys.argv[1:3]
SECTIONS = sys.argv[3:]
T = terrain.Terrain(os.path.join(B, 'Terrain', 'A'))


def box(sec):
    x0 = 'ABCDEFGHIJ'.index(sec[0]) * 1000 - 5000; z0 = (int(sec[2:]) - 1) * 1000 - 4000
    return x0, z0, x0 + 1000, z0 + 1000


def over(a, b):
    return a[0] + a[2] / 2 > b[0] and a[0] - a[2] / 2 < b[2] and a[1] + a[2] / 2 > b[1] and a[1] - a[2] / 2 < b[3]


boxes = [box(s) for s in SECTIONS]
areas = [a for a in T.areas if a[2] >= 1000 or any(over(a, b) for b in boxes)]
areas.sort(key=lambda a: -a[2])
for d in ('h', 'm'): os.makedirs(os.path.join(OUT, d), exist_ok=True)


def png(path, rgb):
    subprocess.run(['magick', '-size', '256x256', '-depth', '8', 'rgb:-', '-define', 'png:compression-level=9', path],
                   input=np.ascontiguousarray(rgb).tobytes(), check=True)


done = []
for i, (x, z, size, name) in enumerate(areas):
    try:
        h = np.array(T.tile(name), np.uint16).reshape(256, 256)
        m = T.mate(name)
    except (FileNotFoundError, KeyError):
        continue
    hp, mp = os.path.join(OUT, 'h', name + '.png'), os.path.join(OUT, 'm', name + '.png')
    if not os.path.exists(hp): png(hp, np.dstack([h >> 8, h & 255, m[..., 3]]).astype(np.uint8))
    if not os.path.exists(mp): png(mp, m[..., :3])
    done.append([round(x, 3), round(z, 3), size, name])
    if i % 200 == 0: print(i, '/', len(areas), flush=True)
json.dump(dict(sections=SECTIONS, height_range=800.0, areas=done), open(os.path.join(OUT, 'index.json'), 'w'))
print(len(done), 'areas')
