#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0dd3825b668b0290
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 5) uniform uniformBlockPS1
{
vec4 uf_blockPS1[3];
};


UNIFORM_BUFFER_LAYOUT(40, 1, 6) uniform uniformBlockPS8
{
vec4 uf_blockPS8[33];
};


UNIFORM_BUFFER_LAYOUT(43, 1, 7) uniform uniformBlockPS11
{
vec4 uf_blockPS11[4096];
};


UNIFORM_BUFFER_LAYOUT(44, 1, 8) uniform uniformBlockPS12
{
vec4 uf_blockPS12[20];
};


UNIFORM_BUFFER_LAYOUT(45, 1, 9) uniform uniformBlockPS13
{
vec4 uf_blockPS13[15];
};


TEXTURE_LAYOUT(3, 1, 0) uniform sampler2DArray textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2DArray textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2DArray textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2DArray textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
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
R2i = floatBitsToInt(passParameterSem4);
if( activeMaskStackC[1] == true ) {
// 0
PV0iw = floatBitsToInt(uf_blockPS12[12].x);
// 1
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[14].x) + uf_blockPS12[14].z);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[14].y) + uf_blockPS12[14].w);
R3i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
}
if( activeMaskStackC[1] == true ) {
R5i.xyzw = floatBitsToInt(texture(textureUnitPS4, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z))).xyzw);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R4i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
R4i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
R6i.x = R5i.z;
// 1
R7i.x = R4i.x;
R6i.y = R5i.w;
R4i.z = R4i.y;
// 2
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
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),uf_blockPS13[14].x) + uf_blockPS13[14].z);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),uf_blockPS13[14].y) + uf_blockPS13[14].w);
// 1
R1i.z = floatBitsToInt(uf_blockPS13[12].x);
// 2
R3i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[2] == true ) {
R3i.xyzw = floatBitsToInt(texture(textureUnitPS4, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z))).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R3i.z));
R123i.y = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(R3i.w));
R123i.w = floatBitsToInt(intBitsToFloat(R3i.y) * 2.0 + -(1.0));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.w));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.z));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R4i.x));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.w));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R4i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R0i.x)));
PV0iw = floatBitsToInt(uf_blockPS12[17].x);
R0i.w = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(R2i.z));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[19].x) + uf_blockPS12[19].z);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[19].y) + uf_blockPS12[19].w);
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
R1i.w = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R0i.x = floatBitsToInt(max(intBitsToFloat(PV0iz), intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[1] == true ) {
R1i.xy = floatBitsToInt(texture(textureUnitPS3, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = ((intBitsToFloat(R1i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.y = floatBitsToInt(intBitsToFloat(R1i.x) * 255.0 + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(R0i.x));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.y) * 255.0 + 0.5);
PS0i = floatBitsToInt(-(intBitsToFloat(R2i.y)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R123i.x)) + intBitsToFloat(R2i.x));
PV1iy = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(PS0i));
R127i.z = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = R6i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = int(intBitsToFloat(R123i.y));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R127i.z)) + intBitsToFloat(R2i.z));
R1i.z = PS1i + 0x9;
R0i.w = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
R0i.w = clampFI32(R0i.w);
PS0i = int(intBitsToFloat(R127i.w));
// 3
R0i.x = PS0i + 0x9;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R127i.z)) + intBitsToFloat(R2i.x));
R0i.z = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.y));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R7i.x)));
R4i.y = floatBitsToInt(-(intBitsToFloat(R7i.x)));
}
if( activeMaskStackC[1] == true ) {
R1i.xyzw = floatBitsToInt(uf_blockPS11[R1i.z].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS11[R0i.x].xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R2i.z));
PV0iy = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(R0i.y));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R3i.w)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
R126i.x = R1i.z;
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(PV0iw)));
PV1iz = R3i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R2i.x));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R1i.y)));
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R1i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R3i.y)));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV1iz)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R3i.x)));
R4i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x39800000));
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x39800000));
R1i.y = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3e06dfc6));
R2i.z = floatBitsToInt(roundEven(intBitsToFloat(R126i.x)));
R1i.w = floatBitsToInt(-3.5 * intBitsToFloat(R4i.x) + 3.0);
R1i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3e06dfc6));
// 4
R3i.x = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e06dfc6));
R3i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e06dfc6));
R1i.z = R2i.z;
R3i.w = floatBitsToInt(-3.5 * intBitsToFloat(R0i.x) + 3.0);
R3i.z = R0i.z;
}
if( activeMaskStackC[1] == true ) {
R1i.xyz = floatBitsToInt(texture(textureUnitPS6, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z)),-3.75).xyz);
R3i.xyz = floatBitsToInt(texture(textureUnitPS6, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z)),-3.75).xyz);
R5i.xyz = floatBitsToInt(texture(textureUnitPS5, vec3(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z))).xyz);
R2i.xyz = floatBitsToInt(texture(textureUnitPS5, vec3(intBitsToFloat(R0i.w),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R123i.z = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R2i.w));
R122i.x = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
R125i.x = 0;
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV1iz = clampFI32(PV1iz);
PV1iw = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R0i.x));
PS1i = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R122i.x));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R6i.x)) + intBitsToFloat(R127i.y));
R127i.y = 0x3f800000;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R6i.x)) + intBitsToFloat(R126i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R6i.x)) + intBitsToFloat(R4i.x));
R126i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1iz)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R4i.y),intBitsToFloat(R125i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R4i.y),intBitsToFloat(R125i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].x, intBitsToFloat(R7i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R3i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].x, intBitsToFloat(R7i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R6i.x)) + intBitsToFloat(R1i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].x, intBitsToFloat(R7i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].y,intBitsToFloat(R126i.x)) + intBitsToFloat(PV0ix));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].x, intBitsToFloat(R127i.w)));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].x, intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R2i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].x, intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R126i.y));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) / 2.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R124i.z = floatBitsToInt(tempResultf);
// 8
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].y,intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].y,intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.z)));
R125i.x = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R2i.y));
// 9
backupReg0i = R127i.x;
backupReg1i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].y,intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].y,intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R126i.y)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R2i.z));
R124i.y = floatBitsToInt(intBitsToFloat(backupReg1i) * 0.5 + 0.5);
R124i.y = clampFI32(R124i.y);
// 10
backupReg0i = R127i.z;
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].z,intBitsToFloat(R4i.z)) + intBitsToFloat(R124i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].y,intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.z));
R2i.y = floatBitsToInt(intBitsToFloat(R1i.x) * 63.75);
// 11
PV1ix = R124i.z;
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].z,intBitsToFloat(R4i.z)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].z,intBitsToFloat(R4i.z)) + intBitsToFloat(R125i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R126i.y)));
R125i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R6i.x)) + intBitsToFloat(R5i.x))*2.0);
// 12
backupReg0i = R125i.x;
backupReg1i = R125i.y;
R125i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R6i.x)) + intBitsToFloat(R5i.z))*2.0);
R125i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R6i.x)) + intBitsToFloat(R5i.y))*2.0);
R124i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(backupReg1i))/2.0);
R127i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.z))/2.0);
R126i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw))/2.0);
// 13
PV1ix = R124i.y;
R124i.y = floatBitsToInt(floor(intBitsToFloat(R2i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 4.0);
R127i.z = floatBitsToInt(uf_blockPS8[32].z);
PV1iw = 0x3c808081;
R0i.w = 0x3f800000;
// 14
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1ix)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1ix)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1ix)));
R5i.w = 0;
R0i.x = PV1iw;
// 15
R2i.x = floatBitsToInt(intBitsToFloat(R124i.z) + 0.5);
R0i.y = R127i.z;
R2i.z = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
R2i.w = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
R2i.y = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
// 16
backupReg0i = R2i.y;
R2i.x = R2i.x;
R2i.y = backupReg0i;
R2i.z = R2i.z;
R2i.w = R2i.w;
// 17
R1i.x = R5i.x;
R1i.y = R5i.y;
R1i.z = R5i.z;
R1i.w = R5i.w;
// 18
R0i.x = R0i.x;
R0i.y = R0i.y;
R0i.z = R0i.z;
R0i.w = R0i.w;
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
