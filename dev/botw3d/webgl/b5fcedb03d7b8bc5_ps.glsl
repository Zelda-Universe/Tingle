#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader b5fcedb03d7b8bc5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(7, 1, 0) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 1) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(10, 1, 2) uniform sampler2D textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem3;
layout(location = 0) out vec4 passPixelColor0;
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
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R124f = vec4(0.0);
vec4 R125f = vec4(0.0);
vec4 R126f = vec4(0.0);
vec4 R127f = vec4(0.0);
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem0;
R1f = passParameterSem5;
R2f = passParameterSem3;
R10f.xyzw = (texture(textureUnitPS8, vec2(R0f.x,R0f.y)).xyzw);
R9f.xyz = (texture(textureUnitPS10, vec2(R0f.x,R0f.y)).xyz);
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R0f.y = 0.0;
// 1
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
R4f.x = mul_nonIEEE(R2f.x, PS1f);
R7f.y = mul_nonIEEE(R2f.y, PS1f);
R3f.z = mul_nonIEEE(R2f.z, PS1f);
R0f.w = intBitsToFloat(uf_remappedPS[0].y);
PS0f = sqrt(PV1fx);
// 3
tempf.x = dot(vec4(R4f.x,R7f.y,R3f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.w = 1.0 / PS0f;
// 4
R2f.x = mul_nonIEEE(R1f.x, R127f.w);
R2f.y = intBitsToFloat(uf_remappedPS[2].y);
R2f.z = intBitsToFloat(uf_remappedPS[3].y);
PV0fw = -(PV1fx) + 0.5;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R4f.y = mul_nonIEEE(R1f.y, R127f.w);
// 5
R3f.x = mul_nonIEEE(R1f.z, R127f.w);
R123f.y = mul_nonIEEE(-(R1f.z),intBitsToFloat(uf_remappedPS[4].x)) + -(intBitsToFloat(uf_remappedPS[4].y));
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV1fz = PV0fw + 6.5;
R1f.w = intBitsToFloat(uf_remappedPS[0].x);
R5f.y = intBitsToFloat(uf_remappedPS[0].y);
// 6
R0f.x = PV1fz * intBitsToFloat(0x3daaaaab);
R3f.y = -(R123f.y) + 1.0;
R0f.z = intBitsToFloat(uf_remappedPS[0].z);
R2f.w = intBitsToFloat(uf_remappedPS[2].x);
R6f.y = intBitsToFloat(uf_remappedPS[2].y);
R8f.xyz = (texture(textureUnitPS7, vec2(R0f.x,R0f.y)).xyz);
// 0
tempf.x = dot(vec4(R0f.w,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R4f.y,R3f.x,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
tempResultf = max(0.0, R3f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127f.x = tempResultf;
// 1
tempf.x = dot(vec4(R4f.x,R7f.y,R3f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R4f.y,R3f.x,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 2
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), PS1f);
R127f.y = intBitsToFloat(uf_remappedPS[2].z);
PV0fz = PV1fx + 1.0;
PV0fz = clamp(PV0fz, 0.0, 1.0);
R127f.w = 0.0;
R125f.x = R10f.x * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R125f.x = clamp(R125f.x, 0.0, 1.0);
// 3
R126f.x = intBitsToFloat(uf_remappedPS[3].x);
R125f.y = intBitsToFloat(uf_remappedPS[3].y);
R127f.z = intBitsToFloat(uf_remappedPS[3].z);
PV1fw = -(PV0fz) + 1.0;
PS1f = exp2(PV0fx);
// 4
R2f.x = R10f.y * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R2f.x = clamp(R2f.x, 0.0, 1.0);
R126f.y = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[5].w)),PS1f) + 1.0;
R126f.z = R10f.z * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R126f.z = clamp(R126f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), R127f.x);
tempResultf = max(0.0, PV1fw);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R3f.x = tempResultf;
// 5
R127f.x = dot(vec4(R1f.w,R5f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
PS1f = exp2(PV0fw);
// 6
backupReg0f = R127f.y;
tempf.x = dot(vec4(R2f.w,R6f.y,backupReg0f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R124f.x = mul_nonIEEE(-(PS1f),R126f.y) + R126f.y;
// 7
tempf.x = dot(vec4(R126f.x,R125f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R125f.y = R125f.x * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
// 8
tempf.x = dot(vec4(R4f.x,R7f.y,R3f.z,R3f.z),vec4(-(R127f.x),-(R127f.y),-(PV1fx),-(R127f.w)));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.w = mul_nonIEEE(R124f.x, intBitsToFloat(uf_remappedPS[7].w));
// 9
R123f.x = R2f.x * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z),PV0fx) + R8f.z;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y),PV0fx) + R8f.y;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x),PV0fx) + R8f.x;
R122f.x = R126f.z * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
// 10
PV0fx = mul_nonIEEE(R123f.y, R122f.x);
PV0fy = mul_nonIEEE(R123f.z, R123f.x);
PV0fz = mul_nonIEEE(R123f.w, R125f.y);
R2f.w = -(R1f.z) * intBitsToFloat(0x3e4ccccd) + -2.0;
R2f.w = clamp(R2f.w, 0.0, 1.0);
PS0f = -(R127f.w) + 1.0;
// 11
R123f.x = mul_nonIEEE(-(R127f.w),PV0fx) + PV0fx;
R123f.y = mul_nonIEEE(-(R127f.w),PV0fy) + PV0fy;
R123f.z = mul_nonIEEE(-(R127f.w),PV0fz) + PV0fz;
R1f.w = mul_nonIEEE(-(R127f.w),PS0f) + PS0f;
// 12
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z),R127f.w) + R123f.x;
R1f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y),R127f.w) + R123f.y;
R0f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x),R127f.w) + R123f.z;
// 0
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x), R9f.x);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y), R9f.y);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z), R3f.x);
// 1
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x), PV0fy);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x), PV0fx);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z), R9f.z);
PS1f = exp2(PV0fw);
PS1f = clamp(PS1f, 0.0, 1.0);
// 2
PV0fy = intBitsToFloat(uf_remappedPS[10].w) + PS1f;
PV0fy = clamp(PV0fy, 0.0, 1.0);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x), PV1fz);
// 3
PV1fx = mul_nonIEEE(PV0fy, R2f.w);
// 4
PV0fw = mul_nonIEEE(PV1fx, R1f.w);
// 5
R10f.x = mul_nonIEEE(PV0fw,R125f.y) + R0f.w;
R10f.y = mul_nonIEEE(PV0fw,R127f.x) + R1f.z;
R10f.z = mul_nonIEEE(PV0fw,R127f.w) + R1f.y;
// export
if( ((vec4(R10f.x, R10f.y, R10f.z, R10f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
}
