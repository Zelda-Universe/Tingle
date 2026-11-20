#!/usr/bin/env python3
"""Breath of the Wild data the map was missing, from the game's own files,
as one migration: the dragons and their flight paths, every shop, every
quest (main, side, shrine and DLC), the DLC treasure chests, and Master
Mode's chests, floating platforms and extra enemies.

Two steps:

  python3 dev/assets/botw/missing-data.py prepare RADAR QUESTMSG OBJMAP EXISTING
      Reads the game data and writes dev/assets/botw/missing-data.json.
      RADAR     content/ of github.com/zeldamods/radar (map units, names.json)
      QUESTMSG  botw-wiiu/USen/QuestMsg/ of github.com/kenshiisod/botw-gettext
                (the game's quest text: names and log entries)
      OBJMAP    objmap.zeldamods.org/game_files with map_summary/MainField/
                static.json and text/StaticMsg/LocationMarker.json
      EXISTING  the site's BotW quest and chest markers as JSON lines (the
                query is in docs/BotW-Missing-Data.md)

  python3 dev/assets/botw/missing-data.py sql
      Writes migrations/20261120130000_botw_missing_data.sql (+ .down.sql)
      from missing-data.json alone.

Positions are the game's (X east, Z south) on the site's map, as
labels-and-regions.cjs: x = X / 64 + 128, y = -Z / 64 - 128.
"""
import glob
import hashlib
import html
import json
import math
import os
import re
import statistics
import sys
from collections import Counter, defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, '..', '..', '..'))
SOURCE = os.path.join(HERE, 'missing-data.json')
MIGRATION = '20261120130000_botw_missing_data'

GAME, SUBMAP, USER = 19, 1901, 15
FIRST_ID = 19600001  # this import's markers: 19600001 onwards

# New categories. Same menu_order as a sibling puts it straight after it
# (the menu sorts by order, then id). DLC ones look like Shrine of Trials
# (DLC); Master Mode ones are a menu section of their own, in a style of
# their own.
DLC_STYLE = dict(color='#4395f7', custom_style=1, shape='diamond', glyph='#ffffff')
MASTER_STYLE = dict(color='#a8324a', custom_style=1, shape='diamond', glyph='#ffffff')
CATEGORIES = [
    dict(id=2284, parent=1901, name='Dragon', img='TotK_Dragon', color='#4bc5ee', section='Points of Interest', order=14, zoom=6),
    dict(id=2285, parent=1920, name='Shops', img='General_Store', color='#8f773a', custom_style=1, shape='square', glyph='#684521', section='Locations', order=10, zoom=5),
    dict(id=2286, parent=1901, name='Main Quests', img='BotW_Side-Quest', color='#f2c94c', section='Points of Interest', order=16, zoom=6),
    dict(id=2287, parent=1901, name='Shrine Quests', img='BotW_Shrine-Quest', color='#8e72b9', section='Points of Interest', order=16, zoom=6),
    dict(id=2288, parent=1901, name='Quests (DLC)', img='BotW_Side-Quest', section='Points of Interest', order=16, zoom=6, **DLC_STYLE),
    dict(id=2289, parent=1902, name='Treasure Chest (DLC)', img='BotW_Treasure-Chest', section='Treasure', order=29, zoom=6, **DLC_STYLE),
    dict(id=2290, parent=1910, name='Treasure Chest (Master Mode)', img='BotW_Treasure-Chest', section='Master Mode', order=41, zoom=6, **MASTER_STYLE),
    dict(id=2291, parent=1901, name='Floating Platform (Master Mode)', img='BotW_Points-of-Interest', section='Master Mode', order=42, zoom=6, **MASTER_STYLE),
    dict(id=2292, parent=1930, name='Enemies (Master Mode)', img='BotW_Enemies', section='Master Mode', order=43, zoom=6, **MASTER_STYLE),
]
CAT = {c['name']: c['id'] for c in CATEGORIES}
SIDE_QUESTS, EQUIP_CHESTS, NON_EQUIP_CHESTS = 1935, 1944, 1943

# Quest kinds, by the game's quest names (QL_<id>). The rest are side
# quests; EX quests are DLC.
MAIN = ['FindDungeon', 'Find_Impa', 'CarryingBlueFireEXMini', 'PictureMemory', 'FairyFountain', 'Find_4Relic',
        'GotoZoraVillage', 'Water_Relic', 'Fire_Relic', 'Wind_Relic', 'Drag_Hero', 'Electric_Relic',
        'Get_MasterSword', 'GanonQuest', 'FirstTower']
SHRINE = ['Animal_Forest', 'BloodyMoonRelief', 'Cliff_Maze', 'CursedStatue', 'DarkWoods', 'Desert_Maze', 'DokuroEye',
          'DontDamageFlower', 'FirstOhenro', 'FourJewel', 'Gaman', 'Gerudo_CarryIce', 'GodTree', 'GoronCamp',
          'HatenoMini_ThreeTree', 'HatenoMini_WhiteDragon', 'HigakkareMini_RedDragon', 'KnightDoll', 'MacuseIseki',
          'MagneticFld', 'MouthofDragon', 'MtMotelMini_Landscape', 'NakedIsland', 'Relief_Landing', 'Remains_Fancier',
          'RitoRabitMountain', 'RitoSongMystery', 'Rito_BrosRock', 'SandStorm', 'SearchStone', 'SecretofObject',
          'SeekerEye', 'Shadow_Sign', 'ShieldofKolog', 'Solitary_Maze', 'StatueofZora', 'StolenBook',
          'SunazarashiRace', 'Threebros_giant', 'Thunder_Sword', 'TwoWheels', 'Gerudo_Ch_Helmet']
