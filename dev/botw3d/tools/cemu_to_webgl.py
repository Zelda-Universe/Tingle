#!/usr/bin/env python3
"""BotW's own shaders, as Cemu dumps them (GLSL 4.30 for Vulkan / OpenGL),
turned into WebGL 2 (GLSL ES 3.00) as they are, to run in the browser: the
game's maths untouched, only what WebGL lacks or spells differently changed.

- the header: #version 300 es, precision, Cemu's OpenGL path (not Vulkan's);
- layout qualifiers WebGL can't take (bindings, input locations) dropped;
- cube map arrays (WebGL has none) become 2D arrays, six layers per cube, in
  three's face order, sampled through zmCube() from the face and the face
  coordinates the shader works out itself (redcCUBE);
- textureGather (WebGL has none) read as four exact texels (zmGather);
- the vertex shaders' gl_PerVertex block and noperspective (WebGL has
  neither) dropped;
- C-style float suffixes and int literals too big for int fixed.

The uniforms keep their names (uf_remappedPS, uf_fragCoordScale,
textureUnitPSn), the inputs theirs (passParameterSemN), the outputs theirs
(passPixelColorN).

python3 cemu_to_webgl.py <dumped shader .txt> [> out.glsl]
"""
import re, sys

HEADER = '''#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
'''

# textureGather (WebGL 2 has none): the four texels round uv, in GL's order
# (i0 j1, i1 j1, i1 j0, i0 j0), one component, read exactly.
GATHER = '''
vec4 zmGather(sampler2D s, vec2 uv, int c) {
	vec2 sz = vec2(textureSize(s, 0)); vec2 p = uv * sz - 0.5; ivec2 i = ivec2(floor(p));
	ivec2 m = textureSize(s, 0) - 1;
	vec4 a = texelFetch(s, clamp(i + ivec2(0, 1), ivec2(0), m), 0), b = texelFetch(s, clamp(i + ivec2(1, 1), ivec2(0), m), 0);
	vec4 d = texelFetch(s, clamp(i + ivec2(1, 0), ivec2(0), m), 0), e = texelFetch(s, clamp(i, ivec2(0), m), 0);
	return vec4(a[c], b[c], d[c], e[c]);
}
vec4 zmGather(sampler2DArray s, vec3 uv, int c) {
	ivec3 t = textureSize(s, 0); vec2 p = uv.xy * vec2(t.xy) - 0.5; ivec2 i = ivec2(floor(p)); ivec2 m = t.xy - 1; int l = int(uv.z + 0.5);
	vec4 a = texelFetch(s, ivec3(clamp(i + ivec2(0, 1), ivec2(0), m), l), 0), b = texelFetch(s, ivec3(clamp(i + ivec2(1, 1), ivec2(0), m), l), 0);
	vec4 d = texelFetch(s, ivec3(clamp(i + ivec2(1, 0), ivec2(0), m), l), 0), e = texelFetch(s, ivec3(clamp(i, ivec2(0), m), l), 0);
	return vec4(a[c], b[c], d[c], e[c]);
}
'''

# A cube of a cube map array, as six layers of a 2D array (face order +x -x +y -y +z -z,
# as the shader's own faceId), at the face coordinates redcCUBE gives (each 1..2, the
# middle 1.5). cubeIndex picks the cube.
CUBE = '''
vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
'''


def calls(text, name):
    """(start, end, [args]) for each call name(...) in text, parentheses matched."""
    i = 0
    while True:
        i = text.find(name + '(', i)
        if i < 0: return
        if i > 0 and (text[i - 1].isalnum() or text[i - 1] == '_'): i += 1; continue
        j, depth, args, cur = i + len(name) + 1, 1, [], ''
        while depth:
            ch = text[j]
            if ch == '(': depth += 1
            elif ch == ')': depth -= 1
            if depth == 1 and ch == ',': args.append(cur); cur = ''
            elif depth: cur += ch
            j += 1
        args.append(cur)
        yield i, j, [a.strip() for a in args]
        i = j


def replace_calls(text, name, fn):
    out, last = [], 0
    for a, b, args in list(calls(text, name)):
        r = fn(args)
        if r is None: continue
        out.append(text[last:a]); out.append(r); last = b
    out.append(text[last:])
    return ''.join(out)


