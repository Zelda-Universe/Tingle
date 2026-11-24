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
// shader 7c6e02daf538f23e
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
ivec4 R22i = ivec4(0);
ivec4 R23i = ivec4(0);
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
R9i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R5i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R4i.w = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R6i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
PV0iy = floatBitsToInt(intBitsToFloat(R9i.w) * 255.0);
R127i.z = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
R125i.w = floatBitsToInt(intBitsToFloat(R5i.z) * 2.0 + -(1.0));
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedPS[0].w)) + 1.0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R22i.z = int(intBitsToFloat(PV0iy));
// 2
PV0ix = R22i.z >> 0x5;
R7i.y = 0;
R126i.z = 0x358637bd;
R4i.w = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R8i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R4i.x = 0;
R4i.y = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
R12i.z = floatBitsToInt(roundEven(0.0));
R127i.w = PV0ix & 0x7;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R5i.w)));
R15i.y = floatBitsToInt(intBitsToFloat(0x3df5c28f) * intBitsToFloat(uf_remappedPS[1].z));
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].x)), intBitsToFloat(PS1i)));
R5i.w = floatBitsToInt(max(intBitsToFloat(R9i.y), intBitsToFloat(R9i.z)));
R124i.w = floatBitsToInt(1.0 / intBitsToFloat(R8i.y));
// 5
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R124i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].x) + intBitsToFloat(R8i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.z)), intBitsToFloat(uf_remappedPS[1].y)));
PS1i = floatBitsToInt(float(R127i.w));
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) + -2.0);
R5i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.w));
R126i.y = floatBitsToInt(max(intBitsToFloat(R125i.z), -(intBitsToFloat(R125i.z))));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.x) * 10.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[3].x)));
PV1iz = floatBitsToInt(min(intBitsToFloat(R6i.z), 2.0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(max(intBitsToFloat(R127i.y), -(intBitsToFloat(R127i.y))));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(PV1iw)));
R124i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 6.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
PV0iw = floatBitsToInt(max(intBitsToFloat(R126i.x), -(intBitsToFloat(R126i.x))));
R126i.w = R6i.z;
R126i.w = clampFI32(R126i.w);
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(R125i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.y)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iw)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e4ccccd));
PV0iz = R126i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.y)));
R125i.y = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PS1i)));
// 13
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R0i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R0i.y));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
R11i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iw));
R11i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iy));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(R125i.y)));
R6i.y = floatBitsToInt(intBitsToFloat(R126i.w) * 3.0);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R8i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R125i.y));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R8i.z)));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R4i.y));
PV1ix = clampFI32(PV1ix);
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R1i.z));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R4i.w));
PV1iw = clampFI32(PV1iw);
R127i.x = floatBitsToInt(intBitsToFloat(R6i.z) * 6.0);
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(PV1ix));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(R1i.w));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R11i.w)) + intBitsToFloat(R1i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3e4ccccd));
PS0i = clampFI32(PS0i);
// 17
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.y));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.x)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(R1i.w));
R20i.z = floatBitsToInt(max(intBitsToFloat(R9i.x), intBitsToFloat(R5i.w)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.z),intBitsToFloat(R14i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.z),intBitsToFloat(R14i.y),intBitsToFloat(R8i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.x = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x3dcccccd) + 1.0);
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 20
R3i.x = floatBitsToInt(min(intBitsToFloat(R9i.y), intBitsToFloat(R9i.z)));
R3i.y = floatBitsToInt(intBitsToFloat(R20i.z) + intBitsToFloat(0x2edbe6ff));
R14i.z = R127i.x;
R14i.z = clampFI32(R14i.z);
R5i.w = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R3i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(uf_remappedPS[6].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(uf_remappedPS[6].w)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R3i.w)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(R3i.w)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R3i.w)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R7i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R7i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(uf_remappedPS[6].w)));
// 2
R127i.x = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R125i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R11i.z) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R124i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R10i.z));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R5i.w;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R8i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R11i.z));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R7i.y = floatBitsToInt(min(intBitsToFloat(backupReg0i), 1.0));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.z),intBitsToFloat(R8i.w),intBitsToFloat(R11i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R7i.w = floatBitsToInt(intBitsToFloat(R5i.x) * 75.0);
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R8i.y) * 4.0 + -3.0);
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(min(intBitsToFloat(R9i.x), intBitsToFloat(R3i.x)));
R15i.z = R6i.z;
R15i.z = floatBitsToInt(intBitsToFloat(R15i.z) * 4.0);
R15i.z = clampFI32(R15i.z);
R10i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R10i.w = clampFI32(R10i.w);
R16i.w = floatBitsToInt(1.0 / intBitsToFloat(R3i.y));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(R10i.w)) + 1.0);
R3i.y = floatBitsToInt(intBitsToFloat(R123i.x) + -(0.5));
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 4.0);
R3i.y = clampFI32(R3i.y);
R3i.z = R22i.z & 0x1c;
R15i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R16i.w)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(R10i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.z = floatBitsToInt(tempResultf);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
R124i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3ecccccd));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
R125i.z = floatBitsToInt(intBitsToFloat(PS1i) * 8.0);
R124i.w = R6i.z;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R124i.w = clampFI32(R124i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R126i.w = R22i.z & 0x2;
R6i.z = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.x = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.w),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.y = floatBitsToInt(tempResultf);
// 12
backupReg0i = R4i.x;
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R127i.y)),-(intBitsToFloat(R124i.z)),-(intBitsToFloat(backupReg0i)))));
R4i.x = clampFI32(R4i.x);
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) * 12.0);
R5i.x = floatBitsToInt(exp2(intBitsToFloat(R124i.x)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R6i.w = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.z),intBitsToFloat(R8i.w),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R8i.x = clampFI32(R8i.x);
// 16
R15i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
PV0iy = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R5i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)) * 5.0 + 5.0);
R5i.z = clampFI32(R5i.z);
R12i.w = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
tempResultf = max(0.0, intBitsToFloat(R20i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 17
R11i.x = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R5i.y = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
R17i.z = floatBitsToInt(intBitsToFloat(R124i.w) * 0.25);
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f19999a));
PS1i = floatBitsToInt(float(R3i.z));
// 18
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R11i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(0x3f4ccccd));
R127i.y = clampFI32(R127i.y);
R123i.z = floatBitsToInt(-(intBitsToFloat(R15i.w)) * 3.0 + 3.0);
R14i.w = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3d124925));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 19
R14i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].x) + -(intBitsToFloat(R15i.x)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
R16i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].y) + -(intBitsToFloat(R12i.w)));
R13i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].z) + -(intBitsToFloat(R5i.y)));
R18i.z = floatBitsToInt(float(R126i.w));
R18i.z = floatBitsToInt(intBitsToFloat(R18i.z) / 2.0);
// 20
R7i.x = floatBitsToInt(intBitsToFloat(R11i.x) * 5.0);
R7i.x = clampFI32(R7i.x);
R16i.y = floatBitsToInt(intBitsToFloat(R9i.x) + -(intBitsToFloat(R20i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(1.0));
R3i.w = floatBitsToInt(intBitsToFloat(R15i.w) + intBitsToFloat(0x2edbe6ff));
R17i.w = floatBitsToInt(intBitsToFloat(R9i.y) + -(intBitsToFloat(R20i.z)));
// 0
backupReg0i = R3i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R7i.x)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(R5i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(R6i.x)));
R3i.w = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(R20i.z)));
R3i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R6i.y)) + intBitsToFloat(R0i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R6i.y)) + intBitsToFloat(R0i.y));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.x)));
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.x)));
R0i.z = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).x);
R11i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R11i.w),intBitsToFloat(R11i.y))).x);
R10i.x = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R23i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y))).xyzw);
R21i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z))).xyz);
R12i.xyz = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y))).xyz);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R0i.z)) + intBitsToFloat(uf_remappedPS[0].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R11i.w)) + intBitsToFloat(uf_remappedPS[0].x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R1i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R1i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R10i.x)) + intBitsToFloat(uf_remappedPS[0].x));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.x)), intBitsToFloat(R13i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.x)), intBitsToFloat(R4i.y)));
R124i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)), intBitsToFloat(R4i.z)));
// 2
R124i.x = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(-(intBitsToFloat(R8i.z)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)), intBitsToFloat(R4i.w)));
R127i.x = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PS1i));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)), intBitsToFloat(R126i.w)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(PV0iw));
R124i.z = floatBitsToInt(-(intBitsToFloat(R8i.z)) + intBitsToFloat(R124i.z));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)));
R125i.x = floatBitsToInt(intBitsToFloat(R23i.x) + intBitsToFloat(0xbecccccd));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.z),intBitsToFloat(R8i.w),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(PV1ix));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.z),intBitsToFloat(R8i.w),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R125i.x) * 10.0);
PS1i = clampFI32(PS1i);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.w), intBitsToFloat(R6i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.w)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)), intBitsToFloat(R125i.z)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.y), intBitsToFloat(PS1i)));
R126i.x = floatBitsToInt(intBitsToFloat(R21i.x) * intBitsToFloat(0x3e99096c));
// 7
R125i.x = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PV0iz));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.w)),intBitsToFloat(R4i.z)) + intBitsToFloat(R125i.y));
R126i.z = floatBitsToInt(-(intBitsToFloat(R8i.z)) + intBitsToFloat(R126i.w));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -0.75);
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e99999a) + intBitsToFloat(0xbecccccd));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(R4i.z)) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(R14i.y)) + intBitsToFloat(backupReg0i));
R7i.z = floatBitsToInt(intBitsToFloat(PV1iw) * 16.0);
R7i.z = clampFI32(R7i.z);
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R4i.x));
R124i.w = floatBitsToInt(intBitsToFloat(R4i.w) + -(1.0));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * 75.0);
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(R7i.z)));
PV1iy = clampFI32(PV1iy);
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.z)),intBitsToFloat(R4i.z)) + intBitsToFloat(R127i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R3i.x)));
R127i.w = clampFI32(R127i.w);
PS1i = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R7i.y));
// 10
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1ix)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV1iy)) + 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.z)),intBitsToFloat(R14i.y)) + intBitsToFloat(R124i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R6i.w));
PV0iw = clampFI32(PV0iw);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R7i.w)));
R7i.y = clampFI32(R7i.y);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0iw)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R124i.w = floatBitsToInt(tempResultf);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.z),intBitsToFloat(R8i.w),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.w)),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(PS1i)));
R125i.x = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(0x3da3d70a));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R124i.w)));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3c23d70a));
PV0ix = clampFI32(PV0ix);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(0xbc23d70a));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(0xbd4ccccd));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(PS1i)));
PV0iw = clampFI32(PV0iw);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.z) * 20.0);
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R8i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(R123i.y) * 50.0);
R125i.w = clampFI32(R125i.w);
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R124i.x)) + intBitsToFloat(0xbecccccd));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3df5c28f));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(PV1iz)));
PV0iz = clampFI32(PV0iz);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R11i.x)) + intBitsToFloat(0xbecccccd));
R10i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R125i.x));
R10i.w = clampFI32(R10i.w);
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.x) * 75.0);
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * 75.0);
PV1iz = clampFI32(PV1iz);
R8i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(PV0iy));
R8i.w = clampFI32(R8i.w);
R6i.w = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R7i.y));
R6i.w = clampFI32(R6i.w);
// 20
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(PV1iy)));
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(PV1iz)));
R2i.z = floatBitsToInt(intBitsToFloat(PV1ix) * 40.0);
R2i.z = clampFI32(R2i.z);
R2i.w = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R4i.w));
R2i.w = clampFI32(R2i.w);
R11i.x = floatBitsToInt(intBitsToFloat(R21i.y) * intBitsToFloat(0x3f162b6b) + intBitsToFloat(R126i.x));
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3e4ccccd));
R123i.y = floatBitsToInt(intBitsToFloat(R21i.z) * intBitsToFloat(0x3dea4a8c) + intBitsToFloat(R11i.x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R4i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.z) * 8.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z),intBitsToFloat(R2i.w)) + intBitsToFloat(R12i.w));
// 1
backupReg0i = R123i.y;
PV1ix = ((intBitsToFloat(backupReg0i) > 0.0)?-1:0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R6i.w)) + intBitsToFloat(R2i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(PV0iw)));
PV1iz = clampFI32(PV1iz);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(R8i.w)) + intBitsToFloat(PV0ix));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R17i.z)) + intBitsToFloat(R123i.w));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x),intBitsToFloat(R2i.w)) + intBitsToFloat(R15i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),intBitsToFloat(R2i.w)) + intBitsToFloat(R5i.y));
R127i.w = ((PV1ix == 0)?(0):(PS1i));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R8i.y)) + intBitsToFloat(R20i.z));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.w)),intBitsToFloat(backupReg0i)) + intBitsToFloat(R15i.w));
R123i.y = clampFI32(R123i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedPS[8].x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(R18i.z)) + intBitsToFloat(PV0iy));
R123i.w = clampFI32(R123i.w);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedPS[8].y)));
// 4
backupReg0i = R127i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedPS[8].z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R3i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w), intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), intBitsToFloat(R123i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(backupReg0i)));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R0i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R9i.z));
R127i.z = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(PV0iz));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R20i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R20i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R20i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R19i.z));
// 7
backupReg0i = R123i.y;
backupReg1i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R125i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(0xba0a8ec8));
R123i.z = clampFI32(R123i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(backupReg1i)) + intBitsToFloat(0xba0a8ec8));
R122i.x = clampFI32(R122i.x);
// 8
PV0ix = R22i.z & int(1);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R122i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.z), intBitsToFloat(R23i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
PS1i = floatBitsToInt(float(PV0ix));
// 10
R22i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R12i.x));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R22i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iy)));
R22i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R12i.y));
// 11
R22i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R12i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
}