DLC_PACK = {'100enemy': 1, 'TreasureHunt01': 1, 'TreasureHunt02': 1, 'TreasureHunt03': 1, 'TreasureHunt04': 1,
            'BalladOfHeroes': 2, 'BalladOfHeroGerudo': 2, 'BalladOfHeroGoron': 2, 'BalladOfHeroRito': 2,
            'BalladOfHeroZora': 2}
DLC_NAMES = {1: 'The Master Trials (DLC Pack 1)', 2: "The Champions' Ballad (DLC Pack 2)"}

# Where a quest starts, when the giver its log names isn't enough. By
# default it's the first person its opening log entry names, at their
# placement nearest a place that entry names (or the quest's own trigger).
#   npc/actor: that person or placement; near: the place (or 'anchor', the
#   quest's trigger) to pick their placement by
#   anchor: the quest's own trigger in the map (its EventTags, by its id)
#   location: a place on the game's map, for legends heard of somewhere
#   pos: a fixed game position
QUEST_START = {
    '100enemy': {'npc': 'The Great Deku Tree'},
    'Get_MasterSword': {'npc': 'The Great Deku Tree'},
    'BalladOfHeroGerudo': {'actor': 'Npc_Musician_AoC_HeroGerudo'},
    'BalladOfHeroGoron': {'actor': 'Npc_Musician_AoC_HeroGoron'},
    'BalladOfHeroRito': {'actor': 'Npc_Musician_AoC_HeroRito'},
    'BalladOfHeroZora': {'actor': 'Npc_Musician_AoC_HeroZora'},
    'BalladOfHeroes': {'actor': 'Npc_Musician_AoC_BalladOfHeroes_Last'},
    # Kass's songs: the spot he sings each one, within metres of its trigger.
    'Animal_Forest': {'actor': 'Npc_Musician_014'},
    'BloodyMoonRelief': {'actor': 'Npc_Musician_012'},
    'MouthofDragon': {'actor': 'Npc_Musician_002'},
    'Relief_Landing': {'actor': 'Npc_Musician_015'},
    'Shadow_Sign': {'actor': 'Npc_Musician_003'},
    'TwoWheels': {'actor': 'Npc_Musician_001'},
    'Thunder_Sword': {'actor': 'Npc_Musician_005'},
    'HateeluMini_Treasure': {'actor': 'Npc_Musician_007'},
    'OldKorok_Help': {'actor': 'Npc_OldKorok_Help'},
    'FindDungeon': {'npc': 'Old Man', 'near': 'Great Plateau Tower'},
    'FairyFountain': {'npc': 'Pikango', 'near': 'Kakariko Village'},
    'GotoZoraVillage': {'npc': 'Sidon', 'near': 'anchor'},
    'Gerudo_Ch_FindingValetta': {'npc': 'Barta', 'near': 'Gerudo Town'},
    'GoronsRock': {'npc': 'Bladon', 'near': 'Goron City'},
    'Find_4Relic': {'npc': 'Impa'},
    'PictureMemory': {'npc': 'Impa'},
    'Gerudo_Ch_Helmet': {'npc': 'Riju'},
    'StolenBook': {'npc': 'Dorian'},
    'GodTree': {'npc': 'Zooki'},
    'KorokMini_KorokShiren': {'npc': 'Chio'},
    'ShieldofKolog': {'npc': 'Damia'},
    'HatenoMini_DevilSeal': {'pos': [3286.0, 218.0, 2198.0], 'giver': 'Horned Statue'},  # TwnObj_DemonStatue_A_01
    'GanonQuest': {'location': 'Temple of Time'},
    'CompleteDungeon': {'location': 'Forgotten Temple'},
    'FirstTower': {'location': 'Shrine of Resurrection'},
    'HatenoMini_ThreeTree': {'location': 'Hateno Village'},
    'HigakkareMini_RedDragon': {'location': 'East Akkala Stable'},
    'MagneticFld': {'location': 'Gerudo Desert Gateway'},
    'SandStorm': {'location': 'Kara Kara Bazaar'},
    'TreasureHunt01': {'location': 'Woodland Stable'},
    'TreasureHunt02': {'location': 'South Akkala Stable'},
    'TreasureHunt04': {'location': 'Riverside Stable'},
}
for k in ['Bottle_Mes', 'Cliff_Maze', 'DarkWoods', 'Desert_Maze', 'Drag_Hero', 'FourJewel', 'Gaman',
          'Gerudo_Ch_SecretClub', 'KnightDoll', 'MacuseIseki', 'NakedIsland', 'SecretofObject', 'Solitary_Maze',
          'Threebros_giant', 'TreasureHunt03', 'bf2_collabo'] + ['TreasureHunt_touzoku0%d' % i for i in range(1, 9)]:
    QUEST_START[k] = {'anchor': True}
