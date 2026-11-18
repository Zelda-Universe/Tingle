"""BotW field terrain (Terrain/A/MainField.tscb + MainField/*.hght.sstera).

The .tscb lists the terrain's quadtree of areas: each has a centre and size in
units of 500 (the world is 32 wide, centred on 0) and the name of its height
tile. Tiles are 256 x 256 little-endian u16 heights (x 800 / 65535), packed in
fours into Yaz0 SARCs named after the first. Rows run along z, columns along x.
"""
import os, struct
import nin

SCALE, MAXH, N = 500.0, 800.0, 256

class Terrain:
    def __init__(self, folder):
        self.folder = folder
        d = open(os.path.join(folder, 'MainField.tscb'), 'rb').read()
        u = lambda o: struct.unpack_from('>I', d, o)[0]
        f = lambda o: struct.unpack_from('>f', d, o)[0]
        mat_size = u(0x30)
        at = 0x30 + mat_size      # then the area table's own size, and its offsets
        count = u(0x1C)
        self.areas = []
        for i in range(count):
            p = at + 4 + 4 * i; a = p + u(p)
            n = a + 0x20 + u(a + 0x20)
            name = d[n:d.index(b'\0', n)].decode()
            self.areas.append((f(a) * SCALE, f(a + 4) * SCALE, f(a + 8) * SCALE, name))
        self._tiles = {}
        self._mates = {}
        # The material table: each entry's texture (a layer of Terrain.Tex1's
        # MaterialAlb array) and how many times it repeats per world unit.
        self.materials = []
        for i in range(u(0x18)):
            p = 0x34 + 4 * i; e = p + u(p)
            self.materials.append((u(e), f(e + 4), f(e + 8)))

    def tile(self, name):
        if name not in self._tiles:
            pack = name[:-1] + '%X' % (int(name[-1], 16) & ~3)
            raw = open(os.path.join(self.folder, 'MainField', pack + '.hght.sstera'), 'rb').read()
            files = nin.sarc(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw)
            for k, v in files.items():
                self._tiles[k.split('.')[0]] = struct.unpack('<%dH' % (N * N), v)
        return self._tiles[name]

    def mate(self, name):
        """An area's materials: 256 x 256 x (material a, material b, blend
        towards b 0-255, flags), as numpy; rows along z, as the heights."""
        import numpy as np
        if name not in self._mates:
            pack = name[:-1] + '%X' % (int(name[-1], 16) & ~3)
            raw = open(os.path.join(self.folder, 'MainField', pack + '.mate.sstera'), 'rb').read()
            files = nin.sarc(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw)
            for k, v in files.items():
                self._mates[k.split('.')[0]] = np.frombuffer(v, np.uint8).reshape(N, N, 4)
        return self._mates[name]

    def finest(self, x, z, max_size=None):
        best = None
        for ax, az, sz, name in self.areas:
            if max_size and sz > max_size: continue
            if abs(x - ax) <= sz / 2 and abs(z - az) <= sz / 2 and (best is None or sz < best[2]):
                best = (ax, az, sz, name)
        return best

    def height(self, x, z, area=None):
        ax, az, sz, name = area or self.finest(x, z)
        t = self.tile(name)
        c = min(N - 1.001, max(0, (x - (ax - sz / 2)) / sz * (N - 1)))
        r = min(N - 1.001, max(0, (z - (az - sz / 2)) / sz * (N - 1)))
        c0, r0 = int(c), int(r); fc, fr = c - c0, r - r0
        h = lambda rr, cc: t[rr * N + cc]
        v = (h(r0, c0) * (1 - fc) + h(r0, c0 + 1) * fc) * (1 - fr) + (h(r0 + 1, c0) * (1 - fc) + h(r0 + 1, c0 + 1) * fc) * fr
        return v * MAXH / 65535
