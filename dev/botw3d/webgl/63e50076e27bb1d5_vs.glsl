#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 63e50076e27bb1d5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[14];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem12;

out vec4 passParameterSem2;
out vec4 passParameterSem5;
out vec4 passParameterSem0;
out vec4 passParameterSem7;
out vec4 passParameterSem4;
out vec4 passParameterSem6;
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
PV0fx = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x3ed413cd);
R8f.y = -(R1f.w) + 1.0;
R127f.z = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x43c9d6c7);
R5f.w = 1.0;
R9f.z = 0.0;
// 1
PV1fx = R8f.y;
PV1fx /= 2.0;
R0f.y = intBitsToFloat(uf_remappedVS[1].x);
R0f.z = intBitsToFloat(uf_remappedVS[1].x);
PV1fw = intBitsToFloat(uf_remappedVS[0].x) + PV0fx;
R8f.x = intBitsToFloat(uf_remappedVS[1].x) + -(0.5);
R8f.x = clamp(R8f.x, 0.0, 1.0);
// 2
R9f.x = 1.0;
R10f.y = 1.0;
R126f.z = fract(PV1fw);
R127f.w = intBitsToFloat(uf_remappedVS[1].w) + PV1fx;
R6f.x = intBitsToFloat(0x3d2aaaab);
// 3
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R10f.z = tempf.x;
PV1fw = tempf.x;
PS1f = R126f.z * intBitsToFloat(0x3e65a5dd);
// 4
PV0fx = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[1].y));
R127f.y = PS1f + R127f.z;
R127f.z = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
R127f.w = R127f.w * 100.0;
R6f.y = 0.0;
// 5
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R7f.w = tempf.x;
R127f.x = -(PV0fx) + R127f.y;
// 6
PV0fx = R127f.y + -(R127f.z);
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[1].z));
PV0fz = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].z));
PV0fw = intBitsToFloat(uf_remappedVS[1].w) + R126f.z;
R127f.y = R127f.w * intBitsToFloat(0x40490e56);
// 7
PV1fx = mul_nonIEEE(R10f.z, intBitsToFloat(uf_remappedVS[4].x));
PV1fy = mul_nonIEEE(R7f.w, intBitsToFloat(uf_remappedVS[4].y));
PV1fz = -(PV0fz) + PV0fx;
PV1fw = -(PV0fy) + R127f.x;
R127f.w = PV0fw * 3.0;
// 8
R0f.x = PV1fw * intBitsToFloat(0x3cb6a401);
R5f.y = intBitsToFloat(uf_remappedVS[4].w) + PV1fy;
R5f.z = intBitsToFloat(uf_remappedVS[4].z) + PV1fx;
R0f.w = PV1fz * intBitsToFloat(0x3cb6a401);
PS0f = R127f.y * 5.0;
// 9
PV1fx = R127f.y * 7.0;
R123f.y = PS0f * intBitsToFloat(0x3e22f983) + 0.5;
PV1fz = fract(R127f.w);
PV1fw = R127f.y * 3.0;
R127f.x = R127f.w * intBitsToFloat(0x431d1463);
// 10
R123f.x = PV1fx * intBitsToFloat(0x3e22f983) + 0.5;
PV0fy = PV1fz + -(0.5);
R123f.z = PV1fw * intBitsToFloat(0x3e22f983) + 0.5;
PV0fw = fract(R123f.y);
PS0f = R127f.x;
PS0f *= 4.0;
// 11
PV1fx = max(PV0fy, -(PV0fy));
PV1fy = fract(R123f.z);
PV1fz = fract(R123f.x);
R123f.w = PV0fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.z = PS0f * intBitsToFloat(0x3e22f983) + 0.5;
// 12
R123f.x = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.y = R127f.x * intBitsToFloat(0x3e22f983) + 0.5;
R123f.z = PV1fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fw = PV1fx + 0.5;
R127f.y = R123f.w * intBitsToFloat(0x3e22f983);
// 13
PV1fx = fract(R123f.y);
PV1fy = fract(R127f.z);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), PV0fw);
R127f.w = R123f.x * intBitsToFloat(0x3e22f983);
R126f.w = R123f.z * intBitsToFloat(0x3e22f983);
// 14
R123f.x = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fy = -(R127f.z) + 1.0;
R123f.z = PV1fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fw = R127f.z + intBitsToFloat(0xbe99999a);
PV0fw = clamp(PV0fw, 0.0, 1.0);
R127f.x = sin((R127f.y)/0.1591549367);
// 15
PV1fx = min(R127f.z, PV0fy);
PV1fx *= 2.0;
PV1fx = clamp(PV1fx, 0.0, 1.0);
R9f.y = R123f.z * intBitsToFloat(0x3e22f983);
R8f.z = PV0fw * intBitsToFloat(0x3d6a0fd3);
R2f.w = R123f.x * intBitsToFloat(0x3e22f983);
PS1f = sin((R127f.w)/0.1591549367);
// 16
R7f.x = 0.125;
R7f.y = mul_nonIEEE(R127f.x, PS1f);
R7f.z = 0.0;
R3f.w = PV1fx * intBitsToFloat(0x3ca3d70a);
R4f.z = sin((R126f.w)/0.1591549367);
R4f.w = (texture(textureUnitVS1, vec2(R0f.x,R0f.y)).x);
R0f.z = (texture(textureUnitVS1, vec2(R0f.w,R0f.z)).x);
R5f.xy = (texture(textureUnitVS0, vec2(R5f.z,R5f.y)).xy);
R6f.w = (texture(textureUnitVS2, vec2(R6f.x,R6f.y)).x);
R6f.xyz = (texture(textureUnitVS2, vec2(R7f.x,R7f.z)).xyz);
// export
passParameterSem2 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
// export
passParameterSem5 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem0 = vec4(R4f.x, R4f.y, R4f.x, R4f.y);
// 0
PV0fx = mul_nonIEEE(R4f.z, R7f.y);
R126f.y = R8f.y + -(intBitsToFloat(uf_remappedVS[5].z));
R126f.y = clamp(R126f.y, 0.0, 1.0);
R127f.z = mul_nonIEEE(R8f.y, intBitsToFloat(uf_remappedVS[5].x));
PV0fw = R5f.y;
PV0fw *= 2.0;
PS0f = sin((R2f.w)/0.1591549367);
// 1
PV1fx = R5f.x;
PV1fx *= 2.0;
R127f.y = mul_nonIEEE(R8f.z, PS0f);
PV1fz = PV0fw + -(1.0);
PV1fw = PV0fx * intBitsToFloat(0x3d4ccccd);
PS1f = sin((R9f.y)/0.1591549367);
// 2
PV0fx = PV1fx + -(1.0);
PV0fy = -(PV1fz);
PV0fz = mul_nonIEEE(R8f.x, PV1fw);
PV0fw = mul_nonIEEE(R3f.w, PS1f);
PS0f = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), R127f.z);
// 3
R5f.x = mul_nonIEEE(PV0fx, PS0f);
PV1fy = mul_nonIEEE(R126f.y, PV0fz);
PV1fz = R127f.y + PV0fw;
R126f.w = mul_nonIEEE(PV0fy, PS0f);
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(uf_remappedVS[5].z));
// 4
R8f.x = PV1fz + R0f.z;
PV0fy = R127f.z + PV1fy;
R8f.z = R126f.w;
R4f.w = PV1fz + R4f.w;
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[0].z));
// 5
R123f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[0].y)) + PS0f;
R0f.z = -(R4f.w) + R8f.x;
R3f.w = PV0fy * 20.0;
R127f.x = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[6].z));
// 6
tempf.x = dot(vec4(R5f.x,R126f.w,R9f.z,intBitsToFloat(0x80000000)),vec4(R5f.x,R126f.w,R126f.w,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[0].x)) + R123f.x;
// 7
R123f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[6].y)) + R127f.x;
PV1fy = -(PV0fx) + R126f.z;
PS1f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[3].z));
// 8
PV0fx = max(PV1fy, 0.0);
R127f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[6].x)) + R123f.x;
R127f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[3].y)) + PS1f;
// 9
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV1fx = tempf.x;
R3f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = sqrt(PV0fx);
// 10
R127f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[3].x)) + R127f.x;
PV0fz = intBitsToFloat(uf_remappedVS[5].z) + -(PS1f);
// 11
PV1fx = mul_nonIEEE(R127f.x, R127f.x);
R5f.y = -(PV0fz);
// 12
tempf.x = dot(vec4(R126f.x,R127f.y,PV1fx,intBitsToFloat(0x80000000)),vec4(R126f.x,R127f.y,1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 13
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 14
R2f.x = mul_nonIEEE(R126f.x, PS1f);
R2f.y = mul_nonIEEE(R127f.y, PS1f);
R2f.z = mul_nonIEEE(R127f.x, PS1f);
// 0
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R4f.w);
R123f.y = mul_nonIEEE(R0f.z,intBitsToFloat(uf_remappedVS[2].x)) + R4f.w;
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R8f.x);
// 1
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R4f.w);
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R8f.x);
R126f.z = mul_nonIEEE(R123f.y, R3f.w);
PV1fw = -(R127f.x) + PV0fz;
// 2
PV0fx = -(R126f.x) + PV1fy;
PV0fy = mul_nonIEEE(R126f.z, R126f.z);
R123f.w = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedVS[2].x)) + R127f.x;
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[7].z));
// 3
PV1fx = mul_nonIEEE(R126f.z, PV0fy);
PV1fy = mul_nonIEEE(R3f.w, R123f.w);
R123f.z = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedVS[2].x)) + R126f.x;
R122f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[7].y)) + PS0f;
// 4
PV0fx = mul_nonIEEE(R3f.w, R123f.z);
PV0fy = PV1fy;
R123f.z = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[7].x)) + R122f.x;
PV0fw = PV1fx * intBitsToFloat(0x3e23d70a);
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[8].z));
// 5
PV1fx = PV0fx;
PV1fy = R10f.z + PV0fy;
PV1fz = max(PV0fw, 0.0);
R4f.w = R123f.z;
R122f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[8].y)) + PS0f;
// 6
R126f.x = PV1fy + R5f.x;
PV0fy = -(PV1fz);
PV0fz = R7f.w + PV1fx;
R123f.w = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[8].x)) + R122f.x;
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[9].z));
// 7
R123f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[9].y)) + PS0f;
R4f.y = R123f.w;
R126f.z = PV0fz + R8f.z;
PV1fw = R3f.y + PV0fy;
// 8
R123f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[9].x)) + R123f.x;
R127f.y = PV1fw + R5f.y;
// 9
tempf.x = dot(vec4(R126f.x,R127f.y,R126f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R4f.z = R123f.x;
// 10
tempf.x = dot(vec4(R126f.x,R127f.y,R126f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.x = PV1fx;
// 11
tempf.x = dot(vec4(R126f.x,R127f.y,R126f.z,R9f.x),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R2f.y = PV0fx;
// 12
R2f.z = PV1fx;
// 13
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV1fx = tempf.x;
R9f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 14
R9f.x = dot(vec4(R2f.x,R2f.y,R2f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV0fy = R9f.x;
PV0fz = R9f.x;
PV0fw = R9f.x;
R126f.z = -(PV1fx);
// 15
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R9f.z = tempf.x;
PV1fw = tempf.x;
// 16
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R9f.w = tempf.x;
R10f.z = PV1fx;
// 17
R10f.x = R9f.x + PV0fx;
R10f.x /= 2.0;
R10f.y = R126f.z + PV0fx;
R10f.y /= 2.0;
R10f.w = PV0fx;
// export
SET_POSITION(vec4(R9f.x, R9f.y, R9f.z, R9f.w));
// export
passParameterSem7 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
// export
passParameterSem4 = vec4(R4f.w, R4f.y, R4f.z, R4f.w);
// export
passParameterSem6 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
