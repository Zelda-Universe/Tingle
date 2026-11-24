#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 9fb39f15a611f4ec
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[23];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
TEXTURE_LAYOUT(35, 0, 3) uniform sampler2D textureUnitVS3;
TEXTURE_LAYOUT(36, 0, 4) uniform sampler2D textureUnitVS4;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;

out vec4 passParameterSem1;
out vec4 passParameterSem2;
out vec4 passParameterSem4;
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
vec4 R12f = vec4(0.0);
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
attrDecoder.xy = attrDataSem0.xy;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.zw = uvec2(uvec2(0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem1.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
// 0
PV0fx = R1f.y + 0.5;
R0f.y = intBitsToFloat(uf_remappedVS[0].x);
R127f.z = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
PV0fw = R1f.x + 0.5;
R3f.y = intBitsToFloat(uf_remappedVS[0].x);
// 1
PV1fx = mul_nonIEEE(PV0fx, intBitsToFloat(uf_remappedVS[1].y));
PV1fy = mul_nonIEEE(PV0fx, intBitsToFloat(uf_remappedVS[2].y));
PV1fz = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedVS[2].x));
PV1fw = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedVS[1].x));
R7f.y = -(R2f.y) + 1.0;
// 2
R4f.x = intBitsToFloat(uf_remappedVS[2].w) + PV1fy;
R4f.y = intBitsToFloat(uf_remappedVS[1].w) + PV1fx;
R4f.z = intBitsToFloat(uf_remappedVS[1].z) + PV1fw;
R2f.w = intBitsToFloat(uf_remappedVS[2].z) + PV1fz;
R7f.w = 1.0;
// 3
R7f.x = R2f.w;
PV1fy = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[0].y));
R126f.z = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[0].z));
R4f.w = R4f.x;
R8f.w = 1.0;
// 4
R127f.x = R126f.z + PV1fy;
R127f.y = -(PV1fy) + R127f.z;
R125f.z = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[3].y));
R127f.w = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[3].z));
R8f.x = R2f.x;
// 5
PV1fx = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[4].x));
PV1fy = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[4].y));
PV1fz = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[5].y));
PV1fw = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[5].x));
R127f.z = -(R125f.z) + R127f.z;
// 6
R1f.x = intBitsToFloat(uf_remappedVS[5].z) + PV1fw;
R1f.y = intBitsToFloat(uf_remappedVS[5].w) + PV1fz;
R3f.z = intBitsToFloat(uf_remappedVS[4].z) + PV1fx;
R3f.w = intBitsToFloat(uf_remappedVS[4].w) + PV1fy;
PS0f = -(R126f.z) + R127f.y;
// 7
PV1fx = -(R127f.w) + R127f.z;
PV1fy = R127f.w + R125f.z;
R0f.z = PS0f * intBitsToFloat(0x3cb6a401);
PV1fw = R127f.x * intBitsToFloat(0x3cae4c41);
R0f.x = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[6].y));
// 8
R3f.x = PV1fx * intBitsToFloat(0x3cb6a401);
R5f.y = PV1fy * intBitsToFloat(0x3cae4c41);
R1f.z = fract(PV1fw);
R0f.w = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[6].x));
R1f.w = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[6].w));
R6f.xyzw = (texture(textureUnitVS2, vec2(R4f.z,R4f.y)).xyzw);
R10f.xyzw = (texture(textureUnitVS1, vec2(R1f.x,R1f.y)).xyzw);
R1f.xy = (texture(textureUnitVS0, vec2(R3f.z,R3f.w)).xy);
R5f.x = (texture(textureUnitVS4, vec2(R0f.z,R0f.y)).x);
R3f.y = (texture(textureUnitVS4, vec2(R3f.x,R3f.y)).x);
R9f.yzw = (texture(textureUnitVS3, vec2(R4f.z,R4f.y)).xyz);
// 0
R3f.x = R6f.z * 800.0;
PV0fy = R1f.z * intBitsToFloat(0x4196cbe2);
PV0fz = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[6].z));
PV0fw = fract(R5f.y);
R127f.x = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[7].y));
// 1
PV1fx = PV0fy + -(intBitsToFloat(uf_remappedVS[8].z));
R127f.y = R0f.x + R0f.w;
PV1fz = PV0fw * intBitsToFloat(0x4196cbe2);
R127f.w = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[7].x));
R126f.y = R1f.w + PV0fz;
// 2
PV0fx = PV1fx * intBitsToFloat(0x3fd55555);
PV0fy = -(intBitsToFloat(uf_remappedVS[8].z)) + PV1fz;
R123f.z = PV1fx * intBitsToFloat(0x3e22f983) + 0.5;
R126f.w = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedVS[7].w));
R127f.z = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[7].z));
// 3
PV1fx = PV0fy * intBitsToFloat(0x3fd55555);
PV1fy = fract(R123f.z);
R123f.z = PV0fy * intBitsToFloat(0x3e22f983) + 0.5;
R123f.w = PV0fx * intBitsToFloat(0x3e22f983) + 0.5;
R125f.z = R127f.x + R127f.w;
// 4
R127f.x = PV1fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fy = fract(R123f.z);
PV0fz = fract(R123f.w);
R123f.w = PV1fx * intBitsToFloat(0x3e22f983) + 0.5;
R125f.y = R126f.w + R127f.z;
// 5
R123f.x = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R123f.y = PV0fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fz = fract(R123f.w);
R0f.w = R7f.x + -(intBitsToFloat(uf_remappedVS[9].x));
R0f.y = R3f.x + -(intBitsToFloat(uf_remappedVS[9].y));
// 6
PV0fx = R123f.y * intBitsToFloat(0x3e22f983);
R123f.y = PV1fz * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R4f.z = R4f.w + -(intBitsToFloat(uf_remappedVS[9].z));
R126f.w = R127f.x * intBitsToFloat(0x3e22f983);
R125f.w = R123f.x * intBitsToFloat(0x3e22f983);
// 7
backupReg0f = R125f.z;
R127f.x = R123f.y * intBitsToFloat(0x3e22f983);
R127f.y = -(intBitsToFloat(uf_remappedVS[8].w)) + R127f.y;
R125f.z = -(intBitsToFloat(uf_remappedVS[8].w)) + R126f.y;
R124f.w = -(intBitsToFloat(uf_remappedVS[8].w)) + backupReg0f;
R127f.w = sin((PV0fx)/0.1591549367);
// 8
tempf.x = dot(vec4(R0f.w,R0f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(R0f.w,R0f.y,R4f.z,0.0));
PV0fx = tempf.x;
R126f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = sin((R126f.w)/0.1591549367);
// 9
backupReg0f = R125f.z;
PV1fx = -(intBitsToFloat(uf_remappedVS[8].w)) + R125f.y;
R125f.y = R127f.w + PS0f;
R125f.z = fract(R127f.y);
PV1fw = fract(backupReg0f);
R127f.w = sin((R127f.x)/0.1591549367);
// 10
R127f.x = fract(R124f.w);
R127f.y = R10f.x + intBitsToFloat(0xbeb33333);
R127f.y = clamp(R127f.y, 0.0, 1.0);
PV0fz = -(R125f.z) + PV1fw;
PV0fw = fract(PV1fx);
PS0f = sin((R125f.w)/0.1591549367);
// 11
R126f.x = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedVS[3].x)) + R125f.z;
PV1fy = R127f.w + PS0f;
PV1fz = -(R127f.x) + PV0fw;
PV1fw = R10f.w;
PV1fw /= 2.0;
R0f.x = sqrt(R126f.y);
// 12
PV0fx = -(R125f.y) + PV1fy;
R123f.y = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedVS[3].x)) + R127f.x;
PV0fz = R0f.x * intBitsToFloat(0x3dcccccd);
PV0fw = R127f.y + intBitsToFloat(0x3eb33333);
R125f.x = PV1fw + 0.5;
// 13
PV1fx = mul_nonIEEE(R10f.y, PV0fw);
PV1fy = PV0fz + -1.5;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R125f.z = mul_nonIEEE(R126f.x, R123f.y);
R123f.w = (mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedVS[3].x)) + R125f.y)/2.0;
PS1f = intBitsToFloat(uf_remappedVS[10].x) * 200.0;
// 14
PV0fx = max(PS1f, -(PS1f));
PV0fy = R3f.z * 10.0;
R1f.z = mul_nonIEEE(R125f.x, PV1fx);
PV0fw = mul_nonIEEE(R123f.w, PV1fy);
R127f.w = R1f.x;
R127f.w *= 2.0;
// 15
R1f.x = -(PV0fx) + 200.0;
R1f.x = clamp(R1f.x, 0.0, 1.0);
R125f.y = -(R1f.y);
R125f.y *= 2.0;
PV1fz = mul_nonIEEE(R125f.z, PV0fw);
R1f.w = mul_nonIEEE(R6f.w, R1f.z);
R126f.x = PV0fy + -5.0;
// 16
R127f.x = mul_nonIEEE(R0f.x, intBitsToFloat(uf_remappedVS[11].y));
PV0fy = mul_nonIEEE(R125f.z, PV1fz);
R125f.z = mul_nonIEEE(R0f.x, intBitsToFloat(uf_remappedVS[11].w));
R125f.w = R3f.w * 10.0;
R124f.w = R6f.x;
R124f.w *= 2.0;
// 17
PV1fx = mul_nonIEEE(R1f.w, PV0fy);
PV1fy = R6f.y;
PV1fy *= 2.0;
R127f.z = R127f.w + -(1.0);
R127f.w = R125f.y + 1.0;
R126f.w = max(R126f.x, -(R126f.x));
// 18
R127f.x = intBitsToFloat(uf_remappedVS[11].x) + -(R127f.x);
R127f.x = clamp(R127f.x, 0.0, 1.0);
R4f.y = R124f.w + -(1.0);
R126f.z = R125f.w + -5.0;
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), PV1fx);
R4f.x = PV1fy + -(1.0);
// 19
PV1fx = -(intBitsToFloat(uf_remappedVS[11].z)) + R125f.z;
PV1fx = clamp(PV1fx, 0.0, 1.0);
R5f.y = mul_nonIEEE(R5f.x, intBitsToFloat(uf_remappedVS[12].z));
PV1fz = PV0fw * 1.25;
PV1fz = clamp(PV1fz, 0.0, 1.0);
R2f.w = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedVS[12].z));
R3f.w = mul_nonIEEE(R125f.x, R127f.z);
// 20
R5f.x = -(R126f.w) + 5.0;
R5f.x = clamp(R5f.x, 0.0, 1.0);
R3f.y = PV1fz * intBitsToFloat(0x3f4ccccd);
R3f.z = mul_nonIEEE(R125f.x, R127f.w);
R5f.w = mul_nonIEEE(R127f.x, PV1fx);
R1f.y = max(R126f.z, -(R126f.z));
// 0
PV0fx = mul_nonIEEE(R6f.w, intBitsToFloat(uf_remappedVS[13].y));
R3f.y = mul_nonIEEE(R3f.y, R1f.x);
PV0fz = mul_nonIEEE(R4f.x, R4f.x);
PV0fw = mul_nonIEEE(R4f.y, R4f.y);
R125f.y = mul_nonIEEE(R3f.w, R5f.x);
// 1
PV1fx = mul_nonIEEE(R3f.z, R5f.x);
PV1fy = -(R1f.y) + 5.0;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R126f.z = mul_nonIEEE(R5f.w, PV0fx);
PV1fw = R3f.y * intBitsToFloat(0x3e19999a);
R127f.w = PV0fz + PV0fw;
R127f.w = clamp(R127f.w, 0.0, 1.0);
// 2
R127f.x = mul_nonIEEE(R125f.y, PV1fy);
PV0fy = PV1fw + R5f.y;
R127f.z = mul_nonIEEE(PV1fx, PV1fy);
PV0fw = PV1fw + R2f.w;
PS0f = mul_nonIEEE(R1f.z, R126f.z);
// 3
PV1fx = mul_nonIEEE(PV0fy, intBitsToFloat(uf_remappedVS[14].y));
PV1fy = mul_nonIEEE(PV0fy, intBitsToFloat(uf_remappedVS[14].x));
PV1fz = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedVS[14].z));
PV1fw = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedVS[14].w));
R125f.w = mul_nonIEEE(R7f.y, PS0f);
// 4
PV0fx = PV1fz + PV1fy;
PV0fy = PV1fw + PV1fx;
PV0fz = -(R127f.w) + 1.0;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), -(R126f.z));
R126f.w = R4f.y;
// 5
PV1fx = R127f.x + PV0fx;
R125f.y = R4f.x;
R127f.z = R127f.z + PV0fy;
PV1fw = mul_nonIEEE(R127f.w, R125f.w);
PV1fw *= 2.0;
R126f.x = sqrt(PV0fz);
// 6
R127f.x = mul_nonIEEE(PV1fx,-(R2f.y)) + PV1fx;
R127f.y = R126f.x + PV1fw;
PV0fz = mul_nonIEEE(PV1fx, R125f.w);
PV0fz *= 2.0;
PV0fw = mul_nonIEEE(R127f.z, R125f.w);
PV0fw *= 2.0;
PS0f = 1.0 / R0f.x;
// 7
R125f.x = R126f.w + PV0fz;
R124f.y = mul_nonIEEE(-(R0f.w),PS0f) + -(intBitsToFloat(uf_remappedVS[10].x));
R126f.z = R125f.y + PV0fw;
R124f.w = mul_nonIEEE(-(R0f.y),PS0f) + -(intBitsToFloat(uf_remappedVS[10].y));
R125f.z = mul_nonIEEE(-(R4f.z),PS0f) + -(intBitsToFloat(uf_remappedVS[10].z));
// 8
tempf.x = dot(vec4(R125f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R127f.y,R126f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.w,-(R2f.y)) + R127f.w;
// 9
R123f.x = mul_nonIEEE(R127f.z,-(R2f.y)) + R127f.z;
R126f.y = R3f.y * intBitsToFloat(0x3dcccccd);
R127f.z = R126f.x + R122f.x;
R126f.w = R126f.w + R127f.x;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 10
PV0fx = intBitsToFloat(uf_remappedVS[10].x) + -(R126f.w);
R125f.y = R125f.y + R123f.x;
R3f.z = R10f.z * 4.0 + -(1.0);
R3f.z = clamp(R3f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R125f.w, PS1f);
PS0f = intBitsToFloat(uf_remappedVS[10].y) + -(R127f.z);
// 11
PV1fx = mul_nonIEEE(R127f.y, PV0fw);
PV1fy = mul_nonIEEE(R125f.x, PV0fw);
R1f.z = mul_nonIEEE(PV0fx,R126f.y) + R126f.w;
PV1fw = mul_nonIEEE(R126f.z, PV0fw);
R0f.x = mul_nonIEEE(PS0f,R126f.y) + R127f.z;
// 12
backupReg0f = R3f.x;
R3f.x = R7f.x + PV1fy;
R0f.y = backupReg0f + PV1fx;
R4f.z = R4f.w + PV1fw;
PV0fw = intBitsToFloat(uf_remappedVS[10].z) + -(R125f.y);
R127f.z = R126f.x * 1000.0 + -600.0;
// 13
tempf.x = dot(vec4(R124f.y,R124f.w,R125f.z,intBitsToFloat(0x80000000)),vec4(R124f.y,R124f.w,R125f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R4f.w = mul_nonIEEE(PV0fw,R126f.y) + R125f.y;
// 14
R7f.x = -(R10f.w) * intBitsToFloat(0xbda1cac1) + intBitsToFloat(0xbda1cac1);
R4f.y = -(R10f.w) * intBitsToFloat(0x3cbc6a7f) + intBitsToFloat(0x3cbc6a7f);
PV0fz = mul_nonIEEE(R1f.w, R5f.w);
R5f.w = -(R10f.w) * intBitsToFloat(0x3cac0831) + intBitsToFloat(0x3cac0831);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 15
R2f.x = mul_nonIEEE(R124f.y, PS0f);
R8f.y = mul_nonIEEE(R2f.y, PV0fz);
R6f.z = mul_nonIEEE(R125f.z, PS0f);
R1f.w = mul_nonIEEE(R124f.w, PS0f);
R11f.w = min(R127f.z, 1.0);
// 16
R12f.w = R3f.y;
// export
passParameterSem1 = vec4(R8f.x, R8f.y, R8f.z, R8f.z);
// 0
R8f.x = dot(vec4(R3f.x,R0f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w)));
PV0fy = R8f.x;
PV0fz = R8f.x;
PV0fw = R8f.x;
R127f.z = mul_nonIEEE(R2f.x, intBitsToFloat(uf_remappedVS[15].x));
// 1
tempf.x = dot(vec4(R3f.x,R0f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w)));
PV1fx = tempf.x;
R8f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R125f.x = mul_nonIEEE(R2f.x, intBitsToFloat(uf_remappedVS[16].x));
// 2
tempf.x = dot(vec4(R3f.x,R0f.y,R4f.z,R7f.w),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R8f.z = tempf.x;
PV0fw = tempf.x;
R125f.z = mul_nonIEEE(R2f.x, intBitsToFloat(uf_remappedVS[17].x));
// 3
R2f.x = dot(vec4(R8f.x,R8f.y,PV0fx,R8f.w),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w)));
PV1fy = R2f.x;
PV1fz = R2f.x;
PV1fw = R2f.x;
// 4
tempf.x = dot(vec4(R8f.x,R8f.y,R8f.z,R8f.w),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w)));
PV0fx = tempf.x;
R2f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 5
tempf.x = dot(vec4(R8f.x,R8f.y,R8f.z,R8f.w),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R2f.z = tempf.x;
PV1fw = tempf.x;
// 6
tempf.x = dot(vec4(R8f.x,R8f.y,R8f.z,R8f.w),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R2f.w = tempf.x;
// 7
R126f.x = mul_nonIEEE(R3f.z,-(intBitsToFloat(uf_remappedVS[22].x))) + R3f.z;
R123f.y = -(intBitsToFloat(uf_remappedVS[22].x)) * intBitsToFloat(0x3d009d49) + intBitsToFloat(0x3d009d49);
R123f.z = -(intBitsToFloat(uf_remappedVS[22].x)) * intBitsToFloat(0x3e50e560) + intBitsToFloat(0x3e50e560);
R123f.w = -(intBitsToFloat(uf_remappedVS[22].x)) * intBitsToFloat(0x3dc0b780) + intBitsToFloat(0x3dc0b780);
R127f.x = mul_nonIEEE(R1f.z, intBitsToFloat(uf_remappedVS[15].x));
// 8
R124f.x = mul_nonIEEE(R1f.z, intBitsToFloat(uf_remappedVS[17].x));
R124f.y = R9f.y + -(R123f.w);
R124f.z = mul_nonIEEE(R1f.z, intBitsToFloat(uf_remappedVS[16].x));
R124f.w = R9f.z + -(R123f.z);
R126f.z = R9f.w + -(R123f.y);
// 9
backupReg0f = R126f.x;
backupReg1f = R127f.z;
R126f.x = backupReg0f * intBitsToFloat(0x3e19999a);
PV1fy = backupReg0f * intBitsToFloat(0x3db851ec);
R127f.z = backupReg0f * intBitsToFloat(0x3d23d70a);
R126f.w = mul_nonIEEE(R1f.w,intBitsToFloat(uf_remappedVS[15].y)) + backupReg1f;
R125f.w = mul_nonIEEE(R1f.w,intBitsToFloat(uf_remappedVS[16].y)) + R125f.x;
// 10
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R0f.x,intBitsToFloat(uf_remappedVS[17].y)) + R124f.x;
R126f.y = mul_nonIEEE(R1f.w,intBitsToFloat(uf_remappedVS[17].y)) + R125f.z;
R1f.z = mul_nonIEEE(R3f.z, R126f.z);
R123f.w = mul_nonIEEE(R0f.x,intBitsToFloat(uf_remappedVS[15].y)) + backupReg0f;
R11f.x = mul_nonIEEE(R10f.w,PV1fy) + R5f.w;
// 11
R1f.x = mul_nonIEEE(R3f.z, R124f.y);
R124f.y = mul_nonIEEE(R0f.x,intBitsToFloat(uf_remappedVS[16].y)) + R124f.z;
R11f.z = mul_nonIEEE(R10f.w,R127f.z) + R7f.x;
R0f.w = mul_nonIEEE(R4f.w,intBitsToFloat(uf_remappedVS[15].z)) + R123f.w;
R11f.y = mul_nonIEEE(R10f.w,R126f.x) + R4f.y;
// 12
R12f.x = mul_nonIEEE(R6f.z,intBitsToFloat(uf_remappedVS[15].z)) + R126f.w;
R1f.y = mul_nonIEEE(R3f.z, R124f.w);
R12f.y = mul_nonIEEE(R6f.z,intBitsToFloat(uf_remappedVS[16].z)) + R125f.w;
// 13
R0f.x = mul_nonIEEE(R4f.w,intBitsToFloat(uf_remappedVS[17].z)) + R127f.x;
R0f.y = mul_nonIEEE(R4f.w,intBitsToFloat(uf_remappedVS[16].z)) + R124f.y;
R12f.z = mul_nonIEEE(R6f.z,intBitsToFloat(uf_remappedVS[17].z)) + R126f.y;
// export
SET_POSITION(vec4(R2f.x, R2f.y, R2f.z, R2f.w));
// export
passParameterSem2 = vec4(R11f.x, R11f.y, R11f.z, R11f.w);
// export
passParameterSem4 = vec4(R12f.x, R12f.y, R12f.z, R12f.w);
// export
passParameterSem0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
passParameterSem3 = vec4(R0f.w, R0f.y, R0f.x, R0f.w);
// export
// skipped export to semanticId 255
}
