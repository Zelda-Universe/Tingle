#!/usr/bin/env python3
"""A reference frame for dev/botw3d/compare.js from a frame capture of the game
(Cemu with MTL_CAPTURE_ENABLED=1, captured with cemu_capture.py; no probe pack
needed): the game's own final picture, its G-buffer, and its camera and sun.

- the pictures: the capture keeps each image's pixels after a 4096-byte header,
  starting 320 pixels in (so rolled back); at 1280 x 720 the final picture is
  10-bit (RGB10A2), the G-buffer albedo 8-bit sRGB, normals 8-bit;
- the camera and sun: the light pass's constants (uf_remappedPS, 33 vec4s; their
  layout from the probe pack, shader-notes.md) are somewhere in the frame's
  buffers: the block with C[32] = the sun's colour x 9 and C[15].w = 9. Its C[2..4]
  are the camera's rows (camera to world: the position in w), C[15] the light's
  direction in view space and strength (the sun's 9; at night the moon's, far
  less), C[32] its colour. Found by its shape: C[0].x = 24999.9 (the depth range),
  unit camera rows with a world position, a unit C[15].

Writes reference/<name>.png (no HUD), <name>-hud.png, <name>-albedo.png,
<name>-normal.png and <name>.json (camera, field of view, sun; the hour from the
HUD's clock is to be filled in by eye). --images-only: the pictures alone.

python3 extract_reference.py <capture.gputrace> <reference folder> <name> [--images-only]
"""
import glob, json, os, subprocess, sys
import numpy as np

T, OUT, NAME = sys.argv[1:4]
IMAGES_ONLY = '--images-only' in sys.argv[4:]   # keep the reference's json (its by-eye fields)
W, H = 1280, 720


def frames(fmt_byte):
    for f in sorted(glob.glob(os.path.join(T, 'MTLTexture-*'))):
        if os.path.getsize(f) != 4096 + W * H * 4: continue
        raw = np.fromfile(f, np.uint8)
        if raw[0x18] != fmt_byte: continue
        yield f, np.roll(raw[4096:4096 + W * H * 4].view('<u4'), -320).reshape(H, W)


def save(img, name):
    subprocess.run(['magick', '-size', '%dx%d' % (W, H), '-depth', '8', 'rgb:-', os.path.join(OUT, name)],
                   input=np.ascontiguousarray(img).tobytes(), check=True)


# the pictures: 10-bit finals, the one with the HUD has its hearts (red, top left)
finals = []
for f, u in frames(90):
    # the game's final image is linear (the tone map's 1 - exp(-x)); the Wii U's video out shows it
    # sRGB-encoded (checked against Cemu's own window, 2026-11-23: encoded, they agree to ~5 levels
    # of 255; as stored, 65 apart), so the reference is encoded the same way
    lin = np.dstack([u & 1023, (u >> 10) & 1023, (u >> 20) & 1023]) / 1023
    img = (np.where(lin <= 0.0031308, 12.92 * lin, 1.055 * lin ** (1 / 2.4) - 0.055) * 255 + 0.5).astype(np.uint8)
    corner = img[20:60, 40:160].astype(int)
    hearts = ((corner[..., 0] > 180) & (corner[..., 1] < 80)).mean()
    finals.append((hearts, img.std(), os.path.basename(f), img))
hud = max(finals, key=lambda x: x[0])
# the same frame without its HUD, if the capture kept it: one that differs from the HUD's only a
# little (a capture can also keep a picture from an earlier moment, another place entirely); if
# none, the HUD's own frame, and compare.js leaves out the HUD's corners
clean = [x for x in finals if x[0] < 0.01 and x[1] > 20]
diffs = [np.abs(x[3].astype(int) - hud[3].astype(int)).mean() for x in clean]
clean = clean[int(np.argmin(diffs))] if clean and min(diffs) < 12 else None
save(hud[3], NAME + '-hud.png')
save((clean or hud)[3], NAME + '.png')
for fmt, suffix in ((71, '-albedo.png'), (70, '-normal.png')):
    for f, u in frames(fmt):
        img = np.dstack([u & 255, (u >> 8) & 255, (u >> 16) & 255]).astype(np.uint8)
        save(img, NAME + suffix); break

# the camera and the sun, from the light pass's constants
block = None
for f in sorted(glob.glob(os.path.join(T, 'MTLBuffer-*'))):
    a = np.fromfile(f, '<f4'); v = a[:len(a) // 4 * 4].reshape(-1, 4)
    with np.errstate(all='ignore'):
        n = np.linalg.norm(v[:, :3], axis=1)
        cand = np.where((np.abs(n - 1) < 1e-3) & (v[:, 3] > 0.1) & (v[:, 3] < 50))[0]   # C[15]: the light, its strength
    for i in cand:
        s0 = i - 15
        if s0 < 0 or s0 + 33 > len(v): continue
        c = v[s0:s0 + 33]
        with np.errstate(all='ignore'):
            rows = np.linalg.norm(c[2:5, :3], axis=1)
        if (np.abs(rows - 1) < 1e-3).all() and np.abs(c[2:5, 3]).max() > 100 and abs(c[0, 0] - 24999.9) < 1:
            block = c; break
    if block is not None: break
R = block[2:5, :3]                      # camera to world rows
pos = block[2:5, 3]
fwd = -R[:, 2]                          # the camera looks along its -z
up = R[:, 1]
light = R @ -block[15, :3]              # toward the light (the sun, or at night the moon), in world space
strength, colour = float(block[15, 3]), block[32, :3]
# (night or weather can't be told from the light alone: clear sun 9, overcast 4.5, dusk 1 -- set by
# eye from the HUD's clock and sky, as 'night' and 'weather' in the json)
ref = dict(pos=[round(float(x), 4) for x in pos], fwd=[round(float(x), 5) for x in fwd], up=[round(float(x), 5) for x in up],
           fovy=round(float(2 * np.degrees(np.arctan(1 / 2.1445))), 4), w=W, h=H,
           light=[round(float(x), 5) for x in light / np.linalg.norm(light)], light_strength=round(strength, 4),
           light_colour=[round(float(x), 4) for x in colour], night=None, weather=None, hour=None,
           hud_in_frame=clean is None, frames=dict(final=clean[2] if clean else hud[2], hud=hud[2]))
if not IMAGES_ONLY: json.dump(ref, open(os.path.join(OUT, NAME + '.json'), 'w'), indent=1)
print(json.dumps(ref))
