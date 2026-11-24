#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 96ffcf94a7e488e8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[10];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem12;

out vec4 passParameterSem4;
out vec4 passParameterSem3;
out vec4 passParameterSem0;
out vec4 passParameterSem5;
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
vec4 R6f = vec4(0.0);
vec4 R124f = vec4(0.0);
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
R3f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(0x3f800000));
attrDecoder.x = attrDataSem1.x;
attrDecoder.x = uint((attrDecoder.x>>24)|((attrDecoder.x>>8)&0xFF00u)|((attrDecoder.x<<8)&0xFF0000u)|((attrDecoder.x<<24)));
attrDecoder.y = uint(0);
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xyzw = uvec4(uvec4((attrDecoder.x>>0)&0x3FFu,(attrDecoder.x>>10)&0x3FFu,(attrDecoder.x>>20)&0x3FFu,(attrDecoder.x>>30)&0x3u));
if( (attrDecoder.x&0x200u) != 0u ) attrDecoder.x |= 0xFFFFFC00u;
if( (attrDecoder.y&0x200u) != 0u ) attrDecoder.y |= 0xFFFFFC00u;
if( (attrDecoder.z&0x200u) != 0u ) attrDecoder.z |= 0xFFFFFC00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/511.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/511.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/511.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(float(attrDecoder.w)));
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
attrDecoder.zw = uvec2(uvec2(0));
R4f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
R126f.x = 1.0;
R126f.y = 1.0;
R127f.z = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[0].z));
R127f.w = 1.0;
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[1].z));
// 1
R127f.x = dot(vec4(R3f.x,R3f.y,R3f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
R124f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[1].y)) + PS0f;
// 2
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R0f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[0].y)) + R127f.z;
// 3
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
R125f.x = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[2].z));
// 4
tempf.x = dot(vec4(R127f.x,R127f.y,PV1fx,R126f.x),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 5
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R126f.x),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R6f.x = PV0fx;
// 6
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R126f.x),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R6f.y = PV1fx;
// 7
R125f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[2].y)) + R125f.x;
R127f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[1].x)) + R124f.x;
R6f.z = PV0fx;
// 8
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fx = tempf.x;
R3f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 9
R3f.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fy = R3f.x;
PV1fz = R3f.x;
PV1fw = R3f.x;
R124f.x = -(PV0fx);
// 10
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R3f.z = tempf.x;
PV0fw = tempf.x;
// 11
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R3f.w = tempf.x;
R5f.z = PV0fx;
// 12
R126f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[0].x)) + R0f.x;
R127f.z = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[2].x)) + R125f.x;
R5f.w = PV1fx;
// 13
tempf.x = dot(vec4(R127f.y,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.y,R126f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R5f.x = R3f.x + R3f.w;
R5f.x /= 2.0;
// 14
R5f.y = R124f.x + R3f.w;
R5f.y /= 2.0;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 15
R124f.x = mul_nonIEEE(R127f.y, PS0f);
R127f.y = mul_nonIEEE(R126f.y, PS0f);
R127f.z = mul_nonIEEE(R127f.z, PS0f);
// 16
tempf.x = dot(vec4(R124f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 17
tempf.x = dot(vec4(R124f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R0f.x = PV0fx;
// 18
tempf.x = dot(vec4(R124f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R0f.y = PV1fx;
// 19
R0f.z = PV0fx;
// export
SET_POSITION(vec4(R3f.x, R3f.y, R3f.z, R3f.w));
// export
passParameterSem4 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
// skipped export to semanticId 255
// export
passParameterSem3 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
// export
passParameterSem0 = vec4(R4f.x, R4f.y, R4f.x, R4f.y);
// export
passParameterSem5 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
