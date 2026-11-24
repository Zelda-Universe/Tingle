#!/usr/bin/env python3
"""Every draw in a frame capture (Cemu + MTLCaptureManager, cemu_capture.py), from
the trace's own command records (shader-notes.md, "Reading a frame capture's
commands"): its pipeline, vertex streams (buffer file, offset), uniform buffers and
index range, and its render passes with their attachments. Writes <out>.json ({draws, passes}); with --up, also lists the draws whose vertices all
have an upward 10-10-10-2 normal in one of their streams (water, flat ground).

python3 read_capture_draws.py <capture.gputrace> <out.json> [--up]

Buffers rewritten during the capture (the uniforms ring, the index buffer) are stored as numbered
versions (MTLBuffer-7-0 .. -7-23); a -10240 record in the command stream marks where each version
starts (with the buffer's object), so each draw reads the latest version named before it.
"""
import glob, json, os, re, struct, sys
import numpy as np

T, OUT = sys.argv[1:3]
UP = '--up' in sys.argv[3:]
UPMIN = 0.6 if '--loose' in sys.argv[3:] else 0.95


def records(path):
    d = open(path, 'rb').read(); off = 8
    while off + 8 <= len(d):
        size, fid = struct.unpack_from('<Ii', d, off)
        if size < 8 or off + size > len(d): break
        b = d[off:off + size]; k = b.find(b'C', 0x20); e = b.find(b'\0', k)
        yield fid, b, (e + 4) & ~3
        off += size


# buffer objects -> their files (-10237: a buffer made with its contents, named)
names = {}
for f in glob.glob(os.path.join(T, '*')):
    n = os.path.basename(f)
    if n.startswith('MTL') or os.path.isdir(f) or re.fullmatch(r'[0-9A-F]{12,16}', n) or n == 'store0': continue
    for fid, b, a in records(f):
        if fid != -10237: continue
        m = re.search(rb'MTLBuffer-\d+-\d+', b); t = b.find(b't\x00\x00\x00', m.end()) if m else -1
        if t > 0: names[struct.unpack_from('<Q', b, t + 4)[0]] = m.group().decode()

draws, pipe, vb, ub, tx, fresh = [], None, {}, {}, {}, set()
for fid, b, a in records(os.path.join(T, 'capture')):
    w = lambda i: struct.unpack_from('<Q', b, a + 8 * i)[0]
    # a buffer's next version (its contents from here on): -10240 names it, with the buffer's object
    if fid == -10240:
        m = re.search(rb'MTLBuffer-\d+-\d+', b)
        if m:
            names[w(1)] = m.group().decode()
            for table in (vb, ub):
                for k, v in table.items():
                    if v[2] == w(1): v[0] = names[w(1)]
        continue
    if fid == -16279: pipe = w(1)   # (Metal keeps vertex buffers bound across pipeline changes)
    elif fid == -15275: vb[w(4)] = [names.get(w(1)), w(2), w(1)]; fresh.add(w(4))
    elif fid == -15274 and w(3) in vb: vb[w(3)][1] = w(1); fresh.add(w(3))
    elif fid == -16263: ub[w(3)] = [names.get(w(1)), w(2), w(1)]
    # textures (-16276 vertex, -16261 fragment) and samplers (-16274, -16259): object, index
    elif fid in (-16276, -16261): tx[('vs' if fid == -16276 else 'ps') + str(w(2))] = '%x' % w(1)
    elif fid == -16222 and w(2) in ub: ub[w(2)][1] = w(1)
    elif fid == -16217:
        draws.append(dict(pipe='%x' % pipe if pipe else None, prim=w(1), count=w(2), itype=w(3), ib=names.get(w(4)), ioff=w(5), inst=w(6),
                          vb={str(k): v[:2] for k, v in vb.items()}, ub={str(k): v[:2] for k, v in ub.items()}, tx=dict(tx), fresh=sorted(fresh)))
        fresh = set()
