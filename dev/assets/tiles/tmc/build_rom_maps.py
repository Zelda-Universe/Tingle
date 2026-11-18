#!/usr/bin/env python3
"""Builds The Minish Cap's maps from ROM renders (render_rooms.py).

venv/bin/python build_rom_maps.py <scratch dir> <repo dir>
Reads  <scratch>/rom-render (rooms.json + area_XX/room_YY.png),
       <scratch>/tmc-decomp (entity_headers.s, room_headers.s, items.json),
       tmc_floors.json beside this script (each dungeon room's floor).
Writes tiles to <repo>/tiles/tmc/v1/<folder>/, thumbnails to
<repo>/images/icons/tmc/v1/<folder>/icon.webp, and <scratch>/rom-build/spec.json
with maps, submaps (bounds, versions), items and Hyrule's areas.
"""
import hashlib, json, math, os, re, shutil, subprocess, sys
from collections import defaultdict
from PIL import Image

S, REPO = sys.argv[1:3]
RENDER, DEC, BUILD = f'{S}/rom-render', f'{S}/tmc-decomp', f'{S}/rom-build'
TILES, ICONS = f'{REPO}/tiles/tmc/v1', f'{REPO}/images/icons/tmc/v1'
os.makedirs(BUILD, exist_ok=True)

# The decompilation's parsing (rooms, chests, loose items), shared with tmc_items.py.
HERE = os.path.dirname(os.path.abspath(__file__))
src = open(f'{HERE}/tmc_items.py').read().split('# Rooms the rip lays out differently')[0]
sys.argv = ['tmc_items.py', DEC, f'{S}/work', f'{S}/submaps.json', f'{S}/items-out']
ns = {}; exec(compile(src, 'tmc_items.py', 'exec'), ns)
room_items, BLOCKS, ITEMS = ns['room_items'], ns['BLOCKS'], ns['ITEMS']

hdr = open(f'{DEC}/room_headers.s').read()
AREA = {int(i, 16): n for n, i in re.findall(r'\.4byte gAreaRoomHeaders_(\w+)\s+@ 0x([0-9A-F]+)', hdr)}
AREA_ID = {n: i for i, n in AREA.items()}
rendered = {(r['area'], r['room']): r for r in json.load(open(f'{RENDER}/rooms.json'))['rooms']}
room_floor = json.load(open(f'{HERE}/tmc_floors.json'))

def room_name(area, index):
    names = re.findall(r'\.4byte (\S+)', BLOCKS.get(f'Area_{AREA[area]}', ''))
    return names[index][5:] if index < len(names) and names[index] != '0x0' else f'{AREA[area]}_{index:02X}'

# --- Maps ---------------------------------------------------------------------
OVER = [0x00, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x09, 0x0A, 0x0B, 0x1A]
def world_room(a, i):  # rooms drawn elsewhere than the world (a town room, a grave)
    r = rendered[(a, i)]; return r['y'] < 3168 and r['x'] < 3984
