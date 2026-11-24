#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 915c631553709eb3
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem6;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
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
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
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
R2i = floatBitsToInt(passParameterSem6);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem5);
R5i = floatBitsToInt(passParameterSem7);
if( activeMaskStackC[1] == true ) {
R6i.xyz = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R0i.xyz = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R4i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R4i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R4i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(backupReg0i)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
R122i.x = clampFI32(R122i.x);
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.w)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iz));
R2i.z = ((intBitsToFloat(R1i.z) >= 1.0)?-1:0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 6
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.w));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.y));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.x));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R2i.y),intBitsToFloat(R4i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + 1.0);
PV0iz = clampFI32(PV0iz);
// 9
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(PS1i)));
// 11
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 12
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.x));
R3i.x = clampFI32(R3i.x);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.y));
R3i.y = clampFI32(R3i.y);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.z));
R3i.z = clampFI32(R3i.z);
// 13
predResult = (R2i.z == 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R1i.z)));
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) / 2.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R1i.z)));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) / 2.0);
// 1
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + 0.5);
}
if( activeMaskStackC[2] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(R3i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(R3i.x));
R123i.z = floatBitsToInt(intBitsToFloat(R1i.z) * 10.0 + -9.0);
R123i.z = clampFI32(R123i.z);
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R3i.z));
// 1
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R123i.z)) + intBitsToFloat(R0i.x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R123i.z)) + intBitsToFloat(R0i.y));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R123i.z)) + intBitsToFloat(R0i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R6i.z) * 63.75);
PV0iz = uf_remappedPS[2].z;
PV0iw = 0x3c808081;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
// 1
PV1ix = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
R1i.y = PV0iz;
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.z)));
R1i.w = 0x3f800000;
R1i.x = PV0iw;
// 2
R2i.x = floatBitsToInt(intBitsToFloat(R4i.x) * 0.5 + 0.5);
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 0.5 + 0.5);
R2i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 0.5 + 0.5);
R0i.w = 0;
R2i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 3
R3i.x = R2i.x;
R3i.y = R2i.y;
R3i.z = R2i.z;
R3i.w = R2i.w;
// 4
R2i.x = R0i.x;
R2i.y = R0i.y;
R2i.z = R0i.z;
R2i.w = R0i.w;
// 5
R1i.x = R1i.x;
R1i.y = R1i.y;
R1i.z = R1i.z;
R1i.w = R1i.w;
}
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor3 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
