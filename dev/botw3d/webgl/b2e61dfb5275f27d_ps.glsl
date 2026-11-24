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
// shader b2e61dfb5275f27d
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
R5i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R6i.w = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R7i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R10i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
R125i.z = floatBitsToInt(intBitsToFloat(R5i.z) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(uf_remappedPS[0].w)) + 1.0);
R127i.z = 0x358637bd;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 2
R6i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
R125i.y = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
R6i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].x)), intBitsToFloat(PS1i)));
R124i.w = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R125i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)), intBitsToFloat(uf_remappedPS[1].y)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R6i.z)));
R4i.z = floatBitsToInt(roundEven(0.0));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].x) + intBitsToFloat(R6i.z));
R124i.z = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 4
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.z)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R7i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R7i.x));
R5i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R11i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R11i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R5i.z) * 0.25);
// 6
PV0ix = floatBitsToInt(min(intBitsToFloat(R126i.y), 2.0));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.z) * 10.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R7i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R7i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) * 6.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[3].x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
// 8
PV0ix = floatBitsToInt(max(intBitsToFloat(R126i.z), -(intBitsToFloat(R126i.z))));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R127i.z), -(intBitsToFloat(R127i.z))));
R127i.z = floatBitsToInt(max(intBitsToFloat(R127i.w), -(intBitsToFloat(R127i.w))));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iw)));
// 10
backupReg0i = R127i.y;
R7i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iz));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e4ccccd));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R6i.z)));
// 11
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R7i.x)) + intBitsToFloat(R1i.z));
R7i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iw));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 4.0 + -3.0);
R125i.w = clampFI32(R125i.w);
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.y));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R1i.w));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(R127i.y)));
R123i.w = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x3dcccccd) + 1.0);
R1i.x = floatBitsToInt(intBitsToFloat(R126i.y) * 6.0);
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.w));
PV1ix = clampFI32(PV1ix);
R9i.y = floatBitsToInt(intBitsToFloat(R123i.w) * 75.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R125i.y));
PV1iz = clampFI32(PV1iz);
R7i.w = R126i.y;
R7i.w = floatBitsToInt(intBitsToFloat(R7i.w) * 4.0);
R7i.w = clampFI32(R7i.w);
R12i.y = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R12i.y = floatBitsToInt(intBitsToFloat(R12i.y) * 4.0);
R12i.y = clampFI32(R12i.y);
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV1iz));
R8i.y = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
R5i.z = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PV1ix));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3dcccccd));
R1i.z = clampFI32(R1i.z);
// 15
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.y));
R3i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[5].x) + -(intBitsToFloat(R6i.x)));
R0i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[5].y) + -(intBitsToFloat(R8i.y)));
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[5].z) + -(intBitsToFloat(R5i.z)));
R0i.z = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).x);
R14i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyzw);
R13i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyz);
R4i.xyz = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.y),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.y),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R0i.z)) + intBitsToFloat(uf_remappedPS[0].x));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R122i.x)), intBitsToFloat(R5i.x)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R122i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(R14i.x) + intBitsToFloat(0xbecccccd));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R122i.x)), intBitsToFloat(R1i.y)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PV1iw));
R125i.z = floatBitsToInt(-(intBitsToFloat(R6i.z)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * 10.0);
PV0iw = clampFI32(PV0iw);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 3
backupReg0i = R1i.z;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(backupReg0i) + intBitsToFloat(0x3ecccccd));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R11i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + -(1.0));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
PV1ix = clampFI32(PV1ix);
R126i.y = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x3fe66666));
R124i.z = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(0x3f4ccccd));
R124i.z = clampFI32(R124i.z);
R125i.w = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R124i.w));
R125i.w = clampFI32(R125i.w);
R125i.x = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3d4ccccd));
R125i.x = clampFI32(R125i.x);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R124i.w = tempi.x;
PS0i = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(PV0ix)) + intBitsToFloat(R125i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(R125i.z));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(R6i.x));
tempResultf = max(0.0, intBitsToFloat(PS0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R11i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 10
backupReg0i = R8i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R5i.z));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(backupReg0i));
PV0iw = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(min(intBitsToFloat(PV0iw), 1.0));
R3i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3c23d70a));
R3i.z = clampFI32(R3i.z);
R0i.w = floatBitsToInt(intBitsToFloat(R124i.z) + -(1.0));
R125i.y = floatBitsToInt(intBitsToFloat(R10i.w) * 255.0);
// 12
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e99999a) + intBitsToFloat(PV1iy));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -0.75);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.y)));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0xbecccccd));
R1i.y = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R1i.y = clampFI32(R1i.y);
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) * 16.0);
R127i.z = clampFI32(R127i.z);
R5i.w = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R5i.w = clampFI32(R5i.w);
PS1i = int(intBitsToFloat(R125i.y));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R9i.y)));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(R127i.z)));
PV0iy = clampFI32(PV0iy);
R10i.z = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R10i.z = clampFI32(R10i.z);
PV0iw = PS1i & 0xfc;
R125i.y = PS1i & int(1);
// 15
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(R125i.x) + intBitsToFloat(0x3ecccccd));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R14i.z)));
R2i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R2i.z = clampFI32(R2i.z);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV0iy)) + 1.0);
R124i.z = floatBitsToInt(float(PV0iw));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt(float(R125i.y));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3b820821));
PV1iw = ((intBitsToFloat(PV0ix) > 0.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 18
R123i.y = ((PV1iw == 0)?(0):(PS1i));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.x)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.y)));
// 19
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x), intBitsToFloat(uf_remappedPS[7].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), intBitsToFloat(uf_remappedPS[7].w)));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R5i.x));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R5i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z), intBitsToFloat(uf_remappedPS[7].w)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedPS[8].x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedPS[8].z)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R1i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedPS[8].y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iz)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PS0i));
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), intBitsToFloat(R127i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R122i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), intBitsToFloat(R125i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), intBitsToFloat(R127i.y)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(max(-(intBitsToFloat(R123i.y)), 0.0));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R11i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(intBitsToFloat(R125i.y) * 5.0);
PV1iy = clampFI32(PV1iy);
R126i.z = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(PV1iy)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
// 9
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R125i.y)) + intBitsToFloat(0xbecccccd));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(backupReg0i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(backupReg0i)));
// 10
PV0iw = floatBitsToInt(intBitsToFloat(R123i.x) * 75.0);
PV0iw = clampFI32(PV0iw);
// 11
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV0iw)));
// 12
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(R2i.w));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.z));
// 14
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R123i.x)));
// 15
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R6i.y)));
// 16
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(R125i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(R125i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(R125i.z));
// 17
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z),intBitsToFloat(R2i.x)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R2i.x)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x),intBitsToFloat(R2i.x)) + intBitsToFloat(R123i.w));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R5i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R1i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R10i.z)));
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 20
backupReg0i = R123i.y;
backupReg1i = R123i.z;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg1i));
// 21
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R4i.x));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R4i.y));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R4i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
}
