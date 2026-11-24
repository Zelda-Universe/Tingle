#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2dbcd44cbf44d418
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[12];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 3) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2DArray textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(9, 1, 6) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 7) uniform sampler2D textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 8) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 9) uniform sampler2D textureUnitPS12;
in vec4 passParameterSem0;
in vec4 passParameterSem7;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
in vec4 passParameterSem254;
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
ivec4 R8i = ivec4(0);
ivec4 R9i = ivec4(0);
ivec4 R10i = ivec4(0);
ivec4 R11i = ivec4(0);
ivec4 R12i = ivec4(0);
ivec4 R13i = ivec4(0);
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
R1i = floatBitsToInt(passParameterSem7);
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem5);
R5i = floatBitsToInt(passParameterSem6);
R6i = floatBitsToInt(passParameterSem254);
R6i.w = floatBitsToInt(gl_FrontFacing?1.0:0.0);
R4i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R5i.xy = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
R10i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R8i.xyzw = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyzw);
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)), intBitsToFloat(uf_remappedPS[0].y)));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 1
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(uf_remappedPS[1].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(uf_remappedPS[2].x)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(PV0iw)) + intBitsToFloat(R4i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(PV0iy)) + intBitsToFloat(R4i.y));
R6i.z = floatBitsToInt(roundEven(1.0));
// 4
backupReg0i = R127i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
R127i.w = clampFI32(R127i.w);
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(backupReg0i));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(R123i.x)));
R5i.y = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.x));
R1i.z = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(R123i.z)));
PS1i = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
// 6
PV0ix = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R126i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R5i.w = floatBitsToInt(sqrt(intBitsToFloat(PS1i)));
// 7
R0i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R126i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R7i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.y));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 8
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV1iy)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w), intBitsToFloat(PV1iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R2i.w = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(PS1i));
R2i.w = floatBitsToInt(intBitsToFloat(R2i.w) / 2.0);
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R0i.w = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R12i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyzw);
R9i.y = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).y);
R13i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyzw);
R11i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
// 0
R1i.x = floatBitsToInt((intBitsToFloat(R6i.w) > 0.0)?1.0:0.0);
PV0iy = ((intBitsToFloat(R1i.w) > intBitsToFloat(R0i.w))?-1:0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
R0i.w = floatBitsToInt((0.0 > intBitsToFloat(R6i.w))?1.0:0.0);
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.z));
// 1
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(R5i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iz));
R7i.z = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R5i.w));
R123i.w = ((PV0iy == 0)?(0x3f800000):(0));
R1i.y = floatBitsToInt(intBitsToFloat(R4i.z) + -(1.0));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R123i.w)) + intBitsToFloat(R4i.x));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R4i.y));
R0i.z = floatBitsToInt(-(intBitsToFloat(R10i.w)) + intBitsToFloat(R8i.w));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) / 2.0);
R2i.w = floatBitsToInt(intBitsToFloat(R12i.w) * 255.0);
R9i.z = floatBitsToInt(-(intBitsToFloat(R10i.x)) + intBitsToFloat(R8i.x));
R9i.z = floatBitsToInt(intBitsToFloat(R9i.z) / 2.0);
R1i.z = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).x);
R6i.xyz = floatBitsToInt(texture(textureUnitPS5, vec3(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z))).xyz);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R7i.w),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R7i.w),intBitsToFloat(R7i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedPS[1].x));
// 1
R124i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + -(intBitsToFloat(R122i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R10i.w));
PV1iy = clampFI32(PV1iy);
R126i.z = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(R0i.w)));
R126i.z = clampFI32(R126i.z);
R126i.w = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(R8i.y));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) / 2.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R127i.x = floatBitsToInt(tempResultf);
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x),-(intBitsToFloat(R124i.x))) + -(intBitsToFloat(uf_remappedPS[7].y)));
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R1i.y));
R127i.w = clampFI32(R127i.w);
R1i.y = int(intBitsToFloat(R2i.w));
// 3
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV0iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w),-(intBitsToFloat(R123i.x))) + intBitsToFloat(uf_remappedPS[7].w));
R126i.z = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(R8i.z));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
R125i.w = ((intBitsToFloat(backupReg0i) != 0.0)?-1:0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].w), -(intBitsToFloat(R124i.x))));
R125i.y = clampFI32(R125i.y);
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R123i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(backupReg0i)));
// 5
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R0i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iz));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R5i.x)));
// 6
backupReg0i = R127i.x;
R127i.x = R1i.y & 0xfc;
R124i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R10i.y));
R124i.y = clampFI32(R124i.y);
R125i.z = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(R10i.x));
R125i.z = clampFI32(R125i.z);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R7i.y)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(backupReg0i)));
R8i.y = clampFI32(R8i.y);
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iw));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R10i.z));
R127i.w = clampFI32(R127i.w);
R126i.z = ((R125i.w == 0)?(0x40000000):(0));
// 8
backupReg0i = R126i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R3i.y)) + intBitsToFloat(R125i.x));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[9].z) * 255.0);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.z));
R126i.w = 0x3f800000;
R125i.w = floatBitsToInt(float(backupReg1i));
// 9
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R3i.z)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R9i.y) * 255.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x),-(intBitsToFloat(backupReg0i))) + -(intBitsToFloat(uf_remappedPS[10].y)));
R124i.w = clampFI32(R124i.w);
tempResultf = max(0.0, intBitsToFloat(R125i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R8i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R8i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R8i.y)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z), intBitsToFloat(PS1i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.z)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.z),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R0i.y),intBitsToFloat(R127i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R126i.z)));
// 12
backupReg0i = R127i.z;
R3i.x = 0x3db0b0b1;
R1i.y = R1i.y & int(1);
R127i.z = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3b820821));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R13i.w)));
R126i.w = int(uint(intBitsToFloat(backupReg0i)));
// 13
backupReg0i = R127i.x;
R127i.x = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R127i.y)) + intBitsToFloat(R2i.z))/2.0);
R127i.y = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(backupReg0i)) + intBitsToFloat(R124i.z))/2.0);
R126i.z = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.x))/2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.w));
PS1i = int(uint(intBitsToFloat(R126i.y)));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.z)));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.y)));
PV0iy = clampFI32(PV0iy);
R124i.z = R126i.w | PS1i;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
PV0iw = clampFI32(PV0iw);
R125i.z = floatBitsToInt(exp2(intBitsToFloat(R3i.w)));
R125i.z = clampFI32(R125i.z);
// 15
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].y),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0ix));
R126i.x = clampFI32(R126i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].x),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iw));
R125i.y = clampFI32(R125i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].z),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iy));
R127i.z = clampFI32(R127i.z);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R4i.w)) + intBitsToFloat(backupReg0i));
R125i.x = floatBitsToInt(float(R1i.y));
// 16
backupReg0i = R125i.z;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.y) + 0.5);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(R6i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(R6i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(R6i.z));
R125i.w = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
// 17
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(63.75 * intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R125i.x)));
PS1i = floatBitsToInt(float(uint(R124i.z)));
// 18
backupReg0i = R11i.z;
backupReg1i = R125i.y;
R6i.x = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 4.0);
R125i.y = floatBitsToInt(63.75 * intBitsToFloat(R127i.w));
R11i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3b808081));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.x)));
R125i.x = floatBitsToInt(intBitsToFloat(backupReg1i) + -(intBitsToFloat(R12i.x)));
// 19
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(R126i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(R126i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R12i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R12i.y)));
R11i.x = floatBitsToInt(intBitsToFloat(R124i.w) + -(intBitsToFloat(R127i.w)));
// 20
backupReg0i = R127i.x;
backupReg1i = R125i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(R13i.z)));
R125i.y = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(R13i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R13i.x)));
R3i.w = floatBitsToInt(floor(intBitsToFloat(backupReg1i)));
R3i.w = floatBitsToInt(intBitsToFloat(R3i.w) * 4.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.y));
// 21
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.x));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R126i.w));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.z));
R0i.w = R4i.w;
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R126i.y));
// 22
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.y));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R127i.w));
R12i.w = 0x3f800000;
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.z));
// 0
R0i.x = R3i.x;
R0i.y = R11i.z;
R1i.w = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
R4i.w = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 1
R8i.x = R12i.x;
R8i.y = R12i.y;
R8i.z = R12i.z;
R8i.w = R12i.w;
// 2
R7i.x = R4i.x;
R7i.y = R4i.y;
R7i.z = R4i.z;
R7i.w = R4i.w;
// 3
R6i.x = R1i.x;
R6i.y = R1i.y;
R6i.z = R1i.z;
R6i.w = R1i.w;
// 4
R5i.x = R0i.x;
R5i.y = R0i.y;
R5i.z = R0i.z;
R5i.w = R0i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
passPixelColor1 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
passPixelColor3 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
passPixelColor5 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
}
