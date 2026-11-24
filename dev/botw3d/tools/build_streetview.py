#!/usr/bin/env python3
"""Street view's world (images/3d/botw/streetview/): Hyrule by the game's own
1 km map sections, in the game's own coordinates (x east, y up, z south).

For each section, <section>.glb:
- its terrain, 2 m between heights (fieldbake.height_grid), in 16 chunks,
  draped with its ground as the game paints it (tex/ground-<section>.webp);
- its water (the update's .water.extm), a surface wherever the water stands
  above the ground, with the game's own ripples (tex/water-normal.webp);
- everything that stands there: rocks, cliffs, trees, buildings, ruins,
  shrines, towers, chests, camps (the field's map units), each model once and
  drawn at all its places (EXT_mesh_gpu_instancing), materials as the game
  draws them (gltf_writer.py).

And viewpoints.json: where street view stands for what a ray down onto the
ground can't find by itself (StreetView.js): in front of each shrine and
chest, on each tower's top, in the Shrine of Resurrection's chamber.

python3 build_streetview.py <update content> <base content> <output folder> <section>...
e.g. build_streetview.py .../update/content .../base/content ../../../images/3d/botw/streetview D-6 E-6 D-7 E-7
(then quantize.py each .glb, and build_ground.py for the same sections:
the ground's full detail up close)
"""
import json, math, os, re, subprocess, sys
sys.path.insert(0, os.path.dirname(__file__))
import numpy as np
import nin, byml, bfres, gx2, terrain, fieldbake
from botw_files import Files, sarc
from gltf_writer import Builder, TerrainArrays, quat, magick
from gridmesh import grid_mesh, skirt

U, B, OUT = sys.argv[1:4]
SECTIONS = sys.argv[4:]
SIZE, STEP, GROUND_PX, WATER_STEP = 1000.0, 2.0, 2048, 4.0
SCENERY = ('FldObj_', 'TwnObj_', 'Obj_Tree', 'Obj_Rock', 'Obj_Plant', 'Obj_Bush', 'Obj_Flower', 'DgnObj_', 'TBox_',
           'Kibako', 'Obj_Barrel', 'Obj_BoxWood', 'Obj_StartPoint', 'Obj_DRStone', 'Obj_Fence', 'Obj_Ladder',
           'Obj_Cooking', 'Obj_Bonfire', 'Obj_Kitchen', 'Obj_Sign', 'Obj_Hay', 'Obj_LiftRock', 'Obj_Pot', 'Obj_Log')
# States the game shows before something's done (a tower before it rises):
# the world as it stands after.
BEFORE = ('_First',)   # (and anything 'WingBefore'; not FldObj_FirstShrine, the Shrine of Resurrection)
FLOWING = ('WaterFall',)

def section_box(sec):
    return 'ABCDEFGHIJ'.index(sec[0]) * 1000 - 5000, (int(sec[2:]) - 1) * 1000 - 4000

files = Files(U, B)
T = terrain.Terrain(os.path.join(B, 'Terrain', 'A'))
W = fieldbake.Water(os.path.join(U, 'Terrain', 'A', 'MainField'))
G = fieldbake.Grass(os.path.join(U, 'Terrain', 'A', 'MainField'))
arrays = next(TerrainArrays(p) for p in (os.path.join(r, 'Model', 'Terrain.Tex1.sbfres') for r in (U, B)) if os.path.exists(p))
os.makedirs(os.path.join(OUT, 'tex'), exist_ok=True)

# The field's map units: the base game's, the update's over them.
units = {}
for root in (B, U):
    p = os.path.join(root, 'Pack', 'TitleBG.pack')
    if os.path.exists(p):
        for k, v in sarc(open(p, 'rb').read()).items():
            if k.startswith('Map/MainField/') and k.endswith(('_Static.smubin', '_Dynamic.smubin')): units[k] = v
    mp = os.path.join(root, 'Map', 'MainField')
    if os.path.isdir(mp):
        for sec in os.listdir(mp):
            d = os.path.join(mp, sec)
            for f in (os.listdir(d) if os.path.isdir(d) else []):
                if f.endswith(('_Static.smubin', '_Dynamic.smubin')): units['Map/MainField/%s/%s' % (sec, f)] = open(os.path.join(d, f), 'rb').read()
def objects(sec):
    out = []
    for k, v in units.items():
        if k.split('/')[2] != sec: continue
        static = k.endswith('_Static.smubin')
        for o in byml.parse(nin.yaz0(v) if v[:4] == b'Yaz0' else v).get('Objs', []):
            o['_static'] = static; out.append(o)
    return dedupe([o for o in out if isinstance(o.get('Translate'), list)])

