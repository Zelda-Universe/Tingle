"""Minimal Wii U BFRES (v3/v4) reader: models, shapes, vertices, indices, bones."""
import struct, math

class R:
    def __init__(self, d): self.d = d
    def u8(self, o): return self.d[o]
    def u16(self, o): return struct.unpack_from('>H', self.d, o)[0]
    def u32(self, o): return struct.unpack_from('>I', self.d, o)[0]
    def s32(self, o): return struct.unpack_from('>i', self.d, o)[0]
    def f32(self, o): return struct.unpack_from('>f', self.d, o)[0]
    def rel(self, o):
        v = self.s32(o); return o + v if v else 0
    def str(self, o):
        p = self.rel(o)
        return self.d[p:self.d.index(b'\0', p)].decode('utf-8', 'replace') if p else ''

def group(r, off):
    """An index group: [(name, data offset)]."""
    if not off: return []
    n = r.s32(off + 4); out = []
    for k in range(1, n + 1):
        e = off + 8 + k * 16
        out.append((r.str(e + 8), r.rel(e + 12)))
    return out

def half(h):
    s = (h >> 15) & 1; e = (h >> 10) & 31; f = h & 1023
    if e == 0: v = f / 1024 * 2 ** -14
    elif e == 31: v = float('inf')
    else: v = (1 + f / 1024) * 2 ** (e - 15)
    return -v if s else v

def read_attr(d, base, count, stride, fmt, n4=False):
    """n4: keep a fourth component (vertex colours' alpha, tangents' sign)."""
    k = 4 if n4 else 3
    out = []
    for i in range(count):
        o = base + i * stride
        if fmt == 0x811: out.append(struct.unpack_from('>3f', d, o))
        elif fmt == 0x80d: out.append(struct.unpack_from('>2f', d, o))
        elif fmt == 0x813: out.append(struct.unpack_from('>4f', d, o)[:k])
        elif fmt == 0x80f: out.append(tuple(half(x) for x in struct.unpack_from('>4H', d, o)[:k]))
        elif fmt == 0x00a: out.append(tuple(x / 255 for x in struct.unpack_from('>4B', d, o)[:k]))
        elif fmt == 0x20a: out.append(tuple(max(x / 127, -1) for x in struct.unpack_from('>4b', d, o)[:k]))
        elif fmt == 0x808: out.append(tuple(half(x) for x in struct.unpack_from('>2H', d, o)))
        elif fmt == 0x20b:
            v = struct.unpack_from('>I', d, o)[0]
            comp = []
            for sh in (0, 10, 20):
                c = (v >> sh) & 1023
                if c & 512: c -= 1024
                comp.append(max(c / 511, -1))
            out.append(tuple(comp))
        elif fmt == 0x004: out.append(tuple(x / 255 for x in struct.unpack_from('>2B', d, o)))
        elif fmt == 0x007: out.append(tuple(x / 65535 for x in struct.unpack_from('>2H', d, o)))
        elif fmt == 0x207: out.append(tuple(max(x / 32767, -1) for x in struct.unpack_from('>2h', d, o)))
        else: return None
    return out

def models(d):
    r = R(d); assert d[:4] == b'FRES'
    res = []
    for mname, m in group(r, r.rel(0x20)):
        fvtx_arr = r.rel(m + 0x10); nvtx = r.u16(m + 0x20)
        # skeleton: bones' world matrices
        fskl = r.rel(m + 0x0C)
        bones = []
        if fskl:
            nb = r.u16(fskl + 0x08); barr = r.rel(fskl + 0x10); flags = r.u32(fskl + 0x04)
            size = 0x40 if r.u32(fskl+0) == 0x46534B4C and False else None
            # bone stride: v3.x 0x40 (with user data) — find by scanning names
            stride = 0x40
            for i in range(nb):
                b = barr + i * stride
                try: name = r.str(b)
                except ValueError: bones = []; break   # another bone layout: skip the skeleton
                parent = struct.unpack_from('>h', d, b + 0x06)[0]
                bflags = r.u32(b + 0x0C)
                sc = struct.unpack_from('>3f', d, b + 0x10); rot = struct.unpack_from('>4f', d, b + 0x1C)
                tr = struct.unpack_from('>3f', d, b + 0x2C)
                bones.append(dict(name=name, parent=parent, s=sc, r=rot, t=tr, quat=bool(bflags & 0x1000)))
        shapes = []
        for sname, sh in group(r, r.rel(m + 0x14)):
            vb_index = r.u16(sh + 0x12); skel_index = r.u16(sh + 0x10); mat = r.u16(sh + 0x0E)
            fv = r.rel(sh + 0x20)
            nat = r.u8(fv + 4); nverts = r.u32(fv + 8)
            attrs = {}
            aarr = r.rel(fv + 0x10); barr = r.rel(fv + 0x18)
            for a in range(nat):
                ao = aarr + a * 12
                an = r.str(ao); bi = r.u8(ao + 4); boff = r.u16(ao + 6); fmt = r.u32(ao + 8)
                bo = barr + bi * 0x18
                stride = r.u16(bo + 0x0C); data = r.rel(bo + 0x14)
                attrs[an] = (fmt, read_attr(d, data + boff, nverts, stride, fmt, an in ('_c0', '_t0', '_b0')))
            lod = r.rel(sh + 0x24)
            prim, ifmt, npts = r.u32(lod), r.u32(lod + 4), r.u32(lod + 8)
            ib = r.rel(lod + 0x14); first = r.u32(lod + 0x18)
            idata = r.rel(ib + 0x14)
            if ifmt in (4, 0): idx = [struct.unpack_from('>H', d, idata + 2 * i)[0] + first for i in range(npts)]
            else: idx = [struct.unpack_from('>I', d, idata + 4 * i)[0] + first for i in range(npts)]
            shapes.append(dict(name=sname, mat=mat, bone=skel_index, prim=prim, attrs=attrs, idx=idx, nverts=nverts))
        mats = []
        for mat_name, fm in group(r, r.rel(m + 0x18)):
            n = r.u8(fm + 0x10); ta = r.rel(fm + 0x28)
            texs = [r.str(ta + 8 * i) for i in range(n)]
            samplers = [k for k, _ in group(r, r.rel(fm + 0x30))]
            # Shader parameters (tex_srt0..., const_color0...: floats) and
            # options (uking_*: strings) of the game's uking_mat shader.
            params = {}
            npar = r.u16(fm + 0x12); parr = r.rel(fm + 0x34); pdata = r.rel(fm + 0x3C)
            for i in range(npar):
                pp = parr + i * 0x14; size = r.u8(pp + 1); off = r.u16(pp + 2)
                if size % 4 == 0: params[r.str(pp + 0x10)] = struct.unpack_from('>%df' % (size // 4), d, pdata + off)
            options = {}
            sa = r.rel(fm + 0x24)
            for k, v in group(r, r.rel(sa + 0x18)) if sa else []:
                options[k] = d[v:d.index(b'\0', v)].decode() if v else None
            mats.append(dict(name=mat_name, textures=dict(zip(samplers, texs)), params=params, options=options))
        res.append(dict(name=mname, shapes=shapes, bones=bones, mats=mats))
    return res
