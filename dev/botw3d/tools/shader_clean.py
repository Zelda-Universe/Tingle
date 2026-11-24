#!/usr/bin/env python3
"""Make one of Cemu's dumped GLSL shaders readable: drops the int/float bit casts
(every register holds floats in practice), writes hex float constants as numbers,
mul_nonIEEE(a, b) as a*b, uf_remappedPS[n] as C[n], and leaves out Cemu's
boilerplate before main().

python3 shader_clean.py <shader.txt> [> out.glsl]
"""
import re, struct, sys

CASTS = ('floatBitsToInt', 'intBitsToFloat', 'floatBitsToUint', 'uintBitsToFloat', 'int', 'uint', 'float')


def strip_call(s, name):
    """Replace name(x) by (x) wherever it appears, matching parentheses."""
    out, i, pat = [], 0, re.compile(r'(?<![\w.])' + name + r'\(')
    while True:
        m = pat.search(s, i)
        if not m:
            out.append(s[i:]); return ''.join(out)
        out.append(s[i:m.start()])
        depth, j = 1, m.end()
        while depth and j < len(s):
            depth += {'(': 1, ')': -1}.get(s[j], 0); j += 1
        inner = s[m.end():j - 1]
        out.append(inner if re.fullmatch(r'[\w.\[\]]+', inner) else '(' + inner + ')')
        i = j


def mul_noieee(s):
    pat = re.compile(r'mul_nonIEEE\(')
    while True:
        m = pat.search(s)
        if not m: return s
        depth, j, comma = 1, m.end(), None
        while depth and j < len(s):
            c = s[j]
            if c == '(': depth += 1
            elif c == ')': depth -= 1
            elif c == ',' and depth == 1 and comma is None: comma = j
            j += 1
        a, b = s[m.end():comma].strip(), s[comma + 1:j - 1].strip()
        s = s[:m.start()] + '(%s * %s)' % (a, b) + s[j:]


def hexfloat(m):
    v = struct.unpack('<f', struct.pack('<I', int(m.group(1), 16)))[0]
    return ('%.6g' % v) if v != int(v) or abs(v) > 1e6 else ('%.1f' % v)


def clean(src):
    body = src[src.index('void main()'):] if 'void main()' in src else src
    body = mul_noieee(body)
    for n in ('intBitsToFloat', 'floatBitsToInt', 'floatBitsToUint', 'uintBitsToFloat'):
        body = strip_call(body, n)
    body = re.sub(r'(?:intBitsToFloat|floatBitsToInt)?\(?0x([0-9a-f]{8})\)?', hexfloat, body)
    body = re.sub(r'uf_remapped[PV]S\[(\d+)\]', r'C[\1]', body)
    body = re.sub(r'\b(R\d+|PV\d|PS\d|temp|backupReg\d+)i\b', r'\1', body)
    body = re.sub(r'\(\(([^()]+)\)\)', r'(\1)', body)
    return body


if __name__ == '__main__':
    print(clean(open(sys.argv[1]).read()))
