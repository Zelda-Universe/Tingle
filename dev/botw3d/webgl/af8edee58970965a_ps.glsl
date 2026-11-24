#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader af8edee58970965a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 6) uniform uniformBlockPS1
{
vec4 uf_blockPS1[14];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 7) uniform uniformBlockPS6
{
vec4 uf_blockPS6[46];
};


UNIFORM_BUFFER_LAYOUT(43, 1, 8) uniform uniformBlockPS11
{
vec4 uf_blockPS11[4096];
};


UNIFORM_BUFFER_LAYOUT(44, 1, 9) uniform uniformBlockPS12
{
vec4 uf_blockPS12[20];
};


UNIFORM_BUFFER_LAYOUT(45, 1, 10) uniform uniformBlockPS13
{
vec4 uf_blockPS13[15];
};


TEXTURE_LAYOUT(7, 1, 0) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 1) uniform sampler2DArray textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 2) uniform sampler2DArray textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 3) uniform sampler2DArray textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 4) uniform sampler2DArray textureUnitPS11;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
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
if( activeMaskStackC[1] == true ) {
// 0
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[43].x));
PV0iw = floatBitsToInt(uf_blockPS12[12].x);
// 1
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[14].x) + uf_blockPS12[14].z);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[14].y) + uf_blockPS12[14].w);
R5i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
}
if( activeMaskStackC[1] == true ) {
R7i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z))).xyzw);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockPS6[43].y) + intBitsToFloat(R6i.y));
R2i.y = floatBitsToInt(intBitsToFloat(R7i.y) * 2.0 + -(1.0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[45].x));
R6i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 2.0 + -(1.0));
// 1
R7i.x = R6i.x;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockPS6[45].y) + intBitsToFloat(PV0iz));
R2i.z = R2i.y;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockPS6[43].z) + intBitsToFloat(R123i.x));
R12i.x = R7i.z;
// 2
R13i.x = floatBitsToInt(uf_blockPS1[0].y);
R12i.y = R7i.w;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockPS6[45].z) + intBitsToFloat(R123i.y));
// 3
R9i.y = floatBitsToInt(uf_blockPS1[1].y);
R8i.z = floatBitsToInt(uf_blockPS1[2].y);
// 4
R8i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R127i.w));
R9i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R126i.w));
// 5
predResult = (intBitsToFloat(R0i.w) > 0.5);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),uf_blockPS13[14].x) + uf_blockPS13[14].z);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),uf_blockPS13[14].y) + uf_blockPS13[14].w);
// 1
R1i.z = floatBitsToInt(uf_blockPS13[12].x);
// 2
R5i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[2] == true ) {
R5i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z))).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(R5i.z));
R123i.y = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(R5i.w));
R123i.w = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R123i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.w));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R7i.z));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R6i.x));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R7i.w));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R2i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(uf_blockPS12[17].x);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R0i.x)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R4i.z));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[19].x) + uf_blockPS12[19].z);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[19].y) + uf_blockPS12[19].w);
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iz)));
R1i.w = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R0i.x = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[1] == true ) {
R1i.xy = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R1i.y) * 255.0 + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(R1i.x) * 255.0 + 0.5);
R123i.z = ((intBitsToFloat(R1i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(R0i.x));
PS0i = floatBitsToInt(-(intBitsToFloat(R4i.y)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R4i.x));
PV1iy = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(PS0i));
PV1iz = R12i.y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R127i.w = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = int(intBitsToFloat(R123i.y));
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R127i.w)) + intBitsToFloat(R4i.z));
R1i.y = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
R1i.y = clampFI32(R1i.y);
R0i.z = PS1i + 0x9;
PV0iw = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(backupReg0i));
PS0i = int(intBitsToFloat(R127i.x));
// 3
R0i.x = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R127i.w)) + intBitsToFloat(R4i.x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R7i.x)));
R1i.w = PS0i + 0x9;
R1i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].x, intBitsToFloat(R7i.x)));
}
if( activeMaskStackC[1] == true ) {
R5i.xyzw = floatBitsToInt(uf_blockPS11[R0i.z].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockPS11[R1i.w].xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(R4i.z));
PV0iy = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R0i.y));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R5i.w)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R6i.w)));
R127i.w = R5i.z;
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(PV0iw)));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(PV0iz)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R1i.y)) + intBitsToFloat(R4i.x));
PV1iw = R6i.z;
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R5i.y)));
// 2
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R5i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R6i.y)));
R4i.z = floatBitsToInt(roundEven(intBitsToFloat(R127i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R6i.x)));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV1iw)));
// 3
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x39800000));
R5i.y = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3e06dfc6));
R5i.z = R4i.z;
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x39800000));
R5i.x = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x3e06dfc6));
// 4
R6i.x = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e06dfc6));
R6i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e06dfc6));
R6i.z = R0i.z;
R5i.w = floatBitsToInt(-3.5 * intBitsToFloat(R126i.x) + 3.0);
R6i.w = floatBitsToInt(-3.5 * intBitsToFloat(R127i.w) + 3.0);
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].x, intBitsToFloat(R7i.x)));
R7i.y = 0;
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].x, intBitsToFloat(R7i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(R1i.z));
PS1i = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.w));
// 6
PV0ix = floatBitsToInt(uf_blockPS1[13].w);
PV0iy = floatBitsToInt(uf_blockPS1[11].w);
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV0iz = clampFI32(PV0iz);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R12i.x)) + intBitsToFloat(R126i.x));
R4i.w = 0;
// 7
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(uf_blockPS1[0].x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].y,intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].y,intBitsToFloat(R127i.y)) + intBitsToFloat(R1i.x));
R12i.w = 0x3f800000;
// 9
R10i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].z,intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R3i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].y,intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.x));
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R1i.z = floatBitsToInt(tempResultf);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV1iz));
R8i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].z,intBitsToFloat(R2i.z)) + intBitsToFloat(R126i.y));
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].z,intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x378bcf65) + intBitsToFloat(0xbd2aaaab));
R127i.w = clampFI32(R127i.w);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R8i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,uf_blockPS1[12].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R123i.x));
// 12
R1i.x = floatBitsToInt(uf_blockPS1[0].z);
R1i.y = floatBitsToInt(uf_blockPS1[0].y);
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 0.5);
PV0iz = clampFI32(PV0iz);
R3i.w = R127i.w;
R3i.w = floatBitsToInt(intBitsToFloat(R3i.w) / 2.0);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R122i.x)));
// 13
R9i.x = floatBitsToInt(uf_blockPS1[1].x);
R2i.y = floatBitsToInt(uf_blockPS1[1].y);
R2i.z = floatBitsToInt(uf_blockPS1[1].z);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 6.5);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 14
backupReg0i = R3i.y;
backupReg1i = R3i.z;
R7i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS1i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(PS1i)));
R3i.x = floatBitsToInt(uf_blockPS1[2].x);
}
if( activeMaskStackC[1] == true ) {
R5i.xy = floatBitsToInt(texture(textureUnitPS11, vec3(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z)),-3.75).xy);
R6i.xy = floatBitsToInt(texture(textureUnitPS11, vec3(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z)),-3.75).xy);
R4i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyz);
R0i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R0i.w),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
R11i.xyz = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R123i.y = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.y = floatBitsToInt(uf_blockPS1[2].y);
// 1
R127i.x = floatBitsToInt(uf_blockPS1[2].z);
PV1iy = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R0i.x));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(R0i.y));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R12i.x)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R12i.x)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(R0i.z));
R126i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R12i.x)) + intBitsToFloat(R4i.x))*2.0);
R127i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R12i.x)) + intBitsToFloat(R4i.y))*2.0);
// 3
R126i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R12i.x)) + intBitsToFloat(R4i.z))*2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R1i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R2i.w)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R3i.z)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockPS6[23].z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockPS6[23].z));
R125i.y = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 5
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0iy)) + 0.5);
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),uf_blockPS6[23].y) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x),intBitsToFloat(R3i.y)) + intBitsToFloat(backupReg0i));
R123i.z = clampFI32(R123i.z);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), uf_blockPS6[23].z));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS6[23].y) + intBitsToFloat(PV0iz));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),uf_blockPS6[23].y) + intBitsToFloat(PV1iw));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockPS6[23].x) + intBitsToFloat(R122i.x));
PV0iz = backupReg0i;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),uf_blockPS6[23].x) + intBitsToFloat(R123i.y));
tempResultf = max(0.0, intBitsToFloat(R123i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),uf_blockPS6[23].x) + intBitsToFloat(R123i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0iz)));
// 8
R127i.x = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), -(intBitsToFloat(R4i.w))));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R8i.y),intBitsToFloat(R7i.z),intBitsToFloat(PV0iy)),vec4(-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R127i.w)),-(intBitsToFloat(R127i.z)),1.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS0i)) + 1.0);
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R122i.x)) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.x)) + intBitsToFloat(0xba0a8ec8));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.y)) + intBitsToFloat(0xba0a8ec8));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.w)) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x,intBitsToFloat(PV1ix)) + intBitsToFloat(R11i.x));
// 11
backupReg0i = R123i.z;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z,intBitsToFloat(R126i.y)) + intBitsToFloat(R11i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y,intBitsToFloat(R126i.y)) + intBitsToFloat(R11i.y));
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R122i.x = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R122i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), uf_blockPS6[30].w));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iz));
// 14
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.y));
R12i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.x));
R12i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
}
