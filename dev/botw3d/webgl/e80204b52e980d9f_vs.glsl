#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e80204b52e980d9f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[9];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem0;
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
vec4 R125f = vec4(0.0);
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
PV0fx = R1f.x;
PV0fx *= 2.0;
R127f.y = intBitsToFloat(uf_remappedVS[0].x) + -4.0;
PV0fz = R1f.z;
PV0fz *= 2.0;
PV0fw = R1f.y;
PV0fw *= 2.0;
R127f.x = intBitsToFloat(uf_remappedVS[0].y) + -4.0;
// 1
PV1fx = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedVS[1].x));
PV1fy = mul_nonIEEE(PV0fx, intBitsToFloat(uf_remappedVS[1].x));
R127f.z = intBitsToFloat(uf_remappedVS[0].z) + -4.0;
PV1fw = mul_nonIEEE(PV0fz, intBitsToFloat(uf_remappedVS[1].x));
R126f.w = 1.0;
// 2
PV0fx = PV1fw + intBitsToFloat(uf_remappedVS[2].z);
PV0fy = PV1fx + intBitsToFloat(uf_remappedVS[2].y);
PV0fz = PV1fy + intBitsToFloat(uf_remappedVS[2].x);
R0f.w = 1.0;
// 3
PV1fx = intBitsToFloat(uf_remappedVS[3].x) + 4.0;
PV1fy = max(PV0fz, R127f.y);
PV1fz = max(PV0fy, R127f.x);
R127f.w = max(PV0fx, R127f.z);
PS1f = intBitsToFloat(uf_remappedVS[3].y) + 4.0;
// 4
PV0fx = intBitsToFloat(uf_remappedVS[3].z) + 4.0;
R127f.y = min(PV1fx, PV1fy);
R127f.z = min(PS1f, PV1fz);
// 5
R126f.z = min(PV0fx, R127f.w);
// 6
tempf.x = dot(vec4(R127f.y,R127f.z,R126f.z,R126f.w),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R1f.w = tempf.x;
// 7
tempf.x = dot(vec4(R127f.y,R127f.z,R126f.z,R126f.w),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV1fx = tempf.x;
R1f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R125f.z = 1.0 / PV0fx;
// 8
R1f.x = dot(vec4(R127f.y,R127f.z,R126f.z,R126f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fy = R1f.x;
PV0fz = R1f.x;
PV0fw = R1f.x;
R127f.x = PV1fx * R125f.z;
// 9
tempf.x = dot(vec4(R127f.y,R127f.z,R126f.z,R126f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R1f.z = tempf.x;
PV1fw = tempf.x;
PS1f = R1f.x * R125f.z;
// 10
R0f.x = mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[8].x)),PS1f) + -(intBitsToFloat(uf_remappedVS[8].z));
PV0fw = R127f.x * -(1.0);
// 11
R0f.y = mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[8].y)),PV0fw) + -(intBitsToFloat(uf_remappedVS[8].w));
// export
SET_POSITION(vec4(R1f.x, R1f.y, R1f.z, R1f.w));
// export
passParameterSem0 = vec4(R0f.x, R0f.y, R0f.w, R0f.w);
}