# The game sometimes stands several states of one thing on one spot (a lit
# and an unlit brazier, _01 and _02 of a ruin) and shows one at a time: we
# keep one, the Static unit's first, then the lowest name. Decals (moss, sand)
# lie over other things on purpose and stay.
DROP = ('FldObj_SoilRock_MapTower',)   # the ground a tower bursts from: gone once it's risen
def dedupe(objs):
    best = {}
    for o in objs:
        name = o['UnitConfigName']
        if name.startswith(DROP): continue
        if 'Moss' in name or 'Decal' in name:
            best[id(o)] = o; continue
        t = o['Translate']
        key = (round(t[0], 1), round(t[1], 1), round(t[2], 1), re.sub(r'_?\d+$', '', name))
        cur = best.get(key)
        if cur is None or (not cur['_static'], cur['UnitConfigName']) > (not o['_static'], name): best[key] = o
    return list(best.values())

# The game's own water ripples, once for every section.
def water_normal():
    rel = 'tex/water-normal.webp'
    if os.path.exists(os.path.join(OUT, rel)): return rel
    r, t = arrays.r, dict(bfres.group(arrays.r, arrays.r.rel(0x24)))['WaterNrm']
    w, h, fmt, size, tile, swz, pitch = (r.u32(t + 8), r.u32(t + 12), r.u32(t + 0x18), r.u32(t + 0x24),
                                         r.u32(t + 0x34), r.u32(t + 0x38), r.u32(t + 0x40))
    lin = gx2.untile(arrays.d[r.rel(t + 0xB0):r.rel(t + 0xB0) + size], w, h, pitch, fmt, tile, swz, 0)
    rx, gy = gx2.decode_bc5(lin, w, h)
    x = rx.astype(np.float32) / 255 * 2 - 1; y = gy.astype(np.float32) / 255 * 2 - 1
    z = np.sqrt(np.clip(1 - x * x - y * y, 0, 1))
    rgb = np.dstack([rx, gy, ((z + 1) / 2 * 255).astype(np.uint8)])
    magick('-size', '%dx%d' % (w, h), '-depth', '8', 'rgb:-', '-quality', '90', os.path.join(OUT, rel), data=rgb.tobytes())
    return rel