DUNGEONS = [  # id, slug, name, areas, default floor
  (1201, 'deepwood-shrine', 'Deepwood Shrine', ['DeepwoodShrine', 'DeepwoodShrineBoss', 'DeepwoodShrineEntry'], '1f'),
  (1202, 'cave-of-flames', 'Cave of Flames', ['CaveOfFlames', 'CaveOfFlamesBoss'], '1f'),
  (1203, 'fortress-of-winds', 'Fortress of Winds', ['FortressOfWinds', 'FortressOfWindsTop', 'InnerMazaal'], '1f'),
  (1204, 'temple-of-droplets', 'Temple of Droplets', ['TempleOfDroplets'], 'b1'),
  (1205, 'palace-of-winds', 'Palace of Winds', ['PalaceOfWinds', 'PalaceOfWindsBoss'], '1f'),
  (1206, 'dark-hyrule-castle', 'Dark Hyrule Castle', ['DarkHyruleCastle', 'DarkHyruleCastleOutside', 'DarkHyruleCastleBridge'], '1f'),
]
EXTRA = [  # id, area, name — one map per game area, Minish-sized places first
  (1210, 0x01, 'Minish Village'), (1211, 0x11, 'Minish Paths'), (1212, 0x12, 'Mt. Crenel Minish Paths'),
  (1213, 0x20, 'Minish Houses'), (1214, 0x27, 'Minish Cracks'), (1215, 0x2D, 'Hyrule Town Minish Holes'),
  (1216, 0x2E, 'Minish Rafters'), (1217, 0x35, 'Minish Caves'), (1218, 0x36, 'Castle Garden Minish Holes'),
  (1219, 0x62, 'Hyrule Town Minish Caves'),
  (1220, 0x10, "Melari's Mine"), (1221, 0x0C, 'Lake Woods Cave'), (1222, 0x0F, 'Hyrule Dig Caves'),
  (1223, 0x13, 'Dig Caves'), (1224, 0x14, 'Mt. Crenel Dig Cave'), (1225, 0x16, 'Veil Falls Dig Cave'),
  (1226, 0x17, 'Castor Wilds Dig Cave'), (1227, 0x19, 'Lake Hylia Dig Caves'), (1228, 0x26, 'Mt. Crenel Caves'),
  (1229, 0x2A, 'Castor Wilds Caves'), (1230, 0x2B, 'Castor Wilds Darknut Cave'), (1231, 0x2F, 'Goron Cave'),
  (1232, 0x32, 'Caves'), (1233, 0x33, 'Veil Falls Caves'), (1234, 0x0D, 'Beanstalks'),
  (1235, 0x21, 'Houses 1'), (1236, 0x22, 'Houses 2'), (1237, 0x23, 'Houses 3'), (1238, 0x28, 'Houses 4'),
  (1239, 0x24, 'Tree Houses'), (1240, 0x25, 'Dojos'), (1241, 0x29, 'Great Fairy Fountains'),
  (1242, 0x2C, 'Armos Interiors'), (1243, 0x30, 'Wind Tribe Tower'), (1244, 0x31, 'Wind Tribe Tower Roof'),
  (1245, 0x34, 'Royal Valley Graves'), (1246, 0x68, 'Royal Crypt'), (1247, 0x41, 'Hyrule Town Underground'),
  (1248, 0x42, 'Castle Garden Fountains'), (1249, 0x43, 'Hyrule Castle Cellar'), (1250, 0x80, 'Hyrule Castle'),
  (1251, 0x78, 'Sanctuary'), (1252, 0x81, 'Sanctuary Entrance'),
]
FLOOR_NAMES = {'sacred-realm': 'Sacred Realm'}

maps = []  # {id, slug, name, kind, submaps: [{folder, name, rooms: [(a, i)], default}]}
# No kind, as Link's Awakening's Koholint: one version, and its areas' borders
# show on their pages (ZMap.updateRegionBorders leaves 'world' maps without).
maps.append(dict(id=1200, slug='hyrule', name='Hyrule', kind=None, world=True, submaps=[dict(
    folder='hyrule', name='Hyrule', default=True,
    rooms=[k for k in rendered if k[0] in OVER and world_room(*k)])]))
# Cloud Tops' sky is a scrolling background the game draws apart from its rooms: a plain sky blue.
maps.append(dict(id=1207, slug='cloud-tops', name='Cloud Tops', kind='dungeon', background=(128, 200, 248), submaps=[
    dict(folder=f'cloud-tops-{n.lower()}', name=n, default=(n == 'House'), rooms=[(0x08, i)])
    for i, n in ((0, 'House'), (1, 'Middle'), (2, 'Bottom')) if (0x08, i) in rendered]))
