#!/usr/bin/env python3
"""Read back what the probe pack (build_probe_pack.py) wrote into a frame
capture: for each probed shader (by its row), its constants (uf_remappedPS) as
floats, found in whichever of the frame's images it drew into.

The capture keeps each image as raw pixels after a header; the probe's row
starts with a marker pixel (5, 10, row) / 16 and the count, then three pixels
per 32-bit constant in 4-bit pieces (j / 16), which come back exactly from
8-bit and sRGB, 10-bit, half-float and packed 11/11/10-float images.

python3 read_probe.py <capture.gputrace> [out.json]
"""
import glob, json, os, struct, sys
import numpy as np

T = sys.argv[1]
OUT = sys.argv[2] if len(sys.argv) > 2 else None
IX = os.path.expanduser('~/Library/Application Support/Cemu/graphicPacks/ZeldaMapsProbe/probe-index.json')
INDEX = json.load(open(IX)) if os.path.exists(IX) else {}


def f11(x, mb):
    e = (x >> mb) & 31; m = x & ((1 << mb) - 1)
    return np.where(e == 0, m / (1 << mb) * 2.0 ** -14, (1 + m / (1 << mb)) * 2.0 ** (e.astype(np.float64) - 15))


def srgb_to_linear(c):
    return np.where(c <= 0.04045, c / 12.92, ((c + 0.055) / 1.055) ** 2.4)


def pixels(raw, fmt):
    """Each pixel's red, green, blue as linear values (0..1), by format."""
    if fmt == 'rgba16f':
        h = raw[:len(raw) // 8 * 8].view('<f2').reshape(-1, 4).astype(np.float64); return h[:, :3]
    w = raw[:len(raw) // 4 * 4].view('<u4').astype(np.int64)
    if fmt in ('rgba8', 'rgba8srgb'):
        c = np.stack([w & 255, (w >> 8) & 255, (w >> 16) & 255], -1) / 255.0
        return srgb_to_linear(c) if fmt == 'rgba8srgb' else c
    if fmt in ('bgra8', 'bgra8srgb'):
        c = np.stack([(w >> 16) & 255, (w >> 8) & 255, w & 255], -1) / 255.0
        return srgb_to_linear(c) if fmt == 'bgra8srgb' else c
    if fmt == 'rgb10a2': return np.stack([w & 1023, (w >> 10) & 1023, (w >> 20) & 1023], -1) / 1023.0
    return np.stack([f11(w & 0x7ff, 6), f11((w >> 11) & 0x7ff, 6), f11((w >> 22) & 0x3ff, 5)], -1)   # rg11b10f


FORMATS = ('rgba8', 'rgba8srgb', 'bgra8', 'bgra8srgb', 'rgb10a2', 'rg11b10f', 'rgba16f')
found = {}
for f in sorted(glob.glob(os.path.join(T, 'MTLTexture-*'))):
    if os.path.getsize(f) < 8192: continue
    raw = np.fromfile(f, np.uint8)[4096:]
    for fmt in FORMATS:
        with np.errstate(all='ignore'):
            c = np.round(pixels(raw, fmt) * 16)
        hits = np.where((c[:-2, 0] == 5) & (c[:-2, 1] == 10) & ((c[:-2, 2] == 3) | (c[:-2, 2] == 4)) & (c[1:-1, 2] == 12) & (c[2:, 2] == 6))[0]
        for i in hits:
            extra = c[i, 2] == 4
            row = int(c[i + 1, 0] + c[i + 1, 1] * 16)
            key = str(row) + ('x' if extra else '')
            if key in found: continue
            n = int(c[i + 2, 0] + c[i + 2, 1] * 16)
            per = 3 if extra else 12          # extra: n floats; constants: n vec4s
            if n == 0 or i + 3 + n * per > len(c): continue
            px = c[i + 3:i + 3 + n * per].astype(np.int64).reshape(-1, 3, 3)
            if not (px[:, 2, 2] == 9).all() or (px < 0).any() or (px > 15).any(): continue
            a0 = px[:, 0, 0] | px[:, 0, 1] << 4 | px[:, 0, 2] << 8
            a1 = px[:, 1, 0] | px[:, 1, 1] << 4 | px[:, 1, 2] << 8
            a2 = px[:, 2, 0] | px[:, 2, 1] << 4
            u = (a0 | a1 << 12 | a2 << 24).astype('<u4')
            vals = np.frombuffer(u.tobytes(), '<f4')
            if extra:
                info = INDEX.get(key, {}); names = []
                for i_ in info.get('inputs', []): names += ['%s.%s' % (i_, ch) for ch in 'xyzw']
                for sm in info.get('samplers', []): names += [sm + '.width', sm + '.height'] + ['%s.centre.%s' % (sm, ch) for ch in 'rgba']
                found[key] = dict(shader=INDEX.get(str(row), '?'), image=os.path.basename(f), format=fmt,
                                  values={(names[j] if j < len(names) else str(j)): float('%.6g' % v) for j, v in enumerate(vals)})
            else:
                found[key] = dict(shader=INDEX.get(str(row), '?'), image=os.path.basename(f), format=fmt, constants=[[float('%.6g' % x) for x in r] for r in vals.reshape(n, 4)])

for key in sorted(found, key=lambda k: (int(k.rstrip('x')), k)):
    r = found[key]
    print('row %s  %s  (%s, %s)' % (key, r['shader'], r['image'], r['format']))
    if 'constants' in r:
        for k, v in enumerate(r['constants']): print('  C[%d] = %s' % (k, v))
    else:
        for k, v in r['values'].items(): print('  %s = %s' % (k, v))
if OUT: json.dump(found, open(OUT, 'w'), indent=1)
if not found: print('no probe rows found')
