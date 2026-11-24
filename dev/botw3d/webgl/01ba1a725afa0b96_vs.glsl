#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 01ba1a725afa0b96
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 0) uniform uniformBlockVS1
{
vec4 uf_blockVS1[4096];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 1) uniform uniformBlockVS2
{
vec4 uf_blockVS2[8];
};


ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem1;
out vec4 passParameterSem2;
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
attrDecoder.xyz = attrDataSem0.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
// 0
R1i.x = floatBitsToInt(uf_blockVS2[7].z);
R0i.z = R0i.x << int(1);
R0i.w = 0x3f800000;
// 1
R0i.y = R0i.z + int(1);
R3i.xyzw = floatBitsToInt(uf_blockVS1[R0i.z].xyzw);
R2i.xyzw = floatBitsToInt(uf_blockVS1[R0i.y].xyzw);
// export
gl_PointSize = (vec4(intBitsToFloat(R1i.x), 0, 0, 0)).x;
// 0
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS2[0].x,uf_blockVS2[0].y,uf_blockVS2[0].z,uf_blockVS2[0].w)));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R2i.w)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS2[1].x,uf_blockVS2[1].y,uf_blockVS2[1].z,uf_blockVS2[1].w)));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.w = floatBitsToInt(float(R0i.x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS2[2].x,uf_blockVS2[2].y,uf_blockVS2[2].z,uf_blockVS2[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS2[3].x,uf_blockVS2[3].y,uf_blockVS2[3].z,uf_blockVS2[3].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w)));
// export
passParameterSem1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
