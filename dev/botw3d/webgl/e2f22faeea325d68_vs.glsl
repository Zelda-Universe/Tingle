#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e2f22faeea325d68
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
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem12;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem13;

out vec4 passParameterSem4;
out vec4 passParameterSem0;
out vec4 passParameterSem3;
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
vec4 R7f = vec4(0.0);
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
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
R4f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
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
R3f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R5f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xyzw = attrDataSem13.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
PV0fx = R2f.x + R4f.x;
PV0fy = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x3ed413cd);
R127f.z = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x43c9d6c7);
R7f.w = 1.0;
R5f.w = max(R4f.y, 0.0);
// 1
PV1fx = intBitsToFloat(uf_remappedVS[0].x) + PV0fy;
R0f.y = intBitsToFloat(uf_remappedVS[1].x);
R0f.z = intBitsToFloat(uf_remappedVS[1].x);
R127f.w = PV0fx * intBitsToFloat(0x3ca3d70a);
PS1f = R5f.w;
PS1f /= 2.0;
// 2
PV0fx = intBitsToFloat(uf_remappedVS[1].w) + PS1f;
R7f.y = intBitsToFloat(uf_remappedVS[1].x) + -(0.5);
R7f.y = clamp(R7f.y, 0.0, 1.0);
R6f.z = 0.0;
PV0fw = fract(PV1fx);
R10f.w = 1.0;
// 3
R127f.x = PV0fx * 100.0;
R8f.y = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[2].z));
R126f.z = PV0fw + R127f.w;
R11f.w = 1.0;
R6f.x = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[0].z));
// 4
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R8f.w = tempf.x;
PS0f = R126f.z * intBitsToFloat(0x3e65a5dd);
// 5
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.y = PS0f + R127f.z;
// 6
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R9f.w = tempf.x;
R127f.w = R8f.w + PV1fx;
// 7
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R6f.y = R127f.x * intBitsToFloat(0x40490e56);
// 8
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R127f.w);
R126f.y = R9f.w + PV1fx;
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), R127f.w);
R2f.w = R6f.y * 5.0;
R3f.w = R6f.y * 3.0;
// 9
PV1fx = -(PV0fx) + R127f.y;
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R126f.y);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), R126f.y);
PV1fw = R127f.y + -(PV0fz);
PS1f = intBitsToFloat(uf_remappedVS[1].w) + R126f.z;
// 10
PV0fx = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedVS[5].x));
PV0fy = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedVS[5].y));
PV0fz = -(PV1fz) + PV1fw;
PV0fw = -(PV1fy) + PV1fx;
R4f.w = PS1f * 3.0;
// 11
R0f.x = PV0fw * intBitsToFloat(0x3cb6a401);
R2f.y = intBitsToFloat(uf_remappedVS[5].w) + PV0fy;
R2f.z = intBitsToFloat(uf_remappedVS[5].z) + PV0fx;
R0f.w = PV0fz * intBitsToFloat(0x3cb6a401);
R5f.z = fract(R4f.w);
R6f.w = (texture(textureUnitVS1, vec2(R0f.x,R0f.y)).x);
R0f.z = (texture(textureUnitVS1, vec2(R0f.w,R0f.z)).x);
R2f.xy = (texture(textureUnitVS0, vec2(R2f.z,R2f.y)).xy);
// export
passParameterSem4 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem0 = vec4(R5f.x, R5f.y, R5f.x, R5f.y);
// 0
R123f.x = R2f.w * intBitsToFloat(0x3e22f983) + 0.5;
PV0fy = R5f.z + -(0.5);
R123f.z = R3f.w * intBitsToFloat(0x3e22f983) + 0.5;
PV0fw = R6f.y * 7.0;
R127f.x = R4f.w * intBitsToFloat(0x431d1463);
// 1
PV1fx = max(PV0fy, -(PV0fy));
PV1fy = fract(R123f.z);
R123f.z = PV0fw * intBitsToFloat(0x3e22f983) + 0.5;
PV1fw = fract(R123f.x);
PS1f = R127f.x;
PS1f *= 4.0;
// 2
R123f.x = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fy = fract(R123f.z);
R123f.z = PV1fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fw = PV1fx + 0.5;
R126f.z = PS1f * intBitsToFloat(0x3e22f983) + 0.5;
// 3
backupReg0f = R123f.x;
R123f.x = R127f.x * intBitsToFloat(0x3e22f983) + 0.5;
R123f.y = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fz = R123f.z * intBitsToFloat(0x3e22f983);
R127f.w = backupReg0f * intBitsToFloat(0x3e22f983);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), PV0fw);
// 4
R126f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV0fy = fract(R126f.z);
PV0fz = -(R127f.z) + 1.0;
PV0fw = fract(R123f.x);
R127f.x = sin((PV1fz)/0.1591549367);
// 5
backupReg0f = R127f.w;
R123f.x = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fy = min(R127f.z, PV0fz);
PV1fy *= 2.0;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R123f.z = PV0fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = R127f.z + intBitsToFloat(0xbe99999a);
R127f.w = clamp(R127f.w, 0.0, 1.0);
PS1f = sin((backupReg0f)/0.1591549367);
// 6
backupReg0f = R127f.x;
R127f.x = R123f.z * intBitsToFloat(0x3e22f983);
PV0fy = mul_nonIEEE(backupReg0f, PS1f);
R127f.z = PV1fy * intBitsToFloat(0x3ca3d70a);
PV0fw = R123f.x * intBitsToFloat(0x3e22f983);
PS0f = sin((R126f.x)/0.1591549367);
// 7
PV1fx = mul_nonIEEE(PS0f, PV0fy);
PV1fy = R127f.w * intBitsToFloat(0x3d6a0fd3);
R126f.z = R5f.w + -(intBitsToFloat(uf_remappedVS[6].z));
R126f.z = clamp(R126f.z, 0.0, 1.0);
R127f.w = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedVS[6].x));
PS1f = sin((PV0fw)/0.1591549367);
// 8
PV0fx = R2f.y;
PV0fx *= 2.0;
R126f.y = mul_nonIEEE(PV1fy, PS1f);
PV0fz = R2f.x;
PV0fz *= 2.0;
PV0fw = PV1fx * intBitsToFloat(0x3d4ccccd);
PS0f = sin((R127f.x)/0.1591549367);
// 9
PV1fx = PV0fx + -(1.0);
PV1fy = PV0fz + -(1.0);
PV1fz = mul_nonIEEE(R7f.y, PV0fw);
PV1fw = mul_nonIEEE(R127f.z, PS0f);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), R127f.w);
// 10
PV0fx = -(PV1fx);
PV0fy = mul_nonIEEE(R126f.z, PV1fz);
PV0fz = R126f.y + PV1fw;
R5f.w = mul_nonIEEE(PV1fy, R127f.y);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(uf_remappedVS[6].z));
// 11
R127f.x = PV0fz + R0f.z;
PV1fy = R127f.w + PV0fy;
R125f.z = mul_nonIEEE(PV0fx, R127f.y);
R127f.w = PV0fz + R6f.w;
// 12
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), R127f.x);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R127f.w);
PV0fz = -(R127f.w) + R127f.x;
R125f.w = PV1fy * 20.0;
R2f.w = R125f.z;
// 13
R123f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedVS[4].x)) + R127f.w;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R127f.w);
PV1fw = -(R127f.y) + PV0fx;
// 14
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), R127f.x);
R126f.z = mul_nonIEEE(R123f.y, R125f.w);
R123f.w = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedVS[4].x)) + R127f.y;
// 15
PV1fx = -(R127f.z) + PV0fy;
PV1fy = mul_nonIEEE(R126f.z, R126f.z);
PV1fz = mul_nonIEEE(R125f.w, R123f.w);
// 16
PV0fx = mul_nonIEEE(R126f.z, PV1fy);
R127f.z = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedVS[4].x)) + R127f.z;
R6f.w = PV1fz;
// 17
tempf.x = dot(vec4(R5f.w,R125f.z,R6f.z,intBitsToFloat(0x80000000)),vec4(R5f.w,R125f.z,R125f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = PV0fx * intBitsToFloat(0x3e23d70a);
// 18
PV0fx = mul_nonIEEE(R125f.w, R127f.z);
PV0fy = max(PS1f, 0.0);
PV0fz = -(PV1fx) + R126f.w;
// 19
R2f.x = -(PV0fy);
PV1fy = max(PV0fz, 0.0);
R6f.z = PV0fx;
// 20
PS0f = sqrt(PV1fy);
// 21
PV1fw = intBitsToFloat(uf_remappedVS[6].z) + -(PS0f);
// 22
R0f.z = -(PV1fw);
// 0
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[2].y)) + R8f.y;
// 1
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
PS1f = sqrt(PV0fx);
// 2
PV0fx = mul_nonIEEE(PS1f, R6f.w);
PV0fy = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[3].z));
PV0fz = mul_nonIEEE(PS1f, R6f.z);
PV0fw = mul_nonIEEE(PS1f, R2f.x);
R122f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[0].y)) + R6f.x;
// 3
PV1fx = R127f.z + PV0fw;
PV1fy = R8f.w + PV0fx;
R125f.z = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[0].x)) + R122f.x;
PV1fw = R9f.w + PV0fz;
R122f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[3].y)) + PV0fy;
// 4
backupReg0f = R127f.x;
R127f.x = PV1fy + R5f.w;
R127f.y = PV1fx + R0f.z;
R127f.z = PV1fw + R2f.w;
R126f.w = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[2].x)) + backupReg0f;
R126f.z = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[3].x)) + R122f.x;
// 5
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R10f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.x = mul_nonIEEE(R126f.z, R126f.z);
// 6
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R10f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R3f.x = PV1fx;
// 7
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R10f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.y = PV0fx;
// 8
R123f.x = mul_nonIEEE(R126f.w,R126f.w) + R126f.x;
R3f.z = PV1fx;
// 9
R10f.x = dot(vec4(R3f.x,R3f.y,R3f.z,R11f.w),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV1fy = R10f.x;
PV1fz = R10f.x;
PV1fw = R10f.x;
R122f.x = mul_nonIEEE(R125f.z,R125f.z) + R123f.x;
// 10
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R11f.w),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV0fx = tempf.x;
R10f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
tempResultf = 1.0 / sqrt(R122f.x);
R126f.x = tempResultf;
// 11
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R11f.w),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R10f.z = tempf.x;
PV1fw = tempf.x;
R127f.x = mul_nonIEEE(R125f.z, R126f.x);
// 12
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R11f.w),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R10f.w = tempf.x;
R127f.y = mul_nonIEEE(R126f.w, R126f.x);
// 13
R126f.z = mul_nonIEEE(R126f.z, R126f.x);
// 14
tempf.x = dot(vec4(R127f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 15
tempf.x = dot(vec4(R127f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R0f.x = PV0fx;
// 16
tempf.x = dot(vec4(R127f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R0f.y = PV1fx;
// 17
R0f.z = PV0fx;
// export
SET_POSITION(vec4(R10f.x, R10f.y, R10f.z, R10f.w));
// export
passParameterSem3 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
// export
passParameterSem5 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
