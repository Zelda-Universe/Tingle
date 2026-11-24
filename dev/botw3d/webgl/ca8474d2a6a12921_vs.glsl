#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ca8474d2a6a12921
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[3];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R126f = vec4(0.0);
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
PV0fx = (R1f.x > 0.0)?1.0:0.0;
PV0fy = (0.0 > R1f.y)?1.0:0.0;
PV0fz = (0.0 > R1f.x)?1.0:0.0;
PV0fw = (R1f.y > 0.0)?1.0:0.0;
R1f.z = 0.0;
// 1
R1f.x = PV0fx + -(PV0fz);
PV1fy = PV0fw + -(PV0fy);
R127f.z = intBitsToFloat(uf_remappedVS[0].x);
R1f.w = 1.0;
R126f.z = intBitsToFloat(uf_remappedVS[0].y);
// 2
R127f.x = -(intBitsToFloat(uf_remappedVS[0].x));
R1f.y = PV1fy;
R123f.z = -(PV1fy) * 0.5 + 0.5;
R123f.w = R1f.x * 0.5 + 0.5;
R126f.x = -(intBitsToFloat(uf_remappedVS[0].y));
// 3
R123f.x = mul_nonIEEE(R123f.z,intBitsToFloat(uf_remappedVS[1].w)) + intBitsToFloat(uf_remappedVS[1].y);
R123f.y = mul_nonIEEE(R123f.w,intBitsToFloat(uf_remappedVS[1].z)) + intBitsToFloat(uf_remappedVS[1].x);
// 4
backupReg0f = R123f.x;
backupReg1f = R123f.y;
R123f.x = R126f.x * 0.5 + backupReg0f;
R123f.y = R127f.x * 0.5 + backupReg1f;
R123f.z = R126f.z * 0.5 + backupReg0f;
R123f.w = R127f.z * 0.5 + backupReg1f;
// 5
R0f.x = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[2].x)) + R123f.w;
R0f.y = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedVS[2].x)) + R123f.z;
R0f.z = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[2].x)) + R123f.y;
R0f.w = mul_nonIEEE(R126f.x,intBitsToFloat(uf_remappedVS[2].x)) + R123f.x;
// export
SET_POSITION(vec4(R1f.x, R1f.y, R1f.z, R1f.w));
// export
passParameterSem2 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
