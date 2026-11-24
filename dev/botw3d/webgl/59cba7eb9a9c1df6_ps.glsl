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
// shader 59cba7eb9a9c1df6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 10) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 11) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 12) uniform uniformBlockPS10
{
vec4 uf_blockPS10[4];
};


TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 3) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(7, 1, 4) uniform sampler2DArrayShadow textureUnitPS7;
TEXTURE_LAYOUT(10, 1, 5) uniform sampler2D textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 6) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(14, 1, 7) uniform sampler2D textureUnitPS14;
TEXTURE_LAYOUT(15, 1, 8) uniform sampler2D textureUnitPS15;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
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
R1i = floatBitsToInt(passParameterSem2);
R2i = floatBitsToInt(passParameterSem5);
R3i = floatBitsToInt(passParameterSem6);
if( activeMaskStackC[1] == true ) {
R4i.w = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xzw = floatBitsToInt(zmGather(textureUnitPS5, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xzw);
R3i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R3i.z),intBitsToFloat(R3i.w))).xyzw);
R11i.xy = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.w)) + uf_blockPS1[14].x);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.z)) + uf_blockPS1[14].x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),uf_blockPS1[16].x) + uf_blockPS1[14].x);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.x)) + uf_blockPS1[14].x);
R5i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0 + -(1.0));
// 1
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.z))));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.z))));
R1i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), -(intBitsToFloat(R127i.y))));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), -(intBitsToFloat(R127i.y))));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[43].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[45].x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), -(intBitsToFloat(R127i.w))));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), -(intBitsToFloat(R127i.w))));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS6[45].y) + intBitsToFloat(PV0iz));
R126i.y = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R126i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS6[43].y) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.w)));
R126i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(R125i.w));
// 4
R127i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),uf_blockPS6[45].z) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R124i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),uf_blockPS6[43].z) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.y));
// 5
R8i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R123i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[44].x));
R126i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.w));
R4i.w = floatBitsToInt(intBitsToFloat(R3i.y) * 2.0 + -(1.0));
R5i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 2.0 + -(1.0));
// 6
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockPS6[39].z) + -(uf_blockPS6[39].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
R2i.y = floatBitsToInt(intBitsToFloat(R3i.w) * 255.0);
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS6[44].y) + intBitsToFloat(R127i.y));
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R126i.y)) + intBitsToFloat(PV0iw));
R6i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iz));
R5i.w = 0x3f800000;
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iy));
// 8
R2i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)) * intBitsToFloat(0x3d4ccccd) + -3.5);
R2i.x = clampFI32(R2i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R1i.z)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) * intBitsToFloat(0x3d4ccccd));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),uf_blockPS6[44].z) + intBitsToFloat(R123i.x));
R9i.x = floatBitsToInt(uf_blockPS1[0].y);
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R5i.z)));
R12i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R123i.w));
R0i.w = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R0i.z));
R0i.w = clampFI32(R0i.w);
R8i.w = R11i.x;
R8i.w = clampFI32(R8i.w);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.x));
R12i.y = R12i.z;
R8i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R125i.y));
R6i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)), uf_blockPS1[17].y));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(PV1iy));
// 11
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(R122i.x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),uf_blockPS6[39].z) + -(uf_blockPS6[39].y));
R2i.z = floatBitsToInt(-(intBitsToFloat(R12i.y)) + uf_blockPS6[39].w);
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)), -(intBitsToFloat(R6i.z))));
R2i.w = floatBitsToInt(sqrt(intBitsToFloat(R123i.x)));
}
if( activeMaskStackC[1] == true ) {
R3i.z = floatBitsToInt(textureLod(textureUnitPS11, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),-(intBitsToFloat(R0i.y))) + intBitsToFloat(R3i.w));
R125i.y = floatBitsToInt(uf_blockPS10[2].z + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[39].w),intBitsToFloat(R3i.z)) + intBitsToFloat(R2i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
// 1
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
R127i.z = clampFI32(R127i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),-(intBitsToFloat(R1i.x))) + intBitsToFloat(R123i.x));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.y)),intBitsToFloat(R13i.y)) + 1.0);
R13i.z = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R125i.y));
R13i.z = clampFI32(R13i.z);
R10i.z = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R0i.z));
R10i.z = clampFI32(R10i.z);
// 3
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
R14i.z = floatBitsToInt(intBitsToFloat(R2i.x) + uf_blockPS10[3].y);
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
R0i.z = floatBitsToInt(tempResultf);
// 4
R9i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.y));
PS0i = int(intBitsToFloat(R2i.y));
// 5
PV1iw = PS0i & int(1);
R10i.w = floatBitsToInt(-(intBitsToFloat(R9i.w)) + 1.0);
// 6
R7i.z = ((PV1iw == 0)?(0):(0x3f800000));
tempResultf = 1.0 / sqrt(intBitsToFloat(R0i.x));
PS0i = floatBitsToInt(tempResultf);
// 7
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
R4i.w = floatBitsToInt(uf_blockPS10[2].w);
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.w));
R0i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, intBitsToFloat(R4i.w)));
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, intBitsToFloat(R4i.w)));
R3i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, intBitsToFloat(R4i.w)));
R3i.w = 0;
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.y)),intBitsToFloat(R14i.y)) + 1.0);
R2i.y = R3i.z;
R2i.z = 0;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R3i.z)));
R0i.x = R11i.x;
// 2
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R9i.z),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(PV1iw));
// 3
R10i.y = floatBitsToInt(uf_blockPS1[1].y);
R11i.z = floatBitsToInt(uf_blockPS1[2].y);
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R122i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(tempResultf);
// 4
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R0i.z)));
// 5
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R126i.x)));
// 6
predResult = (1.0 > intBitsToFloat(R10i.z));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R3i.x) * 1.5);
PV0iy = ((-(intBitsToFloat(R1i.z)) > uf_blockPS1[58].x)?-1:0);
R127i.z = ((-(intBitsToFloat(R1i.z)) > uf_blockPS1[58].y)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R8i.y) * 1.5);
PS0i = floatBitsToInt(intBitsToFloat(R4i.z) * 1.5);
// 1
PV1ix = PV0iy & int(1);
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(R0i.w)) + intBitsToFloat(PV0ix));
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R0i.w)) + intBitsToFloat(PV0iw));
R2i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R0i.w)) + intBitsToFloat(PS0i));
R122i.x = floatBitsToInt(intBitsToFloat(R6i.w) * 0.25 + 1.0);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R2i.w)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R122i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), -(intBitsToFloat(R3i.w))));
R12i.w = PV1ix - R127i.z;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R8i.y)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),-(intBitsToFloat(R14i.y))) + intBitsToFloat(PV0iz));
PV1iz = R12i.w << 0x2;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(PS0i));
// 4
R0i.x = PV1iz + 0x2b;
R0i.y = PV1iz + 0x2a;
R0i.z = PV1iz + 0x2d;
R0i.w = PV1iz + 0x2c;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.x));
// 5
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),-(intBitsToFloat(R3i.z))) + intBitsToFloat(R127i.y));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(R122i.x));
R3i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[2] == true ) {
R5i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R7i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R3i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),-(intBitsToFloat(R11i.x))) + intBitsToFloat(R2i.x));
R127i.w = clampFI32(R127i.w);
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.z)),intBitsToFloat(R3i.y)) + intBitsToFloat(R4i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R14i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(R3i.x));
// 2
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PV1ix)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R122i.x) * intBitsToFloat(0x3f19999a) + intBitsToFloat(R4i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.y)),intBitsToFloat(R3i.y)) + intBitsToFloat(R8i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(backupReg0i));
// 3
backupReg0i = R126i.z;
backupReg1i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R123i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3f19999a) + intBitsToFloat(R1i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.y)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg1i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R122i.x)));
// 4
R123i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3f19999a) + intBitsToFloat(R1i.y));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3da1ff2e));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R123i.w)));
R125i.z = floatBitsToInt(float(R12i.w));
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.z));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(PV0iz)) + intBitsToFloat(R123i.x));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(R126i.z));
R4i.z = floatBitsToInt(roundEven(intBitsToFloat(R125i.z)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R6i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R5i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R7i.x)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R6i.y)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R0i.x)));
// 8
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg0i));
// 9
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.y));
// 10
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R7i.z)) + intBitsToFloat(R123i.x));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.y)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R126i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(R123i.w));
// 12
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0xbb03126f));
// 13
R4i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV0iw));
R4i.w = clampFI32(R4i.w);
}
if( activeMaskStackC[2] == true ) {
R5i.y = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))));
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0ix = ((1.0 > intBitsToFloat(R5i.y))?-1:0);
// 1
R0i.y = ((R12i.w > 0)?(PV0ix):(0));
// 2
predResult = (R0i.y != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iw = int(-1) + R12i.w;
// 1
PV1iz = PV0iw << 0x2;
R5i.x = floatBitsToInt(float(PV0iw));
// 2
R0i.x = PV1iz + 0x2b;
R0i.y = PV1iz + 0x2a;
R0i.z = PV1iz + 0x2d;
R0i.w = PV1iz + 0x2c;
R6i.z = floatBitsToInt(roundEven(intBitsToFloat(R5i.x)));
}
if( activeMaskStackC[3] == true ) {
R2i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R4i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R3i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R4i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R0i.x)));
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(backupReg0i));
// 3
backupReg0i = R123i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.z));
PV1iz = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(backupReg0i));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 5
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(0xbb03126f));
// 7
R6i.w = floatBitsToInt(-(intBitsToFloat(R5i.x)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV0iy));
R6i.w = clampFI32(R6i.w);
}
if( activeMaskStackC[3] == true ) {
R6i.x = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R6i.w))));
}
if( activeMaskStackC[3] == true ) {
// 0
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R6i.x)));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R5i.y)) + 1.0);
// 1
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R10i.z)) + intBitsToFloat(R5i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x3a83126f));
R0i.y = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3a83126f));
R127i.z = floatBitsToInt(intBitsToFloat(R11i.w) + -(intBitsToFloat(R9i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R123i.w = clampFI32(R123i.w);
R1i.x = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x38d1b717) + 0.5);
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R1i.y = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3903126f) + 0.5);
R126i.z = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
R2i.w = 0x3f800000;
R3i.w = floatBitsToInt(-(intBitsToFloat(R1i.z)) * intBitsToFloat(0x3ba3d70a));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R9i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.z = clampFI32(R123i.z);
R0i.w = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R11i.y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(max(-(intBitsToFloat(R123i.x)), intBitsToFloat(0xbf7d70a4)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40200001));
R127i.y = clampFI32(R127i.y);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3dcccccd));
R123i.y = floatBitsToInt(-(intBitsToFloat(R1i.z)) * intBitsToFloat(0x3ba3d70a) + intBitsToFloat(0xbfe66666));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R0i.z = clampFI32(R0i.z);
R127i.w = floatBitsToInt(intBitsToFloat(PV1iz) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 5
backupReg0i = R123i.y;
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R123i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R123i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS0i)) + uf_blockPS6[27].w)/2.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
R123i.w = clampFI32(R123i.w);
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R123i.w));
R2i.y = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(0xbe593484));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R9i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
R125i.z = floatBitsToInt(exp2(intBitsToFloat(R126i.w)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R12i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R12i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R12i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.z)));
// 11
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R127i.z));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R125i.z))) + uf_blockPS6[27].z);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R8i.w)) + intBitsToFloat(R127i.x));
R3i.z = floatBitsToInt(exp2(intBitsToFloat(R125i.w)));
}
if( activeMaskStackC[1] == true ) {
R0i.x = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).x);
R5i.xyz = floatBitsToInt(textureLod(textureUnitPS15, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y)),0.0).xyz);
R2i.xyz = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R3i.w = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),intBitsToFloat(R3i.w)).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R4i.x));
R123i.x = clampFI32(R123i.x);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R1i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R0i.w)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R1i.w)));
tempResultf = max(0.0, intBitsToFloat(R0i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R1i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(R0i.x) * 2.0 + -(1.0));
tempResultf = max(0.0, intBitsToFloat(R123i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
R127i.x = floatBitsToInt(intBitsToFloat(R3i.w) + uf_blockPS10[1].z);
R127i.x = clampFI32(R127i.x);
R6i.y = 0;
R2i.z = floatBitsToInt(intBitsToFloat(R123i.w) * 25.0 + intBitsToFloat(R12i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 4
R123i.y = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), uf_blockPS6[16].w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(R14i.z)) + intBitsToFloat(R9i.w));
R6i.w = clampFI32(R6i.w);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.y));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PV0iw)));
R4i.w = 0x3f800000;
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockPS6[30].w));
// 7
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R13i.z)) + intBitsToFloat(R127i.z));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.w)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z,intBitsToFloat(R123i.y)) + uf_blockPS10[1].y);
R123i.x = clampFI32(R123i.x);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),-(intBitsToFloat(R1i.w))) + intBitsToFloat(R126i.z));
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.y));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.x)));
}
if( activeMaskStackC[1] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(R2i.z)) + uf_blockPS6[52].x);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.x = clampFI32(R123i.x);
// 2
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockPS6[13].w));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.w)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R3i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R3i.w)) + intBitsToFloat(R3i.w));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV0ix)));
R6i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(R123i.z)) + intBitsToFloat(R123i.z));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(PV1iy)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iz));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.w));
// 8
R4i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.w));
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.z));
// 9
R1i.x = R4i.x;
R1i.y = R4i.y;
R1i.z = R4i.z;
R1i.w = R4i.w;
// 10
R0i.x = R6i.x;
R0i.y = R6i.y;
R0i.z = R6i.z;
R0i.w = R6i.w;
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
