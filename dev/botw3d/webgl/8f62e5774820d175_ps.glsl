#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 8f62e5774820d175
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
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
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
R1i = floatBitsToInt(passParameterSem3);
R2i = floatBitsToInt(passParameterSem4);
R3i = floatBitsToInt(passParameterSem6);
R5i.xyzw = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R3i.w));
// 1
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS0i)));
R0i.z = uf_remappedPS[0].z;
R0i.w = 0x3c808081;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R0i.y = floatBitsToInt(tempResultf);
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) / 2.0);
R4i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyzw);
R3i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyzw);
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y)) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(R4i.w) * 255.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R3i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + 0.5);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R0i.y)) + 0.5);
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y)) + -(intBitsToFloat(R4i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R5i.x)) + -(intBitsToFloat(R4i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R5i.w)) + intBitsToFloat(R3i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R5i.z)) + -(intBitsToFloat(R4i.z)));
PS1i = int(intBitsToFloat(PV0iy));
// 2
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R3i.x)));
PV0iy = floatBitsToInt(63.75 * intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R3i.y)));
PV0iw = PS1i & 0xfc;
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R3i.z)));
// 3
PV1ix = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R4i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R5i.w)) + intBitsToFloat(R4i.z));
R1i.w = R5i.w;
PS1i = floatBitsToInt(float(PV0iw));
// 4
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(R4i.x));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3b820821));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R5i.w)) + intBitsToFloat(R3i.z));
R4i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R3i.x));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)),intBitsToFloat(R5i.w)) + intBitsToFloat(PV0iy));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R5i.w)) + intBitsToFloat(R3i.y));
R1i.z = R0i.w;
R1i.y = R0i.z;
// 6
PV0iw = floatBitsToInt(63.75 * intBitsToFloat(R123i.x));
// 7
PV1iz = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
// 8
R2i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3b808081));
// 9
R5i.x = R4i.x;
R5i.y = R4i.y;
R5i.z = R4i.z;
R5i.w = R4i.w;
// 10
R4i.x = R2i.x;
R4i.y = R2i.y;
R4i.z = R2i.z;
R4i.w = R2i.w;
// 11
R3i.x = R1i.z;
R3i.y = R1i.y;
R3i.z = R1i.z;
R3i.w = R1i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor1 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
passPixelColor3 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