for k in ['TreasureHunt_touzoku0%d' % i for i in range(1, 9)]:
    DLC_PACK[k] = 1

# The site's existing quest markers, by their old names where those aren't
# the game's.
QUEST_ALIASES = {'eventide island': 'Stranded on Eventide', 'koko': "Koko's Kitchen",
                 "link's house": 'Hylian Homeowner', 'royal receipes': 'A Royal Recipe',
                 'the horseback hoodlumns': 'The Horseback Hoodlums',
                 'recital at warbler`s nest': "Recital at Warbler's Nest",
                 '': 'The Korok Trials'}  # marker 469: Chio, The Korok Trials
NOT_QUESTS = {229, 343, 377}  # Hestu (shown as NPCs) and the horse mini-game
RENAMES = {377: 'Hestu (3rd Encounter)'}  # was Hetsu

DRAGONS = [
    # name, path name, slug, colour, rails (UniqueName), loops
    ('Dinraal', "Dinraal's Flight Path", 'dinraals-flight-path', '#d8453a', ['Dragon_Fire_MainRoute'], False),
    ('Naydra', "Naydra's Flight Path", 'naydras-flight-path', '#3a86d4', ['Dragon_Ice_MainRoute'], True),
    ('Naydra (Malice)', "Naydra's Flight Path (Malice)", 'naydras-flight-path-malice', '#3a86d4', ['Runel_Dragon_Rail_2'], True),
    ('Farosh (Lake Floria)', "Farosh's Flight Path (Lake Floria)", 'faroshs-flight-path-lake-floria', '#2f9e4f',
     ['Dragon_Electric_Start_LakeFloria', 'Dragon_Electric_PreMainRoute_LakeFloria', 'Dragon_Electric_MainRoute_LakeFloria'], False),
    ('Farosh (Lake Hylia)', "Farosh's Flight Path (Lake Hylia)", 'faroshs-flight-path-lake-hylia', '#2f9e4f',
     ['Dragon_Electric_Start_LakeHylia', 'Dragon_Electric_PreMainRoute_LakeHylia', 'Dragon_Electric_MainRoute_LakeHylia'], False),
    ('Farosh (Gerudo Highlands)', "Farosh's Flight Path (Gerudo Highlands)", 'faroshs-flight-path-gerudo-highlands', '#2f9e4f',
     ['Dragon_Electric_SubRoute_HighlandGerudo'], True),
]
SHOP_NAMES = {'ShopYorozu': 'General Store', 'ShopYadoya': 'Inn', 'ShopBougu': 'Armor Shop',
              'ShopJewel': 'Jewelry Shop', 'ShopColor': 'Dye Shop'}


def rnd(v, n=4):
    return round(v, n)


def to_site(p):
    return [rnd(p[0] / 64 + 128), rnd(-p[2] / 64 - 128)]


def flat(a, b):
    return math.hypot(a[0] - b[0], a[2] - b[2])


# ---------------------------------------------------------------- prepare

