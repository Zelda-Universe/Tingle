#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e581c110c6741b7c
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem254;
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
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem5);
R5i = floatBitsToInt(passParameterSem254);
R5i.w = floatBitsToInt(gl_FrontFacing?1.0:0.0);
R5i.xyz = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R123i.y = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R1i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(fract(intBitsToFloat(R0i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3efefefe) + intBitsToFloat(0x3f008080));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40490fdb));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40490fdb));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.w = floatBitsToInt((intBitsToFloat(R5i.w) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt((0.0 > intBitsToFloat(R5i.w))?1.0:0.0);
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R125i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R126i.z)));
R127i.y = clampFI32(R127i.y);
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.z)));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
// 6
R126i.x = ((intBitsToFloat(R127i.y) != 0.0)?-1:0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(R6i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.y)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 7
backupReg0i = R126i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iw));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iz));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R3i.z)) + intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 8
PV0ix = ((intBitsToFloat(R127i.y) > 0.0)?-1:0);
R123i.y = ((R126i.x == 0)?(0x40000000):(0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),intBitsToFloat(PS1i)) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.z) * 63.75);
R127i.z = 0x3c808081;
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R125i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R123i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R123i.y)));
R122i.x = ((PV0ix == 0)?(0):(0x3f800000));
// 10
R125i.x = R122i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R127i.y = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 4.0);
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3efefefe) + intBitsToFloat(0x3f008080));
R127i.w = uf_remappedPS[2].z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R6i.x)));
// 11
backupReg0i = R4i.x;
R4i.x = R127i.z;
R123i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R6i.z)));
R4i.w = R6i.w;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R6i.y)));
// 12
backupReg0i = R127i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(R124i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R0i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R126i.z));
R4i.y = backupReg0i;
// 13
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iz));
R123i.w = clampFI32(R123i.w);
R1i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3b808081));
// 14
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R0i.w = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 15
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 16
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg0i));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 18
R123i.x = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R5i.z)) + intBitsToFloat(R126i.y))/2.0);
R123i.y = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R124i.y)) + intBitsToFloat(R124i.x))/2.0);
R123i.z = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.z))/2.0);
// 19
R0i.x = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R0i.z = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
// 20
R7i.x = R0i.x;
R7i.y = R0i.y;
R7i.z = R0i.z;
R7i.w = R0i.w;
// 21
R6i.x = R1i.x;
R6i.y = R1i.y;
R6i.z = R1i.z;
R6i.w = R1i.w;
// 22
R5i.x = R4i.x;
R5i.y = R4i.y;
R5i.z = R4i.z;
R5i.w = R4i.w;
// export
if( ((vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
passPixelColor1 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
passPixelColor3 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
}
