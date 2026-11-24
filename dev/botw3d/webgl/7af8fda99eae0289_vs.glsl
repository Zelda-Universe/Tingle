#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7af8fda99eae0289
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[13];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem12;

out vec4 passParameterSem0;
out vec4 passParameterSem4;
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
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R4f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
// 0
R127f.x = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
PV0fy = intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x3ed413cd);
R5f.z = -(R1f.w) + 1.0;
R5f.w = 1.0;
R6f.w = 1.0;
// 1
PV1fx = intBitsToFloat(uf_remappedVS[1].x) + PV0fy;
R0f.y = intBitsToFloat(uf_remappedVS[0].x);
R0f.z = intBitsToFloat(uf_remappedVS[0].x);
PV1fw = R5f.z;
PV1fw /= 2.0;
R3f.w = intBitsToFloat(uf_remappedVS[0].x) + -(0.5);
R3f.w = clamp(R3f.w, 0.0, 1.0);
// 2
R6f.x = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[1].z));
R127f.y = intBitsToFloat(uf_remappedVS[0].w) + PV1fw;
R126f.z = fract(PV1fx);
R7f.w = 1.0;
// 3
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R6f.z = tempf.x;
PV1fw = tempf.x;
PS1f = R126f.z * intBitsToFloat(0x3e65a5dd);
// 4
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].y));
R127f.y = R127f.y * 100.0;
R127f.z = PS1f + backupReg0f;
PV0fw = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[0].y));
// 5
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w)));
PV1fx = tempf.x;
R7f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.w = -(PV0fw) + R127f.z;
// 6
PV0fx = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[2].z));
PV0fy = intBitsToFloat(uf_remappedVS[0].w) + R126f.z;
PV0fz = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedVS[0].z));
PV0fw = R127f.z + -(R127f.x);
R127f.z = R127f.y * intBitsToFloat(0x40490e56);
// 7
R5f.x = PV0fy * 3.0;
PV1fy = -(PV0fz) + R127f.w;
PV1fz = -(PV0fx) + PV0fw;
PV1fw = R127f.z * 5.0;
R5f.y = R127f.z * 3.0;
// 8
R0f.x = PV1fy * intBitsToFloat(0x3cb6a401);
R6f.y = fract(R5f.x);
R4f.z = R127f.z * 7.0;
R0f.w = PV1fz * intBitsToFloat(0x3cb6a401);
R2f.w = PV1fw * intBitsToFloat(0x3e22f983) + 0.5;
R4f.w = (texture(textureUnitVS0, vec2(R0f.x,R0f.y)).x);
R0f.z = (texture(textureUnitVS0, vec2(R0f.w,R0f.z)).x);
// export
// skipped export to semanticId 255
// export
passParameterSem0 = vec4(R4f.x, R4f.y, R4f.x, R4f.y);
// 0
R123f.x = R5f.y * intBitsToFloat(0x3e22f983) + 0.5;
R123f.y = R4f.z * intBitsToFloat(0x3e22f983) + 0.5;
PV0fz = R6f.y + -(0.5);
R127f.w = R5f.x * intBitsToFloat(0x431d1463);
PS0f = fract(R2f.w);
// 1
PV1fx = fract(R123f.y);
PV1fy = R127f.w;
PV1fy *= 4.0;
PV1fz = fract(R123f.x);
PV1fw = max(PV0fz, -(PV0fz));
R127f.x = PS0f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 2
R123f.x = PV1fy * intBitsToFloat(0x3e22f983) + 0.5;
PV0fy = PV1fw + 0.5;
R123f.z = R127f.w * intBitsToFloat(0x3e22f983) + 0.5;
R123f.w = PV1fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = PV1fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 3
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PV0fy);
R127f.y = R123f.w * intBitsToFloat(0x3e22f983);
PV1fz = backupReg0f * intBitsToFloat(0x3e22f983);
PV1fw = fract(R123f.x);
PS1f = fract(R123f.z);
// 4
R123f.x = PS1f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R126f.y = R127f.w * intBitsToFloat(0x3e22f983);
PV0fz = -(R127f.x) + 1.0;
R123f.w = PV1fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = sin((PV1fz)/0.1591549367);
// 5
backupReg0f = R127f.y;
PV1fx = R127f.x + intBitsToFloat(0xbe99999a);
PV1fx = clamp(PV1fx, 0.0, 1.0);
R127f.y = R123f.w * intBitsToFloat(0x3e22f983);
R127f.z = R123f.x * intBitsToFloat(0x3e22f983);
PV1fw = min(R127f.x, PV0fz);
PV1fw *= 2.0;
PV1fw = clamp(PV1fw, 0.0, 1.0);
PS1f = sin((backupReg0f)/0.1591549367);
// 6
backupReg0f = R126f.y;
R127f.x = PV1fx * intBitsToFloat(0x3d6a0fd3);
R126f.y = PV1fw * intBitsToFloat(0x3ca3d70a);
PV0fz = mul_nonIEEE(R127f.w, PS1f);
R127f.w = mul_nonIEEE(R5f.z, intBitsToFloat(uf_remappedVS[4].x));
PS0f = sin((backupReg0f)/0.1591549367);
// 7
PV1fw = mul_nonIEEE(PS0f, PV0fz);
PS1f = sin((R127f.y)/0.1591549367);
// 8
backupReg0f = R127f.z;
PV0fy = PV1fw * intBitsToFloat(0x3d4ccccd);
R127f.z = mul_nonIEEE(R127f.x, PS1f);
PS0f = sin((backupReg0f)/0.1591549367);
// 9
PV1fx = mul_nonIEEE(R3f.w, PV0fy);
PV1fy = mul_nonIEEE(R126f.y, PS0f);
// 10
PV0fx = R127f.z + PV1fy;
PV0fz = mul_nonIEEE(R5f.z, PV1fx);
// 11
R127f.x = PV0fx + R0f.z;
R126f.y = PV0fx + R4f.w;
PV1fz = R127f.w + PV0fz;
// 12
R126f.x = PV1fz * 20.0;
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), R127f.x);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), R126f.y);
PV0fw = -(R126f.y) + R127f.x;
// 13
PV1fx = -(R127f.z) + PV0fy;
R123f.z = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedVS[2].x)) + R126f.y;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), R126f.y);
// 14
R123f.x = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedVS[2].x)) + R127f.z;
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), R127f.x);
R127f.w = mul_nonIEEE(R123f.z, R126f.x);
// 15
PV1fx = mul_nonIEEE(R126f.x, R123f.x);
PV1fy = -(R126f.w) + PV0fz;
PV1fz = mul_nonIEEE(R127f.w, R127f.w);
// 16
PV0fx = PV1fx;
PV0fy = mul_nonIEEE(R127f.w, PV1fz);
R123f.w = mul_nonIEEE(PV1fy,intBitsToFloat(uf_remappedVS[2].x)) + R126f.w;
// 17
PV1fx = PV0fy * intBitsToFloat(0x3e23d70a);
PV1fy = mul_nonIEEE(R126f.x, R123f.w);
R6f.z = R6f.z + PV0fx;
// 18
PV0fx = PV1fy;
PV0fw = max(PV1fx, 0.0);
// 19
R0f.z = R7f.y + PV0fx;
R4f.w = -(PV0fw);
// 0
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R5f.w),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedVS[5].z));
// 1
R126f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[1].y)) + R6f.x;
R126f.y = PV0fx + R4f.w;
R127f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedVS[5].y)) + PS0f;
// 2
tempf.x = dot(vec4(R6f.z,R126f.y,R0f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 3
tempf.x = dot(vec4(R6f.z,R126f.y,R0f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.x = PV0fx;
// 4
tempf.x = dot(vec4(R6f.z,R126f.y,R0f.z,R6f.w),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R3f.y = PV1fx;
// 5
R126f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[1].x)) + R126f.x;
R126f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedVS[5].x)) + R127f.x;
R3f.z = PV0fx;
// 6
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w)));
PV0fx = tempf.x;
R0f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 7
R0f.x = dot(vec4(R3f.x,R3f.y,R3f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w)));
PV1fy = R0f.x;
PV1fz = R0f.x;
PV1fw = R0f.x;
R127f.x = -(PV0fx);
// 8
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R0f.z = tempf.x;
PV0fw = tempf.x;
// 9
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R0f.w = tempf.x;
R7f.z = PV0fx;
// 10
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R7f.x = R0f.x + PV1fx;
R7f.x /= 2.0;
// 11
tempf.x = dot(vec4(R126f.x,R126f.y,PV0fx,intBitsToFloat(0x80000000)),vec4(R126f.x,R126f.y,PV0fx,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R7f.y = R127f.x + R0f.w;
R7f.y /= 2.0;
// 12
R7f.w = R0f.w;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 13
R126f.x = mul_nonIEEE(R126f.x, PS0f);
R126f.y = mul_nonIEEE(R126f.y, PS0f);
R127f.z = mul_nonIEEE(R127f.z, PS0f);
// 14
tempf.x = dot(vec4(R126f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 15
tempf.x = dot(vec4(R126f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R2f.x = PV0fx;
// 16
tempf.x = dot(vec4(R126f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.y = PV1fx;
// 17
R2f.z = PV0fx;
// export
SET_POSITION(vec4(R0f.x, R0f.y, R0f.z, R0f.w));
// export
// skipped export to semanticId 255
// export
passParameterSem4 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
// export
passParameterSem6 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
