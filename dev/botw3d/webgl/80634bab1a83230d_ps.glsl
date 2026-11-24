#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 80634bab1a83230d
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 6) uniform uniformBlockPS1
{
vec4 uf_blockPS1[13];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 7) uniform uniformBlockPS6
{
vec4 uf_blockPS6[31];
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
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
if( activeMaskStackC[1] == true ) {
// 0
R9i.x = floatBitsToInt(uf_blockPS1[0].y);
PV0iw = floatBitsToInt(uf_blockPS12[12].x);
// 1
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[14].x) + uf_blockPS12[14].z);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[14].y) + uf_blockPS12[14].w);
R4i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
}
if( activeMaskStackC[1] == true ) {
R5i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyzw);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R5i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
R7i.z = floatBitsToInt(uf_blockPS1[2].y);
R9i.y = floatBitsToInt(uf_blockPS1[1].y);
// 1
R6i.x = R5i.x;
R8i.y = R5i.w;
R6i.z = R5i.y;
R8i.x = R5i.z;
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
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),uf_blockPS13[14].x) + uf_blockPS13[14].z);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),uf_blockPS13[14].y) + uf_blockPS13[14].w);
// 1
R1i.z = floatBitsToInt(uf_blockPS13[12].x);
// 2
R4i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[2] == true ) {
R4i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R4i.z));
R123i.y = floatBitsToInt(intBitsToFloat(R4i.x) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(R4i.w));
R123i.w = floatBitsToInt(intBitsToFloat(R4i.y) * 2.0 + -(1.0));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.w));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.z));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.x));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.w));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg0i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
PV0iw = floatBitsToInt(uf_blockPS12[17].x);
R0i.w = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R3i.z));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockPS12[19].x) + uf_blockPS12[19].z);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockPS12[19].y) + uf_blockPS12[19].w);
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
R1i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R0i.z = floatBitsToInt(max(intBitsToFloat(PV0iy), intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[1] == true ) {
R1i.xy = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R1i.x) * 255.0 + 0.5);
R127i.y = floatBitsToInt(intBitsToFloat(R1i.y) * 255.0 + 0.5);
R123i.z = ((intBitsToFloat(R1i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(R0i.z));
PS0i = floatBitsToInt(-(intBitsToFloat(R3i.y)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(PS0i));
R126i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(R3i.x));
PV1iw = R8i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = int(intBitsToFloat(R123i.x));
// 2
R1i.x = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
R1i.x = clampFI32(R1i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R126i.y)) + intBitsToFloat(R3i.z));
R0i.w = PS1i + 0x9;
PS0i = int(intBitsToFloat(R127i.y));
// 3
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.y)) + intBitsToFloat(R3i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R6i.x)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.z));
R1i.w = PS0i + 0x9;
R2i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].x, intBitsToFloat(R6i.x)));
}
if( activeMaskStackC[1] == true ) {
R4i.xyzw = floatBitsToInt(uf_blockPS11[R0i.w].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS11[R1i.w].xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R0i.x));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R5i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R1i.x)) + intBitsToFloat(R3i.z));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R4i.w)));
R126i.z = R4i.z;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R4i.w) + -(intBitsToFloat(PV0iw)));
R126i.y = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(PV0iy)));
PV1iz = R5i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.x)) + intBitsToFloat(R3i.x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R4i.y)));
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R4i.x)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R5i.y)));
R3i.z = floatBitsToInt(roundEven(intBitsToFloat(R126i.z)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R5i.x)));
R5i.z = floatBitsToInt(roundEven(intBitsToFloat(PV1iz)));
// 3
R1i.x = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(0x3e06dfc6));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x39800000));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x39800000));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R6i.z)) + intBitsToFloat(R1i.y));
R1i.y = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(0x3e06dfc6));
// 4
R4i.x = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(0x3e06dfc6));
R4i.y = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3e06dfc6));
R1i.z = R3i.z;
R1i.w = floatBitsToInt(-3.5 * intBitsToFloat(R126i.z) + 3.0);
R4i.z = R5i.z;
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].x, intBitsToFloat(R6i.x)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV1iy = clampFI32(PV1iy);
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].x, intBitsToFloat(R6i.x)));
R4i.w = floatBitsToInt(-3.5 * intBitsToFloat(R126i.y) + 3.0);
R0i.y = 0;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].y,intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.x));
R6i.y = 0;
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].y,intBitsToFloat(R126i.x)) + intBitsToFloat(R2i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 8
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[0].z,intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R8i.x)) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].y,intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS1[1].z,intBitsToFloat(R6i.z)) + intBitsToFloat(backupReg0i));
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[2].z,intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,uf_blockPS1[12].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.w = 0x3f800000;
// 11
R2i.x = floatBitsToInt(uf_blockPS1[0].x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 0.5);
PV1iz = clampFI32(PV1iz);
R2i.w = floatBitsToInt(uf_blockPS1[0].y);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R127i.z)));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R7i.z = floatBitsToInt(uf_blockPS1[0].z);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + 6.5);
R6i.x = floatBitsToInt(uf_blockPS1[1].x);
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
R2i.y = floatBitsToInt(uf_blockPS1[1].y);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
R2i.z = clampFI32(R2i.z);
R0i.w = floatBitsToInt(uf_blockPS1[1].z);
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R6i.z = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
R1i.xy = floatBitsToInt(texture(textureUnitPS11, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z)),-3.75).xy);
R4i.xy = floatBitsToInt(texture(textureUnitPS11, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z)),-3.75).xy);
R3i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z))).xyz);
R5i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R5i.w),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z))).xyz);
R9i.xyz = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.y = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R123i.z = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
tempResultf = max(0.0, intBitsToFloat(R2i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.w = floatBitsToInt(tempResultf);
// 1
R127i.x = floatBitsToInt(uf_blockPS1[2].x);
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.z));
R126i.z = floatBitsToInt(uf_blockPS1[2].y);
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(uf_blockPS1[2].z);
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R8i.x)) + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R5i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R8i.x)) + intBitsToFloat(R126i.y));
PV0iw = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R5i.y));
R127i.w = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R5i.z));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(R126i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R123i.z)));
R125i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R8i.x)) + intBitsToFloat(R3i.x))*2.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R123i.x)));
R125i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R8i.x)) + intBitsToFloat(R3i.y))*2.0);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iy));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), uf_blockPS6[23].z));
R124i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R8i.x)) + intBitsToFloat(R3i.z))*2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R6i.z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),uf_blockPS6[23].y) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS0i)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5 + 0.5);
R123i.z = clampFI32(R123i.z);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockPS6[23].y));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),uf_blockPS6[23].z) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockPS6[23].z));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.y));
R127i.w = R123i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),uf_blockPS6[23].x) + intBitsToFloat(backupReg0i));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(PV0iy),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[23].x,uf_blockPS6[23].y,1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockPS6[23].x) + intBitsToFloat(R123i.x));
// 8
R127i.x = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(R127i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockPS6[30].w));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), -(intBitsToFloat(R6i.y))));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),intBitsToFloat(PS0i)),vec4(-(intBitsToFloat(R126i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R126i.z)),1.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(0xba0a8ec8));
R127i.w = clampFI32(R127i.w);
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y,intBitsToFloat(PV1ix)) + intBitsToFloat(R9i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.z)) + intBitsToFloat(0xba0a8ec8));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.x)) + intBitsToFloat(0xba0a8ec8));
R123i.z = clampFI32(R123i.z);
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x,intBitsToFloat(PV1ix)) + intBitsToFloat(R9i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z,intBitsToFloat(PV1ix)) + intBitsToFloat(R9i.z));
// 11
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.z)));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iz));
// 14
R10i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.y));
R10i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.x));
R10i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.w));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
}
