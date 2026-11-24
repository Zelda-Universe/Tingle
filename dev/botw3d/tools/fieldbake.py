"""Sampling Hyrule's ground over a square, quickly (numpy): its heights, its
water, and its ground texture, from the game's terrain tiles (terrain.py).

Each is painted from the coarsest terrain areas to the finest, so every
point ends up with the finest the game has there. A tile's samples span its
area edge to edge (256 heights, 64 water cells), rows along z.
"""
import os
import numpy as np
import nin, gx2
from terrain import N, MAXH

WATER_N = 64


def _areas(T, x0, z0, size):
    return sorted((a for a in T.areas if a[0] + a[2] / 2 >= x0 and a[0] - a[2] / 2 <= x0 + size
                   and a[1] + a[2] / 2 >= z0 and a[1] - a[2] / 2 <= z0 + size), key=lambda a: -a[2])


def _paint(T, x0, z0, size, n, sample, fill=0.0):
    """An n x n grid (rows along z) over the square, sample(area, fx, fz)
    giving values for the points inside an area (fx, fz: 0-1 across it)."""
    out = np.full((n, n), fill, np.float32)
    xs = x0 + np.arange(n) * size / (n - 1); zs = z0 + np.arange(n) * size / (n - 1)
    for area in _areas(T, x0, z0, size):
        ax, az, sz, name = area
        c0, c1 = np.searchsorted(xs, ax - sz / 2), np.searchsorted(xs, ax + sz / 2, 'right')
        r0, r1 = np.searchsorted(zs, az - sz / 2), np.searchsorted(zs, az + sz / 2, 'right')
        if c1 <= c0 or r1 <= r0: continue
        fx = (xs[c0:c1] - (ax - sz / 2)) / sz; fz = (zs[r0:r1] - (az - sz / 2)) / sz
        v = sample(area, fx, fz)
        if v is not None: out[r0:r1, c0:c1] = v
    return out


def _bilinear(tile, fx, fz):
    n = tile.shape[0]
    cx = np.clip(fx * (n - 1), 0, n - 1.001); cz = np.clip(fz * (n - 1), 0, n - 1.001)
    i0 = cx.astype(int); j0 = cz.astype(int); tx = cx - i0; tz = cz - j0
    a = tile[np.ix_(j0, i0)]; b = tile[np.ix_(j0, i0 + 1)]
    c = tile[np.ix_(j0 + 1, i0)]; d = tile[np.ix_(j0 + 1, i0 + 1)]
    tx = tx[None, :]; tz = tz[:, None]
    return (a * (1 - tx) + b * tx) * (1 - tz) + (c * (1 - tx) + d * tx) * tz


_htiles = {}
def height_grid(T, x0, z0, size, n):
    """Heights (metres) on an n x n grid over the square."""
    def sample(area, fx, fz):
        name = area[3]
        if name not in _htiles:
            try: _htiles[name] = np.asarray(T.tile(name), np.float32).reshape(N, N) * (MAXH / 65535)
            except (FileNotFoundError, KeyError): _htiles[name] = None
        return None if _htiles[name] is None else _bilinear(_htiles[name], fx, fz)
    return _paint(T, x0, z0, size, n, sample)


class Water:
    """The game's water (Terrain/A/MainField/*.water.extm, the update's): per
    terrain area a 64 x 64 grid of (height u16, flow x u16, flow z u16, ?, type u8)."""
    def __init__(self, folder):
        self.folder, self.tiles = folder, {}

    def tile(self, name):
        if name not in self.tiles:
            pack = name[:-1] + '%X' % (int(name[-1], 16) & ~3)
            p = os.path.join(self.folder, pack + '.water.extm.sstera')
            if os.path.exists(p):
                raw = open(p, 'rb').read()
                for k, v in nin.sarc(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw).items():
                    a = np.frombuffer(v, np.uint8).reshape(WATER_N, WATER_N, 8)
                    h = a[..., 0:2].copy().view('<u2')[..., 0].astype(np.float32) * (MAXH / 65535)
                    self.tiles[k.split('.')[0]] = (h, a[..., 7].copy())
            self.tiles.setdefault(name, None)
        return self.tiles[name]


def water_grid(T, W, x0, z0, size, n):
    """(water heights, water types) on an n x n grid; the height is NaN where
    the game has no water."""
    def h(area, fx, fz):
        t = W.tile(area[3])
        if t is None: return np.full((len(fz), len(fx)), np.nan, np.float32)
        hh, ty = t
        i = np.clip(np.rint(fx * (WATER_N - 1)).astype(int), 0, WATER_N - 1)
        j = np.clip(np.rint(fz * (WATER_N - 1)).astype(int), 0, WATER_N - 1)
        return hh[np.ix_(j, i)]
    def ty(area, fx, fz):
        t = W.tile(area[3])
        if t is None: return np.zeros((len(fz), len(fx)), np.float32)
        i = np.clip(np.rint(fx * (WATER_N - 1)).astype(int), 0, WATER_N - 1)
        j = np.clip(np.rint(fz * (WATER_N - 1)).astype(int), 0, WATER_N - 1)
        return t[1][np.ix_(j, i)].astype(np.float32)
    return _paint(T, x0, z0, size, n, h, np.nan), _paint(T, x0, z0, size, n, ty)


