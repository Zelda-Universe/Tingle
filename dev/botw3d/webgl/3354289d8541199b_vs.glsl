#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3354289d8541199b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[17];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem5;
out vec4 passParameterSem0;
out vec4 passParameterSem4;
out vec4 passParameterSem7;
out vec4 passParameterSem3;
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
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R5f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
PV0fx = mul_nonIEEE(R5f.x, intBitsToFloat(uf_remappedVS[0].x));
PV0fy = mul_nonIEEE(R5f.y, intBitsToFloat(uf_remappedVS[0].w));
PV0fz = mul_nonIEEE(R5f.y, intBitsToFloat(uf_remappedVS[0].z));
PV0fw = mul_nonIEEE(R5f.x, intBitsToFloat(uf_remappedVS[0].y));
R0f.w = 1.0;
// 1
R8f.x = 1.0;
R8f.y = 1.0;
PV1fz = PV0fz + PV0fx;
PV1fw = PV0fy + PV0fw;
R122f.x = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[1].x)) + intBitsToFloat(uf_remappedVS[2].x);
// 2
R7f.x = intBitsToFloat(uf_remappedVS[3].x) + PV1fz;
R7f.y = intBitsToFloat(uf_remappedVS[3].y) + PV1fw;
R5f.z = mul_nonIEEE(R5f.y,intBitsToFloat(uf_remappedVS[1].z)) + R122f.x;
R9f.w = R4f.w;
R7f.z = R5f.x;
R0f.xyz = (textureLod(textureUnitVS0, vec2(R7f.x,R7f.y),0.0).xyz);
// export
passParameterSem5 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// 0
PV0fx = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedVS[4].z));
PV0fy = mul_nonIEEE(R0f.y, intBitsToFloat(uf_remappedVS[4].z));
PV0fz = mul_nonIEEE(R0f.x, intBitsToFloat(uf_remappedVS[4].z));
R7f.w = R5f.y;
R6f.z = R5f.z;
// 1
R127f.x = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(uf_remappedVS[2].y);
PV1fy = mul_nonIEEE(R1f.y, PV0fx);
PV1fz = mul_nonIEEE(R1f.y, PV0fy);
PV1fw = mul_nonIEEE(R1f.y, PV0fz);
// 2
PV0fx = mul_nonIEEE(R2f.x, PV1fw);
PV0fy = mul_nonIEEE(R2f.z, PV1fy);
R123f.z = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x);
PV0fw = mul_nonIEEE(R2f.y, PV1fz);
R127f.w = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y);
// 3
backupReg0f = R127f.x;
R127f.x = R3f.x + PV0fx;
R127f.y = R3f.y + PV0fw;
R127f.z = R3f.z + PV0fy;
R123f.w = mul_nonIEEE(R5f.y,intBitsToFloat(uf_remappedVS[1].w)) + backupReg0f;
R6f.x = mul_nonIEEE(R5f.y,intBitsToFloat(uf_remappedVS[5].z)) + R123f.z;
// 4
R3f.x = dot(vec4(R127f.x,R127f.y,R127f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV0fy = R3f.x;
PV0fz = R3f.x;
PV0fw = R3f.x;
R6f.w = R123f.w;
// 5
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV1fx = tempf.x;
R3f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.x = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[8].z));
// 6
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R3f.z = tempf.x;
PV0fw = tempf.x;
R127f.x = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[9].z));
// 7
R124f.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),0.0));
PV1fy = R124f.x;
PV1fz = R124f.x;
PV1fw = R124f.x;
R125f.x = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[7].z));
// 8
tempf.x = dot(vec4(R2f.x,R2f.y,R126f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),1.0,0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[9].y)) + R127f.x;
// 9
R123f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[7].y)) + R125f.x;
R127f.z = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[9].x)) + R122f.x;
PS1f = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedVS[9].y));
// 10
R127f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[7].x)) + R123f.x;
PV0fy = mul_nonIEEE(R127f.z, R127f.z);
R125f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedVS[9].z)) + PS1f;
// 11
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),0.0));
PV1fx = tempf.x;
R126f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.y,R127f.y) + PV0fy;
// 12
R6f.y = mul_nonIEEE(R5f.y,intBitsToFloat(uf_remappedVS[5].w)) + R127f.w;
R126f.z = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[9].x)) + R125f.x;
R123f.w = mul_nonIEEE(R124f.x,R124f.x) + R122f.x;
// 13
tempf.x = dot(vec4(R127f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R126f.y,R126f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(R123f.w);
PS1f = tempResultf;
// 14
R4f.x = mul_nonIEEE(R124f.x, PS1f);
R4f.y = mul_nonIEEE(R127f.y, PS1f);
R4f.z = mul_nonIEEE(R127f.z, PS1f);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 15
R5f.x = mul_nonIEEE(R127f.x, PS0f);
R5f.y = mul_nonIEEE(R126f.y, PS0f);
R2f.z = mul_nonIEEE(R126f.z, PS0f);
// export
passParameterSem0 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
// export
// skipped export to semanticId 255
// 0
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R8f.x),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.x = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[10].z));
// 1
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R8f.x),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R6f.x = PV0fx;
// 2
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R8f.x),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R6f.y = PV1fx;
// 3
R127f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[10].y)) + R127f.x;
R126f.y = mul_nonIEEE(R5f.y, intBitsToFloat(uf_remappedVS[10].y));
R6f.z = PV0fx;
R127f.w = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[11].z));
R124f.x = mul_nonIEEE(R4f.z, intBitsToFloat(uf_remappedVS[11].z));
// 4
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV0fx = tempf.x;
R3f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 5
R3f.x = dot(vec4(R6f.x,R6f.y,R6f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w)));
PV1fy = R3f.x;
PV1fz = R3f.x;
PV1fw = R3f.x;
R125f.x = -(PV0fx);
// 6
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R3f.z = tempf.x;
PV0fw = tempf.x;
// 7
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R3f.w = tempf.x;
R8f.z = PV0fx;
// 8
R123f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[10].x)) + R127f.x;
R123f.y = mul_nonIEEE(R5f.y,intBitsToFloat(uf_remappedVS[11].y)) + R127f.w;
R8f.w = PV1fx;
R122f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[11].y)) + R124f.x;
// 9
R127f.x = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedVS[10].z)) + R126f.y;
R9f.y = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[11].x)) + R123f.y;
R123f.w = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[11].x)) + R122f.x;
R7f.x = R123f.x;
// 10
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R7f.y = R123f.w;
// 11
R9f.x = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedVS[10].x)) + R127f.x;
PV1fy = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[12].z));
R7f.z = PV0fx;
R8f.x = R3f.x + R3f.w;
R8f.x /= 2.0;
// 12
tempf.x = dot(vec4(R5f.x,R5f.y,PV1fy,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R9f.z = tempf.x;
PV0fw = tempf.x;
R8f.y = R125f.x + R3f.w;
R8f.y /= 2.0;
// export
SET_POSITION(vec4(R3f.x, R3f.y, R3f.z, R3f.w));
// export
passParameterSem4 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
// export
passParameterSem7 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
// export
passParameterSem3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
// export
passParameterSem6 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
