#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d809274285cdca46
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
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
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
PV0fx = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x3ed413cd);
PV0fy = R2f.x + R4f.x;
R127f.z = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x43c9d6c7);
R7f.w = 1.0;
R6f.z = max(R4f.y, 0.0);
// 1
R127f.x = PV0fy * intBitsToFloat(0x3ca3d70a);
R0f.y = intBitsToFloat(uf_remappedVS[1].x);
R0f.z = intBitsToFloat(uf_remappedVS[1].x);
PV1fw = intBitsToFloat(uf_remappedVS[0].x) + PV0fx;
PS1f = R6f.z;
PS1f /= 2.0;
// 2
PV0fx = intBitsToFloat(uf_remappedVS[1].w) + PS1f;
R6f.y = intBitsToFloat(uf_remappedVS[1].x) + -(0.5);
R6f.y = clamp(R6f.y, 0.0, 1.0);
PV0fz = fract(PV1fw);
R5f.w = 0.0;
R8f.w = 1.0;
// 3
backupReg0f = R127f.x;
R127f.x = PV0fx * 100.0;
R7f.y = 1.0;
R8f.z = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[2].z));
R127f.w = PV0fz + backupReg0f;
R7f.x = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[0].z));
// 4
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R7f.z = tempf.x;
PV0fw = tempf.x;
PS0f = R127f.w * intBitsToFloat(0x3e65a5dd);
// 5
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.z = PS0f + R127f.z;
// 6
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R6f.w = tempf.x;
R126f.x = R7f.z + PV1fx;
// 7
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R5f.z = R127f.x * intBitsToFloat(0x40490e56);
// 8
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), R126f.x);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R126f.x);
R126f.z = R6f.w + PV1fx;
R2f.w = R5f.z * 5.0;
R2f.x = R5f.z * 3.0;
// 9
PV1fx = R127f.z + -(PV0fx);
PV1fy = -(PV0fy) + R127f.z;
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R126f.z);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), R126f.z);
PS1f = intBitsToFloat(uf_remappedVS[1].w) + R127f.w;
// 10
PV0fx = -(PV1fz) + PV1fy;
PV0fy = mul_nonIEEE(R126f.x, intBitsToFloat(uf_remappedVS[5].x));
PV0fz = -(PV1fw) + PV1fx;
PV0fw = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedVS[5].y));
R6f.x = PS1f * 3.0;
// 11
R0f.x = PV0fx * intBitsToFloat(0x3cb6a401);
R2f.y = intBitsToFloat(uf_remappedVS[5].w) + PV0fw;
R2f.z = intBitsToFloat(uf_remappedVS[5].z) + PV0fy;
R0f.w = PV0fz * intBitsToFloat(0x3cb6a401);
R3f.w = fract(R6f.x);
R4f.w = (texture(textureUnitVS1, vec2(R0f.x,R0f.y)).x);
R0f.z = (texture(textureUnitVS1, vec2(R0f.w,R0f.z)).x);
R0f.xy = (texture(textureUnitVS0, vec2(R2f.z,R2f.y)).xy);
// export
passParameterSem4 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem0 = vec4(R5f.x, R5f.y, R5f.x, R5f.y);
// 0
PV0fx = R5f.z * 7.0;
R123f.y = R2f.w * intBitsToFloat(0x3e22f983) + 0.5;
PV0fz = R3f.w + -(0.5);
R123f.w = R2f.x * intBitsToFloat(0x3e22f983) + 0.5;
R127f.y = R6f.x * intBitsToFloat(0x431d1463);
// 1
PV1fx = fract(R123f.y);
PV1fy = max(PV0fz, -(PV0fz));
PV1fz = fract(R123f.w);
R123f.w = PV0fx * intBitsToFloat(0x3e22f983) + 0.5;
PS1f = R127f.y;
PS1f *= 4.0;
// 2
PV0fx = PV1fy + 0.5;
R123f.y = PV1fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fz = fract(R123f.w);
R123f.w = PV1fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = PS1f * intBitsToFloat(0x3e22f983) + 0.5;
// 3
backupReg0f = R123f.y;
R123f.x = PV0fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.y = R127f.y * intBitsToFloat(0x3e22f983) + 0.5;
PV1fz = R123f.w * intBitsToFloat(0x3e22f983);
R126f.w = backupReg0f * intBitsToFloat(0x3e22f983);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), PV0fx);
// 4
PV0fx = fract(R123f.y);
R126f.y = R123f.x * intBitsToFloat(0x3e22f983);
PV0fz = fract(R127f.w);
PV0fw = -(R125f.w) + 1.0;
R127f.y = sin((PV1fz)/0.1591549367);
// 5
PV1fx = min(R125f.w, PV0fw);
PV1fx *= 2.0;
PV1fx = clamp(PV1fx, 0.0, 1.0);
R123f.y = PV0fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R126f.z = R125f.w + intBitsToFloat(0xbe99999a);
R126f.z = clamp(R126f.z, 0.0, 1.0);
R123f.w = PV0fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PS1f = sin((R126f.w)/0.1591549367);
// 6
backupReg0f = R127f.y;
PV0fx = R123f.y * intBitsToFloat(0x3e22f983);
R127f.y = R123f.w * intBitsToFloat(0x3e22f983);
PV0fz = mul_nonIEEE(backupReg0f, PS1f);
R126f.w = PV1fx * intBitsToFloat(0x3ca3d70a);
PS0f = sin((R126f.y)/0.1591549367);
// 7
R126f.x = R6f.z + -(intBitsToFloat(uf_remappedVS[6].z));
R126f.x = clamp(R126f.x, 0.0, 1.0);
PV1fy = mul_nonIEEE(PS0f, PV0fz);
PV1fz = R126f.z * intBitsToFloat(0x3d6a0fd3);
R125f.w = mul_nonIEEE(R6f.z, intBitsToFloat(uf_remappedVS[6].x));
PS1f = sin((PV0fx)/0.1591549367);
// 8
PV0fx = PV1fy * intBitsToFloat(0x3d4ccccd);
PV0fy = R0f.y;
PV0fy *= 2.0;
R126f.z = mul_nonIEEE(PV1fz, PS1f);
PV0fw = R0f.x;
PV0fw *= 2.0;
PS0f = sin((R127f.y)/0.1591549367);
// 9
PV1fx = mul_nonIEEE(R126f.w, PS0f);
PV1fy = PV0fy + -(1.0);
PV1fz = PV0fw + -(1.0);
PV1fw = mul_nonIEEE(R6f.y, PV0fx);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), R125f.w);
// 10
PV0fx = -(PV1fy);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(uf_remappedVS[6].z));
PV0fz = mul_nonIEEE(R126f.x, PV1fw);
PV0fw = R126f.z + PV1fx;
R125f.x = mul_nonIEEE(PV1fz, R127f.y);
// 11
R126f.x = PV0fw + R0f.z;
PV1fy = R125f.w + PV0fz;
R127f.z = mul_nonIEEE(PV0fx, R127f.y);
R125f.w = PV0fw + R4f.w;
// 12
R127f.x = PV1fy * 20.0;
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), R126f.x);
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R125f.w);
PV0fw = -(R125f.w) + R126f.x;
R127f.w = R127f.z;
// 13
PV1fx = -(R126f.z) + PV0fy;
R123f.z = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedVS[4].x)) + R125f.w;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R125f.w);
// 14
R123f.x = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedVS[4].x)) + R126f.z;
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), R126f.x);
R125f.w = mul_nonIEEE(R123f.z, R127f.x);
// 15
R126f.x = mul_nonIEEE(R127f.x, R123f.x);
R127f.y = -(R126f.w) + PV0fz;
PV1fz = mul_nonIEEE(R125f.w, R125f.w);
// 16
tempf.x = dot(vec4(R125f.x,R127f.z,R5f.w,intBitsToFloat(0x80000000)),vec4(R125f.x,R127f.z,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R125f.w, PV1fz);
// 17
PV1fx = PS0f * intBitsToFloat(0x3e23d70a);
PV1fy = R126f.x;
PV1fz = -(PV0fx) + R126f.y;
R123f.w = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedVS[4].x)) + R126f.w;
// 18
PV0fx = mul_nonIEEE(R127f.x, R123f.w);
PV0fy = max(PV1fz, 0.0);
PV0fz = R7f.z + PV1fy;
PV0fw = max(PV1fx, 0.0);
// 19
R0f.x = PV0fz + R125f.x;
R7f.z = -(PV0fw);
PV1fw = PV0fx;
PS1f = sqrt(PV0fy);
// 20
PV0fx = R6f.w + PV1fw;
PV0fw = intBitsToFloat(uf_remappedVS[6].z) + -(PS1f);
// 21
R2f.x = PV0fx + R127f.w;
R0f.z = -(PV0fw);
// 0
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[2].y)) + R8f.z;
// 1
PV1fx = PV0fx + R7f.z;
R126f.y = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[2].x)) + R122f.x;
R122f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[0].y)) + R7f.x;
// 2
R127f.x = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[0].x)) + R122f.x;
R127f.y = PV1fx + R0f.z;
R125f.x = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[3].z));
// 3
tempf.x = dot(vec4(R0f.x,R127f.y,R2f.x,R8f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 4
tempf.x = dot(vec4(R0f.x,R127f.y,R2f.x,R8f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R4f.x = PV1fx;
// 5
tempf.x = dot(vec4(R0f.x,R127f.y,R2f.x,R8f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R4f.y = PV0fx;
// 6
R125f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[3].y)) + R125f.x;
R4f.z = PV1fx;
// 7
R0f.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.y),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV1fy = R0f.x;
PV1fz = R0f.x;
PV1fw = R0f.x;
// 8
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV0fx = tempf.x;
R0f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 9
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R0f.z = tempf.x;
PV1fw = tempf.x;
// 10
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R7f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R0f.w = tempf.x;
// 11
R127f.z = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[3].x)) + R125f.x;
// 12
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R126f.y,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 13
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 14
R127f.x = mul_nonIEEE(R127f.x, PS1f);
R126f.y = mul_nonIEEE(R126f.y, PS1f);
R127f.z = mul_nonIEEE(R127f.z, PS1f);
// 15
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 16
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R3f.x = PV1fx;
// 17
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.y = PV0fx;
// 18
R3f.z = PV1fx;
// export
SET_POSITION(vec4(R0f.x, R0f.y, R0f.z, R0f.w));
// export
passParameterSem3 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
// export
passParameterSem5 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
}
