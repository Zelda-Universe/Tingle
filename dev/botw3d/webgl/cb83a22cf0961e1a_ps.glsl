#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader cb83a22cf0961e1a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
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
ivec4 R2i = ivec4(0);
ivec4 R123i = ivec4(0);
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
// 0
R2i.x = ((intBitsToFloat(R0i.w) > 0.0)?-1:0);
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.z)));
R1i.w = floatBitsToInt(texture(textureUnitPS0, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).w);
// 0
PV0ix = R1i.w;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = ((intBitsToFloat(0x3f0a3d71) > intBitsToFloat(R1i.w))?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R1i.w) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
// 1
R127i.y = ((PV0iy == 0)?(0x3f800000):(PV0ix));
R127i.z = ((PV0iy == 0)?(PV0iw):(0));
// 2
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[0].y)) + intBitsToFloat(uf_remappedPS[1].y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedPS[0].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(uf_remappedPS[1].z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R123i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R123i.z)));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R123i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].y)) + intBitsToFloat(uf_remappedPS[3].y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(uf_remappedPS[3].x));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedPS[2].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[2].z)) + intBitsToFloat(uf_remappedPS[3].z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R123i.z)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)), intBitsToFloat(PV1ix)));
R0i.y = ((R2i.x == 0)?(PV1iw):(R127i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R123i.y)));
R0i.x = ((R2i.x == 0)?(PV1iz):(R126i.z));
// 7
R0i.z = ((R2i.x == 0)?(PV0iz):(R127i.x));
R0i.w = ((R2i.x == 0)?(PV0ix):(R126i.y));
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
