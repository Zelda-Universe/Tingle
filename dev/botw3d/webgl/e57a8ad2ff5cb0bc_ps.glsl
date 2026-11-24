#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e57a8ad2ff5cb0bc
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[20];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2DArray textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2DArray textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 4) uniform sampler2DArray textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 5) uniform sampler2DArray textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 6) uniform sampler2DArray textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 7) uniform sampler2DArray textureUnitPS11;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem11;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
in vec4 passParameterSem10;
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
ivec4 R15i = ivec4(0);
ivec4 R16i = ivec4(0);
ivec4 R17i = ivec4(0);
ivec4 R18i = ivec4(0);
ivec4 R19i = ivec4(0);
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
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem3);
R4i = floatBitsToInt(passParameterSem4);
R5i = floatBitsToInt(passParameterSem5);
R6i = floatBitsToInt(passParameterSem11);
R7i = floatBitsToInt(passParameterSem7);
R8i = floatBitsToInt(passParameterSem8);
R9i = floatBitsToInt(passParameterSem9);
R10i = floatBitsToInt(passParameterSem10);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedPS[0].x)));
R127i.y = R9i.z;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedPS[1].x)));
R127i.w = R9i.w;
R127i.z = 0;
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedPS[0].y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedPS[1].y)) + intBitsToFloat(PV0iz));
R16i.z = floatBitsToInt(roundEven(1.0));
R126i.w = R9i.y;
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(uf_remappedPS[1].z)) + intBitsToFloat(R123i.y));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(R127i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R126i.z)));
R12i.z = floatBitsToInt(roundEven(intBitsToFloat(R126i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedPS[1].w) + intBitsToFloat(R122i.x));
R15i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(0x3fb6db6e));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3cdd67c9));
R11i.z = R12i.z;
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].w) + intBitsToFloat(R123i.x));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R15i.y));
// 5
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R126i.z)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3cbe82fa) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f333333));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.z)), intBitsToFloat(uf_remappedPS[2].y)));
R6i.x = R4i.z;
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(uf_remappedPS[3].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R126i.w)));
R6i.z = R12i.z;
PV0iw = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(uf_remappedPS[3].z));
R15i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
R6i.y = R4i.w;
// 8
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1iy)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iy)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1iw)));
R122i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0 + -(1.0));
// 9
R12i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R0i.x));
R12i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R9i.z));
R14i.z = floatBitsToInt(max(intBitsToFloat(R122i.x), -(intBitsToFloat(R122i.x))));
R11i.w = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R9i.w));
R11i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R0i.y));
R11i.xy = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R11i.w),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z))).xy);
R9i.xy = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z))).xy);
R11i.w = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y))).x);
R6i.xy = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z))).xy);
R18i.x = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y))).y);
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(R11i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w),intBitsToFloat(uf_remappedPS[4].x)) + intBitsToFloat(uf_remappedPS[5].x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R9i.y)) + intBitsToFloat(R11i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(uf_remappedPS[5].x));
R11i.x = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R0i.x));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R8i.z)) + -(intBitsToFloat(R123i.y)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R14i.z)) + intBitsToFloat(R9i.y));
R6i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)), intBitsToFloat(uf_remappedPS[6].x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R14i.z)) + intBitsToFloat(R9i.x));
R11i.y = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R9i.z));
// 2
R17i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iy = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R11i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R11i.w = R12i.z;
R13i.x = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R9i.w));
// 3
R127i.x = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R13i.y = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R0i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(R11i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(R17i.x)));
R13i.z = R12i.z;
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(PV1iz)) + intBitsToFloat(R14i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedPS[8].y)) + intBitsToFloat(R1i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedPS[8].x)) + intBitsToFloat(R1i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(PV1iw)) + intBitsToFloat(R14i.x));
R4i.z = R12i.z;
// 5
R9i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R126i.z));
R9i.y = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(R123i.x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R14i.x)) + intBitsToFloat(R123i.w));
R9i.z = R12i.z;
// 6
R0i.x = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(R126i.z));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R127i.x)) + intBitsToFloat(R14i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R127i.x)) + intBitsToFloat(R14i.x));
R0i.z = R12i.z;
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y), intBitsToFloat(R123i.z)));
R12i.y = floatBitsToInt(-(intBitsToFloat(R14i.x)) + intBitsToFloat(R123i.w));
R12i.z = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(R123i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x), intBitsToFloat(R123i.w)));
R12i.x = uf_remappedPS[10].x;
// 8
R1i.x = uf_remappedPS[10].z;
R1i.y = uf_remappedPS[10].y;
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
R1i.w = 0x3f800000;
// 9
R6i.x = R2i.x;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
R9i.w = 0x3f800000;
R6i.y = R10i.x;
// 10
backupReg0i = R2i.y;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z), intBitsToFloat(PV1iy)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].w), intBitsToFloat(PV1iz)));
R1i.z = backupReg0i;
R0i.w = R2i.z;
R19i.x = R10i.y;
R2i.z = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).x);
R11i.xy = floatBitsToInt(texture(textureUnitPS7, vec3(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.w))).xy);
R13i.xy = floatBitsToInt(texture(textureUnitPS7, vec3(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z))).xy);
R4i.xy = floatBitsToInt(texture(textureUnitPS11, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xy);
R9i.xyz = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z))).xyz);
R0i.xyz = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
// 0
PV0ix = ((intBitsToFloat(R6i.z) > intBitsToFloat(R2i.z))?-1:0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R11i.x)) + intBitsToFloat(R13i.x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(R13i.y));
R11i.w = R10i.z;
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(uf_remappedPS[11].x)) + intBitsToFloat(uf_remappedPS[12].x));
R2i.z = clampFI32(R2i.z);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R14i.z)) + intBitsToFloat(R11i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R14i.z)) + intBitsToFloat(R11i.y));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(uf_remappedPS[11].x)) + intBitsToFloat(uf_remappedPS[12].y));
R6i.z = clampFI32(R6i.z);
R123i.w = ((PV0ix == 0)?(0x3f800000):(0));
R2i.w = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 2
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R123i.w)) + intBitsToFloat(R14i.x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R14i.y));
R12i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R4i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(uf_remappedPS[11].x)) + intBitsToFloat(uf_remappedPS[12].z));
R6i.w = clampFI32(R6i.w);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),0.0)));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R12i.z)));
R14i.y = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y))).x);
R16i.xyz = floatBitsToInt(texture(textureUnitPS2, vec3(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z))).xyz);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R14i.x));
R123i.x = clampFI32(R123i.x);
R126i.y = floatBitsToInt(intBitsToFloat(R17i.x) + intBitsToFloat(R12i.z));
R127i.z = floatBitsToInt(intBitsToFloat(R11i.z) + intBitsToFloat(R4i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(R14i.y)) + intBitsToFloat(uf_remappedPS[5].x));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R12i.y)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R8i.z)) + -(intBitsToFloat(R123i.w)));
R124i.z = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iw = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(R0i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R14i.z)) + intBitsToFloat(R9i.x));
R125i.z = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.x),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(R1i.w))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = uf_remappedPS[13].w;
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R9i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(R0i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[14].z),-(intBitsToFloat(PV1ix))) + intBitsToFloat(uf_remappedPS[14].z));
R127i.w = uf_remappedPS[15].w;
R0i.z = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(R10i.w));
// 5
backupReg0i = R14i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R123i.z)) + -(intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R18i.x) * 255.0);
R14i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[16].z) * 255.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(backupReg0i)) + intBitsToFloat(R9i.y));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(backupReg0i)) + intBitsToFloat(R9i.z));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R123i.x));
R0i.w = int(uint(intBitsToFloat(PV1iy)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iw)));
R126i.w = clampFI32(R126i.w);
// 8
backupReg0i = R19i.x;
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.x)));
R19i.x = clampFI32(R19i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.y)));
R127i.y = clampFI32(R127i.y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(R126i.z)));
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].z), intBitsToFloat(R126i.w)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(R15i.y) * 10.0 + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),-(intBitsToFloat(PV0iz))) + intBitsToFloat(R3i.w));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.z)));
PV0iw = clampFI32(PV0iw);
PS0i = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].x),intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].x),intBitsToFloat(R124i.z)) + intBitsToFloat(PV0ix));
R127i.z = PV0iy;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(backupReg0i));
R127i.w = clampFI32(R127i.w);
R124i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PS0i));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(R126i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.w));
R126i.x = clampFI32(R126i.x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[14].w), intBitsToFloat(PS0i)));
R2i.z = 0x3db0b0b1;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.w));
R125i.w = clampFI32(R125i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R124i.w = floatBitsToInt(tempResultf);
// 14
backupReg0i = R127i.x;
backupReg1i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R7i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.w));
R124i.z = clampFI32(R124i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R124i.w)));
R126i.z = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
R126i.z = clampFI32(R126i.z);
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[19].y), intBitsToFloat(R127i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R126i.z)));
PS1i = int(uint(intBitsToFloat(R14i.z)));
// 16
backupReg0i = R127i.x;
R127i.x = R0i.w | PS1i;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.x), intBitsToFloat(backupReg0i)));
R126i.y = clampFI32(R126i.y);
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iz));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R126i.x)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R125i.w)));
// 17
backupReg0i = R124i.z;
R124i.x = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(R125i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(R125i.x)));
R124i.z = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(R126i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(backupReg0i)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[19].x), intBitsToFloat(R127i.y)));
// 18
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 63.75);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[19].z), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R127i.w)) + intBitsToFloat(R125i.x));
R127i.w = floatBitsToInt(float(uint(R127i.x)));
// 19
backupReg0i = R126i.x;
R126i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x),intBitsToFloat(PV0ix)) + intBitsToFloat(R3i.w))/2.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.w));
R3i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y),intBitsToFloat(PV0ix)) + intBitsToFloat(R125i.z))/2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.y));
R124i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iz))/2.0);
// 20
R3i.x = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 4.0);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.x), intBitsToFloat(R123i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3b808081));
R0i.w = 0x3f800000;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.x), intBitsToFloat(R124i.w)));
// 21
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x),-(intBitsToFloat(R126i.z))) + intBitsToFloat(R16i.x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),-(intBitsToFloat(R126i.z))) + intBitsToFloat(R16i.y));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.x), intBitsToFloat(R126i.w)));
R16i.w = 0x3f800000;
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z),-(intBitsToFloat(R126i.z))) + intBitsToFloat(R16i.z));
// 22
R0i.x = R2i.z;
R0i.y = R125i.z;
R2i.z = floatBitsToInt(intBitsToFloat(R124i.z) + 0.5);
R5i.w = 0x3b808081;
R2i.x = floatBitsToInt(intBitsToFloat(R126i.x) + 0.5);
// 0
R2i.y = floatBitsToInt(intBitsToFloat(R3i.z) + 0.5);
R2i.w = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(0x3b808081));
// 1
R9i.x = R16i.x;
R9i.y = R16i.y;
R9i.z = R16i.z;
R9i.w = R16i.w;
// 2
R8i.x = R2i.x;
R8i.y = R2i.y;
R8i.z = R2i.z;
R8i.w = R2i.w;
// 3
R7i.x = R5i.x;
R7i.y = R5i.y;
R7i.z = R5i.z;
R7i.w = R5i.w;
// 4
R6i.x = R0i.x;
R6i.y = R0i.y;
R6i.z = R0i.z;
R6i.w = R0i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
passPixelColor1 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
passPixelColor3 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
passPixelColor5 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
}
