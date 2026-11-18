"""Minimal readers for Nintendo SARC archives and Yaz0 compression (BotW, Wii U: big-endian)."""
import struct

def yaz0(data):
    if data[:4] != b'Yaz0': return data
    size = struct.unpack('>I', data[4:8])[0]
    out = bytearray(); i = 16
    while len(out) < size:
        code = data[i]; i += 1
        for bit in range(7, -1, -1):
            if len(out) >= size: break
            if code >> bit & 1:
                out.append(data[i]); i += 1
            else:
                b1, b2 = data[i], data[i + 1]; i += 2
                dist = ((b1 & 0xF) << 8 | b2) + 1
                n = b1 >> 4
                if n == 0: n = data[i] + 0x12; i += 1
                else: n += 2
                for _ in range(n): out.append(out[-dist])
    return bytes(out)

def sarc(data):
    """{name: bytes} of a SARC archive."""
    data = yaz0(data)
    assert data[:4] == b'SARC', data[:4]
    bom = data[6:8]; e = '>' if bom == b'\xfe\xff' else '<'
    data_off = struct.unpack(e + 'I', data[12:16])[0]
    sfat = 20; n = struct.unpack(e + 'H', data[sfat + 6:sfat + 8])[0]
    nodes = []
    for k in range(n):
        o = sfat + 12 + k * 16
        h, attr, start, end = struct.unpack(e + 'IIII', data[o:o + 16])
        nodes.append((attr, start, end))
    sfnt = sfat + 12 + n * 16
    names_base = sfnt + 8
    out = {}
    for attr, start, end in nodes:
        name = None
        if attr & 0x01000000:
            off = names_base + (attr & 0xFFFF) * 4
            name = data[off:data.index(b'\0', off)].decode()
        out[name or f'{start:08x}'] = data[data_off + start:data_off + end]
    return out
