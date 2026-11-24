#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f0b464e797d48ab1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[10];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(7, 1, 0) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(11, 1, 1) uniform sampler2DArray textureUnitPS11;
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
vec4 R123f = vec4(0.0);
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
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = intBitsToFloat(uf_remappedPS[0].z);
// 1
R4f.x = intBitsToFloat(uf_remappedPS[1].y);
R3f.y = 0.0;
R0f.z = roundEven(PS0f);
R0f.w = intBitsToFloat(uf_remappedPS[2].y);
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
R5f.x = mul_nonIEEE(R2f.x, PS1f);
R6f.y = mul_nonIEEE(R2f.y, PS1f);
R7f.z = mul_nonIEEE(R2f.z, PS1f);
R1f.w = intBitsToFloat(uf_remappedPS[3].y);
R2f.x = intBitsToFloat(uf_remappedPS[1].x);
// 3
tempf.x = dot(vec4(R5f.x,R6f.y,R7f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.w = 0.0;
// 4
PV0fx = mul_nonIEEE(R1f.z, R1f.z);
R4f.y = intBitsToFloat(uf_remappedPS[1].y);
R2f.z = intBitsToFloat(uf_remappedPS[1].z);
PV0fw = -(PV1fx) + 0.5;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R9f.w = 1.0;
// 5
R123f.x = mul_nonIEEE(R1f.y,R1f.y) + PV0fx;
R5f.y = intBitsToFloat(uf_remappedPS[2].x);
R3f.z = intBitsToFloat(uf_remappedPS[2].y);
PV1fw = PV0fw + 6.5;
R4f.z = intBitsToFloat(uf_remappedPS[2].z);
// 6
R3f.x = PV1fw * intBitsToFloat(0x3daaaaab);
R2f.y = mul_nonIEEE(R1f.x,R1f.x) + R123f.x;
R5f.z = intBitsToFloat(uf_remappedPS[3].x);
R2f.w = intBitsToFloat(uf_remappedPS[3].y);
R6f.z = intBitsToFloat(uf_remappedPS[3].z);
R0f.xyz = (texture(textureUnitPS11, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R8f.xyz = (texture(textureUnitPS7, vec2(R3f.x,R3f.y)).xyz);
// 0
R123f.x = mul_nonIEEE(-(R1f.z),intBitsToFloat(uf_remappedPS[5].x)) + -(intBitsToFloat(uf_remappedPS[5].y));
R123f.x = clamp(R123f.x, 0.0, 1.0);
R123f.y = R0f.z * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = R0f.y * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.z = clamp(R123f.z, 0.0, 1.0);
R123f.w = R0f.x * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.w = clamp(R123f.w, 0.0, 1.0);
PS0f = sqrt(R2f.y);
// 1
R126f.x = R123f.w * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R125f.y = R123f.y * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
PV1fz = -(R123f.x) + 1.0;
R126f.w = R123f.z * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
PS1f = 1.0 / PS0f;
// 2
PV0fx = mul_nonIEEE(R1f.x, PS1f);
PV0fy = mul_nonIEEE(R1f.y, PS1f);
PV0fz = mul_nonIEEE(R1f.z, PS1f);
PV0fw = mul_nonIEEE(R2f.z, intBitsToFloat(uf_remappedPS[6].z));
tempResultf = max(0.0, PV1fz);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127f.w = tempResultf;
// 3
tempf.x = dot(vec4(R4f.x,R0f.w,R1f.w,intBitsToFloat(0x80000000)),vec4(PV0fx,PV0fy,PV0fz,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedPS[6].y)) + PV0fw;
// 4
tempf.x = dot(vec4(R5f.y,R3f.z,R4f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV0fx = tempf.x;
R126f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
tempResultf = max(0.0, PV1fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 5
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z), PS0f);
R127f.y = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedPS[6].x)) + R127f.x;
PS1f = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedPS[6].y));
// 6
tempf.x = dot(vec4(R5f.z,R6f.z,PS1f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].z),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
PS0f = exp2(PV1fx);
// 7
PV1fx = mul_nonIEEE(R7f.z, -(R3f.w));
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x), R127f.w);
R126f.z = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[7].w)),PS0f) + 1.0;
// 8
tempf.x = dot(vec4(R5f.x,R6f.y,R7f.z,PV1fx),vec4(-(R127f.y),-(R126f.y),-(R127f.z),1.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = exp2(PV1fy);
// 9
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z),PV0fx) + R8f.z;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y),PV0fx) + R8f.y;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x),PV0fx) + R8f.x;
R123f.w = mul_nonIEEE(-(PS0f),R126f.z) + R126f.z;
// 10
PV0fx = mul_nonIEEE(R123f.y, R126f.w);
PV0fy = mul_nonIEEE(R123f.z, R126f.x);
PV0fz = mul_nonIEEE(R123f.x, R125f.y);
R126f.w = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedPS[9].w));
// 11
R123f.x = mul_nonIEEE(-(R126f.w),PV0fx) + PV0fx;
R123f.y = mul_nonIEEE(-(R126f.w),PV0fy) + PV0fy;
R123f.w = mul_nonIEEE(-(R126f.w),PV0fz) + PV0fz;
// 12
R9f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x),R126f.w) + R123f.y;
R9f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y),R126f.w) + R123f.x;
R9f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z),R126f.w) + R123f.w;
// export
passPixelColor0 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
