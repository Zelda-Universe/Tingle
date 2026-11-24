"""Height grids as glTF primitives (gltf_writer.Builder.raw_mesh): terrain and
water for street view and its horizon."""
import numpy as np

def normals(H, step):
    gz, gx = np.gradient(H, step)
    n = np.dstack([-gx, np.ones_like(H), -gz])
    return n / np.linalg.norm(n, axis=2, keepdims=True)

def grid_mesh(X0, Z0, H, step, uv_of, mask=None, chunk=125):
    """A height grid as primitives of at most chunk x chunk cells (16-bit
    indices); mask (cells) leaves cells out."""
    rows, cols = H.shape; N_ = normals(H, step); prims = []
    for cj in range(0, rows - 1, chunk):
        for ci in range(0, cols - 1, chunk):
            j1, i1 = min(cj + chunk, rows - 1), min(ci + chunk, cols - 1)
            js, is_ = np.arange(cj, j1 + 1), np.arange(ci, i1 + 1)
            J, I = np.meshgrid(js, is_, indexing='ij')
            pos = np.stack([X0 + I * step, H[J, I], Z0 + J * step], -1).reshape(-1, 3)
            w = i1 - ci + 1
            a = (np.arange(j1 - cj)[:, None] * w + np.arange(i1 - ci)[None, :])
            if mask is not None:
                keep = mask[cj:j1, ci:i1]
                if not keep.any(): continue
                a = a[keep]
            else:
                a = a.ravel()
            idx = np.stack([a, a + w, a + 1, a + 1, a + w, a + w + 1], -1).ravel()
            prims.append(dict(pos=pos, nrm=N_[J, I].reshape(-1, 3), uv=uv_of(pos), idx=idx))
    return prims


def skirt(X0, Z0, H, step, uv_of, depth=30.0):
    """A wall hanging down from the grid's four edges, depth metres: where the
    next section (or the coarser horizon) meets it at a slightly different
    height, no crack to see the sky through."""
    rows, cols = H.shape; N_ = normals(H, step); prims = []
    edges = [(np.arange(cols), np.zeros(cols, int)), (np.arange(cols), np.full(cols, rows - 1)),
             (np.zeros(rows, int), np.arange(rows)), (np.full(rows, cols - 1), np.arange(rows))]
    for I, J in edges:
        top = np.stack([X0 + I * step, H[J, I], Z0 + J * step], -1)
        bot = top.copy(); bot[:, 1] -= depth
        pos = np.concatenate([top, bot]); n = len(top)
        nrm = np.concatenate([N_[J, I]] * 2)
        a = np.arange(n - 1)
        idx = np.stack([a, a + n, a + 1, a + 1, a + n, a + n + 1], -1).ravel()
        uv = uv_of(top); uv = np.concatenate([uv, uv])
        prims.append(dict(pos=pos, nrm=nrm, uv=uv, idx=idx))
    return prims
