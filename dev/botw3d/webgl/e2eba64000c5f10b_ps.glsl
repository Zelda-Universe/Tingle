#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e2eba64000c5f10b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(6, 1, 2) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2D textureUnitPS7;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
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
ivec4 R7i = ivec4(0);
ivec4 R8i = ivec4(0);
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
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem3);
R2i = floatBitsToInt(passParameterSem4);
R3i = floatBitsToInt(passParameterSem5);
R4i = floatBitsToInt(passParameterSem7);
R5i.xyz = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
R0i.w = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R4i.w));
// 1
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R0i.w)));
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(PV0iy));
R7i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyzw);
R8i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyzw);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R4i.w));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R0i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R7i.w) * 255.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(R0i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R3i.z)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = int(intBitsToFloat(PV0iz));
// 2
PV0ix = PS1i & 0xfc;
R127i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1iz))/2.0);
R127i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1ix))/2.0);
PV0iw = R5i.z;
R126i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1iy))/2.0);
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R6i.w)));
R124i.y = 0x3c808081;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R6i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(R8i.w)));
PS1i = floatBitsToInt(float(PV0ix));
// 4
backupReg0i = R127i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R126i.x)) + intBitsToFloat(R8i.w));
R2i.y = uf_remappedPS[0].z;
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3b820821));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R6i.x)) + -(intBitsToFloat(R7i.x)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(63.75 * intBitsToFloat(backupReg0i));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
PV0iz = floatBitsToInt(63.75 * intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R6i.y)) + -(intBitsToFloat(R7i.y)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R6i.z)) + -(intBitsToFloat(R7i.z)));
R125i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R8i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R8i.x)));
R126i.w = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 4.0);
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(R8i.z)));
// 8
R125i.x = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 4.0);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R7i.y));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R7i.z));
R3i.w = R126i.z;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R7i.x));
// 9
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R8i.x));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R8i.y));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R8i.z));
R7i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3b808081));
R3i.x = R124i.y;
// 10
R3i.y = R2i.y;
R8i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 11
R2i.x = R8i.x;
R2i.y = R8i.y;
R2i.z = R8i.z;
R2i.w = R8i.w;
// 12
R1i.x = R7i.x;
R1i.y = R7i.y;
R1i.z = R7i.z;
R1i.w = R7i.w;
// 13
R0i.x = R3i.x;
R0i.y = R3i.y;
R0i.z = R3i.z;
R0i.w = R3i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
