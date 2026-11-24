#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 84e1ede2f764fb8f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[13];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem12;

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
vec4 R7f = vec4(0.0);
vec4 R8f = vec4(0.0);
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
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R3f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
R7f.x = 1.0;
R4f.y = -(R1f.w) + 1.0;
R127f.z = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
PV0fw = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x3ed413cd);
R4f.w = 1.0;
// 1
PV1fx = R4f.y;
PV1fx /= 2.0;
R0f.y = intBitsToFloat(uf_remappedVS[0].x);
PV1fz = intBitsToFloat(uf_remappedVS[1].x) + PV0fw;
R1f.w = intBitsToFloat(uf_remappedVS[0].x);
R5f.x = intBitsToFloat(uf_remappedVS[0].x) + -(0.5);
R5f.x = clamp(R5f.x, 0.0, 1.0);
// 2
R8f.x = 1.0;
R126f.y = fract(PV1fz);
R127f.w = intBitsToFloat(uf_remappedVS[0].w) + PV1fx;
// 3
R6f.x = dot(vec4(R2f.x,R2f.y,R2f.z,R7f.x),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV1fy = R6f.x;
PV1fz = R6f.x;
PV1fw = R6f.x;
PS1f = R126f.y * intBitsToFloat(0x3e65a5dd);
// 4
PV0fx = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedVS[0].y));
R127f.y = PS1f + R127f.z;
R127f.z = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedVS[2].y));
R127f.w = R127f.w * 100.0;
// 5
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R7f.x),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R3f.z = tempf.x;
PV1fw = tempf.x;
R127f.x = -(PV0fx) + R127f.y;
// 6
PV0fx = R127f.y + -(R127f.z);
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[0].z));
PV0fz = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].z));
PV0fw = intBitsToFloat(uf_remappedVS[0].w) + R126f.y;
R127f.y = R127f.w * intBitsToFloat(0x40490e56);
// 7
R4f.x = PV0fw * 3.0;
PV1fy = R127f.y * 5.0;
PV1fz = -(PV0fz) + PV0fx;
PV1fw = -(PV0fy) + R127f.x;
R0f.w = R127f.y * 3.0;
// 8
R0f.x = PV1fw * intBitsToFloat(0x3cb6a401);
R1f.y = PV1fy * intBitsToFloat(0x3e22f983) + 0.5;
R0f.z = fract(R4f.x);
R2f.w = R127f.y * 7.0;
R1f.x = PV1fz * intBitsToFloat(0x3cb6a401);
R3f.w = (texture(textureUnitVS0, vec2(R0f.x,R0f.y)).x);
R1f.z = (texture(textureUnitVS0, vec2(R1f.x,R1f.w)).x);
// export
passParameterSem0 = vec4(R3f.x, R3f.y, R3f.x, R3f.y);
// 0
R127f.x = R4f.x * intBitsToFloat(0x431d1463);
PV0fy = R0f.z + -(0.5);
R123f.z = R0f.w * intBitsToFloat(0x3e22f983) + 0.5;
R123f.w = R2f.w * intBitsToFloat(0x3e22f983) + 0.5;
PS0f = fract(R1f.y);
// 1
PV1fx = max(PV0fy, -(PV0fy));
PV1fy = fract(R123f.z);
PV1fz = fract(R123f.w);
PV1fw = R127f.x;
PV1fw *= 4.0;
R127f.z = PS0f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 2
R123f.x = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.y = R127f.x * intBitsToFloat(0x3e22f983) + 0.5;
R123f.z = PV1fw * intBitsToFloat(0x3e22f983) + 0.5;
PV0fw = PV1fx + 0.5;
R127f.x = PV1fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 3
PV1fx = fract(R123f.z);
PV1fy = R127f.z * intBitsToFloat(0x3e22f983);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PV0fw);
R127f.w = R123f.x * intBitsToFloat(0x3e22f983);
PS1f = fract(R123f.y);
// 4
R123f.x = PV1fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fy = -(R127f.z) + 1.0;
R123f.z = PS1f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R126f.w = R127f.x * intBitsToFloat(0x3e22f983);
R127f.x = sin((PV1fy)/0.1591549367);
// 5
backupReg0f = R127f.w;
PV1fx = min(R127f.z, PV0fy);
PV1fx *= 2.0;
PV1fx = clamp(PV1fx, 0.0, 1.0);
R127f.y = R123f.z * intBitsToFloat(0x3e22f983);
PV1fz = R127f.z + intBitsToFloat(0xbe99999a);
PV1fz = clamp(PV1fz, 0.0, 1.0);
R127f.w = R123f.x * intBitsToFloat(0x3e22f983);
PS1f = sin((backupReg0f)/0.1591549367);
// 6
backupReg0f = R127f.x;
backupReg1f = R126f.w;
R127f.x = PV1fz * intBitsToFloat(0x3d6a0fd3);
PV0fy = mul_nonIEEE(backupReg0f, PS1f);
R127f.z = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[4].x));
R126f.w = PV1fx * intBitsToFloat(0x3ca3d70a);
PS0f = sin((backupReg1f)/0.1591549367);
// 7
PV1fx = mul_nonIEEE(PS0f, PV0fy);
PS1f = sin((R127f.w)/0.1591549367);
// 8
backupReg0f = R127f.y;
R127f.y = mul_nonIEEE(R127f.x, PS1f);
PV0fw = PV1fx * intBitsToFloat(0x3d4ccccd);
PS0f = sin((backupReg0f)/0.1591549367);
// 9
PV1fz = mul_nonIEEE(R5f.x, PV0fw);
PV1fw = mul_nonIEEE(R126f.w, PS0f);
// 10
PV0fy = mul_nonIEEE(R4f.y, PV1fz);
PV0fz = R127f.y + PV1fw;
// 11
R127f.x = PV0fz + R1f.z;
PV1fy = R127f.z + PV0fy;
R126f.w = PV0fz + R3f.w;
// 12
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R127f.x);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R126f.w);
PV0fz = -(R126f.w) + R127f.x;
R127f.w = PV1fy * 20.0;
// 13
R123f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedVS[2].x)) + R126f.w;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R126f.w);
PV1fw = -(R127f.y) + PV0fx;
// 14
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R127f.x);
R127f.z = mul_nonIEEE(R123f.y, R127f.w);
R123f.w = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedVS[2].x)) + R127f.y;
// 15
PV1fx = -(R126f.z) + PV0fy;
PV1fy = mul_nonIEEE(R127f.z, R127f.z);
PV1fz = mul_nonIEEE(R127f.w, R123f.w);
// 16
PV0fx = mul_nonIEEE(R127f.z, PV1fy);
R123f.z = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedVS[2].x)) + R126f.z;
PV0fw = PV1fz;
// 17
PV1fx = mul_nonIEEE(R127f.w, R123f.z);
R1f.y = R6f.x + PV0fw;
PV1fw = PV0fx * intBitsToFloat(0x3e23d70a);
// 18
PV0fx = PV1fx;
PV0fz = max(PV1fw, 0.0);
// 19
R4f.y = -(PV0fz);
R3f.z = R3f.z + PV0fx;
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R7f.x),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 1
R127f.y = PV0fx + R4f.y;
// 2
R127f.x = dot(vec4(R1f.y,R127f.y,R3f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fy = R127f.x;
PV0fz = R127f.x;
PV0fw = R127f.x;
// 3
tempf.x = dot(vec4(R1f.y,R127f.y,R3f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
R126f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 4
tempf.x = dot(vec4(R1f.y,R127f.y,R3f.z,R4f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
// 5
tempf.x = dot(vec4(R127f.x,R126f.y,PV0fx,R8f.x),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
R1f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 6
R1f.x = dot(vec4(R127f.x,R126f.y,R127f.z,R8f.x),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fy = R1f.x;
PV0fz = R1f.x;
PV0fw = R1f.x;
R126f.x = -(PV1fx);
// 7
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,R8f.x),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R1f.z = tempf.x;
PV1fw = tempf.x;
// 8
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,R8f.x),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R1f.w = tempf.x;
R8f.z = PV1fx;
// 9
R8f.x = R1f.x + PV0fx;
R8f.x /= 2.0;
R8f.y = R126f.x + PV0fx;
R8f.y /= 2.0;
R8f.w = PV0fx;
// export
SET_POSITION(vec4(R1f.x, R1f.y, R1f.z, R1f.w));
// export
// skipped export to semanticId 255
}
