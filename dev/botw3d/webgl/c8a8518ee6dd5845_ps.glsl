#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c8a8518ee6dd5845
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


UNIFORM_BUFFER_LAYOUT(36, 1, 13) uniform uniformBlockPS4
{
vec4 uf_blockPS4[7];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 14) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(40, 1, 15) uniform uniformBlockPS8
{
vec4 uf_blockPS8[38];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 16) uniform uniformBlockPS10
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
in vec4 passParameterSem2;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
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
R2i = floatBitsToInt(passParameterSem4);
R3i = floatBitsToInt(passParameterSem5);
R4i = floatBitsToInt(passParameterSem7);
R5i = floatBitsToInt(passParameterSem8);
R6i = floatBitsToInt(passParameterSem9);
if( activeMaskStackC[1] == true ) {
R7i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R8i.xy = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R14i.xyz = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iz));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R123i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(PV1iw));
R123i.w = clampFI32(R123i.w);
R7i.x = floatBitsToInt(fract(intBitsToFloat(R5i.y)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R7i.y = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R5i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.y)));
R5i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
backupReg0i = R3i.x;
backupReg1i = R3i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[44].x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0ix));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iy));
R3i.z = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
}
if( activeMaskStackC[1] == true ) {
R15i.xy = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R9i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
PV0iz = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R3i.z)) + 1.0);
R127i.w = clampFI32(R127i.w);
R3i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3d4ccccd));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.y)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(PV0iz)) + 1.0);
R123i.y = clampFI32(R123i.y);
R6i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R5i.w = 0x3f800000;
R5i.x = R6i.x;
// 2
R6i.y = R6i.z;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.y)));
R9i.w = 0;
R0i.z = 0;
// 3
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0iz)) + intBitsToFloat(R8i.y));
R123i.y = clampFI32(R123i.y);
R10i.w = R15i.x;
R10i.w = clampFI32(R10i.w);
R4i.w = R8i.y;
// 4
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R123i.y)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R7i.y)));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R5i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R3i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R3i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R5i.y));
// 6
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS1i)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.x));
R127i.x = floatBitsToInt(tempResultf);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV0iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),intBitsToFloat(R16i.y)) + 1.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R9i.z),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
backupReg0i = R127i.w;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R6i.z)));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(tempResultf);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R16i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R17i.y),intBitsToFloat(R10i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R16i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R9i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R8i.w = tempi.x;
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.z)));
// 12
R10i.y = floatBitsToInt(intBitsToFloat(R127i.z) + 1.0);
R10i.y = clampFI32(R10i.y);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[44].y) + intBitsToFloat(R3i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[43].x));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[45].x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[43].y) + intBitsToFloat(PV0iw));
// 2
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[44].z) + intBitsToFloat(R127i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[45].y) + intBitsToFloat(PV1ix));
// 3
R13i.y = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[43].z) + intBitsToFloat(R125i.y));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)), uf_blockPS1[17].y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[45].z) + intBitsToFloat(R127i.w));
// 5
R10i.x = floatBitsToInt(uf_blockPS1[0].y);
R12i.y = floatBitsToInt(uf_blockPS1[1].y);
R11i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
R11i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R127i.z));
R11i.y = R13i.y;
R12i.z = floatBitsToInt(uf_blockPS1[2].y);
// 7
R8i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R125i.y));
R12i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R3i.z));
R12i.w = clampFI32(R12i.w);
R2i.z = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R3i.z));
R2i.z = clampFI32(R2i.z);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R13i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS4[6].x, uf_blockPS8[37].x));
// 1
R2i.x = floatBitsToInt(fract(uf_blockPS8[36].w));
// 2
predResult = (intBitsToFloat(R2i.x) > 0.0);
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
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R2i.x)) + intBitsToFloat(R14i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R2i.x)) + intBitsToFloat(R14i.y));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R2i.x)) + intBitsToFloat(R14i.z));
// 2
R4i.w = R9i.w;
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
PV0ix = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(0x3dea4a8c));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R9i.w = 0x3e99999a;
tempResultf = max(0.0, intBitsToFloat(R10i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.x = floatBitsToInt(tempResultf);
// 1
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.5);
R127i.y = floatBitsToInt(0.5 * intBitsToFloat(R126i.x) + intBitsToFloat(0x3dcccccd));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
// 3
R126i.y = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(R126i.x) + intBitsToFloat(0x3eb33333));
R127i.z = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(R126i.x) + intBitsToFloat(0x3e4ccccd));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(0x3e23d70a));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 0.25);
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(0x3e851eb8));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.y));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(PV1iz));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(PV1iz));
PV0iy = clampFI32(PV0iy);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1iz));
PV0iw = clampFI32(PV0iw);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R14i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(intBitsToFloat(R14i.x)) + intBitsToFloat(PV0iy));
// 8
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockPS8[33].w) + intBitsToFloat(R14i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R14i.y));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R14i.z));
// 9
R6i.w = R5i.w;
// 10
R4i.w = R5i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(uf_blockPS10[2].z + 1.0);
// 1
R18i.y = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(PV0ix));
R18i.y = clampFI32(R18i.y);
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
R127i.x = ((-(intBitsToFloat(R4i.z)) > uf_blockPS1[58].y)?-1:0);
R6i.y = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(0x3ac49ba6));
PV0iw = ((-(intBitsToFloat(R4i.z)) > uf_blockPS1[58].x)?-1:0);
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
R2i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R3i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R5i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R0i.x)));
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iw));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R123i.x));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.y));
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
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R12i.w)) + intBitsToFloat(R7i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3903126f) + 0.5);
R7i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3ba3d70a));
R0i.w = 0x3f800000;
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R127i.y = clampFI32(R127i.y);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.w = R7i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.x)));
// 4
R3i.x = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x3a83126f));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
R3i.z = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3a83126f));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PS0i = floatBitsToInt(intBitsToFloat(R8i.w) + -(intBitsToFloat(R8i.y)));
// 5
R127i.x = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
R3i.y = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R6i.x)));
R2i.z = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R9i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(PV0iw)) + intBitsToFloat(R8i.y));
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.x = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(max(-(intBitsToFloat(R123i.w)), intBitsToFloat(0xbf7d70a4)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R5i.y = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R6i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(R126i.x)));
R0i.w = floatBitsToInt(-(intBitsToFloat(R6i.x)) * 1.5);
R7i.y = 0x3f19999a;
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
R8i.y = ((intBitsToFloat(R4i.w) > 0.0)?-1:0);
R0i.z = floatBitsToInt(1.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R123i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS1i)) + uf_blockPS6[27].w)/2.0);
R123i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
tempResultf = max(0.0, intBitsToFloat(R10i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3ecccccd));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
R5i.z = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R126i.w = floatBitsToInt(max(intBitsToFloat(R14i.y), intBitsToFloat(R14i.z)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R11i.w) * intBitsToFloat(0x3f99999a));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R7i.x = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 11
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),-(intBitsToFloat(R123i.w))) + 1.0);
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0iy)));
R8i.z = floatBitsToInt(max(intBitsToFloat(R14i.x), intBitsToFloat(R126i.w)));
R3i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(R126i.x)));
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R9i.y = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
R6i.xyz = floatBitsToInt(textureLod(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).xyz);
R2i.y = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y)),intBitsToFloat(R2i.w)).x);
R3i.x = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.z)),0.0).x);
R11i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.z))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(R5i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(R5i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R2i.y) + uf_blockPS10[1].z);
R127i.z = clampFI32(R127i.z);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.w),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.w),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(tempResultf);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(tempResultf);
// 3
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R126i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R126i.w)));
R125i.z = backupReg0i;
// 4
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z, intBitsToFloat(backupReg0i)));
R125i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0 + -(1.0));
// 5
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R17i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w),0.0)));
R127i.x = clampFI32(R127i.x);
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
PS1i = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(R127i.z)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R17i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R18i.y)) + intBitsToFloat(R127i.z));
// 7
R123i.x = ((R8i.y == 0)?(R127i.x):(PV0ix));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R9i.y)));
R127i.z = floatBitsToInt(min(intBitsToFloat(R14i.y), intBitsToFloat(R14i.z)));
R126i.w = floatBitsToInt(intBitsToFloat(R122i.x) + uf_blockPS10[1].y);
R126i.w = clampFI32(R126i.w);
R127i.x = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(0x2edbe6ff));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R16i.y),intBitsToFloat(R9i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(R123i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(0xbecccccd));
R8i.y = floatBitsToInt(intBitsToFloat(R125i.x) * 25.0 + intBitsToFloat(R13i.y));
R125i.z = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 12.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
R125i.x = floatBitsToInt(min(intBitsToFloat(R14i.x), intBitsToFloat(R127i.z)));
R126i.y = R1i.w;
R126i.y = clampFI32(R126i.y);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * 10.0);
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
PS0i = clampFI32(PS0i);
// 11
R124i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40200001));
R124i.x = clampFI32(R124i.x);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R127i.w = clampFI32(R127i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R4i.y) + -(1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R10i.y)) + intBitsToFloat(0xbc23d70a));
R125i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R10i.y)) + intBitsToFloat(0xbd4ccccd));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R3i.w)));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(PS0i))) + uf_blockPS6[27].z);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R126i.y)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * 20.0);
PV1iz = clampFI32(PV1iz);
R3i.w = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R15i.y) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) * 50.0);
PV0ix = clampFI32(PV0ix);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(R125i.z)) + intBitsToFloat(R125i.z));
R125i.z = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3dcccccd));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3df5c28f));
R4i.w = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 15
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(PV0iw));
R125i.x = clampFI32(R125i.x);
R125i.y = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(0xbfe66666));
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R4i.w)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS6[30].w));
tempResultf = max(0.0, intBitsToFloat(R8i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 16
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R3i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R11i.w) * intBitsToFloat(0x3dcccccd) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(0x3da3d70a));
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f19999a));
tempResultf = max(0.0, intBitsToFloat(R127i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 17
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R125i.x)));
R7i.x = clampFI32(R7i.x);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) * 3.0 + 3.0);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.y));
R127i.w = clampFI32(R127i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 18
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R3i.w)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PS1i)) + intBitsToFloat(PS1i));
R7i.z = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
R0i.w = floatBitsToInt(intBitsToFloat(R127i.y) * 75.0);
R4i.x = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 19
R3i.x = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3f4ccccd));
R9i.y = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(0x2edbe6ff));
R2i.z = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3f4ccccd));
R2i.w = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3f4ccccd));
R6i.z = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R127i.w));
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS6[4].x,uf_blockPS6[4].y,uf_blockPS6[4].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R17i.y),intBitsToFloat(R10i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R7i.z)) + intBitsToFloat(R7i.z));
// 1
PV1ix = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
R125i.y = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R4i.y));
R125i.y = clampFI32(R125i.y);
PV1iz = floatBitsToInt(-(intBitsToFloat(R8i.y)) + uf_blockPS6[52].x);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[16].w));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R7i.x)) + intBitsToFloat(R4i.z));
R127i.y = clampFI32(R127i.y);
// 2
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R10i.y)) + intBitsToFloat(R8i.z));
R124i.x = clampFI32(R124i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.y = clampFI32(R123i.y);
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS6[13].w));
PV1iy = floatBitsToInt(uf_blockPS6[5].x + -(intBitsToFloat(R3i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(0xbecccccd));
PV1iw = floatBitsToInt(uf_blockPS6[5].y + -(intBitsToFloat(R2i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R0i.w)));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(uf_blockPS6[5].z + -(intBitsToFloat(R2i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R3i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R125i.y)) + intBitsToFloat(R3i.x));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R125i.y)) + intBitsToFloat(R2i.w));
// 5
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R125i.y)) + intBitsToFloat(R2i.z));
R125i.y = floatBitsToInt(-(intBitsToFloat(R6i.z)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R124i.x)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R9i.w));
R4i.w = clampFI32(R4i.w);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R125i.x)) + intBitsToFloat(R125i.x));
// 6
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R14i.x) + -(intBitsToFloat(R8i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(backupReg0i)));
R125i.z = floatBitsToInt(intBitsToFloat(R14i.z) + -(intBitsToFloat(R8i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R14i.y) + -(intBitsToFloat(R8i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(PV1iz));
// 7
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R10i.w)) + intBitsToFloat(R6i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV0iy)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV0iy)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV0iy)));
// 8
backupReg0i = R125i.x;
backupReg1i = R125i.z;
backupReg2i = R127i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(backupReg2i)) + intBitsToFloat(R8i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg2i)) + intBitsToFloat(R8i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R124i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg2i)) + intBitsToFloat(R8i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R124i.x)));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(R127i.z)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R124i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),-(intBitsToFloat(R5i.x))) + intBitsToFloat(R6i.x));
// 10
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(0xba0a8ec8));
R6i.x = clampFI32(R6i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(0xba0a8ec8));
R11i.z = clampFI32(R11i.z);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(0xba0a8ec8));
R2i.w = clampFI32(R2i.w);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.z));
// 11
R11i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.w));
R11i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R5i.x)) + intBitsToFloat(R122i.x));
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.w));
R3i.w = ((1.0 > intBitsToFloat(R13i.z))?-1:0);
// 12
R5i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.w));
R8i.w = R13i.z;
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS10[0].y));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R4i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockPS10[0].x));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockPS10[0].z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R125i.y)) + intBitsToFloat(R1i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R125i.y)) + intBitsToFloat(R1i.y));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R2i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R6i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R125i.y)) + intBitsToFloat(R1i.z));
// 3
backupReg0i = R123i.z;
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R11i.z)));
// 4
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(R11i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(R4i.z));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(R5i.x));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) * 0.25);
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) * 0.25);
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fb8aa3b));
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.x)) * 0.25);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3fb8aa3b));
// 7
R125i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fb8aa3b));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 8
PV0iz = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 9
R8i.x = ((R3i.w == 0)?(R125i.z):(PV0iz));
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.x)));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
R8i.y = ((R3i.w == 0)?(R125i.y):(PV1iy));
// 11
R8i.z = ((R3i.w == 0)?(R124i.x):(PV0ix));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
}
