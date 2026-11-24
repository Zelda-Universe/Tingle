#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ce24834ec5d5d4f7
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_uniformRegisterPS[256];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2DArray textureUnitPS1;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
layout(location = 0) out vec4 passPixelColor0;
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
R1i = floatBitsToInt(passParameterSem1);
R0i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
// 0
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.z)));
R1i.xyz = floatBitsToInt(texture(textureUnitPS1, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xyz);
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R1i.x) * 63.75 + 0.125);
R127i.w = floatBitsToInt(intBitsToFloat(R1i.y) * 63.75 + 0.125);
// 1
R127i.x = floatBitsToInt(fract(intBitsToFloat(R127i.w)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 4.0);
R125i.z = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 4.0);
R127i.z = int(intBitsToFloat(R123i.x));
// 2
R126i.z = int(intBitsToFloat(R127i.w));
// 3
R126i.y = floatBitsToInt(float(R127i.z));
// 4
tempResultf = intBitsToFloat(R126i.y);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.x = int(tempResultf);
PV0ix = floatBitsToInt(tempResultf);
R125i.y = floatBitsToInt(float(R126i.z));
// 5
tempResultf = intBitsToFloat(R125i.y);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.y = int(tempResultf);
PV1iy = floatBitsToInt(tempResultf);
R127i.y = int(intBitsToFloat(R125i.z));
// 6
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = int(-1) + backupReg0i;
R125i.z = 0xfffffffd + backupReg0i;
R127i.w = 0xfffffffe + backupReg0i;
R126i.w = int(intBitsToFloat(backupReg1i));
// 7
backupReg0i = R126i.w;
R126i.x = int(-1) + backupReg0i;
R126i.z = 0xfffffffd + backupReg0i;
R125i.w = 0xfffffffe + backupReg0i;
// 8
R123i.x = ((R127i.x == 0)?(uf_uniformRegisterPS[ARi.x+0].y):(0));
R123i.y = ((R127i.y == 0)?(uf_uniformRegisterPS[ARi.x+0].x):(0));
R125i.z = ((R125i.z == 0)?(uf_uniformRegisterPS[ARi.x+0].w):(0));
R127i.w = ((R127i.w == 0)?(uf_uniformRegisterPS[ARi.x+0].z):(0));
// 9
backupReg0i = R123i.y;
backupReg1i = R123i.x;
R123i.x = ((R126i.x == 0)?(uf_uniformRegisterPS[ARi.y+0].y):(0));
R123i.y = ((R126i.w == 0)?(uf_uniformRegisterPS[ARi.y+0].x):(0));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(backupReg1i));
R126i.w = ((R125i.w == 0)?(uf_uniformRegisterPS[ARi.y+0].z):(0));
R126i.z = ((R126i.z == 0)?(uf_uniformRegisterPS[ARi.y+0].w):(0));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(R123i.x));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iy));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
// 12
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1ix));
// 13
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iw));
// 14
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R1i.z)) + intBitsToFloat(R126i.w));
// 15
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(uf_uniformRegisterPS[32].x)) + intBitsToFloat(R0i.x));
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
