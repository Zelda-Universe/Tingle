#!/usr/bin/env python3
"""The game's precomputed sky from a frame capture, for street view's sky (StreetViewGame.js _buildSky, paintSky):

- gpu/sky-inscatter.bin: the 3D scattering table the sky's table shader (250cb5a0) reads
  (its PS0): 256 x 32 x 16 texels, RGBA half floats, little-endian, x fastest. It depends
  only on the atmosphere (the sun's angle is one of its coordinates), so one capture serves
  every hour.
- and, for checking a port against: <out>-lut.npy, the frame's own 256 x 256 sky table
  (the table shader's output, RGBA half floats) as the capture began.
Both are unrolled (the capture keeps textures starting partway in: see TABLE_ROLL, ROLL).

Found by shape and format: the capture's one 256 x 32 x 16 and one 256 x 256 RGBA16F texture.

python3 extract_sky.py <capture.gputrace> <streetview folder> [<check out prefix>]
"""
import glob, os, struct, sys
import numpy as np

T, OUT = sys.argv[1:3]
CHECK = sys.argv[3] if len(sys.argv) > 3 else None
found = {}
for f in glob.glob(os.path.join(T, 'MTLTexture-*-mipmap0-slice0')):
    head = open(f, 'rb').read(0x40)
    fmt, w, h, d = (struct.unpack_from('<I', head, o)[0] for o in (0x18, 0x20, 0x28, 0x30))
    if fmt == 115 and (w, h, d) in ((256, 32, 16), (256, 256, 1)): found[(w, h, d)] = f
# The capture doesn't keep a texture's texels from its first: a 256 x 256 picture's rows start 32 texels in (its
# columns jump from brightest to dimmest at 32), and the 3D table as a whole starts 480 texels from where it should
# (rolled back by 480 here: with it, the table shader run on the table with a frame's own constants gives that
# frame's sky table to within 4%; at 479 or 481 it's off by 9% and 5%, without it by a factor of 2).
ROLL = 32
TABLE_ROLL = 480
inscatter = np.fromfile(found[(256, 32, 16)], np.uint8)[4096:4096 + 256 * 32 * 16 * 8]
assert len(inscatter) == 256 * 32 * 16 * 8
inscatter = np.roll(inscatter.view('<u2').reshape(-1, 4), TABLE_ROLL, axis=0)
inscatter.tofile(os.path.join(OUT, 'gpu', 'sky-inscatter.bin'))
print('gpu/sky-inscatter.bin from', os.path.basename(found[(256, 32, 16)]))
if CHECK and (256, 256, 1) in found:
    lut = np.roll(np.fromfile(found[(256, 256, 1)], np.uint8)[4096:4096 + 256 * 256 * 8].view('<f2').reshape(256, 256, 4), -ROLL, axis=1)
    np.save(CHECK + '-lut.npy', lut)
    print('check table', CHECK + '-lut.npy', 'from', os.path.basename(found[(256, 256, 1)]))
