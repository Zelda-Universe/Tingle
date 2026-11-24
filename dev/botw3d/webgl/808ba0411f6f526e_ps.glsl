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
// shader 808ba0411f6f526e
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
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2DArrayShadow textureUnitPS6;
TEXTURE_LAYOUT(9, 1, 6) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(12, 1, 7) uniform sampler2D textureUnitPS12;
TEXTURE_LAYOUT(13, 1, 8) uniform sampler2D textureUnitPS13;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
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
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
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
R6i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R3i.z),intBitsToFloat(R3i.w))).xyzw);
R3i.z = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R3i.z),intBitsToFloat(R3i.w))).w);
R7i.xy = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.w)) + uf_blockPS1[14].x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),uf_blockPS1[16].x) + uf_blockPS1[14].x);
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.x)) + uf_blockPS1[14].x);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.z)) + uf_blockPS1[14].x);
R5i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 2.0 + -(1.0));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.y))));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.y))));
R7i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)));
R124i.w = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
R124i.z = floatBitsToInt(intBitsToFloat(R6i.z) * 2.0 + -(1.0));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R8i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R8i.y),intBitsToFloat(R7i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), -(intBitsToFloat(R127i.w))));
// 3
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), -(intBitsToFloat(R127i.z))));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), -(intBitsToFloat(R127i.z))));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), -(intBitsToFloat(R127i.w))));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R3i.z) * 255.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 5
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R124i.w),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R124i.w),intBitsToFloat(R124i.z),0.0)));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
R127i.y = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(R127i.x));
// 6
backupReg0i = R126i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(R126i.y));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R126i.w)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(R127i.w));
R125i.w = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(backupReg0i));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R126i.w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockPS6[44].x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.w)));
R2i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.y)) + 1.0);
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[44].y) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockPS6[43].x));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R7i.z)) * intBitsToFloat(0x3d4ccccd));
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[43].y) + intBitsToFloat(PV0iy));
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockPS6[45].x));
R5i.w = 0x3f800000;
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R127i.z)) + intBitsToFloat(R125i.z));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[45].y) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)), -(intBitsToFloat(R0i.z))));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),uf_blockPS6[44].z) + intBitsToFloat(backupReg0i));
R10i.x = 0;
// 11
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R0i.y)),intBitsToFloat(PV0iy),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R0i.y)),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),uf_blockPS6[43].z) + intBitsToFloat(R126i.x));
// 12
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),uf_blockPS6[45].z) + intBitsToFloat(R127i.x));
R10i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R127i.w));
R9i.w = R7i.x;
R9i.w = clampFI32(R9i.w);
PS0i = int(intBitsToFloat(R125i.x));
// 13
backupReg0i = R126i.w;
R7i.x = floatBitsToInt(uf_blockPS1[0].y);
R2i.y = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(backupReg0i));
R2i.y = clampFI32(R2i.y);
R127i.z = PS0i & 0x1c;
R126i.w = PS0i & 0x2;
R10i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(backupReg0i));
R10i.w = clampFI32(R10i.w);
// 14
R3i.y = floatBitsToInt(uf_blockPS1[1].y);
R11i.z = floatBitsToInt(uf_blockPS1[2].y);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R124i.x)));
// 15
R11i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R125i.w));
R1i.y = R10i.z;
R12i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R125i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 16
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R2i.w));
R3i.z = floatBitsToInt(tempResultf);
// 17
PS1i = floatBitsToInt(float(R127i.z));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3d124925));
PS0i = floatBitsToInt(float(R126i.w));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 19
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(PS0i))) + intBitsToFloat(PV0ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(R0i.w));
R4i.z = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R4i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R5i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
R127i.z = floatBitsToInt(uf_blockPS10[2].z + 1.0);
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(R5i.y)) + 1.0);
R5i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R0i.w = 0;
R3i.x = R4i.x;
// 2
backupReg0i = R2i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R5i.z)));
R2i.y = R5i.z;
R6i.z = 0;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), -(intBitsToFloat(R0i.w))));
R13i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.z));
R13i.z = clampFI32(R13i.z);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.z),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R124i.w = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(PV0ix));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R126i.w)),vec4(-(intBitsToFloat(R4i.x)),-(intBitsToFloat(R5i.y)),-(intBitsToFloat(R5i.z)),1.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R122i.x));
// 5
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.x));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R3i.z)));
// 7
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R124i.w)));
// 8
predResult = (1.0 > intBitsToFloat(R10i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R2i.x) * 1.5);
PV0iy = floatBitsToInt(intBitsToFloat(R1i.z) * 1.5);
PV0iz = ((-(intBitsToFloat(R7i.z)) > uf_blockPS1[58].x)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R4i.y) * 1.5);
R127i.w = ((intBitsToFloat(0x3eb33333) > intBitsToFloat(R0i.w))?-1:0);
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(R4i.z)) + intBitsToFloat(PV0ix));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R4i.z)) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R4i.z)) + intBitsToFloat(PV0iy));
R126i.w = ((-(intBitsToFloat(R7i.z)) > uf_blockPS1[58].y)?-1:0);
R127i.y = PV0iz & int(1);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = ((R127i.w == 0)?(0x3f800000):(0));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),uf_blockPS1[17].y) + 1.0);
PV1iz = R127i.y - R126i.w;
R7i.w = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(0x3ac49ba6));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R126i.w = PV1iz << 0x2;
R126i.z = floatBitsToInt(float(PV1iz));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.w = R126i.w + 0x2d;
// 6
R0i.x = R126i.w + 0x2c;
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PV1ix)) + 1.0);
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.z));
// 7
R2i.x = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3b449ba6));
R2i.y = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3b449ba6));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R125i.y)));
R2i.w = floatBitsToInt(intBitsToFloat(R122i.x) * intBitsToFloat(0x3b449ba6));
R0i.y = R126i.w + 0x2a;
// 8
R0i.z = R126i.w + 0x2b;
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R126i.x)));
R8i.z = floatBitsToInt(roundEven(intBitsToFloat(R126i.z)));
}
if( activeMaskStackC[2] == true ) {
R4i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R3i.w)) + intBitsToFloat(R7i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R1i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R3i.w)) + intBitsToFloat(R8i.y));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R5i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R4i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R6i.x)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R5i.y)) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R0i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iy));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R0i.y)) + intBitsToFloat(PV0iy));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R6i.y)) + intBitsToFloat(R127i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.x));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.y));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R123i.x));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.z)));
// 7
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.z)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(PV0iy));
// 8
PV0ix = ((intBitsToFloat(0x3727c5ac) > intBitsToFloat(R126i.w))?-1:0);
// 9
R123i.y = ((PV0ix == 0)?(R126i.w):(0x3727c5ac));
// 10
R8i.w = R123i.y;
R8i.w = clampFI32(R8i.w);
}
if( activeMaskStackC[2] == true ) {
R8i.y = floatBitsToInt(texture(textureUnitPS6, vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
// 1
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R10i.w)) + intBitsToFloat(R8i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x3a83126f));
R0i.y = floatBitsToInt(intBitsToFloat(R12i.z) * intBitsToFloat(0x3a83126f));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R123i.z = clampFI32(R123i.z);
R127i.w = floatBitsToInt(intBitsToFloat(R11i.w) + -(intBitsToFloat(R3i.x)));
R1i.x = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x38d1b717) + 0.5);
// 1
R127i.x = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R1i.z = floatBitsToInt(intBitsToFloat(R12i.z) * intBitsToFloat(0x3903126f) + 0.5);
R0i.w = 0x3f800000;
R3i.w = floatBitsToInt(-(intBitsToFloat(R7i.z)) * intBitsToFloat(0x3ba3d70a));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iy)) + intBitsToFloat(R3i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
R4i.w = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R7i.y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
PV1ix = floatBitsToInt(max(-(intBitsToFloat(R123i.y)), intBitsToFloat(0xbf7d70a4)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40200001));
R127i.w = clampFI32(R127i.w);
// 4
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R5i.x = clampFI32(R5i.x);
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3dcccccd));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
R123i.w = floatBitsToInt(-(intBitsToFloat(R7i.z)) * intBitsToFloat(0x3ba3d70a) + intBitsToFloat(0xbfe66666));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R123i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + uf_blockPS6[27].w)/2.0);
tempResultf = max(0.0, intBitsToFloat(R127i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
backupReg0i = R123i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R2i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R2i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R9i.y)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R126i.x = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R1i.y),intBitsToFloat(R12i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R1i.y),intBitsToFloat(R12i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R1i.y),intBitsToFloat(R12i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 11
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(R127i.y));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R126i.x))) + uf_blockPS6[27].z);
R6i.x = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
}
if( activeMaskStackC[1] == true ) {
R1i.w = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).x);
R1i.xyz = floatBitsToInt(textureLod(textureUnitPS13, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.z)),0.0).xyz);
R2i.xyz = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z))).xyz);
R3i.x = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),intBitsToFloat(R3i.w)).x);
}
// export
passPixelColor2 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.x), intBitsToFloat(R10i.x), intBitsToFloat(R10i.x));
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R4i.x));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(intBitsToFloat(R1i.w) * 2.0 + -(1.0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R4i.w)));
R8i.w = 0;
R7i.w = 0x3f800000;
// 1
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(intBitsToFloat(R123i.y) * 25.0 + intBitsToFloat(R10i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R9i.w)) + intBitsToFloat(R2i.w));
R127i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + uf_blockPS10[1].z);
R127i.w = clampFI32(R127i.w);
tempResultf = max(0.0, intBitsToFloat(R123i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
tempResultf = max(0.0, intBitsToFloat(R5i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), uf_blockPS10[3].z));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockPS6[42].z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS6[42].y) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), uf_blockPS6[16].w));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.x)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
// 6
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockPS6[30].w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),uf_blockPS6[42].x) + intBitsToFloat(R123i.x));
// 7
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R4i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.w)));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.z));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),-(intBitsToFloat(R3i.y))) + intBitsToFloat(R126i.z));
// 9
PV1iy = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(R127i.x)));
// 10
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R13i.z)) + intBitsToFloat(R127i.x));
// 11
R8i.x = floatBitsToInt(intBitsToFloat(R123i.z) + uf_blockPS10[1].y);
R8i.x = clampFI32(R8i.x);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0iw = floatBitsToInt(-(intBitsToFloat(R3i.x)) + uf_blockPS6[52].x);
// 1
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.z = clampFI32(R123i.z);
// 2
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockPS6[13].w));
// 3
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R4i.w)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R1i.y)) + intBitsToFloat(R1i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R1i.y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.x)));
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iy));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.z));
// 8
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.z));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.y));
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.x));
// 9
R1i.x = R7i.x;
R1i.y = R7i.y;
R1i.z = R7i.z;
R1i.w = R7i.w;
// 10
R0i.x = R8i.x;
R0i.y = R8i.y;
R0i.z = R8i.z;
R0i.w = R8i.w;
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
