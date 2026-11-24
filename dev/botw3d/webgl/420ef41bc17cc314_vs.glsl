#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 420ef41bc17cc314
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[13];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem12;

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
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
R127f.x = R1f.z;
R127f.x /= 2.0;
R127f.y = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
PV0fz = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x3ed413cd);
R4f.w = 1.0;
R5f.w = 1.0;
// 1
R1f.x = intBitsToFloat(uf_remappedVS[0].x) + -(0.5);
R1f.x = clamp(R1f.x, 0.0, 1.0);
PV1fy = intBitsToFloat(uf_remappedVS[1].x) + PV0fz;
R0f.z = intBitsToFloat(uf_remappedVS[0].x);
R0f.w = intBitsToFloat(uf_remappedVS[0].x);
R6f.w = 1.0;
// 2
R126f.x = fract(PV1fy);
R127f.z = intBitsToFloat(uf_remappedVS[0].w) + R127f.x;
// 3
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R5f.z = tempf.x;
PV1fw = tempf.x;
PS1f = R126f.x * intBitsToFloat(0x3e65a5dd);
// 4
R127f.x = PS1f + R127f.y;
R127f.y = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
R127f.z = R127f.z * 100.0;
PV0fw = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[0].y));
// 5
R3f.x = dot(vec4(R2f.x,R2f.y,R2f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fy = R3f.x;
PV1fz = R3f.x;
PV1fw = R3f.x;
R127f.w = -(PV0fw) + R127f.x;
// 6
PV0fx = mul_nonIEEE(R3f.x, intBitsToFloat(uf_remappedVS[0].z));
PV0fy = mul_nonIEEE(R3f.x, intBitsToFloat(uf_remappedVS[2].z));
PV0fz = intBitsToFloat(uf_remappedVS[0].w) + R126f.x;
PV0fw = R127f.x + -(R127f.y);
R127f.x = R127f.z * intBitsToFloat(0x40490e56);
// 7
PV1fx = -(PV0fy) + PV0fw;
R1f.y = PV0fz * 3.0;
PV1fz = -(PV0fx) + R127f.w;
PV1fw = R127f.x * 5.0;
R3f.z = R127f.x * 3.0;
// 8
R0f.x = PV1fz * intBitsToFloat(0x3cb6a401);
R0f.y = PV1fx * intBitsToFloat(0x3cb6a401);
R4f.z = fract(R1f.y);
R2f.w = R127f.x * 7.0;
R1f.w = PV1fw * intBitsToFloat(0x3e22f983) + 0.5;
R3f.w = (texture(textureUnitVS0, vec2(R0f.x,R0f.z)).x);
R0f.z = (texture(textureUnitVS0, vec2(R0f.y,R0f.w)).x);
// 0
PV0fx = R4f.z + -(0.5);
R123f.y = R3f.z * intBitsToFloat(0x3e22f983) + 0.5;
PV0fz = fract(R1f.w);
PV0fw = R1f.y * intBitsToFloat(0x431d1463);
R127f.y = R2f.w * intBitsToFloat(0x3e22f983) + 0.5;
// 1
PV1fx = fract(R123f.y);
R126f.y = PV0fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fz = PV0fw;
PV1fz *= 4.0;
PV1fw = max(PV0fx, -(PV0fx));
R122f.x = PV0fw * intBitsToFloat(0x3e22f983) + 0.5;
// 2
PV0fx = fract(R127f.y);
R123f.y = PV1fz * intBitsToFloat(0x3e22f983) + 0.5;
PV0fz = PV1fw + 0.5;
R123f.w = PV1fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.z = fract(R122f.x);
// 3
PV1fx = R126f.y * intBitsToFloat(0x3e22f983);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PV0fz);
R126f.z = R123f.w * intBitsToFloat(0x3e22f983);
R123f.w = PV0fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PS1f = fract(R123f.y);
// 4
PV0fx = -(R126f.y) + 1.0;
R123f.y = R127f.z * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.z = R123f.w * intBitsToFloat(0x3e22f983);
R123f.w = PS1f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = sin((PV1fx)/0.1591549367);
// 5
backupReg0f = R126f.z;
R127f.x = R123f.y * intBitsToFloat(0x3e22f983);
PV1fy = R126f.y + intBitsToFloat(0xbe99999a);
PV1fy = clamp(PV1fy, 0.0, 1.0);
R126f.z = R123f.w * intBitsToFloat(0x3e22f983);
PV1fw = min(R126f.y, PV0fx);
PV1fw *= 2.0;
PV1fw = clamp(PV1fw, 0.0, 1.0);
PS1f = sin((backupReg0f)/0.1591549367);
// 6
backupReg0f = R127f.z;
PV0fx = mul_nonIEEE(R127f.w, PS1f);
R126f.y = PV1fy * intBitsToFloat(0x3d6a0fd3);
R127f.z = PV1fw * intBitsToFloat(0x3ca3d70a);
R127f.w = mul_nonIEEE(R1f.z, intBitsToFloat(uf_remappedVS[4].x));
PS0f = sin((backupReg0f)/0.1591549367);
// 7
PV1fw = mul_nonIEEE(PS0f, PV0fx);
PS1f = sin((R127f.x)/0.1591549367);
// 8
PV0fx = PV1fw * intBitsToFloat(0x3d4ccccd);
R127f.z = mul_nonIEEE(R127f.z, PS1f);
PS0f = sin((R126f.z)/0.1591549367);
// 9
PV1fx = mul_nonIEEE(R126f.y, PS0f);
PV1fy = mul_nonIEEE(R1f.x, PV0fx);
// 10
PV0fx = mul_nonIEEE(R1f.z, PV1fy);
PV0fy = PV1fx + R127f.z;
// 11
PV1fx = R127f.w + PV0fx;
R127f.z = PV0fy + R0f.z;
R127f.w = PV0fy + R3f.w;
// 12
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R127f.w);
PV0fy = -(R127f.w) + R127f.z;
R126f.z = PV1fx * 20.0;
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R127f.z);
// 13
R123f.x = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedVS[2].x)) + R127f.w;
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R127f.w);
PV1fz = -(R127f.x) + PV0fw;
// 14
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R127f.z);
R126f.y = mul_nonIEEE(R123f.x, R126f.z);
R123f.z = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedVS[2].x)) + R127f.x;
// 15
PV1fx = mul_nonIEEE(R126f.y, R126f.y);
PV1fy = mul_nonIEEE(R126f.z, R123f.z);
PV1fw = -(R127f.y) + PV0fx;
// 16
R123f.y = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedVS[2].x)) + R127f.y;
PV0fz = PV1fy;
PV0fw = mul_nonIEEE(R126f.y, PV1fx);
// 17
R1f.x = R5f.z + PV0fz;
PV1fz = PV0fw * intBitsToFloat(0x3e23d70a);
PV1fw = mul_nonIEEE(R126f.z, R123f.y);
// 18
PV0fx = PV1fw;
PV0fy = max(PV1fz, 0.0);
// 19
backupReg0f = R3f.x;
R3f.x = -(PV0fy);
R5f.z = backupReg0f + PV0fx;
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 1
R127f.y = PV0fx + R3f.x;
// 2
R127f.x = dot(vec4(R1f.x,R127f.y,R5f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fy = R127f.x;
PV0fz = R127f.x;
PV0fw = R127f.x;
// 3
tempf.x = dot(vec4(R1f.x,R127f.y,R5f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
R126f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 4
tempf.x = dot(vec4(R1f.x,R127f.y,R5f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R126f.z = tempf.x;
PV0fw = tempf.x;
// 5
R1f.x = dot(vec4(R127f.x,R126f.y,PV0fx,R6f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fy = R1f.x;
PV1fz = R1f.x;
PV1fw = R1f.x;
// 6
tempf.x = dot(vec4(R127f.x,R126f.y,R126f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fx = tempf.x;
R1f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 7
tempf.x = dot(vec4(R127f.x,R126f.y,R126f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R1f.z = tempf.x;
PV1fw = tempf.x;
// 8
tempf.x = dot(vec4(R127f.x,R126f.y,R126f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R1f.w = tempf.x;
// export
SET_POSITION(vec4(R1f.x, R1f.y, R1f.z, R1f.w));
// export
// skipped export to semanticId 255
}
