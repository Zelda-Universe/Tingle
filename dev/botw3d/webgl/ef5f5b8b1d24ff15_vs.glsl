#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ef5f5b8b1d24ff15
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[22];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
TEXTURE_LAYOUT(35, 0, 3) uniform sampler2D textureUnitVS3;
TEXTURE_LAYOUT(36, 0, 4) uniform sampler2D textureUnitVS4;
TEXTURE_LAYOUT(37, 0, 5) uniform sampler2D textureUnitVS5;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;

out vec4 passParameterSem3;
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
vec4 R3f = vec4(0.0);
vec4 R4f = vec4(0.0);
vec4 R5f = vec4(0.0);
vec4 R6f = vec4(0.0);
vec4 R7f = vec4(0.0);
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
vec4 R123f = vec4(0.0);
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
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem0.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R4f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xy = attrDataSem1.xy;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.zw = uvec2(uvec2(0));
R3f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem2.xy)));
attrDecoder.zw = uvec2(uvec2(0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem8.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
// 0
PV0fx = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[0].x));
PV0fy = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[0].y));
PV0fz = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[1].y));
PV0fw = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[1].x));
R127f.x = R2f.x * intBitsToFloat(0x3e65a5dd);
// 1
R7f.x = intBitsToFloat(uf_remappedVS[1].z) + PV0fw;
R7f.y = intBitsToFloat(uf_remappedVS[1].w) + PV0fz;
R2f.z = intBitsToFloat(uf_remappedVS[0].z) + PV0fx;
R3f.w = intBitsToFloat(uf_remappedVS[0].w) + PV0fy;
R2f.w = 1.0;
// 2
PV0fx = R2f.x + intBitsToFloat(uf_remappedVS[2].w);
R127f.y = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[2].z));
PV0fz = intBitsToFloat(uf_remappedVS[2].w) * intBitsToFloat(0x43c9d6c7);
R127f.w = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[2].y));
R0f.y = intBitsToFloat(uf_remappedVS[2].x);
// 3
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[3].y));
PV1fy = backupReg0f + PV0fz;
R127f.z = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[3].x));
PV1fw = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[4].y));
R1f.w = PV0fx * intBitsToFloat(0x439d1463);
// 4
PV0fx = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[5].x));
PV0fy = PV1fy + -(PV1fw);
PV0fz = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[4].z));
PV0fw = -(R127f.w) + PV1fy;
R127f.w = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[5].y));
// 5
PV1fx = -(PV0fz) + PV0fy;
R4f.y = intBitsToFloat(uf_remappedVS[3].w) + R127f.x;
PV1fz = -(R127f.y) + PV0fw;
R4f.w = intBitsToFloat(uf_remappedVS[3].z) + R127f.z;
R6f.x = intBitsToFloat(uf_remappedVS[5].z) + PV0fx;
// 6
R0f.x = PV1fz * intBitsToFloat(0x3cb6a401);
R6f.y = intBitsToFloat(uf_remappedVS[5].w) + R127f.w;
PV0fz = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[6].x));
PV0fw = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[6].y));
R5f.x = PV1fx * intBitsToFloat(0x3cb6a401);
// 7
R4f.x = intBitsToFloat(uf_remappedVS[6].z) + PV0fz;
R5f.y = intBitsToFloat(uf_remappedVS[2].x);
R4f.z = intBitsToFloat(uf_remappedVS[6].w) + PV0fw;
R0f.w = R1f.w;
R0f.w *= 4.0;
R10f.x = R2f.z;
R9f.xyzw = (texture(textureUnitVS3, vec2(R7f.x,R7f.y)).xyzw);
R8f.xy = (texture(textureUnitVS0, vec2(R4f.w,R4f.y)).xy);
R0f.x = (texture(textureUnitVS5, vec2(R0f.x,R0f.y)).x);
R5f.x = (texture(textureUnitVS5, vec2(R5f.x,R5f.y)).x);
R11f.xy = (texture(textureUnitVS2, vec2(R6f.x,R6f.y)).zw);
R4f.xy = (texture(textureUnitVS1, vec2(R4f.x,R4f.z)).xy);
R6f.yzw = (texture(textureUnitVS4, vec2(R7f.x,R7f.y)).xyz);
// 0
R123f.x = R0f.w * intBitsToFloat(0x3e22f983) + 0.5;
R7f.y = R9f.z * 800.0;
R1f.z = R3f.w;
R123f.w = R1f.w * intBitsToFloat(0x3e22f983) + 0.5;
R127f.x = R10f.x + -(intBitsToFloat(uf_remappedVS[7].x));
// 1
PV1fx = fract(R123f.x);
R127f.y = R7f.y + -(intBitsToFloat(uf_remappedVS[7].y));
R127f.z = R1f.z + -(intBitsToFloat(uf_remappedVS[7].z));
R127f.w = fract(R123f.w);
R126f.y = R8f.y;
R126f.y *= 2.0;
// 2
tempf.x = dot(vec4(R10f.x,R7f.y,R1f.z,R2f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.w = PV1fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 3
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = max(PV0fx, -(PV0fx));
// 4
R123f.x = R127f.w * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.y = intBitsToFloat(uf_remappedVS[2].x) + intBitsToFloat(0xbe99999a);
R127f.y = clamp(R127f.y, 0.0, 1.0);
PV0fz = -(intBitsToFloat(uf_remappedVS[2].x)) + 1.0;
PV0fw = PS1f * intBitsToFloat(0x3f4ccccd);
PV0fw = clamp(PV0fw, 0.0, 1.0);
R0f.w = sqrt(PV1fx);
// 5
PV1fx = R126f.w * intBitsToFloat(0x3e22f983);
PV1fy = min(intBitsToFloat(uf_remappedVS[2].x), PV0fz);
PV1fy *= 2.0;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R127f.z = R123f.x * intBitsToFloat(0x3e22f983);
R126f.w = -(PV0fw) + 1.0;
R127f.w = -(R0f.w) + 7.5;
// 6
backupReg0f = R127f.y;
R127f.x = R8f.x;
R127f.x *= 2.0;
R127f.y = R126f.y + -(1.0);
PV0fz = backupReg0f * intBitsToFloat(0x3d6a0fd3);
R125f.w = PV1fy * intBitsToFloat(0x3ca3d70a);
PS0f = sin((PV1fx)/0.1591549367);
// 7
backupReg0f = R127f.z;
R126f.x = R11f.y;
R126f.x /= 2.0;
R126f.y = mul_nonIEEE(PV0fz, PS0f);
R127f.z = mul_nonIEEE(R126f.w, intBitsToFloat(uf_remappedVS[9].w));
R127f.w = R127f.w * intBitsToFloat(0x3de38e39);
R127f.w = clamp(R127f.w, 0.0, 1.0);
PS1f = sin((backupReg0f)/0.1591549367);
// 8
backupReg0f = R127f.y;
PV0fx = mul_nonIEEE(R125f.w, PS1f);
R127f.y = R5f.x;
R127f.y *= 2.0;
R125f.z = mul_nonIEEE(R4f.x, R4f.y);
R125f.w = R0f.x;
R125f.w *= 2.0;
R126f.z = -(backupReg0f);
// 9
backupReg0f = R126f.y;
backupReg1f = R127f.z;
PV1fx = R127f.x + -(1.0);
R126f.y = R126f.x + 0.5;
R127f.z = backupReg0f + PV0fx;
PV1fw = -(backupReg1f) + 1.0;
PS1f = -(R127f.w) + 1.0;
// 10
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), R125f.w);
PV0fy = R2f.y;
PV0fy /= 2.0;
R124f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), R127f.y);
R125f.w = max(PV1fw, PS1f);
R127f.w = mul_nonIEEE(PV1fx, R126f.y);
// 11
PV1fx = mul_nonIEEE(R126f.y, R125f.z);
PV1fy = mul_nonIEEE(R9f.w, intBitsToFloat(uf_remappedVS[9].y));
R126f.z = mul_nonIEEE(R126f.z, R126f.y);
PV1fw = PV0fy + 0.75;
R127f.x = R127f.z + PV0fx;
// 12
PV0fx = mul_nonIEEE(PV1fw, PV1fy);
R126f.y = mul_nonIEEE(R126f.z, R126f.z);
PV0fz = R127f.z + R124f.z;
PV0fw = mul_nonIEEE(PV1fx, R125f.w);
R127f.y = mul_nonIEEE(R127f.w, R127f.w);
// 13
PV1fx = mul_nonIEEE(PV0fz, intBitsToFloat(uf_remappedVS[10].w));
PV1fy = mul_nonIEEE(PV0fz, intBitsToFloat(uf_remappedVS[10].z));
PV1fz = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedVS[10].y));
PV1fw = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedVS[10].x));
R125f.y = mul_nonIEEE(PV0fw, PV0fx);
// 14
backupReg0f = R127f.y;
PV0fx = PV1fy + PV1fw;
R127f.y = PV1fx + PV1fz;
PV0fz = intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(0xbf1eb852);
PV0fw = R126f.y + backupReg0f;
R127f.x = R3f.x;
R127f.x *= 2.0;
// 15
PV1fx = -(PV0fw) + 1.0;
R126f.y = mul_nonIEEE(PV0fz,R11f.y) + intBitsToFloat(0x3f1eb852);
PV1fz = R3f.y;
PV1fz *= 2.0;
PV1fw = R125f.y;
PV1fw /= 2.0;
R125f.w = mul_nonIEEE(R11f.y, PV0fx);
// 16
backupReg0f = R126f.z;
PV0fx = mul_nonIEEE(R11f.y, R127f.y);
R3f.y = R127f.w + R127f.x;
R126f.z = PV1fw + intBitsToFloat(0x38d1b717);
R2f.w = backupReg0f + PV1fz;
PS0f = max(PV1fx, intBitsToFloat(0x3e4ccccd));
// 17
PV1fx = R125f.w;
PV1fy = PV0fx;
PV1fz = mul_nonIEEE(-(R125f.y), R126f.y);
R125f.w = mul_nonIEEE(R3f.y, R126f.z);
R127f.w = mul_nonIEEE(R125f.y, PS0f);
// 18
PV0fx = mul_nonIEEE(R2f.w, R126f.z);
PV0fy = PV1fz * intBitsToFloat(0x3fa66666);
PV0fz = PV1fy * intBitsToFloat(0x3fa66666);
PV0fw = PV1fx * intBitsToFloat(0x3fa66666);
R127f.x = -(R9f.w) + 2.0;
R127f.x /= 2.0;
// 19
R3f.x = R125f.w + PV0fw;
R4f.y = R127f.w + PV0fy;
R0f.z = PV0fx + PV0fz;
PV1fw = mul_nonIEEE(R9f.w, intBitsToFloat(uf_remappedVS[9].x));
R4f.z = mul_nonIEEE(R1f.y, R125f.y);
// 20
backupReg0f = R9f.x;
R9f.x = 1.0;
R8f.y = backupReg0f * 2.0 + -(1.0);
PV0fz = mul_nonIEEE(R127f.x, PV1fw);
R9f.w = 1.0;
R1f.w = R9f.y * 2.0 + -(1.0);
// 21
tempf.x = dot(vec4(R3f.x,R4f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(R3f.x,R4f.y,R0f.z,0.0));
PV1fx = tempf.x;
R9f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R2f.y = PV0fz + intBitsToFloat(0x38d1b717);
// 0
R127f.x = mul_nonIEEE(R3f.y, R2f.y);
PV0fy = intBitsToFloat(uf_remappedVS[11].x) + -(1.0);
R127f.z = mul_nonIEEE(-(R0f.w),intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(uf_remappedVS[11].x);
R127f.w = mul_nonIEEE(-(R2f.w), R2f.y);
tempResultf = 1.0 / sqrt(R9f.y);
PS0f = tempResultf;
// 1
PV1fx = mul_nonIEEE(R1f.x, R127f.x);
PV1fy = mul_nonIEEE(R1f.x, R127f.w);
R126f.z = mul_nonIEEE(R8f.y, R8f.y);
PV1fw = mul_nonIEEE(R4f.z, PS0f);
R126f.x = 1.0 / PV0fy;
// 2
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R0f.z, PV1fw);
R125f.y = -(backupReg0f) + PV1fx;
R124f.z = mul_nonIEEE(R3f.x, PV1fw);
R127f.w = -(R127f.w) + PV1fy;
R124f.y = mul_nonIEEE(R4f.y, PV1fw);
// 3
R123f.x = mul_nonIEEE(R1f.w,R1f.w) + R126f.z;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R127f.y = R7f.y + R124f.y;
PV1fz = R1f.z + R127f.x;
PV1fw = R10f.x + R124f.z;
R126f.y = R1f.y * intBitsToFloat(0x3eaaaaab);
R126f.y = clamp(R126f.y, 0.0, 1.0);
// 4
backupReg0f = R125f.y;
backupReg1f = R127f.z;
backupReg2f = R126f.x;
R126f.x = PV1fw + R127f.w;
R125f.y = R8f.y;
R127f.z = PV1fz + backupReg0f;
R0f.w = mul_nonIEEE(backupReg1f,backupReg2f) + -(backupReg2f);
R0f.w = clamp(R0f.w, 0.0, 1.0);
R126f.z = -(R123f.x) + 1.0;
// 5
R7f.x = dot(vec4(R126f.x,R127f.y,R127f.z,R9f.w),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fy = R7f.x;
PV1fz = R7f.x;
PV1fw = R7f.x;
R127f.w = intBitsToFloat(0x3e99999a) * R126f.y;
// 6
tempf.x = dot(vec4(R126f.x,R127f.y,R127f.z,R9f.w),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV0fx = tempf.x;
R7f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.x = mul_nonIEEE(R127f.w,R124f.z) + R125f.y;
// 7
tempf.x = dot(vec4(R126f.x,R127f.y,R127f.z,R9f.w),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R7f.z = tempf.x;
PV1fw = tempf.x;
PS1f = sqrt(R126f.z);
// 8
R8f.x = dot(vec4(R7f.x,R7f.y,PV1fx,R9f.x),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w)));
PV0fy = R8f.x;
PV0fz = R8f.x;
PV0fw = R8f.x;
R127f.z = mul_nonIEEE(R127f.w,R124f.y) + PS1f;
// 9
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w)));
PV1fx = tempf.x;
R8f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = R1f.w;
// 10
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R8f.z = tempf.x;
PV0fw = tempf.x;
R127f.y = mul_nonIEEE(R127f.w,R127f.x) + PS1f;
// 11
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R8f.w = tempf.x;
R1f.w = mul_nonIEEE(R6f.y,R11f.x) + intBitsToFloat(0xbdc0b780);
// 12
R9f.x = mul_nonIEEE(R6f.z,R11f.x) + intBitsToFloat(0xbe50e560);
R6f.y = mul_nonIEEE(R6f.w,R11f.x) + intBitsToFloat(0xbd009d49);
PV0fz = mul_nonIEEE(R125f.x, intBitsToFloat(uf_remappedVS[12].x));
R127f.w = mul_nonIEEE(R125f.x, intBitsToFloat(uf_remappedVS[13].x));
R10f.x = R1f.x;
R10f.x /= 2.0;
// 13
R6f.x = R11f.y;
R124f.y = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[12].y)) + PV0fz;
PV1fz = mul_nonIEEE(R125f.x, intBitsToFloat(uf_remappedVS[14].x));
R11f.w = R11f.x * 4.0 + -(1.0);
R11f.w = clamp(R11f.w, 0.0, 1.0);
R10f.y = R1f.y * intBitsToFloat(0xbeaaaa3b) + 1.0;
// 14
R123f.x = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[13].y)) + R127f.w;
R125f.y = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[14].y)) + PV1fz;
// 15
R1f.x = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedVS[12].z)) + R124f.y;
R1f.y = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedVS[13].z)) + R123f.x;
// 16
R1f.z = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedVS[14].z)) + R125f.y;
// export
SET_POSITION(vec4(R8f.x, R8f.y, R8f.z, R8f.w));
// export
passParameterSem3 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
// skipped export to semanticId 255
// 0
R11f.x = mul_nonIEEE(R1f.w,-(intBitsToFloat(uf_remappedVS[19].y))) + R1f.w;
PV0fy = -(R0f.w) + intBitsToFloat(uf_remappedVS[20].w);
PV0fy = clamp(PV0fy, 0.0, 1.0);
R11f.z = mul_nonIEEE(R6f.y,-(intBitsToFloat(uf_remappedVS[19].y))) + R6f.y;
R11f.y = mul_nonIEEE(R9f.x,-(intBitsToFloat(uf_remappedVS[19].y))) + R9f.x;
// 1
PV1fw = mul_nonIEEE(PV0fy, PV0fy);
// 2
R123f.x = mul_nonIEEE(PV1fw,-(intBitsToFloat(uf_remappedVS[19].y))) + PV1fw;
// 3
R6f.w = R123f.x;
// export
passParameterSem0 = vec4(R11f.x, R11f.y, R11f.z, R11f.w);
// export
passParameterSem2 = vec4(R6f.x, R6f.y, R6f.y, R6f.w);
// 0
R123f.y = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedVS[21].x)) + intBitsToFloat(uf_remappedVS[21].z);
R123f.w = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[21].y)) + intBitsToFloat(uf_remappedVS[21].w);
// 1
R10f.z = R123f.y;
R10f.w = R123f.w;
// export
passParameterSem1 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
}
