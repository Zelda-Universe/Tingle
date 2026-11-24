#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0167daf470035a95
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[14];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem0;
out vec4 passParameterSem6;
out vec4 passParameterSem9;
out vec4 passParameterSem2;
out vec4 passParameterSem5;
out vec4 passParameterSem8;
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
vec4 R122f = vec4(0.0);
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
attrDecoder.xyzw = attrDataSem0.xyzw;
attrDecoder = uvec4(((attrDecoder>>8)&0xFFu)|((attrDecoder<<8)&0xFF00u));
attrDecoder.xyzw = uvec4(floatBitsToInt(vec4(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16)),unpackHalf2x16(attrDecoder.z|(attrDecoder.w<<16)))));
R3f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
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
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R4f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R5f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
R10f.x = 1.0;
R127f.y = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
R8f.z = -(R1f.w) + 1.0;
PV0fw = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x3ed413cd);
R7f.w = 1.0;
// 1
PV1fx = R8f.z;
PV1fx /= 2.0;
PV1fy = intBitsToFloat(uf_remappedVS[1].x) + PV0fw;
R0f.z = intBitsToFloat(uf_remappedVS[0].x);
R6f.w = intBitsToFloat(uf_remappedVS[0].x);
R5f.z = intBitsToFloat(uf_remappedVS[0].x) + -(0.5);
R5f.z = clamp(R5f.z, 0.0, 1.0);
// 2
R126f.x = fract(PV1fy);
R9f.y = 1.0;
R6f.z = intBitsToFloat(0x3d2aaaab);
R127f.w = intBitsToFloat(uf_remappedVS[0].w) + PV1fx;
R6f.y = 0.0;
// 3
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R10f.x),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV1fx = tempf.x;
R8f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = R126f.x * intBitsToFloat(0x3e65a5dd);
// 4
R127f.x = PS1f + R127f.y;
R127f.y = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
PV0fz = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[0].y));
R127f.w = R127f.w * 100.0;
R7f.x = 0.125;
// 5
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R10f.x),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R5f.w = tempf.x;
R127f.z = -(PV0fz) + R127f.x;
// 6
PV0fx = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[0].z));
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].z));
PV0fz = R127f.x + -(R127f.y);
PV0fw = intBitsToFloat(uf_remappedVS[0].w) + R126f.x;
R127f.x = R127f.w * intBitsToFloat(0x40490e56);
// 7
PV1fx = -(PV0fy) + PV0fz;
R127f.y = PV0fw * 3.0;
PV1fz = R127f.x * 5.0;
PV1fw = -(PV0fx) + R127f.z;
R127f.w = R127f.x * 3.0;
// 8
R0f.x = PV1fw * intBitsToFloat(0x3cb6a401);
PV0fy = fract(R127f.y);
R123f.z = PV1fz * intBitsToFloat(0x3e22f983) + 0.5;
PV0fw = R127f.x * 7.0;
R6f.x = PV1fx * intBitsToFloat(0x3cb6a401);
// 9
PV1fx = PV0fy + -(0.5);
R123f.y = R127f.w * intBitsToFloat(0x3e22f983) + 0.5;
R127f.z = R127f.y * intBitsToFloat(0x431d1463);
R123f.w = PV0fw * intBitsToFloat(0x3e22f983) + 0.5;
PS1f = fract(R123f.z);
// 10
PV0fx = fract(R123f.y);
PV0fy = fract(R123f.w);
PV0fz = max(PV1fx, -(PV1fx));
PV0fw = R127f.z;
PV0fw *= 4.0;
R127f.y = PS1f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 11
R123f.x = R127f.z * intBitsToFloat(0x3e22f983) + 0.5;
R123f.y = PV0fw * intBitsToFloat(0x3e22f983) + 0.5;
R123f.z = PV0fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fw = PV0fz + 0.5;
R127f.z = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 12
PV0fx = R127f.y * intBitsToFloat(0x3e22f983);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PV1fw);
PV0fz = fract(R123f.y);
R127f.w = R123f.z * intBitsToFloat(0x3e22f983);
PS0f = fract(R123f.x);
// 13
PV1fx = -(R127f.y) + 1.0;
R123f.y = PS0f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.z = PV0fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R126f.w = R127f.z * intBitsToFloat(0x3e22f983);
R127f.z = sin((PV0fx)/0.1591549367);
// 14
R9f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV0fy = R127f.y + intBitsToFloat(0xbe99999a);
PV0fy = clamp(PV0fy, 0.0, 1.0);
PV0fz = min(R127f.y, PV1fx);
PV0fz *= 2.0;
PV0fz = clamp(PV0fz, 0.0, 1.0);
R0f.w = R123f.z * intBitsToFloat(0x3e22f983);
PS0f = sin((R127f.w)/0.1591549367);
// 15
R8f.x = mul_nonIEEE(R127f.z, PS0f);
R7f.y = PV0fy * intBitsToFloat(0x3d6a0fd3);
R7f.z = 0.0;
R2f.w = PV0fz * intBitsToFloat(0x3ca3d70a);
R0f.y = sin((R126f.w)/0.1591549367);
R3f.w = (texture(textureUnitVS0, vec2(R0f.x,R0f.z)).x);
R0f.z = (texture(textureUnitVS0, vec2(R6f.x,R6f.w)).x);
R6f.w = (texture(textureUnitVS1, vec2(R6f.z,R6f.y)).x);
R6f.xyz = (texture(textureUnitVS1, vec2(R7f.x,R7f.z)).xyz);
// export
passParameterSem3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
// export
passParameterSem7 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem0 = vec4(R5f.x, R5f.y, R5f.x, R5f.y);
// 0
R126f.x = mul_nonIEEE(R8f.z, intBitsToFloat(uf_remappedVS[4].x));
R127f.y = intBitsToFloat(uf_remappedVS[5].x);
PV0fz = mul_nonIEEE(R0f.y, R8f.x);
R127f.w = intBitsToFloat(uf_remappedVS[5].y);
PS0f = sin((R0f.w)/0.1591549367);
// 1
R127f.x = mul_nonIEEE(R7f.y, PS0f);
R126f.y = 1.0;
R127f.z = intBitsToFloat(uf_remappedVS[5].z);
PV1fw = PV0fz * intBitsToFloat(0x3d4ccccd);
PS1f = sin((R9f.x)/0.1591549367);
// 2
R8f.x = 1.0;
PV0fy = mul_nonIEEE(R5f.z, PV1fw);
PV0fz = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[1].z));
PV0fw = mul_nonIEEE(R2f.w, PS1f);
R1f.w = R4f.w;
// 3
PV1fx = mul_nonIEEE(R8f.z, PV0fy);
PV1fy = R127f.x + PV0fw;
PV1fz = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[6].z));
R126f.w = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[1].y));
R122f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[1].y)) + PV0fz;
// 4
PV0fx = R126f.x + PV1fx;
R7f.y = PV1fy + R0f.z;
R0f.z = PV1fy + R3f.w;
R125f.w = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[1].x)) + R122f.x;
R122f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[6].y)) + PV1fz;
// 5
R9f.x = -(R0f.z) + R7f.y;
R0f.y = PV0fx * 20.0;
R126f.z = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[6].x)) + R122f.x;
PV1fw = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[6].y));
R126f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[1].z)) + R126f.w;
// 6
R3f.x = dot(vec4(R3f.x,R3f.y,R3f.z,R10f.x),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fy = R3f.x;
PV0fz = R3f.x;
PV0fw = R3f.x;
R127f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[6].z)) + PV1fw;
// 7
R10f.x = dot(vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)),vec4(R127f.y,R127f.w,R127f.z,R126f.y));
PV1fy = R10f.x;
PV1fz = R10f.x;
PV1fw = R10f.x;
R126f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[1].x)) + R126f.x;
// 8
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)),vec4(R127f.y,R127f.w,R127f.z,R126f.y));
PV0fx = tempf.x;
R3f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.y = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[6].x)) + R127f.x;
// 9
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)),vec4(R127f.y,R127f.w,R127f.z,R126f.y));
PV1fx = tempf.x;
PV1fy = tempf.x;
R3f.z = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[3].z));
// 10
tempf.x = dot(vec4(R2f.x,R2f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[3].z));
// 11
tempf.x = dot(vec4(R4f.x,R4f.y,PS0f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R125f.z = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(PV0fx, PV0fx);
// 12
tempf.x = dot(vec4(R125f.w,R126f.z,PS1f,intBitsToFloat(0x80000000)),vec4(R125f.w,R126f.z,1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(PV1fx, PV1fx);
// 13
tempf.x = dot(vec4(R126f.x,R125f.y,PS0f,intBitsToFloat(0x80000000)),vec4(R126f.x,R125f.y,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 14
R4f.x = mul_nonIEEE(R125f.w, PS1f);
R4f.y = mul_nonIEEE(R126f.z, PS1f);
R4f.z = mul_nonIEEE(R127f.z, PS1f);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 15
R2f.x = mul_nonIEEE(R126f.x, PS0f);
R2f.y = mul_nonIEEE(R125f.y, PS0f);
R2f.z = mul_nonIEEE(R125f.z, PS0f);
R4f.w = intBitsToFloat(uf_remappedVS[5].w);
// 0
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R0f.z);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R7f.y);
R123f.w = mul_nonIEEE(R9f.x,intBitsToFloat(uf_remappedVS[2].x)) + R0f.z;
// 1
R127f.x = mul_nonIEEE(R123f.w, R0f.y);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R0f.z);
PV1fz = -(R126f.x) + PV0fz;
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R7f.y);
// 2
PV0fx = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[7].z));
R123f.y = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedVS[2].x)) + R126f.x;
PV0fz = -(R125f.y) + PV1fw;
PV0fw = mul_nonIEEE(R127f.x, R127f.x);
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[7].z));
// 3
backupReg0f = R123f.y;
R123f.x = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedVS[2].x)) + R125f.y;
R123f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[7].x)) + PS0f;
PV1fz = mul_nonIEEE(R127f.x, PV0fw);
PV1fw = mul_nonIEEE(R0f.y, backupReg0f);
R122f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[7].y)) + PV0fx;
// 4
PV0fx = PV1fw;
PV0fy = PV1fz * intBitsToFloat(0x3e23d70a);
PV0fz = mul_nonIEEE(R0f.y, R123f.x);
R123f.w = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[7].x)) + R122f.x;
R1f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[7].y)) + R123f.y;
// 5
PV1fx = max(PV0fy, 0.0);
PV1fy = PV0fz;
R125f.z = R8f.y + PV0fx;
R8f.w = R123f.w;
PS1f = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[8].z));
// 6
R123f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[8].y)) + PS1f;
PV0fy = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedVS[8].y));
R127f.z = R5f.w + PV1fy;
PV0fw = -(PV1fx);
PS0f = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[9].z));
// 7
R127f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[9].y)) + PS0f;
R125f.y = R3f.x + PV0fw;
R123f.z = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[8].x)) + R123f.x;
R125f.w = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedVS[9].y));
R124f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[8].x)) + PV0fy;
// 8
R126f.x = dot(vec4(R125f.z,R125f.y,R127f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV0fy = R126f.x;
PV0fz = R126f.x;
PV0fw = R126f.x;
R8f.y = R123f.z;
// 9
tempf.x = dot(vec4(R125f.z,R125f.y,R127f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R127f.w = tempf.x;
R0f.x = R126f.x;
// 10
tempf.x = dot(vec4(R125f.z,R125f.y,R127f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R0f.y = PV1fx;
// 11
R125f.x = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedVS[9].z)) + R125f.w;
R123f.y = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[9].x)) + R127f.x;
R0f.z = PV0fx;
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), R8f.x);
// 12
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fx = tempf.x;
R7f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R8f.z = R123f.y;
// 13
R7f.x = dot(vec4(R0f.x,R0f.y,R0f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV1fy = R7f.x;
PV1fz = R7f.x;
PV1fw = R7f.x;
R125f.z = -(PV0fx);
// 14
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R7f.z = tempf.x;
PV0fw = tempf.x;
// 15
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R7f.w = tempf.x;
R9f.z = PV0fx;
// 16
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)),vec4(R10f.x,R3f.y,R3f.z,R8f.x));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R9f.x = R7f.x + PV1fx;
R9f.x /= 2.0;
// 17
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)),vec4(R10f.x,R3f.y,R3f.z,R8f.x));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.x = R126f.x + -(PV0fx);
// 18
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),R127f.x),vec4(R10f.x,R3f.y,R3f.z,1.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.y = R127f.w + -(PV1fx);
// 19
R1f.y = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedVS[8].z)) + R124f.x;
R127f.z = R127f.z + -(PV0fx);
R9f.w = R7f.w;
R1f.z = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[9].x)) + R125f.x;
// 20
tempf.x = dot(vec4(R126f.x,R125f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R125f.y,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R9f.y = R125f.z + R7f.w;
R9f.y /= 2.0;
// 21
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 22
PV0fx = mul_nonIEEE(R126f.x, PS1f);
PV0fy = mul_nonIEEE(R127f.z, PS1f);
PV0fw = mul_nonIEEE(R125f.y, PS1f);
// 23
R2f.x = mul_nonIEEE(R4f.w, PV0fx);
R2f.y = mul_nonIEEE(R4f.w, PV0fw);
R2f.z = mul_nonIEEE(R4f.w, PV0fy);
// export
SET_POSITION(vec4(R7f.x, R7f.y, R7f.z, R7f.w));
// export
passParameterSem6 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem9 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
// export
passParameterSem2 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
// export
passParameterSem5 = vec4(R8f.w, R8f.y, R8f.z, R8f.w);
// export
passParameterSem8 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
