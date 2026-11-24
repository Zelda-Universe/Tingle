#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f9c7da3cb9a185ce
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
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
ivec4 R2i = ivec4(0);
ivec4 R123i = ivec4(0);
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
R0i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R1i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyzw);
R2i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyzw);
// 0
PV0ix = floatBitsToInt(max(intBitsToFloat(R0i.w), intBitsToFloat(R1i.w)));
PV0iy = uf_remappedPS[0].x & 0x80;
PV0iz = floatBitsToInt(min(intBitsToFloat(R0i.w), intBitsToFloat(R1i.w)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R1i.w)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R1i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R1i.w)));
R123i.w = ((PV0iy == 0)?(PV0ix):(PV0iz));
R127i.z = uf_remappedPS[0].x & 0x8000;
// 2
PV0ix = floatBitsToInt(max(intBitsToFloat(R123i.w), intBitsToFloat(R2i.w)));
PV0iy = floatBitsToInt(min(intBitsToFloat(R123i.w), intBitsToFloat(R2i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R2i.x)));
// 3
R127i.x = ((R127i.z == 0)?(PV0ix):(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R2i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R2i.z)));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(uf_remappedPS[1].x)) + intBitsToFloat(uf_remappedPS[2].x));
// 4
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedPS[1].y)) + intBitsToFloat(uf_remappedPS[2].y));
// 5
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[1].z)) + intBitsToFloat(uf_remappedPS[2].z));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedPS[1].w)) + intBitsToFloat(uf_remappedPS[2].w));
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
