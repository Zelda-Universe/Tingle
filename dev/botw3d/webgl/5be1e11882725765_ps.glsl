#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5be1e11882725765
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R0i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R4i.w))?1.0:0.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt((intBitsToFloat(R4i.w) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iy));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iz));
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iw = clampFI32(PV0iw);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.x)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iz)));
R126i.z = ((intBitsToFloat(PV0iw) != 0.0)?-1:0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.w)));
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0ix));
// 6
backupReg0i = R126i.x;
R126i.x = ((R126i.z == 0)?(0x40000000):(0));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R3i.y)) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.x)));
// 8
backupReg0i = R127i.y;
backupReg1i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[1].w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(backupReg1i)));
R127i.w = 0;
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R4i.z) * 63.75);
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(PV0iz)) + intBitsToFloat(R126i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(PV0iw)) + intBitsToFloat(R125i.z));
R125i.w = 0x3c808081;
R1i.w = R0i.w;
// 10
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R126i.w)),-(intBitsToFloat(R124i.y)),-(intBitsToFloat(R127i.y)),-(intBitsToFloat(R127i.w))),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R125i.z))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 4.0);
// 11
PV1ix = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
R3i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 0.5 + 0.5);
R1i.z = R125i.w;
R2i.w = 0;
R3i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 0.5 + 0.5);
// 12
R4i.z = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
R3i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
R3i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 0.5 + 0.5);
// 0
PV0iz = uf_remappedPS[2].z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R4i.z)) + 1.0);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R123i.w)));
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R123i.w)));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R123i.w)));
PV1iz = clampFI32(PV1iz);
R1i.y = PV0iz;
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1iy)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1ix)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1iz)));
// 3
R5i.x = R3i.x;
R5i.y = R3i.y;
R5i.z = R3i.z;
R5i.w = R3i.w;
// 4
R4i.x = R2i.x;
R4i.y = R2i.y;
R4i.z = R2i.z;
R4i.w = R2i.w;
// 5
R3i.x = R1i.z;
R3i.y = R1i.y;
R3i.z = R1i.z;
R3i.w = R1i.w;
// export
if( ((vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor1 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
passPixelColor3 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
