#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 346de99ed98dbc2a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[13];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem5;
out vec4 passParameterSem0;
out vec4 passParameterSem4;
out vec4 passParameterSem3;
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
if( (attrDecoder.x&0x8000u) != 0u ) attrDecoder.x |= 0xFFFF0000u;
if( (attrDecoder.y&0x8000u) != 0u ) attrDecoder.y |= 0xFFFF0000u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/32767.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/32767.0,-1.0)));
attrDecoder.zw = uvec2(uvec2(0));
R5f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
PV0fx = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x3ed413cd);
R9f.y = -(R1f.w) + 1.0;
R127f.z = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x43c9d6c7);
R5f.w = 1.0;
R7f.w = 1.0;
// 1
PV1fx = R9f.y;
PV1fx /= 2.0;
R0f.y = intBitsToFloat(uf_remappedVS[1].x);
PV1fz = intBitsToFloat(uf_remappedVS[0].x) + PV0fx;
R6f.w = intBitsToFloat(uf_remappedVS[1].x);
R8f.y = intBitsToFloat(uf_remappedVS[1].x) + -(0.5);
R8f.y = clamp(R8f.y, 0.0, 1.0);
// 2
R127f.x = intBitsToFloat(uf_remappedVS[1].w) + PV1fx;
R10f.y = 1.0;
R7f.z = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[0].z));
R126f.w = fract(PV1fz);
R11f.w = R4f.w;
// 3
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R6f.z = tempf.x;
PV1fw = tempf.x;
PS1f = R126f.w * intBitsToFloat(0x3e65a5dd);
// 4
backupReg0f = R127f.x;
backupReg1f = R127f.z;
R127f.x = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[1].y));
R127f.z = backupReg0f * 100.0;
R127f.w = PS1f + backupReg1f;
// 5
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R3f.w = tempf.x;
R127f.y = -(PV0fy) + R127f.w;
// 6
PV0fx = intBitsToFloat(uf_remappedVS[1].w) + R126f.w;
PV0fy = R127f.w + -(R127f.x);
PV0fz = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].z));
PV0fw = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[1].z));
R127f.w = R127f.z * intBitsToFloat(0x40490e56);
// 7
PV1fx = -(PV0fw) + R127f.y;
R6f.y = PV0fx * 3.0;
PV1fz = -(PV0fz) + PV0fy;
PV1fw = R127f.w * 5.0;
R7f.x = R127f.w * 3.0;
// 8
R0f.x = PV1fx * intBitsToFloat(0x3cb6a401);
R7f.y = R127f.w * 7.0;
R0f.z = fract(R6f.y);
R0f.w = PV1fw * intBitsToFloat(0x3e22f983) + 0.5;
R6f.x = PV1fz * intBitsToFloat(0x3cb6a401);
R2f.w = (texture(textureUnitVS0, vec2(R0f.x,R0f.y)).x);
R5f.z = (texture(textureUnitVS0, vec2(R6f.x,R6f.w)).x);
// export
passParameterSem5 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem0 = vec4(R5f.x, R5f.y, R5f.x, R5f.y);
// 0
R123f.x = R7f.y * intBitsToFloat(0x3e22f983) + 0.5;
R127f.y = R6f.y * intBitsToFloat(0x431d1463);
R123f.z = R7f.x * intBitsToFloat(0x3e22f983) + 0.5;
PV0fw = R0f.z + -(0.5);
PS0f = fract(R0f.w);
// 1
PV1fx = R127f.y;
PV1fx *= 4.0;
PV1fy = max(PV0fw, -(PV0fw));
PV1fz = fract(R123f.x);
PV1fw = fract(R123f.z);
R127f.z = PS0f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 2
PV0fx = PV1fy + 0.5;
R123f.y = PV1fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.z = PV1fx * intBitsToFloat(0x3e22f983) + 0.5;
R123f.w = R127f.y * intBitsToFloat(0x3e22f983) + 0.5;
R127f.y = PV1fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 3
backupReg0f = R127f.z;
R127f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV1fy = fract(R123f.z);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), PV0fx);
PV1fw = backupReg0f * intBitsToFloat(0x3e22f983);
PS1f = fract(R123f.w);
// 4
R126f.x = R127f.y * intBitsToFloat(0x3e22f983);
R123f.y = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.z = PS1f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fw = -(R127f.z) + 1.0;
R127f.y = sin((PV1fw)/0.1591549367);
// 5
backupReg0f = R127f.x;
R127f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV1fy = min(R127f.z, PV0fw);
PV1fy *= 2.0;
PV1fy = clamp(PV1fy, 0.0, 1.0);
PV1fz = R127f.z + intBitsToFloat(0xbe99999a);
PV1fz = clamp(PV1fz, 0.0, 1.0);
R127f.w = R123f.z * intBitsToFloat(0x3e22f983);
PS1f = sin((backupReg0f)/0.1591549367);
// 6
backupReg0f = R127f.y;
backupReg1f = R126f.x;
R126f.x = PV1fy * intBitsToFloat(0x3ca3d70a);
R127f.y = PV1fz * intBitsToFloat(0x3d6a0fd3);
R127f.z = mul_nonIEEE(R9f.y, intBitsToFloat(uf_remappedVS[4].x));
PV0fw = mul_nonIEEE(backupReg0f, PS1f);
PS0f = sin((backupReg1f)/0.1591549367);
// 7
PV1fy = mul_nonIEEE(PS0f, PV0fw);
PS1f = sin((R127f.x)/0.1591549367);
// 8
backupReg0f = R127f.w;
PV0fx = PV1fy * intBitsToFloat(0x3d4ccccd);
R127f.w = mul_nonIEEE(R127f.y, PS1f);
PS0f = sin((backupReg0f)/0.1591549367);
// 9
PV1fx = mul_nonIEEE(R126f.x, PS0f);
PV1fz = mul_nonIEEE(R8f.y, PV0fx);
// 10
PV0fz = R127f.w + PV1fx;
PV0fw = mul_nonIEEE(R9f.y, PV1fz);
// 11
R126f.x = PV0fz + R2f.w;
PV1fy = R127f.z + PV0fw;
R127f.w = PV0fz + R5f.z;
// 12
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R127f.w);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R126f.x);
PV0fz = -(R126f.x) + R127f.w;
R126f.w = PV1fy * 20.0;
// 13
R123f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedVS[2].x)) + R126f.x;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R126f.x);
PV1fw = -(R127f.y) + PV0fx;
// 14
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R127f.w);
R127f.z = mul_nonIEEE(R123f.y, R126f.w);
R123f.w = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedVS[2].x)) + R127f.y;
// 15
PV1fx = -(R126f.z) + PV0fy;
PV1fy = mul_nonIEEE(R127f.z, R127f.z);
PV1fz = mul_nonIEEE(R126f.w, R123f.w);
// 16
PV0fx = mul_nonIEEE(R127f.z, PV1fy);
R123f.z = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedVS[2].x)) + R126f.z;
PV0fw = PV1fz;
// 17
PV1fx = mul_nonIEEE(R126f.w, R123f.z);
R9f.y = R6f.z + PV0fw;
PV1fw = PV0fx * intBitsToFloat(0x3e23d70a);
// 18
PV0fx = PV1fx;
PV0fz = max(PV1fw, 0.0);
// 19
R6f.z = R3f.w + PV0fx;
R3f.w = -(PV0fz);
// 0
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[5].z));
// 1
R126f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[0].y)) + R7f.z;
R127f.y = PV0fx + R3f.w;
R127f.z = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[0].y));
R126f.w = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[5].y));
R127f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[5].y)) + PS0f;
// 2
tempf.x = dot(vec4(R9f.y,R127f.y,R6f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 3
tempf.x = dot(vec4(R9f.y,R127f.y,R6f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R7f.x = PV0fx;
// 4
tempf.x = dot(vec4(R9f.y,R127f.y,R6f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R7f.y = PV1fx;
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[0].x)) + R126f.x;
R127f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[5].x)) + backupReg0f;
R7f.z = PV0fx;
// 6
R6f.x = dot(vec4(R7f.x,R7f.y,R7f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV0fy = R6f.x;
PV0fz = R6f.x;
PV0fw = R6f.x;
// 7
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV1fx = tempf.x;
R6f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 8
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R6f.z = tempf.x;
PV0fw = tempf.x;
// 9
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,R10f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R6f.w = tempf.x;
// 10
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R126f.z = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[3].z));
// 11
backupReg0f = R127f.z;
tempf.x = dot(vec4(R4f.x,R4f.y,PS0f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
R122f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[0].z)) + backupReg0f;
// 12
R126f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[0].x)) + R122f.x;
PV0fy = mul_nonIEEE(R126f.z, R126f.z);
R122f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[5].z)) + R126f.w;
// 13
R123f.x = mul_nonIEEE(R127f.y,R127f.y) + PV0fy;
R126f.y = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[5].x)) + R122f.x;
// 14
PV0fx = mul_nonIEEE(R127f.z, R127f.z);
R123f.y = mul_nonIEEE(R127f.x,R127f.x) + R123f.x;
// 15
tempf.x = dot(vec4(R126f.x,R126f.y,PV0fx,intBitsToFloat(0x80000000)),vec4(R126f.x,R126f.y,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(R123f.y);
PS1f = tempResultf;
// 16
R127f.x = mul_nonIEEE(R127f.x, PS1f);
R127f.y = mul_nonIEEE(R127f.y, PS1f);
R126f.z = mul_nonIEEE(R126f.z, PS1f);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 17
R125f.x = mul_nonIEEE(R126f.x, PS0f);
R126f.y = mul_nonIEEE(R126f.y, PS0f);
R127f.z = mul_nonIEEE(R127f.z, PS0f);
PV1fw = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedVS[7].z));
PS1f = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedVS[6].z));
// 18
tempf.x = dot(vec4(R127f.x,R127f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedVS[7].y)) + PV1fw;
// 19
backupReg0f = R126f.z;
R126f.x = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[7].x)) + R122f.x;
PV1fy = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedVS[7].y));
R126f.z = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[8].z));
R4f.w = PV0fx;
PS1f = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedVS[8].z));
// 20
tempf.x = dot(vec4(R127f.x,R127f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R126f.w = tempf.x;
R127f.x = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[7].z)) + PV1fy;
// 21
R11f.x = dot(vec4(R125f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),0.0));
PV1fy = R11f.x;
PV1fz = R11f.x;
PV1fw = R11f.x;
R4f.y = R126f.x;
// 22
R123f.x = mul_nonIEEE(R126f.y,intBitsToFloat(uf_remappedVS[8].y)) + R126f.z;
R11f.y = mul_nonIEEE(R125f.x,intBitsToFloat(uf_remappedVS[7].x)) + R127f.x;
R4f.z = R126f.w;
// 23
R11f.z = mul_nonIEEE(R125f.x,intBitsToFloat(uf_remappedVS[8].x)) + R123f.x;
// export
SET_POSITION(vec4(R6f.x, R6f.y, R6f.z, R6f.w));
// export
passParameterSem4 = vec4(R11f.x, R11f.y, R11f.z, R11f.w);
// export
passParameterSem3 = vec4(R4f.w, R4f.y, R4f.z, R4f.w);
// export
// skipped export to semanticId 255
}
