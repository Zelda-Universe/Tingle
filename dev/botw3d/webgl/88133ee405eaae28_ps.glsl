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
// shader 88133ee405eaae28
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 7) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 8) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 9) uniform uniformBlockPS10
{
vec4 uf_blockPS10[4];
};


TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(8, 1, 4) uniform sampler2DArrayShadow textureUnitPS8;
TEXTURE_LAYOUT(15, 1, 5) uniform sampler2D textureUnitPS15;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
layout(location = 5) out vec4 passPixelColor5;
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
bool activeMaskStack[3];
bool activeMaskStackC[4];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem5);
R2i = floatBitsToInt(passParameterSem6);
if( activeMaskStackC[1] == true ) {
R3i.w = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R7i.xzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xzw);
R4i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R2i.xy = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y)),0.0).xw);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R7i.w)) + uf_blockPS1[14].x);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R7i.z)) + uf_blockPS1[14].x);
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R7i.x)) + uf_blockPS1[14].x);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),uf_blockPS1[16].x) + uf_blockPS1[14].x);
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) * 2.0 + -(1.0));
// 1
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.w))));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.w))));
R12i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.y) * 2.0 + -(1.0));
R125i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 2.0 + -(1.0));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), -(intBitsToFloat(R127i.y))));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), -(intBitsToFloat(R127i.y))));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), -(intBitsToFloat(R127i.z))));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), -(intBitsToFloat(R127i.z))));
// 3
R125i.x = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)));
R124i.z = floatBitsToInt(-(intBitsToFloat(R12i.z)) + intBitsToFloat(PV0ix));
R125i.w = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iw));
// 4
backupReg0i = R126i.z;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R8i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R8i.y),intBitsToFloat(R12i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(backupReg0i));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(-(intBitsToFloat(R12i.z)) + intBitsToFloat(R127i.y));
// 6
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[43].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.x)));
R125i.y = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 7
backupReg0i = R127i.z;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[45].x));
R124i.y = floatBitsToInt(intBitsToFloat(R4i.w) * 255.0);
R127i.z = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0 + -(1.0));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[43].y) + intBitsToFloat(PV0ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R125i.z;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[18].y, uf_blockPS1[18].z));
R127i.w = floatBitsToInt(-(intBitsToFloat(R12i.z)) * intBitsToFloat(0x3d4ccccd));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
// 9
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.z));
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[45].y) + intBitsToFloat(R124i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.z)));
// 10
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),uf_blockPS6[45].z) + intBitsToFloat(R123i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),uf_blockPS6[43].z) + intBitsToFloat(R4i.w));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R125i.w)) + intBitsToFloat(R124i.w));
R125i.w = R4i.x;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R124i.z = R4i.y;
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
// 11
R124i.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R1i.x)),-(intBitsToFloat(R3i.y)),-(intBitsToFloat(R1i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R1i.x)),-(intBitsToFloat(R3i.y)),-(intBitsToFloat(R1i.z)),0.0)));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
R2i.x = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.w));
R2i.x = clampFI32(R2i.x);
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), -(intBitsToFloat(R126i.z))));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbb6fe5d7));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3ca30589));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3ca30589));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0xbb6fe5d7));
// 13
R7i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R126i.y));
R1i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3b02da3b) + intBitsToFloat(PV0iw));
R3i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)), uf_blockPS1[17].y));
R1i.w = 0x3f800000;
R6i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3b02da3b) + intBitsToFloat(PV0iz));
// 14
R5i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3d156fb9) + intBitsToFloat(R126i.z));
R5i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3d156fb9) + intBitsToFloat(R127i.y));
R13i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R126i.x));
R12i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.w));
R12i.w = clampFI32(R12i.w);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 15
backupReg0i = R124i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(PS0i)));
PS1i = int(intBitsToFloat(backupReg0i));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = PS1i & int(1);
// 17
R12i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.x));
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R124i.z)) + intBitsToFloat(R124i.y));
R13i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R13i.w = clampFI32(R13i.w);
R2i.y = ((PS0i == 0)?(0):(0x3f800000));
// 18
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.x));
R2i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(uf_blockPS10[2].z + 1.0);
R9i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
// 1
R10i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R14i.w = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(PV0ix));
R14i.w = clampFI32(R14i.w);
R4i.w = 0;
// 2
predResult = (1.0 > intBitsToFloat(R12i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R13i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R6i.x));
R13i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R1i.y));
R14i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R6i.x)));
// 1
R15i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R5i.x));
R14i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R1i.y)));
R15i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R5i.y));
// 2
R16i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R5i.x)));
R16i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R5i.y)));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) * 1.5);
PV0iy = floatBitsToInt(intBitsToFloat(R4i.y) * 1.5);
PV0iz = ((-(intBitsToFloat(R12i.z)) > uf_blockPS1[58].x)?-1:0);
R127i.w = ((-(intBitsToFloat(R12i.z)) > uf_blockPS1[58].y)?-1:0);
PS0i = floatBitsToInt(intBitsToFloat(R2i.z) * 1.5);
// 1
backupReg0i = R1i.z;
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(R2i.w)) + intBitsToFloat(PV0ix));
PV1iy = PV0iz & int(1);
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iy));
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R2i.w)) + intBitsToFloat(PS0i));
R122i.x = floatBitsToInt(intBitsToFloat(R3i.z) * 0.25 + 1.0);
// 2
backupReg0i = R2i.y;
R2i.x = floatBitsToInt(uf_blockPS6[53].y);
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) / 2.0);
R2i.y = floatBitsToInt(uf_blockPS6[53].x);
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) / 2.0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R122i.x)));
R3i.w = PV1iy - R127i.w;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R1i.w)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(PS0i));
R3i.y = floatBitsToInt(-(intBitsToFloat(R2i.x)));
R7i.z = floatBitsToInt(-(intBitsToFloat(R2i.y)));
PV1iw = R3i.w << 0x2;
R1i.y = floatBitsToInt(float(R3i.w));
// 4
R0i.x = PV1iw + 0x2c;
R0i.y = PV1iw + 0x2b;
R0i.z = PV1iw + 0x2a;
R0i.w = PV1iw + 0x2d;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(R123i.x));
// 5
backupReg0i = R2i.z;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg0i)),vec4(-(intBitsToFloat(R8i.x)),-(intBitsToFloat(R9i.y)),-(intBitsToFloat(R10i.z)),-(intBitsToFloat(R4i.w)))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R122i.x));
R2i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[2] == true ) {
R4i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R2i.w)));
R127i.w = R2i.x;
R8i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.y)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R9i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R9i.z = R8i.z;
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PV1ix)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.x));
R10i.z = R8i.z;
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R2i.z)));
R11i.z = R8i.z;
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3da1ff2e));
// 5
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R3i.x));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R8i.y));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R12i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R5i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R6i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R4i.x)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R0i.x)));
// 8
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R6i.y)) + intBitsToFloat(R127i.y));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.x));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.z)));
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(0xbb03126f));
R8i.x = floatBitsToInt(uf_blockPS6[53].x * 0.5 + intBitsToFloat(R127i.y));
// 13
R126i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV0iz));
R126i.x = clampFI32(R126i.x);
R8i.y = floatBitsToInt(uf_blockPS6[53].y * 0.5 + intBitsToFloat(R127i.x));
R9i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R2i.y));
// 14
R10i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R7i.z));
R9i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R3i.y));
R8i.w = R126i.x;
R9i.w = R126i.x;
// 15
R11i.x = floatBitsToInt(-(uf_blockPS6[53].x) * 0.5 + intBitsToFloat(R127i.y));
R10i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.w));
R10i.w = R126i.x;
R11i.y = floatBitsToInt(-(uf_blockPS6[53].y) * 0.5 + intBitsToFloat(R127i.x));
// 16
R11i.w = R126i.x;
}
if( activeMaskStackC[2] == true ) {
R8i.z = floatBitsToInt(texture(textureUnitPS8, vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
R9i.y = floatBitsToInt(texture(textureUnitPS8, vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
R10i.x = floatBitsToInt(texture(textureUnitPS8, vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
R11i.w = floatBitsToInt(texture(textureUnitPS8, vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0iw = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(R9i.y));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
// 1
R123i.y = floatBitsToInt(intBitsToFloat(R10i.x) * 0.5 + intBitsToFloat(PV0iw));
// 2
R4i.z = floatBitsToInt((intBitsToFloat(R11i.w) * 0.5 + intBitsToFloat(R123i.y))/2.0);
// 3
PV1ix = ((1.0 > intBitsToFloat(R4i.z))?-1:0);
// 4
R0i.w = ((R3i.w > 0)?(PV1ix):(0));
// 5
predResult = (R0i.w != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = int(-1) + R3i.w;
// 1
PV1iy = PV0iz << 0x2;
R4i.x = floatBitsToInt(float(PV0iz));
// 2
R0i.x = PV1iy + 0x2a;
R0i.y = PV1iy + 0x2d;
R0i.z = PV1iy + 0x2c;
R0i.w = PV1iy + 0x2b;
R5i.z = floatBitsToInt(roundEven(intBitsToFloat(R4i.x)));
}
if( activeMaskStackC[3] == true ) {
R1i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
R2i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R1i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R3i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R0i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0ix));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV1iy));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R123i.x));
PV1iy = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 5
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(0xbb03126f));
// 7
R5i.w = floatBitsToInt(-(intBitsToFloat(R4i.x)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV0iy));
R5i.w = clampFI32(R5i.w);
}
if( activeMaskStackC[3] == true ) {
R5i.z = floatBitsToInt(texture(textureUnitPS8, vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w))));
}
if( activeMaskStackC[3] == true ) {
// 0
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R5i.z)));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
R0i.x = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y))).x);
R0i.y = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y))).x);
R1i.x = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y))).x);
R1i.y = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(0x3f7eb852));
PV0iy = floatBitsToInt(uf_blockPS1[16].x * 20.0);
R124i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) + 1.0);
R127i.w = floatBitsToInt(uf_blockPS1[16].x * intBitsToFloat(0x3f555555));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R0i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R0i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f8ba8d6));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) / 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fbc4580));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.x));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV1iy)) + 1.0);
R127i.x = clampFI32(R127i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(PV1ix)) + 0.5);
R127i.y = clampFI32(R127i.y);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(PV1iy)) + 0.5);
R125i.z = clampFI32(R125i.z);
R126i.w = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV1ix)) + 1.0);
R125i.w = clampFI32(R125i.w);
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.z)) + 0.5);
R126i.x = clampFI32(R126i.x);
PV1iy = floatBitsToInt(0.5 + -(intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(0.5 + -(intBitsToFloat(R125i.z)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)) + 0.5);
R124i.w = clampFI32(R124i.w);
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R126i.z)) + 1.0);
R0i.w = clampFI32(R0i.w);
// 4
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(0.5 + -(intBitsToFloat(R126i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R127i.x)) + 0.5);
PV0iz = floatBitsToInt(0.5 + -(intBitsToFloat(R124i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R125i.w)) + 0.5);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R126i.w)) + 1.0);
R125i.y = clampFI32(R125i.y);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(R126i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R125i.y)) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(R127i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)) + 0.5);
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R12i.w)) + intBitsToFloat(R4i.z));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R127i.x)) + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(R127i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.w) + -(intBitsToFloat(R126i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.y));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e35e743));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e35e743));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R127i.y));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e825397) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e825397) + intBitsToFloat(PV1iy));
// 9
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(R123i.w));
// 10
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(0xbedd476b));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * 6.0);
PV1ix = clampFI32(PV1ix);
// 12
R1i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R3i.w = R1i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R13i.z) * intBitsToFloat(0x3903126f) + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(R7i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = R12i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R2i.z = R1i.w;
// 1
R1i.x = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
R1i.y = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
R2i.w = 0x3f800000;
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(textureLod(textureUnitPS15, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).xyz);
R1i.y = floatBitsToInt(textureLod(textureUnitPS1, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),-(intBitsToFloat(R13i.w))) + intBitsToFloat(R1i.y));
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
// 2
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(R127i.z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R14i.w)) + intBitsToFloat(R127i.z));
// 5
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),uf_blockPS10[3].z) + uf_blockPS10[1].y);
R2i.x = clampFI32(R2i.x);
}
// export
passPixelColor5 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
