#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d4670aaae44bf58c
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
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
layout(location = 5) out vec4 passPixelColor5;
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
PV0ix = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
R125i.w = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.w)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(PV1iw)) + 1.0);
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(PV1iy)) + 1.0);
R123i.z = clampFI32(R123i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iz));
// 3
backupReg0i = R123i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R125i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R7i.w) * 255.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R126i.x));
R123i.z = clampFI32(R123i.z);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) + -(1.0));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.y) + -(1.0));
PS0i = int(intBitsToFloat(R126i.y));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),-(intBitsToFloat(uf_remappedPS[0].w))) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.z) + -(1.0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
R125i.w = PS0i & 0xf0;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
// 8
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[2].y)) + intBitsToFloat(R6i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R6i.x));
R125i.z = floatBitsToInt(intBitsToFloat(R0i.x) + -(1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(R0i.y) + -(1.0));
// 9
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 63.75);
R127i.y = floatBitsToInt(intBitsToFloat(R0i.z) + -(1.0));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[2].z)) + intBitsToFloat(R6i.z));
R125i.w = R125i.w >> 0x3;
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedPS[2].x));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(uf_remappedPS[2].y));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedPS[2].z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(uf_remappedPS[1].x)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(uf_remappedPS[1].x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedPS[1].x)) + 1.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R125i.x = floatBitsToInt(tempResultf);
// 12
backupReg0i = R125i.w;
R126i.x = floatBitsToInt(floor(intBitsToFloat(R126i.x)));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 4.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R123i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R123i.w)));
R126i.y = floatBitsToInt(float(backupReg0i));
// 13
backupReg0i = R125i.y;
backupReg1i = R127i.x;
R127i.x = 0x3d50d0d1;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R125i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R125i.x)));
R124i.w = uf_remappedPS[3].z;
// 14
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) + 2.0);
R127i.y = floatBitsToInt(intBitsToFloat(R126i.y) + 65.0);
R125i.z = floatBitsToInt((intBitsToFloat(R7i.x) * 0.25 + 0.75)/2.0);
R5i.w = floatBitsToInt(1.0);
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),-(intBitsToFloat(uf_remappedPS[0].w))) + intBitsToFloat(backupReg0i));
// 15
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[0].w)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),-(intBitsToFloat(uf_remappedPS[0].w))) + intBitsToFloat(R127i.z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),-(intBitsToFloat(uf_remappedPS[0].w))) + intBitsToFloat(R125i.w));
R7i.w = 0x3f800000;
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[0].w)));
// 16
R5i.x = R127i.x;
R5i.y = R124i.w;
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[0].w)));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3b808081));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.z)) + 0.5);
// 17
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R125i.z)) + 0.5);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R125i.z)) + 0.5);
R6i.w = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3b808081));
// 18
R4i.x = R7i.x;
R4i.y = R7i.y;
R4i.z = R7i.z;
R4i.w = R7i.w;
// 19
R3i.x = R0i.x;
R3i.y = R0i.y;
R3i.z = R0i.z;
R3i.w = R0i.w;
// 20
R2i.x = R6i.x;
R2i.y = R6i.y;
R2i.z = R6i.z;
R2i.w = R6i.w;
// 21
R1i.x = R5i.x;
R1i.y = R5i.y;
R1i.z = R5i.z;
R1i.w = R5i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor3 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor5 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
