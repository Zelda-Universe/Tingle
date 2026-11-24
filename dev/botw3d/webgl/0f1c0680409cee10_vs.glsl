#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0f1c0680409cee10
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[5];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem0;
out vec4 passParameterSem2;
out vec4 passParameterSem1;
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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R2f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R127f = vec4(0.0);
uvec4 attrDecoder;
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = vec4(floatBitsToInt(vec4(ivec4(gl_VertexID, 0, 0, gl_InstanceID))));
attrDecoder.xyz = attrDataSem0.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(0x3f800000));
// 0
R2f.x = R1f.x;
R2f.x *= 2.0;
R2f.y = R1f.y;
R2f.y *= 2.0;
R0f.z = 0.0;
R0f.w = 1.0;
PS0f = 1.0 / intBitsToFloat(uf_remappedVS[0].x);
// 1
PV1fy = R1f.x * PS0f;
PS1f = 1.0 / intBitsToFloat(uf_remappedVS[0].y);
// 2
PV0fx = R1f.y * PS1f;
R127f.w = PV1fy + 0.5;
// 3
PV1fx = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedVS[1].y));
R127f.z = PV0fx + 0.5;
PV1fw = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedVS[1].x));
R1f.x = R127f.w;
// 4
PV0fx = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[1].w));
PV0fy = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[1].z));
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), PV1fw);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), PV1fx);
R1f.y = R127f.z;
// 5
PV1fx = mul_nonIEEE(PV0fy, intBitsToFloat(uf_remappedVS[2].w));
PV1fy = PV0fz + intBitsToFloat(uf_remappedVS[3].z);
PV1fz = intBitsToFloat(uf_remappedVS[3].w) + PV0fw;
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].w), PV0fx);
// 6
R0f.x = PV1fx + PV1fy;
R0f.y = PV1fw + PV1fz;
R123f.w = mul_nonIEEE(R127f.w,intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[4].z);
// 7
R1f.z = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[4].y)) + R123f.w;
// export
SET_POSITION(vec4(R0f.x, R0f.y, R0f.z, R0f.w));
// export
passParameterSem0 = vec4(R1f.x, R1f.y, R1f.z, R1f.z);
// export
passParameterSem2 = vec4(R2f.x, R2f.y, R2f.z, R2f.z);
// export
passParameterSem1 = vec4(R1f.z, R1f.y, R1f.y, R1f.y);
}
