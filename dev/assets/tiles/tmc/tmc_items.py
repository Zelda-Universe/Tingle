#!/usr/bin/env python3
"""Places The Minish Cap's chests and loose items on our tiles, from the
zeldaret/tmc decompilation's room data (data/map/*.s, include/item.h).

python3 tmc_items.py <decomp dir> <work dir> <submaps json> <out dir>
<submaps json>: {"tmc/v1/<folder>/": submap id}. Writes <out dir>/items.json
and a ringed check image per floor.
"""
import json, os, re, subprocess, sys
from collections import defaultdict

DEC, WORK, SUBMAPS, OUT = sys.argv[1:5]
os.makedirs(OUT, exist_ok=True)
def us_release(src):
    """Keeps what the US release builds: no EU, JP or DEMO symbols defined."""
    out, stack = [], []
    for line in src.splitlines():
        t = line.strip()
        if t.startswith('.ifdef') or t.startswith('.ifndef') or t.startswith('.if '):
            cond = not t.startswith('.ifdef') if t.startswith(('.ifdef', '.ifndef')) else False
            stack.append(cond); continue
        if t.startswith('.else'):
            stack[-1] = not stack[-1]; continue
        if t.startswith('.endif'):
            stack.pop(); continue
        if all(stack): out.append(line)
    return '\n'.join(out)
ents = us_release(open(f'{DEC}/entity_headers.s').read())
rooms_s = open(f'{DEC}/room_headers.s').read()
ITEMS = {int(k): v for k, v in json.load(open(f'{DEC}/items.json')).items()}
submaps = json.load(open(SUBMAPS))

def blocks(src, label_re):
    return {m.group(1): m.group(2) for m in re.finditer(
        rf'^({label_re})::[^\n]*\n(.*?)(?=^\w+::|\Z)', src, re.S | re.M)}
BLOCKS = blocks(ents, r'[A-Za-z0-9_]+')

# Entity lists a room loads from its own code (src/roomInit.c: chests and NPCs
# that appear after an event, Wind Crests...), by room: each room's
# sub_StateChange_/sub_unkN_ functions and the lists they LoadRoomEntityList.
ROOM_LISTS = {}
if os.path.exists(f'{DEC}/roomInit.c'):
    for room, body in re.findall(r'void sub_(?:StateChange|unk\d)_(\w+)\(void\)\s*\{(.*?)\n\}', open(f'{DEC}/roomInit.c').read(), re.S):
        for label in re.findall(r'LoadRoomEntityList\(\s*&?(\w+)\s*\)', body):
            ROOM_LISTS.setdefault(room, [])
            if label not in ROOM_LISTS[room]: ROOM_LISTS[room].append(label)

def headers(area):
    b = rooms_s.split(f'gAreaRoomHeaders_{area}::', 1)[1].split('.2byte 0xFFFF', 1)[0]
    return [tuple(int(v, 16) for v in m.groups()) for m in re.finditer(
        r'room_header (0x[0-9a-f]+), (0x[0-9a-f]+), (0x[0-9a-f]+), (0x[0-9a-f]+)', b, re.I)]

def kv(line):
    return {k: int(v, 16) for k, v in re.findall(r'(\w+)=(0x[0-9a-f]+)', line, re.I)}

