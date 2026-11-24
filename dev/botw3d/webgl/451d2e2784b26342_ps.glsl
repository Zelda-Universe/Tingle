#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 451d2e2784b26342
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 3) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2DArray textureUnitPS5;
TEXTURE_LAYOUT(8, 1, 5) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 6) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 7) uniform sampler2D textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 8) uniform sampler2D textureUnitPS11;
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
ivec4 R14i = ivec4(0);
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
R5i.xy = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R6i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
R10i.xyzw = floatBitsToInt(texture(textureUnitPS8, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R8i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyzw);
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.y = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)), intBitsToFloat(uf_remappedPS[0].y)));
R126i.w = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 1
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(uf_remappedPS[1].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.y)));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(uf_remappedPS[2].x)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(PV0iw)) + intBitsToFloat(R5i.x));
R7i.z = floatBitsToInt(roundEven(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(PV0iz)) + intBitsToFloat(R5i.y));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1ix));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PS1i));
R127i.w = clampFI32(R127i.w);
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R4i.x)));
R9i.z = floatBitsToInt(intBitsToFloat(R9i.z) * 2.0);
R9i.z = clampFI32(R9i.z);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(R123i.z)));
R1i.z = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.z));
R5i.w = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
// 6
PV0ix = floatBitsToInt(floor(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.w));
R2i.w = floatBitsToInt(sqrt(intBitsToFloat(PS1i)));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R9i.z)) + intBitsToFloat(R126i.y));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 8
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV1iw)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w), intBitsToFloat(PV1iz)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R9i.z)) + intBitsToFloat(R126i.x));
R0i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(PS1i));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R1i.w = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R12i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyzw);
R13i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyzw);
R11i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R9i.z)) + intBitsToFloat(R2i.w));
PV0iw = ((intBitsToFloat(R0i.z) > intBitsToFloat(R1i.w))?-1:0);
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R6i.y));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iy));
R6i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R12i.w) * 255.0);
R123i.w = ((PV0iw == 0)?(0x3f800000):(0));
PS1i = floatBitsToInt(-(intBitsToFloat(R10i.w)) + intBitsToFloat(R8i.w));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(R5i.x));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R5i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.w));
R0i.z = clampFI32(R0i.z);
R5i.w = floatBitsToInt(intBitsToFloat(R4i.x) + -(1.0));
R5i.y = int(intBitsToFloat(PV1iz));
R1i.z = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).x);
R7i.xyz = floatBitsToInt(texture(textureUnitPS5, vec3(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z))).xyz);
// 0
R126i.x = R5i.y & 0xfc;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedPS[1].x));
R125i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R5i.w));
R127i.w = 0x3f800000;
R126i.w = floatBitsToInt(-(intBitsToFloat(R10i.x)) + intBitsToFloat(R8i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R5i.z)) + -(intBitsToFloat(R123i.y)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), -(intBitsToFloat(PS1i))));
PV0ix = clampFI32(PV0ix);
R126i.y = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(R8i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(R8i.y));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x),-(intBitsToFloat(PS1i))) + -(intBitsToFloat(uf_remappedPS[8].y)));
R125i.w = clampFI32(R125i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
R127i.y = R5i.y & int(1);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS0i)));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.y));
R126i.x = clampFI32(R126i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].w), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R13i.w)));
PS0i = floatBitsToInt(float(backupReg0i));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3b820821));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iy)));
R124i.y = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
R124i.y = clampFI32(R124i.y);
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.x));
R127i.z = clampFI32(R127i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iz));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.z));
R126i.y = clampFI32(R126i.y);
// 7
R127i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.w))/2.0);
R2i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x))/2.0);
R126i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.y))/2.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.z)));
R125i.w = clampFI32(R125i.w);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x), intBitsToFloat(R124i.y)));
PS1i = clampFI32(PS1i);
// 8
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z), intBitsToFloat(R124i.y)));
PV0ix = clampFI32(PV0ix);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PS1i));
R127i.y = clampFI32(R127i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), intBitsToFloat(R124i.y)));
PV0iw = clampFI32(PV0iw);
R125i.x = floatBitsToInt(float(backupReg0i));
// 9
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iw));
R126i.y = clampFI32(R126i.y);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0ix));
R126i.z = clampFI32(R126i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.y));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
// 10
backupReg0i = R124i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(R7i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(R7i.x));
PV0iz = floatBitsToInt(63.75 * intBitsToFloat(R123i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(R7i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R125i.x)));
// 11
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(backupReg0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(63.75 * intBitsToFloat(R127i.z));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.y) + 0.5);
R2i.y = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 4.0);
// 12
backupReg0i = R127i.x;
backupReg1i = R125i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(R12i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R125i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R12i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R12i.y)));
R124i.x = floatBitsToInt(intBitsToFloat(backupReg1i) + -(intBitsToFloat(R124i.w)));
// 13
backupReg0i = R124i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(R13i.x)));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R13i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R125i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R13i.z)));
R11i.x = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
R11i.x = floatBitsToInt(intBitsToFloat(R11i.x) * 4.0);
// 14
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.y));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R12i.z));
R10i.w = R4i.w;
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.y));
// 15
R10i.x = 0x3db0b0b1;
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.x));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R124i.w));
R12i.w = 0x3f800000;
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.y));
// 16
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.x));
R10i.y = 0;
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R13i.z));
R3i.w = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
R7i.w = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 17
R14i.x = R12i.x;
R14i.y = R12i.y;
R14i.z = R12i.z;
R14i.w = R12i.w;
// 18
R13i.x = R7i.x;
R13i.y = R7i.y;
R13i.z = R7i.z;
R13i.w = R7i.w;
// 19
R12i.x = R3i.x;
R12i.y = R3i.y;
R12i.z = R3i.z;
R12i.w = R3i.w;
// 20
R11i.x = R10i.x;
R11i.y = R10i.y;
R11i.z = R10i.z;
R11i.w = R10i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
passPixelColor1 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
passPixelColor3 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
passPixelColor5 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
}
