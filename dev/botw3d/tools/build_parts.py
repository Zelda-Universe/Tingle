#!/usr/bin/env python3
"""The dungeon's own parts, for a Divine Beast's 3D map (parts.glb): what its
map unit places inside and on the Beast besides the Beast itself (the gears,
wheels, pulley lifts, water shutters, its inner water and waterfall,
terminals and their pedestals, the Travel Gate, chests, switches, fences),
where the map unit puts them, in the dungeon's own frame (as model.glb).

Left out: the Beast's own body (model.glb), enemies, items, Malice, and the
Sheikah Slate map's own pieces (IbtMap*, the map pedestal's hologram), which
aren't in the dungeon to be seen.

python3 build_parts.py <update content> <base content> <dungeon .pack> <output folder> [malice]
Writes parts.glb and parts-textures/ (then quantize.py makes it smaller).
With 'malice', the dungeon's Malice alone instead (malice.glb, malice-textures/:
its merged masses, eyeballs and generators), for the Beast as it is before
it's freed; its materials marked (extras.malice) for the page to colour.
"""
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
import nin, byml
from botw_files import Files
from gltf_writer import Builder, TerrainArrays, quat

U, B, PACK, OUT = sys.argv[1:5]
MALICE = len(sys.argv) > 5 and sys.argv[5] == 'malice'
GRUDGE = ('MergedGrudge', 'TwnObj_GanonGrudge')
SKIP_PREFIX = ('Enemy_', 'Item_', 'Obj_HeartUtuwa', 'MergedGrudge', 'TwnObj_GanonGrudge', 'DgnObj_IbtMap', 'Obj_MapModel',
               'Weapon_', 'Npc_')
BODY = ('DgnObj_IbutsuWaterBodyInside', 'DgnObj_IbutsuWaterBodyOutside', 'DgnObj_IbutsuWaterHead',
        'DgnObj_IbutsuWaterLeg', 'DgnObj_IbutsuWaterLump', 'DgnObj_IbutsuWaterNose')
FLOWING = ('WaterFall',)

files = Files(U, B, [PACK])
pack = files.packs[0]
objs = []
for k in pack:
    if k.startswith('Map/MainFieldDungeon/') and k.endswith(('_Static.smubin', '_Dynamic.smubin')):
        raw = pack[k]
        objs += byml.parse(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw).get('Objs', [])

terrain = next(TerrainArrays(p) for p in (os.path.join(r, 'Model', 'Terrain.Tex1.sbfres') for r in (U, B)) if os.path.exists(p))
b = Builder(OUT, max_px=1024, tex_dir='malice-textures' if MALICE else 'parts-textures', terrain=terrain)
meshes = {}; placed = 0; skipped = set(); missing = set()
for o in objs:
    n = o['UnitConfigName']
    if MALICE:
        if not n.startswith(GRUDGE): continue
    elif n.startswith(SKIP_PREFIX) or n.startswith(BODY): continue
    a = files.actor_model(n)
    if not a: skipped.add(n); continue
    unit = (a.get('units') or [n])[0]
    key = (a['folder'], unit)
    if key not in meshes:
        m = files.model(a['folder'], unit)
        if not m: skipped.add(n); meshes[key] = None; continue
        texs = files.textures(a['folder'])
        for mt in m['mats']: missing.update(v for v in mt['textures'].values() if v not in texs.entries)
        extras = {'malice': True} if MALICE else ({'flow': True} if any(f in unit for f in FLOWING) else None)
        meshes[key] = b.mesh(m, texs, extras)
    if meshes[key] is None: continue
    sc = o.get('Scale', 1)
    sc = list(sc) if isinstance(sc, list) else [sc] * 3
    b.node(n, meshes[key], o.get('Translate', [0, 0, 0]), quat(o.get('Rotate')), sc)
    placed += 1
size = b.write('malice.glb' if MALICE else 'parts.glb', 'Zelda Maps BotW dungeon parts export')
print(placed, 'parts,', len([m for m in meshes.values() if m is not None]), 'models,', len(b.images), 'textures,',
      round(size / 1e6, 1), 'MB; without a model:', sorted(skipped)[:20], '; textures not found:', sorted(missing)[:10])