def prepare(radar, questmsg, objmap, existing_path):
    names = json.load(open(os.path.join(radar, 'names.json')))
    objs, rails = [], {}
    for f in sorted(glob.glob(os.path.join(radar, 'map', 'MainField', '*', '*.json'))):
        unit = json.load(open(f))
        objs += unit.get('Objs', [])
        for r in unit.get('Rails', []):
            rails[r['HashId']] = r
    by_hash = {o['HashId']: o for o in objs}
    params = lambda o: o.get('!Parameters') or {}

    # Places on the game's map, by English name.
    static = json.load(open(os.path.join(objmap, 'map_summary', 'MainField', 'static.json')))['markers']
    text = json.load(open(os.path.join(objmap, 'text', 'StaticMsg', 'LocationMarker.json')))
    places = {}
    for kind in ('Location', 'Place', 'Dungeon', 'Tower', 'Labo'):
        for m in static[kind]:
            n = text.get(m.get('MessageID', '').strip())
            if n and n not in places:
                places[n] = [m['Translate']['X'], m['Translate'].get('Y', 0), m['Translate']['Z']]
    places['Shrine of Resurrection'] = [-1102.23, 0, 1880.13]  # its entrance (not a LocationMarker)

    # People and placements, by display name.
    people = defaultdict(list)
    for o in objs:
        a = o['UnitConfigName']
        if a in names and a.lower().startswith(('npc', 'subchall', 'twnobj_village_korok_dekutree')):
            people[names[a]].append(o)

    # Quests: the game's names and opening log entries.
    quests = []
    for f in sorted(glob.glob(os.path.join(questmsg, '*.po'))):
        po = open(f, encoding='utf8').read()
        ents = {k: ''.join(re.findall(r'"((?:[^"\\]|\\.)*)"', v)).replace('\\n', ' ').replace('\\"', '"')
                for k, v in re.findall(r'msgid "([^"]+)"\nmsgstr ((?:"(?:[^"\\]|\\.)*"\n?)+)', po)}
        for k, v in ents.items():
            if k.endswith('_Name'):
                qid = k[3:-5]
                quests.append({'id': qid, 'name': v.strip(), 'desc': re.sub(r'\[[^\]]*\]', '', ents.get(k[:-5] + '_Desc', ''))})

    tag_index = defaultdict(list)  # quest id -> objects whose data mentions it
    qids = [q['id'] for q in quests]
    # As the radar's search finds them: the id as whole words (_ separates).
    pattern = re.compile('(?<![A-Za-z0-9])(' + '|'.join(re.escape(q) for q in sorted(qids, key=len, reverse=True)) + ')(?![A-Za-z0-9])')
    for o in objs:
        s = json.dumps(o)
        for m in set(pattern.findall(s)):
            tag_index[m].append(o)

    def anchor(qid):
        tagged = tag_index.get(qid, [])
        ev = [o['Translate'] for o in tagged if o['UnitConfigName'] == 'EventTag'] or [o['Translate'] for o in tagged]
        return [statistics.median(p[i] for p in ev) for i in range(3)] if ev else None

    skip = {'Link', 'Zelda', 'Hyrule', 'Korok', 'Traveler', 'Great Fairy'}
    for q in quests:
        rule = QUEST_START.get(q['id'], {})
        an = anchor(q['id'])
        giver, pos = None, None
        if 'location' in rule:
            pos, how = places[rule['location']], 'place'
            q['place'] = rule['location']
        elif 'pos' in rule:
            pos, giver, how = rule['pos'], rule['giver'], 'object'
        elif rule.get('anchor'):
            pos, how = an, 'trigger'
        else:
            if 'actor' in rule:
                cands = [o for o in objs if o['UnitConfigName'] == rule['actor']]
                giver = names.get(rule['actor'])
            else:
                named = [n for n in people if n not in skip and len(n) > 2 and re.search(r'\b' + re.escape(n) + r'\b', q['desc'])]
                named.sort(key=lambda n: q['desc'].find(n))
                giver = rule.get('npc') or (named[0] if named else None)
                cands = people.get(giver, [])
            near = rule.get('near')
            in_desc = next((places[p] for p in sorted(places, key=len, reverse=True) if p in q['desc']), None)
            ref = an if near == 'anchor' else places[near] if near else (in_desc or an)
            pick = min(cands, key=lambda o: flat(o['Translate'], ref)) if ref and len(cands) > 1 else cands[0]
            pos, how = pick['Translate'], 'npc'
        if pos is None:
            raise SystemExit('No start for quest %s' % q['id'])
        q.update(giver=giver, how=how, pos=[rnd(v, 2) for v in pos])
        q['kind'] = 'main' if q['id'] in MAIN else 'shrine' if q['id'] in SHRINE else \
            'dlc' if q['name'].startswith('EX ') else 'side'
        if q['kind'] == 'dlc':
            q['dlc'] = DLC_PACK[q['id']]
        del q['desc']
    kinds = Counter(q['kind'] for q in quests)
    assert kinds == Counter(main=15, shrine=42, side=77, dlc=18), kinds

    # Dragons: their routes are rails, in segments joined end to end.
    dragons = []
    for name, path_name, slug, colour, rail_names, loops in DRAGONS:
        segs = {h: r for h, r in rails.items() if r.get('UniqueName') in rail_names}
        nxt = {}
        for h, r in segs.items():
            for j in r['RailPoints'][-1].get('Junctions', []):
                if j['HashId'] in segs and j['Index'] == 0:
                    nxt[h] = j['HashId']
        starts = [h for h in segs if not any(
            j['HashId'] in segs for j in segs[h]['RailPoints'][0].get('Junctions', []))]
        h = starts[0] if starts else sorted(segs)[0]
        pts, seen = [], set()
        while h is not None and h not in seen:
            seen.add(h)
            for p in segs[h]['RailPoints']:
                t = p['Translate']
                if not pts or flat(pts[-1], t) > 1:
                    pts.append(t)
            if segs[h]['IsClosed'] and segs[h]['RailPoints'][0]['Translate'] != pts[-1]:
                pts.append(segs[h]['RailPoints'][0]['Translate'])
            h = nxt.get(h)
        assert seen == set(segs), (name, len(seen), len(segs))
        if loops and flat(pts[0], pts[-1]) < 1:
            pts.pop()
        dragons.append({'name': name, 'path': path_name, 'slug': slug, 'color': colour, 'loops': loops,
                        'rails': rail_names, 'points': [[rnd(v, 2) for v in p] for p in pts]})

    # Shops, as the game's map shows them.
    settlements = [(text.get(m['MessageID'].strip()), m['Translate']) for m in static['Place'] if text.get(m['MessageID'].strip())]
    def settlement(s):
        own = text.get(s['SaveFlag'].replace('Location_', ''))
        t = s['Translate']
        return own or min(settlements, key=lambda p: math.hypot(p[1]['X'] - t['X'], p[1]['Z'] - t['Z']))[0]
    shops = [{'name': SHOP_NAMES[s['Icon']], 'icon': s['Icon'], 'place': settlement(s),
              'pos': [rnd(s['Translate']['X'], 2), rnd(s['Translate'].get('Y', 0), 2), rnd(s['Translate']['Z'], 2)]}
             for s in static['Shop']]
    assert len(shops) == 37

    # Treasure chests outside normal play: DLC, Master Mode, the Xenoblade
    # Chronicles 2 tie-in.
    def chest(o):
        drop = params(o).get('DropActor') or ''
        return {'hash': o['HashId'], 'actor': o['UnitConfigName'], 'item': names.get(drop, drop), 'drop': drop,
                'pos': [rnd(v, 2) for v in o['Translate']]}
    tbox = [o for o in objs if o['UnitConfigName'].startswith('TBox_Field')]
    master_chests = [chest(o) for o in tbox if params(o).get('IsHardModeActor')]
    dlc_chests = [chest(o) for o in tbox if 'Aoc' in o['UnitConfigName'] and not params(o).get('IsHardModeActor')]
    collab_chests = [chest(o) for o in tbox if 'Collabo' in o['UnitConfigName']]
    assert (len(master_chests), len(dlc_chests), len(collab_chests)) == (118, 24, 3)

    # Master Mode's floating platforms: boards synced together, held up by
    # Sky Octoroks; and its extra named enemies.
    hard = [o for o in objs if params(o).get('IsHardModeActor')]
    groups = defaultdict(list)
    for b in hard:
        if b['UnitConfigName'].startswith('Obj_BoardWood'):
            sync = [l['DestUnitHashId'] for l in b.get('LinksToObj', []) if l['DefinitionName'] == 'SyncLink']
            groups[sync[0] if sync else b['HashId']].append(b['Translate'])
    platforms = []
    for key, boards in sorted(groups.items()):
        c = [statistics.mean(p[i] for p in boards) for i in range(3)]
        on = [m['item'] for m in master_chests if flat(m['pos'], c) < 20 and abs(m['pos'][1] - c[1]) < 15]
        platforms.append({'hash': key, 'pos': [rnd(v, 2) for v in c], 'chests': on})
    assert len(platforms) == 107
    master_enemies = [{'hash': o['HashId'], 'actor': o['UnitConfigName'], 'name': names[o['UnitConfigName']],
                       'pos': [rnd(v, 2) for v in o['Translate']]}
                      for o in hard if o['UnitConfigName'].startswith(('Enemy_Lynel', 'Enemy_Wizzrobe'))]

    # The site's markers these change: its quests, and the chests above
    # that it already has (by contents, within 64 m).
    existing = [json.loads(l) for l in open(existing_path)]
    norm = lambda s: re.sub(r'[^a-z0-9]', '', s.lower())
    by_name = {norm(q['name']): q for q in quests}
    edits = []
    for m in existing:
        if m['category_id'] == SIDE_QUESTS and m['id'] not in NOT_QUESTS:
            title = html.unescape(m['name'])
            q = by_name.get(norm(QUEST_ALIASES.get(title.lower(), title)))
            if not q:
                raise SystemExit('Unmatched quest marker %d %r' % (m['id'], title))
            q['existing'] = m['id']
            edits.append({'marker': m, 'name': q['name'], 'category': quest_category(q), 'site': to_site(q['pos'])})
        elif m['id'] in RENAMES:
            edits.append({'marker': m, 'name': RENAMES[m['id']], 'category': m['category_id'], 'site': [m['x'], m['y']]})
    site_chests = [m for m in existing if m['category_id'] in (EQUIP_CHESTS, NON_EQUIP_CHESTS)]
    used = set()
    for c in dlc_chests + collab_chests:
        sx, sy = to_site(c['pos'])
        # Each of these items is in one chest only, so a marker by its name
        # nearby (placed by hand, up to a few hundred metres off) is it.
        same = lambda a, b: a and b and (a in b or b in a)
        cands = [m for m in site_chests if m['id'] not in used and math.hypot(m['x'] - sx, m['y'] - sy) * 64 < 400
                 and same(norm(c['item']), norm(html.unescape(m['name'])))]
        if cands:
            m = min(cands, key=lambda m: math.hypot(m['x'] - sx, m['y'] - sy))
            used.add(m['id'])
            c['existing'] = m['id']
            edits.append({'marker': m, 'name': html.unescape(m['name']),
                          'category': CAT['Treasure Chest (DLC)'] if c in dlc_chests else m['category_id'], 'site': [sx, sy]})

    data = {
        'description': "Breath of the Wild data from the game's files, made by missing-data.py prepare. Game "
                       "positions are [X, Y, Z]; quests start at their giver (or the quest's trigger, or a named place); "
                       "edits are the site's markers as they stood, with what they become.",
        'sources': ['https://github.com/zeldamods/radar (content/)', 'https://objmap.zeldamods.org/game_files',
                    'https://github.com/kenshiisod/botw-gettext (botw-wiiu/USen/QuestMsg)'],
        'dragons': dragons, 'shops': shops, 'quests': quests, 'dlcChests': dlc_chests, 'collabChests': collab_chests,
        'masterChests': master_chests, 'platforms': platforms, 'masterEnemies': master_enemies, 'edits': edits,
    }
    json.dump(data, open(SOURCE, 'w'), indent=1, ensure_ascii=False)
    print('quests', dict(kinds), 'edits', len(edits), 'existing quests', sum(1 for q in quests if 'existing' in q),
          'dlc chests on site', sum(1 for c in dlc_chests if 'existing' in c), 'platforms', len(platforms),
          'master enemies', len(master_enemies))