# render passes: -16353 names each pass's descriptor, whose bytes are in store0 (zlib) by the index
# ('xdic': a hash table, then per name a 24-byte record (size, compressed size, offset into store0,
# flags) and the names' lengths, then the names); a descriptor's attachments are its texture objects
# (colour 0 at byte 0x18, depth at 0xa0)
idx = open(os.path.join(T, 'index'), 'rb').read(); n_idx = struct.unpack_from('<I', idx, 12)[0]
s0 = idx.find(b'(control device info)')
inames = [x.decode('latin1') for x in idx[s0:].split(b'\0')[:n_idx]]; ipos = {nm: i for i, nm in enumerate(inames)}
ibase = s0 - 2 * n_idx - 24 * n_idx
store = open(os.path.join(T, 'store0'), 'rb').read()
import zlib
def stored(name):
    i = ipos.get(name)
    if i is None: return None
    size, csize, off, _, _ = struct.unpack_from('<IIQII', idx, ibase + 24 * i)
    try: return zlib.decompress(store[off:off + csize])
    except Exception: return store[off:off + csize]
passes, ndraw = [], 0
for fid, b, a in records(os.path.join(T, 'capture')):
    if fid == -16353:
        nm = b[a + 8:b.find(b'\0', a + 8)].decode('latin1'); desc = stored(nm) or b''
        att = {}
        for slot, o in (('color0', 0x18), ('depth', 0xa0)):
            if len(desc) >= o + 8:
                v = struct.unpack_from('<Q', desc, o)[0]
                if v: att[slot] = '%x' % v
        passes.append(dict(name=nm, first=ndraw, att=att))
    elif fid == -16217: ndraw += 1
for i, p in enumerate(passes): p['draws'] = (passes[i + 1]['first'] if i + 1 < len(passes) else ndraw) - p['first']
json.dump(dict(draws=draws, passes=passes), open(OUT, 'w'))
print(len(passes), 'render passes')
print(len(draws), 'indexed draws,', len({d['pipe'] for d in draws}), 'pipelines,', len(names), 'named buffers')

if UP:
    cache = {}
    def data(n):
        if n not in cache: cache[n] = np.fromfile(os.path.join(T, n), np.uint8)
        return cache[n]
    def upfrac(buf, off, stride, k, ids):
        p = off + ids * stride + k; p = p[p + 4 <= len(buf)]
        if len(p) < 3: return 0.0
        u = (buf[p].astype(np.uint32) << 24) | (buf[p + 1].astype(np.uint32) << 16) | (buf[p + 2].astype(np.uint32) << 8) | buf[p + 3]
        x, y, z = u & 1023, (u >> 10) & 1023, (u >> 20) & 1023
        return float(np.mean((y >= 500) & (y <= 511) & ((x < 12) | (x > 1012)) & ((z < 12) | (z > 1012))))
    for i, d in enumerate(draws):
        if not d['ib'] or d['count'] < 6: continue
        # (index type 1 reads as 16-bit indices in these captures)
        ib = data(d['ib']); idx = np.frombuffer(ib[4096 + d['ioff']:4096 + d['ioff'] + 2 * d['count']].tobytes(), '<u2').astype(np.int64)
        if not len(idx) or idx.max() > 1e6: continue
        ids = np.unique(idx)[:500].astype(np.int64)
        for k, (n, off) in d['vb'].items():
            if not n or int(k) not in d['fresh']: continue   # (only streams bound for this draw: others are left over)
            best = max((upfrac(data(n), 4096 + off, s, o, ids), s, o) for s in range(4, 40, 4) for o in range(0, s, 4))
            if best[0] > UPMIN and len(ids) >= 30:
                print('draw', i, 'pipe', d['pipe'], 'stream', k, n, hex(off), 'stride', best[1], 'normal at', best[2], 'indices', d['count'], 'vertices', len(ids))
