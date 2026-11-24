#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ea051e5acb13476e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[12];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;

out vec4 passParameterSem0;
out vec4 passParameterSem2;
out vec4 passParameterSem8;
out vec4 passParameterSem9;
out vec4 passParameterSem7;
out vec4 passParameterSem5;
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
if( (attrDecoder.x&0x8000u) != 0u ) attrDecoder.x |= 0xFFFF0000u;
if( (attrDecoder.y&0x8000u) != 0u ) attrDecoder.y |= 0xFFFF0000u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/32767.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/32767.0,-1.0)));
attrDecoder.zw = uvec2(uvec2(0));
R4f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
// 0
R6f.x = 1.0;
R8f.y = 1.0;
R0f.z = 0.375;
R127f.w = 1.0;
R0f.y = 0.0;
// 1
R0f.x = dot(vec4(R2f.x,R2f.y,R2f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w)));
PV1fy = R0f.x;
PV1fz = R0f.x;
PV1fw = R0f.x;
R5f.x = intBitsToFloat(0x3eeaaaab);
// 2
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV0fx = tempf.x;
R7f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R5f.y = 0.0;
// 3
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R127f.w),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R2f.z = tempf.x;
PV1fw = tempf.x;
R2f.x = intBitsToFloat(0x3d2aaaab);
// 4
tempf.x = dot(vec4(R0f.x,R7f.y,PV1fx,R6f.x),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV0fx = tempf.x;
R6f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.y = 0.0;
R9f.xyz = (texture(textureUnitVS0, vec2(R0f.z,R0f.y)).xyz);
R5f.xyz = (texture(textureUnitVS0, vec2(R5f.x,R5f.y)).xyz);
R10f.w = (texture(textureUnitVS0, vec2(R2f.x,R2f.y)).y);
// export
passParameterSem0 = vec4(R4f.x, R4f.y, R4f.x, R4f.y);
// 0
tempf.x = dot(vec4(R0f.x,R7f.y,R2f.z,R6f.x),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R11f.x = R6f.y;
// 1
tempf.x = dot(vec4(R0f.x,R7f.y,R2f.z,R6f.x),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R11f.y = PV0fx;
// 2
R127f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x);
R127f.y = -(R9f.x) + R5f.x;
R11f.z = PV1fx;
R126f.w = -(R9f.y) + R5f.y;
R126f.x = -(R9f.z) + R5f.z;
// 3
tempf.x = dot(vec4(R11f.x,R11f.y,R11f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV1fx = tempf.x;
R5f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R1f.w = 1.0;
// 4
tempf.x = dot(vec4(R11f.x,R11f.y,R11f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R5f.w = tempf.x;
R127f.w = -(PV1fx);
// 5
R5f.x = dot(vec4(R11f.x,R11f.y,R11f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV1fy = R5f.x;
PV1fz = R5f.x;
PV1fw = R5f.x;
R0f.w = PV0fx;
// 6
tempf.x = dot(vec4(R11f.x,R11f.y,R11f.z,R8f.y),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R5f.z = tempf.x;
PV0fw = tempf.x;
R0f.y = R127f.w + R5f.w;
R0f.y /= 2.0;
// 7
R0f.x = R5f.x + R5f.w;
R0f.x /= 2.0;
R0f.z = PV0fx;
R123f.w = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedVS[6].z)) + R127f.x;
R8f.w = R3f.w;
// 8
R4f.x = R123f.w;
R4f.y = R123f.w * intBitsToFloat(0x3f333333);
PS0f = 1.0 / R0f.w;
// 9
PV1fw = mul_nonIEEE(R0f.y, PS0f);
// 10
R10f.x = mul_nonIEEE(R127f.y,PV1fw) + R9f.x;
R10f.y = mul_nonIEEE(R126f.w,PV1fw) + R9f.y;
R10f.z = mul_nonIEEE(R126f.x,PV1fw) + R9f.z;
// export
SET_POSITION(vec4(R5f.x, R5f.y, R5f.z, R5f.w));
// export
passParameterSem2 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
// export
passParameterSem8 = vec4(R4f.x, R4f.y, R4f.z, R4f.z);
// export
passParameterSem9 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(R11f.x, R11f.y, R11f.z, R11f.w);
// 0
R124f.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),0.0));
PV0fy = R124f.x;
PV0fz = R124f.x;
PV0fw = R124f.x;
R126f.x = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[0].z));
// 1
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),0.0));
PV1fx = tempf.x;
R127f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.x = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[1].z));
// 2
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R125f.x = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[2].z));
// 3
backupReg0f = R127f.x;
R127f.x = dot(vec4(R3f.x,R3f.y,R126f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),1.0,0.0));
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
R122f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[1].y)) + backupReg0f;
// 4
R123f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[2].y)) + R125f.x;
R126f.y = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[1].x)) + R122f.x;
PS0f = mul_nonIEEE(R127f.z, R127f.z);
// 5
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.y,R127f.y) + PS0f;
R126f.z = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[2].x)) + backupReg0f;
// 6
PV0fx = mul_nonIEEE(R126f.z, R126f.z);
R123f.w = mul_nonIEEE(R124f.x,R124f.x) + R123f.x;
// 7
tempf.x = dot(vec4(R127f.x,R126f.y,PV0fx,intBitsToFloat(0x80000000)),vec4(R127f.x,R126f.y,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(R123f.w);
PS1f = tempResultf;
// 8
R124f.x = mul_nonIEEE(R124f.x, PS1f);
R127f.y = mul_nonIEEE(R127f.y, PS1f);
R127f.z = mul_nonIEEE(R127f.z, PS1f);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 9
R127f.x = mul_nonIEEE(R127f.x, PS0f);
R126f.y = mul_nonIEEE(R126f.y, PS0f);
R126f.z = mul_nonIEEE(R126f.z, PS0f);
PV1fw = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[4].z));
PS1f = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedVS[3].z));
// 10
tempf.x = dot(vec4(R124f.x,R127f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedVS[4].y)) + PV1fw;
// 11
backupReg0f = R127f.z;
R3f.x = PV0fx;
PV1fy = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedVS[4].y));
R127f.z = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedVS[5].z));
R126f.w = mul_nonIEEE(R124f.x,intBitsToFloat(uf_remappedVS[4].x)) + R122f.x;
PS1f = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedVS[5].z));
// 12
tempf.x = dot(vec4(R124f.x,R127f.y,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R125f.z = tempf.x;
PV0fw = tempf.x;
R124f.x = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedVS[4].z)) + PV1fy;
// 13
R8f.x = dot(vec4(R127f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0));
PV1fy = R8f.x;
PV1fz = R8f.x;
PV1fw = R8f.x;
R3f.y = R126f.w;
// 14
R123f.x = mul_nonIEEE(R126f.y,intBitsToFloat(uf_remappedVS[5].y)) + R127f.z;
R8f.y = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[4].x)) + R124f.x;
R3f.z = R125f.z;
// 15
R8f.z = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedVS[5].x)) + R123f.x;
// export
passParameterSem5 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
// export
passParameterSem4 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
