#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

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
// shader c580a12764680547
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[9];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(8, 1, 4) uniform sampler2DArray textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 5) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(11, 1, 6) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 7) uniform sampler2D textureUnitPS12;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
// end of shader inputs/outputs
int clampFI32(int v)
{
if( v == 0x7FFFFFFF )
	return floatBitsToInt(1.0);
else if( v == 0xFFFFFFFF )
	return floatBitsToInt(0.0);
return floatBitsToInt(clamp(intBitsToFloat(v), 0.0, 1.0));
}
float mul_nonIEEE(float a, float b){ if( a == 0.0 || b == 0.0 ) return 0.0; return a*b; }
void main()
{
ivec4 R0i = ivec4(0);
ivec4 R1i = ivec4(0);
ivec4 R2i = ivec4(0);
ivec4 R3i = ivec4(0);
ivec4 R4i = ivec4(0);
ivec4 R5i = ivec4(0);
ivec4 R6i = ivec4(0);
ivec4 R7i = ivec4(0);
ivec4 R8i = ivec4(0);
ivec4 R9i = ivec4(0);
ivec4 R10i = ivec4(0);
ivec4 R11i = ivec4(0);
ivec4 R12i = ivec4(0);
ivec4 R13i = ivec4(0);
ivec4 R14i = ivec4(0);
ivec4 R15i = ivec4(0);
ivec4 R16i = ivec4(0);
ivec4 R17i = ivec4(0);
ivec4 R18i = ivec4(0);
ivec4 R19i = ivec4(0);
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
ivec4 R125i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem6);
R18i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R4i.w = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 2.0 + -(1.0));
R126i.y = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
PV0iz = floatBitsToInt(intBitsToFloat(R18i.w) * 255.0);
R124i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedPS[0].w)) + 1.0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R20i.y = int(intBitsToFloat(PV0iz));
// 2
PV0ix = R20i.y >> 0x5;
R7i.y = 0;
R127i.z = 0x358637bd;
R125i.w = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R4i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R126i.x = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
PV1iy = floatBitsToInt(max(intBitsToFloat(R18i.y), intBitsToFloat(R18i.z)));
R10i.z = floatBitsToInt(roundEven(0.0));
R127i.w = PV0ix & 0x7;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
R12i.x = floatBitsToInt(max(intBitsToFloat(R18i.x), intBitsToFloat(PV1iy)));
R4i.y = R20i.y & 0x1c;
R9i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].x)), intBitsToFloat(PS1i)));
R7i.w = 0;
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(R4i.w));
// 5
backupReg0i = R127i.w;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.z)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.z)), intBitsToFloat(uf_remappedPS[1].y)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].x) + intBitsToFloat(R9i.z));
PS1i = floatBitsToInt(float(backupReg0i));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.z));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) + -2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.y));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 8
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.y) * 10.0);
R127i.w = floatBitsToInt(max(intBitsToFloat(R127i.x), -(intBitsToFloat(R127i.x))));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedPS[3].x)));
PV1iz = floatBitsToInt(min(intBitsToFloat(R5i.x), 2.0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
// 10
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) * 6.0);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(max(intBitsToFloat(R126i.y), -(intBitsToFloat(R126i.y))));
PV0iw = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(PV1ix)));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iw)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e4ccccd));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
R127i.x = R5i.x;
R127i.x = clampFI32(R127i.x);
// 13
R9i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0ix));
R9i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PS1i = R127i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.x));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R125i.w));
PV0iy = clampFI32(PV0iy);
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.x));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.y));
R4i.z = floatBitsToInt(intBitsToFloat(R127i.x) * 3.0);
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV0ix));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R9i.z)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R9i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iy));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R126i.z)));
// 16
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(R0i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(R0i.y));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R1i.z));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R1i.w));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R8i.z)) + intBitsToFloat(R1i.z));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.y),intBitsToFloat(R11i.z),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.y),intBitsToFloat(R11i.z),intBitsToFloat(R9i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R8i.w)) + intBitsToFloat(R1i.w));
// 18
R3i.x = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(0x2edbe6ff));
R12i.y = floatBitsToInt(intBitsToFloat(R5i.x) * 6.0);
R12i.y = clampFI32(R12i.y);
R3i.z = R20i.y & 0x2;
PV0iw = floatBitsToInt(min(intBitsToFloat(R18i.y), intBitsToFloat(R18i.z)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 19
R11i.x = floatBitsToInt(intBitsToFloat(0x3df5c28f) * intBitsToFloat(uf_remappedPS[1].z));
R6i.y = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3dcccccd) + 1.0);
R6i.z = floatBitsToInt(min(intBitsToFloat(R18i.x), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 20
backupReg0i = R4i.y;
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PS1i)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS1i)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1iw)));
R6i.x = floatBitsToInt(float(backupReg0i));
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(uf_remappedPS[6].w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(uf_remappedPS[6].w)));
R14i.z = R5i.x;
R14i.z = floatBitsToInt(intBitsToFloat(R14i.z) * 4.0);
R14i.z = clampFI32(R14i.z);
R16i.w = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x3d124925));
R16i.y = floatBitsToInt(float(R3i.z));
R16i.y = floatBitsToInt(intBitsToFloat(R16i.y) / 2.0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R7i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R7i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(uf_remappedPS[6].w)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R4i.y),intBitsToFloat(R12i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R126i.x = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R124i.x)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R11i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R11i.w = clampFI32(R11i.w);
R124i.y = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R125i.y)));
// 4
R125i.x = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R8i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R4i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R12i.z) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R125i.z)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R11i.w)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R12i.z));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R127i.x = floatBitsToInt(intBitsToFloat(PS1i) * 8.0);
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),-(intBitsToFloat(R16i.y))) + intBitsToFloat(R16i.w));
R13i.w = floatBitsToInt(intBitsToFloat(R6i.y) * 75.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(intBitsToFloat(0x3ff33333) * intBitsToFloat(R12i.x) + intBitsToFloat(0x3dcccccd));
R6i.x = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R6i.w = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * 6.0);
R124i.y = floatBitsToInt(intBitsToFloat(R4i.w) * 4.0 + -3.0);
R124i.y = clampFI32(R124i.y);
R15i.z = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
R14i.w = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R15i.w = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
R4i.w = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R16i.z = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R4i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
R6i.y = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R6i.y = clampFI32(R6i.y);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R125i.z)),-(intBitsToFloat(R7i.w)))));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R10i.w = tempi.x;
R125i.z = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R17i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R16i.z)) + 1.0);
// 16
PV0ix = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R3i.y = floatBitsToInt(min(intBitsToFloat(R125i.z), 1.0));
R6i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) * 5.0 + 5.0);
R6i.z = clampFI32(R6i.z);
PV0iw = floatBitsToInt(-(intBitsToFloat(R17i.y)) + 1.0);
PV0iw = clampFI32(PV0iw);
R13i.y = floatBitsToInt(intBitsToFloat(R17i.y) + intBitsToFloat(R124i.w));
R13i.y = clampFI32(R13i.y);
// 17
R4i.x = floatBitsToInt(intBitsToFloat(R124i.y) + -(0.5));
R4i.x = floatBitsToInt(intBitsToFloat(R4i.x) * 4.0);
R4i.x = clampFI32(R4i.x);
R14i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].x) + -(intBitsToFloat(R15i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(PV0iw)));
R12i.w = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
R15i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].y) + -(intBitsToFloat(R14i.w)));
// 18
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].z) + -(intBitsToFloat(R15i.w)));
R11i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 3.0);
R11i.y = clampFI32(R11i.y);
PV0iz = backupReg0i;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iz = clampFI32(PV0iz);
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(R3i.y)));
tempResultf = max(0.0, intBitsToFloat(R12i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 19
R3i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.25);
R8i.y = floatBitsToInt(-(intBitsToFloat(R17i.y)) * 3.0 + 3.0);
R5i.z = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f19999a));
R7i.w = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(0x3f4ccccd));
R7i.w = clampFI32(R7i.w);
R19i.w = floatBitsToInt(intBitsToFloat(R18i.x) + -(intBitsToFloat(R12i.x)));
// 0
backupReg0i = R7i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(R3i.z)));
R7i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 5.0);
R7i.y = clampFI32(R7i.y);
PV0iz = floatBitsToInt(intBitsToFloat(R17i.y) + intBitsToFloat(0x2edbe6ff));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R5i.z)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R4i.z)) + intBitsToFloat(R0i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R4i.z)) + intBitsToFloat(R0i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
R0i.w = floatBitsToInt(intBitsToFloat(R7i.w) + -(1.0));
R8i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
R9i.y = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y))).x);
R8i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))).x);
R21i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyzw);
R9i.x = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R19i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z))).xyz);
R10i.xyz = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyz);
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R1i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R8i.w)) + intBitsToFloat(uf_remappedPS[0].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R9i.y)) + intBitsToFloat(uf_remappedPS[0].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.w), intBitsToFloat(R6i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R1i.w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R3i.w)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R124i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R7i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)), intBitsToFloat(R7i.x)));
// 2
backupReg0i = R124i.y;
R124i.x = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(-(intBitsToFloat(R11i.z)) + intBitsToFloat(PV1ix));
R125i.z = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)), intBitsToFloat(R5i.w)));
R127i.x = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(PS1i));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R4i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R124i.w = tempi.x;
R126i.y = floatBitsToInt(-(intBitsToFloat(R11i.z)) + intBitsToFloat(PV0iw));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(R124i.y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(R125i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R9i.x)) + intBitsToFloat(uf_remappedPS[0].x));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.w),0.0)));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -0.75);
// 6
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R4i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
PS0i = floatBitsToInt(-(intBitsToFloat(R125i.w)));
// 7
R124i.x = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(PS0i));
R0i.y = floatBitsToInt(intBitsToFloat(R125i.z) * 16.0);
R0i.y = clampFI32(R0i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)), intBitsToFloat(R125i.x)));
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.x)),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.x));
// 8
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(PV1iw));
R126i.y = floatBitsToInt(-(intBitsToFloat(R11i.z)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R126i.x)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.z));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R6i.w)));
R11i.z = clampFI32(R11i.z);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R123i.z),intBitsToFloat(R123i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R123i.z),intBitsToFloat(R123i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.y));
PS1i = floatBitsToInt(tempResultf);
// 10
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e99999a) + intBitsToFloat(0xbecccccd));
R125i.y = floatBitsToInt(intBitsToFloat(R21i.x) + intBitsToFloat(0xbecccccd));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
R6i.w = floatBitsToInt(intBitsToFloat(R18i.y) + -(intBitsToFloat(R12i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(tempResultf);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R4i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3c23d70a));
PS1i = clampFI32(PS1i);
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R124i.x));
R127i.w = floatBitsToInt(intBitsToFloat(R11i.z) + intBitsToFloat(R4i.w));
R127i.w = clampFI32(R127i.w);
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R6i.y)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.z)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) * 10.0);
PV0ix = clampFI32(PV0ix);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R3i.y)) + intBitsToFloat(0xbecccccd));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R10i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R124i.w)));
PV1ix = clampFI32(PV1ix);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R125i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 75.0);
PV1iz = clampFI32(PV1iz);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.y), intBitsToFloat(PV0ix)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) * 75.0);
R127i.y = clampFI32(R127i.y);
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R12i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(PV1ix)));
R124i.y = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(R0i.y)));
R124i.y = clampFI32(R124i.y);
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + -(1.0));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(0xbe0f5c29));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(0xbe0f5c29));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R13i.w)));
R127i.w = clampFI32(R127i.w);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R125i.w)));
R125i.w = clampFI32(R125i.w);
// 18
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R124i.y)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) * 70.0);
PV0iy = clampFI32(PV0iy);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R127i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(0xbecccccd));
PS0i = floatBitsToInt(intBitsToFloat(R123i.z) * 70.0);
PS0i = clampFI32(PS0i);
// 19
backupReg0i = R127i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),-(intBitsToFloat(R11i.y))) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f333333));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * 75.0);
PV1iz = clampFI32(PV1iz);
R127i.w = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(backupReg0i));
R127i.z = clampFI32(R127i.z);
// 20
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1iz)));
R8i.x = floatBitsToInt(intBitsToFloat(R8i.x) * 2.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(R127i.x));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R13i.y)));
R13i.w = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R126i.w));
R13i.w = clampFI32(R13i.w);
R11i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e19999a));
// 21
backupReg0i = R14i.y;
backupReg1i = R15i.z;
backupReg2i = R14i.w;
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R127i.z)) + intBitsToFloat(R125i.z));
R14i.y = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
R15i.z = floatBitsToInt(intBitsToFloat(R127i.w) * 40.0);
R15i.z = clampFI32(R15i.z);
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R13i.w)) + intBitsToFloat(backupReg1i));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(R13i.w)) + intBitsToFloat(backupReg2i));
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R11i.z) + intBitsToFloat(R14i.y));
R127i.x = clampFI32(R127i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R13i.w)) + intBitsToFloat(R15i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R11i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R11i.x)));
PS0i = floatBitsToInt(intBitsToFloat(R15i.z) * 8.0);
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w), intBitsToFloat(uf_remappedPS[8].x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.w), intBitsToFloat(PS0i)));
R124i.y = clampFI32(R124i.y);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),intBitsToFloat(R16i.y)) + intBitsToFloat(PV0iw));
R125i.z = clampFI32(R125i.z);
PV1iw = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x3e4ccccd));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedPS[8].y)));
// 2
backupReg0i = R126i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedPS[8].z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),-(intBitsToFloat(R125i.z))) + intBitsToFloat(R2i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
R123i.z = clampFI32(R123i.z);
PV0iw = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3da3d70a));
PS0i = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3da3d70a));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R2i.x));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3da3d70a));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R2i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R3i.x)) + intBitsToFloat(R123i.z));
R127i.w = clampFI32(R127i.w);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R7i.y)) + 1.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(R2i.z));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R17i.y)),intBitsToFloat(R127i.w)) + intBitsToFloat(R17i.y));
R123i.x = clampFI32(R123i.x);
PV1iy = ((intBitsToFloat(PV0ix) > 0.0)?-1:0);
R124i.z = floatBitsToInt(intBitsToFloat(R18i.z) + -(intBitsToFloat(R12i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R0i.z)) + intBitsToFloat(R12i.x));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R8i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R123i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), intBitsToFloat(R125i.z)));
R123i.w = ((PV1iy == 0)?(0):(PS1i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.y)));
// 7
backupReg0i = R125i.x;
backupReg1i = R124i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R123i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.z)) + intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(backupReg1i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(backupReg1i)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R12i.x));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R12i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(R12i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iz));
R125i.z = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(R127i.y));
// 9
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R124i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(0xba0a8ec8));
R123i.z = clampFI32(R123i.z);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(0xba0a8ec8));
R122i.x = clampFI32(R122i.x);
// 10
PV0ix = R20i.y & int(1);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R122i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.z), intBitsToFloat(R21i.z)));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
PS1i = floatBitsToInt(float(PV0ix));
// 12
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R10i.x));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R20i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R125i.x)));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R10i.y));
// 13
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R10i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
}
