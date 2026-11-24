#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5dc89e690f6b0726
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
TEXTURE_LAYOUT(11, 1, 9) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 10) uniform sampler2D textureUnitPS12;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
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
R3i = floatBitsToInt(passParameterSem3);
R4i = floatBitsToInt(passParameterSem4);
R5i = floatBitsToInt(passParameterSem5);
R6i = floatBitsToInt(passParameterSem7);
R7i = floatBitsToInt(passParameterSem8);
if( activeMaskStackC[1] == true ) {
R1i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R8i.xyz = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
R9i.xyz = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R3i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R10i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
R127i.z = 0;
R3i.w = floatBitsToInt(intBitsToFloat(R1i.z) * 2.0 + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R7i.w));
// 1
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.w) * 2.0 + -(1.0));
R126i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R5i.z)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R10i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R10i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R5i.x)));
// 3
R123i.x = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R5i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(R4i.z)) + intBitsToFloat(R127i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iy));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),intBitsToFloat(R4i.x)) + intBitsToFloat(R127i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS1i)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(backupReg0i)));
// 5
backupReg0i = R123i.y;
PV1ix = ((intBitsToFloat(R126i.z) > 0.0)?-1:0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R4i.y)) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.z)));
R7i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.z)));
// 6
R1i.x = floatBitsToInt(((PV1ix == 0)?(-(intBitsToFloat(R126i.z))):(intBitsToFloat(R126i.z))));
R1i.y = floatBitsToInt(((PV1ix == 0)?(-(intBitsToFloat(R126i.z))):(intBitsToFloat(R126i.z))));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R125i.z)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iz));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PS1i));
// 7
backupReg0i = R5i.z;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R5i.z = tempi.x;
PV1iw = tempi.x;
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iz));
}
if( activeMaskStackC[1] == true ) {
R12i.xy = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R3i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R1i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].z, intBitsToFloat(R3i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].z, intBitsToFloat(R1i.z)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R5i.z)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].w,intBitsToFloat(R1i.w)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].w,intBitsToFloat(R1i.x)) + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].y,intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].y,intBitsToFloat(R1i.w)) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R123i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[44].x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[43].x));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R7i.w)));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R4i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R3i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R5i.w));
// 4
backupReg0i = R125i.z;
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R127i.w)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R125i.z = clampFI32(R125i.z);
R125i.w = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R125i.w = clampFI32(R125i.w);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockPS6[44].y) + intBitsToFloat(backupReg0i));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[45].x));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.y)),intBitsToFloat(R10i.y)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(0xbf2aaae3));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.y)),intBitsToFloat(R13i.y)) + 1.0);
R125i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(0xbf2aaae3));
// 6
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) * 12.0);
R126i.x = clampFI32(R126i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockPS6[43].y) + intBitsToFloat(R126i.w));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),uf_blockPS6[44].z) + intBitsToFloat(backupReg0i));
R4i.x = R3i.x;
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockPS6[45].y) + intBitsToFloat(backupReg0i));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 12.0);
R126i.x = clampFI32(R126i.x);
PV0iy = R125i.w;
PV0iy = clampFI32(PV0iy);
R4i.z = 0;
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e99999a));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),uf_blockPS6[43].z) + intBitsToFloat(R127i.y));
// 9
backupReg0i = R127i.w;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),uf_blockPS6[45].z) + intBitsToFloat(R126i.w));
R127i.y = R125i.z;
R127i.y = clampFI32(R127i.y);
R125i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e4ccccd) + intBitsToFloat(PV0iw));
R125i.z = clampFI32(R125i.z);
R127i.w = floatBitsToInt(-(intBitsToFloat(R6i.z)) * intBitsToFloat(0x3d4ccccd));
R11i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(backupReg0i));
// 10
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R9i.x)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R9i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3e99999a));
R6i.w = 0x3f800000;
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R9i.z)));
// 11
R1i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e4ccccd) + intBitsToFloat(PV0iz));
R1i.x = clampFI32(R1i.x);
R11i.y = R11i.z;
R5i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R125i.x));
R10i.w = R12i.x;
R10i.w = clampFI32(R10i.w);
R5i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R125i.w));
// 12
R1i.y = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.w));
R1i.y = clampFI32(R1i.y);
R5i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.w));
R5i.w = clampFI32(R5i.w);
R3i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].x, intBitsToFloat(R125i.z)));
// 13
R1i.z = floatBitsToInt(fract(uf_blockPS8[36].w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.y));
R125i.x = floatBitsToInt(tempResultf);
// 14
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.w));
PS0i = floatBitsToInt(tempResultf);
// 15
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(tempResultf);
// 16
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS1i)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R13i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R14i.y),intBitsToFloat(R12i.z),0.0)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
}
if( activeMaskStackC[1] == true ) {
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PV0iz)));
PV1iy = PV0iz;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R10i.z),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(PV1iy),intBitsToFloat(R4i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(PV1ix));
// 3
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0ix)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R122i.x));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R12i.x = floatBitsToInt(uf_blockPS1[0].y);
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)), uf_blockPS1[17].y));
// 1
R8i.y = floatBitsToInt(uf_blockPS1[1].y);
R8i.z = floatBitsToInt(uf_blockPS1[2].y);
R11i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
predResult = (intBitsToFloat(R1i.z) > 0.0);
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
R9i.w = 0;
// 1
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R0i.z)));
}
if( activeMaskStackC[2] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R9i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(R0i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(R0i.z));
// 1
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R1i.z)) + intBitsToFloat(R9i.x));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.z)) + intBitsToFloat(R9i.y));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R1i.z)) + intBitsToFloat(R9i.z));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R9i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].x,intBitsToFloat(R1i.x)) + intBitsToFloat(R3i.y));
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
R0i.z = 0;
}
if( activeMaskStackC[2] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitPS7, vec3(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + 1.0);
R127i.y = clampFI32(R127i.y);
PS0i = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(0x3dea4a8c));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(0.5 * intBitsToFloat(PV1ix) + intBitsToFloat(0x3dcccccd));
R127i.y = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV1ix) + intBitsToFloat(0x3e4ccccd));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
R126i.x = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(R127i.w) + intBitsToFloat(0x3eb33333));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 2.5);
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(0x3e23d70a));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 0.25);
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(0x3e851eb8));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(PV1iy));
PV0ix = clampFI32(PV0ix);
PV0iz = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(PV1iy));
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1iy));
PV0iw = clampFI32(PV0iw);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R9i.y)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(PV0iz));
// 8
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R9i.x));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R9i.y));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockPS8[33].w) + intBitsToFloat(R9i.z));
// 9
R9i.w = R6i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0iy = floatBitsToInt(uf_blockPS10[2].z + 1.0);
// 1
R13i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iy));
R13i.x = clampFI32(R13i.x);
// 2
predResult = (1.0 > intBitsToFloat(R5i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = ((-(intBitsToFloat(R6i.z)) > uf_blockPS1[58].y)?-1:0);
R5i.y = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(0x3ac49ba6));
PV0iw = ((-(intBitsToFloat(R6i.z)) > uf_blockPS1[58].x)?-1:0);
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R3i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R1i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R4i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R0i.x)));
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iw));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.w));
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
R127i.z = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(PV1iw));
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
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.w)) + intBitsToFloat(R7i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x3903126f) + 0.5);
R1i.z = floatBitsToInt(-(intBitsToFloat(R6i.z)) * intBitsToFloat(0x3ba3d70a));
R0i.w = 0x3f800000;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R127i.x = clampFI32(R127i.x);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R5i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.w = R1i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R5i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R5i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
// 4
R3i.x = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x3a83126f));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R3i.w = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x3a83126f));
R126i.z = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R8i.w) + -(intBitsToFloat(R13i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.y = clampFI32(R123i.y);
R125i.z = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(0xbe99999a));
R127i.w = floatBitsToInt(intBitsToFloat(R11i.w) * intBitsToFloat(0x3dcccccd) + 1.0);
tempResultf = max(0.0, intBitsToFloat(R127i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(PS1i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R127i.z)) + intBitsToFloat(R13i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(PS1i)));
R8i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R126i.x = clampFI32(R126i.x);
PV1iy = floatBitsToInt(max(-(intBitsToFloat(R123i.z)), intBitsToFloat(0xbf7d70a4)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R5i.z = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
R0i.w = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) + 0.5);
R4i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40200001));
R4i.y = clampFI32(R4i.y);
R7i.z = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R12i.y) + 1.0);
R123i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS1i)) + uf_blockPS6[27].w)/2.0);
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
R123i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R6i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 10
R5i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(PS1i))) + uf_blockPS6[27].z);
R5i.y = floatBitsToInt(intBitsToFloat(R11i.w) * 6.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(0xbe593484));
R5i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 75.0);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iz)));
// 11
R7i.x = floatBitsToInt(uf_blockPS6[5].x + -(intBitsToFloat(R8i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R3i.z = floatBitsToInt(uf_blockPS6[5].y + -(intBitsToFloat(R0i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
R7i.y = floatBitsToInt(exp2(intBitsToFloat(R126i.w)));
// 12
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),-(intBitsToFloat(R123i.w))) + 1.0);
R3i.y = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3dcccccd));
R4i.z = floatBitsToInt(uf_blockPS6[5].z + -(intBitsToFloat(R5i.z)));
R4i.w = R2i.w;
R4i.w = clampFI32(R4i.w);
tempResultf = max(0.0, intBitsToFloat(R126i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R4i.x = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(textureLod(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).xyz);
R1i.y = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y)),intBitsToFloat(R1i.w)).x);
R3i.x = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.w)),0.0).x);
R6i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0 + -(1.0));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R1i.y) + uf_blockPS10[1].z);
PV1ix = clampFI32(PV1ix);
R1i.y = floatBitsToInt(intBitsToFloat(R122i.x) * 25.0 + intBitsToFloat(R11i.z));
PV1iz = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(0xbfe66666));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(R4i.x)));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z, intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R7i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3dcccccd));
PV0iw = clampFI32(PV0iw);
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iz));
R122i.x = clampFI32(R122i.x);
// 3
backupReg0i = R126i.w;
R5i.x = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV0iw) + intBitsToFloat(0x3ecccccd));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R122i.x));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R125i.z = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R13i.y),intBitsToFloat(R10i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R13i.x)) + intBitsToFloat(R126i.z));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), uf_blockPS6[16].w));
PV1iy = floatBitsToInt(intBitsToFloat(R122i.x) + uf_blockPS10[1].y);
PV1iy = clampFI32(PV1iy);
R1i.z = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x3fe66666));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R10i.w)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(0xbecccccd));
R127i.x = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3d4ccccd));
R127i.x = clampFI32(R127i.x);
// 7
R4i.x = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R4i.x = clampFI32(R4i.x);
R5i.y = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R5i.y = clampFI32(R5i.y);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 10.0);
PV1iz = clampFI32(PV1iz);
R3i.w = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R3i.w = clampFI32(R3i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 8
backupReg0i = R6i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R127i.y)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R127i.y)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.y)));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(R127i.x) + intBitsToFloat(0x3ecccccd));
PV1iy = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV0iy));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 10
backupReg0i = R123i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(R0i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(PV1iy)) + intBitsToFloat(R8i.x));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R4i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(R5i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockPS6[30].w));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS10[0].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockPS10[0].y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R7i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockPS10[0].z));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(backupReg0i)));
// 12
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R127i.x)));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R127i.w)));
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.w));
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R127i.y)));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),-(intBitsToFloat(R0i.z))) + intBitsToFloat(R126i.y));
// 13
R6i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
R6i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
R4i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3f4ccccd) + intBitsToFloat(0x3e4ccccd));
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS6[4].x,uf_blockPS6[4].y,uf_blockPS6[4].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R14i.y),intBitsToFloat(R12i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1ix = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
PV1iy = floatBitsToInt(-(intBitsToFloat(R1i.y)) + uf_blockPS6[52].x);
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.x = clampFI32(R123i.x);
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockPS6[13].w));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(0xbecccccd));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R7i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R5i.w)));
PV0iy = clampFI32(PV0iy);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R4i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R4i.z)) + intBitsToFloat(R4i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV0iy)));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R5i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV1ix)));
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV1ix)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PV0iy)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iy)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R1i.z)) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R1i.z)) + intBitsToFloat(PV1iy));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.x));
// 9
backupReg0i = R123i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R3i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R8i.x)) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R5i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R4i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R8i.x)) + intBitsToFloat(R125i.z));
// 10
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R8i.x)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R0i.z)) + intBitsToFloat(backupReg0i));
// 11
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R6i.x)) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R6i.y)) + intBitsToFloat(R123i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R0i.z)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.y));
// 12
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.y));
// 13
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.z));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.x));
// 14
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.x)) * 0.25);
PV0iz = floatBitsToInt(-(intBitsToFloat(R6i.y)) * 0.25);
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.z)) * 0.25);
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fb8aa3b));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fb8aa3b));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fb8aa3b));
// 16
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 17
R5i.z = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R5i.z = floatBitsToInt(intBitsToFloat(R5i.z) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 18
R5i.y = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.y)));
// 19
R6i.x = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 4.0);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0iw = ((1.0 > uf_blockPS8[37].x)?-1:0);
R4i.w = floatBitsToInt(uf_blockPS8[37].x);
// 1
R4i.x = ((PV0iw == 0)?(R0i.z):(R5i.z));
R4i.y = ((PV0iw == 0)?(R6i.y):(R5i.y));
R4i.z = ((PV0iw == 0)?(R0i.x):(R6i.x));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