def room_items(area):
    """Each room: (index, name, abs rect, [items with abs px])."""
    names = re.findall(r'\.4byte (\S+)', BLOCKS[f'Area_{area}'])
    hs = headers(area); out = []
    for i, room in enumerate(names):
        if room == '0x0': continue
        # A room with no position in the table (DHC's top-left 3F tower) keeps
        # a zero rect: only an anchor can place it.
        rx, ry, rw, rh = (hs[i][0] * 16, hs[i][1] * 16, hs[i][2], hs[i][3]) if i < len(hs) and hs[i][2] else (0, 0, 0, 0)
        found = []
        for label in re.findall(r'\.4byte (\S+)', BLOCKS.get(room, '')) + ROOM_LISTS.get(room[5:], []):
            body = BLOCKS.get(label, '')
            for line in body.splitlines():
                t = kv(line); line = line.strip()
                if line.startswith('tile_entity') and t.get('type') == 2:
                    tile = t['paramC']
                    found.append(dict(how='chest', item=t['paramB'] & 0xff, amount=t['paramB'] >> 8,
                                      flag=t.get('paramA', 0), x=(tile % 64) * 16 + 8, y=(tile // 64) * 16 + 8))
                elif line.startswith('tile_entity') and t.get('type') == 3:
                    found.append(dict(how='big chest', item=t['paramB'] & 0xff, amount=0,
                                      flag=t.get('paramA', 0), x=t['paramC'], y=t['paramD']))
                elif line.startswith('object_raw') and t.get('subtype') == 0 and 'paramA' in t:
                    found.append(dict(how='ground', item=t['paramA'], amount=t.get('paramB', 0) & 0xff,
                                      flag=t.get('paramC', 0) >> 16, x=t['x'], y=t['y']))
        seen = set(); items = []
        for f in found:
            key = (f['how'], f['item'], f['x'], f['y'])
            if key in seen: continue
            seen.add(key); f.update(ax=rx + f['x'], ay=ry + f['y'], room=room[5:], area=area); items.append(f)
        out.append((i, room[5:], (rx, ry, rw, rh), items))
    return out

def groups(rooms, gap=40):
    """Rooms that touch (or nearly) are one floor."""
    rooms = [r for r in rooms if r[2][2]]
    parent = list(range(len(rooms)))
    def find(a):
        while parent[a] != a: parent[a] = parent[parent[a]]; a = parent[a]
        return a
    for a in range(len(rooms)):
        for b in range(a + 1, len(rooms)):
            ax, ay, aw, ah = rooms[a][2]; bx, by, bw, bh = rooms[b][2]
            if ax - gap < bx + bw and bx - gap < ax + aw and ay - gap < by + bh and by - gap < ay + ah:
                parent[find(a)] = find(b)
    g = defaultdict(list)
    for i, r in enumerate(rooms): g[find(i)].append(r)
    res = []
    for rs in g.values():
        x0 = min(r[2][0] for r in rs); y0 = min(r[2][1] for r in rs)
        x1 = max(r[2][0] + r[2][2] for r in rs); y1 = max(r[2][1] + r[2][3] for r in rs)
        res.append(dict(rooms=rs, box=(x0, y0, x1 - x0, y1 - y0)))
    return res

def trim(path):
    w, h, x, y = subprocess.run(['magick', path, '-trim', '-format', '%w %h %X %Y', 'info:'],
                                capture_output=True, text=True, check=True).stdout.split()
    return int(w), int(h), int(x), int(y)

def size(path):
    return tuple(map(int, subprocess.run(['magick', 'identify', '-format', '%w %h', path],
                                         capture_output=True, text=True, check=True).stdout.split()))

DUNGEONS = {
  'deepwood-shrine': (['DeepwoodShrine', 'DeepwoodShrineBoss', 'DeepwoodShrineEntry'], ['1f', 'b1', 'b2']),
  'cave-of-flames': (['CaveOfFlames', 'CaveOfFlamesBoss'], ['1f', 'b1', 'b2', 'b3']),
  'fortress-of-winds': (['FortressOfWinds', 'FortressOfWindsTop', 'InnerMazaal'], ['1f', '2f', '3f']),
  'temple-of-droplets': (['TempleOfDroplets'], ['b1', 'b2', 'b3']),
  'palace-of-winds': (['PalaceOfWinds', 'PalaceOfWindsBoss'], ['1f', '2f', '3f', '4f', '5f']),
  'dark-hyrule-castle': (['DarkHyruleCastle', 'DarkHyruleCastleOutside', 'DarkHyruleCastleBridge'],
                         ['b2', 'b1', '1f', '2f', '3f', '4f', 'sacred-realm']),
}
placed, unplaced, report = [], [], []

def place(folder, items, to_crop, native, canvas, crop_size):
    cw, ch = canvas; w, h = crop_size; side = 256 * 2 ** native; u = 2 ** native
    left = (side - cw) // 2 + (cw - w) // 2; top = (side - ch) // 2 + (ch - h) // 2
    for it in items:
        px, py = to_crop(it['ax'], it['ay'])
        it.update(folder=folder, submap=submaps[f'tmc/v1/{folder}/'], px=px, py=py,
                  mx=round((left + px) / u, 3), my=round(-(top + py) / u, 3))
        placed.append(it)

# Rooms the rip lays out differently from the game, placed one by one from
# the art: (floor, room) -> the room's top-left in the floor's crop.
ANCHORS = {
  'FortressOfWinds_Wizzrobe': ('fortress-of-winds', '1f', 80, 0),
  'FortressOfWinds_WestStairs1F': ('fortress-of-winds', '1f', 304, 0),
  'FortressOfWinds_CenterStairs1F': ('fortress-of-winds', '1f', 560, 0),
  'FortressOfWinds_EastStairs1F': ('fortress-of-winds', '1f', 800, 0),
  'FortressOfWinds_HeartPiece': ('fortress-of-winds', '1f', 1040, 0),
  'DarkHyruleCastle_3FTopLeftTower': ('dark-hyrule-castle', '3f', 0, 32),
  'DarkHyruleCastle_3FTopRightTower': ('dark-hyrule-castle', '3f', 1088, 32),
  'DarkHyruleCastle_3FBottomLeftTower': ('dark-hyrule-castle', '3f', 0, 1392),
  'DarkHyruleCastle_3FBottomRightTower': ('dark-hyrule-castle', '3f', 1088, 1393),
}
placed_rooms = set()
room_floor = {}
import numpy as np

def art_mask(path, scale):
    w, h = size(path); sw, sh = -(-w // scale), -(-h // scale)
    raw = subprocess.run(['magick', path, '-alpha', 'off', '-colorspace', 'gray', '-threshold', '3%',
                          '-sample', f'{sw}x{sh}!', '-depth', '8', 'gray:-'], capture_output=True, check=True).stdout
    return (np.frombuffer(raw, np.uint8).reshape(sh, sw) > 0)

def room_mask(rooms, box, scale):
    x0, y0, w, h = box
    m = np.zeros((-(-h // scale), -(-w // scale)), bool)
    for r in rooms:
        rx, ry, rw, rh = r[2]
        m[(ry - y0) // scale:(ry - y0 + rh) // scale, (rx - x0) // scale:(rx - x0 + rw) // scale] = True
    return m

def best_fit(art, mask, around=None, radius=None):
    """Offset (dx, dy) of mask's top-left in art, maximising overlap / union."""
    ah, aw = art.shape; mh, mw = mask.shape
    A, M = int(art.sum()), int(mask.sum())
    big = np.zeros((ah + 2 * mh, aw + 2 * mw), np.int32); big[mh:mh + ah, mw:mw + aw] = art
    best = (-1, 0, 0)
    xs = range(-mw, aw) if around is None else range(around[0] - radius, around[0] + radius + 1)
    ys = range(-mh, ah) if around is None else range(around[1] - radius, around[1] + radius + 1)
    mi = mask.astype(np.int32)
    for dy in ys:
        rows = big[dy + mh:dy + mh + mh]
        if rows.shape[0] != mh: continue
        for dx in xs:
            win = rows[:, dx + mw:dx + mw + mw]
            if win.shape[1] != mw: continue
            inter = int((win * mi).sum())
            score = inter / (A + M - inter)
            if score > best[0]: best = (score, dx, dy)
    return best

def candidate_groups(rooms):
    gs = groups(rooms, gap=64)
    # Dark Hyrule Castle names its rooms by floor; outdoor rooms aren't on the rip.
    byname = defaultdict(list)
    for r in rooms:
        m = re.match(r'DarkHyruleCastle_(B\d|\dF)', r[1])
        if m and r[2][2]: byname[m.group(1)].append(r)
    for rs in byname.values():
        x0 = min(r[2][0] for r in rs); y0 = min(r[2][1] for r in rs)
        x1 = max(r[2][0] + r[2][2] for r in rs); y1 = max(r[2][1] + r[2][3] for r in rs)
        gs.append(dict(rooms=rs, box=(x0, y0, x1 - x0, y1 - y0)))
    return gs

for slug, (areas, floors) in DUNGEONS.items():
    rooms = [r for a in areas if f'Area_{a}' in BLOCKS for r in room_items(a)]
    gs = candidate_groups([r for r in rooms if r[1] not in ANCHORS])
    sizes = {f: size(f'{WORK}/{slug}-{f}.png') for f in floors}
    canvas = (max(s[0] for s in sizes.values()), max(s[1] for s in sizes.values()))
    scores = []
    for f in floors:
        art8 = art_mask(f'{WORK}/{slug}-{f}.png', 8)
        for gi, g in enumerate(gs):
            sc, dx, dy = best_fit(art8, room_mask(g['rooms'], g['box'], 8))
            scores.append((sc, f, gi, dx, dy))
    scores.sort(reverse=True); usedf, usedg = set(), set()
    for sc, f, gi, dx, dy in scores:
        if f in usedf or gi in usedg or sc < 0.6: continue
        g = gs[gi]
        # Rooms already placed on another floor (a name group overlapping a touch group) aren't reused.
        if any(r[1] in placed_rooms for r in g['rooms']): continue
        usedf.add(f); usedg.add(gi)
        art1 = art_mask(f'{WORK}/{slug}-{f}.png', 1)
        sc1, fx, fy = best_fit(art1, room_mask(g['rooms'], g['box'], 1), (dx * 8, dy * 8), 10)
        gx, gy = g['box'][0], g['box'][1]
        items = [it for r in g['rooms'] for it in r[3]]
        for r in g['rooms']: placed_rooms.add(r[1]); room_floor[r[1]] = f'{slug}-{f}'
        report.append(f'{slug} {f}: {len(g["rooms"])} rooms, fit {sc1:.2f}, {len(items)} items')
        w, h = sizes[f]
        inside = [it for it in items if 0 <= it['ax'] - gx + fx < w and 0 <= it['ay'] - gy + fy < h]
        unplaced.extend(dict(it, why='outside the art') for it in items if it not in inside)
        place(f'{slug}-{f}', inside, lambda ax, ay, fx=fx, fy=fy, gx=gx, gy=gy: (ax - gx + fx, ay - gy + fy), 4, canvas, sizes[f])
    for f in floors:
        if f not in usedf: report.append(f'{slug} {f}: no rooms fit')
    for r in rooms:
        if r[1] in ANCHORS and r[1] not in placed_rooms and ANCHORS[r[1]][0] == slug:
            _, f, lx, ly = ANCHORS[r[1]]; placed_rooms.add(r[1]); room_floor[r[1]] = f'{slug}-{f}'
            report.append(f'{slug} {f}: {r[1]} placed from the art, {len(r[3])} items')
            place(f'{slug}-{f}', r[3], lambda ax, ay, r=r, lx=lx, ly=ly: (ax - r[2][0] + lx, ay - r[2][1] + ly), 4, canvas, sizes[f])
    left = [it for r in rooms if r[1] not in placed_rooms for it in r[3]]
    seen = set()
    for it in left:
        k = (it['room'], it['x'], it['y'], it['item'])
        if k not in seen: seen.add(k); unplaced.append(dict(it, why='room not on the rip'))

# Hyrule: the rip is drawn in the game's world coordinates.
OVERWORLD = ['MinishWoods', 'MinishVillage', 'HyruleTown', 'HyruleField', 'CastorWilds', 'Ruins', 'MtCrenel',
             'CastleGarden', 'RoyalValley', 'VeilFalls', 'LakeHylia', 'VeilFallsTop', 'CloudTops']
# Cloud Tops' three layers share one place in the game; the rip lays them out
# beside each other (checked against its chests).
CLOUD = {0: (0, 192), 1: (1008, 192), 2: (1008, 1200)}
for a in OVERWORLD:
    for i, name, rect, items in room_items(a):
        if not rect[2] or (a == 'RoyalValley' and rect[1] > 3000):
            unplaced.extend(dict(it, why='no room position') for it in items); continue  # a grave interior, not on the rip
        dx, dy = CLOUD.get(i, (0, 0)) if a == 'CloudTops' else (0, 0)
        place('hyrule', items, lambda ax, ay, dx=dx, dy=dy: (ax + dx, ay + dy), 5, (4992, 3168), (4992, 3168))

# Everything else (caves, houses, Minish areas): no map of ours yet.
covered = {a for v in DUNGEONS.values() for a in v[0]} | set(OVERWORLD)
for label in re.findall(r'\.4byte Area_(\w+)', BLOCKS.get('gAreaTable', '')):
    if label in covered: continue
    try:
        for r in room_items(label):
            unplaced.extend(dict(it, why='no map for ' + label) for it in r[3])
    except (KeyError, IndexError):
        pass

# Loose rupees and kinstones are drops (trees, pots, events), not pickups to
# mark; Minish Village is drawn elsewhere; nothing past the rip's edge.
RUPEES = {0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5c}
keep = []
for it in placed:
    if it['how'] == 'ground' and it['item'] in RUPEES: continue
    if it['area'] == 'MinishVillage' or (it['folder'] == 'hyrule' and not (0 <= it['px'] < 4992 and 0 <= it['py'] < 3168)):
        unplaced.append(dict(it, why='not on the rip')); continue
    keep.append(it)
placed = keep
for it in placed + unplaced: it['itemName'] = ITEMS.get(it['item'], hex(it['item']))
json.dump(room_floor, open(f'{OUT}/room_floor.json', 'w'), indent=0)
json.dump({'placed': placed, 'unplaced': unplaced, 'report': report}, open(f'{OUT}/items.json', 'w'), indent=0)

# Check images: rings on each floor's art.
rings = defaultdict(list)
for it in placed:
    r = 18 if it['how'] == 'big chest' else 11
    col = '#ff2bd6' if it['how'] != 'ground' else '#00e5ff'
    rings[it['folder']] += ['-stroke', col, '-draw', f"circle {it['px']},{it['py']} {it['px'] + r},{it['py']}"]
for folder, dr in rings.items():
    src = f'{WORK}/{"hyrule-main" if folder == "hyrule" else folder}.png'
    subprocess.run(['magick', src, '-fill', 'none', '-strokewidth', '3', *dr, f'{OUT}/{folder}.png'], check=True)
print('\n'.join(report)); print(len(placed), 'placed;', len(unplaced), 'unplaced')
