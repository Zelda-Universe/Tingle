#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 62c5e9b745d067a5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[14];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem12;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem13;

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
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xyzw = attrDataSem13.xyzw;
attrDecoder = uvec4(((attrDecoder>>8)&0xFFu)|((attrDecoder<<8)&0xFF00u));
attrDecoder.xyzw = uvec4(floatBitsToInt(vec4(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16)),unpackHalf2x16(attrDecoder.z|(attrDecoder.w<<16)))));
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
PV0fx = R2f.x + R3f.x;
R127f.y = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
PV0fz = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x3ed413cd);
R6f.w = 1.0;
R5f.y = -(R1f.w) + 1.0;
// 1
PV1fx = R5f.y;
PV1fx /= 2.0;
R0f.y = intBitsToFloat(uf_remappedVS[0].x);
R127f.z = PV0fx * intBitsToFloat(0x3ca3d70a);
PV1fw = intBitsToFloat(uf_remappedVS[1].x) + PV0fz;
R1f.y = intBitsToFloat(uf_remappedVS[0].x);
// 2
R1f.x = intBitsToFloat(uf_remappedVS[0].x) + -(0.5);
R1f.x = clamp(R1f.x, 0.0, 1.0);
PV0fy = fract(PV1fw);
PV0fz = intBitsToFloat(uf_remappedVS[0].w) + PV1fx;
R4f.w = 0.0;
R7f.w = 1.0;
// 3
R127f.x = PV0fz * 100.0;
R6f.y = 1.0;
R127f.w = PV0fy + R127f.z;
// 4
R4f.x = dot(vec4(R3f.x,R3f.y,R3f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV0fy = R4f.x;
PV0fz = R4f.x;
PV0fw = R4f.x;
PS0f = R127f.w * intBitsToFloat(0x3e65a5dd);
// 5
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.y = PS0f + R127f.y;
// 6
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R5f.w = tempf.x;
R127f.z = R4f.x + PV1fx;
// 7
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R4f.y = R127f.x * intBitsToFloat(0x40490e56);
// 8
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R127f.z);
R126f.y = R5f.w + PV1fx;
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), R127f.z);
R1f.w = R4f.y * 5.0;
R2f.z = R4f.y * 3.0;
// 9
PV1fx = -(PV0fx) + R127f.y;
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R126f.y);
PV1fz = R127f.y + -(PV0fz);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), R126f.y);
PS1f = intBitsToFloat(uf_remappedVS[0].w) + R127f.w;
// 10
PV0fx = -(PV1fw) + PV1fz;
PV0fy = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedVS[4].y));
PV0fz = -(PV1fy) + PV1fx;
PV0fw = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[4].x));
R0f.z = PS1f * 3.0;
// 11
backupReg0f = R0f.z;
R0f.x = PV0fz * intBitsToFloat(0x3cb6a401);
R2f.y = intBitsToFloat(uf_remappedVS[4].w) + PV0fy;
R1f.z = PV0fx * intBitsToFloat(0x3cb6a401);
R2f.w = intBitsToFloat(uf_remappedVS[4].z) + PV0fw;
R0f.w = fract(backupReg0f);
R3f.w = (texture(textureUnitVS1, vec2(R0f.x,R0f.y)).x);
R1f.z = (texture(textureUnitVS1, vec2(R1f.z,R1f.y)).x);
R2f.xy = (texture(textureUnitVS0, vec2(R2f.w,R2f.y)).xy);
// 0
R123f.x = R1f.w * intBitsToFloat(0x3e22f983) + 0.5;
PV0fy = R0f.w + -(0.5);
PV0fz = R4f.y * 7.0;
R123f.w = R2f.z * intBitsToFloat(0x3e22f983) + 0.5;
R127f.x = R0f.z * intBitsToFloat(0x431d1463);
// 1
PV1fx = max(PV0fy, -(PV0fy));
PV1fy = fract(R123f.w);
PV1fz = fract(R123f.x);
R123f.w = PV0fz * intBitsToFloat(0x3e22f983) + 0.5;
PS1f = R127f.x;
PS1f *= 4.0;
// 2
R123f.x = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fy = fract(R123f.w);
PV0fz = PV1fx + 0.5;
R123f.w = PV1fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = PS1f * intBitsToFloat(0x3e22f983) + 0.5;
// 3
backupReg0f = R123f.x;
R123f.x = R127f.x * intBitsToFloat(0x3e22f983) + 0.5;
R123f.y = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fz = R123f.w * intBitsToFloat(0x3e22f983);
R126f.w = backupReg0f * intBitsToFloat(0x3e22f983);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PV0fz);
// 4
R126f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV0fy = fract(R127f.w);
PV0fz = fract(R123f.x);
PV0fw = -(R125f.w) + 1.0;
R127f.x = sin((PV1fz)/0.1591549367);
// 5
R123f.x = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fy = min(R125f.w, PV0fw);
PV1fy *= 2.0;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R127f.z = R125f.w + intBitsToFloat(0xbe99999a);
R127f.z = clamp(R127f.z, 0.0, 1.0);
R123f.w = PV0fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PS1f = sin((R126f.w)/0.1591549367);
// 6
backupReg0f = R127f.x;
R127f.x = R123f.w * intBitsToFloat(0x3e22f983);
PV0fy = mul_nonIEEE(backupReg0f, PS1f);
PV0fz = R123f.x * intBitsToFloat(0x3e22f983);
R126f.w = PV1fy * intBitsToFloat(0x3ca3d70a);
PS0f = sin((R126f.x)/0.1591549367);
// 7
PV1fx = mul_nonIEEE(PS0f, PV0fy);
PV1fy = R127f.z * intBitsToFloat(0x3d6a0fd3);
R127f.z = R5f.y + -(intBitsToFloat(uf_remappedVS[5].z));
R127f.z = clamp(R127f.z, 0.0, 1.0);
R125f.w = mul_nonIEEE(R5f.y, intBitsToFloat(uf_remappedVS[5].x));
PS1f = sin((PV0fz)/0.1591549367);
// 8
PV0fx = R2f.x;
PV0fx *= 2.0;
R126f.y = mul_nonIEEE(PV1fy, PS1f);
PV0fz = PV1fx * intBitsToFloat(0x3d4ccccd);
PV0fw = R2f.y;
PV0fw *= 2.0;
PS0f = sin((R127f.x)/0.1591549367);
// 9
PV1fx = PV0fx + -(1.0);
PV1fy = PV0fw + -(1.0);
PV1fz = mul_nonIEEE(R126f.w, PS0f);
PV1fw = mul_nonIEEE(R1f.x, PV0fz);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), R125f.w);
// 10
PV0fx = -(PV1fy);
PV0fy = mul_nonIEEE(R127f.z, PV1fw);
R124f.z = mul_nonIEEE(PV1fx, R126f.w);
PV0fw = R126f.y + PV1fz;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(uf_remappedVS[5].z));
// 11
PV1fx = R125f.w + PV0fy;
R126f.y = mul_nonIEEE(PV0fx, R126f.w);
R127f.z = PV0fw + R1f.z;
R126f.w = PV0fw + R3f.w;
// 12
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R126f.w);
PV0fy = -(R126f.w) + R127f.z;
R125f.z = PV1fx * 20.0;
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), R127f.z);
R126f.x = R126f.y;
// 13
R123f.x = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedVS[3].x)) + R126f.w;
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R126f.w);
PV1fz = -(R127f.x) + PV0fw;
// 14
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), R127f.z);
R127f.y = mul_nonIEEE(R123f.x, R125f.z);
R123f.z = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedVS[3].x)) + R127f.x;
// 15
PV1fx = mul_nonIEEE(R127f.y, R127f.y);
R124f.y = mul_nonIEEE(R125f.z, R123f.z);
R126f.w = -(R125f.y) + PV0fx;
// 16
tempf.x = dot(vec4(R124f.z,R126f.y,R4f.w,intBitsToFloat(0x80000000)),vec4(R124f.z,R126f.y,R126f.y,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R127f.y, PV1fx);
// 17
R123f.x = mul_nonIEEE(R126f.w,intBitsToFloat(uf_remappedVS[3].x)) + R125f.y;
PV1fy = -(PV0fx) + R126f.z;
PV1fz = PS0f * intBitsToFloat(0x3e23d70a);
PV1fw = R124f.y;
// 18
PV0fx = max(PV1fy, 0.0);
PV0fy = max(PV1fz, 0.0);
PV0fz = R4f.x + PV1fw;
PV0fw = mul_nonIEEE(R125f.z, R123f.x);
// 19
R4f.x = -(PV0fy);
PV1fy = PV0fw;
R1f.z = PV0fz + R124f.z;
PS1f = sqrt(PV0fx);
// 20
PV0fy = R5f.w + PV1fy;
PV0fz = intBitsToFloat(uf_remappedVS[5].z) + -(PS1f);
// 21
R2f.y = -(PV0fz);
R0f.z = PV0fy + R126f.x;
// 0
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 1
PV1fz = PV0fx + R4f.x;
// 2
R125f.y = PV1fz + R2f.y;
// 3
R126f.x = dot(vec4(R1f.z,R125f.y,R0f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fy = R126f.x;
PV1fz = R126f.x;
PV1fw = R126f.x;
// 4
tempf.x = dot(vec4(R1f.z,R125f.y,R0f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
R124f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 5
tempf.x = dot(vec4(R1f.z,R125f.y,R0f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R124f.z = tempf.x;
PV1fw = tempf.x;
// 6
R0f.x = dot(vec4(R126f.x,R124f.y,PV1fx,R6f.y),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fy = R0f.x;
PV0fz = R0f.x;
PV0fw = R0f.x;
// 7
tempf.x = dot(vec4(R126f.x,R124f.y,R124f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV1fx = tempf.x;
R0f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 8
tempf.x = dot(vec4(R126f.x,R124f.y,R124f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R0f.z = tempf.x;
PV0fw = tempf.x;
// 9
tempf.x = dot(vec4(R126f.x,R124f.y,R124f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R0f.w = tempf.x;
// export
SET_POSITION(vec4(R0f.x, R0f.y, R0f.z, R0f.w));
// export
// skipped export to semanticId 255
}
