#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 554663d3fe6db34b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[15];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem0;
out vec4 passParameterSem6;
out vec4 passParameterSem2;
out vec4 passParameterSem5;
out vec4 passParameterSem4;
out vec4 passParameterSem7;
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
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
attrDecoder.zw = uvec2(uvec2(0));
R5f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
R6f.x = 1.0;
R6f.y = 1.0;
R125f.z = -(R3f.x) + intBitsToFloat(uf_remappedVS[0].x);
R127f.w = 1.0;
R124f.y = -(R3f.y) + intBitsToFloat(uf_remappedVS[0].y);
// 1
R0f.x = dot(vec4(R3f.x,R3f.y,R3f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV1fy = R0f.x;
PV1fz = R0f.x;
PV1fw = R0f.x;
R8f.w = R4f.w;
// 2
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV0fx = tempf.x;
R0f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.x = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[2].z));
// 3
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R0f.z = tempf.x;
PV1fw = tempf.x;
R126f.x = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[3].z));
// 4
R124f.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),0.0));
PV0fy = R124f.x;
PV0fz = R124f.x;
PV0fw = R124f.x;
R125f.x = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[1].z));
// 5
tempf.x = dot(vec4(R2f.x,R2f.y,R127f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),1.0,0.0));
PV1fx = tempf.x;
R127f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R122f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[3].y)) + R126f.x;
// 6
R127f.x = -(R3f.z) + intBitsToFloat(uf_remappedVS[0].z);
R127f.z = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[3].x)) + R122f.x;
PS0f = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[3].y));
// 7
R126f.x = dot(vec4(R4f.x,R4f.y,R125f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),1.0,0.0));
PV1fy = R126f.x;
PV1fz = R126f.x;
PV1fw = R126f.x;
R125f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[3].z)) + PS0f;
// 8
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),0.0));
PV0fx = tempf.x;
R2f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R127f.z, R127f.z);
// 9
R123f.x = mul_nonIEEE(R127f.y,R127f.y) + PS0f;
R124f.z = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[3].x)) + R125f.x;
PS1f = mul_nonIEEE(R127f.x, R127f.x);
// 10
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R124f.y,R124f.y) + PS1f;
R126f.y = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x);
R123f.z = mul_nonIEEE(R124f.x,R124f.x) + backupReg0f;
R127f.w = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y);
PS0f = mul_nonIEEE(R124f.z, R124f.z);
// 11
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R2f.y,R2f.y) + PS0f;
R125f.y = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y);
R126f.z = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x);
R126f.w = mul_nonIEEE(R125f.z,R125f.z) + backupReg0f;
tempResultf = 1.0 / sqrt(R123f.z);
PS1f = tempResultf;
// 12
backupReg0f = R127f.y;
R4f.x = mul_nonIEEE(R124f.x, PS1f);
R127f.y = mul_nonIEEE(R126f.x,R126f.x) + R123f.x;
R4f.z = mul_nonIEEE(backupReg0f, PS1f);
R4f.w = mul_nonIEEE(R127f.z, PS1f);
R122f.x = mul_nonIEEE(R5f.y,intBitsToFloat(uf_remappedVS[4].z)) + R126f.y;
// 13
backupReg0f = R5f.y;
R123f.x = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedVS[4].w)) + R127f.w;
R5f.y = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedVS[6].w)) + R125f.y;
R5f.z = R122f.x;
R5f.x = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedVS[6].z)) + R126f.z;
// 14
R5f.w = R123f.x;
tempResultf = 1.0 / sqrt(R126f.w);
R126f.w = tempResultf;
// 15
backupReg0f = R127f.x;
backupReg1f = R127f.y;
R127f.x = mul_nonIEEE(R125f.z, R126f.w);
R127f.y = mul_nonIEEE(R124f.y, R126f.w);
R125f.z = mul_nonIEEE(backupReg0f, R126f.w);
tempResultf = 1.0 / sqrt(backupReg1f);
PS1f = tempResultf;
// 16
R2f.x = mul_nonIEEE(R126f.x, PS1f);
R2f.y = mul_nonIEEE(R2f.y, PS1f);
R2f.z = mul_nonIEEE(R124f.z, PS1f);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), R125f.z);
R7f.w = 1.0 / R126f.w;
// 17
R3f.x = dot(vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),PV0fw,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,1.0,0.0));
PV1fy = R3f.x;
PV1fz = R3f.x;
PV1fw = R3f.x;
PS1f = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R125f.z);
// 18
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),PS1f,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,1.0,0.0));
PV0fx = tempf.x;
R4f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), R125f.z);
// 19
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),PS0f,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R3f.z = tempf.x;
PV1fw = tempf.x;
// export
passParameterSem0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
// export
passParameterSem6 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// 0
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,R6f.x),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.x = mul_nonIEEE(R4f.w, intBitsToFloat(uf_remappedVS[8].z));
// 1
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,R6f.x),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R1f.x = PV0fx;
// 2
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,R6f.x),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R1f.y = PV1fx;
// 3
R127f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[8].y)) + R127f.x;
R127f.y = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedVS[8].y));
R1f.z = PV0fx;
R126f.w = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[9].z));
R126f.x = mul_nonIEEE(R4f.w, intBitsToFloat(uf_remappedVS[9].z));
// 4
R0f.x = dot(vec4(R1f.x,R1f.y,R1f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV0fy = R0f.x;
PV0fz = R0f.x;
PV0fw = R0f.x;
// 5
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fx = tempf.x;
R0f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 6
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R0f.z = tempf.x;
PV0fw = tempf.x;
// 7
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,R6f.y),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R0f.w = tempf.x;
// 8
R127f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[8].x)) + R127f.x;
R123f.y = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[9].y)) + R126f.w;
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), R4f.y);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), R4f.y);
R122f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[9].y)) + R126f.x;
// 9
R126f.x = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedVS[8].z)) + R127f.y;
R8f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[9].x)) + R123f.y;
R125f.z = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[9].x)) + R122f.x;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x),R3f.x) + PV0fw;
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z),R3f.z) + PV0fz;
// 10
tempf.x = dot(vec4(R4f.x,R4f.z,R4f.w,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R4f.x = R127f.x;
// 11
R8f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[8].x)) + R126f.x;
R7f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].z),R3f.z) + R126f.w;
R4f.z = PV0fx;
R4f.w = R125f.z;
// 12
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R8f.z = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), R3f.z);
// 13
tempf.x = dot(vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),PS0f,intBitsToFloat(0x80000000)),vec4(R3f.x,R4f.y,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R7f.z = tempf.x;
PV1fw = tempf.x;
R7f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x),R3f.x) + R124f.x;
// export
SET_POSITION(vec4(R0f.x, R0f.y, R0f.z, R0f.w));
// export
passParameterSem2 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
// export
passParameterSem5 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
// export
passParameterSem4 = vec4(R4f.x, R4f.w, R4f.z, R4f.w);
// export
passParameterSem7 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
