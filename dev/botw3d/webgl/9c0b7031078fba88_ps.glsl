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
// shader 9c0b7031078fba88
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 6) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 7) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 8) uniform uniformBlockPS10
{
vec4 uf_blockPS10[4];
};


TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2DArrayShadow textureUnitPS7;
TEXTURE_LAYOUT(12, 1, 4) uniform sampler2D textureUnitPS12;
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
R3i.w = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R4i.xzw = floatBitsToInt(zmGather(textureUnitPS5, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xzw);
R5i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R2i.z = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).w);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R4i.x)) + uf_blockPS1[14].x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),uf_blockPS1[16].x) + uf_blockPS1[14].x);
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R4i.w)) + uf_blockPS1[14].x);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R4i.z)) + uf_blockPS1[14].x);
R124i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
// 1
backupReg0i = R1i.x;
backupReg1i = R1i.y;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.y))));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.y))));
R0i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), -(intBitsToFloat(R127i.w))));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), -(intBitsToFloat(R127i.w))));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), -(intBitsToFloat(R127i.x))));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), -(intBitsToFloat(R127i.x))));
R126i.x = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(PV1iw));
// 3
R127i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
R126i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(PV0iz));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.z)));
R125i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
R125i.z = floatBitsToInt(intBitsToFloat(R5i.z) * 2.0 + -(1.0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.y)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.x)));
// 5
backupReg0i = R127i.y;
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.w) * 255.0);
R126i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 255.0);
PV1iw = floatBitsToInt(uf_blockPS6[53].z * intBitsToFloat(0x3d4ccccd));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0ix));
// 6
R7i.x = floatBitsToInt(-(intBitsToFloat(R0i.z)) * intBitsToFloat(0x3d4ccccd) + -(intBitsToFloat(PV1iw)));
R7i.x = clampFI32(R7i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.x));
R0i.w = 0x3f800000;
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)), uf_blockPS1[17].y));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV0iy),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
PS1i = int(intBitsToFloat(R127i.y));
// 8
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R2i.x)),-(intBitsToFloat(R2i.y)),-(intBitsToFloat(R1i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R2i.x)),-(intBitsToFloat(R2i.y)),-(intBitsToFloat(R1i.z)),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = PS1i & int(1);
// 9
R3i.z = ((PS0i == 0)?(0):(0x3f800000));
PS1i = int(intBitsToFloat(R126i.z));
// 10
R125i.x = PS1i & 0x2;
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.w));
PS0i = floatBitsToInt(tempResultf);
// 11
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.y));
R1i.w = floatBitsToInt(tempResultf);
// 12
R2i.w = floatBitsToInt(float(R125i.x));
R2i.w = floatBitsToInt(intBitsToFloat(R2i.w) / 2.0);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R11i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
// 1
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R9i.w = 0;
// 2
predResult = (1.0 > intBitsToFloat(R7i.x));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = ((-(intBitsToFloat(R0i.z)) > uf_blockPS1[58].x)?-1:0);
R127i.y = ((-(intBitsToFloat(R0i.z)) > uf_blockPS1[58].y)?-1:0);
PV0iz = floatBitsToInt(intBitsToFloat(R8i.x) * 1.5);
PV0iw = floatBitsToInt(intBitsToFloat(R10i.y) * 1.5);
PS0i = floatBitsToInt(intBitsToFloat(R8i.z) * 1.5);
// 1
backupReg0i = R2i.z;
R3i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.w)) + intBitsToFloat(PV0iz));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.w)) + intBitsToFloat(PV0iw));
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(R1i.w)) + intBitsToFloat(PS0i));
PV1iw = PV0ix & int(1);
R122i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.25 + 1.0);
// 2
backupReg0i = R2i.w;
R9i.x = PV1iw - R127i.y;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R122i.x)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R1i.x));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R1i.y));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R0i.z));
// 3
R127i.x = floatBitsToInt(uf_blockPS6[53].y);
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
R7i.y = floatBitsToInt(uf_blockPS6[53].x);
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) / 2.0);
PV1iz = R9i.x << 0x2;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R2i.z)));
R7i.w = floatBitsToInt(float(R9i.x));
// 4
R1i.x = PV1iz + 0x2c;
R1i.y = PV1iz + 0x2a;
R1i.z = PV1iz + 0x2d;
R1i.w = PV1iz + 0x2b;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV1iw));
// 5
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R122i.x));
R8i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)));
R10i.z = floatBitsToInt(roundEven(intBitsToFloat(R7i.w)));
R8i.w = floatBitsToInt(-(intBitsToFloat(R7i.y)));
R9i.y = R127i.x;
}
if( activeMaskStackC[2] == true ) {
R4i.xyzw = floatBitsToInt(uf_blockPS1[R1i.z].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS1[R1i.x].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockPS1[R1i.y].xyzw);
R1i.xyzw = floatBitsToInt(uf_blockPS1[R1i.w].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R10i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.z)),vec4(-(intBitsToFloat(R10i.x)),-(intBitsToFloat(R11i.y)),-(intBitsToFloat(R7i.z)),-(intBitsToFloat(R9i.w)))));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R2i.x));
PS0i = floatBitsToInt(tempResultf);
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
R11i.z = R10i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R11i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R12i.z = R10i.z;
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.x)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(PV0ix)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.w)));
R13i.z = R10i.z;
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3da1ff2e));
// 6
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(R3i.z));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(R2i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(R3i.w));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R5i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R4i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R6i.x)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R1i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iy));
// 9
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iy));
// 10
R127i.x = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R6i.y)) + intBitsToFloat(R127i.z));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R123i.y));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.y)));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(0xbb03126f));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.y)));
R10i.y = floatBitsToInt(uf_blockPS6[53].y * 0.5 + intBitsToFloat(R127i.y));
// 14
R10i.x = floatBitsToInt(uf_blockPS6[53].x * 0.5 + intBitsToFloat(R127i.w));
R11i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R8i.y));
R126i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV1iy));
R126i.w = clampFI32(R126i.w);
R11i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R7i.y));
// 15
R12i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R8i.w));
R12i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R9i.y));
R10i.w = R126i.w;
R11i.w = R126i.w;
// 16
R13i.x = floatBitsToInt(-(uf_blockPS6[53].x) * 0.5 + intBitsToFloat(R127i.w));
R13i.y = floatBitsToInt(-(uf_blockPS6[53].y) * 0.5 + intBitsToFloat(R127i.y));
R12i.w = R126i.w;
R13i.w = R126i.w;
}
if( activeMaskStackC[2] == true ) {
R10i.y = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
R11i.x = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
R12i.w = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
R13i.z = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0iz = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(R11i.x));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
// 1
R123i.w = floatBitsToInt(intBitsToFloat(R12i.w) * 0.5 + intBitsToFloat(PV0iz));
// 2
R5i.z = floatBitsToInt((intBitsToFloat(R13i.z) * 0.5 + intBitsToFloat(R123i.w))/2.0);
// 3
PV1ix = ((1.0 > intBitsToFloat(R5i.z))?-1:0);
// 4
R1i.y = ((R9i.x > 0)?(PV1ix):(0));
// 5
predResult = (R1i.y != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iw = int(-1) + R9i.x;
// 1
PV1ix = PV0iw << 0x2;
R5i.x = floatBitsToInt(float(PV0iw));
// 2
R1i.x = PV1ix + 0x2d;
R1i.y = PV1ix + 0x2b;
R1i.z = PV1ix + 0x2a;
R1i.w = PV1ix + 0x2c;
R6i.z = floatBitsToInt(roundEven(intBitsToFloat(R5i.x)));
}
if( activeMaskStackC[3] == true ) {
R2i.xyzw = floatBitsToInt(uf_blockPS1[R1i.x].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS1[R1i.w].xyzw);
R4i.xyzw = floatBitsToInt(uf_blockPS1[R1i.z].xyzw);
R1i.xyzw = floatBitsToInt(uf_blockPS1[R1i.y].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R3i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R4i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R1i.x)));
// 2
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(backupReg0i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R123i.w));
R127i.y = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(0xbb03126f));
// 7
R6i.w = floatBitsToInt(-(intBitsToFloat(R5i.x)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV0iy));
R6i.w = clampFI32(R6i.w);
}
if( activeMaskStackC[3] == true ) {
R6i.y = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R6i.w))));
}
if( activeMaskStackC[3] == true ) {
// 0
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R6i.y)));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R5i.z)) + 1.0);
// 1
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R7i.x)) + intBitsToFloat(R5i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
R0i.y = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).y);
}
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),uf_blockPS10[3].z) + uf_blockPS10[1].y);
R0i.x = clampFI32(R0i.x);
R0i.z = 0x3f800000;
}
// export
passPixelColor5 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.z));
}
