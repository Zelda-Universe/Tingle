#!/usr/bin/env python3
"""Everything but chests and loose items, from the zeldaret/tmc decompilation:
elements, heart containers, Great Fairies, Wind Crests, Minish Portals, named
NPCs, Business Scrubs, shop stock, bosses, Kinstone Fusion results (golden
enemies apart), and the doors out of Hyrule (houses, shops, caves, fairy
fountains, minigames, dungeon entrances).

python3 tmc_extras.py <decomp inputs dir> <spec.json> <out extras.json>
The inputs dir holds entity_headers.s, room_headers.s, items.json,
tmc-enums.json, roomInit.c, transitions.c, gameData.c, area.h, roomid.h,
diggingCaveEntranceManager.c and messages-USA.json (translations/USA.json).
Positions go through spec.json's rooms (build_rom_maps.py).
"""
import json, os, re, sys

DEC, SPEC, OUT = sys.argv[1:4]
HERE = os.path.dirname(os.path.abspath(__file__))
spec = json.load(open(SPEC))
ROOMS = spec['rooms']
BY_NAME = {r['name']: k for k, r in ROOMS.items()}

src = open(f'{HERE}/tmc_items.py').read().split('# Rooms the rip lays out differently')[0]
ns = {}; sys.argv = ['tmc_items.py', DEC, '', os.devnull, os.path.dirname(OUT)]
os.environ.setdefault('TMC_NO_SUBMAPS', '1')
exec(compile(src.replace("submaps = json.load(open(SUBMAPS))", "submaps = {}"), 'tmc_items.py', 'exec'), ns)
BLOCKS, ROOM_LISTS, ITEMS = ns['BLOCKS'], ns['ROOM_LISTS'], ns['ITEMS']
ENUMS = json.load(open(f'{DEC}/tmc-enums.json'))
OBJ = {int(k): v for k, v in ENUMS['object'].items()}
NPC = {int(k): v for k, v in ENUMS['npc'].items()}
ENEMY = {int(k): v for k, v in ENUMS['enemy'].items()}

def title(const):
    words = [w for w in const.lower().split('_') if w]
    def word(i, w):
        if re.fullmatch(r'\d+f|b\d+', w): return w.upper()  # floors
        return w if i and w in ('of', 'to', 'the') else w.capitalize()
    return ' '.join(word(i, w) for i, w in enumerate(words)).replace('Dr ', 'Dr. ').replace('Links ', "Link's ").replace('Percys ', "Percy's ")

