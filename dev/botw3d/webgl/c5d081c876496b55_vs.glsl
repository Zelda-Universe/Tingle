#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c5d081c876496b55
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[16];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;

out vec4 passParameterSem7;
out vec4 passParameterSem3;
out vec4 passParameterSem6;
out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem4;
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
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
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
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R3f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R4f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
// 0
R127f.x = 1.0;
R126f.y = 1.0;
R5f.z = 1.0;
R127f.w = 1.0;
R8f.w = R3f.w;
// 1
R5f.x = dot(vec4(R2f.x,R2f.y,R2f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV1fy = R5f.x;
PV1fz = R5f.x;
PV1fw = R5f.x;
R126f.x = mul_nonIEEE(R1f.z, intBitsToFloat(uf_remappedVS[0].z));
// 2
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.x = mul_nonIEEE(R1f.z, intBitsToFloat(uf_remappedVS[1].z));
// 3
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R7f.z = tempf.x;
PV1fw = tempf.x;
R124f.x = mul_nonIEEE(R1f.z, intBitsToFloat(uf_remappedVS[2].z));
// 4
tempf.x = dot(vec4(R5f.x,R127f.y,PV1fx,R127f.x),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 5
tempf.x = dot(vec4(R5f.x,R127f.y,R7f.z,R127f.x),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R6f.x = PV0fx;
// 6
tempf.x = dot(vec4(R5f.x,R127f.y,R7f.z,R127f.x),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R6f.y = PV1fx;
// 7
R126f.x = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedVS[0].y)) + R126f.x;
R127f.y = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedVS[0].y));
R6f.z = PV0fx;
R127f.w = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedVS[1].y));
R125f.x = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedVS[1].y)) + R125f.x;
// 8
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fx = tempf.x;
R2f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 9
R2f.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fy = R2f.x;
PV1fz = R2f.x;
PV1fw = R2f.x;
R127f.z = -(PV0fx);
// 10
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R2f.z = tempf.x;
PV0fw = tempf.x;
// 11
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R126f.y),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R2f.w = tempf.x;
R0f.z = PV0fx;
// 12
R126f.x = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedVS[0].x)) + R126f.x;
R126f.y = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedVS[1].x)) + R125f.x;
R0f.w = PV1fx;
R0f.y = R127f.z + PV1fx;
R0f.y /= 2.0;
// 13
tempf.x = dot(vec4(R1f.x,R1f.y,R124f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
R122f.x = mul_nonIEEE(R3f.z,intBitsToFloat(uf_remappedVS[0].z)) + R127f.y;
// 14
R124f.x = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[0].x)) + R122f.x;
PV0fy = mul_nonIEEE(PV1fx, PV1fx);
R122f.x = mul_nonIEEE(R3f.z,intBitsToFloat(uf_remappedVS[1].z)) + R127f.w;
// 15
R123f.x = mul_nonIEEE(R126f.y,R126f.y) + PV0fy;
R127f.y = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[1].x)) + R122f.x;
PV1fz = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[2].z));
R0f.x = R2f.x + R2f.w;
R0f.x /= 2.0;
// 16
tempf.x = dot(vec4(R3f.x,R3f.y,PV1fz,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R126f.z = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R126f.x,R126f.x) + R123f.x;
// 17
tempf.x = dot(vec4(R124f.x,R127f.y,PV0fx,intBitsToFloat(0x80000000)),vec4(R124f.x,R127f.y,PV0fx,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(R122f.x);
PS1f = tempResultf;
// 18
R126f.x = mul_nonIEEE(R126f.x, PS1f);
R126f.y = mul_nonIEEE(R126f.y, PS1f);
R127f.z = mul_nonIEEE(R127f.z, PS1f);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 19
R3f.x = mul_nonIEEE(R124f.x, PS0f);
R127f.y = mul_nonIEEE(R127f.y, PS0f);
R126f.z = mul_nonIEEE(R126f.z, PS0f);
PV1fw = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[4].z));
PS1f = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[3].z));
// 20
tempf.x = dot(vec4(R126f.x,R126f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R126f.y,intBitsToFloat(uf_remappedVS[4].y)) + PV1fw;
// 21
backupReg0f = R127f.z;
R124f.x = mul_nonIEEE(R126f.x,intBitsToFloat(uf_remappedVS[4].x)) + R122f.x;
PV1fy = mul_nonIEEE(R127f.y, intBitsToFloat(uf_remappedVS[4].y));
R127f.z = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedVS[5].z));
R3f.w = PV0fx;
PS1f = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedVS[5].z));
// 22
tempf.x = dot(vec4(R126f.x,R126f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R125f.z = tempf.x;
PV0fw = tempf.x;
R126f.x = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedVS[4].z)) + PV1fy;
// 23
R8f.x = dot(vec4(R3f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0));
PV1fy = R8f.x;
PV1fz = R8f.x;
PV1fw = R8f.x;
R3f.y = R124f.x;
// 24
R1f.x = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedVS[5].y)) + R127f.z;
R8f.y = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[4].x)) + R126f.x;
R3f.z = R125f.z;
// export
SET_POSITION(vec4(R2f.x, R2f.y, R2f.z, R2f.w));
// export
passParameterSem7 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
// export
passParameterSem3 = vec4(R3f.w, R3f.y, R3f.z, R3f.w);
// export
// skipped export to semanticId 255
// export
passParameterSem6 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
// 0
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y),R5f.x) + intBitsToFloat(uf_remappedVS[11].y);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x),R5f.x) + intBitsToFloat(uf_remappedVS[11].x);
// 1
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y),R5f.x) + intBitsToFloat(uf_remappedVS[13].y);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x),R5f.x) + intBitsToFloat(uf_remappedVS[13].x);
// 2
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].y),R5f.x) + intBitsToFloat(uf_remappedVS[15].y);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].x),R5f.x) + intBitsToFloat(uf_remappedVS[15].x);
// 3
backupReg0f = R126f.x;
backupReg1f = R127f.y;
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].w),R7f.z) + R124f.x;
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z),R7f.z) + R126f.y;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].w),R7f.z) + backupReg0f;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z),R7f.z) + backupReg1f;
// 4
backupReg0f = R1f.x;
R1f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].z),R7f.z) + R127f.w;
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].w),R7f.z) + R127f.z;
R8f.z = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[5].x)) + backupReg0f;
R1f.w = R123f.z;
R1f.z = R123f.w;
// 5
R4f.z = R127f.y;
R4f.w = R126f.x;
// export
passParameterSem0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem1 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
// export
passParameterSem4 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