report = []
for mid, slug, name, areas, default in DUNGEONS:
    floors = defaultdict(list)
    for a in areas:
        names = re.findall(r'\.4byte (\S+)', BLOCKS.get(f'Area_{a}', ''))
        for (ar, i) in [(AREA_ID[a], i) for i, n in enumerate(names) if n != '0x0']:
            rn = room_name(ar, i); f = room_floor.get(rn)
            # Dark Hyrule Castle names its rooms by floor; the rip fit only placed 3F's towers.
            m3 = re.match(r'DarkHyruleCastle_(3F)(?!TopRightTower7)', rn)
            if not f and m3: f = f'{slug}-3f'
            if f: floors[f].append((ar, i))
            else: report.append(f'{name}: {room_name(ar, i)} is on no floor of the rip; left out')
    subs = []
    for folder, rooms in floors.items():
        fl = folder[len(slug) + 1:]
        subs.append(dict(folder=folder, name=FLOOR_NAMES.get(fl, fl.upper()), default=(fl == default), rooms=rooms))
    subs.sort(key=lambda s: (not s['default'], s['folder']))
    maps.append(dict(id=mid, slug=slug, name=name, kind='dungeon', submaps=subs))
for mid, a, name in EXTRA:
    slug = re.sub(r'[^a-z0-9]+', '-', name.lower()).strip('-')
    seen, rooms = set(), []
    for (ar, i), r in sorted(rendered.items()):
        if ar != a or (r['x'], r['y']) in seen: continue
        seen.add((r['x'], r['y'])); rooms.append((ar, i))
    maps.append(dict(id=mid, slug=slug, name=name, kind=None, submaps=[dict(folder=slug, name=name, default=True, rooms=rooms)]))

# --- Images, tiles, thumbnails ---------------------------------------------------
HEADERS = {}
def header_room(a, i):
    """A room's place from the decompilation's table, for rooms MCEdit didn't render."""
    if a not in HEADERS: HEADERS[a] = ns['headers'](AREA[a])
    h = HEADERS[a][i] if i < len(HEADERS[a]) else None
    return dict(x=h[0] * 16, y=h[1] * 16, w=h[2], h=h[3]) if h and h[2] else None
def stitch(rooms):
    rs = [rendered[k] for k in rooms if k in rendered]
    x0 = min(r['x'] for r in rs); y0 = min(r['y'] for r in rs)
    x1 = max(r['x'] + r['w'] for r in rs); y1 = max(r['y'] + r['h'] for r in rs)
    img = Image.new('RGBA', (x1 - x0, y1 - y0), (0, 0, 0, 0))
    for r in rs:
        img.alpha_composite(Image.open(f"{RENDER}/area_{r['area']:02X}/room_{r['room']:02X}.png"), (r['x'] - x0, r['y'] - y0))
    return img, (x0, y0)

