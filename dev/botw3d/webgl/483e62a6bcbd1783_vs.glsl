#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 483e62a6bcbd1783
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

out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem0;
out vec4 passParameterSem2;
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
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xyzw = attrDataSem1.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem2.xyzw)/255.0));
R3f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
PV0fx = -(R1f.z) + 1.0;
PV0fy = R2f.y;
PV0fy *= 2.0;
PV0fz = R2f.x;
PV0fz *= 2.0;
PV0fw = max(R1f.w, -(R1f.w));
R127f.x = R3f.z;
R127f.x /= 2.0;
// 1
R126f.x = PV0fz + -(0.5);
R5f.y = PV0fx * 100.0;
R5f.y = clamp(R5f.y, 0.0, 1.0);
R5f.z = PV0fw + -(0.5);
R0f.w = PV0fy + -(0.5);
PS1f = intBitsToFloat(uf_remappedVS[0].z) + intBitsToFloat(0xbe19999a);
// 2
R3f.x = R2f.w;
R3f.x *= 2.0;
PV0fy = R127f.x + intBitsToFloat(0x3f333333);
PV0fz = mul_nonIEEE(R0f.w, intBitsToFloat(uf_remappedVS[1].y));
PV0fw = mul_nonIEEE(R126f.x, intBitsToFloat(uf_remappedVS[1].x));
R6f.y = PS1f * 100.0;
R6f.y = clamp(R6f.y, 0.0, 1.0);
// 3
R0f.x = intBitsToFloat(uf_remappedVS[1].z) + PV0fw;
R0f.y = intBitsToFloat(uf_remappedVS[1].w) + PV0fz;
R6f.z = PV0fy * intBitsToFloat(0x3d4ccccd);
R3f.w = R3f.x + -(1.0);
R0f.z = mul_nonIEEE(R126f.x, intBitsToFloat(uf_remappedVS[2].x));
R4f.xyz = (texture(textureUnitVS0, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = max(R6f.z, -(R6f.z));
PV0fy = mul_nonIEEE(R0f.w, intBitsToFloat(uf_remappedVS[2].y));
PV0fz = R4f.y;
PV0fz *= 2.0;
PV0fw = R4f.x;
PV0fw *= 2.0;
R0f.x = intBitsToFloat(uf_remappedVS[2].z) + R0f.z;
// 1
backupReg0f = R4f.z;
R127f.x = PV0fz + -(1.0);
R127f.y = PV0fw + -(1.0);
R4f.z = intBitsToFloat(uf_remappedVS[2].w) + PV0fy;
R0f.w = intBitsToFloat(uf_remappedVS[0].y) + PV0fx;
R4f.x = backupReg0f * 800.0;
// 2
PV0fx = mul_nonIEEE(R127f.y, R127f.y);
PV0fy = mul_nonIEEE(R127f.x, R127f.x);
PV0fz = mul_nonIEEE(R1f.x, R127f.x);
PV0fw = mul_nonIEEE(R1f.y, R127f.y);
R4f.w = R127f.y;
// 3
R126f.x = mul_nonIEEE(R4f.w, R5f.y);
R0f.y = -(PV0fz) + PV0fw;
R0f.z = R127f.x;
PV1fw = PV0fy + PV0fx;
PV1fw = clamp(PV1fw, 0.0, 1.0);
R126f.y = mul_nonIEEE(R4f.w, R5f.z);
// 4
R125f.x = mul_nonIEEE(R127f.y, R0f.y);
PV0fy = mul_nonIEEE(R1f.z, R0f.y);
PV0fz = -(PV1fw) + 1.0;
R127f.w = mul_nonIEEE(R127f.x, R0f.y);
PS0f = mul_nonIEEE(R0f.z, R5f.y);
// 5
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PV0fy);
R124f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), backupReg0f);
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), PS0f);
R124f.w = mul_nonIEEE(R0f.z, R5f.z);
R4f.y = sqrt(PV0fz);
// 6
backupReg0f = R5f.z;
R7f.x = mul_nonIEEE(R1f.x, R4f.y);
PV0fy = mul_nonIEEE(R4f.y, R5f.y);
R5f.z = mul_nonIEEE(-(R1f.y), R4f.y);
R126f.w = mul_nonIEEE(R4f.y, backupReg0f);
R125f.y = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[0].z));
// 7
PV1fx = mul_nonIEEE(R127f.x, R5f.z);
PV1fy = mul_nonIEEE(R127f.y, R7f.x);
PV1fz = mul_nonIEEE(R4f.y, R7f.x);
PV1fw = mul_nonIEEE(R4f.y, R5f.z);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), PV0fy);
// 8
R5f.x = -(PV1fy) + PV1fx;
R5f.y = -(R127f.w) + PV1fz;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R126f.w);
R5f.w = -(PV1fw) + R125f.x;
R125f.x = mul_nonIEEE(R1f.z, R5f.z);
// 9
backupReg0f = R125f.w;
R127f.x = mul_nonIEEE(R1f.w, R5f.y);
PV1fy = mul_nonIEEE(R1f.w, R5f.x);
R126f.z = mul_nonIEEE(R1f.z, R7f.x);
R125f.w = mul_nonIEEE(R1f.w, R5f.w);
R124f.x = mul_nonIEEE(R6f.y, backupReg0f);
// 10
backupReg0f = R125f.x;
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R126f.y);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R124f.w);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), PV1fy);
R124f.w = mul_nonIEEE(R3f.w, R127f.z);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), backupReg0f);
// 11
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), R126f.z);
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R127f.x);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R125f.w);
PV1fw = R126f.x + PV0fz;
R127f.z = mul_nonIEEE(R4f.w, intBitsToFloat(uf_remappedVS[0].z));
// 12
R127f.x = R126f.y + PV1fy;
R126f.y = R124f.w + PV1fw;
R126f.z = PV1fx + PV1fz;
R124f.w = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedVS[0].z));
R124f.z = mul_nonIEEE(R3f.w, R125f.y);
// 13
backupReg0f = R127f.y;
PV1fx = mul_nonIEEE(R3f.w, R124f.x);
R127f.y = mul_nonIEEE(R6f.y, R124f.y);
PV1fz = mul_nonIEEE(R3f.w, R125f.x);
R125f.w = mul_nonIEEE(R6f.y, R125f.z);
PS1f = mul_nonIEEE(R3f.w, backupReg0f);
// 14
backupReg0f = R127f.x;
backupReg1f = R124f.w;
R127f.x = -(PV1fx) + R126f.y;
R126f.y = PV1fz + backupReg0f;
PV0fz = mul_nonIEEE(R3f.w, R127f.z);
R124f.w = PS1f + R126f.z;
PS0f = mul_nonIEEE(R3f.w, backupReg1f);
// 15
backupReg0f = R127f.y;
PV1fx = mul_nonIEEE(R3f.w, R125f.w);
R127f.y = mul_nonIEEE(R6f.y, PV0fz);
PV1fz = mul_nonIEEE(R3f.w, backupReg0f);
PV1fw = mul_nonIEEE(R6f.y, R124f.z);
R124f.z = mul_nonIEEE(R6f.y, PS0f);
// 16
PV0fx = -(PV1fx) + R124f.w;
PV0fy = PV1fw + R127f.x;
PV0fz = -(PV1fz) + R126f.y;
PV0fw = mul_nonIEEE(R0f.w, intBitsToFloat(uf_remappedVS[3].x));
PS0f = R4f.y * 10.0;
// 17
PV1fx = PV0fy + -(PV0fw);
PV1fy = R124f.z + PV0fx;
PV1fz = PS0f + -7.0;
PV1fz = clamp(PV1fz, 0.0, 1.0);
PV1fw = R127f.y + PV0fz;
R127f.y = R4f.x + R6f.z;
// 18
PV0fx = mul_nonIEEE(PV1fw, PV1fz);
PV0fy = R4f.z;
PV0fz = R0f.x;
PV0fw = mul_nonIEEE(PV1fx, PV1fz);
PS0f = mul_nonIEEE(PV1fy, PV1fz);
// 19
R127f.x = PV0fz + PV0fx;
R127f.y = R127f.y + PV0fw;
R124f.z = PV0fy + PS0f;
R124f.w = 1.0;
R3f.w = 1.0;
// 20
R6f.x = dot(vec4(R127f.x,R127f.y,R124f.z,R124f.w),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w)));
PV0fy = R6f.x;
PV0fz = R6f.x;
PV0fw = R6f.x;
R0f.w = (mul_nonIEEE(R1f.w,-(R3f.x)) + R1f.w)/2.0;
// 21
tempf.x = dot(vec4(R127f.x,R127f.y,R124f.z,R124f.w),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV1fx = tempf.x;
R6f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R4f.z = mul_nonIEEE(R5f.y,R0f.w) + R4f.w;
// 22
tempf.x = dot(vec4(R127f.x,R127f.y,R124f.z,R124f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R6f.z = tempf.x;
PV0fw = tempf.x;
R3f.x = R1f.z;
R3f.x /= 2.0;
// 23
R8f.x = dot(vec4(R6f.x,R6f.y,PV0fx,R3f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fy = R8f.x;
PV1fz = R8f.x;
PV1fw = R8f.x;
R4f.y = mul_nonIEEE(R5f.x,R0f.w) + R4f.y;
// export
// skipped export to semanticId 255
// 0
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R3f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
R8f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R124f.w = mul_nonIEEE(R5f.z,R3f.x) + R4f.z;
// 1
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R3f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R8f.z = tempf.x;
PV1fw = tempf.x;
R127f.x = mul_nonIEEE(R5f.w,R0f.w) + R0f.z;
// 2
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R3f.w),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R8f.w = tempf.x;
R127f.z = mul_nonIEEE(R0f.y,R3f.x) + R4f.y;
// 3
R127f.x = mul_nonIEEE(R7f.x,R3f.x) + R127f.x;
R123f.y = R1f.w * 0.5 + 0.5;
R124f.z = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedVS[4].x));
R125f.w = R1f.z * 0.5 + 0.5;
PS1f = 1.0 / intBitsToFloat(uf_remappedVS[11].w);
// 4
PV0fx = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedVS[5].x));
PV0fy = -(R123f.y) + 1.0;
R126f.z = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedVS[6].x));
R123f.w = mul_nonIEEE(R2f.z,PS1f) + -(PS1f);
R1f.w = R1f.w * 0.5 + 0.5;
// 5
R7f.x = R123f.w + 1.0;
R7f.x = clamp(R7f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[4].y)) + R124f.z;
R6f.z = R125f.w;
R125f.w = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[5].y)) + PV0fx;
R6f.w = PV0fy;
// 6
R1f.x = intBitsToFloat(uf_remappedVS[11].x);
R126f.y = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedVS[6].y)) + R126f.z;
R1f.y = intBitsToFloat(uf_remappedVS[11].y);
// 7
R2f.x = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[4].z)) + R127f.y;
R1f.z = intBitsToFloat(uf_remappedVS[11].z);
// 8
R2f.y = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[5].z)) + R125f.w;
R2f.z = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[6].z)) + R126f.y;
// 9
R7f.z = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[12].w)) + intBitsToFloat(uf_remappedVS[0].w);
// export
SET_POSITION(vec4(R8f.x, R8f.y, R8f.z, R8f.w));
// export
passParameterSem1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
// export
passParameterSem0 = vec4(R7f.x, R7f.x, R7f.z, R7f.x);
// export
passParameterSem2 = vec4(R6f.x, R6f.x, R6f.z, R6f.w);
}
