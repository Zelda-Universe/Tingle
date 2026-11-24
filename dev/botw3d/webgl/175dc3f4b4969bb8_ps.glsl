#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 175dc3f4b4969bb8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2D textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R3i = floatBitsToInt(passParameterSem7);
R4i.xy = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
R7i.xw = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xw);
R1i.w = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).x);
R5i.xyz = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R6i.xyz = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R0i.xyz = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyz);
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
R125i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R123i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(PV1iw));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R126i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(PV1iy)) + 1.0);
R127i.w = clampFI32(R127i.w);
// 3
backupReg0i = R123i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(R125i.x)) + 1.0);
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.z));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.x)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R7i.w) * 255.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PS1i));
// 5
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.y) + -(1.0));
R125i.z = floatBitsToInt(intBitsToFloat(R5i.x) + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.y)));
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.z));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1ix)));
PS0i = int(intBitsToFloat(R127i.z));
// 7
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) * 63.75);
R127i.y = floatBitsToInt(intBitsToFloat(R5i.z) + -(1.0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(uf_remappedPS[0].y)) + 1.0);
PV1iw = PS0i & 0xf0;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedPS[0].y)) + 1.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = PV1iw >> 0x3;
// 9
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].y)) + intBitsToFloat(R6i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) + intBitsToFloat(R6i.x));
R124i.z = floatBitsToInt(intBitsToFloat(R0i.x) + -(1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedPS[0].y)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(R0i.y) + -(1.0));
// 10
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(floor(intBitsToFloat(R127i.x)));
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) * 4.0);
R126i.y = floatBitsToInt(intBitsToFloat(R0i.z) + -(1.0));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].z)) + intBitsToFloat(R6i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R125i.z)) + intBitsToFloat(uf_remappedPS[1].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
R127i.x = floatBitsToInt(tempResultf);
// 11
backupReg0i = R126i.x;
backupReg1i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedPS[1].z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(uf_remappedPS[1].y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.x)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.x)));
R125i.y = floatBitsToInt(float(backupReg1i));
// 12
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(uf_remappedPS[0].x)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(uf_remappedPS[0].x)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedPS[0].x)) + 1.0);
R127i.w = 0x3d50d0d1;
// 13
backupReg0i = R125i.w;
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) + 2.0);
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) + 64.0);
PV1iz = uf_remappedPS[2].z;
R125i.w = floatBitsToInt((intBitsToFloat(R7i.x) * 0.25 + 0.75)/2.0);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.x)));
// 14
R0i.x = R127i.w;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.w)));
R0i.w = floatBitsToInt(1.0);
R0i.y = PV1iz;
// 15
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)) + 0.5);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R125i.w)) + 0.5);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.w)) + 0.5);
R7i.w = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3b808081));
R1i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3b808081));
// 16
R4i.x = R7i.x;
R4i.y = R7i.y;
R4i.z = R7i.z;
R4i.w = R7i.w;
// 17
R3i.x = R1i.x;
R3i.y = R1i.y;
R3i.z = R1i.z;
R3i.w = R1i.w;
// 18
R2i.x = R0i.x;
R2i.y = R0i.y;
R2i.z = R0i.z;
R2i.w = R0i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor1 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor3 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
