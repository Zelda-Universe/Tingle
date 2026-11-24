#!/usr/bin/env python3
"""The game's own shaders street view draws with (images/3d/botw/streetview/gpu/),
and the constants the game gives them, for StreetViewGame.js:

- light_ps.glsl: the light pass (bec68ec6): each pixel's light, shadow and fog,
  at half resolution, from the G-buffer;
- upsample_ps.glsl: its depth-aware upsample to full resolution (b4a72958);
- tonemap_ps.glsl: the tone map, the picture's last step (37040a48);
- bright_ps.glsl: bloom's bright pass (10584c6f): what's bright enough to bleed light;
- constants.json: their constants (uf_remappedPS) as the game had them, read with
  the probe pack (build_probe_pack.py / read_probe.py) at 3:25 PM on the Great
  Plateau; the camera rows and the sun are street view's own each frame.

They're Cemu's dumps (Debug > Dump > Shaders) turned into WebGL 2 by
cemu_to_webgl.py: the game's maths, untouched.

python3 build_streetview_shaders.py <Cemu dump/shaders folder> <probe json> <output folder>
"""
import json, os, re, sys
sys.path.insert(0, os.path.dirname(__file__))
from cemu_to_webgl import convert

DUMP, PROBE, OUT = sys.argv[1:4]
SHADERS = {'light': ('bec68ec6f40a864f', '241'), 'upsample': ('b4a729584b6188ea', '228'), 'tonemap': ('37040a485a29d54e', '80'),
           'bright': ('10584c6fc5857351', '24')}

probe = json.load(open(PROBE))
os.makedirs(os.path.join(OUT, 'gpu'), exist_ok=True)
names = os.listdir(DUMP)
consts = {}
for name, (h, row) in SHADERS.items():
    f = next(n for n in names if n.startswith(h + '_') and n.endswith('_ps.txt'))
    open(os.path.join(OUT, 'gpu', name + '_ps.glsl'), 'w').write(convert(open(os.path.join(DUMP, f)).read()))
    consts[name] = probe[row]['constants']
x = probe['241x']['values']
consts['light_sem2'] = [x['passParameterSem2.' + c] for c in 'xyzw']


# The terrain (shader-notes.md: the clipmap): the game's vertex and pixel shaders, as WebGL 2.
# Their uniform blocks become plain arrays (WebGL's uniform blocks would need std140 buffers
# three.js doesn't bind for raw shaders); the material table (PS11, 4096 rows) keeps the rows a
# material index can reach (9 + 255). The pixel shader's outputs go where street view's G-buffer
# has them (StreetViewGame.js): its albedo (the game's output 1) stays at 1, its normal (output 3)
# to 2, then the sun's shadow (3, filled in by StreetViewTerrain.js) and no glow (4). (Which is which:
# by drawing them, 2026-11-23; PS9 is MaterialAlb, PS10 MaterialCmb.)
def blocks(src, keep=None):
    def arr(m):
        n = int(m.group(3)) if not keep or m.group(2) not in keep else keep[m.group(2)]
        return 'uniform vec4 %s[%d];' % (m.group(2), n)
    return re.sub(r'UNIFORM_BUFFER_LAYOUT\([^)]*\)\s*uniform (\w+)\s*\{\s*vec4 (\w+)\[(\d+)\];\s*\};', arr, src)


def as_2d(src, unit):
    """A 2D array texture the game samples at one layer, as a plain 2D picture (street view's pictures aren't arrays)"""
    src = src.replace('uniform sampler2DArray %s;' % unit, 'uniform sampler2D %s;' % unit)
    f = r'intBitsToFloat\([^()]*\)'
    out, n = re.subn(r'texture\(%s, vec3\((%s),(%s),%s\)\)' % (unit, f, f, f), r'texture(%s, vec2(\1,\2))' % unit, src)
    assert n, unit
    return out


TERRAIN = {'terrain_vs': 'deb54731c50e044d', 'terrain_ps': 'fb2d0efc923bf516'}
for name, h in TERRAIN.items():
    kind = name[-2:]
    f = next(n for n in names if n.startswith(h + '_') and n.endswith('_%s.txt' % kind))
    src = blocks(convert(open(os.path.join(DUMP, f)).read()), {'uf_blockPS11': 265})
    if kind == 'ps':
        src = (src.replace('layout(location = 3) out vec4 passPixelColor3;', 'layout(location = 2) out vec4 passPixelColor3;\n'
                           'layout(location = 3) out vec4 zmShadow;\nlayout(location = 4) out vec4 zmEmissive;\nuniform float zmSunShadow;')
                  .replace('layout(location = 7) out vec4 passPixelColor7;', 'vec4 passPixelColor7;'))
        src = re.sub(r'}\s*$', 'zmShadow = vec4(zmSunShadow, 1.0, 1.0, zmSunShadow);\nzmEmissive = vec4(0.0);\n}\n', src)
    open(os.path.join(OUT, 'gpu', name + '.glsl'), 'w').write(src)

