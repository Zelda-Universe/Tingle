#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 264a3aaaa2a0641f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[6];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

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
PV0fx = (R1f.z > 0.0)?1.0:0.0;
PV0fy = (R1f.x > 0.0)?1.0:0.0;
PV0fz = (0.0 > R1f.x)?1.0:0.0;
PV0fw = (0.0 > R1f.z)?1.0:0.0;
PS0f = R1f.y + -(0.5);
// 1
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PS0f);
PV1fy = PV0fx + -(PV0fw);
PV1fz = PV0fy + -(PV0fz);
R127f.w = 1.0;
R2f.z = 1.0;
// 2
PV0fx = max(PV1fz, -(PV1fz));
PV0fz = max(PV1fy, -(PV1fy));
// 3
PV1fx = -(PV0fz) + 1.0;
PV1fw = -(PV0fx) + 1.0;
// 4
PV0fy = mul_nonIEEE(PV1fx, PV1fw);
// 5
PV1fw = mul_nonIEEE(PV0fy, R127f.x);
// 6
R127f.y = R1f.y + PV1fw;
// 7
tempf.x = dot(vec4(R1f.x,R127f.y,R1f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R0f.w = tempf.x;
// 8
tempf.x = dot(vec4(R1f.x,R127f.y,R1f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV0fx = tempf.x;
R0f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.z = 1.0 / PV1fx;
// 9
R0f.x = dot(vec4(R1f.x,R127f.y,R1f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fy = R0f.x;
PV1fz = R0f.x;
PV1fw = R0f.x;
R127f.x = PV0fx * R127f.z;
// 10
tempf.x = dot(vec4(R1f.x,R127f.y,R1f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R0f.z = tempf.x;
PV0fw = tempf.x;
PS0f = R0f.x * R127f.z;
// 11
R2f.x = mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[5].x)),PS0f) + -(intBitsToFloat(uf_remappedVS[5].z));
PV1fw = R127f.x * -(1.0);
// 12
R2f.y = mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[5].y)),PV1fw) + -(intBitsToFloat(uf_remappedVS[5].w));
// export
SET_POSITION(vec4(R0f.x, R0f.y, R0f.z, R0f.w));
// export
passParameterSem1 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
