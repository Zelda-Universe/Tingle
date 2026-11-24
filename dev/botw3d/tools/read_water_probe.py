#!/usr/bin/env python3
"""Reads back what the water probe pack (build_water_probe.py) wrote into a frame
capture. Every image in the capture is looked at (the water is drawn in two passes,
into different images), whatever its size and format; in each, blocks start with a
marker: (5, 10, 3 + i) / 16 for the vertex data, (5, 11, 3 + i) / 16 for the
constants, i the patched pixel shader (build_water_probe.py's PS_ALL). Each word is
3 pixels (12 + 12 + 8 bits; the last pixel's blue the check 9).

Writes <out>.npz with, per shader i, its vertex blocks (screen x, y, then the 8
words: Sem0 halves 0-1, Sem0 halves 2-3, Sem1, Sem8, Sem12 bytes, world x, world
z, Sem0 y) and its constant words (the most common reading); prints a summary.

The capture's texture header: format at 0x18 (Metal: 70 / 71 RGBA8, 80 / 81 BGRA8,
90 RGB10A2, 92 RG11B10F, 115 RGBA16F), width 0x20, height 0x28, row bytes 0x38;
the pixels after 4096 bytes. (Full-size pictures are also rolled by 320 pixels;
not undone here: blocks are read within rows.)

python3 read_water_probe.py <capture.gputrace> <out> [--gbuffer]

--gbuffer: the G-buffer pass's probe (build_water_probe.py --gbuffer): a byte a pixel (red its low 4 bits, green its
high 4), markers (5, 10), (10, 5) then 44 input words (Sem0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11); (5, 11), (11, 5) then 80
constant words. Writes <out>.npz with inputs (each block's x, y and its 44 words) and consts (the most common reading).
"""
import glob, os, sys, struct, collections
import numpy as np

T, OUT = sys.argv[1:3]
GBUFFER = '--gbuffer' in sys.argv[3:]
NVERT, NCONST, NPS = (44, 80, 1) if GBUFFER else (8, 56, 5)


def f11(v, m):
    e = (v >> m) & 31; f = v & ((1 << m) - 1)
    return np.where(e == 0, f / (1 << m) * 2.0 ** -14, (1 + f / (1 << m)) * 2.0 ** (e.astype(np.int64) - 15))


def image(path):
    raw = np.fromfile(path, np.uint8)
    fmt, w, h, bpr = (struct.unpack_from('<I', raw, o)[0] for o in (0x18, 0x20, 0x28, 0x38))
    px = raw[4096:4096 + bpr * h]
    if len(px) < bpr * h or w < 64 or h < 16: return None
    if fmt in (70, 71, 80, 81):
        a = px.reshape(h, bpr)[:, :w * 4].reshape(h, w, 4).astype(np.float64) / 255
        if fmt in (80, 81): a = a[..., [2, 1, 0, 3]]
        if fmt in (71, 81): a = np.where(a <= 0.04045, a / 12.92, ((a + 0.055) / 1.055) ** 2.4)
        return a[..., :3]
    if fmt in (90, 92):
        u = px.reshape(h, bpr)[:, :w * 4].copy().view('<u4').astype(np.int64)
        if fmt == 90: return np.dstack([u & 1023, (u >> 10) & 1023, (u >> 20) & 1023]) / 1023
        return np.dstack([f11(u & 2047, 6), f11((u >> 11) & 2047, 6), f11((u >> 22) & 1023, 5)])
    if fmt == 115:
        return px.reshape(h, bpr)[:, :w * 8].copy().view('<f2').reshape(h, w, 4)[..., :3].astype(np.float64)
    return None


def words(row, x0, n):
    out = []
    for w in range(n):
        p = row[x0 + 3 * w: x0 + 3 * w + 3]
        if len(p) < 3 or p.max() > 15 or p.min() < 0 or p[2][2] != 9: return None
        a = [int(q[0]) | int(q[1]) << 4 | int(q[2]) << 8 for q in p[:2]]
        out.append(a[0] | a[1] << 12 | (int(p[2][0]) | int(p[2][1]) << 4) << 24)
    return out


