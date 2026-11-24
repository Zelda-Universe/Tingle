#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 756cf0f314465c59
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 0) uniform uniformBlockVS1
{
vec4 uf_blockVS1[1];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 1) uniform uniformBlockVS2
{
vec4 uf_blockVS2[4096];
};


ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

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
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
uvec4 attrDecoder;
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
R0i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
// 0
R126i.x = 0;
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) + -(uf_blockVS1[0].y));
R126i.z = 0x3f800000;
PV0iw = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS1[0].x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS1[0].w));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS1[0].z, -(intBitsToFloat(PV0iy))));
R2i.y = R0i.w;
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS1[0].z, intBitsToFloat(PV0iw)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + 2.0);
PV0iy = ((-(1.0) > intBitsToFloat(R127i.z))?-1:0);
// 3
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = R126i.z;
R127i.z = backupReg0i;
R127i.w = ((PV0iy == 0)?(backupReg1i):(PV0ix));
R127i.y = R126i.x;
// 4
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + -2.0);
PV0iw = ((intBitsToFloat(R127i.w) > 1.0)?-1:0);
// 5
backupReg0i = R127i.x;
backupReg1i = R127i.y;
R127i.x = R127i.z;
R127i.y = ((PV0iw == 0)?(R127i.w):(PV0iz));
R127i.z = backupReg0i;
R127i.w = backupReg1i;
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) + 2.0);
PV0iy = ((-(1.0) > intBitsToFloat(R127i.x))?-1:0);
// 7
backupReg0i = R127i.x;
backupReg1i = R127i.y;
R127i.x = R127i.z;
R127i.y = R127i.w;
R127i.z = ((PV0iy == 0)?(backupReg0i):(PV0ix));
R127i.w = backupReg1i;
// 8
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) + -2.0);
PV0iw = ((intBitsToFloat(R127i.z) > 1.0)?-1:0);
// 9
R0i.x = R127i.w;
R0i.y = ((PV0iw == 0)?(R127i.z):(PV0iz));
R0i.z = R127i.y;
R0i.w = R127i.x;
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
gl_PointSize = (vec4(intBitsToFloat(R1i.y), 0, 0, 0)).x;
// export
// skipped export to semanticId 255
}
