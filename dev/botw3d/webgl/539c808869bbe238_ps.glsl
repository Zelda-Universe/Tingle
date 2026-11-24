#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 539c808869bbe238
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 12) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 13) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(40, 1, 14) uniform uniformBlockPS8
{
vec4 uf_blockPS8[38];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 15) uniform uniformBlockPS10
{
vec4 uf_blockPS10[4];
};


TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2DArrayShadow textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 6) uniform sampler3D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 7) uniform sampler2DArray textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 8) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 9) uniform sampler2D textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 10) uniform sampler2D textureUnitPS11;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
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
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem5);
R5i = floatBitsToInt(passParameterSem7);
R6i = floatBitsToInt(passParameterSem8);
if( activeMaskStackC[1] == true ) {
R1i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R10i.xyz = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R14i.xyz = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R9i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
R127i.z = 0;
R3i.w = floatBitsToInt(intBitsToFloat(R1i.z) * 2.0 + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R4i.z)));
R6i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R4i.x)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R7i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R7i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R4i.y)));
// 3
R1i.x = floatBitsToInt(intBitsToFloat(R1i.w) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(R126i.z));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.w));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(R127i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iz));
R122i.x = clampFI32(R122i.x);
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
R8i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R127i.y)));
PV1iw = ((intBitsToFloat(R127i.x) > 0.0)?-1:0);
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R7i.y)) + 1.0);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iz)));
R1i.y = floatBitsToInt(((PV1iw == 0)?(-(intBitsToFloat(R127i.x))):(intBitsToFloat(R127i.x))));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iz)));
R7i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R6i.w)) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[1] == true ) {
R12i.xy = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R6i.w)) + intBitsToFloat(R1i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R1i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)), uf_blockPS1[17].y));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R3i.w)));
R126i.y = floatBitsToInt(sqrt(intBitsToFloat(R1i.z)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].y,intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iy));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R7i.x)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].y,intBitsToFloat(R6i.z)) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R6i.w)) + intBitsToFloat(R7i.z));
R9i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), uf_blockPS8[32].w));
PV0ix = clampFI32(PV0ix);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R7i.x)) + intBitsToFloat(R8i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R7i.x)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.z)));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 3
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R127i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].x,-(intBitsToFloat(PV0ix))) + uf_blockPS8[32].x);
R123i.z = clampFI32(R123i.z);
R124i.w = R9i.x;
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.w)));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.y)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[23].x, intBitsToFloat(R123i.z)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R127i.z = clampFI32(R127i.z);
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[23].y, intBitsToFloat(R123i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[23].z, intBitsToFloat(R123i.z)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(0xbf2aaae3));
R127i.y = R8i.y;
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R127i.w)));
R127i.w = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R8i.x));
R6i.w = floatBitsToInt(tempResultf);
// 6
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.y),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),0.0)));
PV0iy = R125i.x;
PV0iz = R125i.x;
PV0iw = R125i.x;
R4i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 12.0);
R4i.w = clampFI32(R4i.w);
// 7
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].z, intBitsToFloat(R125i.w)));
R3i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].z, intBitsToFloat(R126i.w)));
R3i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].z, intBitsToFloat(R126i.y)));
R1i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3d4ccccd));
R126i.y = R127i.z;
R126i.y = clampFI32(R126i.y);
// 8
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R9i.z),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.w),intBitsToFloat(R127i.y),intBitsToFloat(R127i.w),0.0)));
PV0iy = R124i.x;
PV0iz = R124i.x;
PV0iw = R124i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(0x3e99999a));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
R10i.w = 0x3f800000;
// 10
R9i.x = floatBitsToInt(uf_blockPS1[0].y);
R11i.y = floatBitsToInt(uf_blockPS1[1].y);
R0i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e4ccccd) + intBitsToFloat(R127i.x));
R0i.z = clampFI32(R0i.z);
R8i.w = R12i.x;
R8i.w = clampFI32(R8i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(tempResultf);
// 11
R1i.y = floatBitsToInt(fract(uf_blockPS8[36].w));
R11i.z = floatBitsToInt(uf_blockPS1[2].y);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.x));
PS1i = floatBitsToInt(tempResultf);
// 12
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R124i.x)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R13i.y),intBitsToFloat(R12i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[43].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[44].x));
// 1
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[44].y) + intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[45].x));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[43].y) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[44].z) + intBitsToFloat(R123i.y));
// 3
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[45].y) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[43].z) + intBitsToFloat(R123i.x));
// 4
R13i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R125i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[45].z) + intBitsToFloat(R123i.y));
// 5
R6i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(-(uf_blockPS10[2].y),intBitsToFloat(R8i.x)) + intBitsToFloat(R8i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockPS10[2].y),intBitsToFloat(R3i.y)) + intBitsToFloat(R3i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS10[2].y),intBitsToFloat(R3i.z)) + intBitsToFloat(R3i.z));
R8i.y = R13i.z;
// 6
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R123i.w)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R123i.z)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R123i.y)));
R6i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R1i.w));
R6i.w = clampFI32(R6i.w);
R8i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R124i.w));
// 7
R3i.y = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R1i.w));
R3i.y = clampFI32(R3i.y);
// 8
predResult = (intBitsToFloat(R1i.y) > 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = floatBitsToInt(floor(uf_blockPS8[36].w));
R11i.w = 0;
// 1
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R0i.z)));
}
if( activeMaskStackC[2] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R14i.x)) + intBitsToFloat(R0i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R14i.z)) + intBitsToFloat(R0i.z));
// 1
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R1i.y)) + intBitsToFloat(R14i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.y)) + intBitsToFloat(R14i.y));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R1i.y)) + intBitsToFloat(R14i.z));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R11i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].z, intBitsToFloat(R0i.z)));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (uf_blockPS8[33].w > 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.y = 0;
}
if( activeMaskStackC[2] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitPS7, vec3(intBitsToFloat(R0i.y),intBitsToFloat(R0i.y),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R1i.z) + 1.0);
R127i.x = clampFI32(R127i.x);
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PS0i = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(0x3dea4a8c));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(0.5 * intBitsToFloat(PV1ix) + intBitsToFloat(0x3dcccccd));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
R126i.z = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV1ix) + intBitsToFloat(0x3e4ccccd));
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R127i.z;
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 2.5);
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(0x3e23d70a));
R127i.w = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(backupReg0i) + intBitsToFloat(0x3eb33333));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 0.25);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(0x3e851eb8));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0iw)) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.x));
// 6
R127i.y = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(PV1ix));
R127i.y = clampFI32(R127i.y);
PV0iz = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(PV1ix));
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1ix));
PV0iw = clampFI32(PV0iw);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R14i.x)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R10i.x)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(-(intBitsToFloat(R14i.z)) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(PV0iz));
R127i.x = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iz));
// 8
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R14i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockPS8[33].w) + intBitsToFloat(R14i.y));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockPS8[33].w) + intBitsToFloat(R14i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(R127i.y));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R10i.x));
// 9
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),uf_blockPS8[33].w) + intBitsToFloat(R10i.y));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockPS8[33].w) + intBitsToFloat(R10i.z));
// 10
R11i.w = R10i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(uf_blockPS10[2].z + 1.0);
// 1
R12i.w = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
R12i.w = clampFI32(R12i.w);
// 2
predResult = (1.0 > intBitsToFloat(R6i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = ((-(intBitsToFloat(R5i.z)) > uf_blockPS1[58].y)?-1:0);
R6i.y = floatBitsToInt(intBitsToFloat(R11i.w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(0x3ac49ba6));
PV0iw = ((-(intBitsToFloat(R5i.z)) > uf_blockPS1[58].x)?-1:0);
// 1
PV1iz = PV0iw & int(1);
// 2
PV0iy = PV1iz - R127i.x;
// 3
PV1iw = PV0iy << 0x2;
PS1i = floatBitsToInt(float(PV0iy));
// 4
R0i.x = PV1iw + 0x2c;
R0i.y = PV1iw + 0x2b;
R0i.z = PV1iw + 0x2a;
R0i.w = PV1iw + 0x2d;
R7i.z = floatBitsToInt(roundEven(intBitsToFloat(PS1i)));
}
if( activeMaskStackC[2] == true ) {
R1i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R4i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R3i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R1i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R4i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.x)));
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iw));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R123i.x));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
// 6
R127i.z = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PV1iw));
// 7
PV1iy = ((intBitsToFloat(0x3727c5ac) > intBitsToFloat(R127i.z))?-1:0);
// 8
R123i.y = ((PV1iy == 0)?(R127i.z):(0x3727c5ac));
// 9
R7i.w = R123i.y;
R7i.w = clampFI32(R7i.w);
}
if( activeMaskStackC[2] == true ) {
R7i.z = floatBitsToInt(texture(textureUnitPS1, vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R7i.z)) + 1.0);
// 1
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R6i.w)) + intBitsToFloat(R7i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3903126f) + 0.5);
R1i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3ba3d70a));
R0i.w = 0x3f800000;
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R126i.z = clampFI32(R126i.z);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.w = R1i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
// 4
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
R0i.z = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x3a83126f));
R0i.w = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3a83126f));
R127i.y = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(0xbe99999a));
R126i.y = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(0x3dcccccd) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(R6i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.w = clampFI32(R123i.w);
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R127i.x)) + intBitsToFloat(R6i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(PS1i)));
R7i.w = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R127i.x = clampFI32(R127i.x);
R7i.y = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
R6i.z = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
PV1iw = floatBitsToInt(max(-(intBitsToFloat(R123i.y)), intBitsToFloat(0xbf7d70a4)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 8
backupReg0i = R127i.z;
R123i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + uf_blockPS6[27].w)/2.0);
R8i.y = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R12i.y) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) + 0.5);
R5i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x40200001));
R5i.w = clampFI32(R5i.w);
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.w)));
// 10
R4i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(PS1i))) + uf_blockPS6[27].z);
R4i.y = floatBitsToInt(intBitsToFloat(R9i.w) * 6.0);
R8i.z = floatBitsToInt(intBitsToFloat(R126i.y) * 75.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iw)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
R4i.z = floatBitsToInt(uf_blockPS6[5].y + -(intBitsToFloat(R6i.z)));
R6i.w = floatBitsToInt(uf_blockPS6[5].x + -(intBitsToFloat(R7i.w)));
R6i.x = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 12
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.y))) + 1.0);
R6i.y = floatBitsToInt(uf_blockPS6[5].z + -(intBitsToFloat(R7i.y)));
R7i.z = R2i.w;
R7i.z = clampFI32(R7i.z);
R4i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(0x3dcccccd));
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R3i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
R3i.xyz = floatBitsToInt(textureLod(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).xyz);
R1i.y = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y)),intBitsToFloat(R1i.w)).x);
R1i.x = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),0.0).x);
R5i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R1i.x) * 2.0 + -(1.0));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R1i.y) + uf_blockPS10[1].z);
PV1ix = clampFI32(PV1ix);
R1i.y = floatBitsToInt(intBitsToFloat(R122i.x) * 25.0 + intBitsToFloat(R13i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(0xbfe66666));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(R3i.w)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R8i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3dcccccd));
PV0iz = clampFI32(PV0iz);
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z, intBitsToFloat(PV1ix)));
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iw));
R122i.x = clampFI32(R122i.x);
// 3
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R10i.w) + -(intBitsToFloat(R126i.y)));
R3i.y = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV0iz) + intBitsToFloat(0x3ecccccd));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R122i.x));
R127i.y = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R12i.w)) + intBitsToFloat(R126i.y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R122i.x) + uf_blockPS10[1].y);
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), uf_blockPS6[16].w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R5i.w = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(0x3fe66666));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R8i.w)) + intBitsToFloat(R127i.w));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0xbecccccd));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3d4ccccd));
R127i.w = clampFI32(R127i.w);
// 7
R1i.x = floatBitsToInt(intBitsToFloat(R14i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R1i.x = clampFI32(R1i.x);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 10.0);
PV1iy = clampFI32(PV1iy);
R1i.z = floatBitsToInt(intBitsToFloat(R14i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R1i.z = clampFI32(R1i.z);
R4i.w = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R4i.w = clampFI32(R4i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 8
backupReg0i = R5i.y;
backupReg1i = R5i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iy)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R127i.y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R127i.y)));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV0ix));
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.x)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(R127i.w) + intBitsToFloat(0x3ecccccd));
// 10
backupReg0i = R6i.y;
backupReg1i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(R7i.w));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R7i.z)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1ix)) + intBitsToFloat(R7i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R6i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), uf_blockPS6[30].w));
// 11
backupReg0i = R127i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockPS10[0].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R8i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockPS10[0].y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockPS10[0].z));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(backupReg0i)));
// 12
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R127i.w)));
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.z));
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R126i.z)));
R6i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R126i.x)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),-(intBitsToFloat(R0i.y))) + intBitsToFloat(R127i.x));
// 13
R5i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
R6i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
R3i.w = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS6[4].x,uf_blockPS6[4].y,uf_blockPS6[4].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R13i.y),intBitsToFloat(R12i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R1i.y)) + uf_blockPS6[52].x);
PV1iw = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.x = clampFI32(R123i.x);
PV0iz = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockPS6[13].w));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(0xbecccccd));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R8i.z)));
PV0ix = clampFI32(PV0ix);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R8i.y)));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R7i.y)) + intBitsToFloat(R7i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R7i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0ix)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R3i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV1iy)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(R127i.w)) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R5i.w)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.x));
// 9
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R7i.w)) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R4i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R1i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R1i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R7i.w)) + intBitsToFloat(R126i.y));
// 10
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R7i.w)) + intBitsToFloat(R126i.z));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R0i.y)) + intBitsToFloat(backupReg0i));
// 11
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R0i.y)) + intBitsToFloat(backupReg0i));
// 12
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R122i.x));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.w));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(R3i.w)) * 0.25);
PV1iy = floatBitsToInt(-(intBitsToFloat(R5i.x)) * 0.25);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R6i.z)) * 0.25);
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R127i.y)));
// 14
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3fb8aa3b));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fb8aa3b));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3fb8aa3b));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) * intBitsToFloat(0x3fb8aa3b));
// 15
R127i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) * intBitsToFloat(0x3fb8aa3b));
R126i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) * intBitsToFloat(0x3fb8aa3b));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 16
R1i.x = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 17
R7i.w = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R7i.w = floatBitsToInt(intBitsToFloat(R7i.w) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 18
R3i.z = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 19
R2i.x = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 20
R4i.w = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
// 21
R5i.z = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.y = ((1.0 > uf_blockPS8[37].x)?-1:0);
R0i.w = floatBitsToInt(uf_blockPS8[37].x);
// 1
R123i.x = ((R127i.y == 0)?(R5i.x):(R1i.x));
R123i.y = ((R127i.y == 0)?(R1i.z):(R2i.x));
R126i.z = ((R127i.y == 0)?(R6i.z):(R3i.z));
R127i.w = ((R127i.y == 0)?(R3i.w):(R7i.w));
// 2
backupReg0i = R123i.x;
R123i.x = ((R127i.y == 0)?(R4i.x):(R4i.w));
R123i.w = ((R127i.y == 0)?(R2i.w):(R5i.z));
R0i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R123i.y));
// 3
R0i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R123i.x));
R0i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R123i.w));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
