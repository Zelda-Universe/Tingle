#!/usr/bin/env python3
"""A Cemu graphic pack that makes BotW's water show what it's made of: its vertex
shader (7af8fda57eae0289) hands the raw vertex inputs to its pixel shader
(2e2543216c04766d), which writes them into the picture where the water is,
instead of the water's colour. A frame capture then holds them in the HDR image
the water draws into (RG11B10F); read_water_probe.py reads them back.

The game builds its water meshes on the CPU from the .water.extm tiles, so the
shaders alone don't say what each vertex holds; this does. (The water looks like
noise while the pack is on.)

Per pixel, from the vertex that drew it (flat: exact, not blended):
- even rows, blocks of 25 pixels: a marker (5, 10, 3) / 16, then 8 words, 3 pixels
  each (12 + 12 + 8 bits; the last pixel's blue the check 9): the vertex's raw
  inputs (Sem0's four 16-bit halves as two words, Sem1, Sem8's two 16-bit values,
  Sem12's four bytes), then its world x and z (the shader's own sums with its
  constants C1 and C3) and its Sem0 y; carried in the shaders' own Sem4 and Sem6
  (the vertex shader overwrites them, the pixel shader reads them flat: any added
  varying left the water undrawn in Cemu);
- odd rows, blocks of 169 pixels: a marker (5, 10, 4), then the pixel shader's 56
  constant words.
Values j / 16 come back exactly from the 11/11/10-bit float image.

python3 build_water_probe.py <Cemu dump/shaders folder> <pack folder> [--ps-only]

--gbuffer: the shaders that draw the pond (water-gbuffer: VS 4ba8531637df52f4 and its twins 4ba954d077db66b9,
7b5b9f2fd4a624a6, PS e57a8ad2ff5cb0bc, the G-buffer pass): the vertex shader only also hands on its type table's
sixth row (the waves' amplitude and length: x, y) in two outputs' unused w (Sem5.w, Sem8.w), no new varyings; the
pixel shader writes, into all four of its pictures, a byte a pixel (red the low 4 bits, green the high 4: two-channel
targets keep it), even rows in blocks of 178 pixels (markers (5, 10), (10, 5), then its 44 input words: Sem0, 1, 2, 3,
4, 5, 7, 8, 9, 10, 11), odd rows its 80 constant words (markers (5, 11), (11, 5), blocks of 322). And the water's
full-screen passes (PS_ALL) copy their 2D pictures, raw, into their output (a capture keeps pictures as they were
when it began: the G-buffer's are overwritten by then, but these passes' output lasts into the next frame).

--ps-only: the vertex shader untouched and no new varyings (the first version's water didn't draw at
all in Cemu, likely its pipeline with the added flat varyings failing): the pixel shader writes its own
three inputs instead (Sem0, Sem4, Sem6: blended across each triangle, not exact per vertex), even rows
in blocks of 37 pixels (marker (5, 10, 3), 12 floats), odd rows its constants (marker (5, 10, 4), 56
words, blocks of 169).
"""
import os, re, sys

DUMP, PACK = sys.argv[1:3]
PS_ONLY = '--ps-only' in sys.argv[3:]
GBUFFER = '--gbuffer' in sys.argv[3:]
VS, PS = '7af8fda57eae0289_0000000000000000_vs.txt', '2e2543216c04766d_0000000079249749_ps.txt'
VS2 = '7af8fda99eae0289_0000000000000000_vs.txt'
# the pixel shaders that take what the water's vertex shaders give (Sem0, Sem4, Sem6): the water is
# drawn in two passes (its meshes, then a full-screen pass per water type: 4721609a + one of these),
# so which pairs with the meshes isn't known; each writes its own marker (5, 10, 3 + i) / (5, 11, 3 + i)
PS_ALL = ['2e2543216c04766d_0000000079249749_ps.txt', '9fbeb9714fd898d1_00000003c9249749_ps.txt', '3179b85d41bfb80d_0000000079249749_ps.txt',
          '556c05fb25791fec_00000003c9249749_ps.txt', 'bede6707b02b5fed_0000000000003c49_ps.txt']
os.makedirs(PACK, exist_ok=True)

