#!/usr/bin/env python3
"""A Cemu graphic pack that makes BotW write out the constants its shaders get
(the sun, the fog, the matrices: uf_remappedPS) so we can read the game's own
numbers instead of guessing them.

For each pixel shader dumped (Debug > Dump > Shaders) that has constants, it
adds at the end a row of pixels (row = the shader's probe id, 1..255) into each
image it draws: a marker (5, 10, 3) / 16, the row, the count, then every 32-bit
constant as 4-bit pieces, three pixels apiece (red, green, blue = 4 bits each,
the last pixel's blue a check, 9). Values j / 16 come back exactly from every
format the game draws into: 8-bit and sRGB, 10-bit, half float, and the packed
11/11/10 float.

A frame capture keeps each image as it was when the capture began, and the
lighting passes draw into short-lived buffers, so every pixel shader also
carries rows through: in the probe area (rows 1..255, x < 400) it copies a row
it finds in any of its input images into its own, and leaves the rest of the
area as it was (discard), so the rows reach the frame's final image. That
corner looks broken in the game while the pack is on. A frame capture then
holds them (tools/cemu_capture.py), and read_probe.py reads them back.

python3 build_probe_pack.py <Cemu dump/shaders folder> <pack folder> [<hash>...]
"""
import json, os, re, sys

DUMP, PACK = sys.argv[1:3]
HASHES = sys.argv[3:]   # none: every pixel shader dumped
os.makedirs(PACK, exist_ok=True)

OWN = r'''
			if(zp.y == %(row)d && zp.x < 400) {
				zmine = true; vec3 zn;
				int k = zp.x;
				if(k == 0) zn = vec3(5.0, 10.0, 3.0);
				else if(k == 1) zn = vec3(float(%(row)d & 15), float((%(row)d >> 4) & 15), 12.0);
				else if(k == 2) zn = vec3(float(%(n)d & 15), float(%(n)d >> 4), 6.0);
				else if(k < 3 + %(n)d * 12) {
					int f = (k - 3) / 3, part = (k - 3) - f * 3;
					uint u = uint(%(arr)s[f / 4][f - (f / 4) * 4]);
					uint a = (u >> uint(part * 12)) & 4095u;
					zn = part < 2 ? vec3(float(a & 15u), float((a >> 4) & 15u), float((a >> 8) & 15u))
					              : vec3(float(a & 15u), float((a >> 4) & 15u), 9.0);
				} else zn = vec3(0.0);
				zo = vec4(zn / 16.0, 1.0);
			}
'''
# A second stretch of the shader's row (x 400..639): its inputs at this pixel
# (passParameterSemN), then each 2D image it reads: its size and the value at
# its centre, as floats like the constants (marker 5, 10, 4; then the count).
EXTRA = r'''
			if(zp.y == %(row)d && zp.x >= 400) {
				zmine = true; vec3 zn; float zv[%(m)d];
%(fill)s
				int k = zp.x - 400;
				if(k == 0) zn = vec3(5.0, 10.0, 4.0);
				else if(k == 1) zn = vec3(float(%(row)d & 15), float((%(row)d >> 4) & 15), 12.0);
				else if(k == 2) zn = vec3(float(%(m)d & 15), float(%(m)d >> 4), 6.0);
				else if(k < 3 + %(m)d * 3) {
					int f = (k - 3) / 3, part = (k - 3) - f * 3;
					uint u = floatBitsToUint(zv[f]);
					uint a = (u >> uint(part * 12)) & 4095u;
					zn = part < 2 ? vec3(float(a & 15u), float((a >> 4) & 15u), float((a >> 8) & 15u))
					              : vec3(float(a & 15u), float((a >> 4) & 15u), 9.0);
				} else zn = vec3(0.0);
				zo = vec4(zn / 16.0, 1.0);
			}
'''
COPY = r'''
			if(!zmine && !zgot) {
				vec4 zm0 = texelFetch(%(s)s, ivec2(0, zp.y), 0), zm1 = texelFetch(%(s)s, ivec2(1, zp.y), 0);
				if(all(equal(round(zm0.rgb * 16.0), vec3(5.0, 10.0, 3.0))) && round(zm1.b * 16.0) == 12.0) { zo = texelFetch(%(s)s, zp, 0); zgot = true; }
			}
'''
PROBE = r'''
	// --- zelda maps probe: constants into a pixel row, and rows carried through ---
	{
		ivec2 zp = ivec2(gl_FragCoord.xy);
		if(zp.y >= 1 && zp.y <= 255 && zp.x < 640) {
			bool zmine = false, zgot = false; vec4 zo = vec4(0.0);
%(own)s%(extra)s%(copies)s
			if(!zmine && !zgot) discard;   // keep the row already there
%(writes)s
		}
	}
'''

names = sorted(os.listdir(DUMP))
files = [next((n for n in names if n.startswith(h + '_') and n.endswith('.txt')), None) for h in HASHES] if HASHES else \
        [n for n in names if n.endswith('_ps.txt')]
for old in os.listdir(PACK):
    if old.endswith('.txt') and old != 'rules.txt': os.remove(os.path.join(PACK, old))
done, index, row = [], {}, 0
for f in files:
    if not f: continue
    src = open(os.path.join(DUMP, f)).read()
    outs = sorted(set(re.findall(r'out vec4 (passPixelColor\d+)', src)))
    if not outs: continue
    samplers = re.findall(r'uniform sampler2D (textureUnitPS\d+);', src)
    m = re.search(r'uniform ivec4 (uf_remapped[PV]S)\[(\d+)\]', src)
    own = extra = ''
    if m and row < 255:
        row += 1; index[row] = f
        own = OWN % dict(row=row, n=int(m.group(2)), arr=m.group(1))
        ins = sorted(set(re.findall(r'in vec4 (passParameterSem\d+);', src)), key=lambda x: int(x[16:]))
        vals = []
        for i in ins: vals += ['%s.%s' % (i, c) for c in 'xyzw']
        for sm in samplers:
            if len(vals) + 6 > 79: break
            vals += ['float(textureSize(%s, 0).x)' % sm, 'float(textureSize(%s, 0).y)' % sm]
            vals += ['textureLod(%s, vec2(0.5), 0.0).%s' % (sm, c) for c in 'xyzw']
        vals = vals[:79]
        if vals:
            fill = '\n'.join('\t\t\t\tzv[%d] = %s;' % (i, v) for i, v in enumerate(vals))
            extra = EXTRA % dict(row=row, m=len(vals), fill=fill)
            index[str(row) + 'x'] = dict(inputs=ins, samplers=[sm for sm in samplers][:max(0, (len(vals) - 4 * len(ins)) // 6)], values=len(vals))
    copies = ''.join(COPY % dict(s=sm) for sm in samplers)
    if not own and not copies: continue
    writes = '\n'.join('\t\t\t%s = zo;' % o for o in outs)
    end = src.rstrip().rfind('}')
    open(os.path.join(PACK, f), 'w').write(src[:end] + PROBE % dict(own=own, extra=extra, copies=copies, writes=writes) + src[end:])
    done.append(f)

json.dump(index, open(os.path.join(PACK, 'probe-index.json'), 'w'), indent=0)
open(os.path.join(PACK, 'rules.txt'), 'w').write('''[Definition]
titleIds = 00050000101C9300,00050000101C9400,00050000101C9500
name = Zelda Maps probe
path = "The Legend of Zelda: Breath of the Wild/Debug/Zelda Maps probe"
description = Writes the game's shader constants into a row of pixels for Zelda Maps to read (development only).
version = 7
''')
print(len(done), 'shaders patched,', len(index), 'with their own row (probe-index.json)')