out, seen = [], set()
def place(room, x, y, cat, name, data, key=None):
    """A marker in a room (decompilation name), at a point in the room."""
    k = BY_NAME.get(room)
    if not k: return False
    r = ROOMS[k]
    key = key or (room, cat, name, x // 24, y // 24)
    if key in seen: return True
    seen.add(key)
    out.append(dict(submap=r['submap'], folder=r['folder'], cat=cat, name=name,
                    mx=round((r['x'] + x) / r['unit'], 3), my=round(-(r['y'] + y) / r['unit'], 3),
                    data=dict(data, source='zeldaret/tmc', room=room)))
    return True

# --- Entity lists ------------------------------------------------------------------
ELEMENTS = {'DeepwoodShrine': 'Earth Element', 'CaveOfFlames': 'Fire Element',
            'TempleOfDroplets': 'Water Element', 'PalaceOfWinds': 'Wind Element'}
BOSSES = {('enemy', 'CHUCHU_BOSS'): 'Big Green ChuChu', ('enemy', 'GLEEROK'): 'Gleerok',
          ('object', 'MAZAAL_BOSS_OBJECT'): 'Mazaal', ('enemy', 'OCTOROK_BOSS'): 'Big Octorok',
          ('object', 'GYORG_BOSS_OBJECT'): 'Gyorg Pair', ('enemy', 'VAATI_REBORN_ENEMY'): 'Vaati Reborn'}
# Townsfolk, animals, Minish crowds and props: not people to look for by name.
NPC_SKIP = re.compile(r'^(NPC_|TPWNSPERSON|KID|GUARD|MAID|FOREST_MINISH|TOWN_MINISH|SMALL_TOWN_MINISH|MOUNTAIN_MINISH|'
                      r'WIND_TRIBESPEOPLE|COW|CAT|DOG|CUCCO|SITTING_PERSON|CASTOR_WILDS_STATUE|STAMP|PHONOGRAPH|PICOLYTE_BOTTLE|'
                      r'MAILBOX|CLOTHES_RACK|MILK_CART|EPONA|ZELDA|KING_DALTUS|VAATI|EZLO|FARMERS|TEACHERS|LIBRARIANS|'
                      r'BUSINESS_SCRUB|SMITH|CARPENTER)')
NPC_NAMES = {'DR_LEFT': 'Dr. Left', 'BIG_GORON': 'Biggoron', 'HURDY_GURDY_MAN': 'Hurdy-Gurdy Man', 'MAYOR_HAGEN': 'Mayor Hagen',
             'BLADE_BROTHERS': 'Blade Brother', 'GHOST_BROTHERS': 'Ghost Brothers', 'TINGLE_SIBLINGS': 'Tingle Siblings',
             'GORON_MERCHANT': 'Goron Merchant', 'MOBLIN_LADY': 'Moblin Lady'}
# What shops sell that's worth finding (bombs, arrows and food left out).
STOCK = {'ITEM_SHIELD': (12062, 'Small Shield'), 'ITEM_WALLET': (12065, 'Big Wallet'), 'ITEM_BOMBBAG': (12065, 'Bomb Bag'),
         'ITEM_LARGE_QUIVER': (12065, 'Large Quiver'), 'ITEM_BOTTLE1': (12003, 'Bottle'), 'ITEM_BOOMERANG': (12061, 'Boomerang'),
         'ITEM_SHELLS30': (12005, '30 Mysterious Shells'), 'ITEM_QST_DOGFOOD': (12063, 'Dog Food'),
         'ITEM_QST_MUSHROOM': (12063, 'Mushroom')}
# Notable enemies, by type (the common ones would flood the map).
ENEMIES = {'DARK_NUT': 'Darknut', 'LIKE_LIKE': 'Like Like', 'RUPEE_LIKE': 'Rupee Like', 'WIZZROBE_WIND': 'Wind Wizzrobe',
           'WIZZROBE_FIRE': 'Fire Wizzrobe', 'WIZZROBE_ICE': 'Ice Wizzrobe', 'BALL_CHAIN_SOLIDER': 'Ball and Chain Soldier',
           'MOLDORM': 'Moldorm', 'LAKITU': 'Lakitu', 'ACRO_BANDIT': 'Acro Bandit', 'TAKKURI': 'Takkuri', 'GOBDO': 'Gibdo',
           'DOOR_MIMIC': 'Door Mimic', 'WALL_MASTER_2': 'Wallmaster', 'BOMB_PEAHAT': 'Bomb Peahat', 'ARMOS': 'Armos'}
# Rooms that are mini-boss fights (by the decompilation's room names).
MINIBOSSES = {'DeepwoodShrine_Madderpillar': 'Madderpillar', 'DeepwoodShrine_Mulldozer': 'Mulldozers',
              'FortressOfWinds_Darknut': 'Darknut', 'FortressOfWinds_Eyegore': 'Eyegore', 'FortressOfWinds_Wizzrobe': 'Wizzrobes',
              'TempleOfDroplets_BigBlueChuchu': 'Big Blue ChuChu', 'TempleOfDroplets_ScissorsMiniboss': 'Scissors Beetles',
              'TempleOfDroplets_Madderpillars': 'Madderpillars', 'PalaceOfWinds_DarknutMiniboss': 'Darknut',
              'PalaceOfWinds_BallAndChainSoldiers': 'Ball and Chain Soldiers', 'PalaceOfWinds_MoblinAndWizzrobeFight': 'Moblins and Wizzrobes',
              'PalaceOfWinds_KinstoneWizzrobeFight': 'Wizzrobes', 'DarkHyruleCastle_3FTripleDarknut': 'Darknuts',
              'CastorDarknut_Main': 'Darknut', 'HyruleTownMinishCaves_MulldozerFight': 'Mulldozers', 'RoyalCrypt_Gibdo': 'Gibdos'}
# The game's text (messages by bank and index), for signs.
MESSAGES = json.load(open(f'{DEC}/messages-USA.json'))
def message(mid):
    bank, index = mid >> 8, mid & 0xff
    text = MESSAGES[bank][index] if bank < len(MESSAGES) and index < len(MESSAGES[bank]) else ''
    return re.sub(r'\{[^}]*\}', '', text).strip()
def kv(line):
    return {k: int(v, 0) for k, v in re.findall(r'(\w+)=(0x[0-9a-f]+|\d+)', line, re.I)}
area_of = lambda room: room.split('_')[0]
for alabel, ablock in BLOCKS.items():
    if not alabel.startswith('Area_'): continue
    for room in re.findall(r'\.4byte Room_(\S+)', ablock):
        labels = re.findall(r'\.4byte (\S+)', BLOCKS.get('Room_' + room, '')) + ROOM_LISTS.get(room, [])
        for label in labels:
            for line in BLOCKS.get(label, '').splitlines():
                t = kv(line); line = line.strip(); sub = t.get('subtype', 0); x, y = t.get('x', 0), t.get('y', 0)
                if line.startswith('object_raw'):
                    o = OBJ.get(sub, '')
                    if o == 'FOUR_ELEMENTS' and re.sub('Boss$', '', area_of(room)) in ELEMENTS:
                        place(room, x, y, 12006, ELEMENTS[re.sub('Boss$', '', area_of(room))], {'object': o})
                    elif o == 'HEART_CONTAINER':
                        place(room, x, y, 12002, 'Heart Container', {'object': o})
                    elif o == 'GREAT_FAIRY':
                        place(room, x, y, 12032, 'Great Fairy', {'object': o}, key=(room, 'great-fairy'))
                    elif o == 'MINISH_SIZED_ENTRANCE':
                        place(room, x, y, 12054, 'Minish Hole', {'object': o})
                    elif o in ('PICO_BLOOM', 'MINERAL_WATER_SOURCE'):
                        place(room, x, y, 12045, 'Pico Bloom' if o == 'PICO_BLOOM' else 'Mineral Water', {'object': o})
                    elif o == 'WARP_POINT':
                        place(room, x, y, 12053, 'Warp Point', {'object': o})
                    elif o == 'BEANSTALK':
                        place(room, x, y, 12042, 'Beanstalk', {'object': o}, key=(room, 'beanstalk', x // 64, y // 64))
                    elif o == 'WINDCREST':
                        place(room, x, y, 12052, 'Wind Crest', {'object': o}, key=(room, 'windcrest'))
                    elif o == 'SHOP_ITEM' and t.get('paramA') in ITEMS and ITEMS[t['paramA']] in STOCK:
                        item = ITEMS[t['paramA']]; cat, name = STOCK[item]
                        place(room, x, y, cat, name + ' (for sale)', {'object': o, 'item': item})
                    elif ('object', o) in BOSSES:
                        place(room, x, y, 12071, BOSSES[('object', o)], {'object': o})
                elif line.startswith('tile_entity') and t.get('type') == 5:  # SIGN: paramC tile, paramD message
                    text = message(t.get('paramD', 0)); tile = t.get('paramC', 0)
                    if text:
                        # Signposts space their destinations apart: one line, with dots.
                        first = re.sub(r'\s{2,}', ' · ', text.split('\n')[0].strip())
                        place(room, (tile % 64) * 16 + 8, (tile // 64) * 16 + 8, 12044, first if 0 < len(first) <= 40 else 'Sign',
                              {'tileEntity': 'SIGN', 'message': t.get('paramD'), 'text': text})
                elif line.startswith('tile_entity') and t.get('type') == 4:  # BOMBABLE_WALL: paramC/D pixels
                    place(room, t.get('paramC', 0), t.get('paramD', 0), 12043, 'Cracked Wall', {'tileEntity': 'BOMBABLE_WALL'})
                elif line.startswith('enemy_raw'):
                    e = ENEMY.get(sub, '')
                    if ('enemy', e) in BOSSES:
                        place(room, x, y, 12071, BOSSES[('enemy', e)], {'enemy': e})
                    elif e in ENEMIES and room not in MINIBOSSES:
                        place(room, x, y, 12074, ENEMIES[e], {'enemy': e})
                    elif e == 'BUSINESS_SCRUB':
                        place(room, x, y, 12031, 'Business Scrub', {'enemy': e})
                elif line.startswith(('npc_raw', 'delayed_entity_raw')):
                    n = NPC.get(sub, '')
                    if n and not NPC_SKIP.match(n):
                        name = NPC_NAMES.get(n, title(n))
                        if n == 'BLADE_BROTHERS':  # each in his dojo, teaching sword techniques
                            m = re.search(r'([A-Z][a-z]+blade)', room)
                            place(room, x, y, 12066, m.group(1) if m else name, {'npc': n}, key=(room, 'npc', n))
                            continue
                        place(room, x, y, 12041, name, {'npc': n}, key=(room, 'npc', n))
                        # Prizes the game gives from code, where the giver is known: Anju's
                        # Cucco Round-Up (src/object/cuccoMinigame.c) and Librari (script_LibrariLater).
                        if n == 'ANJU':
                            place(room, x, y, 12001, 'Piece of Heart (Cucco Round-Up prize)', {'npc': n, 'reward': True}, key=('anju-heart',))
                        if n == 'LIBRARI':
                            place(room, x, y, 12002, 'Heart Container (from Librari)', {'npc': n, 'reward': True}, key=('librari-heart',))
                elif line.startswith('manager') and sub == 0x3:  # MINISH_PORTAL_MANAGER
                    place(room, x, y, 12036, 'Minish Portal', {'manager': 'MINISH_PORTAL_MANAGER'})

# --- Mini-boss fights: at the middle of their rooms ---------------------------------------
for room, name in MINIBOSSES.items():
    k = BY_NAME.get(room)
    if k: place(room, ROOMS[k]['w'] // 2, ROOMS[k]['h'] // 2, 12073, name, {'miniboss': room})

# --- Area and room constants -----------------------------------------------------------
def c_enum(text, first):
    body = text[text.index(first):]; body = body[:body.index('}')]
    vals, n = {}, -1
    for line in body.splitlines():
        line = re.sub(r'/\*.*?\*/|//.*', '', line).strip().rstrip(',')
        m = re.match(r'(\w+)\s*(?:=\s*(\w+))?$', line)
        if not m: continue
        n = int(m.group(2), 0) if m.group(2) else n + 1
        vals[m.group(1)] = n
    return vals
AREA_ID = c_enum(open(f'{DEC}/area.h').read(), 'AREA_MINISH_WOODS')
ROOM_ID = c_enum(open(f'{DEC}/roomid.h').read(), 'ROOM_MINISH_WOODS_MAIN')
AREA_NAME = {int(i, 16): n for n, i in re.findall(r'\.4byte gAreaRoomHeaders_(\w+)\s+@ 0x([0-9A-F]+)', open(f'{DEC}/room_headers.s').read())}
def room_by_const(area_const, room_const):
    a = AREA_ID.get(area_const); i = ROOM_ID.get(room_const)
    if a is None or i is None or a not in AREA_NAME: return None
    names = re.findall(r'\.4byte (\S+)', BLOCKS.get(f'Area_{AREA_NAME[a]}', ''))
    return names[i][5:] if i < len(names) and names[i] != '0x0' else None

# --- Kinstone Fusion results (src/gameData.c gWorldEvents) ---------------------------------
game = open(f'{DEC}/gameData.c').read()
body = game[game.index('const WorldEvent gWorldEvents[]'):].split('};')[0]
for m in re.finditer(r'\{\s*(\w+),\s*\d+,\s*(\w+),\s*(\w+),\s*\d+,\s*\d+,\s*(\d+),\s*(\d+),\s*\d+,\s*\d+,\s*\w+,\s*\w+,\s*(\w+)\s*\}', body):
    etype, area_c, room_c, x, y, flag = m.groups()
    if etype == 'WORLD_EVENT_TYPE_0' or not area_c.startswith('AREA_'): continue
    room = room_by_const(area_c, room_c)
    if not room: continue
    x, y = int(x), int(y)
    if flag.startswith('OUGONTEKI'):
        place(room, x, y, 12072, 'Golden Enemy', {'worldEvent': flag})
        continue
    # The flags are the game's own (Japanese) names for what a fusion changes.
    name = ('Fusion Chest' if flag.startswith('KAKERA_TAKARA') else 'Beanstalk' if flag.startswith('BEANDEMO') else
            title(flag.replace('ITEM_', '').replace('_BUTTERFLY', '')) + ' Butterfly' if flag.endswith('_BUTTERFLY') else
            'Cave Opens' if 'DOUKUTU' in flag else 'Minish Hole Opens' if 'KOBITOANA' in flag else
            'Hollow Tree Opens' if flag.startswith('URO') else 'Grave Moves' if flag.startswith('HAKA') else
            'Sword Technique' if flag.startswith('ITEM_SKILL') else 'Kinstone Fusion')
    if name == 'Beanstalk':
        place(room, x, y, 12042, name, {'worldEvent': flag}, key=(room, 'beanstalk', x // 64, y // 64))
    elif name == 'Sword Technique':
        place(room, x, y, 12066, title(flag.replace('ITEM_SKILL_', '')), {'worldEvent': flag})
    else:
        place(room, x, y, 12004, name, {'worldEvent': flag, 'type': etype})

# --- Dig spots: where Mole Mitts dig into a cave (diggingCaveEntranceManager.c) -------------
dig = open(f'{DEC}/diggingCaveEntranceManager.c').read()
for m in re.finditer(r'\{\s*TILE_POS\((\d+),\s*(\d+)\),\s*(ROOM_\w+),\s*(CAVE_\w+_ENTER),\s*(AREA_\w+)', dig):
    tx, ty, room_c, kind, target = int(m.group(1)), int(m.group(2)), m.group(3), m.group(4), m.group(5)
    area_c = max((a for a in AREA_ID if room_c.startswith('ROOM_' + a[5:] + '_')), key=len, default=None)
    room = area_c and room_by_const(area_c, room_c)
    if room: place(room, tx * 16 + 8, ty * 16 + 8, 12038, 'Dig Spot', {'digCave': kind, 'to': target})

# --- Doors out of Hyrule, Minish Village and Cloud Tops (src/data/transitions.c) ----------------
FROM = ('MinishWoods_', 'HyruleTown_', 'HyruleField_', 'CastorWilds_', 'Ruins_', 'MtCrenel_', 'CastleGarden_',
        'RoyalValley_', 'VeilFalls_', 'LakeHylia_', 'VeilFallsTop_', 'MinishVillage_', 'CloudTops_')
CAVES = ('AREA_CAVES', 'AREA_CRENEL_CAVES', 'AREA_CASTOR_CAVES', 'AREA_VEIL_FALLS_CAVES', 'AREA_MINISH_CAVES',
         'AREA_HYLIA_DIG_CAVES', 'AREA_DIG_CAVES', 'AREA_LAKE_WOODS_CAVE', 'AREA_GORON_CAVE', 'AREA_HYRULE_TOWN_UNDERGROUND',
         'AREA_ROYAL_VALLEY_GRAVES', 'AREA_ROYAL_CRYPT', 'AREA_HYRULE_CASTLE_CELLAR', 'AREA_MELARIS_MINE')
HOUSES = ('AREA_HOUSE_INTERIORS_1', 'AREA_HOUSE_INTERIORS_2', 'AREA_HOUSE_INTERIORS_3', 'AREA_HOUSE_INTERIORS_4',
          'AREA_TREE_INTERIORS', 'AREA_MINISH_HOUSE_INTERIORS', 'AREA_DOJOS', 'AREA_HYRULE_CASTLE', 'AREA_WIND_TRIBE_TOWER')
DUNGEONS = {'AREA_DEEPWOOD_SHRINE': 'Deepwood Shrine', 'AREA_CAVE_OF_FLAMES': 'Cave of Flames',
            'AREA_FORTRESS_OF_WINDS': 'Fortress of Winds', 'AREA_TEMPLE_OF_DROPLETS': 'Temple of Droplets',
            'AREA_PALACE_OF_WINDS': 'Palace of Winds', 'AREA_DARK_HYRULE_CASTLE': 'Dark Hyrule Castle'}
PLACE_LABEL = {'AREA_CAVES': 'Cave', 'AREA_CRENEL_CAVES': 'Mt. Crenel Cave', 'AREA_CASTOR_CAVES': 'Castor Wilds Cave',
               'AREA_VEIL_FALLS_CAVES': 'Veil Falls Cave', 'AREA_MINISH_CAVES': 'Minish Cave', 'AREA_HYLIA_DIG_CAVES': 'Lake Hylia Dig Cave',
               'AREA_DIG_CAVES': 'Dig Cave', 'AREA_LAKE_WOODS_CAVE': 'Lake Woods Cave', 'AREA_GORON_CAVE': 'Goron Cave',
               'AREA_HYRULE_TOWN_UNDERGROUND': 'Hyrule Town Underground', 'AREA_ROYAL_VALLEY_GRAVES': 'Grave',
               'AREA_ROYAL_CRYPT': 'Royal Crypt', 'AREA_HYRULE_CASTLE_CELLAR': 'Hyrule Castle Cellar', 'AREA_MELARIS_MINE': "Melari's Mine",
               'AREA_TREE_INTERIORS': 'Tree House', 'AREA_MINISH_HOUSE_INTERIORS': 'Minish House', 'AREA_DOJOS': 'Dojo',
               'AREA_HYRULE_CASTLE': 'Hyrule Castle', 'AREA_WIND_TRIBE_TOWER': 'Wind Tribe Tower'}
SHOP = re.compile(r'SHOP|CAFE|BAKERY|BUSINESS_SCRUB')
GAME = {'HOUSE_INTERIORS_2_CUCCO': 'Cucco Round-Up', 'HOUSE_INTERIORS_3_SIMON': "Simon's Simulation"}
trans = open(f'{DEC}/transitions.c').read()
for room, body in re.findall(r'const Transition gExitList_(\w+)\[\] = \{(.*?)\n\};', trans, re.S):
    if not room.startswith(FROM): continue
    for m in re.finditer(r'\{\s*WARP_TYPE_AREA,\s*(0x[0-9a-f]+),\s*(0x[0-9a-f]+),\s*0x[0-9a-f]+,\s*0x[0-9a-f]+,\s*\w+,\s*(\w+),\s*(\w+)', body, re.I):
        x, y, area_c, room_c = int(m.group(1), 16), int(m.group(2), 16), m.group(3), m.group(4)
        short = room_c[len('ROOM_'):]
        rest = short[len(area_c) - len('AREA_'):].strip('_') if short.startswith(area_c[len('AREA_'):]) else short
        key = (room, 'door', room_c)
        if area_c in DUNGEONS:
            place(room, x, y, 12051, DUNGEONS[area_c], {'warp': room_c}, key=key)
        elif short in GAME:
            place(room, x, y, 12033, GAME[short], {'warp': room_c}, key=key)
        elif area_c == 'AREA_GREAT_FAIRIES' or re.search('GREAT_FAIRY|FAIRY_FOU?INTAIN|GARDEN_FOUNTAINS', room_c):
            place(room, x, y, 12032, 'Great Fairy' if 'GREAT' in room_c else 'Fairy Fountain', {'warp': room_c}, key=key)
        elif SHOP.search(rest):
            place(room, x, y, 12031, title(rest), {'warp': room_c}, key=key)
        elif area_c in CAVES or area_c in HOUSES:
            label = PLACE_LABEL.get(area_c, title(area_c[5:]))
            own = title(rest)
            if not own or re.fullmatch(r'\d+|Main|Entrance|Exit|Stairs|North|South', own): name = label
            elif area_c.startswith('AREA_HOUSE_INTERIORS'): name = own
            else: name = f'{label} ({own})'
            place(room, x, y, 12034 if area_c in CAVES else 12035, name, {'warp': room_c}, key=key)

json.dump(out, open(OUT, 'w'), indent=0)
from collections import Counter
print(len(out), 'markers:', dict(Counter(o['cat'] for o in out)))
