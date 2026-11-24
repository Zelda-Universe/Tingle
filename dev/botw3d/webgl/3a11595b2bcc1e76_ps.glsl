#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3a11595b2bcc1e76
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_uniformRegisterPS[256];
uniform vec2 uf_fragCoordScale;
in vec4 passParameterSem0;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 4) out vec4 passPixelColor4;
layout(location = 5) out vec4 passPixelColor5;
layout(location = 6) out vec4 passPixelColor6;
layout(location = 7) out vec4 passPixelColor7;
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
ivec4 R11i = ivec4(0);
ivec4 R12i = ivec4(0);
ivec4 R13i = ivec4(0);
ivec4 R14i = ivec4(0);
ivec4 R15i = ivec4(0);
ivec4 R16i = ivec4(0);
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
// 0
PV0ix = R0i.x;
PV0ix = clampFI32(PV0ix);
R126i.y = uf_uniformRegisterPS[0].z;
PV0iz = uf_uniformRegisterPS[8].z;
PV0iw = R0i.y;
PV0iw = clampFI32(PV0iw);
R6i.z = 0x34800000;
// 1
PV1ix = uf_uniformRegisterPS[9].z;
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) * 7.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * 7.0);
R126i.w = uf_uniformRegisterPS[1].z;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
R124i.y = uf_uniformRegisterPS[2].z;
R126i.z = uf_uniformRegisterPS[10].z;
R127i.w = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1ix));
// 3
PV1ix = uf_uniformRegisterPS[12].z;
R3i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV0ix)));
R4i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(R127i.w)));
R125i.w = uf_uniformRegisterPS[4].z;
R127i.z = int(intBitsToFloat(PV0ix));
// 4
backupReg0i = R126i.z;
backupReg1i = R127i.w;
R125i.x = uf_uniformRegisterPS[5].z;
PV0iy = uf_uniformRegisterPS[13].z;
R126i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(backupReg0i));
R126i.x = int(intBitsToFloat(backupReg1i));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.0 + intBitsToFloat(R126i.y));
R125i.z = uf_uniformRegisterPS[6].z;
PV1iw = uf_uniformRegisterPS[14].z;
R4i.y = floatBitsToInt(float(R127i.z));
// 6
tempResultf = intBitsToFloat(R4i.y);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.x = int(tempResultf);
PV0ix = floatBitsToInt(tempResultf);
PV0iy = uf_uniformRegisterPS[15].z;
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iw));
R124i.w = uf_uniformRegisterPS[7].z;
R3i.w = floatBitsToInt(float(R126i.x));
// 7
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iy));
tempResultf = intBitsToFloat(R3i.w);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.y = int(tempResultf);
PV1iy = floatBitsToInt(tempResultf);
R126i.z = floatBitsToInt(intBitsToFloat(R125i.y) * 0.0 + intBitsToFloat(R126i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 0.0 + intBitsToFloat(R124i.y));
R126i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.0 + intBitsToFloat(R125i.w));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * 0.0 + intBitsToFloat(R124i.w));
R125i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.0 + intBitsToFloat(R125i.x));
R7i.z = uf_uniformRegisterPS[3].z;
R126i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 0.0 + intBitsToFloat(R125i.z));
R124i.w = uf_uniformRegisterPS[11].z;
// 9
R4i.x = R3i.y;
R7i.y = floatBitsToInt(max(intBitsToFloat(R127i.w), 0.0));
R5i.z = floatBitsToInt(max(intBitsToFloat(R126i.y), 0.0));
R5i.w = floatBitsToInt(max(intBitsToFloat(R126i.z), 0.0));
R6i.x = R4i.z;
// 10
R7i.x = floatBitsToInt(max(intBitsToFloat(R126i.x), 0.0));
R8i.y = floatBitsToInt(max(intBitsToFloat(R125i.y), 0.0));
R8i.z = floatBitsToInt(max(intBitsToFloat(R126i.w), 0.0));
R4i.w = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(R124i.w));
R6i.w = floatBitsToInt(max(intBitsToFloat(R127i.x), 0.0));
// 11
R127i.x = uf_uniformRegisterPS[ARi.x+8].x;
R0i.y = uf_uniformRegisterPS[ARi.x+0].x;
R0i.z = uf_uniformRegisterPS[ARi.x+0].x;
R126i.w = uf_uniformRegisterPS[ARi.x+8].x;
R1i.w = uf_uniformRegisterPS[ARi.x+0].x;
// 12
R0i.x = uf_uniformRegisterPS[ARi.y+0].y;
R127i.y = uf_uniformRegisterPS[ARi.y+0].y;
R126i.z = uf_uniformRegisterPS[ARi.y+8].y;
R124i.w = uf_uniformRegisterPS[ARi.y+8].y;
R1i.z = uf_uniformRegisterPS[ARi.y+0].y;
// 13
R126i.x = uf_uniformRegisterPS[ARi.x+8].x;
R2i.y = uf_uniformRegisterPS[ARi.x+0].x;
R127i.z = uf_uniformRegisterPS[ARi.x+8].x;
R2i.w = uf_uniformRegisterPS[ARi.x+0].x;
R125i.w = uf_uniformRegisterPS[ARi.x+8].x;
// 14
R124i.x = uf_uniformRegisterPS[ARi.y+0].y;
R125i.y = uf_uniformRegisterPS[ARi.y+8].y;
R2i.z = uf_uniformRegisterPS[ARi.y+0].y;
R127i.w = uf_uniformRegisterPS[ARi.y+8].y;
R125i.z = uf_uniformRegisterPS[ARi.y+8].y;
// 15
backupReg0i = R126i.w;
R1i.x = uf_uniformRegisterPS[ARi.x+0].x;
R126i.y = uf_uniformRegisterPS[ARi.x+8].x;
R3i.z = uf_uniformRegisterPS[ARi.x+0].x;
R126i.w = uf_uniformRegisterPS[ARi.x+8].x;
R124i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(backupReg0i));
// 16
backupReg0i = R126i.z;
R125i.x = uf_uniformRegisterPS[ARi.y+8].y;
R5i.y = uf_uniformRegisterPS[ARi.y+0].y;
R126i.z = uf_uniformRegisterPS[ARi.y+8].y;
R0i.w = uf_uniformRegisterPS[ARi.y+0].y;
R124i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(backupReg0i));
// 17
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.w));
R1i.y = floatBitsToInt(-(intBitsToFloat(R1i.w)) + intBitsToFloat(R126i.x));
R127i.z = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(R124i.w));
R127i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(backupReg1i));
// 18
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(R125i.w));
R126i.y = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(R126i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(R125i.y));
R125i.w = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(R125i.z));
PS0i = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(backupReg0i));
// 19
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R4i.z)) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R4i.z)) + intBitsToFloat(R127i.y));
R126i.z = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R126i.z));
R126i.w = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R126i.w));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R4i.z)) + intBitsToFloat(R0i.w));
// 20
R5i.x = uf_uniformRegisterPS[ARi.x+0].x;
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(R1i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R3i.y)) + intBitsToFloat(R0i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R3i.y)) + intBitsToFloat(R0i.y));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R3i.y)) + intBitsToFloat(R2i.w));
// 21
backupReg0i = R2i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R4i.z)) + intBitsToFloat(R1i.z));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(R1i.x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R0i.x));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R3i.y)) + intBitsToFloat(backupReg0i));
R0i.w = uf_uniformRegisterPS[ARi.y+0].y;
// 22
backupReg0i = R2i.z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R3i.y)) + intBitsToFloat(R3i.z));
R3i.y = uf_uniformRegisterPS[ARi.x+8].x;
R2i.z = floatBitsToInt(max(intBitsToFloat(R127i.y), 0.0));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R4i.z)) + intBitsToFloat(backupReg0i));
R4i.y = floatBitsToInt(max(intBitsToFloat(R127i.w), 0.0));
// 23
backupReg0i = R5i.y;
R0i.x = uf_uniformRegisterPS[ARi.y+8].y;
R5i.y = floatBitsToInt(max(intBitsToFloat(R124i.z), 0.0));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(backupReg0i));
R3i.w = floatBitsToInt(max(intBitsToFloat(R124i.y), 0.0));
R3i.z = floatBitsToInt(max(intBitsToFloat(R127i.x), 0.0));
// 0
R127i.x = floatBitsToInt(max(intBitsToFloat(R1i.z), 0.0));
R124i.y = floatBitsToInt(max(intBitsToFloat(R1i.w), 0.0));
R126i.z = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R0i.x));
R127i.w = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R3i.y));
R125i.x = floatBitsToInt(max(intBitsToFloat(R2i.x), 0.0));
// 1
R124i.x = floatBitsToInt(max(intBitsToFloat(R2i.y), 0.0));
R127i.y = floatBitsToInt(max(intBitsToFloat(R2i.w), 0.0));
R124i.z = floatBitsToInt(max(intBitsToFloat(R3i.x), 0.0));
R126i.w = floatBitsToInt(max(intBitsToFloat(R6i.y), 0.0));
R126i.y = floatBitsToInt(max(intBitsToFloat(R1i.x), 0.0));
// 2
R126i.x = floatBitsToInt(max(intBitsToFloat(R4i.z), 0.0));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R6i.x)) + intBitsToFloat(R0i.w));
R0i.y = clampFI32(R0i.y);
R5i.z = floatBitsToInt(min(intBitsToFloat(R5i.z), 1.0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R4i.x)) + intBitsToFloat(R5i.x));
R0i.w = clampFI32(R0i.w);
R5i.x = floatBitsToInt(min(intBitsToFloat(R5i.y), 1.0));
// 3
R4i.x = floatBitsToInt(min(intBitsToFloat(R4i.y), 1.0));
R5i.y = floatBitsToInt(min(intBitsToFloat(R2i.z), 1.0));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R6i.z)) + intBitsToFloat(R7i.z));
R0i.z = clampFI32(R0i.z);
R4i.w = floatBitsToInt(min(intBitsToFloat(R127i.x), 1.0));
R4i.z = floatBitsToInt(min(intBitsToFloat(R5i.w), 1.0));
// 4
R2i.x = floatBitsToInt(min(intBitsToFloat(R3i.w), 1.0));
R2i.y = floatBitsToInt(min(intBitsToFloat(R3i.z), 1.0));
R2i.z = floatBitsToInt(min(intBitsToFloat(R7i.y), 1.0));
R3i.w = floatBitsToInt(min(intBitsToFloat(R124i.y), 1.0));
R3i.y = floatBitsToInt(min(intBitsToFloat(R125i.x), 1.0));
// 5
backupReg0i = R8i.y;
R8i.x = floatBitsToInt(min(intBitsToFloat(R124i.z), 1.0));
R8i.y = floatBitsToInt(min(intBitsToFloat(R127i.y), 1.0));
R3i.z = floatBitsToInt(min(intBitsToFloat(R7i.x), 1.0));
R8i.w = floatBitsToInt(min(intBitsToFloat(backupReg0i), 1.0));
R7i.x = floatBitsToInt(min(intBitsToFloat(R124i.x), 1.0));
// 6
backupReg0i = R6i.w;
R6i.x = floatBitsToInt(min(intBitsToFloat(R126i.y), 1.0));
R7i.y = floatBitsToInt(min(intBitsToFloat(R126i.w), 1.0));
R7i.z = floatBitsToInt(min(intBitsToFloat(R8i.z), 1.0));
R6i.w = floatBitsToInt(min(intBitsToFloat(R126i.x), 1.0));
R6i.z = floatBitsToInt(min(intBitsToFloat(backupReg0i), 1.0));
// 7
R16i.x = R6i.x;
R16i.y = R6i.w;
R16i.z = R6i.z;
R16i.w = R6i.w;
// 8
R15i.x = R7i.x;
R15i.y = R7i.y;
R15i.z = R7i.z;
R15i.w = R7i.w;
// 9
R14i.x = R8i.x;
R14i.y = R8i.y;
R14i.z = R8i.w;
R14i.w = R8i.w;
// 10
R13i.x = R3i.w;
R13i.y = R3i.y;
R13i.z = R3i.z;
R13i.w = R3i.w;
// 11
R12i.x = R0i.w;
R12i.y = R0i.y;
R12i.z = R0i.z;
R12i.w = R0i.w;
// 12
R11i.x = R2i.x;
R11i.y = R2i.y;
R11i.z = R2i.z;
R11i.w = R2i.w;
// 13
R10i.x = R4i.x;
R10i.y = R4i.w;
R10i.z = R4i.z;
R10i.w = R4i.w;
// 14
R9i.x = R5i.x;
R9i.y = R5i.y;
R9i.z = R5i.z;
R9i.w = R5i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
passPixelColor1 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
passPixelColor2 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
passPixelColor3 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
passPixelColor4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
passPixelColor5 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
passPixelColor6 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
passPixelColor7 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
}
