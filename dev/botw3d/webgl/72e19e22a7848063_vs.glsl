#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 72e19e22a7848063
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[4];
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
vec4 R2f = vec4(0.0);
vec4 R3f = vec4(0.0);
vec4 R4f = vec4(0.0);
vec4 R5f = vec4(0.0);
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
PV0fx = (R1f.y > 0.0)?1.0:0.0;
PV0fy = (R1f.x > 0.0)?1.0:0.0;
PV0fz = (0.0 > R1f.y)?1.0:0.0;
PV0fw = (0.0 > R1f.x)?1.0:0.0;
R1f.z = intBitsToFloat(uf_remappedVS[0].y);
// 1
PV1fx = PV0fx + -(PV0fz);
PV1fy = PV0fy + -(PV0fw);
R126f.z = 0.0;
R1f.w = 1.0;
R125f.x = 1.0 / intBitsToFloat(uf_remappedVS[1].x);
// 2
R127f.x = PV1fy * 0.5 + 0.5;
PV0fy = mul_nonIEEE(PV1fy, intBitsToFloat(uf_remappedVS[2].x));
R127f.z = -(PV1fx) * 0.5 + 0.5;
PV0fw = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
R126f.x = R125f.x * 1.0;
// 3
R1f.x = intBitsToFloat(uf_remappedVS[2].z) + PV0fy;
R1f.y = intBitsToFloat(uf_remappedVS[2].w) + PV0fw;
R125f.z = 0.0;
R127f.w = R125f.x * 1.0;
R0f.z = intBitsToFloat(uf_remappedVS[1].z);
// 4
backupReg0f = R127f.z;
R127f.z = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(uf_remappedVS[3].z);
R126f.w = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedVS[3].y)) + intBitsToFloat(uf_remappedVS[3].w);
// 5
backupReg0f = R126f.z;
R126f.x = R127f.z + R126f.x;
R127f.y = R126f.w + 0.0;
R126f.z = R127f.z + 0.0;
R125f.w = R126f.w + backupReg0f;
R126f.y = R125f.z + R127f.z;
// 6
R127f.x = R127f.w + R126f.w;
R125f.y = R126f.w + R127f.w;
R2f.z = intBitsToFloat(uf_remappedVS[1].z);
R127f.w = R127f.z + R127f.w;
R0f.x = R127f.z;
// 7
R2f.x = -(R125f.x) * 0.5 + R126f.z;
R0f.y = R126f.w;
R4f.z = intBitsToFloat(uf_remappedVS[1].z);
R2f.w = -(R125f.x) * 0.5 + R127f.y;
R4f.x = -(R125f.x) * 0.5 + R126f.x;
// 8
R3f.x = -(R125f.x) * 0.5 + R126f.y;
R4f.y = -(R125f.x) * 0.5 + R125f.w;
R3f.z = intBitsToFloat(uf_remappedVS[1].z);
R3f.w = -(R125f.x) * 0.5 + R127f.x;
R5f.x = -(R125f.x) * 0.5 + R127f.w;
// 9
R5f.y = -(R125f.x) * 0.5 + R125f.y;
R5f.z = intBitsToFloat(uf_remappedVS[1].z);
// export
SET_POSITION(vec4(R1f.x, R1f.y, R1f.z, R1f.w));
// export
passParameterSem0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
}
