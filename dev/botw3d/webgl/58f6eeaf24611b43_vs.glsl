#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 58f6eeaf24611b43
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[14];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem8;

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
vec4 R6f = vec4(0.0);
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
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
// 0
R5f.x = max(R1f.y, 0.0);
PV0fy = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x3ed413cd);
R127f.z = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x43c9d6c7);
R4f.w = 1.0;
R0f.z = 0.0;
// 1
PV1fx = intBitsToFloat(uf_remappedVS[0].x) + PV0fy;
R0f.y = intBitsToFloat(uf_remappedVS[1].x);
R3f.z = intBitsToFloat(uf_remappedVS[1].x);
PV1fw = R5f.x;
PV1fw /= 2.0;
R5f.y = intBitsToFloat(uf_remappedVS[1].x) + -(0.5);
R5f.y = clamp(R5f.y, 0.0, 1.0);
// 2
R127f.x = intBitsToFloat(uf_remappedVS[1].w) + PV1fw;
R6f.y = 1.0;
R126f.z = fract(PV1fx);
R5f.w = 1.0;
// 3
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R3f.w = tempf.x;
PS1f = R126f.z * intBitsToFloat(0x3e65a5dd);
// 4
backupReg0f = R127f.x;
backupReg1f = R127f.z;
R127f.x = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[1].y));
R127f.z = backupReg0f * 100.0;
R127f.w = PS1f + backupReg1f;
// 5
R6f.x = dot(vec4(R1f.x,R1f.y,R1f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fy = R6f.x;
PV1fz = R6f.x;
PV1fw = R6f.x;
R127f.y = -(PV0fy) + R127f.w;
// 6
PV0fx = intBitsToFloat(uf_remappedVS[1].w) + R126f.z;
PV0fy = R127f.w + -(R127f.x);
PV0fz = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedVS[2].z));
PV0fw = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedVS[1].z));
R0f.w = R127f.z * intBitsToFloat(0x40490e56);
// 7
PV1fx = -(PV0fw) + R127f.y;
PV1fy = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedVS[4].y));
PV1fz = -(PV0fz) + PV0fy;
PV1fw = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[4].x));
R4f.x = PV0fx * 3.0;
// 8
R0f.x = PV1fx * intBitsToFloat(0x3cb6a401);
R4f.y = intBitsToFloat(uf_remappedVS[4].w) + PV1fy;
R4f.z = intBitsToFloat(uf_remappedVS[4].z) + PV1fw;
R1f.w = R0f.w * 5.0;
R3f.x = PV1fz * intBitsToFloat(0x3cb6a401);
R2f.w = (texture(textureUnitVS1, vec2(R0f.x,R0f.y)).x);
R3f.z = (texture(textureUnitVS1, vec2(R3f.x,R3f.z)).x);
R3f.xy = (texture(textureUnitVS0, vec2(R4f.z,R4f.y)).xy);
// export
passParameterSem0 = vec4(R2f.x, R2f.y, R2f.x, R2f.y);
// 0
PV0fx = R0f.w * 3.0;
PV0fy = R0f.w * 7.0;
PV0fz = fract(R4f.x);
R123f.w = R1f.w * intBitsToFloat(0x3e22f983) + 0.5;
R127f.y = R4f.x * intBitsToFloat(0x431d1463);
// 1
R123f.x = PV0fy * intBitsToFloat(0x3e22f983) + 0.5;
PV1fy = fract(R123f.w);
R123f.z = PV0fx * intBitsToFloat(0x3e22f983) + 0.5;
PV1fw = PV0fz + -(0.5);
PS1f = R127f.y;
PS1f *= 4.0;
// 2
backupReg0f = R123f.z;
PV0fx = fract(R123f.x);
PV0fy = max(PV1fw, -(PV1fw));
R123f.z = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fw = fract(backupReg0f);
R127f.z = PS1f * intBitsToFloat(0x3e22f983) + 0.5;
// 3
backupReg0f = R123f.z;
PV1fx = PV0fy + 0.5;
R123f.y = PV0fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.z = R127f.y * intBitsToFloat(0x3e22f983) + 0.5;
R123f.w = PV0fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = backupReg0f * intBitsToFloat(0x3e22f983);
// 4
backupReg0f = R127f.z;
R127f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV0fy = fract(R123f.z);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), PV1fx);
PV0fw = fract(backupReg0f);
R126f.x = R123f.w * intBitsToFloat(0x3e22f983);
// 5
PV1fx = R127f.z + intBitsToFloat(0xbe99999a);
PV1fx = clamp(PV1fx, 0.0, 1.0);
R123f.y = PV0fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.z = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fw = -(R127f.z) + 1.0;
R127f.y = sin((R127f.w)/0.1591549367);
// 6
backupReg0f = R127f.x;
R127f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV0fy = min(R127f.z, PV1fw);
PV0fy *= 2.0;
PV0fy = clamp(PV0fy, 0.0, 1.0);
R127f.z = PV1fx * intBitsToFloat(0x3d6a0fd3);
R127f.w = R123f.z * intBitsToFloat(0x3e22f983);
PS0f = sin((backupReg0f)/0.1591549367);
// 7
backupReg0f = R127f.y;
backupReg1f = R126f.x;
R126f.x = PV0fy * intBitsToFloat(0x3ca3d70a);
R127f.y = R5f.x + -(intBitsToFloat(uf_remappedVS[5].z));
R127f.y = clamp(R127f.y, 0.0, 1.0);
R126f.z = mul_nonIEEE(R5f.x, intBitsToFloat(uf_remappedVS[5].x));
PV1fw = mul_nonIEEE(backupReg0f, PS0f);
PS1f = sin((backupReg1f)/0.1591549367);
// 8
PV0fx = R3f.y;
PV0fx *= 2.0;
PV0fy = mul_nonIEEE(PS1f, PV1fw);
PV0fz = R3f.x;
PV0fz *= 2.0;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), R126f.z);
PS0f = sin((R127f.x)/0.1591549367);
// 9
backupReg0f = R127f.w;
PV1fx = PV0fy * intBitsToFloat(0x3d4ccccd);
PV1fy = PV0fz + -(1.0);
PV1fz = PV0fx + -(1.0);
R127f.w = mul_nonIEEE(R127f.z, PS0f);
PS1f = sin((backupReg0f)/0.1591549367);
// 10
PV0fx = mul_nonIEEE(R126f.x, PS1f);
PV0fy = -(PV1fz);
PV0fz = mul_nonIEEE(R5f.y, PV1fx);
R124f.w = mul_nonIEEE(PV1fy, R126f.w);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(uf_remappedVS[5].z));
// 11
R126f.y = mul_nonIEEE(PV0fy, R126f.w);
PV1fz = R127f.w + PV0fx;
PV1fw = mul_nonIEEE(R127f.y, PV0fz);
// 12
R126f.x = PV1fz + R2f.w;
PV0fy = R126f.z + PV1fw;
R124f.z = R126f.y;
R127f.w = PV1fz + R3f.z;
// 13
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R127f.w);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), R126f.x);
PV1fz = -(R126f.x) + R127f.w;
R126f.w = PV0fy * 20.0;
// 14
R123f.y = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedVS[2].x)) + R126f.x;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R126f.x);
PV0fw = -(R127f.y) + PV1fx;
// 15
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R127f.w);
R126f.z = mul_nonIEEE(R123f.y, R126f.w);
R123f.w = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedVS[2].x)) + R127f.y;
// 16
R126f.x = -(R127f.z) + PV1fy;
PV0fy = mul_nonIEEE(R126f.z, R126f.z);
R125f.z = mul_nonIEEE(R126f.w, R123f.w);
// 17
tempf.x = dot(vec4(R124f.w,R126f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(R124f.w,R126f.y,R126f.y,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(R126f.z, PV0fy);
// 18
R123f.x = mul_nonIEEE(R126f.x,intBitsToFloat(uf_remappedVS[2].x)) + R127f.z;
PV0fy = R125f.z;
PV0fz = -(PV1fx) + R125f.w;
PV0fw = PS1f * intBitsToFloat(0x3e23d70a);
// 19
PV1fx = mul_nonIEEE(R126f.w, R123f.x);
PV1fy = max(PV0fz, 0.0);
PV1fz = max(PV0fw, 0.0);
PV1fw = R3f.w + PV0fy;
// 20
R3f.x = PV1fw + R124f.w;
R5f.y = -(PV1fz);
PV0fz = PV1fx;
PS0f = sqrt(PV1fy);
// 21
PV1fz = R6f.x + PV0fz;
PV1fw = intBitsToFloat(uf_remappedVS[5].z) + -(PS0f);
// 22
R6f.x = PV1fz + R124f.z;
R0f.z = -(PV1fw);
// 0
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 1
PV1fw = PV0fx + R5f.y;
// 2
R126f.y = PV1fw + R0f.z;
// 3
R126f.x = dot(vec4(R3f.x,R126f.y,R6f.x,R5f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fy = R126f.x;
PV1fz = R126f.x;
PV1fw = R126f.x;
// 4
tempf.x = dot(vec4(R3f.x,R126f.y,R6f.x,R5f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 5
tempf.x = dot(vec4(R3f.x,R126f.y,R6f.x,R5f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R124f.z = tempf.x;
PV1fw = tempf.x;
// 6
tempf.x = dot(vec4(R126f.x,R127f.y,PV1fx,R6f.y),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fx = tempf.x;
R3f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 7
R3f.x = dot(vec4(R126f.x,R127f.y,R124f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV1fy = R3f.x;
PV1fz = R3f.x;
PV1fw = R3f.x;
R127f.x = -(PV0fx);
// 8
tempf.x = dot(vec4(R126f.x,R127f.y,R124f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R3f.z = tempf.x;
PV0fw = tempf.x;
// 9
tempf.x = dot(vec4(R126f.x,R127f.y,R124f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R3f.w = tempf.x;
R6f.z = PV0fx;
// 10
R6f.x = R3f.x + PV1fx;
R6f.x /= 2.0;
R6f.y = R127f.x + PV1fx;
R6f.y /= 2.0;
R6f.w = PV1fx;
// export
SET_POSITION(vec4(R3f.x, R3f.y, R3f.z, R3f.w));
// export
// skipped export to semanticId 255
}
