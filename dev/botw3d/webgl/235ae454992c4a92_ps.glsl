#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 235ae454992c4a92
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 15) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 16) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(40, 1, 17) uniform uniformBlockPS8
{
vec4 uf_blockPS8[38];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 18) uniform uniformBlockPS10
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
TEXTURE_LAYOUT(12, 1, 11) uniform sampler2D textureUnitPS12;
TEXTURE_LAYOUT(13, 1, 12) uniform sampler2D textureUnitPS13;
TEXTURE_LAYOUT(14, 1, 13) uniform sampler2D textureUnitPS14;
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
R7i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
R8i.xyz = floatBitsToInt(texture(textureUnitPS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R9i.xyz = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R10i.xyz = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyz);
R5i.w = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).x);
R14i.z = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iz));
// 2
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(PV1iw));
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R123i.z)));
R125i.w = floatBitsToInt(fract(intBitsToFloat(R5i.x)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.w)));
R2i.w = floatBitsToInt(fract(intBitsToFloat(R5i.y)));
R6i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iy));
R5i.y = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0ix));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
R3i.y = floatBitsToInt(sqrt(intBitsToFloat(R126i.x)));
}
if( activeMaskStackC[1] == true ) {
R11i.xy = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R3i.y)) + intBitsToFloat(R3i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(R3i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R3i.y)) + intBitsToFloat(R3i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[44].x));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 1
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.w)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.w) + -(0.5));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[43].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[44].y) + intBitsToFloat(PV0iw));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[45].x));
// 3
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.y)),intBitsToFloat(R12i.y)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R8i.y) + -(1.0));
R126i.z = floatBitsToInt(intBitsToFloat(R8i.x) + -(1.0));
R126i.w = floatBitsToInt(intBitsToFloat(R8i.z) + -(1.0));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R124i.y = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[43].y) + intBitsToFloat(R125i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R127i.z)) + 1.0);
R123i.y = clampFI32(R123i.y);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[44].z) + intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(R5i.y)) + 1.0);
R123i.w = clampFI32(R123i.w);
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R127i.w)));
// 5
backupReg0i = R126i.y;
backupReg1i = R126i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[45].y) + intBitsToFloat(R127i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),uf_blockPS8[31].y) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),uf_blockPS8[31].y) + 1.0);
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),uf_blockPS8[31].y) + 1.0);
// 6
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(intBitsToFloat(R10i.x) + -(1.0));
R127i.y = floatBitsToInt(-(uf_blockPS8[24].y) + intBitsToFloat(R9i.y));
R126i.z = floatBitsToInt(-(uf_blockPS8[24].z) + intBitsToFloat(R9i.z));
PV0iw = floatBitsToInt(-(uf_blockPS8[24].x) + intBitsToFloat(backupReg0i));
R8i.x = floatBitsToInt(intBitsToFloat(R10i.y) + -(1.0));
// 7
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R124i.y)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.y)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R10i.z) + -(1.0));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R126i.y)) + uf_blockPS8[24].x);
// 8
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R16i.z),0.0)));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R126i.w)) + uf_blockPS8[24].y);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R127i.x)) + uf_blockPS8[24].z);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[43].z) + intBitsToFloat(R125i.x));
R124i.w = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3d4ccccd));
R9i.w = 0x3f800000;
// 10
R17i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R124i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[45].z) + intBitsToFloat(R124i.x));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1ix)));
// 11
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),uf_blockPS8[31].x) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockPS8[31].x) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),uf_blockPS8[31].x) + 1.0);
R6i.y = R17i.z;
// 12
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.y)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.z)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.w)));
R10i.w = R11i.x;
R10i.w = clampFI32(R10i.w);
R6i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R125i.w));
// 13
R2i.y = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R124i.w));
R2i.y = clampFI32(R2i.y);
R12i.z = floatBitsToInt(intBitsToFloat(R10i.x) + 1.0);
R12i.z = clampFI32(R12i.z);
R4i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R124i.w));
R4i.w = clampFI32(R4i.w);
R3i.y = floatBitsToInt(fract(uf_blockPS8[36].w));
// 14
tempResultf = 1.0 / sqrt(intBitsToFloat(R2i.x));
R5i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R8i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),intBitsToFloat(R8i.y)) + 1.0);
R9i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R2i.x = R10i.x;
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R9i.z)));
R5i.y = R9i.z;
R2i.z = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R15i.z),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R5i.w)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R126i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R8i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R6i.w = tempi.x;
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)), uf_blockPS1[17].y));
R8i.x = floatBitsToInt(uf_blockPS1[0].y);
// 1
R15i.y = floatBitsToInt(uf_blockPS1[1].y);
R11i.z = floatBitsToInt(uf_blockPS1[2].y);
R8i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
predResult = (intBitsToFloat(R3i.y) > 0.0);
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
PV0ix = floatBitsToInt(-(intBitsToFloat(R13i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R13i.x)) + intBitsToFloat(R0i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R13i.z)) + intBitsToFloat(R0i.z));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R3i.y)) + intBitsToFloat(R13i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R3i.y)) + intBitsToFloat(R13i.y));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.y)) + intBitsToFloat(R13i.z));
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
R0i.y = floatBitsToInt(texture(textureUnitPS7, vec3(intBitsToFloat(R0i.y),intBitsToFloat(R0i.y),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R13i.z) * intBitsToFloat(0x3dea4a8c));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R11i.w = 0x3e99999a;
tempResultf = max(0.0, intBitsToFloat(R12i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.x = floatBitsToInt(tempResultf);
// 1
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
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
PV1ix = floatBitsToInt(-(intBitsToFloat(R13i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R13i.y)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(intBitsToFloat(R13i.x)) + intBitsToFloat(PV0iy));
// 8
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockPS8[33].w) + intBitsToFloat(R13i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R13i.y));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R13i.z));
// 9
R12i.w = R9i.w;
// 10
R0i.w = R9i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R11i.w = 0;
// 1
R0i.w = R11i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0iy = floatBitsToInt(uf_blockPS10[2].z + 1.0);
// 1
R11i.x = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iy));
R11i.x = clampFI32(R11i.x);
// 2
predResult = (1.0 > intBitsToFloat(R4i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R6i.x = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(0x3ac49ba6));
R127i.y = ((-(intBitsToFloat(R4i.z)) > uf_blockPS1[58].y)?-1:0);
PV0iw = ((-(intBitsToFloat(R4i.z)) > uf_blockPS1[58].x)?-1:0);
// 1
PV1ix = PV0iw & int(1);
// 2
PV0iz = PV1ix - R127i.y;
// 3
PV1iw = PV0iz << 0x2;
PS1i = floatBitsToInt(float(PV0iz));
// 4
R0i.x = PV1iw + 0x2a;
R0i.y = PV1iw + 0x2c;
R0i.z = PV1iw + 0x2b;
R0i.w = PV1iw + 0x2d;
R7i.z = floatBitsToInt(roundEven(intBitsToFloat(PS1i)));
}
if( activeMaskStackC[2] == true ) {
R2i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R2i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R3i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R5i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R0i.x)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iw));
// 3
backupReg0i = R123i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(backupReg0i));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PS0i)));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
// 6
R127i.w = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(PV1ix));
// 7
PV1iy = ((intBitsToFloat(0x3727c5ac) > intBitsToFloat(R127i.w))?-1:0);
// 8
R123i.y = ((PV1iy == 0)?(R127i.w):(0x3727c5ac));
// 9
R7i.w = R123i.y;
R7i.w = clampFI32(R7i.w);
}
if( activeMaskStackC[2] == true ) {
R7i.x = floatBitsToInt(texture(textureUnitPS1, vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 1
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R4i.w)) + intBitsToFloat(R7i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(0x3903126f) + 0.5);
R8i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3ba3d70a));
R0i.w = 0x3f800000;
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R126i.z = clampFI32(R126i.z);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.w = R8i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
// 4
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
R0i.z = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(0x3a83126f));
R0i.w = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(0x3a83126f));
R126i.x = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
// 5
R7i.x = floatBitsToInt(intBitsToFloat(R12i.x) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R10i.x)));
R6i.y = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R8i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(R10i.z)));
R3i.w = floatBitsToInt(intBitsToFloat(R15i.z) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R9i.z)));
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.w = floatBitsToInt(tempResultf);
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R127i.x)) + intBitsToFloat(R10i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(R127i.w)));
R2i.z = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R10i.x));
R4i.w = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(R8i.y));
R6i.z = floatBitsToInt(intBitsToFloat(R15i.z) + intBitsToFloat(R9i.z));
// 7
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(max(intBitsToFloat(R13i.y), intBitsToFloat(R13i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0x3f99999a));
R127i.z = clampFI32(R127i.z);
PV1iw = floatBitsToInt(max(-(intBitsToFloat(backupReg0i)), intBitsToFloat(0xbf7d70a4)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R123i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS1i)) + uf_blockPS6[27].w)/2.0);
R126i.z = floatBitsToInt(intBitsToFloat(PV1iw) + 0.5);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(R12i.w)));
R126i.x = floatBitsToInt(max(-(intBitsToFloat(R6i.w)), 0.0));
// 9
backupReg0i = R123i.y;
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R3i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.5);
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iw)));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.w = floatBitsToInt(tempResultf);
// 10
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0xbe593484));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(R127i.w)));
R9i.z = floatBitsToInt(max(intBitsToFloat(R13i.x), intBitsToFloat(backupReg0i)));
R7i.w = floatBitsToInt(min(intBitsToFloat(R126i.x), 1.0));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 11
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R126i.w)));
R3i.y = floatBitsToInt(min(intBitsToFloat(R13i.y), intBitsToFloat(R13i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.x)) + intBitsToFloat(0x3fc90da4));
R7i.y = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(0x2edbe6ff));
// 12
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),-(intBitsToFloat(R123i.w))) + 1.0);
R8i.y = R1i.w;
R8i.y = clampFI32(R8i.y);
R7i.z = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0x3dcccccd) + 1.0);
R5i.w = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
R9i.y = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
}
if( activeMaskStackC[1] == true ) {
R5i.xyz = floatBitsToInt(textureLod(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).xyz);
R2i.w = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y)),intBitsToFloat(R2i.w)).x);
R2i.x = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),0.0).x);
R10i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.z))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0 + -(1.0));
// 1
backupReg0i = R6i.x;
R6i.x = floatBitsToInt(intBitsToFloat(R122i.x) * 25.0 + intBitsToFloat(R17i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.w) + uf_blockPS10[1].z);
R127i.y = clampFI32(R127i.y);
R125i.z = floatBitsToInt(min(intBitsToFloat(R13i.x), intBitsToFloat(R3i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.z),intBitsToFloat(R4i.w),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.z),intBitsToFloat(R4i.w),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(R9i.w) + -(intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PS1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
backupReg0i = R126i.z;
backupReg1i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R11i.x)) + intBitsToFloat(backupReg0i));
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z, intBitsToFloat(backupReg1i)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R16i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) + uf_blockPS10[1].y);
R126i.y = clampFI32(R126i.y);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R16i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R126i.y = floatBitsToInt(intBitsToFloat(PS1i) * 20.0);
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(0xbecccccd));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R126i.w = clampFI32(R126i.w);
R0i.x = floatBitsToInt(1.0 / intBitsToFloat(R7i.y));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R15i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R15i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
// 10
R7i.x = floatBitsToInt(intBitsToFloat(R7i.z) * 75.0);
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) * 10.0);
PV0iy = clampFI32(PV0iy);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w),intBitsToFloat(PS1i)) + -(0.5));
R4i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3f4ccccd));
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 11
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.z) * 40.0);
PV1iz = clampFI32(PV1iz);
R3i.w = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3f4ccccd));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.y)));
PS1i = clampFI32(PS1i);
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.x) + -(1.0));
R5i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(0x40200001));
R5i.w = clampFI32(R5i.w);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R8i.y)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R6i.w)) + intBitsToFloat(0xbd4ccccd));
R123i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS0i)) + 1.0);
R8i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e19999a));
R8i.w = clampFI32(R8i.w);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R6i.w)) + intBitsToFloat(0xbc23d70a));
// 14
backupReg0i = R125i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * 20.0);
PV0ix = clampFI32(PV0ix);
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R9i.y))) + uf_blockPS6[27].z);
R7i.z = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R11i.y) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R123i.z)) + intBitsToFloat(R123i.z));
tempResultf = max(0.0, intBitsToFloat(R9i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.x = floatBitsToInt(tempResultf);
// 15
R2i.x = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R125i.x));
R2i.x = clampFI32(R2i.x);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3df5c28f));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) * 50.0);
PV1iz = clampFI32(PV1iz);
R6i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R0i.x)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(R126i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.x = floatBitsToInt(tempResultf);
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(PV1iy));
R127i.x = clampFI32(R127i.x);
R4i.y = floatBitsToInt(-(intBitsToFloat(R8i.w)) + intBitsToFloat(R126i.x));
R125i.z = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(0x3dcccccd));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f19999a));
R126i.z = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(0xbfe66666));
// 17
R3i.x = floatBitsToInt(intBitsToFloat(R14i.z) + -(0.5));
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 4.0);
R3i.x = clampFI32(R3i.x);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R7i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), uf_blockPS6[30].w));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(R125i.x)));
PS1i = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(0x3da3d70a));
PS1i = clampFI32(PS1i);
// 18
R4i.x = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R9i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R126i.z)) + intBitsToFloat(R126i.z));
R9i.y = clampFI32(R9i.y);
R123i.z = floatBitsToInt(-(intBitsToFloat(R6i.w)) * 3.0 + 3.0);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.x)));
R2i.w = clampFI32(R2i.w);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.w)));
// 19
R5i.x = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3f4ccccd));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R7i.z)));
R0i.w = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(0x2edbe6ff));
R8i.z = floatBitsToInt(exp2(intBitsToFloat(R125i.w)));
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS6[4].x,uf_blockPS6[4].y,uf_blockPS6[4].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R16i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(0x3f4ccccd));
R125i.w = clampFI32(R125i.w);
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R6i.x)) + uf_blockPS6[52].x);
PV1iy = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
PV1iz = floatBitsToInt(uf_blockPS6[5].y + -(intBitsToFloat(R3i.w)));
PV1iw = floatBitsToInt(uf_blockPS6[5].x + -(intBitsToFloat(R4i.w)));
R124i.x = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R9i.y));
// 2
PV0ix = floatBitsToInt(min(intBitsToFloat(PV1iy), 1.0));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R2i.x)) + intBitsToFloat(R4i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.z = clampFI32(R123i.z);
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R2i.x)) + intBitsToFloat(R3i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R4i.x)) + intBitsToFloat(R4i.x));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(R2i.w)) + intBitsToFloat(R6i.w));
R127i.x = clampFI32(R127i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), uf_blockPS6[16].w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockPS6[13].w));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0xbecccccd));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R8i.y)) + intBitsToFloat(R9i.z));
R126i.x = clampFI32(R126i.x);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R7i.z)));
PV0iy = floatBitsToInt(uf_blockPS6[5].z + -(intBitsToFloat(R5i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R7i.x)));
PV0iz = clampFI32(PV0iz);
R127i.w = floatBitsToInt(intBitsToFloat(R7i.w) * 5.0);
R127i.w = clampFI32(R127i.w);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R8i.w));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) + -(1.0));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R2i.x)) + intBitsToFloat(R5i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R125i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
// 6
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R127i.w)) + 1.0);
R125i.y = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(R9i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R126i.x)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(R13i.z) + -(intBitsToFloat(R9i.z)));
// 7
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.z));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),-(intBitsToFloat(R8i.w))) + intBitsToFloat(R1i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R125i.x = floatBitsToInt(intBitsToFloat(R13i.x) + -(intBitsToFloat(R9i.z)));
// 8
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R0i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R10i.w)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV1iz)));
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV1iz)));
// 9
backupReg0i = R125i.x;
backupReg1i = R126i.y;
backupReg2i = R9i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(backupReg1i)) + intBitsToFloat(backupReg2i));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)) + intBitsToFloat(backupReg2i));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R3i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(backupReg1i)) + intBitsToFloat(backupReg2i));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R127i.z)));
// 10
backupReg0i = R127i.z;
backupReg1i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(backupReg0i)));
PV0iy = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(R125i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(R124i.x)) + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(backupReg0i)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(R124i.x)) + intBitsToFloat(backupReg1i));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),-(intBitsToFloat(R4i.z))) + intBitsToFloat(R7i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(R124i.x)) + intBitsToFloat(R126i.x));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.y)) + intBitsToFloat(0xba0a8ec8));
R8i.z = clampFI32(R8i.z);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R125i.x)) + intBitsToFloat(0xba0a8ec8));
R0i.w = clampFI32(R0i.w);
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R125i.w)) + intBitsToFloat(0xba0a8ec8));
R10i.z = clampFI32(R10i.z);
// 12
R10i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R0i.x)) + intBitsToFloat(R0i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(R125i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R123i.x)) + intBitsToFloat(R127i.z));
// 13
backupReg0i = R4i.z;
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.w));
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.y));
R7i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), uf_blockPS10[0].y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockPS10[0].x));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, intBitsToFloat(R8i.w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), uf_blockPS10[0].z));
R126i.y = ((1.0 > uf_blockPS8[37].x)?-1:0);
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3d23d70a));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3da3d70a));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(R1i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(R1i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R127i.z)) + intBitsToFloat(R9i.z));
R1i.w = floatBitsToInt(uf_blockPS8[37].x);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R10i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R3i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R3i.x)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iz));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R0i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R8i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(R4i.z));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) * 0.25);
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fb8aa3b));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(R7i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(R0i.x));
// 8
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) * 0.25);
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.z)) * 0.25);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fb8aa3b));
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 4.0);
R125i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fb8aa3b));
// 10
R1i.z = ((R126i.y == 0)?(R127i.z):(PV1iy));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 11
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
// 12
R1i.x = ((R126i.y == 0)?(R126i.z):(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
// 13
R1i.y = ((R126i.y == 0)?(R125i.y):(PV0iy));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