viewpoints = []
for sec in SECTIONS:
    X0, Z0 = section_box(sec)
    print(sec, flush=True)
    b = Builder(OUT, max_px=512, tex_dir='tex', emission_tint=(0.9, 0.95, 1.0), terrain=arrays)
    # Terrain and its ground
    n = int(SIZE / STEP) + 1
    H = fieldbake.height_grid(T, X0, Z0, SIZE, n)
    ground = fieldbake.ground_texture(T, arrays, X0, Z0, SIZE, GROUND_PX)
    rel = 'tex/ground-%s.webp' % sec
    magick('-size', '%dx%d' % (GROUND_PX, GROUND_PX), '-depth', '8', 'rgb:-', '-quality', '82', os.path.join(OUT, rel), data=ground.tobytes())
    ground_mat = b.raw_material(dict(name='Ground', pbrMetallicRoughness=dict(baseColorTexture=dict(index=b.image_texture(rel)),
                                                                          metallicFactor=0, roughnessFactor=1)))
    uv_of = lambda p: np.stack([(p[:, 0] - X0) / SIZE, (p[:, 2] - Z0) / SIZE], -1)
    prims = grid_mesh(X0, Z0, H, STEP, uv_of) + skirt(X0, Z0, H, STEP, uv_of)
    for p in prims: p['material'] = ground_mat
    b.node('Terrain', b.raw_mesh('Terrain', prims), [0, 0, 0], [0, 0, 0, 1])
    # Grass: where it grows and its colour (tex/grass-<section>.png: rgb the
    # colour, alpha how thick), for StreetView.js to grow round the camera.
    g = fieldbake.grass_grid(T, G, X0, Z0, SIZE, 512)
    magick('-size', '512x512', '-depth', '8', 'rgba:-', os.path.join(OUT, 'tex/grass-%s.png' % sec),
           data=(np.dstack([g[..., 1:], g[..., :1]]) * 255).astype(np.uint8).tobytes())
    # Water: where it stands above the ground
    wn = int(SIZE / WATER_STEP) + 1
    WH, WT = fieldbake.water_grid(T, W, X0, Z0, SIZE, wn)
    GH = fieldbake.height_grid(T, X0, Z0, SIZE, wn)
    wet = np.nan_to_num(WH, nan=-1e9) > GH + 0.05
    if wet.any():
        Hf = np.where(wet, WH, np.nan)
        for _ in range(2):   # the shore's vertices take the water's height
            pad = np.pad(Hf, 1, constant_values=np.nan)
            nb = np.nanmax(np.stack([pad[1 + dj:wn + 1 + dj, 1 + di:wn + 1 + di] for dj in (-1, 0, 1) for di in (-1, 0, 1)]), 0)
            Hf = np.where(np.isnan(Hf), nb, Hf)
        Hf = np.nan_to_num(Hf, nan=0.0)
        cells = wet[:-1, :-1] | wet[1:, :-1] | wet[:-1, 1:] | wet[1:, 1:]
        water_mat = b.raw_material(dict(name='Water', normalTexture=dict(index=b.image_texture(water_normal())),
                                        pbrMetallicRoughness=dict(baseColorFactor=[0.16, 0.42, 0.55, 0.85], metallicFactor=0, roughnessFactor=0.1),
                                        alphaMode='BLEND', doubleSided=True))
        wp = grid_mesh(X0, Z0, Hf, WATER_STEP, lambda p: np.stack([p[:, 0] / 24, p[:, 2] / 24], -1), mask=cells)
        for p in wp: p['material'] = water_mat
        if wp: b.node('Water', b.raw_mesh('Water', wp), [0, 0, 0], [0, 0, 0, 1])
    # What stands there
    objs = objects(sec)
    groups = {}
    for o in objs:
        name = o['UnitConfigName']
        if not name.startswith(SCENERY) or name.endswith(BEFORE) or 'WingBefore' in name or name.endswith('_Far'): continue
        a = files.actor_model(name)
        if not a: continue
        unit = (a.get('units') or [name])[0]
        sc = o.get('Scale', 1); sc = list(sc) if isinstance(sc, list) else [sc] * 3
        groups.setdefault((a['folder'], unit), []).append((o['Translate'], quat(o.get('Rotate')), sc))
    placed = 0
    for (folder, unit), places in sorted(groups.items(), key=lambda kv: kv[0][1]):
        m = files.model(folder, unit)
        if not m: continue
        mesh = b.mesh(m, files.textures(folder), {'flow': True} if any(f in unit for f in FLOWING) else None)
        if len(places) == 1: b.node(unit, mesh, *places[0])
        else: b.instanced(unit, mesh, places)
        placed += len(places)
    size = b.write('%s.glb' % sec, 'Zelda Maps BotW street view export')
    print('  ', placed, 'objects,', len(groups), 'models,', round(size / 1e6, 1), 'MB', flush=True)

    # Viewpoints: where to stand for what the game has here
    def ground_at(x, z): return float(fieldbake.height_grid(T, x - 1, z - 1, 2, 2)[0, 0])
    def face(o, dist):
        ry = o.get('Rotate', 0); ry = ry[1] if isinstance(ry, list) else ry
        fx, fz = math.sin(ry), math.cos(ry)
        t = o['Translate']
        return [t[0] + fx * dist, t[2] + fz * dist], math.atan2(fx, fz)   # standing in front, looking back at it (StreetView.js looks along -sin, -cos)
    for o in objs:
        name, t = o['UnitConfigName'], o['Translate']
        if name == 'FldObj_DownloadTerminal_A_01' and t[1] > ground_at(t[0], t[2]) + 20:
            (x, z), yaw = face(o, 2.5)
            viewpoints.append(dict(kind='tower', x=t[0], z=t[2], pos=[x, t[1] + 1.7, z], yaw=yaw))
        elif name.startswith('DgnObj_EntranceElevator') or name == 'DgnObj_DungeonEntrance_A_01':
            (x, z), yaw = face(o, 20)
            viewpoints.append(dict(kind='shrine', x=t[0], z=t[2], pos=[x, max(ground_at(x, z), t[1]) + 1.7, z], yaw=yaw))
        elif name.startswith('TBox_'):
            (x, z), yaw = face(o, 2.5)
            viewpoints.append(dict(kind='chest', x=t[0], z=t[2], pos=[x, t[1] + 1.7, z], yaw=yaw))
        elif name == 'FldObj_FirstShrineBed_A_01':
            (x, z), yaw = face(o, 2.5)
            viewpoints.append(dict(kind='resurrection', x=t[0], z=t[2], pos=[x, t[1] + 1.9, z], yaw=yaw))
json.dump(dict(sections=SECTIONS, viewpoints=viewpoints), open(os.path.join(OUT, 'viewpoints.json'), 'w'))
print(len(viewpoints), 'viewpoints')