DECL_VS = '''
vec4 zmA, zmB;
'''
SET_VS = '''
// --- zelda maps water probe: the raw vertex and its world x / z (as float bits: flat floats) ---
{
	uvec4 s0 = attrDataSem0; uint s1 = attrDataSem1.x; uvec4 s8 = attrDataSem8; uvec4 s12 = attrDataSem12;
	zmA = uintBitsToFloat(uvec4((s0.x << 16) | (s0.y & 0xFFFFu), (s0.z << 16) | (s0.w & 0xFFFFu), s1, (s8.x << 16) | (s8.y & 0xFFFFu)));
	float wx = dot(vec4(R3f.xyz, 1.0), intBitsToFloat(uf_remappedVS[1]));
	float wz = dot(vec4(R3f.xyz, 1.0), intBitsToFloat(uf_remappedVS[3]));
	zmB = vec4(uintBitsToFloat((s12.x & 255u) | ((s12.y & 255u) << 8) | ((s12.z & 255u) << 16) | ((s12.w & 255u) << 24)), wx, wz, R3f.y);
}
'''
DECL_PS = ''
OUT_PS = '''
// --- zelda maps water probe: the vertex's data (even rows, 8 words) and the pixel shader's constants
// (odd rows, 56 words), in 4-bit pieces instead of the colour ---
{
	ivec2 zp = ivec2(gl_FragCoord.xy); vec3 zn = vec3(0.0); uint u = 0u; int part = 0; bool any = false;
	if((zp.y & 1) == 0) {
		int k = zp.x % 25;
		if(k == 0) zn = vec3(5.0, 10.0, 3.0);
		else { int w = (k - 1) / 3; part = (k - 1) - w * 3; any = true; u = floatBitsToUint(w < 4 ? passParameterSem4[w] : passParameterSem6[w - 4]); }
	} else {
		int k = zp.x % 169;
		if(k == 0) zn = vec3(5.0, 10.0, 4.0);
		else { int w = (k - 1) / 3; part = (k - 1) - w * 3; any = true; u = uint(uf_remappedPS[w / 4][w & 3]); }
	}
	if(any) {
		uint a = (u >> uint(part * 12)) & 4095u;
		zn = part < 2 ? vec3(float(a & 15u), float((a >> 4) & 15u), float((a >> 8) & 15u)) : vec3(float(a & 15u), float((a >> 4) & 15u), 9.0);
	}
	passPixelColor0 = vec4(zn / 16.0, 1.0);
}
'''
OUT_PS_ONLY = '''
// --- zelda maps water probe (pixel shader only): its inputs and constants in 4-bit pieces ---
{
	ivec2 zp = ivec2(gl_FragCoord.xy); vec3 zn = vec3(0.0); uint u = 0u; int part = 0; bool any = false;
	if((zp.y & 1) == 0) {
		int k = zp.x % 37;
		if(k == 0) zn = vec3(5.0, 10.0, 3.0);
		else {
			int w = (k - 1) / 3; part = (k - 1) - w * 3; any = true;
			vec4 v = w < 4 ? passParameterSem0 : w < 8 ? passParameterSem4 : passParameterSem6;
			u = floatBitsToUint(v[w & 3]);
		}
	} else {
		int k = zp.x % 169;
		if(k == 0) zn = vec3(5.0, 10.0, 4.0);
		else { int w = (k - 1) / 3; part = (k - 1) - w * 3; any = true; u = uint(uf_remappedPS[w / 4][w & 3]); }
	}
	if(any) {
		uint a = (u >> uint(part * 12)) & 4095u;
		zn = part < 2 ? vec3(float(a & 15u), float((a >> 4) & 15u), float((a >> 8) & 15u)) : vec3(float(a & 15u), float((a >> 4) & 15u), 9.0);
	}
	passPixelColor0 = vec4(zn / 16.0, 1.0);
}
'''
def gbuffer():
    for old in os.listdir(PACK):
        if old.endswith('.txt') and old != 'rules.txt': os.remove(os.path.join(PACK, old))
    # vertex shaders: the sixth table row (read into the first register of its line) into Sem5.w / Sem8.w
    for name, reg5, out5 in (('4ba8531637df52f4', 'R2i', 'R6i'), ('4ba954d077db66b9', 'R2i', 'R6i'), ('7b5b9f2fd4a624a6', 'R11i', 'R5i')):
        f = name + '_0000000000000000_vs.txt'
        v = open(os.path.join(DUMP, f)).read()
        a = 'bool predResult = true;'
        assert a in v
        v = v.replace(a, a + '\nint zmA = 0, zmB = 0;', 1)
        line = [l for l in v.split('\n') if l.startswith(reg5 + '.xy = floatBitsToInt(uf_blockVS4[')][0]
        v = v.replace(line, line + '\nzmA = %s.x; zmB = %s.y;' % (reg5, reg5), 1)
        e5 = 'passParameterSem5 = vec4(intBitsToFloat(%s.x), intBitsToFloat(%s.y), intBitsToFloat(%s.z), intBitsToFloat(%s.w));' % ((out5,) * 4)
        e8 = 'passParameterSem8 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));'
        assert e5 in v and e8 in v
        v = v.replace(e5, e5.replace('intBitsToFloat(%s.w)' % out5, 'intBitsToFloat(zmA)')).replace(e8, e8.replace('intBitsToFloat(R11i.w)', 'intBitsToFloat(zmB)'))
        open(os.path.join(PACK, f), 'w').write(v)
    f = 'e57a8ad2ff5cb0bc_0000f0f0ff34db6d_ps.txt'
    p_src = open(os.path.join(DUMP, f)).read()
    ins = ['passParameterSem%d' % k for k in (0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11)]
    pick = ' : '.join('w < %d ? %s[w & 3]' % (4 * (i + 1), n) for i, n in enumerate(ins[:-1])) + ' : %s[w & 3]' % ins[-1]
    out = '''
// --- zelda maps water probe (G-buffer pass): its inputs (even rows) and constants (odd rows), a byte a pixel
// (red: its low 4 bits, green: its high 4; blue 9, a check) so that two-channel targets keep it ---
{
	ivec2 zp = ivec2(gl_FragCoord.xy); vec3 zn = vec3(0.0); uint u = 0u; int part = 0; bool any = false;
	if((zp.y & 1) == 0) {
		int k = zp.x % 178;
		if(k == 0) zn = vec3(5.0, 10.0, 3.0); else if(k == 1) zn = vec3(10.0, 5.0, 3.0);
		else { int w = (k - 2) / 4; part = (k - 2) - w * 4; any = true; u = floatBitsToUint(PICK); }
	} else {
		int k = zp.x % 322;
		if(k == 0) zn = vec3(5.0, 11.0, 3.0); else if(k == 1) zn = vec3(11.0, 5.0, 3.0);
		else { int w = (k - 2) / 4; part = (k - 2) - w * 4; any = true; u = uint(uf_remappedPS[w / 4][w & 3]); }
	}
	if(any) { uint b = (u >> uint(part * 8)) & 255u; zn = vec3(float(b & 15u), float(b >> 4), 9.0); }
	passPixelColor0 = vec4(zn / 16.0, 1.0); passPixelColor1 = vec4(zn / 16.0, 1.0);
	passPixelColor3 = vec4(zn / 16.0, 1.0); passPixelColor5 = vec4(zn / 16.0, 1.0);
}
'''.replace('PICK', pick)
    end = p_src.rstrip().rfind('}')
    open(os.path.join(PACK, f), 'w').write(p_src[:end] + out + p_src[end:])
    # the water's full-screen passes (PS_ALL: which one draws the pond isn't known) read the G-buffer the water
    # wrote; a capture keeps pictures as they were when it began (the G-buffer's by then overwritten), but these
    # passes' output lasts into the next frame. So each copies one of its 2D pictures, raw, into its output: the
    # picture (y / 2) % n of its n (rows in pairs, keeping the probe's even / odd rows)
    for name in PS_ALL:
        p2 = open(os.path.join(DUMP, name)).read()
        tex = re.findall(r'uniform sampler2D (textureUnitPS\d+);', p2)
        pick2 = ' : '.join('k == %d ? texelFetch(%s, clamp(zp, ivec2(0), textureSize(%s, 0) - 1), 0)' % (i, t, t) for i, t in enumerate(tex[:-1])) + \
            (' : ' if len(tex) > 1 else '') + 'texelFetch(%s, clamp(zp, ivec2(0), textureSize(%s, 0) - 1), 0)' % (tex[-1], tex[-1])
        o2 = '''
// --- zelda maps water probe: one of this pass's pictures, raw (rows in pairs: picture (y / 2) %% %d) ---
{
	ivec2 zp = ivec2(gl_FragCoord.xy); int k = (zp.y >> 1) %% %d;
	vec4 zt = %s;
	passPixelColor0 = vec4(zt.rgb, 1.0);
}
''' % (len(tex), len(tex), pick2)
        e2 = p2.rstrip().rfind('}')
        open(os.path.join(PACK, name), 'w').write(p2[:e2] + o2 + p2[e2:])
        print(name, len(tex), 'pictures:', ', '.join(tex))


