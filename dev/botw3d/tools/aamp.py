"""Minimal AAMP (BotW parameter archive, v2, little-endian) reader. Names are
CRC32 hashes: those in NAMES (or passed) are shown by name, others as hex."""
import struct, zlib

TYPES = {0: 'bool', 1: 'f32', 2: 'int', 3: 'vec2', 4: 'vec3', 5: 'vec4', 6: 'color', 7: 'str32', 8: 'str64',
         9: 'curve1', 10: 'curve2', 11: 'curve3', 12: 'curve4', 13: 'buf_int', 14: 'buf_f32', 15: 'str256',
         16: 'quat', 17: 'u32', 18: 'buf_u32', 19: 'buf_bin', 20: 'strref'}

def parse(d, names=()):
    lookup = {zlib.crc32(n.encode()): n for n in names}
    name = lambda h: lookup.get(h, '%08x' % h)
    u32 = lambda o: struct.unpack_from('<I', d, o)[0]
    pio_off = u32(0x14)
    root = 0x30 + pio_off
    def value(o, t):
        if t == 0: return bool(u32(o))
        if t == 1: return struct.unpack_from('<f', d, o)[0]
        if t in (2,): return struct.unpack_from('<i', d, o)[0]
        if t == 17: return u32(o)
        if t in (3, 4, 5, 6, 16): return struct.unpack_from('<%df' % {3: 2, 4: 3, 5: 4, 6: 4, 16: 4}[t], d, o)
        if t in (7, 8, 15, 20): return d[o:d.index(b'\0', o)].decode('utf-8', 'replace')
        return '<%s>' % TYPES.get(t, t)
    def obj(o):
        h, poff, n = struct.unpack_from('<IHH', d, o)
        out = {}
        for i in range(n):
            p = o + poff * 4 + i * 8
            ph, word = struct.unpack_from('<II', d, p)
            out[name(ph)] = value(p + (word & 0xFFFFFF) * 4, word >> 24)
        return name(h), out
    def plist(o):
        h, loff, nl, ooff, no = struct.unpack_from('<IHHHH', d, o)
        lists = dict(plist(o + loff * 4 + i * 12) for i in range(nl))
        objs = dict(obj(o + ooff * 4 + i * 8) for i in range(no))
        return name(h), {'lists': lists, 'objects': objs} if lists else objs
    return plist(root)[1]
