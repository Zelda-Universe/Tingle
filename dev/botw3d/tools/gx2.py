"""Wii U GX2 texture un-tiling (AMD addrlib, R6xx/R7xx: 2 pipes, 4 banks) for
block-compressed surfaces, and DDS output for ImageMagick to decode."""
import struct

PIPES, BANKS, GROUP_BITS, PIPE_BITS, BANK_BITS = 2, 4, 8, 1, 2

def pixel_index(x, y, bpp):
    if bpp == 0x40: bits = (x & 1, y & 1, (x >> 1) & 1, (x >> 2) & 1, (y >> 1) & 1, (y >> 2) & 1)
    elif bpp == 0x80: bits = (y & 1, x & 1, (x >> 1) & 1, (x >> 2) & 1, (y >> 1) & 1, (y >> 2) & 1)
    elif bpp == 0x20: bits = (x & 1, (x >> 1) & 1, y & 1, (x >> 2) & 1, (y >> 1) & 1, (y >> 2) & 1)
    elif bpp == 0x10: bits = (x & 1, (x >> 1) & 1, (x >> 2) & 1, y & 1, (y >> 1) & 1, (y >> 2) & 1)
    else: bits = (x & 1, (x >> 1) & 1, (x >> 2) & 1, (y >> 1) & 1, y & 1, (y >> 2) & 1)
    return sum(b << i for i, b in enumerate(bits))

def addr_macro(x, y, bpp, pitch, swizzle, slice_=0, slice_bytes=0):
    pipe = ((y >> 3) ^ (x >> 3)) & 1
    bank = (((y // (16 * PIPES)) ^ (x >> 3)) & 1) | ((((y // (8 * PIPES)) ^ (x >> 4)) & 1) << 1)
    bank_pipe = pipe + PIPES * bank
    rotation = PIPES * ((BANKS >> 1) - 1)
    sw = ((swizzle >> 8) & 1) + PIPES * ((swizzle >> 9) & 3)
    bank_pipe ^= sw + slice_ * rotation   # each array slice rotated (2D thin tiling)
    bank_pipe %= PIPES * BANKS
    pipe, bank = bank_pipe % PIPES, bank_pipe // PIPES
    elem = (bpp * pixel_index(x, y, bpp)) >> 3
    mt_pitch, mt_height = 8 * BANKS, 8 * PIPES
    mt_bytes = (bpp * mt_height * mt_pitch + 7) >> 3
    mt_offset = ((x // mt_pitch) + (pitch // mt_pitch) * (y // mt_height)) * mt_bytes
    total = elem + ((mt_offset + slice_ * slice_bytes) >> (BANK_BITS + PIPE_BITS))
    high = (total >> GROUP_BITS) << (GROUP_BITS + PIPE_BITS + BANK_BITS)
    low = total & ((1 << GROUP_BITS) - 1)
    return (bank << (PIPE_BITS + GROUP_BITS)) | (pipe << GROUP_BITS) | low | high

def addr_micro(x, y, bpp, pitch):
    mt_bytes = 64 * bpp >> 3
    return ((x >> 3) + (y >> 3) * (pitch >> 3)) * mt_bytes + ((bpp * pixel_index(x, y, bpp)) >> 3)

def untile(data, width, height, pitch, fmt, tile_mode, swizzle, slice_=0):
    """Linear block data for BC1/BC3/BC4/BC5 (4x4 blocks); slice_: which
    layer of a texture array (data: the whole array's)."""
    base = fmt & 0x3f
    bpb = 8 if base in (0x31, 0x34) else 16
    bpp = bpb * 8
    bw, bh = (width + 3) // 4, (height + 3) // 4
    out = bytearray(bw * bh * bpb)
    for y in range(bh):
        for x in range(bw):
            slice_bytes = pitch * bh * bpb
            a = (addr_macro(x, y, bpp, pitch, swizzle, slice_, slice_bytes) if tile_mode == 4
                 else addr_micro(x, y, bpp, pitch) + slice_ * slice_bytes)
            if a + bpb <= len(data):
                o = (y * bw + x) * bpb; out[o:o + bpb] = data[a:a + bpb]
    return bytes(out)

def dds(linear, width, height, fmt):
    base = fmt & 0x3f
    fourcc = {0x31: b'DXT1', 0x32: b'DXT3', 0x33: b'DXT5', 0x34: b'ATI1', 0x35: b'ATI2'}[base]
    hdr = struct.pack('<4sIIIIIII44xII4s20xI16x', b'DDS ', 124, 0x81007, height, width, len(linear), 0, 1,
                      32, 0x4, fourcc, 0x1000)
    return hdr + linear

def decode_bc4(linear, width, height):
    """BC4 (one channel) block data, linear, as rows of 0-255 values (numpy)."""
    import numpy as np
    bw, bh = (width + 3) // 4, (height + 3) // 4
    blocks = np.frombuffer(linear, dtype=np.uint8)[:bw * bh * 8].reshape(bh, bw, 8).astype(np.int32)
    e0, e1 = blocks[..., 0], blocks[..., 1]
    pal = np.zeros((bh, bw, 8), np.int32)
    pal[..., 0], pal[..., 1] = e0, e1
    six = e0 > e1
    for i in range(1, 7):
        pal[..., 1 + i] = np.where(six, ((7 - i) * e0 + i * e1) // 7, pal[..., 1 + i])
    for i in range(1, 5):
        pal[..., 1 + i] = np.where(~six, ((5 - i) * e0 + i * e1) // 5, pal[..., 1 + i])
    pal[..., 6] = np.where(~six, 0, pal[..., 6]); pal[..., 7] = np.where(~six, 255, pal[..., 7])
    bits = np.zeros((bh, bw), np.uint64)
    for k in range(6): bits |= blocks[..., 2 + k].astype(np.uint64) << np.uint64(8 * k)
    out = np.zeros((bh * 4, bw * 4), np.uint8)
    for p in range(16):
        idx = ((bits >> np.uint64(3 * p)) & np.uint64(7)).astype(np.int64)
        val = np.take_along_axis(pal, idx[..., None], axis=2)[..., 0]
        out[(p // 4)::4, (p % 4)::4] = val
    return out[:height, :width]

def decode_bc5(linear, width, height):
    """BC5 (two channels: each block a BC4 block for red, then one for green),
    linear, as (red, green) rows of 0-255 values (numpy)."""
    import numpy as np
    bw, bh = (width + 3) // 4, (height + 3) // 4
    blocks = np.frombuffer(linear, dtype=np.uint8)[:bw * bh * 16].reshape(-1, 16)
    red, green = blocks[:, :8].tobytes(), blocks[:, 8:].tobytes()
    return decode_bc4(red, width, height), decode_bc4(green, width, height)
