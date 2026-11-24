#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 060d40c5f297ef29
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
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
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
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
R1i = floatBitsToInt(passParameterSem3);
R2i = floatBitsToInt(passParameterSem4);
R3i = floatBitsToInt(passParameterSem7);
R4i.xy = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R0i.w = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
// 0
PV0ix = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = ((intBitsToFloat(uf_remappedPS[0].x) > 0.0)?-1:0);
PV0iw = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
R125i.y = ((PV0iz == 0)?(0):(0x3f800000));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
// 2
PV0ix = ((intBitsToFloat(R125i.y) > 0.0)?-1:0);
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PV1ix)) + 1.0);
R123i.w = clampFI32(R123i.w);
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(PV1iz)) + 1.0);
R122i.x = clampFI32(R122i.x);
// 3
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R122i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.w));
R123i.w = ((PV0ix == 0)?(0):(uf_remappedPS[0].x));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(backupReg0i));
// 4
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(backupReg0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.w) * 255.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.z));
R123i.w = clampFI32(R123i.w);
R126i.w = 0x3d008081;
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0ix)));
PS1i = int(intBitsToFloat(PV0iz));
// 6
backupReg0i = R127i.y;
PV0ix = PS1i & 0xe0;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iw));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(backupReg0i)));
// 7
R127i.x = uf_remappedPS[1].z;
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 63.75);
PV1iw = PV0ix >> 0x3;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R127i.z)));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.z));
R127i.w = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 4.0);
PS0i = floatBitsToInt(float(PV1iw));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PS0i) + 64.0);
// 10
R125i.x = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0 + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) + 2.0);
R0i.z = R126i.w;
R0i.w = R5i.w;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 11
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + 0.5);
R0i.y = R127i.x;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS0i)) + 0.5);
R1i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3b808081));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 0.5);
// 12
R5i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3b808081));
// 13
R3i.x = R1i.x;
R3i.y = R1i.y;
R3i.z = R1i.z;
R3i.w = R1i.w;
// 14
R2i.x = R5i.x;
R2i.y = R5i.y;
R2i.z = R5i.z;
R2i.w = R5i.w;
// 15
R1i.x = R0i.z;
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = R0i.w;
// export
if( ((vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor3 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