def convert(src):
    out = re.sub(r'\bnoperspective\s+', '', src)
    out = re.sub(r'#version \d+[^\n]*\n', '', out)
    out = re.sub(r'#extension [^\n]*\n', '', out)
    # Cemu's Vulkan / OpenGL switch: keep OpenGL's
    out = re.sub(r'#ifdef VULKAN\n.*?#else\n(.*?)#endif\n', r'\1', out, flags=re.S)
    out = re.sub(r'#define TEXTURE_LAYOUT\([^)]*\)[^\n]*\n', '#define TEXTURE_LAYOUT(a, b, c)\n', out)
    out = re.sub(r'#define UNIFORM_BUFFER_LAYOUT\([^)]*\)[^\n]*\n', '#define UNIFORM_BUFFER_LAYOUT(a, b, c)\n', out)
    out = re.sub(r'#define ATTR_LAYOUT\([^)]*\)[^\n]*\n', '#define ATTR_LAYOUT(a, b)\n', out)
    out = re.sub(r'layout\(location = \d+\) in ', 'in ', out)
    out = re.sub(r'layout\(binding = \d+\)\s*', '', out)
    out = re.sub(r'layout\(binding = \d+, std140\)\s*', 'layout(std140) ', out)
    # cube map arrays -> 2D arrays (six layers a cube)
    cubes = re.findall(r'uniform samplerCubeArray (\w+);', out)
    out = re.sub(r'uniform samplerCubeArray (\w+);', r'uniform sampler2DArray \1;', out)
    def cube_lookup(args, lod):
        if args[0] not in cubes or not args[1].startswith('vec4(redcCUBEReverse('): return None
        inner = list(calls(args[1], 'vec4'))[0][2]          # [redcCUBEReverse(st, face), index]
        st, face = list(calls(inner[0], 'redcCUBEReverse'))[0][2]
        return 'zmCube(%s, %s, %s, %s, %s)' % (args[0], st, face, inner[1], lod(args))
    out = replace_calls(out, 'textureLod', lambda a: cube_lookup(a, lambda a: a[2]))
    out = replace_calls(out, 'texture', lambda a: cube_lookup(a, lambda a: '0.0'))
    gather = 'textureGather(' in out
    out = replace_calls(out, 'textureGather', lambda a: 'zmGather(%s, %s, %s)' % (a[0], a[1], a[2] if len(a) > 2 else '0'))
    out = re.sub(r'out gl_PerVertex\s*\{[^}]*\};', '', out)
    out = re.sub(r'layout\(location = \d+\) out (?=\w+ passParameter)', 'out ', out)   # vertex outputs: matched by name
    out = re.sub(r'layout\(set = \d+, binding = \d+(?:, std140)?\)\s*', '', out)
    # desktop GLSL's implicit int -> float conversions, written out (as Cemu's code runs there)
    out = replace_calls(out, 'floatBitsToInt', lambda a: 'vec4(floatBitsToInt(vec4(%s)))' % a[0] if a[0].startswith('ivec4(') else None)
    # the vertex attributes are unsigned: their bit masks too (desktop GLSL converts them)
    def unsigned(l):
        if 'attrDecoder' not in l: return l
        l = re.sub(r'([&|^]=?\s*\(?\s*)(0x[0-9a-fA-F]+)(?![uU0-9a-fA-F])', r'\1\2u', l)   # masks
        l = re.sub(r'((?:!=|==)\s*)(\d+|0x[0-9a-fA-F]+)(?![uU0-9a-fA-Fx])', r'\1\2u', l)    # comparisons
        m = re.match(r'(\s*attrDecoder(?:\.([xyzw]{1,4}))?\s*=\s*)(.*);\s*$', l)          # assignments into it
        if m and not m.group(3).startswith('attrData'):
            n = len(m.group(2)) if m.group(2) else 4
            l = '%s%s(%s);' % (m.group(1), 'uint' if n == 1 else 'uvec%d' % n, m.group(3))
        return l
    out = '\n'.join(unsigned(l) for l in out.split('\n'))
    # literals: 1.0F -> 1.0; int(0xFFFFFFFF) -> int(0xFFFFFFFFu)
    out = re.sub(r'(\d\.?\d*(?:[eE][+-]?\d+)?)F\b', r'\1', out)
    out = re.sub(r'int\((0x[0-9a-fA-F]{8})\)', r'int(\1u)', out)
    head = HEADER + (CUBE if cubes else '') + (GATHER if gather else '')
    return head + out


if __name__ == '__main__':
    print(convert(open(sys.argv[1]).read()))
