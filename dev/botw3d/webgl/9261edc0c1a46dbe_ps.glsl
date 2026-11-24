#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 9261edc0c1a46dbe
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(6, 1, 2) uniform sampler2D textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
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
R4i = floatBitsToInt(passParameterSem6);
R5i = floatBitsToInt(passParameterSem254);
R5i.w = floatBitsToInt(gl_FrontFacing?1.0:0.0);
R5i.xy = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R6i.xyz = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R0i.w = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).w);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R5i.w))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R5i.w) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0ix));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iy));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R127i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.y));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iw = clampFI32(PV0iw);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.x)));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
R125i.x = ((intBitsToFloat(PV0iw) != 0.0)?-1:0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1iz)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R126i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R125i.w)));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV1iz));
// 7
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(R125i.y));
R126i.z = ((R125i.x == 0)?(0x40000000):(0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 8
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0iy = R125i.x;
PV0iz = R125i.x;
PV0iw = R125i.x;
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R125i.w)));
// 10
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(PV1iw)) + intBitsToFloat(R127i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(PV1iy)) + intBitsToFloat(R127i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[1].w)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R126i.y),intBitsToFloat(R126i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = 0x3ce0e0e1;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R126i.y),intBitsToFloat(R126i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(PV1ix) + 1.0);
PS0i = clampFI32(PS0i);
// 13
R2i.x = R127i.x;
R0i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5 + 0.5);
PV1iz = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
R2i.w = R0i.w;
tempResultf = max(0.0, intBitsToFloat(PS0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R4i.y = floatBitsToInt(tempResultf);
// 14
R0i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 0.5 + 0.5);
PV0iy = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
R0i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 0.5 + 0.5);
R3i.w = 0;
R0i.w = 0;
// 15
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0iy)));
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), intBitsToFloat(R4i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), intBitsToFloat(R6i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), intBitsToFloat(R6i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), intBitsToFloat(R6i.z)));
// 1
PV1iz = uf_remappedPS[4].z;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
PS1i = clampFI32(PS1i);
// 2
R2i.y = PV1iz;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R4i.x)));
// 3
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.x));
// 4
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.w)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.z)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.y)));
// 5
R6i.x = R0i.x;
R6i.y = R0i.y;
R6i.z = R0i.z;
R6i.w = R0i.w;
// 6
R5i.x = R3i.x;
R5i.y = R3i.y;
R5i.z = R3i.z;
R5i.w = R3i.w;
// 7
R4i.x = R2i.x;
R4i.y = R2i.y;
R4i.z = R2i.z;
R4i.w = R2i.w;
// export
if( ((vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
passPixelColor1 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
passPixelColor3 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
}
