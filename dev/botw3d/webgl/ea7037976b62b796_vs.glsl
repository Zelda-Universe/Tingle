#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ea7037976b62b796
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[25];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem1;
out vec4 passParameterSem2;
out vec4 passParameterSem0;
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
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem0.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
R126f.x = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
R2f.y = intBitsToFloat(uf_remappedVS[0].x);
PV0fz = R1f.y;
PV0fz *= 2.0;
PV0fw = R1f.x;
PV0fw *= 2.0;
R3f.y = intBitsToFloat(uf_remappedVS[0].x);
// 1
R127f.x = PV0fz + -(0.5);
PV1fy = PV0fw + -(0.5);
R9f.z = 1.0;
R11f.w = 1.0;
R6f.w = 0.0;
// 2
PV0fx = mul_nonIEEE(PV1fy, intBitsToFloat(uf_remappedVS[1].x));
PV0fy = mul_nonIEEE(PV1fy, intBitsToFloat(uf_remappedVS[2].x));
PV0fz = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedVS[1].y));
PV0fw = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedVS[2].y));
R3f.w = PV1fy;
R3f.w = clamp(R3f.w, 0.0, 1.0);
// 3
R0f.x = intBitsToFloat(uf_remappedVS[2].z) + PV0fy;
R0f.y = intBitsToFloat(uf_remappedVS[2].w) + PV0fw;
R127f.z = intBitsToFloat(uf_remappedVS[1].z) + PV0fx;
R127f.w = intBitsToFloat(uf_remappedVS[1].w) + PV0fz;
R127f.y = -(R3f.w) + 1.0;
// 4
R6f.x = R127f.z;
PV0fy = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[0].y));
R8f.z = R127f.w;
PV0fw = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[3].y));
R4f.z = R127f.x;
R4f.z = clamp(R4f.z, 0.0, 1.0);
// 5
PV1fx = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedVS[0].z));
PV1fy = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedVS[3].z));
PV1fz = -(PV0fy) + R126f.x;
PV1fw = R126f.x + -(PV0fw);
R127f.x = -(R4f.z) + 1.0;
// 6
PV0fx = -(PV1fx) + PV1fz;
PV0fy = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[4].y));
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), R127f.y);
PV0fw = -(PV1fy) + PV1fw;
R126f.x = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[4].w));
// 7
R2f.x = PV0fx * intBitsToFloat(0x3cb6a401);
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), R127f.y);
PV1fz = PV0fy + PV0fz;
PV1fw = R3f.w + -(0.5);
R3f.x = PV0fw * intBitsToFloat(0x3cb6a401);
// 8
PV0fx = R4f.z + -(0.5);
R5f.y = mul_nonIEEE(PV1fz, R127f.x);
R3f.z = max(PV1fw, -(PV1fw));
PV0fw = R126f.x + PV1fy;
R4f.x = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[5].z);
// 9
R5f.x = -(R1f.w) + 1.0;
R4f.y = mul_nonIEEE(R127f.w,intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[5].w);
R2f.z = mul_nonIEEE(R4f.z, PV0fw);
R0f.w = max(PV0fx, -(PV0fx));
R6f.y = R1f.z;
R0f.xyz = (texture(textureUnitVS1, vec2(R0f.x,R0f.y)).xyz);
R2f.w = (texture(textureUnitVS2, vec2(R2f.x,R2f.y)).x);
R3f.x = (texture(textureUnitVS2, vec2(R3f.x,R3f.y)).x);
R4f.xy = (texture(textureUnitVS0, vec2(R4f.x,R4f.y)).zw);
// 0
R127f.x = R6f.x + -(intBitsToFloat(uf_remappedVS[6].x));
R127f.y = R8f.z + -(intBitsToFloat(uf_remappedVS[6].z));
R124f.z = R0f.z * 800.0;
R9f.w = R0f.x;
R9f.w *= 2.0;
R10f.w = R0f.y;
R10f.w *= 2.0;
// 1
R0f.x = R9f.w + -(1.0);
R124f.y = R124f.z + -(intBitsToFloat(uf_remappedVS[6].y));
R127f.z = R2f.z + R5f.y;
R8f.w = R10f.w + -(1.0);
R125f.z = max(R3f.z, R0f.w);
// 2
tempf.x = dot(vec4(R127f.x,R124f.y,R127f.y,intBitsToFloat(0x80000000)),vec4(R127f.x,R124f.y,R127f.y,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.z = mul_nonIEEE(R8f.w, R8f.w);
// 3
PV1fx = R127f.z + -(intBitsToFloat(uf_remappedVS[7].w));
PV1fy = mul_nonIEEE(R0f.x, R0f.x);
R5f.z = R2f.w;
R5f.z *= 2.0;
R7f.w = R3f.x;
R7f.w *= 2.0;
tempResultf = 1.0 / sqrt(PV0fx);
R2f.w = tempResultf;
// 4
PV0fx = R126f.z + PV1fy;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R125f.y = mul_nonIEEE(PV1fx,R125f.z) + intBitsToFloat(uf_remappedVS[7].w);
R125f.y = clamp(R125f.y, 0.0, 1.0);
R3f.z = R8f.w;
R4f.w = R0f.x;
PS0f = 1.0 / R2f.w;
// 5
R126f.x = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[8].x);
R126f.y = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[8].y);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), PS0f);
PV1fw = -(PV0fx) + 1.0;
R127f.z = R4f.y + -(1.0);
// 6
backupReg0f = R127f.y;
PV0fx = -(intBitsToFloat(uf_remappedVS[9].z)) + PV1fz;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R127f.y = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(uf_remappedVS[8].z);
R2f.z = mul_nonIEEE(backupReg0f, R2f.w);
R5f.w = mul_nonIEEE(R127f.x, R2f.w);
PS0f = sqrt(PV1fw);
// 7
R3f.x = PS0f;
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].z), PV0fx);
R7f.z = PS0f;
R127f.w = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[10].x)) + R126f.x;
R126f.w = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[10].y)) + R126f.y;
// 8
backupReg0f = R127f.y;
PV0fx = R3f.x * 10.0;
R127f.y = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(uf_remappedVS[11].x);
R123f.z = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[10].z)) + backupReg0f;
R0f.w = min(R125f.y, PV1fy);
R125f.y = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(uf_remappedVS[11].y);
// 9
PV1fx = PV0fx + -7.0;
PV1fx = clamp(PV1fx, 0.0, 1.0);
R126f.y = mul_nonIEEE(-(R4f.z),R127f.w) + R127f.w;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), R0f.w);
R127f.w = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[11].z)) + intBitsToFloat(uf_remappedVS[11].z);
R125f.w = mul_nonIEEE(-(R4f.z),R123f.z) + R123f.z;
// 10
PV0fx = mul_nonIEEE(R1f.w, R126f.z);
PV0fy = -(PV1fx) + 1.0;
R125f.z = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[12].y)) + intBitsToFloat(uf_remappedVS[12].y);
R124f.w = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[12].x)) + intBitsToFloat(uf_remappedVS[12].x);
R126f.x = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[12].z)) + intBitsToFloat(uf_remappedVS[12].z);
// 11
backupReg0f = R127f.w;
R123f.x = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[13].x)) + R127f.y;
R5f.y = R124f.z + -(PV0fy);
R6f.z = R126f.z + -(PV0fx);
R127f.w = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[13].y)) + R125f.y;
R122f.x = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[13].z)) + backupReg0f;
// 12
R127f.x = mul_nonIEEE(R4f.z,R122f.x) + R125f.w;
R123f.y = mul_nonIEEE(-(R4f.z),R126f.w) + R126f.w;
R123f.z = mul_nonIEEE(R4f.z,R123f.x) + R126f.y;
R126f.w = -(R4f.y) * intBitsToFloat(0x3c1374bd) + intBitsToFloat(0x3c1374bd);
R125f.w = -(R4f.y) * intBitsToFloat(0x3bc49ba6) + intBitsToFloat(0x3bc49ba6);
// 13
backupReg0f = R126f.x;
backupReg1f = R125f.z;
R126f.x = mul_nonIEEE(R4f.z,R127f.w) + R123f.y;
R123f.y = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[14].x)) + R124f.w;
R125f.z = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[14].z)) + backupReg0f;
R127f.w = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[14].y)) + backupReg1f;
R124f.w = mul_nonIEEE(R123f.z,R127f.z) + R123f.z;
// 14
backupReg0f = R123f.y;
R123f.x = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[15].x)) + intBitsToFloat(uf_remappedVS[15].x);
R123f.y = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[15].y)) + intBitsToFloat(uf_remappedVS[15].y);
R126f.z = mul_nonIEEE(-(R4f.z),backupReg0f) + backupReg0f;
R123f.w = mul_nonIEEE(-(R3f.w),intBitsToFloat(uf_remappedVS[15].z)) + intBitsToFloat(uf_remappedVS[15].z);
R124f.y = mul_nonIEEE(R124f.y, R2f.w);
// 15
backupReg0f = R123f.x;
backupReg1f = R125f.z;
R123f.x = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[16].y)) + R123f.y;
R126f.y = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[16].z)) + R123f.w;
R125f.z = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedVS[16].x)) + backupReg0f;
R123f.w = mul_nonIEEE(-(R4f.z),R127f.w) + R127f.w;
R125f.x = mul_nonIEEE(-(R4f.z),backupReg1f) + backupReg1f;
// 16
backupReg0f = R126f.x;
backupReg1f = R127f.z;
R126f.x = -(R4f.y) * intBitsToFloat(0xbc75c290) + intBitsToFloat(0xbc75c290);
R127f.y = mul_nonIEEE(backupReg0f,backupReg1f) + backupReg0f;
R127f.z = mul_nonIEEE(R1f.w, R0f.w);
R0f.w = mul_nonIEEE(R4f.z,R123f.x) + R123f.w;
R127f.x = mul_nonIEEE(R127f.x,backupReg1f) + R127f.x;
// 17
tempf.x = dot(vec4(R4f.w,R3f.x,R3f.z,R3f.z),vec4(-(R5f.w),-(R124f.y),-(R2f.z),-(R6f.w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R127f.w = tempf.x;
R124f.z = mul_nonIEEE(R4f.z,R126f.y) + R125f.x;
// 18
backupReg0f = R127f.y;
PV0fx = R124f.w + R126f.w;
R127f.y = mul_nonIEEE(R4f.z,R125f.z) + R126f.z;
PV0fz = backupReg0f + R125f.w;
PV0fw = R127f.x + R126f.x;
R127f.x = R3f.x + intBitsToFloat(0xbf19999a);
// 19
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), R127f.z);
R123f.y = -(intBitsToFloat(uf_remappedVS[7].z)) * intBitsToFloat(0x3e26e979) + intBitsToFloat(0x3e26e979);
PV1fz = -(R127f.y) + PV0fx;
PV1fw = -(R0f.w) + PV0fz;
PS1f = -(R124f.z) + PV0fw;
// 20
PV0fx = -(R127f.w) + 1.0;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R127f.y = mul_nonIEEE(PV1fz,R5f.x) + R127f.y;
R123f.z = mul_nonIEEE(R1f.w,R126f.x) + R123f.y;
R127f.w = mul_nonIEEE(PV1fw,R5f.x) + R0f.w;
R126f.w = mul_nonIEEE(PS1f,R5f.x) + R124f.z;
// 21
R123f.x = PV0fx * intBitsToFloat(0x3df5c28f) + R123f.z;
PV1fy = R127f.x * 1000.0;
R123f.z = R4f.x * 4.0 + -(1.0);
R123f.z = clamp(R123f.z, 0.0, 1.0);
R4f.w = R126f.x;
R0f.z = R6f.y;
// 22
R4f.x = mul_nonIEEE(R123f.z, R127f.y);
R4f.y = mul_nonIEEE(R123f.z, R127f.w);
R4f.z = mul_nonIEEE(R123f.z, R126f.w);
R1f.w = min(PV1fy, 1.0);
R0f.w = R123f.x;
// export
passParameterSem1 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
// export
passParameterSem2 = vec4(R0f.x, R0f.x, R0f.z, R0f.w);
// export
passParameterSem0 = vec4(R1f.w, R1f.y, R1f.y, R1f.y);
// 0
PV0fx = mul_nonIEEE(R5f.z, intBitsToFloat(uf_remappedVS[17].y));
PV0fy = mul_nonIEEE(R5f.z, intBitsToFloat(uf_remappedVS[17].x));
PV0fz = mul_nonIEEE(R7f.w, intBitsToFloat(uf_remappedVS[17].w));
PV0fw = mul_nonIEEE(R7f.w, intBitsToFloat(uf_remappedVS[17].z));
// 1
PV1fx = PV0fw + PV0fy;
PV1fy = PV0fz + PV0fx;
R124f.z = mul_nonIEEE(R9f.w,intBitsToFloat(uf_remappedVS[18].x)) + -(intBitsToFloat(uf_remappedVS[18].x));
R127f.w = mul_nonIEEE(R9f.w,intBitsToFloat(uf_remappedVS[19].x)) + -(intBitsToFloat(uf_remappedVS[19].x));
// 2
R127f.x = R0f.x + PV1fx;
R127f.y = mul_nonIEEE(R10f.w,intBitsToFloat(uf_remappedVS[18].z)) + -(intBitsToFloat(uf_remappedVS[18].z));
R127f.z = R8f.w + PV1fy;
R126f.w = mul_nonIEEE(R9f.w,intBitsToFloat(uf_remappedVS[20].x)) + -(intBitsToFloat(uf_remappedVS[20].x));
// 3
tempf.x = dot(vec4(R127f.x,R7f.z,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R7f.z,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R122f.x = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[18].y)) + R124f.z;
// 4
R0f.x = R127f.y + R122f.x;
R123f.y = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[19].y)) + R127f.w;
R123f.w = mul_nonIEEE(R10f.w,intBitsToFloat(uf_remappedVS[19].z)) + -(intBitsToFloat(uf_remappedVS[19].z));
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 5
backupReg0f = R123f.y;
R123f.x = mul_nonIEEE(R10f.w,intBitsToFloat(uf_remappedVS[20].z)) + -(intBitsToFloat(uf_remappedVS[20].z));
R123f.y = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[20].y)) + R126f.w;
PV1fz = mul_nonIEEE(R6f.z, PS0f);
R0f.y = R123f.w + backupReg0f;
// 6
PV0fx = mul_nonIEEE(R7f.z, PV1fz);
PV0fy = mul_nonIEEE(R127f.x, PV1fz);
R0f.z = R123f.x + R123f.y;
PV0fw = mul_nonIEEE(R127f.z, PV1fz);
// 7
R127f.x = R6f.x + PV0fy;
R127f.y = R5f.y + PV0fx;
R127f.z = R8f.z + PV0fw;
// 8
R5f.x = dot(vec4(R127f.x,R127f.y,R127f.z,R11f.w),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w)));
PV0fy = R5f.x;
PV0fz = R5f.x;
PV0fw = R5f.x;
// 9
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R11f.w),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w)));
PV1fx = tempf.x;
R5f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 10
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R11f.w),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R5f.z = tempf.x;
PV0fw = tempf.x;
// 11
R11f.x = dot(vec4(R5f.x,R5f.y,PV0fx,R9f.z),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w)));
PV1fy = R11f.x;
PV1fz = R11f.x;
PV1fw = R11f.x;
// 12
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,R9f.z),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w)));
PV0fx = tempf.x;
R11f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 13
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,R9f.z),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R11f.z = tempf.x;
PV1fw = tempf.x;
// 14
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,R9f.z),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R11f.w = tempf.x;
// export
SET_POSITION(vec4(R11f.x, R11f.y, R11f.z, R11f.w));
// export
passParameterSem3 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
// export
// skipped export to semanticId 255
}