def material_map(T, x0, z0, size, px, min_area=0.0):
    """Which of the game's ground materials lie where (its .mate files): two
    material indices (T.materials) and the blend between them, each px x px
    uint8, rows along z, sampled at pixel centres."""
    A = np.zeros((px, px), np.uint8); B = np.zeros_like(A); Wt = np.zeros_like(A)
    xs = x0 + (np.arange(px) + 0.5) * size / px; zs = z0 + (np.arange(px) + 0.5) * size / px
    for ax, az, sz, name in _areas(T, x0, z0, size):
        if sz < min_area: continue
        c0, c1 = np.searchsorted(xs, ax - sz / 2), np.searchsorted(xs, ax + sz / 2)
        r0, r1 = np.searchsorted(zs, az - sz / 2), np.searchsorted(zs, az + sz / 2)
        if c1 <= c0 or r1 <= r0: continue
        try: m = T.mate(name)
        except (FileNotFoundError, KeyError): continue
        ci = np.clip(np.rint((xs[c0:c1] - (ax - sz / 2)) / sz * 255).astype(int), 0, 255)
        ri = np.clip(np.rint((zs[r0:r1] - (az - sz / 2)) / sz * 255).astype(int), 0, 255)
        t = m[ri][:, ci]
        A[r0:r1, c0:c1], B[r0:r1, c0:c1], Wt[r0:r1, c0:c1] = t[..., 0], t[..., 1], t[..., 2]
    return A, B, Wt


def ground_texture(T, arrays, x0, z0, size, px, min_area=0.0):
    """The ground as the game paints it (two materials and a blend per sample,
    each a layer of the terrain's MaterialAlb array tiled at its own scale),
    px x px RGB uint8, rows along z. min_area: skip areas smaller than this
    (a coarse bake for the horizon)."""
    A, B, Wt = material_map(T, x0, z0, size, px, min_area)
    xs = x0 + (np.arange(px) + 0.5) * size / px; zs = z0 + (np.arange(px) + 0.5) * size / px
    SAMPLE = 256
    layers = {}
    X, Z = np.meshgrid(xs, zs)
    def colour(M):
        out = np.zeros((px, px, 3), np.float32)
        for mi in np.unique(M):
            sel = M == mi
            layer, us, vs = T.materials[mi] if mi < len(T.materials) else (0, 0.1, 0.1)
            if layer not in layers:
                img = arrays.decode('MaterialAlb', layer, arrays_tmp())
                from gltf_writer import magick
                small = np.frombuffer(magick('-size', '%dx%d' % (img.shape[1], img.shape[0]), '-depth', '8', 'rgba:-',
                                             '-resize', '%dx%d!' % (SAMPLE, SAMPLE), 'rgb:-', data=img.tobytes()), np.uint8)
                layers[layer] = small.reshape(SAMPLE, SAMPLE, 3).astype(np.float32)
            img = layers[layer]
            u = (np.floor(X[sel] * us * SAMPLE) % SAMPLE).astype(int)
            v = (np.floor(Z[sel] * vs * SAMPLE) % SAMPLE).astype(int)
            out[sel] = img[v, u]
        return out
    wgt = (Wt.astype(np.float32) / 255)[..., None]
    rgb = colour(A) * (1 - wgt) + colour(B) * wgt
    # A touch softer than the raw textures, as the game's light and haze show them.
    mean = rgb.reshape(-1, 3).mean(0)
    rgb = (mean + (rgb - mean) * 0.8) * 0.92
    return np.clip(rgb, 0, 255).astype(np.uint8)


_tmp = []
def arrays_tmp():
    if not _tmp:
        import tempfile
        _tmp.append(tempfile.mkdtemp())
    return _tmp[0]


class Grass:
    """The game's grass (Terrain/A/MainField/*.grass.extm, the update's): per
    terrain area a 64 x 64 grid of (density u8, colour r g b u8)."""
    def __init__(self, folder):
        self.folder, self.tiles = folder, {}

    def tile(self, name):
        if name not in self.tiles:
            pack = name[:-1] + '%X' % (int(name[-1], 16) & ~3)
            p = os.path.join(self.folder, pack + '.grass.extm.sstera')
            if os.path.exists(p):
                raw = open(p, 'rb').read()
                for k, v in nin.sarc(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw).items():
                    self.tiles[k.split('.')[0]] = np.frombuffer(v, np.uint8).reshape(WATER_N, WATER_N, 4).astype(np.float32)
            self.tiles.setdefault(name, None)
        return self.tiles[name]


def grass_grid(T, G, x0, z0, size, n):
    """n x n x 4 float: grass density 0-1, then its colour 0-1 (rows along z)."""
    out = []
    for c in range(4):
        def s(area, fx, fz, c=c):
            t = G.tile(area[3])
            return None if t is None else _bilinear(t[..., c], fx, fz)   # none: the coarser area's stands
        out.append(_paint(T, x0, z0, size, n, s))
    g = np.dstack(out)
    g[..., 0] /= 255
    g[..., 1:] /= 64   # the colours are stored dim (greens near 50)
    return np.clip(g, 0, 1)
