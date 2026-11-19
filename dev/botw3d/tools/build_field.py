#!/usr/bin/env python3
"""What stands around a Divine Beast in the field, for its 3D map's
surroundings (field.glb): the rocks, cliffs, dam, buildings, trees and
waterfalls the field's map units place there (survey_env.py lists them and
where their models are), each model once and drawn at all its places
(EXT_mesh_gpu_instancing), in the Beast's own frame as environment.glb is.

Where a scenery actor also has a distant version (<name>_Far, the game's low
detail stand-in at the same place), the near one's used within FAR_FROM of
the Beast and the far one past it, as the game shows them.

python3 build_field.py <update content> <base content> <survey.json> <output folder>
Writes field.glb and field-textures/ (then quantize.py makes it smaller).
"""
import glob, json, math, os, sys
sys.path.insert(0, os.path.dirname(__file__))
import bfres
from gltf_writer import Builder, Textures, TerrainArrays, load, quat, qmul

U, B, SURVEY, OUT = sys.argv[1:5]
ORIGIN, ROT = (3662.403, 256.37, -175.42), -2.094395   # RemainsWater in I-4_Static (as build_env.py)
FLOWING = ('WaterFall',)   # whose textures flow (Map3D.js scrolls them)

def to_local(x, y, z):
    dx, dy, dz = x - ORIGIN[0], y - ORIGIN[1], z - ORIGIN[2]
    c, s = math.cos(-ROT), math.sin(-ROT)
    return (dx * c + dz * s, dy, -dx * s + dz * c)
FRAME = quat(-ROT)   # the field's rotation about y, undone

FAR_FROM = 450   # metres from the Beast past which the game's distant versions do

survey = json.load(open(SURVEY))
actors = survey['actors']
near = {n for n in actors if not n.endswith('_Far')}

# Placements by (model file, model name)
groups = {}
for o in survey['objs']:
    n = o['UnitConfigName']
    if n not in actors or (n.endswith('_Far') and n[:-4] in near): continue
    # (Not the field's Beast or what hangs on it, its waterfalls and weak
    # points: they go with the field's own, smaller model of the Beast, not
    # the dungeon's that stands here.)
    if n.startswith(('DgnObj_Ibutsu', 'RemainsWater')): continue
    # Far off, the game's low detail version, as the game draws it there.
    lx, _, lz = to_local(*o['Translate'])
    if not n.endswith('_Far') and n + '_Far' in actors and math.hypot(lx, lz) > FAR_FROM:
        n = n + '_Far'
    a = actors[n]
    unit = (a['units'] or [n])[0]
    path = a['files'].get(unit) or a['files'].get(n)
    if not path: continue
    t = to_local(*o['Translate'])
    r = qmul(FRAME, quat(o.get('Rotate')))
    sc = o.get('Scale', 1)
    sc = list(sc) if isinstance(sc, list) else [sc] * 3
    groups.setdefault((path, unit, a['folder']), []).append((t, r, sc))

_tex = {}
def textures(folder):
    if folder not in _tex:
        paths = []
        for root in (U, B):
            base = os.path.join(root, 'Model', folder)
            # (Split ones too: <folder>.Tex1.1.sbfres..., <folder>-01.Tex1.sbfres...)
            paths += ([base + '.Tex1.sbfres'] + sorted(glob.glob(glob.escape(base) + '.Tex1.[0-9]*.sbfres'))
                      + sorted(glob.glob(glob.escape(base) + '-[0-9][0-9].Tex1.sbfres')))
        _tex[folder] = Textures(paths)
    return _tex[folder]

_models = {}
def model(path, name):
    if path not in _models: _models[path] = {m['name']: m for m in bfres.models(load(path))}
    return _models[path].get(name)

terrain = next(TerrainArrays(p) for p in (os.path.join(r, 'Model', 'Terrain.Tex1.sbfres') for r in (U, B)) if os.path.exists(p))
b = Builder(OUT, max_px=512, tex_dir='field-textures', emission_tint=(0.9, 0.95, 1.0), terrain=terrain)
missing = set(); placed = 0
for (path, unit, folder), places in sorted(groups.items(), key=lambda kv: kv[0][1]):
    m = model(path, unit)
    if not m: continue
    texs = textures(folder)
    for mt in m['mats']:
        missing.update(v for v in mt['textures'].values() if v not in texs.entries)
    extras = {'flow': True} if any(f in unit for f in FLOWING) else None
    mesh = b.mesh(m, texs, extras)
    if len(places) == 1:
        b.node(unit, mesh, *places[0])
    else:
        b.instanced(unit, mesh, places)
    placed += len(places)
size = b.write('field.glb', 'Zelda Maps BotW field export')
print(len(groups), 'models,', placed, 'placements,', len(b.materials), 'materials,', len(b.images), 'textures,',
      round(size / 1e6, 1), 'MB;', len(missing), 'textures not found', sorted(missing)[:12])
