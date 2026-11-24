#!/usr/bin/env python3
"""Puts Link at a chosen spot in one of BotW's save slots (Cemu, Wii U), so the
game's own Load menu takes him straight there: what save states would do (Cemu
has none). For taking reference frames (extract_reference.py) where the
references were.

A Wii U save (user/80000001/<slot>/game_data.sav) is a list of big-endian
(flag hash, value) pairs, the hash a CRC32 of the flag's name; a vector flag
is several pairs with the same hash. Link's position is PlayerSavePos (x, y, z
floats, metres, the game's coordinates).

Back the save folder up first (it's the player's own progress), and only edit
a slot while the game isn't running (Cemu reads the slot when loading it).

python3 botw_save_spot.py <slot 0-5> <x> <y> <z>
python3 botw_save_spot.py <slot 0-5> --ref <reference name>   (a few metres ahead of its camera)
python3 botw_save_spot.py --show                              (every slot's position)
"""
import glob, json, math, os, struct, sys, zlib

SAVE = os.path.expanduser('~/Library/Application Support/Cemu/mlc01/usr/save/00050000/101c9400/user/80000001')
POS = zlib.crc32(b'PlayerSavePos')
REF = os.path.join(os.path.dirname(__file__), '..', 'reference')


def offsets(d):
    return [o for o in range(0x0c, len(d) - 7, 8) if struct.unpack_from('>I', d, o)[0] == POS][:3]


def show():
    for slot in sorted(glob.glob(os.path.join(SAVE, '[0-9]'))):
        d = open(os.path.join(slot, 'game_data.sav'), 'rb').read()
        print(os.path.basename(slot), [round(struct.unpack_from('>f', d, o + 4)[0], 2) for o in offsets(d)])


def put(slot, x, y, z):
    p = os.path.join(SAVE, str(slot), 'game_data.sav')
    d = bytearray(open(p, 'rb').read())
    offs = offsets(d)
    if len(offs) != 3: sys.exit('PlayerSavePos not found in slot %s' % slot)
    for o, v in zip(offs, (x, y, z)): struct.pack_into('>f', d, o + 4, v)
    open(p, 'wb').write(d)
    print('slot', slot, '-> Link at', round(x, 2), round(y, 2), round(z, 2))


if __name__ == '__main__':
    a = sys.argv[1:]
    if not a or a[0] == '--show': show()
    elif len(a) == 3 and a[1] == '--ref':
        r = json.load(open(os.path.join(REF, a[2] + '.json')))
        f = r['fwd']; n = math.hypot(f[0], f[2]) or 1
        # Link stands a few metres ahead of the camera; a little above the camera's height, he
        # drops to the ground
        put(int(a[0]), r['pos'][0] + f[0] / n * 4, r['pos'][1] + 1, r['pos'][2] + f[2] / n * 4)
    elif len(a) == 4: put(int(a[0]), *map(float, a[1:]))
    else: sys.exit(__doc__)