if GBUFFER:
    gbuffer()
    sys.exit()
if PS_ONLY:
    for old in os.listdir(PACK):
        if old.endswith('.txt') and old != 'rules.txt': os.remove(os.path.join(PACK, old))
    ps = open(os.path.join(DUMP, PS)).read()
    end = ps.rstrip().rfind('}')
    open(os.path.join(PACK, PS), 'w').write(ps[:end] + OUT_PS_ONLY + ps[end:])
A_OUT = 'layout(location = 2) out vec4 passParameterSem6;'
A_ATTR = 'R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));'
TAIL_VS = '\n// --- zelda maps water probe: its two outputs carry the raw vertex (read flat) ---\npassParameterSem4 = zmA;\npassParameterSem6 = zmB;\n'
vs = open(os.path.join(DUMP, VS)).read()
assert A_OUT in vs and A_ATTR in vs
vs = vs.replace(A_OUT, A_OUT + DECL_VS).replace(A_ATTR, A_ATTR + SET_VS, 1)
end = vs.rstrip().rfind('}')
vs = vs[:end] + TAIL_VS + vs[end:]
for i, name in enumerate(PS_ALL):
    p_src = open(os.path.join(DUMP, name)).read()
    for sem in ('passParameterSem4', 'passParameterSem6'):
        a = 'in vec4 %s;' % sem
        assert a in p_src
        p_src = p_src.replace(a, 'flat in vec4 %s;' % sem)
    out = OUT_PS.replace('vec3(5.0, 10.0, 3.0)', 'vec3(5.0, 10.0, %d.0)' % (3 + i)).replace('vec3(5.0, 10.0, 4.0)', 'vec3(5.0, 11.0, %d.0)' % (3 + i))
    if 'uf_remappedPS' not in p_src: out = out.replace('u = uint(uf_remappedPS[w / 4][w & 3]);', 'u = 0u;')
    else:
        n = int(p_src.split('uniform ivec4 uf_remappedPS[')[1].split(']')[0])
        out = out.replace('u = uint(uf_remappedPS[w / 4][w & 3]);', 'u = w / 4 < %d ? uint(uf_remappedPS[w / 4][w & 3]) : 0u;' % n)
    end = p_src.rstrip().rfind('}')
    open(os.path.join(PACK, name), 'w').write(p_src[:end] + out + p_src[end:])
if not PS_ONLY:
    open(os.path.join(PACK, VS), 'w').write(vs)
    # the dump's twin of the water vertex shader (7af8fda99eae0289, the same code: the pond uses it), patched alike
    # (it reads Sem8 as two half floats, not two 16-bit fractions: patched from its own code)
    v2 = open(os.path.join(DUMP, VS2)).read()
    for a, b in ((A_OUT, A_OUT + DECL_VS), (A_ATTR, A_ATTR + SET_VS)):
        assert a in v2
        v2 = v2.replace(a, b, 1)
    e2 = v2.rstrip().rfind('}')
    v2 = v2[:e2] + TAIL_VS + v2[e2:]
    open(os.path.join(PACK, VS2), 'w').write(v2)
open(os.path.join(PACK, 'rules.txt'), 'w').write('''[Definition]
titleIds = 00050000101C9300,00050000101C9400,00050000101C9500
name = Zelda Maps water probe
path = "The Legend of Zelda: Breath of the Wild/Debug/Zelda Maps water probe"
description = Writes the water's vertex data into the picture for Zelda Maps to read (development only).
version = 8
''')
print('water probe pack written to', PACK)