def quest_category(q):
    return {'main': CAT['Main Quests'], 'shrine': CAT['Shrine Quests'], 'dlc': CAT['Quests (DLC)'],
            'side': SIDE_QUESTS}[q['kind']]


# ---------------------------------------------------------------- sql

def enc(s):
    """As add_marker.php stores text."""
    return html.escape(s, quote=True).replace('&#x27;', '&#039;')


def q(s):
    if s is None:
        return 'NULL'
    s = str(s)
    if '\n' in s or '\r' in s:
        raise ValueError('Line break in %r' % s)
    return "'" + s.replace('\\', '\\\\').replace("'", "''") + "'"


def num(v):
    return 'NULL' if v is None else ('%.6f' % float(v)).rstrip('0').rstrip('.')


def tab_html(paragraphs):
    return ''.join('<p>%s</p>' % html.escape(p, quote=False) for p in paragraphs)


def snapshot(m, name=None, category=None, xy=None):
    """A marker as lib/common/wiki.php wikiMarkerSnapshot records it."""
    return {'title': name if name is not None else html.unescape(m['name']),
            'description': html.unescape(m['description'] or ''),
            'categoryId': category if category is not None else m['category_id'], 'submapId': m['submap_id'],
            'x': float(xy[0]) if xy else float(m['x']), 'y': float(xy[1]) if xy else float(m['y']),
            'z': m['z'], 'global': int(m['global']), 'visible': int(m['visible']),
            'tabs': [html.unescape(t) for t in (m['tabs'] or [])]}