def gbuffer():
    """The G-buffer probe's blocks, in whichever picture they are (copied raw by the water's full-screen pass)"""
    ins, consts = [], collections.Counter()
    def read(q, x0, n):
        out = []
        for w in range(n):
            p = q[x0 + 4 * w: x0 + 4 * w + 4]
            if len(p) < 4 or p[:, :2].max() > 15 or p[:, :2].min() < 0: return None
            out.append(sum((int(p[k][0]) | int(p[k][1]) << 4) << (8 * k) for k in range(4)))
        return out
    for f in sorted(glob.glob(os.path.join(T, 'MTLTexture-*'))):
        try: img = image(f)
        except Exception: continue
        if img is None: continue
        v = img * 16; nb = np.rint(v).astype(int); exact = (np.abs(v - nb) < 0.08).all(2)
        n = 0
        for kind, (m0, m1), words in (('in', ((5, 10), (10, 5)), 44), ('c', ((5, 11), (11, 5)), 80)):
            a = np.all(nb[:, :-1, :2] == m0, axis=2) & np.all(nb[:, 1:, :2] == m1, axis=2) & exact[:, :-1] & exact[:, 1:]
            for y, x in zip(*np.where(a)):
                ws = read(nb[y], x + 2, words)
                if ws is None: continue
                n += 1
                if kind == 'in': ins.append([x, y] + ws)
                else: consts[tuple(ws)] += 1
        if n: print(os.path.basename(f), img.shape[1], 'x', img.shape[0], n, 'blocks')
    np.set_printoptions(precision=5, suppress=True, linewidth=180)
    save = {}
    if ins:
        b = np.array(ins, np.uint64); save['inputs'] = b
        w = b[:, 2:].astype(np.uint32).view(np.float32)
        print(len(b), 'input blocks;', len({tuple(r) for r in b[:, 2:].tolist()}), 'distinct')
        names = ['Sem0', 'Sem1', 'Sem2', 'Sem3', 'Sem4', 'Sem5', 'Sem7', 'Sem8', 'Sem9', 'Sem10', 'Sem11']
        for i, nm in enumerate(names): print(' ', nm, 'median', np.median(w[:, 4 * i:4 * i + 4], axis=0))
    if consts:
        c = consts.most_common(1)[0]; save['consts'] = np.array(c[0], np.uint32)
        print('constants (', c[1], 'of', sum(consts.values()), 'readings):'); print(np.array(c[0], np.uint32).view(np.float32).reshape(-1, 4))
    np.savez(OUT, **save)


if GBUFFER:
    gbuffer(); sys.exit()
found = {}
for f in sorted(glob.glob(os.path.join(T, 'MTLTexture-*'))):
    try: img = image(f)
    except Exception: continue
    if img is None: continue
    nb = np.rint(img * 16).astype(int)
    for i in range(NPS):
        mv = np.all(nb == [5, 10, 3 + i], axis=2); mc = np.all(nb == [5, 11, 3 + i], axis=2)
        if mv.sum() + mc.sum() < 10: continue
        blocks, consts = [], collections.Counter()
        for y, x in zip(*np.where(mv)):
            ws = words(nb[y], x + 1, NVERT)
            if ws: blocks.append([x, y] + ws)
        for y, x in zip(*np.where(mc)):
            ws = words(nb[y], x + 1, NCONST)
            if ws: consts[tuple(ws)] += 1
        print(os.path.basename(f), img.shape[1], 'x', img.shape[0], 'shader', i, ':', int(mv.sum()), 'vertex markers,', len(blocks), 'blocks;',
              int(mc.sum()), 'constant markers,', sum(consts.values()), 'blocks')
        if len(blocks) > len(found.get(i, ([], None))[0]): found[i] = (blocks, consts.most_common(1)[0][0] if consts else None)
save = {}
np.set_printoptions(precision=4, suppress=True, linewidth=180)
for i, (blocks, c) in found.items():
    b = np.array(blocks, np.uint64)
    save['blocks%d' % i] = b
    if c is not None: save['consts%d' % i] = np.array(c, np.uint32)
    print('\nshader', i, len(b), 'vertex blocks')
    if len(b):
        w = b[:, 2:].astype(np.uint32)
        print('  distinct vertices', len({tuple(r) for r in w}))
        if not GBUFFER: print('  world x, z range', w[:, 5].view(np.float32).min(), w[:, 5].view(np.float32).max(), w[:, 6].view(np.float32).min(), w[:, 6].view(np.float32).max())
        for r in w[:4]: print('  ', r.view(np.float32).reshape(-1, 4) if GBUFFER else (['%08x' % v for v in r], 'world', r[5:8].view(np.float32)))
    if c is not None: print('  constants:\n', np.array(c, np.uint32).view(np.float32).reshape(-1, 4))
np.savez(OUT, **save)
