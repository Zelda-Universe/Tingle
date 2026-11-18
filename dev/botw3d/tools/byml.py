"""Minimal BYML v2 reader (BotW map units), big-endian."""
import struct

def parse(d):
    assert d[:2] == b'BY', d[:2]
    u32 = lambda o: struct.unpack_from('>I', d, o)[0]
    u24 = lambda o: int.from_bytes(d[o:o + 3], 'big')
    def strtab(off):
        if not off: return []
        n = u24(off + 1)
        offs = [u32(off + 4 + 4 * i) for i in range(n + 1)]
        return [d[off + offs[i]:d.index(b'\0', off + offs[i])].decode('utf-8', 'replace') for i in range(n)]
    keys, strs = strtab(u32(4)), strtab(u32(8))
    def value(t, v):
        if t == 0xA0: return strs[v]
        if t in (0xC0, 0xC1): return node(v)
        if t == 0xD0: return bool(v)
        if t == 0xD1: return struct.unpack('>i', struct.pack('>I', v))[0]
        if t == 0xD2: return struct.unpack('>f', struct.pack('>I', v))[0]
        if t == 0xD3: return v
        if t in (0xD4, 0xD5, 0xD6): return None
        return None
    def node(o):
        t = d[o]; n = u24(o + 1)
        if t == 0xC0:
            types = d[o + 4:o + 4 + n]; base = o + 4 + ((n + 3) & ~3)
            return [value(types[i], u32(base + 4 * i)) for i in range(n)]
        if t == 0xC1:
            return {keys[u24(o + 4 + 8 * i)]: value(d[o + 7 + 8 * i], u32(o + 8 + 8 * i)) for i in range(n)}
        return None
    return node(u32(12))