def magick(*a): subprocess.run(['magick', *a], check=True)
keep = set()
for m in maps:
    imgs = {}
    for s in m['submaps']:
        if m.get('world'):
            img, origin = stitch(s['rooms'])
            canvas = Image.new('RGBA', (3984, 3168), (0, 0, 0, 0)); canvas.alpha_composite(img, origin)
            imgs[s['folder']] = (canvas, (0, 0))
        else:
            imgs[s['folder']] = stitch(s['rooms'])
    cw = max(i[0].size[0] for i in imgs.values()); ch = max(i[0].size[1] for i in imgs.values())
    native = max(1, math.ceil(math.log2(max(cw, ch) / 256)))
    side = 256 * 2 ** native; u = 2 ** native
    left = (side - cw) // 2; top = (side - ch) // 2
    m['native'] = native
    for s in m['submaps']:
        img, origin = imgs[s['folder']]; w, h = img.size
        ox, oy = left + (cw - w) // 2, top + (ch - h) // 2
        s.update(origin=origin, offset=(ox, oy), unit=u, size=(w, h),
                 bounds=[[-(top + ch) / u, left / u], [-top / u, (left + cw) / u]])
        flat = Image.new('RGB', img.size, tuple(m.get('background', (0, 0, 0)))); flat.paste(img, mask=img.split()[3])
        floor_png = f"{BUILD}/{s['folder']}.png"; flat.save(floor_png)
        square = f"{BUILD}/{s['folder']}-square.png"
        magick('-size', f'{side}x{side}', 'xc:none', floor_png, '-geometry', f'+{ox}+{oy}', '-composite', square)
        dest = f"{TILES}/{s['folder']}"; shutil.rmtree(dest, ignore_errors=True); os.makedirs(dest)
        for z in range(native + 1):
            sc = 2 ** (z - native)
            x0 = math.floor(left * sc / 256); x1 = math.ceil((left + cw) * sc / 256)
            y0 = math.floor(top * sc / 256); y1 = math.ceil((top + ch) * sc / 256)
            size = 256 * 2 ** z
            magick(square, '-filter', 'Box', '-resize', f'{size}x{size}',
                   '-crop', f'{(x1 - x0) * 256}x{(y1 - y0) * 256}+{x0 * 256}+{y0 * 256}', '+repage',
                   '-crop', '256x256', '-define', 'webp:lossless=true',
                   '-set', 'filename:t', f'{z}_%[fx:{x0}+page.x/256]_%[fx:{y0}+page.y/256]', '+repage', '+adjoin',
                   os.path.join(dest, '%[filename:t].webp'))
        digest = hashlib.sha256()
        for f in sorted(os.listdir(dest)):
            digest.update(f.encode()); digest.update(open(os.path.join(dest, f), 'rb').read())
        s['version'] = digest.hexdigest()[:16]
        os.makedirs(f"{ICONS}/{s['folder']}", exist_ok=True)
        magick(floor_png, '-filter', 'Box', '-resize', '240x240', '-background', 'black', '-gravity', 'center',
               '-extent', '256x256', '-quality', '85', f"{ICONS}/{s['folder']}/icon.webp")
        keep.add(s['folder'])
        os.remove(square)
# Folders from the VGMaps build that no map uses any more.
for d in (TILES, ICONS):
    for f in os.listdir(d):
        if f not in keep: shutil.rmtree(os.path.join(d, f))

# --- Items --------------------------------------------------------------------------
where = {}  # (area, room) -> submap dict
for m in maps:
    for i, s in enumerate(m['submaps']):
        s['id'] = m['id'] * 100 + i + 1
        for k in s['rooms']: where[k] = s
RUPEES = {0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5c}
items, unplaced = [], []
for a, aname in AREA.items():
    if f'Area_{aname}' not in BLOCKS: continue
    try: rooms = room_items(aname)
    except (KeyError, IndexError): continue
    for i, rname, rect, its in rooms:
        for it in its:
            it['itemName'] = ITEMS.get(it['item'], hex(it['item']))
            if it['how'] == 'ground' and it['item'] in RUPEES: continue
            s = where.get((a, i))
            r = rendered.get((a, i)) or (header_room(a, i) if s else None)
            if s and (a, i) not in rendered and not r: s = None
            if not s or not r:
                unplaced.append(dict(it, area=aname, why='no map')); continue
            # Room-relative position, from the decompilation, onto this room's place in the floor.
            px = r['x'] - s['origin'][0] + it['x']; py = r['y'] - s['origin'][1] + it['y']
            items.append(dict(it, area=aname, submap=s['id'], folder=s['folder'],
                              mx=round((s['offset'][0] + px) / s['unit'], 3), my=round(-(s['offset'][1] + py) / s['unit'], 3),
                              px=px, py=py))

