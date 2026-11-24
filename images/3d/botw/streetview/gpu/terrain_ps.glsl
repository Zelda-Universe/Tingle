#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader fb2d0efc923bf516
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
uniform vec4 uf_blockPS1[18];


uniform vec4 uf_blockPS6[46];


uniform vec4 uf_blockPS8[33];


uniform vec4 uf_blockPS11[265];


uniform vec4 uf_blockPS12[20];


uniform vec4 uf_blockPS13[15];


TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2DArray textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 4) uniform sampler2DArray textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 5) uniform sampler2DArray textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 6) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor3;
layout(location = 3) out vec4 zmShadow;
layout(location = 4) out vec4 zmEmissive;
uniform float zmSunShadow;
vec4 passPixelColor7;
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
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem3);
R4i = floatBitsToInt(passParameterSem4);
R5i = floatBitsToInt(passParameterSem5);
if( activeMaskStackC[1] == true ) {
// 0
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[43].x));
PV0iw = floatBitsToInt(uf_blockPS12[12].x);
R6i.w = floatBitsToInt(1.0 / intBitsToFloat(R5i.w));
// 1
backupReg0i = R6i.w;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[14].x) + uf_blockPS12[14].z);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[14].y) + uf_blockPS12[14].w);
R6i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(backupReg0i)));
}
if( activeMaskStackC[1] == true ) {
R7i.xyzw = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z))).xyzw);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R6i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 2.0 + -(1.0));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockPS6[43].y) + intBitsToFloat(R5i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[45].x));
R6i.y = floatBitsToInt(intBitsToFloat(R7i.y) * 2.0 + -(1.0));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockPS6[43].z) + intBitsToFloat(R123i.y));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R6i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockPS6[45].y) + intBitsToFloat(PV0iw));
R11i.x = R6i.x;
// 2
R12i.x = floatBitsToInt(uf_blockPS1[0].y);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockPS6[45].z) + intBitsToFloat(R123i.z));
R10i.z = R6i.y;
R13i.x = R7i.z;
// 3
R2i.y = floatBitsToInt(uf_blockPS1[1].y);
R12i.z = floatBitsToInt(uf_blockPS1[2].y);
R13i.y = R7i.w;
// 4
R7i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R127i.x));
R8i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R127i.y));
// 5
R11i.z = floatBitsToInt(intBitsToFloat(R3i.z) + uf_blockPS1[14].x);
// 6
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
R5i.xyzw = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z))).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(R5i.z));
R123i.y = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(R5i.w));
R123i.w = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R123i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(R123i.w));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R7i.z));
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R6i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R7i.w));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R6i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R0i.x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.y)));
PV0iw = floatBitsToInt(uf_blockPS12[17].x);
R0i.w = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R4i.z));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[19].x) + uf_blockPS12[19].z);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[19].y) + uf_blockPS12[19].w);
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
R1i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R0i.x = floatBitsToInt(max(intBitsToFloat(PV0iy), intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[1] == true ) {
R1i.xy = floatBitsToInt(texture(textureUnitPS7, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xy);
R2i.w = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = ((intBitsToFloat(R1i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.y) * 255.0 + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(R1i.x) * 255.0 + 0.5);
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.x));
PS0i = floatBitsToInt(-(intBitsToFloat(R4i.y)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R123i.x)) + intBitsToFloat(R4i.x));
R126i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(PS0i));
PV1iw = R13i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = int(intBitsToFloat(R123i.z));
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R126i.y)) + intBitsToFloat(R4i.z));
PV0iy = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(backupReg0i));
R1i.z = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
R1i.z = clampFI32(R1i.z);
R0i.w = PS1i + 0x9;
PS0i = int(intBitsToFloat(R127i.y));
// 3
R0i.x = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.x));
R1i.y = floatBitsToInt(uf_blockPS1[11].w);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.y)) + intBitsToFloat(R4i.x));
R1i.w = PS0i + 0x9;
R2i.z = floatBitsToInt(uf_blockPS1[13].w);
}
if( activeMaskStackC[1] == true ) {
R5i.xyzw = floatBitsToInt(uf_blockPS11[R0i.w].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockPS11[R1i.w].xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(fract(intBitsToFloat(R5i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R1i.z)) + intBitsToFloat(R4i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R0i.z));
R127i.w = floatBitsToInt(fract(intBitsToFloat(R6i.w)));
R126i.x = floatBitsToInt(intBitsToFloat(R7i.x) + -(intBitsToFloat(R1i.y)));
// 1
PV1ix = R6i.z;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R5i.y)));
PV1iz = R5i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R1i.z)) + intBitsToFloat(R4i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R6i.y)));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R5i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(R127i.x)));
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV1iz)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R6i.x)));
R4i.z = floatBitsToInt(roundEven(intBitsToFloat(PV1ix)));
// 3
backupReg0i = R2i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(R127i.w)));
R6i.y = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3e06dfc6));
R2i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x39800000));
R1i.w = floatBitsToInt(intBitsToFloat(R8i.z) + -(intBitsToFloat(backupReg0i)));
R6i.x = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3e06dfc6));
// 4
R5i.x = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(0x3e06dfc6));
R5i.y = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3e06dfc6));
R6i.z = R1i.z;
R0i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x39800000));
R6i.w = floatBitsToInt(-3.5 * intBitsToFloat(R2i.z) + 3.0);
// 5
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R11i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.x)));
R5i.z = R4i.z;
R5i.w = floatBitsToInt(-3.5 * intBitsToFloat(R0i.w) + 3.0);
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].x, intBitsToFloat(R11i.x)));
}
if( activeMaskStackC[1] == true ) {
R8i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xyz);
R7i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R4i.w),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyz);
R6i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z)),-3.75).xyz);
R5i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z)),-3.75).xyz);
R9i.xyz = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xyz);
R1i.xyz = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R4i.w),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(R7i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R4i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R1i.w)) + intBitsToFloat(R0i.y));
PV0iw = floatBitsToInt(-(intBitsToFloat(R8i.x)) + intBitsToFloat(R7i.x));
R126i.y = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.w));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R13i.x)) + intBitsToFloat(R8i.x));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1iy = clampFI32(PV1iy);
R0i.z = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x378bcf65) + intBitsToFloat(0xbd2aaaab));
R0i.z = clampFI32(R0i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R13i.x)) + intBitsToFloat(R8i.y));
R126i.w = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R123i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R124i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R123i.z)) + intBitsToFloat(R123i.z));
// 4
R123i.x = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].x, intBitsToFloat(R11i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].y,intBitsToFloat(R124i.x)) + intBitsToFloat(R0i.x));
R127i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].x, intBitsToFloat(R11i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.w));
R0i.y = floatBitsToInt(-(intBitsToFloat(R11i.x)));
// 6
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R13i.x)) + intBitsToFloat(R127i.y));
R127i.y = 0;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R13i.x)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R13i.x)) + intBitsToFloat(R2i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].y,intBitsToFloat(R124i.x)) + intBitsToFloat(R127i.z));
// 7
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].z,intBitsToFloat(R10i.z)) + intBitsToFloat(R125i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(R125i.y));
R125i.y = clampFI32(R125i.y);
R125i.z = 0x3f800000;
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].y,intBitsToFloat(R124i.x)) + intBitsToFloat(R126i.x));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 8
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R0i.y),intBitsToFloat(R127i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R0i.y),intBitsToFloat(R127i.y),0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R4i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].z,intBitsToFloat(R10i.z)) + intBitsToFloat(R126i.y));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.z)));
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].z,intBitsToFloat(R10i.z)) + intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.z)));
R127i.w = 0x3f800000;
// 10
backupReg0i = R125i.x;
backupReg1i = R125i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg0i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R0i.x)));
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg1i)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)), uf_blockPS1[17].y));
// 11
backupReg0i = R125i.z;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.w),intBitsToFloat(backupReg0i))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV0iz));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(R124i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R124i.y));
R10i.z = R0i.z;
R10i.z = floatBitsToInt(intBitsToFloat(R10i.z) / 2.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R122i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(tempResultf);
// 13
backupReg0i = R125i.z;
backupReg1i = R126i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R125i.y));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) / 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) * 8.0 + 8.0);
R3i.z = floatBitsToInt(sqrt(intBitsToFloat(backupReg1i)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R3i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 15
R124i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3fd55555) + intBitsToFloat(0x3fd55555));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].x, intBitsToFloat(R125i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R124i.w) * 1.25);
PV1iz = clampFI32(PV1iz);
R126i.w = floatBitsToInt(intBitsToFloat(PS0i) * 20.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R2i.z = floatBitsToInt(tempResultf);
// 16
backupReg0i = R126i.x;
backupReg1i = R125i.z;
R126i.x = floatBitsToInt(-(intBitsToFloat(R8i.z)) + intBitsToFloat(R7i.z));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R2i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].x, intBitsToFloat(backupReg1i)));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].x, intBitsToFloat(backupReg1i)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
// 17
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(-(intBitsToFloat(R6i.z)) + intBitsToFloat(R5i.z));
R126i.y = floatBitsToInt(min(intBitsToFloat(R124i.x), intBitsToFloat(R126i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].y,intBitsToFloat(R125i.y)) + intBitsToFloat(backupReg0i));
R4i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.z)), uf_blockPS1[15].x));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PS0i)));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R125i.x)) + 0.5);
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R8i.z));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R13i.x)) + intBitsToFloat(R6i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].y,intBitsToFloat(R125i.y)) + intBitsToFloat(R124i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R7i.y)));
// 19
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].y,intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R2i.z)));
R6i.z = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(R2i.w));
R1i.w = R123i.x;
R1i.w = floatBitsToInt(intBitsToFloat(R1i.w) * 2.0);
PS1i = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R126i.y)));
// 20
R8i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R124i.w));
R6i.y = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(R1i.x));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.y));
R2i.w = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R6i.x = floatBitsToInt(-(intBitsToFloat(R9i.y)) + intBitsToFloat(R1i.y));
// 21
backupReg0i = R1i.z;
R1i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[28].x,-(intBitsToFloat(R2i.x))) + uf_blockPS8[28].x);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R1i.w)) + -(intBitsToFloat(R8i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R7i.y)));
R0i.w = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(backupReg0i));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R7i.y)));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R9i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R13i.x)) + intBitsToFloat(R9i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), uf_blockPS1[16].x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R2i.z)));
R124i.w = 0x3c808081;
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R13i.x)) + intBitsToFloat(R9i.z));
R126i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R1i.z))/2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R2i.w)) + intBitsToFloat(R8i.z));
R127i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R8i.x))/2.0);
R127i.z = floatBitsToInt(uf_blockPS8[32].z);
// 2
R126i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R7i.y))/2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R5i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R1i.w)));
PV0iw = floatBitsToInt(uf_blockPS8[28].y + intBitsToFloat(R1i.x));
PV0iw = clampFI32(PV0iw);
R3i.w = 0x3f800000;
// 3
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(PV0iy));
R2i.x = clampFI32(R2i.x);
R3i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iw));
R3i.x = clampFI32(R3i.x);
// 4
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.z)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R125i.z)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
R4i.x = R124i.w;
// 5
R5i.x = floatBitsToInt(intBitsToFloat(R126i.y) + 0.5);
R3i.y = R127i.z;
R5i.z = floatBitsToInt(intBitsToFloat(R126i.x) + 0.5);
R5i.y = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
// 6
R6i.x = R4i.w;
// 7
predResult = (1.0 > intBitsToFloat(R2i.x));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
R1i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyzw);
R0i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(R0i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.w) * 255.0);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) * 255.0);
R1i.w = R3i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R5i.y) + -(intBitsToFloat(R0i.y)));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(R1i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(R7i.x) + -(intBitsToFloat(R1i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(R0i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.z) + -(intBitsToFloat(R0i.z)));
PS1i = int(intBitsToFloat(PV0iz));
// 2
PV0ix = PS1i & 0x2;
R126i.z = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(R1i.z)));
PS0i = int(intBitsToFloat(R127i.y));
// 3
PV1iw = PS0i & 0xfc;
PS1i = floatBitsToInt(float(PV0ix));
// 4
R125i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PS1i));
R125i.z = clampFI32(R125i.z);
PS0i = floatBitsToInt(float(PV1iw));
// 5
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R0i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3b820821));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R0i.z));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R0i.w));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R0i.y));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(63.75 * intBitsToFloat(R0i.w));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R1i.x));
// 7
PV1ix = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R1i.y));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R1i.z));
PV1iw = floatBitsToInt(63.75 * intBitsToFloat(R123i.x));
// 8
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 4.0);
R5i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 9
R7i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3b808081));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt(63.75 * intBitsToFloat(R3i.x));
R7i.w = 0;
// 1
PV1ix = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
// 2
R5i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R2i.x = R5i.x;
R2i.y = R5i.y;
R2i.z = R5i.z;
R2i.w = R5i.w;
// 1
R1i.x = R7i.x;
R1i.y = R7i.y;
R1i.z = R7i.z;
R1i.w = R7i.w;
// 2
R0i.x = R4i.x;
R0i.y = R3i.y;
R0i.z = R3i.z;
R0i.w = R3i.w;
// 3
R3i.x = R6i.x;
R3i.y = R6i.y;
R3i.z = R6i.y;
R3i.w = R6i.y;
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor7 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
zmShadow = vec4(zmSunShadow, 1.0, 1.0, zmSunShadow);
zmEmissive = vec4(0.0);
}
