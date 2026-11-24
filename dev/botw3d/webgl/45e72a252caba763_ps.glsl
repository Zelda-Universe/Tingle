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
// shader 45e72a252caba763
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
vec4 uf_blockPS10[3];
};


TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 4) uniform sampler2DArrayShadow textureUnitPS7;
TEXTURE_LAYOUT(14, 1, 5) uniform sampler2D textureUnitPS14;
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
R1i = floatBitsToInt(passParameterSem5);
R2i = floatBitsToInt(passParameterSem6);
if( activeMaskStackC[1] == true ) {
R3i.w = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xzw);
R4i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R2i.z = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).w);
}
if( activeMaskStackC[1] == true ) {
// 0
backupReg0i = R4i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.w)) + uf_blockPS1[14].x);
R124i.y = floatBitsToInt(intBitsToFloat(R4i.x) * 2.0 + -(1.0));
R4i.z = floatBitsToInt(intBitsToFloat(R4i.y) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),uf_blockPS1[16].x) + uf_blockPS1[14].x);
R3i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 2.0 + -(1.0));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.w))));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.w))));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.z)) + uf_blockPS1[14].x);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.x)) + uf_blockPS1[14].x);
R9i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), -(intBitsToFloat(R127i.z))));
// 3
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), -(intBitsToFloat(backupReg0i))));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), -(intBitsToFloat(R127i.z))));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), -(intBitsToFloat(backupReg0i))));
R125i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R7i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R7i.y),intBitsToFloat(R9i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R124i.z = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R2i.z) * 255.0);
// 5
R126i.x = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.z));
R125i.y = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R126i.w));
R127i.z = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(R127i.y));
R125i.x = floatBitsToInt(sqrt(intBitsToFloat(R126i.z)));
// 6
R127i.x = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(R125i.z));
R127i.y = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[43].x));
R125i.w = floatBitsToInt(sqrt(intBitsToFloat(R124i.z)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[45].x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockPS6[43].y) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.x)));
R127i.w = int(intBitsToFloat(R126i.y));
// 8
backupReg0i = R126i.x;
R126i.x = R127i.w & 0x1c;
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.z));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockPS6[45].y) + intBitsToFloat(PV1iy));
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iw));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),uf_blockPS6[43].z) + intBitsToFloat(R124i.z));
R127i.y = floatBitsToInt(-(intBitsToFloat(R9i.z)) * intBitsToFloat(0x3d4ccccd));
R127i.z = R127i.w & 0x2;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),uf_blockPS6[45].z) + intBitsToFloat(R123i.w));
R9i.w = 0x3f800000;
// 10
R124i.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R0i.y)),-(intBitsToFloat(R0i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R0i.y)),-(intBitsToFloat(R0i.z)),0.0)));
PV0iy = R124i.x;
PV0iz = R124i.x;
PV0iw = R124i.x;
R1i.x = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.y));
R1i.x = clampFI32(R1i.x);
// 11
R9i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R127i.x));
R2i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS1i)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PS1i)));
R10i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.y));
R10i.w = clampFI32(R10i.w);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS0i)));
R125i.w = R2i.x;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R124i.z = R1i.y;
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(float(R126i.x));
// 15
backupReg0i = R127i.y;
R10i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.x));
R127i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3d124925));
R11i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R11i.w = clampFI32(R11i.w);
R9i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R124i.z)) + intBitsToFloat(backupReg0i));
// 16
PS0i = floatBitsToInt(float(R127i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 17
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),-(intBitsToFloat(PS0i))) + intBitsToFloat(R127i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.x));
R3i.z = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R6i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
PV0iz = floatBitsToInt(uf_blockPS10[2].z + 1.0);
// 1
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R1i.w = 0;
R12i.w = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(PV0iz));
R12i.w = clampFI32(R12i.w);
// 2
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.z)),vec4(-(intBitsToFloat(R7i.x)),-(intBitsToFloat(R6i.y)),-(intBitsToFloat(R8i.z)),-(intBitsToFloat(R1i.w)))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
// 3
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
R127i.x = ((-(intBitsToFloat(R9i.z)) > uf_blockPS1[58].y)?-1:0);
PV0iy = floatBitsToInt(intBitsToFloat(R2i.x) * 1.5);
PV0iz = floatBitsToInt(intBitsToFloat(R1i.y) * 1.5);
PV0iw = ((-(intBitsToFloat(R9i.z)) > uf_blockPS1[58].x)?-1:0);
PS0i = floatBitsToInt(intBitsToFloat(R1i.z) * 1.5);
// 1
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iy));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iz));
PV1iz = PV0iw & int(1);
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R3i.z)) + intBitsToFloat(PS0i));
PS1i = ((intBitsToFloat(0x3eb33333) > intBitsToFloat(backupReg0i))?-1:0);
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.z)),uf_blockPS1[17].y) + 1.0);
PV0iy = PV1iz - R127i.x;
R1i.z = ((PS1i == 0)?(0x3f800000):(0));
R2i.w = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(0x3ac49ba6));
R9i.w = 0x3f000000;
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R1i.w)));
PV1iw = PV0iy << 0x2;
R127i.x = floatBitsToInt(float(PV0iy));
// 4
R0i.x = PV1iw + 0x2c;
R0i.y = PV1iw + 0x2b;
R0i.z = PV1iw + 0x2a;
R0i.w = PV1iw + 0x2d;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV1ix));
// 5
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(R122i.x));
R6i.z = floatBitsToInt(roundEven(intBitsToFloat(R127i.x)));
}
if( activeMaskStackC[2] == true ) {
R3i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R4i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R126i.y = floatBitsToInt(uf_blockPS6[53].y);
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
R126i.z = floatBitsToInt(uf_blockPS6[53].x);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R1i.y));
PS0i = floatBitsToInt(tempResultf);
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)));
R7i.z = R6i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R6i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(PV0ix)) + 1.0);
R125i.x = R126i.y;
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3b449ba6));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R1i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3b449ba6));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3b449ba6));
R1i.z = R6i.z;
// 5
R8i.z = R6i.z;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R2i.x)));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(R9i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1iw)) + intBitsToFloat(R7i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(R6i.x));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R4i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R5i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R3i.x)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R0i.x)));
// 9
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R4i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(R127i.y));
// 10
R126i.x = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.x));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.y));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.z)));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iw));
R6i.x = floatBitsToInt(uf_blockPS6[53].x * 0.5 + intBitsToFloat(R126i.y));
// 14
R7i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R126i.z));
PV0iy = ((intBitsToFloat(0x3727c5ac) > intBitsToFloat(R127i.z))?-1:0);
R6i.y = floatBitsToInt(uf_blockPS6[53].y * 0.5 + intBitsToFloat(R126i.x));
// 15
R1i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R125i.y));
R7i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(R126i.w));
R123i.w = ((PV0iy == 0)?(R127i.z):(0x3727c5ac));
R1i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(R125i.x));
// 16
backupReg0i = R126i.x;
R126i.x = R123i.w;
R126i.x = clampFI32(R126i.x);
R8i.y = floatBitsToInt(-(uf_blockPS6[53].y) * 0.5 + intBitsToFloat(backupReg0i));
R8i.x = floatBitsToInt(-(uf_blockPS6[53].x) * 0.5 + intBitsToFloat(R126i.y));
// 17
R6i.w = R126i.x;
R7i.w = R126i.x;
// 18
R1i.w = R126i.x;
R8i.w = R126i.x;
}
if( activeMaskStackC[2] == true ) {
R6i.y = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R6i.w))));
R7i.x = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.w))));
R1i.w = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))));
R8i.z = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iz = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R7i.x));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
// 1
R123i.z = floatBitsToInt(intBitsToFloat(R1i.w) * 0.5 + intBitsToFloat(PV0iz));
// 2
R126i.y = floatBitsToInt((intBitsToFloat(R8i.z) * 0.5 + intBitsToFloat(R123i.z))/2.0);
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
// 4
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R10i.w)) + intBitsToFloat(R126i.y));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R0i.w = R9i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3903126f) + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(R9i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = R10i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R2i.z = R9i.w;
// 1
R1i.x = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
R1i.y = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
R2i.w = 0x3f800000;
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(textureLod(textureUnitPS14, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).xyz);
R1i.y = floatBitsToInt(textureLod(textureUnitPS1, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),-(intBitsToFloat(R11i.w))) + intBitsToFloat(R1i.y));
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
// 2
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(R127i.z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R12i.w)) + intBitsToFloat(R127i.z));
// 5
R2i.x = floatBitsToInt(intBitsToFloat(R123i.x) + uf_blockPS10[1].y);
R2i.x = clampFI32(R2i.x);
}
// export
passPixelColor5 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
