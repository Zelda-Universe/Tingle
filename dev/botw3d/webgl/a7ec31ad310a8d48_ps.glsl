#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a7ec31ad310a8d48
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(9, 1, 2) uniform sampler2DArray textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 3) uniform sampler2DArray textureUnitPS10;
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
// 0
R127i.x = uf_remappedPS[0].z;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
PV0iw = uf_remappedPS[1].z;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R4i.w));
// 1
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
R3i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(PV0iy));
// 2
PV0ix = 0x3c808081;
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iw));
PV0iz = uf_remappedPS[2].z;
R4i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.z));
R8i.w = R3i.w;
// 3
R8i.x = PV0ix;
R8i.y = PV0iz;
R5i.z = floatBitsToInt(roundEven(intBitsToFloat(R127i.x)));
R5i.w = R0i.y;
R5i.x = R0i.x;
R0i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyzw);
R7i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyzw);
R5i.xyz = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R5i.x),intBitsToFloat(R5i.w),intBitsToFloat(R5i.z))).xyz);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),-(intBitsToFloat(R3i.w))) + intBitsToFloat(R0i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.w) * 255.0);
R127i.w = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y)) + -(intBitsToFloat(R6i.y)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R5i.x)) + -(intBitsToFloat(R6i.x)));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) + -(intBitsToFloat(R7i.w)));
PS1i = int(intBitsToFloat(PV0iz));
// 2
PV0ix = PS1i & 0xfc;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1iy)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
R123i.z = clampFI32(R123i.z);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PV1iy)));
// 3
R127i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iy))/2.0);
R127i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PS0i))/2.0);
R127i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw))/2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PS1i = floatBitsToInt(float(PV0ix));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R3i.w)) + intBitsToFloat(R7i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R5i.z)) + -(intBitsToFloat(R6i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3b820821));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R3i.w)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(63.75 * intBitsToFloat(backupReg0i));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
PV0iz = floatBitsToInt(63.75 * intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R127i.x = floatBitsToInt(floor(intBitsToFloat(PS1i)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 4.0);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(R7i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R7i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R7i.x)));
PV1iw = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 4.0);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R3i.w)) + intBitsToFloat(R6i.x));
// 8
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R3i.w)) + intBitsToFloat(R7i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R6i.y));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R6i.z));
R1i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3b808081));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R3i.w)) + intBitsToFloat(R7i.z));
// 9
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R7i.y));
R6i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 10
R4i.x = R6i.x;
R4i.y = R6i.y;
R4i.z = R6i.z;
R4i.w = R6i.w;
// 11
R3i.x = R1i.x;
R3i.y = R1i.y;
R3i.z = R1i.z;
R3i.w = R1i.w;
// 12
R2i.x = R8i.x;
R2i.y = R8i.y;
R2i.z = R8i.z;
R2i.w = R8i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor1 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor3 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
