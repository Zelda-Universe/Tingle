#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a5fd522e9f853814
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
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R1i = floatBitsToInt(passParameterSem5);
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem254);
R4i.w = floatBitsToInt(gl_FrontFacing?1.0:0.0);
R4i.xyz = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R5i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R0i.xyz = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyz);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt((intBitsToFloat(R4i.w) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R4i.w))?1.0:0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0ix));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
PV0iz = clampFI32(PV0iz);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.y));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R126i.x = ((intBitsToFloat(PV0iz) != 0.0)?-1:0);
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R126i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iw)));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.w));
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iz));
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x),-(intBitsToFloat(uf_remappedPS[1].y))) + intBitsToFloat(uf_remappedPS[0].x));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R3i.x)) + intBitsToFloat(R125i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(PV1iy));
R126i.w = ((backupReg0i == 0)?(0x40000000):(0));
R124i.y = floatBitsToInt(intBitsToFloat(R4i.z) * 63.75);
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.w)));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w))/2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R125i.y)));
R127i.z = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.z))/2.0);
R127i.w = floatBitsToInt((mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R125i.w)) + intBitsToFloat(R124i.x))/2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(backupReg0i)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R125i.z)));
R124i.y = floatBitsToInt(floor(intBitsToFloat(R124i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 4.0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R5i.z)));
R4i.w = R5i.w;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), intBitsToFloat(PV1iy)));
// 11
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R5i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), intBitsToFloat(R126i.y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z), intBitsToFloat(PV0ix)));
R0i.w = 0x3f800000;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R5i.y)));
// 12
R4i.x = 0x3c808081;
R4i.y = 0;
R1i.z = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
R3i.w = 0x3b808081;
R1i.x = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
// 13
R1i.y = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R1i.w = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 14
R8i.x = R0i.x;
R8i.y = R0i.y;
R8i.z = R0i.z;
R8i.w = R0i.w;
// 15
R7i.x = R1i.x;
R7i.y = R1i.y;
R7i.z = R1i.z;
R7i.w = R1i.w;
// 16
R6i.x = R3i.x;
R6i.y = R3i.y;
R6i.z = R3i.z;
R6i.w = R3i.w;
// 17
R5i.x = R4i.x;
R5i.y = R4i.y;
R5i.z = R4i.z;
R5i.w = R4i.w;
// export
if( ((vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
passPixelColor1 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
passPixelColor3 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
passPixelColor5 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
}
