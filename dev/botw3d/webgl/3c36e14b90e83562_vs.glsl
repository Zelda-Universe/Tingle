#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3c36e14b90e83562
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[7];
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
R126f.y = 1.0;
PV0fz = R1f.z;
PV0fz *= 2.0;
PV0fw = R1f.y;
PV0fw *= 2.0;
R0f.z = 1.0;
// 1
PV1fx = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedVS[0].x));
PV1fy = mul_nonIEEE(PV0fx, intBitsToFloat(uf_remappedVS[0].x));
PV1fw = mul_nonIEEE(PV0fz, intBitsToFloat(uf_remappedVS[0].x));
// 2
R127f.x = PV1fy + intBitsToFloat(uf_remappedVS[1].x);
R127f.y = PV1fx + intBitsToFloat(uf_remappedVS[1].y);
R127f.z = PV1fw + intBitsToFloat(uf_remappedVS[1].z);
// 3
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R1f.w = tempf.x;
// 4
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV0fx = tempf.x;
R1f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.z = 1.0 / PV1fx;
// 5
R1f.x = dot(vec4(R127f.x,R127f.y,R127f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w)));
PV1fy = R1f.x;
PV1fz = R1f.x;
PV1fw = R1f.x;
R126f.x = PV0fx * R126f.z;
// 6
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R1f.z = tempf.x;
PV0fw = tempf.x;
PS0f = R1f.x * R126f.z;
// 7
R0f.x = mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[6].x)),PS0f) + -(intBitsToFloat(uf_remappedVS[6].z));
PV1fw = R126f.x * -(1.0);
// 8
R0f.y = mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[6].y)),PV1fw) + -(intBitsToFloat(uf_remappedVS[6].w));
// export
SET_POSITION(vec4(R1f.x, R1f.y, R1f.z, R1f.w));
// export
passParameterSem0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
