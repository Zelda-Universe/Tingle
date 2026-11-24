#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4c0bd596e3aef4a6
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
R5i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R6i.xy = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
R10i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R8i.xyzw = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyzw);
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)), intBitsToFloat(uf_remappedPS[0].y)));
R126i.w = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(uf_remappedPS[1].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(uf_remappedPS[2].x)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(PV0iy)) + intBitsToFloat(R0i.y));
R7i.z = floatBitsToInt(roundEven(1.0));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
R127i.w = clampFI32(R127i.w);
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R4i.x)));
R9i.z = floatBitsToInt(intBitsToFloat(R9i.z) * 2.0);
R9i.z = clampFI32(R9i.z);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(R123i.x)));
R5i.y = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(R123i.x));
R0i.z = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(R123i.z)));
PS1i = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
// 6
PV0ix = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.w));
R6i.y = floatBitsToInt(sqrt(intBitsToFloat(PS1i)));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R9i.z)) + intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 8
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV1iy)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w), intBitsToFloat(PV1iz)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R9i.z)) + intBitsToFloat(R127i.y));
R2i.w = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PS1i));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R0i.w = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R12i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R1i.y = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).y);
R13i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R11i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
PV0iy = ((intBitsToFloat(R1i.w) > intBitsToFloat(R0i.w))?-1:0);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R9i.z)) + intBitsToFloat(R6i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
R0i.w = floatBitsToInt(intBitsToFloat(R4i.x) + -(1.0));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0ix));
R6i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R5i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R12i.w) * 255.0);
R123i.w = ((PV0iy == 0)?(0x3f800000):(0));
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iw));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R123i.w)) + intBitsToFloat(R0i.x));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R0i.y));
R1i.z = floatBitsToInt(-(intBitsToFloat(R10i.w)) + intBitsToFloat(R8i.w));
R5i.w = floatBitsToInt(intBitsToFloat(R1i.y) * 255.0);
R0i.y = int(intBitsToFloat(PV1iz));
R0i.z = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).x);
R7i.xyz = floatBitsToInt(texture(textureUnitPS5, vec3(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z))).xyz);
// 0
R127i.x = R0i.y & 0xfc;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.w));
R127i.y = clampFI32(R127i.y);
R126i.z = 0x3f800000;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(R0i.z)) + intBitsToFloat(uf_remappedPS[1].x));
R127i.w = floatBitsToInt(-(intBitsToFloat(R10i.x)) + intBitsToFloat(R8i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.w),intBitsToFloat(R4i.z),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.w),intBitsToFloat(R4i.z),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + -(intBitsToFloat(R123i.w)));
// 2
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), -(intBitsToFloat(R126i.x))));
PV0ix = clampFI32(PV0ix);
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[8].z) * 255.0);
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R0i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(R8i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x),-(intBitsToFloat(backupReg0i))) + -(intBitsToFloat(uf_remappedPS[9].y)));
R126i.y = clampFI32(R126i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS0i)));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(R8i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].w), intBitsToFloat(PS1i)));
R124i.w = R0i.y & int(1);
PS0i = floatBitsToInt(float(backupReg0i));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3b820821));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iy)));
R124i.y = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
R124i.y = clampFI32(R124i.y);
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R13i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iz));
R125i.w = int(uint(intBitsToFloat(R5i.w)));
// 7
backupReg0i = R127i.y;
R125i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w))/2.0);
R127i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x))/2.0);
R127i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.y))/2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.x));
R127i.w = clampFI32(R127i.w);
PS1i = int(uint(intBitsToFloat(backupReg0i)));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.z)));
R126i.x = clampFI32(R126i.x);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.z));
R126i.y = clampFI32(R126i.y);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.y));
R125i.z = clampFI32(R125i.z);
R126i.w = R125i.w | PS1i;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].x), intBitsToFloat(R124i.y)));
R127i.x = clampFI32(R127i.x);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].z), intBitsToFloat(R124i.y)));
PV1ix = clampFI32(PV1ix);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].y), intBitsToFloat(R124i.y)));
PV1iw = clampFI32(PV1iw);
R124i.x = floatBitsToInt(float(R124i.w));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1ix));
R127i.x = clampFI32(R127i.x);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iw));
R126i.y = clampFI32(R126i.y);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(backupReg0i));
R125i.z = clampFI32(R125i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),-(intBitsToFloat(R124i.y))) + intBitsToFloat(R7i.z));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),-(intBitsToFloat(R124i.y))) + intBitsToFloat(R7i.x));
// 11
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),-(intBitsToFloat(R124i.y))) + intBitsToFloat(R7i.y));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R124i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.5);
R126i.w = floatBitsToInt(float(uint(R126i.w)));
// 12
backupReg0i = R124i.x;
backupReg1i = R125i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(backupReg0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(backupReg0i)));
PV0iz = floatBitsToInt(63.75 * intBitsToFloat(backupReg1i));
R124i.w = floatBitsToInt(intBitsToFloat(R127i.y) + 0.5);
R127i.y = floatBitsToInt(63.75 * intBitsToFloat(R126i.z));
// 13
R126i.x = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 4.0);
R11i.y = 0x3db0b0b1;
R124i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3b808081));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(R12i.x)));
R10i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R12i.y)));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(R124i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R12i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R125i.y)));
R10i.y = floatBitsToInt(intBitsToFloat(R124i.w) + -(intBitsToFloat(R13i.y)));
// 15
R125i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(R13i.z)));
R127i.y = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 4.0);
R126i.z = floatBitsToInt(intBitsToFloat(R124i.y) + -(intBitsToFloat(R13i.x)));
R2i.w = R4i.w;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.x));
// 16
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R127i.z));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.y));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.z));
R7i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R124i.x));
// 17
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.y));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.y));
R12i.w = 0x3f800000;
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.z));
// 18
R2i.x = R11i.y;
R2i.y = R124i.z;
R4i.w = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 19
R11i.x = R12i.x;
R11i.y = R12i.y;
R11i.z = R12i.z;
R11i.w = R12i.w;
// 20
R10i.x = R4i.x;
R10i.y = R4i.y;
R10i.z = R4i.z;
R10i.w = R4i.w;
// 21
R9i.x = R7i.x;
R9i.y = R7i.y;
R9i.z = R7i.z;
R9i.w = R7i.w;
// 22
R8i.x = R2i.x;
R8i.y = R2i.y;
R8i.z = R2i.z;
R8i.w = R2i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
passPixelColor1 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
passPixelColor3 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
passPixelColor5 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
}
