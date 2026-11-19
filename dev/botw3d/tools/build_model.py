#!/usr/bin/env python3
"""A Divine Beast's model for the 3D map (images/3d/botw/<beast>/model.glb),
its materials as the game draws them (gltf_writer.py), its parts where the
dungeon's map unit places them.

python3 build_model.py <BotW content folder> <model name> <map unit objs.json> <output folder>
e.g. build_model.py .../content DgnObj_IbutsuWater_A ../vah-ruta-objs.json ../../../images/3d/botw/vah-ruta
Writes model.glb and textures/ (then quantize.py makes it smaller).
"""
import json, os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bfres
from gltf_writer import Builder, Textures, load, quat

CONTENT, NAME, OBJS, OUT = sys.argv[1:5]

models = bfres.models(load(os.path.join(CONTENT, 'Model', NAME + '.sbfres')))
texs = Textures([os.path.join(CONTENT, 'Model', NAME + '.Tex1.sbfres')])
b = Builder(OUT, max_px=1024)
mesh = {m['name']: b.mesh(m, texs) for m in models}
for o in json.load(open(OBJS)):
    if o['UnitConfigName'] in mesh:
        b.node(o['UnitConfigName'], mesh[o['UnitConfigName']], o.get('Translate', [0, 0, 0]), quat(o.get('Rotate')))
size = b.write('model.glb')
print(len(b.nodes), 'nodes,', len(b.materials), 'materials,', len(b.images), 'textures,', round(size / 1e6, 1), 'MB of model')
