#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 94acfc140566b9c1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(7, 1, 0) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 1) uniform sampler2D textureUnitPS8;
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
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
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
R4f.xyz = (texture(textureUnitPS8, vec2(R0f.x,R0f.y)).xyz);
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
R3f.x = mul_nonIEEE(R2f.x, PS1f);
R7f.y = mul_nonIEEE(R2f.y, PS1f);
R5f.z = mul_nonIEEE(R2f.z, PS1f);
R0f.w = intBitsToFloat(uf_remappedPS[0].y);
PS0f = sqrt(PV1fx);
// 3
tempf.x = dot(vec4(R3f.x,R7f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = 1.0 / PS0f;
// 4
R2f.x = mul_nonIEEE(R1f.x, PS1f);
R3f.y = mul_nonIEEE(R1f.y, PS1f);
R0f.z = mul_nonIEEE(R1f.z, PS1f);
PV0fw = -(PV1fx) + 0.5;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R2f.y = intBitsToFloat(uf_remappedPS[2].y);
// 5
R123f.x = mul_nonIEEE(-(R1f.z),intBitsToFloat(uf_remappedPS[3].x)) + -(intBitsToFloat(uf_remappedPS[3].y));
R123f.x = clamp(R123f.x, 0.0, 1.0);
R5f.y = intBitsToFloat(uf_remappedPS[4].x);
R2f.z = intBitsToFloat(uf_remappedPS[4].y);
PV1fw = PV0fw + 6.5;
R6f.y = intBitsToFloat(uf_remappedPS[4].y);
// 6
R0f.x = PV1fw * intBitsToFloat(0x3daaaaab);
R1f.y = intBitsToFloat(uf_remappedPS[0].x);
R1f.z = -(R123f.x) + 1.0;
R2f.w = intBitsToFloat(uf_remappedPS[0].y);
R3f.z = intBitsToFloat(uf_remappedPS[0].z);
R8f.xyz = (texture(textureUnitPS7, vec2(R0f.x,R0f.y)).xyz);
// 0
tempf.x = dot(vec4(R3f.x,R7f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R3f.y,R0f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R0f.x = intBitsToFloat(uf_remappedPS[2].x);
// 1
R1f.x = intBitsToFloat(uf_remappedPS[2].z);
R0f.y = intBitsToFloat(uf_remappedPS[2].y);
PV1fz = PV0fx + 1.0;
PV1fz = clamp(PV1fz, 0.0, 1.0);
R3f.w = 0.0;
tempResultf = max(0.0, R1f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R1f.w = tempResultf;
// 2
tempf.x = dot(vec4(R0f.w,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R3f.y,R0f.z,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
tempResultf = max(0.0, PV1fz);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 3
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), PS0f);
R0f.z = intBitsToFloat(uf_remappedPS[4].z);
R9f.w = 1.0;
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R2f.y = tempResultf;
// 4
PS0f = exp2(PV1fy);
// 5
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z),PS0f) + R4f.z;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x),PS0f) + R4f.x;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y),PS0f) + R4f.y;
R123f.w = clamp(R123f.w, 0.0, 1.0);
// 6
backupReg0f = R123f.z;
R123f.y = R123f.y * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = R123f.w * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.z = clamp(R123f.z, 0.0, 1.0);
R123f.w = backupReg0f * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.w = clamp(R123f.w, 0.0, 1.0);
// 7
R4f.x = R123f.w * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R4f.z = R123f.y * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R0f.w = R123f.z * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
// 0
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z), R2f.y);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x), R1f.w);
// 1
R127f.x = dot(vec4(R1f.y,R2f.w,R3f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),0.0));
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
R127f.z = exp2(PV0fx);
// 2
backupReg0f = R127f.y;
tempf.x = dot(vec4(R0f.x,R0f.y,R1f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.x = exp2(backupReg0f);
// 3
tempf.x = dot(vec4(R5f.y,R6f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 4
tempf.x = dot(vec4(R3f.x,R7f.y,R5f.z,R5f.z),vec4(-(R127f.x),-(R127f.y),-(PV1fx),-(R3f.w)));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[7].w)),R127f.z) + 1.0;
// 5
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z),PV0fx) + R8f.z;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y),PV0fx) + R8f.y;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x),PV0fx) + R8f.x;
R123f.w = mul_nonIEEE(-(R126f.x),R122f.x) + R122f.x;
// 6
PV0fx = mul_nonIEEE(R123f.y, R0f.w);
PV0fy = mul_nonIEEE(R123f.z, R4f.x);
PV0fz = mul_nonIEEE(R123f.x, R4f.z);
R127f.w = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedPS[10].w));
// 7
R123f.x = mul_nonIEEE(-(R127f.w),PV0fx) + PV0fx;
R123f.y = mul_nonIEEE(-(R127f.w),PV0fy) + PV0fy;
R123f.w = mul_nonIEEE(-(R127f.w),PV0fz) + PV0fz;
// 8
R9f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x),R127f.w) + R123f.y;
R9f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y),R127f.w) + R123f.x;
R9f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),R127f.w) + R123f.w;
// export
passPixelColor0 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
