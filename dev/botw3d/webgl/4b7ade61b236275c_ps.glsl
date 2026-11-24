#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4b7ade61b236275c
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2DArray textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2DArray textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
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
ivec4 R9i = ivec4(0);
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
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem5);
// 0
R5i.x = R0i.z;
R5i.y = R0i.w;
R5i.z = floatBitsToInt(roundEven(0.0));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(R1i.z));
R4i.w = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).x);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
R5i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R2i.w));
R123i.z = floatBitsToInt(-(intBitsToFloat(R4i.w)) * 0.25 + intBitsToFloat(R1i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R4i.w)) + -(intBitsToFloat(R4i.x)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R4i.y)));
R6i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iw));
PV1iz = 0x3ce0e0e1;
R2i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0ix));
PS1i = uf_remappedPS[0].z;
// 2
R9i.x = PV1iz;
R9i.y = PS1i;
PV0iw = floatBitsToInt(fract(intBitsToFloat(PV1ix)));
R8i.w = 0;
// 3
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R1i.y));
// 4
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R123i.y)));
R4i.xyz = floatBitsToInt(texture(textureUnitPS4, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
R0i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyzw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R0i.w) * 4.0 + -3.0);
R127i.x = clampFI32(R127i.x);
PV0iy = ((intBitsToFloat(R4i.z) > 0.0)?-1:0);
R127i.z = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
R126i.z = ((PV0iy == 0)?(0):(0x3f800000));
R123i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0 + -(0.5));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
// 3
R127i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw))/2.0);
R127i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iy))/2.0);
R127i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz))/2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS0i)) + intBitsToFloat(0x3d8f5c29));
// 4
PV0ix = R126i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R9i.w = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R122i.x));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
R0i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3b808081));
// 6
R8i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R8i.y = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
R8i.z = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
// 7
R3i.x = R8i.x;
R3i.y = R8i.y;
R3i.z = R8i.z;
R3i.w = R8i.w;
// 8
R2i.x = R0i.x;
R2i.y = R0i.y;
R2i.z = R0i.z;
R2i.w = R0i.w;
// 9
R1i.x = R9i.x;
R1i.y = R9i.y;
R1i.z = R9i.z;
R1i.w = R9i.w;
// export
if( ((vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor3 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
