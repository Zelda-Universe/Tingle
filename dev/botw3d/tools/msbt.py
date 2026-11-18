"""Minimal MSBT reader (BotW messages): {label: text}."""
import struct

def parse(d):
    assert d[:8] == b'MsgStdBn', d[:8]
    e = '>' if d[8:10] == b'\xfe\xff' else '<'
    nsec = struct.unpack_from(e + 'H', d, 0x0E)[0]
    o = 0x20; labels = {}; texts = []
    for _ in range(nsec):
        magic = d[o:o + 4]; size = struct.unpack_from(e + 'I', d, o + 4)[0]; body = o + 16
        if magic == b'LBL1':
            n = struct.unpack_from(e + 'I', d, body)[0]
            for k in range(n):
                cnt, off = struct.unpack_from(e + 'II', d, body + 4 + 8 * k)
                p = body + off
                for _ in range(cnt):
                    ln = d[p]; name = d[p + 1:p + 1 + ln].decode(); idx = struct.unpack_from(e + 'I', d, p + 1 + ln)[0]
                    labels[name] = idx; p += 1 + ln + 4
        elif magic == b'TXT2':
            n = struct.unpack_from(e + 'I', d, body)[0]
            offs = [struct.unpack_from(e + 'I', d, body + 4 + 4 * k)[0] for k in range(n)] + [size]
            enc = 'utf-16-be' if e == '>' else 'utf-16-le'
            for k in range(n):
                raw = d[body + offs[k]:body + offs[k + 1]]
                # drop control codes (0x000E ...) and the terminator
                out, i = [], 0
                while i + 1 < len(raw):
                    ch = struct.unpack_from(e + 'H', raw, i)[0]
                    if ch == 0x0E:
                        plen = struct.unpack_from(e + 'H', raw, i + 6)[0]; i += 8 + plen; continue
                    if ch == 0: break
                    out.append(chr(ch)); i += 2
                texts.append(''.join(out))
        o = body + ((size + 15) & ~15)
    return {k: texts[i] for k, i in labels.items() if i < len(texts)}
