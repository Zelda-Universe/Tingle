#!/usr/bin/env python3
"""The game's environment palettes, for street view's sky by the hour (gpu/sky-palettes.json,
StreetViewGame.js paintSky).

WorldMgr/normal.bwinfo (TitleBG.pack, the update's) holds 207 palettes, EnvPalette_0 .. _206
(AAMP: keys are the names' CRC32s), and 59 palette sets of 8 time slots (shader-notes.md, "The
sky"). The sky table shader's constants by the hour come from them: C7.x = a palette's
0xa0088c85 (the Mie scattering's direction), C9.x = 0x9c276059 (its strength), C10 = 0xc96e75b3's
colour x its strength (the sun). Written: every set's 8 slots, each slot [C7.x, C9.x, r, g, b,
strength], sets by their order in the file (set 0: palettes 0 .. 7, the Great Plateau's clear sky).

python3 build_sky_palettes.py <update content> <streetview folder>
"""
import json, os, sys, zlib
sys.path.insert(0, os.path.dirname(__file__))
import nin, aamp

U, OUT = sys.argv[1:3]
NAMES = json.load(open(os.path.join(os.path.dirname(__file__), 'env-names.json')))
raw = nin.sarc(open(os.path.join(U, 'Pack', 'TitleBG.pack'), 'rb').read())['WorldMgr/normal.bwinfo']
p = aamp.parse(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw, NAMES)
h = lambda s: '%08x' % zlib.crc32(s.encode())
palettes = []
for i in range(207):
    P = p[h(('EnvPalette_%d' if i < 100 else 'EnvPalette_%03d') % i)]
    sun = P['c96e75b3']
    palettes.append([P['a0088c85'], P['9c276059'], sun[0], sun[1], sun[2], sun[3]])
SLOTS = ['a8c68604', 'dfc1b692', '46c8e728', '31cfd7be', 'afab421d', 'd8ac728b', '41a52331', '36a213a7']
sets = [[v[s] for s in SLOTS] for v in p.values() if isinstance(v, dict) and SLOTS[0] in v]
json.dump(dict(source='WorldMgr/normal.bwinfo', fields=['C7.x', 'C9.x', 'r', 'g', 'b', 'strength'],
               palettes=[[round(x, 6) for x in r] for r in palettes], sets=sets), open(os.path.join(OUT, 'gpu', 'sky-palettes.json'), 'w'))
print(len(palettes), 'palettes,', len(sets), 'sets; set 0:', sets[0])
