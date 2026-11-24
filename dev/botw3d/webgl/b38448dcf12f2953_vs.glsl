#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader b38448dcf12f2953
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[15];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem6;
out vec4 passParameterSem0;
out vec4 passParameterSem7;
out vec4 passParameterSem5;
out vec4 passParameterSem2;
out vec4 passParameterSem4;
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
PV0fx = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x3ed413cd);
R8f.y = max(R3f.y, 0.0);
R127f.z = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x43c9d6c7);
R7f.w = 1.0;
R0f.z = 0.0;
// 1
PV1fx = R8f.y;
PV1fx /= 2.0;
R0f.y = intBitsToFloat(uf_remappedVS[1].x);
R6f.z = intBitsToFloat(uf_remappedVS[1].x);
PV1fw = intBitsToFloat(uf_remappedVS[0].x) + PV0fx;
R8f.x = intBitsToFloat(uf_remappedVS[1].x) + -(0.5);
R8f.x = clamp(R8f.x, 0.0, 1.0);
// 2
R9f.x = 1.0;
R9f.y = 1.0;
R126f.z = fract(PV1fw);
R127f.w = intBitsToFloat(uf_remappedVS[1].w) + PV1fx;
R8f.w = 1.0;
// 3
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R5f.w = tempf.x;
PS1f = R126f.z * intBitsToFloat(0x3e65a5dd);
// 4
PV0fx = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[1].y));
R127f.y = PS1f + R127f.z;
R127f.z = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
R127f.w = R127f.w * 100.0;
R9f.w = 1.0;
// 5
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R6f.w = tempf.x;
R127f.x = -(PV0fx) + R127f.y;
// 6
PV0fx = R127f.y + -(R127f.z);
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[1].z));
PV0fz = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].z));
PV0fw = intBitsToFloat(uf_remappedVS[1].w) + R126f.z;
R6f.y = R127f.w * intBitsToFloat(0x40490e56);
// 7
PV1fx = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedVS[4].x));
PV1fy = mul_nonIEEE(R6f.w, intBitsToFloat(uf_remappedVS[4].y));
PV1fz = -(PV0fz) + PV0fx;
PV1fw = -(PV0fy) + R127f.x;
R2f.w = PV0fw * 3.0;
// 8
R0f.x = PV1fw * intBitsToFloat(0x3cb6a401);
R7f.y = intBitsToFloat(uf_remappedVS[4].w) + PV1fy;
R7f.z = intBitsToFloat(uf_remappedVS[4].z) + PV1fx;
R0f.w = R6f.y * 5.0;
R6f.x = PV1fz * intBitsToFloat(0x3cb6a401);
R3f.w = (texture(textureUnitVS1, vec2(R0f.x,R0f.y)).x);
R6f.z = (texture(textureUnitVS1, vec2(R6f.x,R6f.z)).x);
R7f.xy = (texture(textureUnitVS0, vec2(R7f.z,R7f.y)).xy);
// export
passParameterSem6 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem0 = vec4(R5f.x, R5f.y, R5f.x, R5f.y);
// 0
PV0fx = R6f.y * 7.0;
R123f.y = R0f.w * intBitsToFloat(0x3e22f983) + 0.5;
PV0fz = fract(R2f.w);
PV0fw = R6f.y * 3.0;
R127f.x = R2f.w * intBitsToFloat(0x431d1463);
// 1
R123f.x = PV0fx * intBitsToFloat(0x3e22f983) + 0.5;
PV1fy = PV0fz + -(0.5);
R123f.z = PV0fw * intBitsToFloat(0x3e22f983) + 0.5;
PV1fw = fract(R123f.y);
PS1f = R127f.x;
PS1f *= 4.0;
// 2
PV0fx = max(PV1fy, -(PV1fy));
PV0fy = fract(R123f.z);
PV0fz = fract(R123f.x);
R123f.w = PV1fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.z = PS1f * intBitsToFloat(0x3e22f983) + 0.5;
// 3
R123f.x = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.y = R127f.x * intBitsToFloat(0x3e22f983) + 0.5;
R123f.z = PV0fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fw = PV0fx + 0.5;
R127f.y = R123f.w * intBitsToFloat(0x3e22f983);
// 4
PV0fx = fract(R123f.y);
PV0fy = fract(R127f.z);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), PV1fw);
R127f.w = R123f.x * intBitsToFloat(0x3e22f983);
R126f.w = R123f.z * intBitsToFloat(0x3e22f983);
// 5
R123f.x = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fy = -(R127f.z) + 1.0;
R123f.z = PV0fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fw = R127f.z + intBitsToFloat(0xbe99999a);
PV1fw = clamp(PV1fw, 0.0, 1.0);
R127f.x = sin((R127f.y)/0.1591549367);
// 6
backupReg0f = R127f.w;
PV0fx = min(R127f.z, PV1fy);
PV0fx *= 2.0;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R127f.y = R123f.z * intBitsToFloat(0x3e22f983);
R127f.z = PV1fw * intBitsToFloat(0x3d6a0fd3);
R127f.w = R123f.x * intBitsToFloat(0x3e22f983);
PS0f = sin((backupReg0f)/0.1591549367);
// 7
backupReg0f = R127f.x;
backupReg1f = R126f.w;
R127f.x = R8f.y + -(intBitsToFloat(uf_remappedVS[5].z));
R127f.x = clamp(R127f.x, 0.0, 1.0);
PV1fy = mul_nonIEEE(backupReg0f, PS0f);
R126f.z = mul_nonIEEE(R8f.y, intBitsToFloat(uf_remappedVS[5].x));
R126f.w = PV0fx * intBitsToFloat(0x3ca3d70a);
PS1f = sin((backupReg1f)/0.1591549367);
// 8
backupReg0f = R127f.w;
PV0fx = mul_nonIEEE(PS1f, PV1fy);
PV0fy = R7f.y;
PV0fy *= 2.0;
PV0fz = R7f.x;
PV0fz *= 2.0;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), R126f.z);
PS0f = sin((backupReg0f)/0.1591549367);
// 9
backupReg0f = R127f.y;
PV1fx = PV0fz + -(1.0);
R127f.y = mul_nonIEEE(R127f.z, PS0f);
PV1fz = PV0fy + -(1.0);
PV1fw = PV0fx * intBitsToFloat(0x3d4ccccd);
PS1f = sin((backupReg0f)/0.1591549367);
// 10
R125f.x = mul_nonIEEE(PV1fx, R127f.w);
PV0fy = -(PV1fz);
PV0fz = mul_nonIEEE(R8f.x, PV1fw);
PV0fw = mul_nonIEEE(R126f.w, PS1f);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(uf_remappedVS[5].z));
// 11
R126f.x = mul_nonIEEE(PV0fy, R127f.w);
PV1fy = mul_nonIEEE(R127f.x, PV0fz);
PV1fz = R127f.y + PV0fw;
R0f.w = intBitsToFloat(uf_remappedVS[6].x);
R6f.y = intBitsToFloat(uf_remappedVS[6].y);
// 12
R127f.x = PV1fz + R6f.z;
PV0fy = R126f.z + PV1fy;
R6f.z = R126f.x;
R127f.w = PV1fz + R3f.w;
R1f.z = intBitsToFloat(uf_remappedVS[6].z);
// 13
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R127f.x);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R127f.w);
PV1fz = -(R127f.w) + R127f.x;
R126f.w = PV0fy * 20.0;
R10f.w = R4f.w;
// 14
R123f.y = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedVS[2].x)) + R127f.w;
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R127f.w);
PV0fw = -(R127f.y) + PV1fx;
// 15
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R127f.x);
R126f.z = mul_nonIEEE(R123f.y, R126f.w);
R123f.w = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedVS[2].x)) + R127f.y;
// 16
R127f.x = -(R125f.z) + PV1fy;
PV0fy = mul_nonIEEE(R126f.z, R126f.z);
R124f.z = mul_nonIEEE(R126f.w, R123f.w);
// 17
tempf.x = dot(vec4(R125f.x,R126f.x,R0f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R126f.x,R126f.x,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(R126f.z, PV0fy);
// 18
PV0fx = R124f.z;
PV0fy = -(PV1fx) + R127f.z;
R123f.z = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[2].x)) + R125f.z;
PV0fw = PS1f * intBitsToFloat(0x3e23d70a);
// 19
PV1fx = max(PV0fy, 0.0);
PV1fy = mul_nonIEEE(R126f.w, R123f.z);
PV1fz = max(PV0fw, 0.0);
PV1fw = R5f.w + PV0fx;
// 20
R8f.x = PV1fw + R125f.x;
R7f.y = -(PV1fz);
PV0fz = PV1fy;
PS0f = sqrt(PV1fx);
// 21
PV1fx = R6f.w + PV0fz;
PV1fz = intBitsToFloat(uf_remappedVS[5].z) + -(PS0f);
// 22
R8f.y = -(PV1fz);
R6f.z = PV1fx + R6f.z;
R6f.w = intBitsToFloat(uf_remappedVS[6].w);
// 0
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[7].z));
// 1
R123f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[7].y)) + PS0f;
PV1fy = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[0].z));
PV1fz = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[7].y));
PV1fw = PV0fx + R7f.y;
PS1f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[0].z));
// 2
R125f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[0].y)) + PS1f;
R127f.y = PV1fw + R8f.y;
R125f.z = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[7].x)) + R123f.x;
R126f.w = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[7].x)) + PV1fz;
R127f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[0].y)) + PV1fy;
// 3
tempf.x = dot(vec4(R8f.x,R127f.y,R6f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV1fx = tempf.x;
R126f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 4
R126f.x = dot(vec4(R8f.x,R127f.y,R6f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV0fy = R126f.x;
PV0fz = R126f.x;
PV0fw = R126f.x;
R3f.x = PV1fx;
// 5
tempf.x = dot(vec4(R8f.x,R127f.y,R6f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R127f.w = tempf.x;
R3f.y = R126f.x;
// 6
R8f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[0].x)) + R125f.x;
R125f.y = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[7].z)) + R126f.w;
R3f.z = PV1fx;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].w), R8f.w);
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R6f.y);
// 7
R7f.x = dot(vec4(R3f.x,R3f.y,R3f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV1fy = R7f.x;
PV1fz = R7f.x;
PV1fw = R7f.x;
// 8
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fx = tempf.x;
R7f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 9
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R7f.z = tempf.x;
PV1fw = tempf.x;
// 10
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R9f.y),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R7f.w = tempf.x;
// 11
backupReg0f = R127f.x;
R127f.x = dot(vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].w),intBitsToFloat(uf_remappedVS[0].z),R125f.x),vec4(R0f.w,R8f.w,R1f.z,1.0));
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
R9f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[0].x)) + backupReg0f;
// 12
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),R126f.w),vec4(R0f.w,R6f.y,R1f.z,1.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 13
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)),vec4(R0f.w,R6f.y,R1f.z,R8f.w));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[3].z));
// 14
tempf.x = dot(vec4(R2f.x,R2f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R124f.z = tempf.x;
PV0fw = tempf.x;
R125f.x = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[3].z));
// 15
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)),vec4(R127f.x,R127f.y,R127f.z,R9f.w));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R124f.x = mul_nonIEEE(PV0fx, PV0fx);
// 16
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)),vec4(R127f.x,R127f.y,R127f.z,R9f.w));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.x = R126f.y + -(PV1fx);
// 17
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)),vec4(R127f.x,R127f.y,R127f.z,R9f.w));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R2f.y = R126f.x + -(PV0fx);
// 18
tempf.x = dot(vec4(R4f.x,R4f.y,R125f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R2f.z = R127f.w + -(PV1fx);
// 19
tempf.x = dot(vec4(R8f.x,R125f.z,R124f.x,intBitsToFloat(0x80000000)),vec4(R8f.x,R125f.z,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(PV0fx, PV0fx);
// 20
R124f.x = dot(vec4(R9f.x,R125f.y,PS1f,intBitsToFloat(0x80000000)),vec4(R9f.x,R125f.y,1.0,0.0));
PV0fy = R124f.x;
PV0fz = R124f.x;
PV0fw = R124f.x;
tempResultf = 1.0 / sqrt(PV1fx);
R127f.w = tempResultf;
// 21
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R126f.w = tempf.x;
R8f.x = mul_nonIEEE(R8f.x, R127f.w);
// 22
R4f.y = mul_nonIEEE(R125f.z, R127f.w);
R4f.z = mul_nonIEEE(R124f.z, R127f.w);
tempResultf = 1.0 / sqrt(R124f.x);
PS0f = tempResultf;
// 23
R9f.x = mul_nonIEEE(R9f.x, PS0f);
R9f.y = mul_nonIEEE(R125f.y, PS0f);
R6f.z = mul_nonIEEE(R127f.z, PS0f);
PV1fw = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[8].z));
tempResultf = 1.0 / sqrt(R126f.w);
R1f.z = tempResultf;
// 24
backupReg0f = R2f.x;
R2f.x = dot(vec4(R8f.x,R4f.y,PV1fw,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),1.0,0.0));
PV0fy = R2f.x;
PV0fz = R2f.x;
PV0fw = R2f.x;
R6f.y = mul_nonIEEE(backupReg0f, R1f.z);
// export
SET_POSITION(vec4(R7f.x, R7f.y, R7f.z, R7f.w));
// export
passParameterSem7 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
// 0
tempf.x = dot(vec4(R8f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R127f.w = tempf.x;
R124f.x = mul_nonIEEE(R2f.y, R1f.z);
// 1
tempf.x = dot(vec4(R8f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
R126f.w = mul_nonIEEE(R2f.z, R1f.z);
// 2
R10f.x = dot(vec4(R9f.x,R9f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),0.0));
PV0fy = R10f.x;
PV0fz = R10f.x;
PV0fw = R10f.x;
R1f.x = mul_nonIEEE(R6f.w, R6f.y);
// 3
tempf.x = dot(vec4(R9f.x,R9f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),0.0));
PV1fx = tempf.x;
R10f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R1f.y = mul_nonIEEE(R6f.w, R124f.x);
// 4
tempf.x = dot(vec4(R9f.x,R9f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R10f.z = tempf.x;
PV0fw = tempf.x;
R1f.z = mul_nonIEEE(R6f.w, R126f.w);
// 5
R2f.x = R2f.x;
R2f.y = R127f.w;
R2f.z = R127f.z;
// export
passParameterSem5 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
// export
passParameterSem2 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem4 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