# --- Hyrule's areas, from the game's own rooms ---------------------------------------
REGIONS = [  # name, [(area, room index or None for all)]
  ('Minish Woods', [(0x00, None)]), ('Hyrule Town', [(0x02, 0)]), ('Castor Wilds', [(0x04, None)]),
  ('Wind Ruins', [(0x05, None)]), ('Mt. Crenel', [(0x06, None)]), ('Hyrule Castle', [(0x07, None)]),
  ('Royal Valley', [(0x09, 0)]), ('Veil Falls', [(0x0A, None), (0x1A, None)]), ('Lake Hylia', [(0x0B, None)]),
  ('North Hyrule Field', [(0x03, 6)]), ('South Hyrule Field', [(0x03, 1)]), ('Trilby Highlands', [(0x03, 7)]),
  ('Western Wood', [(0x03, 0), (0x03, 8), (0x03, 9)]), ('Eastern Hills', [(0x03, 2), (0x03, 3), (0x03, 4)]),
  ('Lon Lon Ranch', [(0x03, 5)]),
]
hy = maps[0]['submaps'][0]
def outline(rects):
    """The outline of a union of 16 px-aligned rectangles, as rings of corner points."""
    cells = set()
    for x, y, w, h in rects:
        for cx in range(x // 16, (x + w) // 16):
            for cy in range(y // 16, (y + h) // 16): cells.add((cx, cy))
    edges = {}
    for cx, cy in cells:  # clockwise edges with the inside on the right
        for (a, b), n in ((((cx, cy), (cx + 1, cy)), (cx, cy - 1)), (((cx + 1, cy), (cx + 1, cy + 1)), (cx + 1, cy)),
                          (((cx + 1, cy + 1), (cx, cy + 1)), (cx, cy + 1)), (((cx, cy + 1), (cx, cy)), (cx - 1, cy))):
            if n not in cells: edges[a] = b
    rings = []
    while edges:
        start, _ = next(iter(edges.items())); ring = [start]; p = edges.pop(start)
        while p != start:
            ring.append(p); p = edges.pop(p)
        ring.append(start)
        pts = [ring[0]]  # drop points along straight lines
        for k in range(1, len(ring) - 1):
            a, b, c = pts[-1], ring[k], ring[k + 1]
            if (b[0] - a[0]) * (c[1] - b[1]) != (b[1] - a[1]) * (c[0] - b[0]): pts.append(b)
        pts.append(ring[-1]); rings.append([(x * 16, y * 16) for x, y in pts])
    return rings
regions = []
for name, parts in REGIONS:
    rects = [(r['x'], r['y'], r['w'], r['h']) for (a, i), r in rendered.items()
             for pa, pi in parts if a == pa and (pi is None or i == pi) and world_room(a, i)]
    big = max(rects, key=lambda r: r[2] * r[3])
    conv = lambda x, y: [round((hy['offset'][0] + x) / hy['unit'], 4), round(-(hy['offset'][1] + y) / hy['unit'], 4)]
    regions.append(dict(name=name, label=conv(big[0] + big[2] / 2, big[1] + big[3] / 2),
                        rings=[[conv(x, y) for x, y in ring] for ring in outline(rects)]))
# Dungeon entrances that aren't doors in the game's warp tables (tmc_extras.py
# places the rest): Dark Hyrule Castle is Hyrule Castle, changed.
ENTRANCES = [('Dark Hyrule Castle', (1991, 226))]
entrances = [dict(name=n, mx=round((hy['offset'][0] + x) / hy['unit'], 4), my=round(-(hy['offset'][1] + y) / hy['unit'], 4))
             for n, (x, y) in ENTRANCES]

# Every room's place on our maps, for placing anything else by room
# (tmc_extras.py): its map version, and its top-left in map units.
room_places = {}
for (a, i), s in where.items():
    r = rendered.get((a, i)) or header_room(a, i)
    if not r: continue
    room_places[f'{a}:{i}'] = dict(submap=s['id'], folder=s['folder'], name=room_name(a, i), area=AREA.get(a),
                                   x=s['offset'][0] + r['x'] - s['origin'][0], y=s['offset'][1] + r['y'] - s['origin'][1],
                                   unit=s['unit'], w=r['w'], h=r['h'])
for m in maps:
    for s in m['submaps']: s.pop('rooms'); s['origin'] = list(s['origin'])
json.dump(dict(maps=maps, items=items, unplaced=unplaced, regions=regions, entrances=entrances, report=report, rooms=room_places),
          open(f'{BUILD}/spec.json', 'w'), indent=1)
print(len(maps), 'maps,', sum(len(m['submaps']) for m in maps), 'submaps,', len(items), 'items placed,', len(unplaced), 'unplaced')
print('\n'.join(report[:40]))