def sql():
    d = json.load(open(SOURCE))
    up, down = [], []
    user = 'COALESCE((SELECT id FROM user WHERE id = %d), 1)' % USER
    up.append("-- Breath of the Wild data the map was missing, from the game's own files")
    up.append('-- (dev/assets/botw/missing-data.py; docs/BotW-Missing-Data.md): its dragons')
    up.append("-- and their flight paths, its 37 shops, all 152 quests by the game's names")
    up.append('-- (main, side, shrine and DLC) where they start, its DLC treasure chests, and')
    up.append("-- Master Mode's chests, floating platforms and extra enemies, in categories of")
    up.append('-- their own (DLC ones styled like Shrine of Trials (DLC); Master Mode a menu')
    up.append("-- section of its own). The site's quest and DLC chest markers")
    up.append("-- keep their ids, completions and text: they take the game's name, category")
    up.append('-- and position, each kept in their history, and only while unchanged since.')
    up.append('-- New markers are 196xxxxx, credited to account 15. Harmless to run again.')
    up.append('')

    for c in CATEGORIES:
        up.append(
            "INSERT INTO marker_category (id, parent_id, marker_category_type_id, container_id, name, default_checked, img, color, "
            "visible_zoom, visible, custom_style, shape, glyph_color, menu_section, menu_order) SELECT %d, %d, 1, %d, %s, %d, %s, %s, "
            "%d, 1, %d, %s, %s, %s, %d FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM marker_category WHERE id = %d);" % (
                c['id'], c['parent'], GAME, q(c['name']), c.get('checked', 1), q(c['img']), q(c['color']), c['zoom'],
                c.get('custom_style', 0), q(c.get('shape')), q(c.get('glyph')), q(c['section']), c['order'], c['id']))
    up.append('')

    ids = iter(range(FIRST_ID, FIRST_ID + 100000))
    new_ids = []

    def marker(category, name, pos, tabs=(), source=None):
        mid = next(ids)
        new_ids.append(mid)
        x, y = to_site(pos)
        # No game_data: a marker that has it shows no text (zmap.js). Its
        # source (game hash, quest id) is in missing-data.json.
        gd = None
        up.append('-- %s' % name)
        up.append(
            'INSERT INTO marker (id, submap_id, overlay_id, marker_status_id, marker_category_id, user_id, name, description, '
            "x, y, z, jump_marker_id, global, path, game_data, visible, last_updated) SELECT %d, %d, NULL, 2, %d, %s, %s, '', "
            "%s, %s, NULL, 0, 0, '', %s, 1, NOW() FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM marker WHERE id = %d);" % (
                mid, SUBMAP, category, user, q(enc(name)), num(x), num(y), q(gd), mid))
        if tabs:
            up.append(
                'INSERT INTO marker_tab (marker_id, marker_tab_status_id, user_id, tab_title, tab_text, tab_order, visible) '
                'SELECT %d, 2, %s, %s, %s, 1, 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM marker_tab WHERE marker_id = %d);' % (
                    mid, user, q(enc(name)), q(enc(tab_html(tabs))), mid))
        return mid

    # Dragons, each the first step of its flight path.
    dragon_ids = {}
    for dr in d['dragons']:
        dragon_ids[dr['slug']] = marker(CAT['Dragon'], dr['name'], dr['points'][0],
                                        source={'source': 'BotW rails', 'rails': dr['rails']})
    up.append('')
    for s in d['shops']:
        marker(CAT['Shops'], s['name'], s['pos'], [s['place']] if s['place'] else [], {'source': 'BotW LocationMarker', 'icon': s['icon']})
    up.append('')
    for qu in d['quests']:
        if 'existing' in qu:
            continue
        tabs = []
        if qu['giver']:
            tabs.append('NPC: %s' % qu['giver'])
        elif qu['how'] == 'place':
            tabs.append('Starts at %s.' % qu['place'])
        else:
            tabs.append('Starts when you reach this spot.')
        if qu.get('dlc'):
            tabs.append('Requires %s.' % DLC_NAMES[qu['dlc']])
        if qu['id'] == 'bf2_collabo':
            tabs.append('Only appears with Xenoblade Chronicles 2 save data on the same Nintendo Switch.')
        marker(quest_category(qu), qu['name'], qu['pos'], tabs, {'source': 'BotW QuestMsg', 'quest': qu['id']})
    up.append('')
    for c in d['dlcChests']:
        if 'existing' not in c:
            marker(CAT['Treasure Chest (DLC)'], c['item'], c['pos'], ['Requires %s.' % DLC_NAMES[1]],
                   {'source': 'BotW map', 'hashId': c['hash']})
    for c in d['collabChests']:
        if 'existing' not in c:
            marker(EQUIP_CHESTS, c['item'], c['pos'], ['From the [Xenoblade Chronicles 2] quest.'],
                   {'source': 'BotW map', 'hashId': c['hash']})
    up.append('')
    for c in d['masterChests']:
        marker(CAT['Treasure Chest (Master Mode)'], c['item'], c['pos'], [], {'source': 'BotW map', 'hashId': c['hash']})
    up.append('')
    for p in d['platforms']:
        tabs = ['Held up by Sky Octoroks: pop them to bring it down.']
        if p['chests']:
            tabs.append('Chest: %s' % ', '.join(p['chests']))
        marker(CAT['Floating Platform (Master Mode)'], 'Floating Platform', p['pos'], tabs, {'source': 'BotW map', 'hashId': p['hash']})
    up.append('')
    for e in d['masterEnemies']:
        marker(CAT['Enemies (Master Mode)'], e['name'], e['pos'], [], {'source': 'BotW map', 'hashId': e['hash']})
    up.append('')

    # Dragon flight paths, as TotK's (migrations/20261115190000_totk_lines_to_paths.sql).
    for dr in d['dragons']:
        mid = dragon_ids[dr['slug']]
        steps = [{'markerId': mid}]
        rows = ['SELECT @p AS `path_id`, 1 AS `step_order`, %d AS `marker_id`, NULL AS `submap_id`, NULL AS `x`, NULL AS `y`, '
                'NULL AS `name`, NULL AS `note`, 1 AS `shown`, NULL AS `pin_key`, NULL AS `content`' % mid]
        for i, p in enumerate(dr['points'][1:], start=2):
            x, y = to_site(p)
            key = hashlib.sha1(('botw-%s-%d' % (dr['slug'], i)).encode()).hexdigest()[:10]
            steps.append({'submapId': SUBMAP, 'x': x, 'y': y, 'name': '', 'shown': False, 'pinKey': key})
            rows.append('SELECT @p AS `path_id`, %d AS `step_order`, NULL AS `marker_id`, %d AS `submap_id`, %s AS `x`, %s AS `y`, '
                        "NULL AS `name`, NULL AS `note`, 0 AS `shown`, '%s' AS `pin_key`, NULL AS `content`" % (i, SUBMAP, num(x), num(y), key))
        snap = {'name': dr['path'], 'description': '', 'kind': 'single', 'loops': dr['loops'], 'numbered': False, 'smooth': True,
                'alwaysShow': True, 'categoryId': CAT['Dragon'], 'color': dr['color'], 'scope': 'official',
                'visibility': 'public', 'editAccess': 'editors', 'publishedAt': None, 'published': True, 'steps': steps}
        s = q(dr['slug'])
        up.append('-- %s (%s)' % (dr['path'], dr['slug']))
        up.append(
            'INSERT INTO `path` (container_id, user_id, scope, visibility, edit_access, published_at, name, slug, description, kind, '
            'loops, numbered, smooth, always_show, category_id, color, visible, created, updated) SELECT %d, %d, \'official\', '
            "'public', 'editors', NOW(), %s, %s, '', 'single', %d, 0, 1, 1, %d, '%s', 1, NOW(), NOW() FROM DUAL WHERE NOT EXISTS "
            '(SELECT 1 FROM `path` WHERE container_id = %d AND slug = %s) AND EXISTS (SELECT 1 FROM `marker` WHERE id = %d);' % (
                GAME, USER, q(dr['path']), s, int(dr['loops']), CAT['Dragon'], dr['color'], GAME, s, mid))
        up.append('SET @p = (SELECT id FROM `path` WHERE container_id = %d AND slug = %s);' % (GAME, s))
        up.append('INSERT INTO `path_step` (path_id, step_order, marker_id, submap_id, x, y, name, note, shown, pin_key, content) '
                  'SELECT t.* FROM (%s) t WHERE @p IS NOT NULL AND NOT EXISTS (SELECT 1 FROM `path_step` WHERE path_id = @p);' % ' UNION ALL '.join(rows))
        up.append('INSERT INTO `path_revision` (path_id, user_id, action, summary, snapshot, created) SELECT @p, %d, \'create\', '
                  "'Created the path', JSON_SET(%s, '$.publishedAt', DATE_FORMAT(p.published_at, '%%Y-%%m-%%d %%H:%%i:%%s')), NOW() "
                  'FROM `path` p WHERE p.id = @p AND NOT EXISTS (SELECT 1 FROM `path_revision` WHERE path_id = @p);' % (
                      USER, q(json.dumps(snap, separators=(',', ':')))))
        up.append('')

    # The site's markers, matched to the game's: each change in its
    # history (after a first version of it as it was), only while it's
    # still as it was.
    up.append("-- The site's quest and DLC chest markers, as the game has them.")
    for e in d['edits']:
        m = e['marker']
        old = snapshot(m)
        new = snapshot(m, e['name'], e['category'], e['site'])
        changes = []
        if new['title'] != old['title']:
            changes.append("named %s as in the game" % new['title'])
        if new['categoryId'] != old['categoryId']:
            changes.append('moved to %s' % next(c['name'] for c in CATEGORIES if c['id'] == new['categoryId']))
        moved = math.hypot(new['x'] - old['x'], new['y'] - old['y']) * 64
        if moved >= 1:
            changes.append("placed where the game has it (%d m away)" % round(moved))
        if not changes:
            continue
        summary = '; '.join([changes[0][0].upper() + changes[0][1:]] + changes[1:])
        e['summary'] = summary
        guard = 'id = %d AND name = %s AND last_updated = %s' % (m['id'], q(m['name']), q(m['last_updated']))
        up.append('-- %s' % old['title'] if old['title'] else '-- (unnamed %d)' % m['id'])
        if not int(m['has_revision']):
            up.append('INSERT INTO marker_revision (marker_id, user_id, action, summary, reverts_revision_id, data, created) '
                      "SELECT %d, %d, 'import', NULL, NULL, %s, %s FROM DUAL WHERE EXISTS (SELECT 1 FROM marker WHERE %s) "
                      'AND NOT EXISTS (SELECT 1 FROM marker_revision WHERE marker_id = %d);' % (
                          m['id'], m['user_id'], q(json.dumps(old, separators=(',', ':'))), q(m['last_updated']), guard, m['id']))
        up.append('INSERT INTO marker_revision (marker_id, user_id, action, summary, reverts_revision_id, data, created) '
                  "SELECT %d, %d, 'edit', %s, NULL, %s, NOW() FROM DUAL WHERE EXISTS (SELECT 1 FROM marker WHERE %s);" % (
                      m['id'], USER, q(summary), q(json.dumps(new, separators=(',', ':'))), guard))
        up.append('UPDATE marker SET name = %s, marker_category_id = %d, x = %s, y = %s, last_updated = NOW() WHERE %s;' % (
            q(enc(new['title'])), new['categoryId'], num(new['x']), num(new['y']), guard))
        down.append('DELETE FROM marker_revision WHERE marker_id = %d AND user_id = %d AND action = \'edit\' AND summary = %s;' % (
            m['id'], USER, q(summary)))
        down.append('UPDATE marker SET name = %s, marker_category_id = %d, x = %s, y = %s, last_updated = %s WHERE id = %d AND name = %s AND marker_category_id = %d;' % (
            q(m['name']), m['category_id'], num(m['x']), num(m['y']), q(m['last_updated']), m['id'], q(enc(new['title'])), new['categoryId']))

    slugs = ', '.join(q(dr['slug']) for dr in d['dragons'])
    first, last = FIRST_ID, new_ids[-1]
    head = ["-- Undoes the missing BotW data: its markers, paths and categories gone, and",
            "-- the site's markers it matched to the game put back as they were.", '']
    down = head + down + [
        '',
        'DELETE r FROM `path_revision` r JOIN `path` p ON p.id = r.path_id WHERE p.container_id = %d AND p.user_id = %d AND p.slug IN (%s);' % (GAME, USER, slugs),
        'DELETE s FROM `path_step` s JOIN `path` p ON p.id = s.path_id WHERE p.container_id = %d AND p.user_id = %d AND p.slug IN (%s);' % (GAME, USER, slugs),
        'DELETE FROM `path` WHERE container_id = %d AND user_id = %d AND slug IN (%s);' % (GAME, USER, slugs),
        'DELETE FROM marker_tab WHERE marker_id BETWEEN %d AND %d;' % (first, last),
        'DELETE FROM marker_revision WHERE marker_id BETWEEN %d AND %d;' % (first, last),
        'DELETE FROM marker WHERE id BETWEEN %d AND %d;' % (first, last),
        'DELETE c FROM marker_category c WHERE c.id IN (%s) AND NOT EXISTS (SELECT 1 FROM marker m WHERE m.marker_category_id = c.id);' % (
            ', '.join(str(c['id']) for c in CATEGORIES)),
        '',
    ]
    for name, text in ((MIGRATION + '.sql', '\n'.join(up) + '\n'), (MIGRATION + '.down.sql', '\n'.join(down))):
        open(os.path.join(ROOT, 'migrations', name), 'w').write(text)
        print('%s: %d KB' % (name, len(text) // 1024))
    print('new markers', len(new_ids), '(%d-%d)' % (first, last), 'edits', sum(1 for e in d['edits'] if 'summary' in e))


if __name__ == '__main__':
    if sys.argv[1:2] == ['prepare'] and len(sys.argv) == 6:
        prepare(*sys.argv[2:])
    elif sys.argv[1:] == ['sql']:
        sql()
    else:
        print(__doc__)
        sys.exit(1)
