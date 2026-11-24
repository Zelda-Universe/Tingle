#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0cb42d08bcd420ab
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(6, 1, 2) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2D textureUnitPS7;
in vec4 passParameterSem0;
in vec4 passParameterSem6;
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
ivec4 R9i = ivec4(0);
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
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem6);
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem5);
R5i = floatBitsToInt(passParameterSem7);
R6i.xyz = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R7i.xyz = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R0i.w = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R5i.w));
// 1
backupReg0i = R1i.z;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
R1i.z = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R5i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)), intBitsToFloat(uf_remappedPS[0].y)));
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R0i.w)));
R8i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyzw);
R9i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyzw);
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(R0i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R8i.w) * 255.0);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R0i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R5i.w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R1i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(uf_remappedPS[1].x)) + intBitsToFloat(uf_remappedPS[1].y));
R126i.y = clampFI32(R126i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(R1i.x));
R123i.z = clampFI32(R123i.z);
R126i.w = R6i.z;
PS1i = int(intBitsToFloat(PV0iz));
// 2
backupReg0i = R127i.w;
PV0ix = PS1i & 0xfc;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
// 3
R127i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R0i.w)) + intBitsToFloat(PV0iz))/2.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),-(intBitsToFloat(R126i.y))) + intBitsToFloat(uf_remappedPS[1].z));
R127i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(PV0iy))/2.0);
R125i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(PS0i))/2.0);
PS1i = floatBitsToInt(float(PV0ix));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),-(intBitsToFloat(R126i.y))) + intBitsToFloat(uf_remappedPS[1].z));
R3i.y = 0x3c808081;
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3b820821));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R9i.w)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R127i.w)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R124i.y)) + intBitsToFloat(R9i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iz));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R126i.y = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
PV0iz = floatBitsToInt(63.75 * intBitsToFloat(R122i.x));
R125i.w = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R127i.y = floatBitsToInt(63.75 * intBitsToFloat(R123i.w));
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R7i.x)) + -(intBitsToFloat(R8i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y)) + -(intBitsToFloat(R8i.y)));
R126i.z = uf_remappedPS[2].z;
R127i.w = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 4.0);
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R7i.z)) + -(intBitsToFloat(R8i.z)));
// 8
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(R9i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R9i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R9i.x)));
R125i.w = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 4.0);
R7i.w = R126i.x;
// 9
backupReg0i = R8i.z;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(R8i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(R8i.y));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R124i.y)) + intBitsToFloat(R9i.z));
R4i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3b808081));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(backupReg0i));
// 10
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R124i.y)) + intBitsToFloat(R9i.x));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(R9i.y));
R7i.z = R126i.z;
R8i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 11
R7i.x = R3i.y;
// 12
R2i.x = R8i.x;
R2i.y = R8i.y;
R2i.z = R8i.z;
R2i.w = R8i.w;
// 13
R1i.x = R4i.x;
R1i.y = R4i.y;
R1i.z = R4i.z;
R1i.w = R4i.w;
// 14
R0i.x = R7i.x;
R0i.y = R7i.z;
R0i.z = R7i.z;
R0i.w = R7i.w;
// export
if( ((vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