# The water (shader-notes.md: the water clipmap): the game's G-buffer pass for it, vertex shader 4ba85316
# and pixel shader e57a8ad2. Its type table (VS4, 4096 rows) keeps the rows the eight types reach (8 x 6).
# The pixel shader's albedo (output 1) and normal (3 -> 2) go into street view's G-buffer, with the sun's
# shadow (3, StreetViewWater.js) and no glow (4); its material ID stays at 0 (as the terrain's: the G-buffer's
# first picture, which nothing reads; a shader that leaves it out fails to draw), and the colour it hands the
# water's later full-screen pass (5) isn't street view's, so it stays in the shader.
WATER = {'water_vs': '4ba8531637df52f4', 'water_ps': 'e57a8ad2ff5cb0bc'}
for name, h in WATER.items():
    kind = name[-2:]
    f = next(n for n in names if n.startswith(h + '_') and n.endswith('_%s.txt' % kind))
    src = blocks(convert(open(os.path.join(DUMP, f)).read()), {'uf_blockVS4': 48})
    if kind == 'ps':
        for a, b in (('layout(location = 3) out vec4 passPixelColor3;', 'layout(location = 2) out vec4 passPixelColor3;\n'
                      'layout(location = 3) out vec4 zmShadow;\nlayout(location = 4) out vec4 zmEmissive;\nuniform float zmSunShadow;'),
                     ('layout(location = 5) out vec4 passPixelColor5;', 'vec4 passPixelColor5;')):
            assert a in src, a
            src = src.replace(a, b)
        src = re.sub(r'}\s*$', 'zmShadow = vec4(zmSunShadow, 1.0, 1.0, zmSunShadow);\nzmEmissive = vec4(0.0);\n}\n', src)
    if kind == 'ps':
        src = as_2d(src, 'textureUnitPS2')
    open(os.path.join(OUT, 'gpu', name + '.glsl'), 'w').write(src)

# The water's full-screen pass ("water colour, edges and distant water fog": 2e2543216c04766d, after its
# vertex shader 4721609a, which street view's quad stands in for): over each water pixel, the light through
# the water (the G-buffer pass's output 5: PS10, layer 1 of the game's array; here its own picture) plus the
# sky's reflection (the sky cube, PS8), times the light pass's output 0 (PS11.z), plus the lit surface (the
# light pass's output 3, PS13). Pixels without water (the light through it 0: its alpha) are left as they are.
src = as_2d(convert(open(os.path.join(DUMP, next(n for n in names if n.startswith('2e2543216c04766d_') and n.endswith('_ps.txt')))).read()), 'textureUnitPS10')
src = re.sub(r'void main\(\)\s*\{', 'void main()\n{\nif(texture(textureUnitPS10, passParameterSem6.zw).a < 0.5) discard;', src, 1)
open(os.path.join(OUT, 'gpu', 'water_composite_ps.glsl'), 'w').write(src)

# The sky (shader-notes.md: the game's sky): its table shader (250cb5a0: the sky's light for every angle to
# the sun and height above the horizon, for the sun's height now, from the precomputed 3D scattering table,
# gpu/sky-inscatter.bin, extract_sky.py), and the sky's colour in a direction from that table (4e21d093: what the
# game fills its sky cube with). Their constants as probe-6 read them (rows 51, 109); the sun's made each hour.
for name, h in (('sky_lut_ps', '250cb5a06cab6534'), ('sky_ps', '4e21d093c6136a15')):
    f = next(n for n in names if n.startswith(h + '_') and n.endswith('_ps.txt'))
    open(os.path.join(OUT, 'gpu', name + '.glsl'), 'w').write(convert(open(os.path.join(DUMP, f)).read()))
consts['sky_lut'] = probe['51']['constants']
consts['sky'] = probe['109']['constants']

json.dump(consts, open(os.path.join(OUT, 'gpu', 'constants.json'), 'w'))
print('gpu/:', ', '.join(n + '_ps.glsl' for n in SHADERS), '+', ', '.join(n + '.glsl' for n in list(TERRAIN) + list(WATER) + ['water_composite_ps', 'sky_lut_ps', 'sky_ps']), '+ constants.json')
