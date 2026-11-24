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
// shader 1bd1c50969e7e4ac
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
R7i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R5i.w = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R6i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R4i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),intBitsToFloat(uf_remappedPS[0].w)) + 1.0);
R125i.y = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R5i.z = 0;
PV0iw = floatBitsToInt(intBitsToFloat(R7i.w) * 255.0);
R125i.z = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R4i.x) * 2.0 + -(1.0));
R124i.y = floatBitsToInt(intBitsToFloat(R4i.y) * 2.0 + -(1.0));
R8i.z = floatBitsToInt(roundEven(0.0));
R125i.w = floatBitsToInt(intBitsToFloat(R4i.z) * 2.0 + -(1.0));
R124i.z = int(intBitsToFloat(PV0iw));
// 2
R4i.x = 0x3f19999a;
PV0iy = R124i.z >> 0x5;
R4i.z = floatBitsToInt(1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R4i.w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1ix = PV0iy & 0x7;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.w) + 3.0);
R9i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].x)), intBitsToFloat(PS0i)));
R4i.w = 0;
R126i.z = R124i.z & 0x1c;
// 4
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R9i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.z)), intBitsToFloat(uf_remappedPS[1].y)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].x) + intBitsToFloat(R9i.z));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R9i.z)));
PS0i = floatBitsToInt(float(PV1ix));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + -2.0);
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) * 10.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(R123i.z), -(intBitsToFloat(R123i.z))));
R127i.w = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 7
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[3].x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(max(intBitsToFloat(R127i.y), -(intBitsToFloat(R127i.y))));
PV1iw = floatBitsToInt(max(intBitsToFloat(R123i.x), -(intBitsToFloat(R123i.x))));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3fb8aa3b));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
PV0iw = R126i.y;
PV0iw = clampFI32(PV0iw);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1iw)));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3dcccccd) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R6i.w = floatBitsToInt(intBitsToFloat(PV0iw) * 3.0);
R6i.x = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
PV0iz = R126i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iz = clampFI32(PV0iz);
R9i.w = floatBitsToInt(intBitsToFloat(R123i.y) * 75.0);
R126i.y = floatBitsToInt(float(R126i.z));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R125i.z));
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R125i.y));
PV1iy = clampFI32(PV1iy);
R6i.z = floatBitsToInt(intBitsToFloat(R126i.w) * 8.0);
PV1iw = R124i.z & 0x2;
R11i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.25);
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV1ix));
R9i.y = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3d124925));
R13i.z = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV1iy));
R14i.z = floatBitsToInt(float(PV1iw));
R14i.z = floatBitsToInt(intBitsToFloat(R14i.z) / 2.0);
// 13
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.y));
R15i.z = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
R10i.w = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
R12i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[4].x) + -(intBitsToFloat(R13i.z)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[4].y) + -(intBitsToFloat(R15i.z)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.w),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.w),intBitsToFloat(R9i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 16
R10i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[4].z) + -(intBitsToFloat(R10i.w)));
R13i.y = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R13i.y = clampFI32(R13i.y);
R16i.z = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R16i.z = clampFI32(R16i.z);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.y) * 4.0 + -3.0);
R123i.w = clampFI32(R123i.w);
R127i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 17
R125i.x = R124i.z & int(1);
R5i.y = floatBitsToInt(intBitsToFloat(R123i.w) + -(0.5));
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 4.0);
R5i.y = clampFI32(R5i.y);
R11i.w = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R11i.w = clampFI32(R11i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 18
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(0x3f4ccccd));
PV0iw = clampFI32(PV0iw);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 19
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS0i)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS0i)));
R7i.w = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
R11i.z = floatBitsToInt(float(R125i.x));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R7i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R4i.y),intBitsToFloat(R10i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R7i.z = tempi.x;
PV0iw = tempi.x;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedPS[5].z)));
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(uf_remappedPS[6].w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(uf_remappedPS[6].w)));
R125i.z = floatBitsToInt(intBitsToFloat(R7i.z) + 1.0);
R125i.z = clampFI32(R125i.z);
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(uf_remappedPS[5].y)) + intBitsToFloat(R7i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.x)) * 1.5);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(uf_remappedPS[5].x)) + intBitsToFloat(R125i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R4i.z)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(PV0iz));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(max(-(intBitsToFloat(R123i.y)), 0.0));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(uf_remappedPS[6].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
R124i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
R8i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R4i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
PV0iz = PS1i;
PV0iw = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R6i.y = floatBitsToInt(exp2(intBitsToFloat(R124i.z)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R7i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(min(intBitsToFloat(PV0iw), 1.0));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R7i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.z)),vec4(-(intBitsToFloat(R126i.x)),-(intBitsToFloat(R124i.y)),-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R4i.w)))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
backupReg0i = R6i.x;
R6i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x3f666666));
R6i.x = clampFI32(R6i.x);
PV1iy = floatBitsToInt(intBitsToFloat(R124i.z) * 5.0);
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.z)));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(PV1iy)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(0xbe0f5c29));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(0xbba3d70a));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.x)));
// 12
R124i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 100.0);
R124i.y = clampFI32(R124i.y);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * 70.0);
PV0iw = clampFI32(PV0iw);
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e99999a));
// 14
R123i.w = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3e4ccccd) + intBitsToFloat(PV1ix));
R123i.w = clampFI32(R123i.w);
// 15
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R6i.z)));
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z), intBitsToFloat(R3i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[7].w)), intBitsToFloat(R3i.y)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R6i.w)) + intBitsToFloat(R0i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R6i.w)) + intBitsToFloat(R0i.y));
R0i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R17i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyzw);
R3i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z))).xyz);
R8i.xyz = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyz);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R1i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R1i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R0i.w)) + intBitsToFloat(uf_remappedPS[0].x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.w), intBitsToFloat(R6i.y)));
PS0i = floatBitsToInt(intBitsToFloat(R17i.x) + intBitsToFloat(0xbecccccd));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R125i.w) + -0.75);
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.z)));
PS1i = floatBitsToInt(intBitsToFloat(PS0i) * 10.0);
PS1i = clampFI32(PS1i);
// 2
R126i.x = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(PV1iy));
R125i.z = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(PV1iw));
R124i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 16.0);
R124i.w = clampFI32(R124i.w);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R4i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e99999a) + intBitsToFloat(R8i.w));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(R124i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.z));
R125i.w = floatBitsToInt(intBitsToFloat(R122i.x) + intBitsToFloat(0xbecccccd));
R124i.y = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(R124i.w)));
R124i.y = clampFI32(R124i.y);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R127i.w) + -(1.0));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), intBitsToFloat(R17i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R9i.w)));
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(intBitsToFloat(R3i.z) * intBitsToFloat(0x3dea4a8c));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R124i.y)) + 1.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
R123i.x = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(0x3f162b6b) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iy));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(0.5 * intBitsToFloat(R123i.w) + 0.5);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PV0ix)));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), intBitsToFloat(PV1iz)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R6i.x)));
R123i.w = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(0x3e99096c) + intBitsToFloat(R123i.x));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R127i.w));
R127i.w = clampFI32(R127i.w);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3df5c28f));
PV1ix = clampFI32(PV1ix);
PV1iy = ((intBitsToFloat(R123i.w) > 0.0)?-1:0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R13i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R15i.z));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R14i.z)) + intBitsToFloat(PV1iw));
R126i.z = clampFI32(R126i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R10i.w));
R122i.x = ((PV1iy == 0)?(0):(PS1i));
// 11
backupReg0i = R124i.w;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * 40.0);
PV1ix = clampFI32(PV1ix);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedPS[8].x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedPS[8].z)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedPS[8].y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R122i.x)));
// 12
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * 8.0);
// 13
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV0iz)));
PV1iy = clampFI32(PV1iy);
// 14
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R11i.x)));
// 15
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R7i.y)) + intBitsToFloat(PV0iw));
R123i.z = clampFI32(R123i.z);
// 16
R123i.y = floatBitsToInt(intBitsToFloat(R123i.z) * 3.0 + intBitsToFloat(R126i.z));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), intBitsToFloat(R123i.y)));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(R7i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R12i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(R11i.y));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R11i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R16i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R13i.y)));
// 21
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 22
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R8i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R8i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R8i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
