#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ba9e0335a2bc49df
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[8];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R6i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R0i.w = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
PV1ix = floatBitsToInt((intBitsToFloat(R5i.w) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R5i.w))?1.0:0.0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0ix));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iy));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
PV0iw = clampFI32(PV0iw);
R0i.z = uf_remappedPS[0].y;
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iz)));
R126i.z = ((intBitsToFloat(PV0iw) != 0.0)?-1:0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R124i.w = tempi.x;
R126i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1iz)));
// 5
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R126i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R125i.w)));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R3i.x)) + intBitsToFloat(PS1i));
// 7
backupReg0i = R124i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(R127i.z));
R126i.y = ((R126i.z == 0)?(0x40000000):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iw));
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 8
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0iy = R125i.x;
PV0iz = R125i.x;
PV0iw = R125i.x;
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.y)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.y)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R125i.w)));
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PV1iw)) + intBitsToFloat(R127i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PV1iy)) + intBitsToFloat(R125i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.z));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.w)));
R4i.x = floatBitsToInt((-(intBitsToFloat(uf_remappedPS[0].y)) * 0.5 + intBitsToFloat(R124i.w))*2.0);
R4i.x = clampFI32(R4i.x);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R3i.y),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = 0x3ce0e0e1;
// 12
R9i.x = PS1i;
R7i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 0.5 + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + 1.0);
PV0iz = clampFI32(PV0iz);
R9i.w = R6i.w;
R7i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5 + 0.5);
// 13
R7i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 0.5 + 0.5);
R2i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R4i.y = floatBitsToInt(tempResultf);
// 14
R8i.w = 0x3b808081;
R7i.w = 0x3b808081;
// 0
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(R0i.z));
// 1
PV1iy = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x40c90fdb));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z),intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(R0i.z));
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x), intBitsToFloat(R4i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(R0i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x40c90fdb));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(R0i.w)));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(R0i.w)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].w), intBitsToFloat(R6i.x)));
R0i.w = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
R0i.w = clampFI32(R0i.w);
// 4
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].w), intBitsToFloat(R6i.y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].w), intBitsToFloat(R6i.z)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), intBitsToFloat(R125i.z)));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), intBitsToFloat(R125i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), intBitsToFloat(R127i.x)));
PS1i = uf_remappedPS[6].z;
// 6
R9i.y = PS1i;
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R127i.x = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 7
PS1i = floatBitsToInt(cos((intBitsToFloat(PV0iw))/0.1591549367));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
R123i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 0.75 + intBitsToFloat(PS1i));
// 9
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) + 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
// 10
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1iz)));
// 11
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.y)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.x)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.w)));
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x), intBitsToFloat(uf_remappedPS[1].w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y), intBitsToFloat(uf_remappedPS[1].w)));
// 1
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z), intBitsToFloat(uf_remappedPS[1].w)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R3i.y),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
PV1iz = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
// 4
PV0iy = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0iy)));
// 6
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1ix)));
// 7
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.x));
// 8
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.w)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.z)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.y)));
// 9
R3i.x = R2i.x;
R3i.y = R2i.y;
R3i.z = R2i.z;
R3i.w = R2i.w;
// 10
R2i.x = R7i.x;
R2i.y = R7i.y;
R2i.z = R7i.z;
R2i.w = R7i.w;
// 11
R1i.x = R8i.x;
R1i.y = R8i.y;
R1i.z = R8i.z;
R1i.w = R8i.w;
// 12
R0i.x = R9i.x;
R0i.y = R9i.y;
R0i.z = R9i.z;
R0i.w = R9i.w;
// export
if( ((vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor5 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
